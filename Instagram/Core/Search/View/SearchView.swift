//
//  SearchView.swift
//  Instagram
//
//  Created by md imran on 4/6/23.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.user) { data in
                        NavigationLink(value: data) {
                            HStack {
                                Image(systemName: "person.circle")
                                    .resizable()
                                    .foregroundColor(.gray )
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                
                                VStack(alignment: .leading) {
                                    Text(data.userName)
                                        .font(.footnote)
                                        .fontWeight(.semibold)
                                    
                                    
                                    Text(data.fullName ?? "")
                                        .font(.footnote)
                                    
                                    
                                        
                                }
                                Spacer()
                            }
                            .foregroundColor(Color.black)
                            .padding(.leading)
                        }
                    }
                }
                .searchable(text: $searchText, prompt: "Search")
            }
            .navigationDestination(for: User.self, destination: { data in
                ProfileView(user: data)
            })
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
