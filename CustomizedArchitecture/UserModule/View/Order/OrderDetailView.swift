//
//  OrderDetailView.swift
//  CustomizedArchitecture
//
//  Created by Cecilia Chen on 1/11/25.
//

import SwiftUI

struct OrderDetailView: View {
    let order: Order
    let onComplete: () -> Void
    
    var body: some View {
        let _ = print("Orders detail body") // side effect

        VStack(spacing: 20) {
            Text("Order Details")
                .font(.largeTitle)
                .bold()
                .padding()

            Text("You have purchased \(order.serviceName)")
                .font(.title3)
                .foregroundColor(.secondary)
                .padding()

            Button("Done") {
                onComplete()
            }
            .buttonStyle(.borderedProminent)
            .padding()

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green.opacity(0.1))
        .navigationTitle("Order Details")
    }
}
