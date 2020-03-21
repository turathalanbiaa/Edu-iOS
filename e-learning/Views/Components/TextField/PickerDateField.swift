//
//  PickerDateField.swift
//  e-learning
//
//  Created by hussein abed on 2/23/20.
//  Copyright © 2020 mac. All rights reserved.
//

import SwiftUI

struct PickerDateField: View {
    @Binding var value: Date
    var icon = Image(systemName: "person.crop.circle")
    var color = Color("offColor")
    var label = ""
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    var body: some View {
        HStack {
            Text("\(label): \(value, formatter: dateFormatter)").padding(.leading).font(.system(size: 16))
            Spacer()
            icon.imageScale(.medium)
                .padding()
                .foregroundColor(color)
        }.background(color.opacity(0.2))
            .clipShape(Capsule())
    }
}

struct PickerDateField_Previews: PreviewProvider {
    static var previews: some View {
        PickerDateField(value: .constant(Date()))
    }
}
