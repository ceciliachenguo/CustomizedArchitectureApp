//
//  InputCardView.swift
//  CustomizedArchitecture
//
//  Created by Cecilia Chen on 1/11/25.
//

import SwiftUI

struct InputCardView: View {
    let service: Service
    let onNext: () -> Void

    var body: some View {
        let _ = print("Input Card view body") // side effect

        VStack(spacing: 20) {
            Text("Enter Card Details")
                .font(.largeTitle)
                .bold()
                .padding()

            TextField("Card Number", text: .constant(""))
                .textFieldStyle(.roundedBorder)
                .padding()

            Button("Next") {
                onNext()
            }
            .buttonStyle(.borderedProminent)
            .padding()

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue.opacity(0.1))
        .navigationTitle("Payment")
    }
}
