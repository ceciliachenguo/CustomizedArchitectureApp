//
//  OrderCardView.swift
//  CustomizedArchitecture
//
//  Created by Cecilia Chen on 1/11/25.
//

import SwiftUI

struct OrderCardView: View {
    let order: Order

    var body: some View {
        let _ = print("Orders card view body") // side effect

        HStack {
            VStack(alignment: .leading) {
                Text("Order: \(order.id.uuidString.prefix(8))")
                    .font(.headline)
                    .foregroundColor(.primary)

                Text(order.serviceName)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Text("$\(order.totalAmount, specifier: "%.2f")")
                .font(.subheadline)
                .bold()
                .foregroundColor(.green)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: .gray.opacity(0.4), radius: 4, x: 2, y: 2)
    }
}

