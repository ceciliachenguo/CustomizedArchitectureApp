//
//  MerchantSettingView.swift
//  CustomizedArchitecture
//
//  Created by Cecilia Chen on 1/11/25.
//

import SwiftUI

struct MerchantSettingView: View {
    @EnvironmentObject var appModeState: AppModeState
    
    var body: some View {
        VStack {
            Text("This is merchant Setting View")
                .font(.largeTitle)
                .padding()

            Button("Switch to User Mode") {
                appModeState.isMerchant = true
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Color.blue.opacity(0.3)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    MerchantSettingView()
}
