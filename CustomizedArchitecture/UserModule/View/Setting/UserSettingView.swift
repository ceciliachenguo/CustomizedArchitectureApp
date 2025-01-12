//
//  UserSettingView.swift
//  CustomizedArchitecture
//
//  Created by Cecilia Chen on 1/11/25.
//

import SwiftUI

struct UserSettingView: View {
    @EnvironmentObject var appModeState: AppModeState
    let onRegisterAsMerchant: () -> Void

    var body: some View {
        let _ = print("User setting body") // side effect

        VStack {
            Text("This is User Setting View")
                .font(.largeTitle)
                .padding()

            Button("Register as Merchant") {
                onRegisterAsMerchant()
            }
            .buttonStyle(.borderedProminent)


            Button("Switch to Merchant Mode") {
                appModeState.isMerchant = true
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Color.yellow.opacity(0.3)
                .ignoresSafeArea()
        }
    }
}

