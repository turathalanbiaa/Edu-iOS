//
//  RecoverPasswordView.swift
//  e-learning
//
//  Created by hussein abed on 1/29/20.
//  Copyright © 2020 mac. All rights reserved.
//

import SwiftUI

struct RecoverPasswordView: View {
    @State private var email = ""
    @Binding var presentPasswordRecoverySheet: Bool
    
    var body: some View {
        VStack(spacing: 40) {
            Image("Logo")
            Text("Recover Password").font(.title).bold()
            VStack {
                PrimaryTextFieldView(value: self.$email, placeholder: "Email", icon: Image(systemName: "at"))
                PrimaryButtonView(text: "Reset Password") {}
            }
            
            Button(action: {
                self.presentPasswordRecoverySheet.toggle()
            }) {
              HStack {
                Text("Cancel").accentColor(Color.accentColor)
                  }
              }
            
        }.padding()
    }

}

struct RecoverEmailView_Previews: PreviewProvider {
    static var previews: some View {
        RecoverPasswordView(presentPasswordRecoverySheet: .constant(false))
    }
}

