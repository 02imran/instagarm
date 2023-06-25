//
//  AddEmailView.swift
//  Instagram
//
//  Created by md imran on 4/6/23.
//

import SwiftUI

struct AddEmailView: View {
    
    @State private var email: String = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    var body: some View {
        VStack {
            Text("Add Your Email")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top)
            
            Text("You will use this email to sign in to your account")
                .font(.footnote)
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
                .padding(.top, 1)
            
            
            TextField("Enter Your Email", text: $viewModel.email)
                .textInputAutocapitalization(.none)
                .modifier(IgTextFieldModifier())
            
            
            
            NavigationLink {
                CreateUserNameView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                Text("Next")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 44)
                    .foregroundColor(Color.white)
                    .background(Color(.systemBlue))
                    .cornerRadius(8)
            }
            .padding(.vertical)
            Button {
                print("Save button called")
            } label: {
                
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

struct AddEmailView_Previews: PreviewProvider {
    static var previews: some View {
        AddEmailView()
            .environmentObject(RegistrationViewModel())
    }
}
