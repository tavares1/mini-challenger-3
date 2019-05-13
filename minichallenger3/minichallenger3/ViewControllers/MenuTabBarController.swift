//
//  MenuTabBarController.swift
//  minichallenger3
//
//  Created by Lucas Tavares on 13/05/19.
//  Copyright © 2019 Guimbo. All rights reserved.
//

import Foundation
import UIKit

class MenuTabBarController: UITabBarController {
    override func viewDidLoad() {
        let homeViewController = HomeViewController()
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: nil, selectedImage: nil)
        let searchViewController = SearchViewController()
        searchViewController.tabBarItem = UITabBarItem(title: "Search", image: nil, selectedImage: nil)
        let announceViewController = AnnounceViewController()
        announceViewController.tabBarItem = UITabBarItem(title: "Annonunce", image: nil, selectedImage: nil)
        let negociationsViewController = NegociationsViewController()
        negociationsViewController.tabBarItem = UITabBarItem(title: "Negociations", image: nil, selectedImage: nil  )
        let perfilViewController = PerfilViewController()
        perfilViewController.tabBarItem = UITabBarItem(title: "Profile", image: nil, selectedImage: nil)
        let tabBarList = [homeViewController, searchViewController, announceViewController,
                          negociationsViewController, perfilViewController]
        viewControllers = tabBarList
    }
}
