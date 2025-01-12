//
//  UserCoordinator.swift
//  CustomizedArchitecture
//
//  Created by Cecilia Chen on 1/11/25.
//

import Foundation
import SwiftUI

struct UserCoordinator: View {
    @StateObject private var tabViewState = TabViewState()

    var body: some View {
        TabView(selection: $tabViewState.selectedTab) {
            ExploreTabCoordinator()
                .tabItem {
                    Label("Explore", systemImage: "magnifyingglass")
                }
                .tag(Tab.explore)

            SavedTabCoordinator()
                .tabItem {
                    Label("Saved", systemImage: "bookmark")
                }
                .tag(Tab.saved)

            InboxView() // 假设 Inbox 暂无复杂导航逻辑
                .tabItem {
                    Label("Inbox", systemImage: "envelope")
                }
                .tag(Tab.inbox)

            OrdersTabCoordinator()
                .tabItem {
                    Label("Orders", systemImage: "list.bullet")
                }
                .tag(Tab.orders)

            UserSettingView(
                onRegisterAsMerchant: {
                    print("Register as Merchant")
                }
            )
            .tabItem {
                Label("Settings", systemImage: "gearshape")
            }
            .tag(Tab.settings)
        }
    }
}
