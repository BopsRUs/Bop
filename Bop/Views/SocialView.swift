//
//  SocialView.swift
//  Bop
//
//  Created by Justin Hurley on 2/17/21.
//

import SwiftUI
var posts = [""]
struct SocialView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVStack{
                    //loop generates the feed that shows a person's portfolio
                    ForEach(posts, id: \.self){ value in
                        let post = Post(name: "Obama")
                        PostView(post: post)
                    }
                }
                .navigationBarTitle("Social")
            }
        }
    }
}

struct SocialView_Previews: PreviewProvider {
    static var previews: some View {
        SocialView()
    }
}
