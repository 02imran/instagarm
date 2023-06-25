//
//  CreatePasswordView.swift
//  Instagram
//
//  Created by md imran on 4/6/23.
//

import SwiftUI

struct CreatePasswordView: View {
    @EnvironmentObject var viewModel: RegistrationViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Add Your Password")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top)
            
            Text("You will use this email to sign in to your account")
                .font(.footnote)
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
                .padding(.top, 1)
            
            
            TextField("Enter Your Password", text: $viewModel.password)
                .textInputAutocapitalization(.none)
                .modifier(IgTextFieldModifier())
            
            
            NavigationLink {
                CompleteSignedUpView()
                    .navigationBarBackButtonHidden()
            } label: {
                Text("Next")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 44)
                    .foregroundColor(Color.white)
                    .background(Color(.systemBlue))
                    .cornerRadius(8)
            }
            .padding(.top)
            
          
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

struct CreatePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePasswordView()
            .environmentObject(RegistrationViewModel())
    }
}
