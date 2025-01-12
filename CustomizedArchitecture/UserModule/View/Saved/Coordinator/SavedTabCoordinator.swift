//
//  SavedTabCoordinator.swift
//  CustomizedArchitecture
//
//  Created by Cecilia Chen on 1/13/25.
//

import Foundation
import SwiftUI

struct SavedTabCoordinator: TabCoordinator {
    @StateObject var navigationPath = NavigationPathManager()

    func rootView() -> some View {
        SavedView()
    }

    func view(for destination: UserSavedDestination) -> AnyView {
        switch destination {
        case .serviceDetail(let service):
            return AnyView(ServiceDetailView(service: service, onBuy: {
                navigationPath.path.append(UserSavedDestination.inputCard(service))
            }))
        default:
            return AnyView(Text("Unknown Destination"))
        }
    }
}

enum UserSavedDestination: Hashable {
    case serviceDetail(Service)
    case inputCard(Service)
    case serviceOrderConfirmationViewFromList(Service)
}
