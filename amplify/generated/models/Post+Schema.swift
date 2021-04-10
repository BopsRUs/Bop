// swiftlint:disable all
import Amplify
import Foundation

extension Post {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case title
    case userID
    case content
    case likes
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let post = Post.keys
    
    model.pluralName = "Posts"
    
    model.fields(
      .id(),
      .field(post.title, is: .required, ofType: .string),
      .field(post.userID, is: .required, ofType: .string),
      .field(post.content, is: .required, ofType: .string),
      .field(post.likes, is: .required, ofType: .double)
    )
    }
}