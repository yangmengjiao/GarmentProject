//
//  SceneDelegate.swift
//  GarmentProject
//
//  Created by mengjiao on 2/17/21.
//

import UIKit
import SwiftUI
import RealmSwift

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            do {
                // 1
                let realm = try Realm()
                let window = UIWindow(windowScene: windowScene)
                // 2
                let viewModel = GarmentListViewModel(realm: realm)
                let contentView = ContentView()
                    .environmentObject(viewModel)
                window.rootViewController = UIHostingController(rootView: contentView)
                self.window = window
                window.makeKeyAndVisible()
            } catch let error {
                // Handle error
                fatalError("Failed to open Realm. Error: \(error.localizedDescription)")
            }
        }
    }
}

