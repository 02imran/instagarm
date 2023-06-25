//
//  CreateUserNameView.swift
//  Instagram
//
//  Created by md imran on 4/6/23.
//

import SwiftUI

struct CreateUserNameView: View {
    
    @EnvironmentObject var viewModel: RegistrationViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Add Your User Name")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top)
            
            Text("You will use this email to sign in to your account")
                .font(.footnote)
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
                .padding(.top, 1)
            
            
            TextField("Enter Your UserName", text: $viewModel.userName)
                .textInputAutocapitalization(.none)
                .modifier(IgTextFieldModifier())
            
            
            NavigationLink {
                CreatePasswordView()
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

struct CreateUserNameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateUserNameView()
            .environmentObject(RegistrationViewModel())
    }
}
