//  
//  HomeModuleConfigurator.swift
//  UIComponents
//
//  Created by Лев Бондаренко on 22/06/2019.
//  Copyright © 2019 Лев Бондаренко. All rights reserved.
//

import UIKit

final class HomeModuleConfigurator {
    
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? HomeViewController {
            configure(viewController: viewController)
        }
    }
    
    private func configure(viewController: HomeViewController) {
        let model = HomeModel()
        model.output = viewController
        
        viewController.model = model
    }
    
}
