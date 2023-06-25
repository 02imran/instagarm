//
//  CompleteSignedUpView.swift
//  Instagram
//
//  Created by md imran on 10/6/23.
//

import SwiftUI

struct CompleteSignedUpView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    var body: some View {
        VStack {
            Text("Welcome to instagram \(viewModel.userName)")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top)
            
            Text("You will use this email to sign in to your account")
                .font(.footnote)
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
                .padding(.top, 1)

            
            
            
            Button {
                Task {
                    try await viewModel.createUser()
                }
            } label: {
                Text("Complete Sign Up")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 44)
                    .foregroundColor(Color.white)
                    .background(Color(.systemBlue))
                    .cornerRadius(8)
            }
            .padding(.vertical) 
            
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.backward")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
                
            }
        }
    }
}

struct CompleteSignedUpView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteSignedUpView()
            .environmentObject(RegistrationViewModel())
    }
}
