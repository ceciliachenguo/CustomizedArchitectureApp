//
//  UserSettingTabCoordinator.swift
//  CustomizedArchitecture
//
//  Created by Cecilia Chen on 1/13/25.
//

import Foundation
import SwiftUI

struct UserSettingTabCoordinator: TabCoordinator {
    @StateObject var navigationPath = NavigationPathManager()

    func rootView() -> some View {
        NavigationStack(path: $navigationPath.path) {
            UserSettingView(
                onRegisterAsMerchant: {
                    navigationPath.path.append(UserSettingDestination.registerAsMerchant)
                }
            )
        }
    }

    func view(for destination: UserSettingDestination) -> AnyView {
        switch destination {
        case .registerAsMerchant:
            return AnyView(Text("How to register as Merchant"))
        }
    }
}

enum UserSettingDestination: Hashable {
    case registerAsMerchant
}
