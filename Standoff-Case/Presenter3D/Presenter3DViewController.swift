//
//  Presenter3DViewController.swift
//  Standoff-Case
//
//  Created by Astemir Shibzuhov on 2/7/23.
//

import UIKit
import SceneKit

class Cell: UICollectionViewCell {
    let imageView = UIImageView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView.frame = contentView.bounds
    }
}

class Presenter3DTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let table = UITableView()
    
    var paths = {
        Bundle.main.urls(forResourcesWithExtension: nil, subdirectory: "Gun") ?? []
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(table)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        table.setSimpleConstraints()
        table.backgroundColor = .white
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paths.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var conf = cell.defaultContentConfiguration()
        conf.text = paths[indexPath.row].pathComponents.last!
        cell.contentConfiguration = conf
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = Presenter3DCollectionViewController()
        vc.name = paths[indexPath.row].pathComponents.last!
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

class Presenter3DCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var name: String!
    
    lazy var skins: [URL] = {
        Bundle.main.urls(forResourcesWithExtension: nil, subdirectory: "Gun/" + name + "/Previews") ?? []
    }()
    
    private lazy var collectionView: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flow).forAutoLayout()
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(Cell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = .white
        collectionView.setSimpleConstraints(constant: 20)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return skins.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
        
        cell.imageView.image = UIImage(data: try! .init(contentsOf: skins[indexPath.row]))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = Presenter3DViewController()
        vc.name = Bundle.main.urls(forResourcesWithExtension: nil, subdirectory: "Gun/" + name)?.first(where: { $0.pathExtension == "obj" })
        
        let skins = Bundle.main.urls(forResourcesWithExtension: nil, subdirectory: "Gun/" + name + "/Skins") ?? []
        
        var url = skins.first(where: {
            self.skins[indexPath.row].pathComponents.last!.split(separator: "_")[1] == $0.pathComponents.last!
        })!
        
        let dir = url.appendingPathComponent(skins[indexPath.row].pathComponents.last!)
   
        let img = Bundle.urls(forResourcesWithExtension: nil, subdirectory: nil, in: url)?.first(where: {
            $0.pathComponents.last?.split(separator: ".").first?.split(separator: "_").last == "A"
        })

        
        vc.skin = img
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 150, height: 90)
    }
}

class Presenter3DViewController :UIViewController, SCNSceneRendererDelegate {
    
    var name: URL?
    var skin: URL?
    
    lazy var scene = try? SCNScene(url: name!)
    let sceneView = SCNView()
    let img = UIImageView().forAutoLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = .lightGray
        self.view.addSubview(img)
        self.view.addSubview(sceneView)
        
        
        var geometry = scene?.rootNode.childNodes[0].geometry!
        let material = SCNMaterial()
        
        material.diffuse.contents = UIImage(data: try! .init(contentsOf: skin!))
        
        let node = SCNNode(geometry: geometry)
//        material.shaderModifiers = [.]
        geometry!.materials = [material]
        
        let lightNode = SCNNode()
        let light = SCNLight()
        light.type = .directional
        light.intensity = 5000
        lightNode.position = .init(x: 0, y: 0, z: 0)
        lightNode.eulerAngles = .init(x: -90, y: 0, z: 0)
        lightNode.light = light
        
        let lightNode2 = SCNNode()
        let light2 = SCNLight()
        light2.type = .directional
        light2.intensity = 5000
        lightNode2.position = .init(x: 0, y: 0, z: 0)
        lightNode2.eulerAngles = .init(x: 60, y: 60, z: -90)
        lightNode2.light = light2
        
        
//        let lightNode3 = SCNNode()
//        let light3 = SCNLight()
//        light.type = .directional
//        light.intensity = 5000
//        lightNode2.position = .init(x: 0, y: 0, z: 0)
//        lightNode2.eulerAngles = .init(x: 60, y: 60, z: -90)
//        lightNode2.light = light2
        
        
        scene?.rootNode.eulerAngles = .init(x: -90, y: 0, z: 0)
        scene?.rootNode.addChildNode(node)
        scene?.rootNode.addChildNode(lightNode)
        scene?.rootNode.addChildNode(lightNode2)
//        scene?.rootNode.addChildNode(cameraNode)
        sceneView.allowsCameraControl = true
        sceneView.delegate = self
        sceneView.backgroundColor = UIColor.clear
        sceneView.scene = scene
        
        img.image = .init(named: "background")
        img.contentMode = .scaleAspectFill
        img.setSimpleConstraints()
        
        sceneView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(didPan)))
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.sceneView.frame = view.bounds
    }
    var ll: CGFloat = 0
    @objc private func didPan(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: gesture.view!)
        
        
        scene?.rootNode.eulerAngles = .init(x: scene!.rootNode.eulerAngles.x -  Float(translation.x / 1000), y: 0, z: -48)
        ll += 1

    }

}
