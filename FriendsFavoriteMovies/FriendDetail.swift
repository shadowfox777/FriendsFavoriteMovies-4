//
//  FriendDetail.swift
//  FriendsFavoriteMovies
//
//  Created by MacBook Air on 11/05/24.
//

import SwiftUI
import SwiftData

struct FriendDetail: View {
    @Bindable var friend:Friend
    let isNew: Bool
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @Query(sort: \Movie.title) private var movies:[Movie]
    
    init(friend: Friend, isNew: Bool = false){
        self.friend = friend
        self.isNew = isNew
    }
    
    var body: some View {
        Form{
            TextField("Name", text:$friend.name)
                .autocorrectionDisabled()
            
            Picker("Favorite Movie",selection: $friend.favoriteMovie){
                Text("None")
                    .tag(nil as Movie?)
                
                ForEach(movies){ movie in
                    Text(movie.title)
                        .tag(movie as Movie?)
                }
            }
        }
        .navigationTitle(isNew ? "New Friend" :"Friend")
        .toolbar{
            if isNew{
                ToolbarItem(placement: .confirmationAction){
                    Button("Done"){
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .cancellationAction){
                    Button("Cancel"){
                        modelContext.delete(friend)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        FriendDetail(friend: SampleData.shared.friend)
        
    }
    .modelContainer(SampleData.shared.modelContainer)
}

#Preview("New Friend"){
    NavigationStack{
        FriendDetail(friend: SampleData.shared.friend, isNew:true)
            .navigationBarTitleDisplayMode(.inline)
    }
    .modelContainer(SampleData.shared.modelContainer)
}
