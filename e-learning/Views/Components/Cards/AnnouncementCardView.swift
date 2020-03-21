//
//  AnnouncementsCardView.swift
//  e-learning
//
//  Created by hussein abed on 2/3/20.
//  Copyright © 2020 mac. All rights reserved.
//

import SwiftUI

struct AnnouncementCardView: View {
    var body: some View {
        ZStack(alignment: .bottom){
            Image("avatar")
                .resizable()
                .clipped()
            Rectangle()
                .frame(height: 80)
                .opacity(0.35)
                .blur(radius: 10)
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("ahmed")
                        .foregroundColor(.white)
                        .bold()
                        .font(.largeTitle)
                }
                .padding(.leading)
                .padding(.bottom)
                Spacer()
            }
        }
    }
}

struct AnnouncementCardView_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementCardView()
    }
}
