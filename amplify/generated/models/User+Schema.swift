// swiftlint:disable all
import Amplify
import Foundation

extension User {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case username
    case email
    case portfolio
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let user = User.keys
    
    model.pluralName = "Users"
    
    model.fields(
      .id(),
      .field(user.username, is: .required, ofType: .string),
      .field(user.email, is: .optional, ofType: .string),
      .hasMany(user.portfolio, is: .optional, ofType: Stocks.self, associatedWith: Stocks.keys.user)
    )
    }
}