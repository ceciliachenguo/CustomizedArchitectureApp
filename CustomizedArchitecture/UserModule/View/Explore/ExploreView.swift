//
//  ExploreView.swift
//  CustomizedArchitecture
//
//  Created by Cecilia Chen on 1/11/25.
//

import SwiftUI

struct ExploreView: View {
    let onServiceSelected: (Service) -> Void
    let onGoToSettings: () -> Void
    
    var body: some View {
        let _ = print("Explore View body") // side effect

        VStack {
            Text("This is Explore View")
                .font(.largeTitle)
                .padding(.bottom)

            // 列表展示卡片
            List(sampleServices) { service in
                ServiceCardView(service: service)
                    .onTapGesture {
                        onServiceSelected(service)
                    }
            }
            .listStyle(.plain)
            
            
            Button("Go to setting") {
                onGoToSettings()
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Color.teal.opacity(0.3)
                .ignoresSafeArea()
        }
    }
}
