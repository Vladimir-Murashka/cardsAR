//
//  SceneBuildManager.swift
//  cardsAR
//
//  Created by Swift Learning on 29.09.2022.
//

protocol Buildable {
    func buildMenuScreen() -> MenuViewController
    func buildMainScreen() -> MainViewController
}

final class SceneBuildManager {}

extension SceneBuildManager: Buildable {
    func buildMenuScreen() -> MenuViewController {
        let viewController = MenuViewController()
        let presenter = MenuPresenter(
            sceneBuildManager: self
        )
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
    
    func buildMainScreen() -> MainViewController {
        let viewController = MainViewController()
        let presenter = MainPresenter(
            sceneBuildManager: self
        )
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
}
