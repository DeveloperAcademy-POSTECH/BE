//
//  BEApp.swift
//  BE
//
//  Created by GOngTAE on 2022/07/02.
//

import FirebaseAuth
import FirebaseCore
import SwiftUI
import UserNotifications

@main
struct BEApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
//    @StateObject var orderViewModel: OrderViewModel = OrderViewModel()
    @Environment(\.scenePhase) var scenePhase

    
    var body: some Scene {
        WindowGroup {
            MenuView()
                .onOpenURL { url in
                    print("Received URL: \(url)")
                    Auth.auth().canHandle(url) // <- just for information purposes
                }
//                .environmentObject(orderViewModel)
        }
        .onChange(of: scenePhase) { newScenePhase in
                    switch newScenePhase {
                    case .active:
                        OrderManager.shared.setOrderAvailable()
                    @unknown default:
                        print("unexpected Value")
                    }
                }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .sound, .alert]) { granted, error in
            if let error = error {
                print("ERROR: UNUserNotificationCenter \(error.localizedDescription)")
            }
        }
        application.registerForRemoteNotifications()
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print("\(#function)")
        print(deviceToken)
        Auth.auth().setAPNSToken(deviceToken, type: .sandbox)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification notification: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        print("\(#function)")
        if Auth.auth().canHandleNotification(notification) {
            completionHandler(.noData)
            return
        }
    }
    
    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        print("\(#function)")
        if Auth.auth().canHandle(url) {
            return true
        }
        return false
    }
}
