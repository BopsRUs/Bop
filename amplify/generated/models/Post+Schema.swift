// swiftlint:disable all
import Amplify
import Foundation

extension Post {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case title
    case blog
    case comments
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let post = Post.keys
    
    model.pluralName = "Posts"
    
    model.fields(
      .id(),
      .field(post.title, is: .required, ofType: .string),
      .belongsTo(post.blog, is: .optional, ofType: Blog.self, targetName: "blogID"),
      .hasMany(post.comments, is: .optional, ofType: Comment.self, associatedWith: Comment.keys.post)
    )
    }
}