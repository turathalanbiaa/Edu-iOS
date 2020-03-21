//
//  AnnouncementsView.swift
//  e-learning
//
//  Created by hussein abed on 2/3/20.
//  Copyright © 2020 mac. All rights reserved.
//

import SwiftUI

struct AnnouncementsView: View {
    @State var show = false
    var body: some View {
        VStack {
            NavigationLink(destination: AnnouncementDetailsView(), isActive: $show) {
                Text("")
            }
            AnnouncementCardView()
                .frame(height: 240)
                .cornerRadius(10)
                .shadow(radius: 10)
                .onTapGesture {
                self.show.toggle()
                }.padding()
            Spacer()
        }
        
    }
}

struct AnnouncementsView_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementsView()
    }
}
