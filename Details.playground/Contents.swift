//import APP_Core
//import PlaygroundSupport
//
//PlaygroundPage.current.needsIndefiniteExecution = true
//
//final class FakeDetailPresenter : DetailPresenterProtocol {
//    
//    var view: DetailViewProtocol?
//    
//    
//    func didLoad() {
//        let sections: [DetailSection] = []
//    }
//    
//    func didSelect(item: PosterStripItem) {
//        print("selected: \(item)")
//    }
//    
//}
//
//let coreAssembly = CoreAssembly(navigationController: UINavigationController())
//let detailPresenter = FakeDetailPresenter()
//let headerPresenter = coreAssembly.detailsAssembly.detailHeaderPresenter()
//let posterStripPresenter = coreAssembly.detailsAssembly.posterStripPresenter()
//
//let detailViewController = DetailViewController(detailPresenter: detailPresenter, detailHeaderPresenter: headerPresenter, posterStripPresenter: posterStripPresenter)
//
//detailViewController.title = "Game of Thrones"
//let navigatorController = UINavigationController(rootViewController: detailViewController)
//navigatorController.view.frame = CGRect(x: 0, y: 0, width: 375, height: 667)
//
//PlaygroundPage.current.liveView = navigatorController
//
