//
//  UpdateInfoView.swift
//  e-learning
//
//  Created by hussein abed on 3/21/20.
//  Copyright © 2020 mac. All rights reserved.
//

import SwiftUI

struct UpdateInfoView: View {
    
    @State private var name = ""
    @State private var email = ""
    @State private var phone = ""
    @State private var address = ""
    @State private var formOffset: CGFloat = 0
    
    func moveUp(flag: Bool) -> CGFloat {flag ? -150: 0}
    
    var body: some View {
        ScrollView {
            Group {
                Section {
                    VStack {
                        Image("avatar").resizable().frame(width: 200, height: 200).clipShape(Circle()).padding()
                        Text("Change Avatar")
                    }
                }
                Section {
                    VStack(alignment: .leading) {
                        PrimaryTextFieldView(value: $name, placeholder: "Name", onEditingChanged: { flag in
                            withAnimation {
                                self.formOffset = self.moveUp(flag: flag)
                            }
                        })
                        PrimaryTextFieldView(value: $email, placeholder: "Email", onEditingChanged: { flag in
                            withAnimation {
                                self.formOffset = self.moveUp(flag: flag)
                            }
                        })
                        PrimaryTextFieldView(value: $phone, placeholder: "Phone Number", onEditingChanged: { flag in
                            withAnimation {
                                self.formOffset = self.moveUp(flag: flag)
                            }
                        })
                        PrimaryTextFieldView(value: $address, placeholder: "Addresss", onEditingChanged: { flag in
                            withAnimation {
                                self.formOffset = self.moveUp(flag: flag)
                            }
                        })
                    }
                }.padding()
            }.padding(.bottom, 60).offset(y: self.formOffset)
        }
    }
}

struct UpdateInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateInfoView()
    }
}
