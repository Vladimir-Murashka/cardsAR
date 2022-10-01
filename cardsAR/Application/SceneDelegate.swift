//
//  SceneDelegate.swift
//  cardsAR
//
//  Created by Swift Learning on 29.09.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        setupRootViewController(windowScene: windowScene)
    }
}

// MARK: - Private methods
private extension SceneDelegate {
    func setupRootViewController(windowScene: UIWindowScene) {
        let window = UIWindow(windowScene: windowScene)
        let sceneBuildManager: Buildable = SceneBuildManager()
        let viewController = sceneBuildManager.buildMenuScreen()
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
    }
}
