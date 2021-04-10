// swiftlint:disable all
import Amplify
import Foundation

public struct User: Model {
  public let id: String
  public var name: String
  public var privacy: String
  public var followers: [String]?
  public var following: [String]?
  public var blocked: [String]?
  public var muted: [String]?
  public var email: String
  
  public init(id: String = UUID().uuidString,
      name: String,
      privacy: String,
      followers: [String]? = [],
      following: [String]? = [],
      blocked: [String]? = [],
      muted: [String]? = [],
      email: String) {
      self.id = id
      self.name = name
      self.privacy = privacy
      self.followers = followers
      self.following = following
      self.blocked = blocked
      self.muted = muted
      self.email = email
  }
}