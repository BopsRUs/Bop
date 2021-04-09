// swiftlint:disable all
import Amplify
import Foundation

extension User {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case name
    case privacy
    case followers
    case following
    case blocked
    case muted
    case email
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let user = User.keys
    
    model.pluralName = "Users"
    
    model.fields(
      .id(),
      .field(user.name, is: .required, ofType: .string),
      .field(user.privacy, is: .required, ofType: .string),
      .field(user.followers, is: .optional, ofType: .embeddedCollection(of: String.self)),
      .field(user.following, is: .optional, ofType: .embeddedCollection(of: String.self)),
      .field(user.blocked, is: .optional, ofType: .embeddedCollection(of: String.self)),
      .field(user.muted, is: .optional, ofType: .embeddedCollection(of: String.self)),
      .field(user.email, is: .required, ofType: .string)
    )
    }
}