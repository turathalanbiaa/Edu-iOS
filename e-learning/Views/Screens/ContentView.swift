//
//  ContentView.swift
//  e-learning
//
//  Created by mac on 1/28/20.
//  Copyright © 2020 mac. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var auth: AuthViewModel
    var body: some View {
        Group {
            if auth.user != nil {
               TabView {
                   MainView().tabItem {
                       Image(systemName: "circle")
                       Text("main")
                   }
                    MenuView().tabItem {
                        Image(systemName: "circle")
                        Text("main")
                    }
                }
            }
            else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AuthViewModel())
    }
}
