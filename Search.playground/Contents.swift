//: Playground - noun: a place where people can play

import APP_Core
import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let navController = UINavigationController(rootViewController: UIViewController())

let coreAssembly = CoreAssembly(navigationController: navController)

let resultsVC = coreAssembly.searchAssembly.searchResultsViewController()

resultsVC.view.frame = CGRect(x: 0, y: 0, width: 668, height: 1024)


PlaygroundPage.current.liveView = navController








