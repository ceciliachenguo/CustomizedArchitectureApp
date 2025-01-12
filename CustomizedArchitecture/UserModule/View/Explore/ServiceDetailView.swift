//
//  ServiceDetailView.swift
//  CustomizedArchitecture
//
//  Created by Cecilia Chen on 1/11/25.
//

import SwiftUI

struct ServiceDetailView: View {
    let service: Service
    let onBuy: () -> Void // 闭包传递导航逻辑

    var body: some View {
        let _ = print("Service detail body") // side effect

        VStack(spacing: 20) {
            Text(service.name)
                .font(.largeTitle)
                .bold()
                .padding()

            Text(service.description)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)

            Text("Price: $\(service.price, specifier: "%.2f")")
                .font(.title2)
                .foregroundColor(.green)
                .padding()

            Button("Buy") {
                onBuy() // 触发闭包，执行导航逻辑
            }
            .buttonStyle(.borderedProminent)
            .padding()

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.orange.opacity(0.1))
        .navigationTitle("Service Details")
    }
}

