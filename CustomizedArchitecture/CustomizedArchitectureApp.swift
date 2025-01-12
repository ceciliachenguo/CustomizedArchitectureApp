//
//  CustomizedArchitectureApp.swift
//  CustomizedArchitecture
//
//  Created by Cecilia Chen on 1/11/25.
//

import SwiftUI

@main
struct CustomizedArchitectureApp: App {
    @StateObject private var appModeState = AppModeState()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appModeState)
        }
    }
}

struct ContentView: View {
    @EnvironmentObject var appModeState: AppModeState

    var body: some View {
        if appModeState.isMerchant {
            MerchantCoordinator()
        } else {
            UserCoordinator()
        }
    }
}

class AppModeState: ObservableObject {
    @Published var isMerchant: Bool = false // 是否为商家模式
}

class NavigationPathManager: ObservableObject {
    @Published var path = NavigationPath() // 管理动态导航路径
}

protocol TabCoordinator: View {
    associatedtype Destination: Hashable
    associatedtype RootViewType: View

    func rootView() -> RootViewType
    func view(for destination: Destination) -> AnyView
}

extension TabCoordinator {
    var body: some View {
        NavigationStack { // 不直接绑定 navigationPath
            rootView()
                .navigationDestination(for: Destination.self) { destination in
                    view(for: destination)
                }
        }
    }
}

#Preview {
        ContentView()
}

