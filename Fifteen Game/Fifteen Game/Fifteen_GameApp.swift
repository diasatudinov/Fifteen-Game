//
//  Fifteen_GameApp.swift
//  Fifteen Game
//
//  Created by Dias Atudinov on 11.12.2024.
//

import SwiftUI

@main
struct Fifteen_GameApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            RootView()
                .preferredColorScheme(.light)
        }
    }
}
