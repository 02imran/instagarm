//
//  PostGridView.swift
//  Instagram
//
//  Created by md imran on 10/6/23.
//

import SwiftUI

struct PostGridView: View {
    
    private let gridItem: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    @State var imageDimantion: CGFloat = (UIScreen.main.bounds.width / 3) - 1
    var posts: [Post]
    
    var body: some View {
        LazyVGrid(columns: gridItem, spacing: 2) {
            ForEach(posts) { post in
                Image(post.imageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageDimantion, height: imageDimantion)
                    .clipped()
            }
        }
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView(posts: Post.MOCK_POST)
    }
}
