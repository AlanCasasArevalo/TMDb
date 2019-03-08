//: Playground - noun: a place where people can play


import APP_Core
import RxSwift

import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let disposeBag = DisposeBag()

let navController = UINavigationController(rootViewController: UIViewController())

let coreAssembly = CoreAssembly(navigationController: navController)
let imageRepository = coreAssembly.imageLoadingAssembly.imageRepository

imageRepository.imageFromApi(path: "sAzw6I1G9JUxm86KokIDdQeWtaq.jpg", size: .w500)
    .subscribe(onNext: { image in
        let imageResponse = image
        print(imageResponse)
    }, onError: { error in
        print(error)
    })
    .disposed(by: disposeBag)


PlaygroundPage.current.liveView = navController
