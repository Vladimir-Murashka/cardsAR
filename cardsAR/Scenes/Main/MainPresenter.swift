//
//  MainPresenter.swift
//  cardsAR
//
//  Created by Swift Learning on 29.09.2022.
//
import UIKit
import SceneKit
import ARKit

// MARK: - MainPresenterProtocol

protocol MainPresenterProtocol: AnyObject {
    func viewDidLoad()
    func viewWillAppear()
    func viewWillDisappear()
    func quitButtonPressed()
    func renderer(
        _ renderer: SCNSceneRenderer,
        nodeFor anchor: ARAnchor
    ) -> SCNNode?
}

// MARK: - MainPresenter

final class MainPresenter {
    weak var viewController: MainViewProtocol?
    var scientists = [String: Scientist]()
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    
    // MARK: - Initializer
    
    init(sceneBuildManager: Buildable) {
        self.sceneBuildManager = sceneBuildManager
    }
}

//MARK: - MainPresenterExtension

extension MainPresenter: MainPresenterProtocol {
    func viewDidLoad() {
        loadData()
    }
    
    func viewWillAppear() {
        let configuration = ARImageTrackingConfiguration()
        
        guard let trackingImages = ARReferenceImage.referenceImages(
            inGroupNamed: "ARResources",
            bundle: nil
        ) else {
            fatalError("Images are missing")
        }
        
        configuration.trackingImages = trackingImages
        
        viewController?.sessionRun(with: configuration)
    }
    
    func viewWillDisappear() {
        viewController?.sessionPause()
    }
    
    func quitButtonPressed() {
        let alertViewController = createAlert()
        viewController?.present(
            alertViewController,
            animated: true
        )
    }
    
    func renderer(
        _ renderer: SCNSceneRenderer,
        nodeFor anchor: ARAnchor
    ) -> SCNNode? {
        guard let imageAnchor = anchor as? ARImageAnchor else { return nil }
        guard let name = imageAnchor.referenceImage.name else { return nil }
        guard let scientist = scientists[name] else { return nil }
        
        let plane = SCNPlane(
            width: imageAnchor.referenceImage.physicalSize.width,
            height: imageAnchor.referenceImage.physicalSize.height
        )
        plane.firstMaterial?.diffuse.contents = UIColor.clear
        
        let planeNode = SCNNode(geometry: plane)
        planeNode.eulerAngles.x = -.pi / 2
        
        let node = SCNNode()
        node.addChildNode(planeNode)
        
        let spacing: Float = 0.005
        
        let titleNode = textNode(
            scientist.name,
            font: UIFont.boldSystemFont(ofSize: 10)
        )
        titleNode.pivotOnTopLeft()
        
        titleNode.position.x += Float(plane.width / 2) + spacing
        titleNode.position.y += Float(plane.height / 2)
        
        planeNode.addChildNode(titleNode)
        
        let bioNode = textNode(
            scientist.bio,
            font: UIFont.systemFont(ofSize: 4),
            maxWidth: 100
        )
        bioNode.pivotOnTopLeft()
        
        bioNode.position.x += Float(plane.width / 2) + spacing
        bioNode.position.y = titleNode.position.y - titleNode.height - spacing
        planeNode.addChildNode(bioNode)
        
        
        let flag = SCNPlane(
            width: imageAnchor.referenceImage.physicalSize.width,
            height: imageAnchor.referenceImage.physicalSize.width / 8 * 5
        )
        flag.firstMaterial?.diffuse.contents = UIImage(named: scientist.country)
        
        let flagNode = SCNNode(geometry: flag)
        flagNode.pivotOnTopCenter()
        
        flagNode.position.y -= Float(plane.height / 2) + spacing
        planeNode.addChildNode(flagNode)
        
        return node
    }
}

extension MainPresenter {
    func loadData() {
        guard let url = Bundle.main.url(
            forResource: "scientists",
            withExtension: "json"
        ) else {
            fatalError("JSON is missing")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Unable to load JSON")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedScientists = try? decoder.decode(
            [String: Scientist].self,
            from: data
        ) else {
            fatalError("Unable to parse JSON.")
        }
        
        scientists = loadedScientists
    }
    
    func textNode(
        _ str: String,
        font: UIFont,
        maxWidth: Int? = nil
    ) -> SCNNode {
        let text = SCNText(
            string: str,
            extrusionDepth: 0
        )
        
        text.flatness = 0.1
        text.font = font
        
        if let maxWidth = maxWidth {
            text.containerFrame = CGRect(
                origin: .zero,
                size: CGSize(
                    width: maxWidth,
                    height: 500
                )
            )
            text.isWrapped = true
        }
        
        let textNode = SCNNode(geometry: text)
        textNode.scale = SCNVector3(
            0.002,
            0.002,
            0.002
        )
        
        return textNode
    }
    
    func createAlert() -> UIAlertController{
        let alertViewController = UIAlertController(
            title: "Attention",
            message: "Do you want to get out?",
            preferredStyle: .alert
        )
        let actionYes = UIAlertAction(
            title: "Yes",
            style: .default
        ) { _ in
            self.viewController?.navigationController?.popViewController(animated: true)
        }
        let actionNo = UIAlertAction(
            title: "No",
            style: .cancel
        )
        alertViewController.addAction(actionNo)
        alertViewController.addAction(actionYes)
        
        return alertViewController
    }
}

extension SCNNode {
    var height: Float {
        return (boundingBox.max.y - boundingBox.min.y) * scale.y
    }
    
    func pivotOnTopLeft() {
        let (
            min,
            max
        ) = boundingBox
        pivot = SCNMatrix4MakeTranslation(
            min.x,
            max.y,
            0
        )
    }
    
    func pivotOnTopCenter() {
        let (_, max) = boundingBox
        pivot = SCNMatrix4MakeTranslation(
            0,
            max.y,
            0
        )
    }
}
