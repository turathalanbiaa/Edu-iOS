//
//  PrimaryButtonView.swift
//  e-learning
//
//  Created by hussein abed on 1/29/20.
//  Copyright © 2020 mac. All rights reserved.
//

import SwiftUI

struct PrimaryButtonView: View {
    var text = "Next"
    var action: ()->() = {}
    
    var body: some View {
      Button(action: action) {
        HStack {
            Text(text)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(.vertical, 10)
                .accentColor(Color.white)
                .background(Color("accentColor"))
                .cornerRadius(30)
            }
        }
    }
}

struct PrimaryButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButtonView()
    }
}
