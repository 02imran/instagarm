//
//  MainTabView.swift
//  Instagram
//
//  Created by md imran on 23/5/23.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var selectedIndex = 0
    let user: User
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            FeedView()
                .onAppear {
                    selectedIndex = 0
                }
                .tabItem {
                    Image(systemName: "house")
                        .padding(.top, 10)
                }.tag(0)
            
            SearchView()
                .onAppear {
                    selectedIndex = 1
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                        .padding(.top, 10)
                }
                .tag(1)
            
            UploadPostView(selectedTab: $selectedIndex)
                .onAppear {
                    selectedIndex = 2
                }
                .tabItem {
                    Image(systemName: "plus.square")
                        .padding(.top, 10)
                }
                .tag(2)
            
            
            Text("Notification")
                .onAppear {
                    selectedIndex = 3
                }
                .tabItem {
                    Image(systemName: "heart")
                        .padding(.top, 10)
                }
                .tag(3)
            
            CurrentProfileView(user: user)
                .onAppear {
                    selectedIndex = 4
                }
                .tabItem {
                    Image(systemName: "person")
                        .padding(.top, 10)
                }
                .tag(4)
        }
        
        .accentColor(Color.black)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(user: User.MOCK_USER[0])
    }
}
