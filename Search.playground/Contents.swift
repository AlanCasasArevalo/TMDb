//: Playground - noun: a place where people can play

import APP_Core
import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let coreAssembly = CoreAssembly(navigationController: UINavigationController())

let resultsVC = coreAssembly.searchAssembly.searchResultsViewController()

resultsVC.view.frame = CGRect(x: 0, y: 0, width: 475, height: 667)

PlaygroundPage.current.liveView = resultsVC








