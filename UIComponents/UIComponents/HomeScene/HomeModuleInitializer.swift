//  
//  HomeModuleInitializer.swift
//  UIComponents
//
//  Created by Лев Бондаренко on 22/06/2019.
//  Copyright © 2019 Лев Бондаренко. All rights reserved.
//

import UIKit

final class HomeModuleInitializer: NSObject {
    
    @IBOutlet weak var viewController: HomeViewController!
    
    override func awakeFromNib() {
        let configurator = HomeModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: viewController)
    }
    
}
