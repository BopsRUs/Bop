// swiftlint:disable all
import Amplify
import Foundation

public struct Post: Model {
  public let id: String
  public var title: String
  public var userID: String
  public var content: String
  public var likes: Double
  
  public init(id: String = UUID().uuidString,
      title: String,
      userID: String,
      content: String,
      likes: Double) {
      self.id = id
      self.title = title
      self.userID = userID
      self.content = content
      self.likes = likes
  }
}