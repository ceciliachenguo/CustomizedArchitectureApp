//
//  CustomizedArchitectureApp.swift
//  CustomizedArchitecture
//
//  Created by Cecilia Chen on 1/11/25.
//

import SwiftUI

@main
struct CustomizedArchitectureApp: App {
    @StateObject private var appStateContainer = AppStateContainer()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appStateContainer.appModeState)
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

class AppStateContainer: ObservableObject {
    var appModeState = AppModeState()       // 管理用户模式（如是否是商家模式）
}

class AppModeState: ObservableObject {
    @Published var isMerchant: Bool = false // 是否为商家模式
}

enum Tab: Hashable {
    case explore
    case saved
    case inbox
    case orders
    case settings
}

class TabViewState: ObservableObject {
    @Published var selectedTab: Tab = .explore
}

class NavigationPathManager: ObservableObject {
    @Published var path = NavigationPath() // 管理动态导航路径
}

enum UserDestination: Hashable {
    case serviceDetail(Service)
    case inputCard(Service)
    case orderDetail(Service)
    case serviceOrderConfirmationViewFromList(Service)
    case registerAsMerchant
    case userSetting
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
        default:
            return AnyView(Text("Unknown Destination"))
        }
    }
}

struct SavedTabCoordinator: TabCoordinator {
    @StateObject var navigationPath = NavigationPathManager()

    func rootView() -> some View {
        SavedView()
    }

    func view(for destination: UserDestination) -> AnyView {
        switch destination {
        case .serviceDetail(let service):
            return AnyView(ServiceDetailView(service: service, onBuy: {
                navigationPath.path.append(UserDestination.inputCard(service))
            }))
        default:
            return AnyView(Text("Unknown Destination"))
        }
    }
}

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


#Preview {
        ContentView()
}

