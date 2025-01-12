//
//  MerchantCoordinator.swift
//  CustomizedArchitecture
//
//  Created by Cecilia Chen on 1/11/25.
//

import Foundation
import SwiftUI

struct MerchantCoordinator: View {
    @StateObject private var pathManager = NavigationPathManager()

    var body: some View {
        NavigationStack(path: $pathManager.path) {
            TabView {
                HomeView()
                    .tabItem { Label("Published Services", systemImage: "tray") }

                MerchantInboxView()
                    .tabItem { Label("Inbox", systemImage: "envelope") }

                IncomeDashboardView()
                    .tabItem { Label("Income Dashboard", systemImage: "chart.bar") }

                MerchantSettingView()
                    .tabItem { Label("Settings", systemImage: "gearshape") }
            }
            .navigationDestination(for: MerchantDestination.self) { destination in
                switch destination {
                case .verification:
                    Text("This is Verification View").background(Color.purple)
                }
            }
        }
    }
}

enum MerchantDestination: Hashable {
    case verification
}
