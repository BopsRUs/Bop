// swiftlint:disable all
import Amplify
import Foundation

public struct Comment: Model {
  public let id: String
  public var postID: String
  public var content: String
  public var username: String
  public var userID: String
  
  public init(id: String = UUID().uuidString,
      postID: String,
      content: String,
      username: String,
      userID: String) {
      self.id = id
      self.postID = postID
      self.content = content
      self.username = username
      self.userID = userID
  }
}