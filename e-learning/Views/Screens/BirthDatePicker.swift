//
//  DataPicker.swift
//  e-learning
//
//  Created by hussein abed on 2/16/20.
//  Copyright © 2020 mac. All rights reserved.
//

import SwiftUI

struct BirthDatePicker: View {
    @State private var selection = 0
    @Binding var birthDate: Date
    var body: some View {
        Text("guyuhuh")
    }
}

struct BirthDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        BirthDatePicker(birthDate: .constant(Date()))
    }
}
