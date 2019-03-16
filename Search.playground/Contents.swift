import APP_Core
import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let coreAssembly = CoreAssembly(navigationController: UINavigationController())
let resultsViewController = coreAssembly.searchAssembly.searchResultsViewController()
resultsViewController.view.frame = CGRect(x: 0, y: 0, width: 375, height: 667)

PlaygroundPage.current.liveView = resultsViewController
