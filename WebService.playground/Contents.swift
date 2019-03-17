import APP_Core
import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let disposeBag = DisposeBag()
let navController = UINavigationController(rootViewController: UIViewController())

let assembly = CoreAssembly(navigationController: navController)
let webService = assembly.webServiceAssembly.webService

//    "https://image.tmdb.org/t/p/"
let url = URL(string: "https://api.themoviedb.org/3")!
let endpoint = Endpoint.configuration
let urlRequest = endpoint.request(with: url, parameters: [:])
print(urlRequest)
print(urlRequest.httpMethod)

// Load configuration

webService.loadGenericFromApi(type: ImageConfiguration.self, endpoint: .configuration)
    .subscribe(onNext: { print($0.images.baseURL) })
    .disposed(by: disposeBag)

webService.loadGenericFromApi(type: Page<Show>.self, endpoint: .sho)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

