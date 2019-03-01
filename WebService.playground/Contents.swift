//: Playground - noun: a place where people can play

import APP_Core
import RxSwift

import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let disposeBag = DisposeBag()

let navController = UINavigationController(rootViewController: UIViewController())

let coreAssembly = CoreAssembly(navigationController: navController)

let webService = coreAssembly.webServiceAssembly.webService



