//
//  MenuPresenter.swift
//  cardsAR
//
//  Created by Swift Learning on 29.09.2022.
//

// MARK: - MenuPresenterProtocol

protocol MenuPresenterProtocol: AnyObject {
    func startButtonPressed()
}

// MARK: - MenuPresenter

final class MenuPresenter {
    weak var viewController: MenuViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable) {
        self.sceneBuildManager = sceneBuildManager
    }
}

//MARK: - MenuPresenterExtension

extension MenuPresenter: MenuPresenterProtocol {
    func startButtonPressed() {
        let mainViewController = sceneBuildManager.buildMainScreen()
        viewController?.navigationController?.pushViewController(
            mainViewController,
            animated: true
        )
    }
}
