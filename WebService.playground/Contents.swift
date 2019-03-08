//: Playground - noun: a place where people can play

import APP_Core
import RxSwift

import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let disposeBag = DisposeBag()

let navController = UINavigationController(rootViewController: UIViewController())

let coreAssembly = CoreAssembly(navigationController: navController)

let webService = coreAssembly.webServiceAssembly.webService

webService.loadGenericFromApi(type: ImageConfiguration.self, endpoint: .configuration)
    .subscribe(onNext: { image in
        let image = image.images.baseURL
        print(image)
    }, onError: { error in
        print(error.localizedDescription)
    }, onCompleted: {
        print("Completed")
    })


PlaygroundPage.current.liveView = navController
