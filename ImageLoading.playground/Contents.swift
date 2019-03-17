//import APP_Core
//import Kingfisher
//
//import RxSwift
//import PlaygroundSupport
//
//PlaygroundPage.current.needsIndefiniteExecution = true
//
//let disposeBag = DisposeBag()
//let coreAssembly = CoreAssembly(navigationController: UINavigationController())
//
//let imageRepository = coreAssembly.imageLoadingAssembly.imageRepository
//
//imageRepository.imageFromApi(path: "ncEmkHADNggjR0dlerOIHqmiY0O.jpg", size: .w300)
//    .subscribe(onNext: {
//        let image = $0
//        print(image)
//    })
//    .disposed(by: disposeBag)
