//
//  OrdersView.swift
//  CustomizedArchitecture
//
//  Created by Cecilia Chen on 1/11/25.
//

import SwiftUI

struct OrdersView: View {
    let onOrderSelected: (Order) -> Void

    var body: some View {
        let _ = print("Orders View body") // side effect
        
        VStack {
            Text("Your Orders")
                .font(.largeTitle)
                .bold()
                .padding()

            List(sampleOrders) { order in
                OrderCardView(order: order)
                    .onTapGesture {
                        onOrderSelected(order)
                    }
            }
            .listStyle(.plain)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Color.green.opacity(0.3)
                .ignoresSafeArea()
        }
    }
}
