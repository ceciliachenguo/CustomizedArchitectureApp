//
//  InboxView.swift .swift
//  CustomizedArchitecture
//
//  Created by Cecilia Chen on 1/11/25.
//

import SwiftUI

struct InboxView: View {
    var body: some View {
        let _ = print("Inbox View body") // side effect

        VStack {
            Text("This is User Inbox View")
                .font(.largeTitle)
            
            Spacer()

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Color.green.opacity(0.3)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    InboxView()
}
