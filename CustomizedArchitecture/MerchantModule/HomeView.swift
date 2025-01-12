//
//  HomeView.swift
//  CustomizedArchitecture
//
//  Created by Cecilia Chen on 1/11/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("This is Merchant Home View")
                .font(.largeTitle)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Color.orange.opacity(0.3)
                .ignoresSafeArea()
        }
    }
}


#Preview {
    HomeView()
}
