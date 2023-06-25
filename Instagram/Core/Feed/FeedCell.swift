//
//  FeedCell.swift
//  Instagram
//
//  Created by md imran on 3/6/23.
//

import SwiftUI

struct FeedCell: View {
    
    let post: Post
    
    var body: some View {
        VStack {
            
            HStack {
                if let user = post.user {
                    Image(user.profileImageUrl ?? "")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                }
                
                if let userName = post.user {
                    Text(userName.userName)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                
                Spacer()
            }
            .padding(.leading)
            
            
            
            Image(post.imageUrl)
                .resizable()
                .scaledToFit()
                .frame(width: 400)
                .clipShape(Rectangle())
            
            
            // action button
            
            HStack(spacing: 20) {
                Button {
                    print("like post")
                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                        .foregroundColor(.black)
                }
                
                
                Button {
                    print("Comment on post")
                } label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                        .foregroundColor(.black)
                }
                
                Button {
                    print("share")
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                        .foregroundColor(.black)
                }
                
                Spacer()

            }
            .padding(.leading)
            .padding(.top, 5)
            
            //likes count
            Text("\(post.likes) Likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .padding(.top, 1)
            
            
            // content
            HStack {
                Text("\(post.user?.userName ?? "") ")
                    .font(.footnote)
                    .fontWeight(.semibold)
                +
                Text("This is the right post")
                    .font(.footnote)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
            .padding(.top, 1)
            
            Text("6h")
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .padding(.top, 1)
                .foregroundColor(Color.gray)
            
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(post: Post.MOCK_POST[0])
    }
}
