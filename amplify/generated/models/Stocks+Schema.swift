// swiftlint:disable all
import Amplify
import Foundation

extension Stocks {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case title
    case quantity
    case userID
    case artistID
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let stocks = Stocks.keys
    
    model.pluralName = "Stocks"
    
    model.fields(
      .id(),
      .field(stocks.title, is: .required, ofType: .string),
      .field(stocks.quantity, is: .required, ofType: .string),
      .field(stocks.userID, is: .required, ofType: .string),
      .field(stocks.artistID, is: .required, ofType: .string)
    )
    }
}