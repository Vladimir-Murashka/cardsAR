//
//  MainViewController.swift
//  cardsAR
//
//  Created by Swift Learning on 29.09.2022.
//

import ARKit
import SceneKit
import UIKit

// MARK: - MainViewProtocol

protocol MainViewProtocol: UIViewController {
    func sessionRun(with configuration: ARConfiguration)
    func sessionPause()
}

// MARK: - MainViewController

final class MainViewController: UIViewController {
    var presenter: MainPresenterProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneView = ARSCNView()
    
    private lazy var quitButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "arrowshape.turn.up.left.circle.fill")
        button.setBackgroundImage(
            image,
            for: .normal
        )
        button.tintColor = .black
        button.backgroundColor = .white
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        button.addTarget(
            self,
            action: #selector(quitButtonPressed),
            for: .touchUpInside
        )
        return button
    }()
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self
        presenter?.viewDidLoad()
        setupViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter?.viewWillDisappear()
    }
    
    func renderer(
        _ renderer: SCNSceneRenderer,
        nodeFor anchor:
        ARAnchor
    ) -> SCNNode? {
        let node = presenter?.renderer(
            renderer,
            nodeFor: anchor
        )
        return node
    }
    
    // MARK: - Actions
    
    @objc
    private func quitButtonPressed() {
        presenter?.quitButtonPressed()
    }
}


// MARK: - MainViewProtocol Impl

extension MainViewController: MainViewProtocol {
    func sessionRun(
        with configuration: ARConfiguration) {
        sceneView.session.run(configuration)
    }
    
    func sessionPause() {
        sceneView.session.pause()
    }
}

// MARK: - PrivateMethods

private extension MainViewController {
    func setupViewController() {
        addSubViews()
        setupConstraints()
        navigationController?.isNavigationBarHidden = true
    }
    
    func addSubViews() {
        view.addSubviews(
            sceneView,
            quitButton
        )
    }
    
    func setupConstraints() {
        let quitButtonSize: CGFloat = 30
        let quitButtonOffset: CGFloat = 16
        
        NSLayoutConstraint.activate([
            quitButton.heightAnchor.constraint(equalToConstant: quitButtonSize),
            quitButton.widthAnchor.constraint(equalToConstant: quitButtonSize),
            quitButton.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: quitButtonOffset
            ),
            quitButton.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: quitButtonOffset
            ),
            
            sceneView.topAnchor.constraint(equalTo: view.topAnchor),
            sceneView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            sceneView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sceneView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension MainViewController: ARSCNViewDelegate {}
