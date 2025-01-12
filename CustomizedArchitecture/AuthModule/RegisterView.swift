//
//  RegisterView.swift
//  CustomizedArchitecture
//
//  Created by Cecilia Chen on 1/11/25.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        VStack {
            Text("This is Register View")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
                .background(Color.green)

            Text("Here you can register for an account.")
        }
    }
}


#Preview {
    RegisterView()
}
