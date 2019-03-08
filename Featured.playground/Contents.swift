//: Playground - noun: a place where people can play


import PlaygroundSupport
import APP_Core
    
PlaygroundPage.current.needsIndefiniteExecution = true


let navController = UINavigationController(rootViewController: UIViewController())

let movie = Movie(identifier: 330459,
                  title: "Rogue One: A Star Wars Story",
                  posterPath: "/qjiskwlV1qQzRCjpV0cL9pEMF9a.jpg",
                  backdropPath: "/tZjVVIYXACV4IIIhXeIM59ytqwS.jpg",
                  releaseDate: Date(timeIntervalSince1970: 1474905532),
                  genreIdentifiers: [28, 12, 878])

let coreAssembly = CoreAssembly(navigationController: navController)
let featureVC = coreAssembly.featureAssembly.viewController()

featureVC.view.frame = CGRect(x: 0, y: 0, width: 375, height: 667)


PlaygroundPage.current.liveView = navController
