//
//  UserStateView.swift
//  Instagram
//
//  Created by md imran on 3/6/23.
//

import SwiftUI

struct UserStateView: View {
    let value: Int
    let title: String
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.semibold)
            
            Text(title)
                .font(.footnote)
        }
        .frame(width: 80)
    }
}

struct UserStateView_Previews: PreviewProvider {
    static var previews: some View {
        UserStateView(value: 0, title: "")
    }
}
