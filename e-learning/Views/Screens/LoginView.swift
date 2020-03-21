//
//  Login.swift
//  e-learning
//
//  Created by hussein abed on 1/29/20.
//  Copyright © 2020 mac. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var formOffset: CGFloat = 0
    @State private var presentSignupSheet = false
    @State private var presentPasswordRecoverySheet = false
    @EnvironmentObject var auth: AuthViewModel
    
    
    var body: some View {
        Group {
            VStack(spacing: 40) {
                Image("Logo")
                Text("Login").font(.title).bold()
                VStack {
                    PrimaryTextFieldView(value: self.$email, placeholder: "Email", icon: Image(systemName: "at"), onEditingChanged: { flag in
                        
                        withAnimation {
                            self.formOffset = flag ? -150 : 0
                        }
                    }).padding(.bottom, 10)
                    
                    PrimaryTextFieldView(value: self.$password, placeholder: "Password", icon: Image(systemName: "lock"), isSecure: true).padding(.bottom, 50)
                    PrimaryButtonView() {
                        self.auth.login(userName: "user1@gmail.com", password: "12345678")
                    }
                }
                
                Button(action: {
                    self.presentSignupSheet.toggle()
                }) {
                    HStack {
                        Text("Don't have an account? Sign up.").accentColor(Color.accentColor)
                    }
                }.sheet(isPresented: self.$presentSignupSheet) {
                    SignUpView().environmentObject(AuthViewModel())
                }
                
                Button(action: {
                    self.presentPasswordRecoverySheet.toggle()
                }) {
                    HStack {
                        Text("Forgot your password?").accentColor(Color.purple)
                    }
                }.sheet(isPresented: self.$presentPasswordRecoverySheet) {
                    RecoverPasswordView(presentPasswordRecoverySheet: self.$presentPasswordRecoverySheet)
                }
                
            }.padding()
                .offset(y: self.formOffset)
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

