//
//  UploadPostView.swift
//  Instagram
//
//  Created by md imran on 10/6/23.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    
    @State private var textField: String = ""
    @State private var imagePickerPresented = false
    @ObservedObject var viewModels = UploadModelViewModel()
    @Binding var selectedTab: Int
    
    var body: some View {
        VStack {
            //Action tool bar
            HStack {
                Button {
                    textField = ""
                    viewModels.postImage = nil
                    viewModels.selectedImage = nil
                    selectedTab = 0
                    
                } label: {
                    Text("Cancel")
                }
                
                Spacer()
                
                Text("New Post")
                    .fontWeight(.semibold)
                Spacer()
                
                Button {
                    print("Upload")
                } label: {
                    Text("Upload")
                }

            }
            .padding(.horizontal)
            
            //post image and caption
            HStack(spacing: 8) {
                if let image = viewModels.postImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                }
                
                TextField("Enter your text", text: $textField, axis: .vertical)
            }
            .padding(.horizontal)
            Spacer()
        }
        .onAppear {
            imagePickerPresented.toggle()
        }
        .photosPicker(isPresented: $imagePickerPresented, selection: $viewModels.selectedImage)
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView(selectedTab: .constant(0))
    }
}
