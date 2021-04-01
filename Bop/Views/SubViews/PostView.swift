//
//  PostView.swift
//  Bop
//
//  Created by Justin Hurley on 3/31/21.
//

import SwiftUI
class Post {
    var name: String
    var profilePic: Image
    var content: String
    init(name: String){
        self.name = name
        self.content = "Poopy-di scoop Scoop-diddy-whoop Whoop-di-scoop-di-poop Poop-di-scoopty Scoopty-whoop Whoopity-scoop, whoop-poop Poop-diddy, whoop-scoop Poop, poop Scoop-diddy-whoop Whoop-diddy-scoop Whoop-diddy-scoop, poop."
        self.profilePic = Image("obama")
    }
}

struct PostView: View {
    var post: Post
    var body: some View {
        VStack{
            HStack{
                post.profilePic
                    .resizable()
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                Text(post.name)
                Spacer()
            }
            Text(post.content)
                .fontWeight(.light)
            HStack{
                Button {
                    print("Liked")
                } label: {
                    Image(systemName: "heart")
                        .padding(.horizontal)
                }
                Button {
                    print("Comment")
                } label: {
                    Image(systemName: "message")
                        .padding(.horizontal)
                }
                Button {
                    print("Share")
                } label: {
                    Image(systemName: "square.and.arrow.up")
                        .padding(.horizontal)
                }
                Spacer()
                Button {
                    print("Other")
                } label: {
                    Image(systemName: "ellipsis.circle")
                        .padding(.horizontal)
                }
            }
            .padding(.top)
        }
        .padding(.horizontal)
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: Post(name: "Obama"))
    }
}
