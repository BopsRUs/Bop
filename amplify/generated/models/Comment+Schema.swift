// swiftlint:disable all
import Amplify
import Foundation

extension Comment {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case postID
    case content
    case username
    case userID
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let comment = Comment.keys
    
    model.pluralName = "Comments"
    
    model.fields(
      .id(),
      .field(comment.postID, is: .required, ofType: .string),
      .field(comment.content, is: .required, ofType: .string),
      .field(comment.username, is: .required, ofType: .string),
      .field(comment.userID, is: .required, ofType: .string)
    )
    }
}