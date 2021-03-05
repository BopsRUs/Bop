// swiftlint:disable all
import Amplify
import Foundation

public struct Stocks: Model {
  public let id: String
  public var name: String
  public var bopid: String
  public var quantity: String
  public var user: User?
  
  public init(id: String = UUID().uuidString,
      name: String,
      bopid: String,
      quantity: String,
      user: User? = nil) {
      self.id = id
      self.name = name
      self.bopid = bopid
      self.quantity = quantity
      self.user = user
  }
}