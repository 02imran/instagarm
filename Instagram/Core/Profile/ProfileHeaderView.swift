//
//  ProfileHeaderView.swift
//  Instagram
//
//  Created by md imran on 10/6/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    var body: some View {
        VStack(spacing: 10) {
            //MARK: - pic and state
            HStack {
                Image(user.profileImageUrl ?? "")
                    .resizable()
//                        .scaledToFit()
                    .frame(width: 80, height: 60)
                    .clipShape(Circle())
                
                Spacer()
                
                HStack {
                    UserStateView(value: 3, title: "Posts")
                    
                    UserStateView(value: 3, title: "Follower")
                    
                    UserStateView(value: 3, title: "Following")
                    
                }
            }
            .padding(.horizontal)
            .padding(.bottom,  4)
            
            //MARK: - name & bio
            VStack(alignment: .leading, spacing: 5) {
                if let fullName = user.fullName {
                    Text(fullName)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                
                if let bio = user.bio {
                    Text(bio)
                        .font(.footnote)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            //MARK: - action button
            Button {
                
            } label: {
                Text(user.currentUser ? "Edit Profile": "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray, lineWidth: 1)
                    
                    )
            }
            
            Divider()

        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: User.MOCK_USER[0])
    }
}
