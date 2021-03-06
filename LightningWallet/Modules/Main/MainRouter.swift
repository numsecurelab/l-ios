import UIKit
import ThemeKit

class MainRouter {
    weak var viewController: UIViewController?
}

extension MainRouter: IMainRouter {

    func openSettings() {
        viewController?.navigationController?.pushViewController(MainSettingsRouter.module(), animated: true)
    }

    func openTransactions() {
    }

}

extension MainRouter {

    static func module() -> UIViewController {
        let router = MainRouter()
        let interactor = MainInteractor(currencyKit: App.shared.currencyKit)
        let presenter = MainPresenter(interactor: interactor, router: router, viewFactory: MainViewFactory())
        let viewController = MainViewController(delegate: presenter)

        presenter.view = viewController
        router.viewController = viewController

        App.shared.pinKitDelegate.viewController = viewController

        return ThemeNavigationController(rootViewController: viewController)
    }

}
