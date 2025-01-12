//
//  IncomeDashboardView.swift
//  CustomizedArchitecture
//
//  Created by Cecilia Chen on 1/11/25.
//

import SwiftUI

struct IncomeDashboardView: View {
    var body: some View {
        VStack {
            Text("This is merchant income dashboard view")
                .font(.largeTitle)
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Color.red.opacity(0.3)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    IncomeDashboardView()
}
