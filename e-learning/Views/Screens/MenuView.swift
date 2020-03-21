//
//  MenuView.swift
//  e-learning
//
//  Created by hussein abed on 2/3/20.
//  Copyright © 2020 mac. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    NavigationLink(destination: UpdateInfoView()) {
                        HStack {
                            Image("avatar").resizable().frame(width: 80, height: 80).clipShape(Circle()).padding()
                            Text("Ahmed Felah Hassan")
                        }
                    }
                }
                Section {
                    NavigationLink(destination: AnnouncementsView()) {
                        HStack {
                            Image(systemName: "exclamationmark.bubble.fill")
                                .imageScale(.large)
                                .padding()
                            Text("Announcements")
                            Spacer()
                            ZStack {
                                Circle().fill(Color(.red)).frame(width :20, height: 20)
                                Text("9+").font(.system(size: 10)).fontWeight(.bold).foregroundColor(.white)
                            }
                        }
                    }
                    NavigationLink(destination: ChangePasswordView()) {
                        HStack {
                            Image(systemName: "lock.rotation")
                                .imageScale(.large)
                                .padding()
                            Text("Change Password")
                            Spacer()
                            ZStack {
                                Circle().fill(Color(.red)).frame(width :20, height: 20)
                                Text("9+").font(.system(size: 10)).fontWeight(.bold).foregroundColor(.white)
                            }
                        }
                    }
                    NavigationLink(destination: UploadAdsView()) {
                        HStack {
                            Image(systemName: "photo.fill.on.rectangle.fill")
                                .imageScale(.large)
                                .padding()
                            Text("Upload Ads")
                            Spacer()
                            ZStack {
                                Circle().fill(Color(.red)).frame(width :20, height: 20)
                                Text("2").font(.system(size: 10)).fontWeight(.bold).foregroundColor(.white)
                            }
                        }
                    }
                    HStack {
                        Image(systemName: "arrow.2.circlepath.circle.fill")
                            .imageScale(.large)
                            .padding()
                        Text("Change acount type")
                    }.onTapGesture {
                        self.showingAlert.toggle()
                    }.alert(isPresented: $showingAlert) {
                        Alert(title: Text("Are you sure want to channge your acount?"), message: Text(""), primaryButton: .destructive(Text("Confirm")) {
                                print("Deleting...")
                        }, secondaryButton: .cancel())
                    }
                    NavigationLink(destination: UploadAdsView()) {
                        HStack {
                            Image(systemName: "bell.fill")
                                .imageScale(.large)
                                .padding()
                            Text("Notification")
                            Spacer()
                            ZStack {
                                Circle().fill(Color(.red)).frame(width :20, height: 20)
                                Text("2").font(.system(size: 10)).fontWeight(.bold).foregroundColor(.white)
                            }
                        }
                    }
                    NavigationLink(destination: UploadAdsView()) {
                        HStack {
                            Image(systemName: "text.bubble.fill")
                                .imageScale(.large)
                                .padding()
                            Text("Contact with the mangement")
                            Spacer()
                            ZStack {
                                Circle().fill(Color(.red)).frame(width :20, height: 20)
                                Text("2").font(.system(size: 10)).fontWeight(.bold).foregroundColor(.white)
                            }
                        }
                    }
                    Divider()
                    HStack {
                        Image(systemName: "square.and.arrow.up.fill")
                            .foregroundColor(.red)
                            .imageScale(.large)
                            .padding()
                        Text("Logout").foregroundColor(.red)
                    }.onTapGesture {
                        self.showingAlert.toggle()
                    }.alert(isPresented: $showingAlert) {
                        Alert(title: Text("Are you sure want to channge your acount?"), message: Text(""), primaryButton: .destructive(Text("Confirm")) {
                                print("Deleting...")
                        }, secondaryButton: .cancel())
                    }
                }
            }.onAppear { UITableView.appearance().separatorStyle = .none }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
