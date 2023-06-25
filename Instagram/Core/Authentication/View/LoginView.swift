//
//  LoginView.swift
//  Instagram
//
//  Created by md imran on 4/6/23.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var ViewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                //logo image
                Image("instagram")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                
                
                VStack {
                    TextField("Enter Your Email", text: $ViewModel.email)
                        .textInputAutocapitalization(.none)
                        .modifier(IgTextFieldModifier())
                    
                    
                    SecureField("Enter Your Password", text: $ViewModel.password)
                        .modifier(IgTextFieldModifier())
                }
                
                Button {
                    print("forgot pass called")
                } label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.horizontal, 24)
                        
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Button {
                    Task {
                        try await ViewModel.signIn()
                    }
                } label: {
                    Text("Login")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 44)
                        .foregroundColor(Color.white)
                        .background(Color(.systemBlue))
                        .cornerRadius(8)
                }
                .padding(.vertical)
                
                
                HStack {
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40 , height: 0.5)
                    
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40 , height: 0.5)
                        
                }
                .foregroundColor(Color.gray)
                
                HStack {
                    Image("facebook")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                    
                    Text("Continue with facebook")
                        .font(.footnote)
                        .foregroundColor(Color(.systemBlue))
                        
                }
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    AddEmailView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 4) {
                        Text("Don'n have an account?")
                            .font(.footnote)
                            .foregroundColor(Color(.systemBlue))
                        
                        Text("Sign Up")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(.systemBlue))
                    }
                    .padding(.vertical)
                }


            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
