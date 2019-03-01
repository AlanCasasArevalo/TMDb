//: Playground - noun: a place where people can play


import APP_Core
import RxSwift

import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let disposeBag = DisposeBag()

let coreAssembly = CoreAssembly(navigationController: UINavigationController())
let imageRepository = coreAssembly.imageLoadingAssembly.imageRepository

imageRepository.imageFromApi(path: "7ad4iku8cYBuB08g9yAU7tHJik5.jpg", size: .w500)
    .subscribe(onNext: { image in
        let imageResponse = image
        print(imageResponse)
    }, onError: { error in
        print(error)
    })
    .disposed(by: disposeBag)

