// swiftlint:disable all
import Amplify
import Foundation

public struct Stocks: Model {
  public let id: String
  public var title: String
  public var quantity: String
  public var userID: String
  public var artistID: String
  
  public init(id: String = UUID().uuidString,
      title: String,
      quantity: String,
      userID: String,
      artistID: String) {
      self.id = id
      self.title = title
      self.quantity = quantity
      self.userID = userID
      self.artistID = artistID
  }
}