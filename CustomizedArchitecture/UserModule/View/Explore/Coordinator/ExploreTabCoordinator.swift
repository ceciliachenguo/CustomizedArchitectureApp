//
//  ExploreTabCoordinator.swift
//  CustomizedArchitecture
//
//  Created by Cecilia Chen on 1/13/25.
//

import SwiftUI

struct ExploreTabCoordinator: TabCoordinator {
    @StateObject var navigationPath = NavigationPathManager()

    func rootView() -> some View {
        NavigationStack(path: $navigationPath.path) {
            ExploreView(
                onServiceSelected: { service in
                    navigationPath.path.append(UserDestination.serviceDetail(service))
                },
                onGoToSettings: {
                    navigationPath.path.append(UserDestination.userSetting)
                }
            )
        }
    }

    func view(for destination: UserDestination) -> AnyView {
        switch destination {
        case .serviceDetail(let service):
            return AnyView(ServiceDetailView(service: service, onBuy: {
                navigationPath.path.append(UserDestination.inputCard(service))
            }))
            
        case .inputCard(let service):
            return AnyView(InputCardView(service: service, onNext: {
                navigationPath.path.append(UserDestination.serviceOrderConfirmationViewFromList(service))
            }))
            
        case .serviceOrderConfirmationViewFromList(let service):
            return AnyView(ServiceOrderConfirmationViewFromList(service: service))
            
        case .userSetting:
            return AnyView(UserSettingView(onRegisterAsMerchant: {
                navigationPath.path.append(UserDestination.registerAsMerchant)
            }))
            
        case .registerAsMerchant:
            return AnyView(Text("This is regisger as merchant"))
            
        default:
            return AnyView(Text("Unknown Destination"))
        }
    }
}

enum UserDestination: Hashable {
    case serviceDetail(Service)
    case inputCard(Service)
    case serviceOrderConfirmationViewFromList(Service)
    case userSetting
    case registerAsMerchant
}
