//
//  ProfileView.swift
//  Instagram
//
//  Created by md imran on 3/6/23.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    
    
    
    var posts: [Post] {
        return Post.MOCK_POST.filter({ $0.user?.userName == user.userName })
    }
    
    var body: some View {
        
            ScrollView {
                //MARK: - header
                ProfileHeaderView(user: user)
                
                //MARK: - grid view
                PostGridView(posts: posts)
                
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)

        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.MOCK_USER[0])
    }
}
