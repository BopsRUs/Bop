// swiftlint:disable all
import Amplify
import Foundation

extension Stocks {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case name
    case bopid
    case quantity
    case user
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let stocks = Stocks.keys
    
    model.pluralName = "Stocks"
    
    model.fields(
      .id(),
      .field(stocks.name, is: .required, ofType: .string),
      .field(stocks.bopid, is: .required, ofType: .string),
      .field(stocks.quantity, is: .required, ofType: .string),
      .belongsTo(stocks.user, is: .optional, ofType: User.self, targetName: "stocksUserId")
    )
    }
}