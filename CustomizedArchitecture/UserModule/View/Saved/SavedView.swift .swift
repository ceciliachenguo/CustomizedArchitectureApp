//
//  SavedView.swift .swift
//  CustomizedArchitecture
//
//  Created by Cecilia Chen on 1/11/25.
//

import SwiftUI

struct SavedView: View {
    var body: some View {
        let _ = print("Saved View body") // side effect

        VStack {
            Text("This is User Saved View")
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
    SavedView()
}
