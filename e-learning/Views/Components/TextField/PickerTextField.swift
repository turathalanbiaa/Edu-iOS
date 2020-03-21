//
//  PickerTextField.swift
//  e-learning
//
//  Created by hussein abed on 2/16/20.
//  Copyright © 2020 mac. All rights reserved.
//

import SwiftUI

struct PickerTextField: View {
    
    var value = ""
    var placeholder = "Placeholder"
    var icon = Image(systemName: "chevron.down")
    var color = Color("offColor")
    var label = ""
    var onEditingChanged: ((Bool)->()) = {_ in }
    @EnvironmentObject var auth: AuthViewModel
    var body: some View {
        HStack {
            Text("\(label): \(value)").padding(.leading).font(.system(size: 16))
            Spacer()
            icon.imageScale(.medium)
                .padding()
                .foregroundColor(color)
        }.background(color.opacity(0.2))
            .clipShape(Capsule())
    }
}

struct PickerTextField_Previews: PreviewProvider {
    static var previews: some View {
        PickerTextField()
    }
}
