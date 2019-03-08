//: Playground - noun: a place where people can play

import PlaygroundSupport
import APP_Core
import RxSwift

PlaygroundPage.current.needsIndefiniteExecution = true

let navController = UINavigationController(rootViewController: UIViewController())
let coreAssembly = CoreAssembly(navigationController: navController)












PlaygroundPage.current.liveView = navController
