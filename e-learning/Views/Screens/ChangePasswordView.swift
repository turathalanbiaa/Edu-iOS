//
//  ChangePasswordView.swift
//  e-learning
//
//  Created by hussein abed on 3/19/20.
//  Copyright © 2020 mac. All rights reserved.
//

import SwiftUI

struct ChangePasswordView: View {
    
    @State private var oldPassword = ""
    @State private var newPassword = ""
    @State private var confirmNewPassword = ""
    
    var body: some View {
        VStack(spacing: 40) {
            Image("Logo")
            Text("Login").font(.title).bold()
            VStack {
                PrimaryTextFieldView(value: self.$oldPassword, placeholder: "Old Password", icon: Image(systemName: "lock"), isSecure: true)
                    .padding(.bottom, 10)
                PrimaryTextFieldView(value: self.$newPassword, placeholder: "New Password", icon: Image(systemName: "lock"), isSecure: true)
                    .padding(.bottom, 10)
                PrimaryTextFieldView(value: self.$newPassword, placeholder: "Confirm New Password", icon: Image(systemName: "lock"), isSecure: true)
                    .padding(.bottom, 50)
                PrimaryButtonView() {}
            }
        }.padding()
    }
}

struct ChangePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePasswordView()
    }
}
