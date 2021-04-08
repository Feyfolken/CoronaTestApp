//
//  NavigationBarExtension.swift
//  CoronaTestApp
//
//  Created by Feyfolken on 06.03.2021.
//

import UIKit

extension UINavigationBarAppearance {
    
    func setNabBarColors() {
        configureWithTransparentBackground()
        
        largeTitleTextAttributes = [.foregroundColor: UIColor.init(named: "CommonTextColor")]
        titleTextAttributes = [.foregroundColor: UIColor.init(named: "CommonTextColor")]
        backgroundColor = UIColor.init(named: "NavigationBarBackgroundColor")
        
        UINavigationBar.appearance().scrollEdgeAppearance = self
        UINavigationBar.appearance().standardAppearance = self
    }
}
