import APP_Core
import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let disposeBag = DisposeBag()
let navController = UINavigationController(rootViewController: UIViewController())

let assembly = CoreAssembly(navigationController: navController)
let webService = assembly.webServiceAssembly.webService

// Load configuration

webService.loadGenericFromApi(type: ImageConfiguration.self, endpoint: .configuration)
    .subscribe(onNext: { print($0.images.baseURL) })
    .disposed(by: disposeBag)
