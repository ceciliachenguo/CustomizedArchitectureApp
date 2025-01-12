//
//  ServiceCardView.swift
//  CustomizedArchitecture
//
//  Created by Cecilia Chen on 1/11/25.
//

import SwiftUI

struct ServiceCardView: View {
    let service: Service

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(service.name)
                    .font(.headline)
                    .foregroundColor(.primary)

                Text(service.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Text("$\(service.price, specifier: "%.2f")")
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
