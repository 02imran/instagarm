//
//  CurrentProfileView.swift
//  Instagram
//
//  Created by md imran on 10/6/23.
//

import SwiftUI

struct CurrentProfileView: View {
    let user: User
    var posts: [Post] {
        return Post.MOCK_POST.filter({ $0.user?.userName == user.userName })
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                //MARK: - header
                ProfileHeaderView(user: user)
                
                //MARK: - grid view
                PostGridView(posts: posts)
                
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        AuthServices.shared.logOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(Color.black)
                    }

                }
            }
        }
    }
}

struct CurrentProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentProfileView(user: User.MOCK_USER[0])
    }
}
