//
//  OrderDetailViewFromList.swift
//  CustomizedArchitecture
//
//  Created by Cecilia Chen on 1/11/25.
//

import SwiftUI

struct OrderDetailViewFromList: View {
    let order: Order

    var body: some View {
        let _ = print("Orders detail view from list body") // side effect

        VStack(spacing: 20) {
            Text("Order Details")
                .font(.largeTitle)
                .bold()
                .padding()

            Text("Order ID: \(order.id.uuidString)")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding()

            Text("Service: \(order.serviceName)")
                .font(.title2)
                .foregroundColor(.primary)
                .padding()

            Text("Total: $\(order.totalAmount, specifier: "%.2f")")
                .font(.title2)
                .foregroundColor(.green)
                .padding()

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.yellow.opacity(0.1))
        .navigationTitle("Order Details")
    }
}

struct ServiceOrderConfirmationViewFromList: View {
    let service: Service

    var body: some View {
        let _ = print("Orders detail view from list body") // side effect

        VStack(spacing: 20) {
            Text("Order Details")
                .font(.largeTitle)
                .bold()
                .padding()

            Text("Order ID: ")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding()

            Text("Service: \(service.name)")
                .font(.title2)
                .foregroundColor(.primary)
                .padding()

            Text("Total: $\(service.price, specifier: "%.2f")")
                .font(.title2)
                .foregroundColor(.green)
                .padding()

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.yellow.opacity(0.1))
        .navigationTitle("Order Details")
    }
}
