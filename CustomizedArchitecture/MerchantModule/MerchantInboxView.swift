//
//  MerchantInboxView.swift
//  CustomizedArchitecture
//
//  Created by Cecilia Chen on 1/11/25.
//

import SwiftUI

struct MerchantInboxView: View {
    var body: some View {
        VStack {
            Text("This is merchant inbox view")
                .font(.largeTitle)

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Color.brown.opacity(0.3)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    MerchantInboxView()
}
