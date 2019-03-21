@testable import APP_Core
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

final class FakeDetailPresenter : DetailPresenterProtocol {
    
    var view: DetailViewProtocol?
    
    
    func didLoad() {
        let sections: [DetailSection] = [
            .header(DetailHeader(title: "Game of Thrones",
                                 metadata: "2011 ⋅ In production ⋅ HBO",
                                 posterPath: "/gwPSoYUHAKmdyVywgLpKKA4BjRr.jpg",
                                 backdropPath: "/gX8SYlnL9ZznfZwEH4KJUePBFUM.jpg")),
            .about(title: "Overview", detail: "Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night's Watch, is all that stands between the realms of men and icy horrors beyond."),
            .posterStrip(title: "Cast", items: [
                PosterStripItem(identifier: 1223786,
                                mediaType: .person,
                                title: "Emilia Clarke",
                                metadata: "Daenerys Targaryen",
                                posterPath: "/iNuaYKoWb7psag7Tg3eRucj5sn2.jpg"),
                PosterStripItem(identifier: 239019,
                                mediaType: .person,
                                title: "Kit Harington",
                                metadata: "Jon Snow",
                                posterPath: "/4MqUjb1SYrzHmFSyGiXnlZWLvBs.jpg"),
                PosterStripItem(identifier: 22970,
                                mediaType: .person,
                                title: "Peter Dinklage",
                                metadata: "Tyrion Lannister",
                                posterPath: "/8Z7cq5pUkz8FtpzOBsd0tgZPoO6.jpg"),
                PosterStripItem(identifier: 17286,
                                mediaType: .person,
                                title: "Lena Headey",
                                metadata: "Cersei Lannister",
                                posterPath: "/wcpy6J7KLzmVt0METboX3CZ0Jp.jpg"),
                PosterStripItem(identifier: 12795,
                                mediaType: .person,
                                title: "Nikolaj Coster-Waldau",
                                metadata: "Jaime Lannister",
                                posterPath: "/1r6SwIV4QqZgdkRuql0EQHd0rUB.jpg"),
                ])
        ]
        
        view?.updateView(sections: sections)
    }
    
    func didSelect(item: PosterStripItem) {
        print("selected: \(item)")
    }
    
}

let coreAssembly = CoreAssembly(navigationController: UINavigationController())
let detailPresenter = FakeDetailPresenter()
let headerPresenter = coreAssembly.detailsAssembly.detailHeaderPresenter()
let posterStripPresenter = coreAssembly.detailsAssembly.posterStripPresenter()

let detailViewController = DetailViewController(detailPresenter: detailPresenter, detailHeaderPresenter: headerPresenter, posterStripPresenter: posterStripPresenter)

detailViewController.title = "Game of Thrones"
let navigatorController = UINavigationController(rootViewController: detailViewController)
//navigatorController.view.frame = UIScreen.main.bounds

PlaygroundPage.current.liveView = navigatorController

