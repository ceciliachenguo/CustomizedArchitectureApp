//
//  OrdersTabCoordinator.swift
//  CustomizedArchitecture
//
//  Created by Cecilia Chen on 1/13/25.
//

import SwiftUI

struct OrdersTabCoordinator: TabCoordinator {
    @StateObject var navigationPath = NavigationPathManager()

    func rootView() -> some View {
        OrdersView(onOrderSelected: { order in
            navigationPath.path.append(UserOrderDestination.orderDetailFromList(order))
        })
    }

    func view(for destination: UserOrderDestination) -> AnyView {
        switch destination {
        case .orderDetailFromList(let order):
            return AnyView(OrderDetailView(order: order, onComplete: {
                navigationPath.path.removeLast(navigationPath.path.count)
            }))
        default:
            return AnyView(Text("Unknown Destination"))
        }
    }
}

enum UserOrderDestination: Hashable {
    case orderDetail(Order)
    case orderDetailFromList(Order)
}
