//
//  VIPERHomeSceneRouter.swift
//  UIComponents
//
//  Created Лев Бондаренко on 28/06/2019.
//  Copyright © 2019 Лев Бондаренко. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class VIPERHomeSceneRouter: VIPERHomeSceneWireframeProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = VIPERHomeSceneViewController(nibName: nil, bundle: nil)
        let interactor = VIPERHomeSceneInteractor()
        let router = VIPERHomeSceneRouter()
        let presenter = VIPERHomeScenePresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
