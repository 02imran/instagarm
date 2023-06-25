//
//  IgTextFieldModifier.swift
//  Instagram
//
//  Created by md imran on 4/6/23.
//

import SwiftUI

struct IgTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
}
