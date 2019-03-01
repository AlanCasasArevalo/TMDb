//
//  WebService.swift
//  APP Core
//
//  Created by Alan Casas on 01/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import RxSwift

public enum WebServiceError: Error {
    case badStatus(Int, Data)
    case api(Int, String)
}

public struct Status: Decodable {
    let code: Int
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case code = "status_code"
        case message = "status_message"
    }
}

final public class WebService {
    
    public let configuration: WebServiceConfiguration
    public let session = URLSession(configuration: .default)
    public let baseURL = URL(string: CONSTANTS.CALLS.BASE_URL)!
    public let decoder = JSONDecoder()
    
    public init(configuration: WebServiceConfiguration = .default){
        self.configuration = configuration
    }

    public func loadGenericFromApi <Generic: Decodable> (type: Generic.Type, endpoint: Endpoint) -> Observable<Generic> {
        let decoder = self.decoder
        let request = endpoint.request(with: baseURL, parameters: configuration.parameters)
        
        return session.rx.dataFromApiObservable(request: request)
            .map{
                try decoder.decode(Generic.self, from: $0)
            }
            .catchError{ error in
                guard let webServiceError = error as? WebServiceError else { throw error }
                guard case let .badStatus(_, data) = webServiceError else { throw error }
                guard let status = try? decoder.decode(Status.self, from: data) else { throw error }
                throw WebServiceError.api(status.code, status.message)
            }        
    }
}

public extension Reactive where Base: URLSession {
    func dataFromApiObservable(request: URLRequest) -> Observable<Data> {
            
        return Observable.create { observer in
            let task = self.base.dataTask(with: request) { data, response, error in
                if let error = error {
                    observer.onError(error)
                }else {
                    guard let httpResponse = response as? HTTPURLResponse else { fatalError("Unsoported protocol") }
                    if 200 ..< 300 ~= httpResponse.statusCode {
                        if let data = data {
                            observer.onNext(data)
                        }
                        observer.onCompleted()
                    } else {
                        observer.onError(WebServiceError.badStatus(httpResponse.statusCode, data ?? Data()))
                    }
                }
            }
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
}


















