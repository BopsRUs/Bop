// swiftlint:disable all
import Amplify
import Foundation

public struct Artist: Model {
  public let id: String
  public var value: Double
  public var name: String
  
  public init(id: String = UUID().uuidString,
      value: Double,
      name: String) {
      self.id = id
      self.value = value
      self.name = name
  }
}