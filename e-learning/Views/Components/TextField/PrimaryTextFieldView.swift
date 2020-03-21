//
//  PrimaryTextFieldView.swift
//  e-learning
//
//  Created by hussein abed on 1/29/20.
//  Copyright © 2020 mac. All rights reserved.
//

import SwiftUI

struct PrimaryTextFieldView: View {
    
    @Binding var value: String
    var placeholder = "Placeholder"
    var icon = Image(systemName: "person.crop.circle")
    var color = Color("offColor")
    var isSecure = false
    var onEditingChanged: ((Bool)->()) = {_ in }
    
    var body: some View {
        HStack {
            
            if isSecure{
                SecureField(placeholder, text: self.$value, onCommit: {
                    self.onEditingChanged(false)
                }).padding(.leading)
            } else {
                TextField(placeholder, text: self.$value, onEditingChanged: { flag in
                    self.onEditingChanged(flag)
                }).padding(.leading)
            }
            
            icon.imageScale(.medium)
                .padding()
                .foregroundColor(color)
        }.background(color.opacity(0.2)).clipShape(Capsule())
    }
}

struct PrimaryTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryTextFieldView(value: .constant(""))
    }
}
