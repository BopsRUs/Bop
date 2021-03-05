// swiftlint:disable all
import Amplify
import Foundation

public struct User: Model {
  public let id: String
  public var username: String
  public var email: String?
  public var portfolio: List<Stocks>?
  
  public init(id: String = UUID().uuidString,
      username: String,
      email: String? = nil,
      portfolio: List<Stocks>? = []) {
      self.id = id
      self.username = username
      self.email = email
      self.portfolio = portfolio
  }
}