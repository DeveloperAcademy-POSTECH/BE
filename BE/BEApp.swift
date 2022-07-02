//
//  BEApp.swift
//  BE
//
//  Created by GOngTAE on 2022/07/02.
//

import FirebaseCore
import SwiftUI
import UserNotifications

@main
struct BEApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      
      UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .sound, .alert]) { granted, error in
         
      }
      
    application.registerForRemoteNotifications()
    return true
  }
}
