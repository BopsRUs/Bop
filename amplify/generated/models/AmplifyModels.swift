// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "4b90bd6462e39ade95d028f54d878340"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: Blog.self)
    ModelRegistry.register(modelType: Post.self)
    ModelRegistry.register(modelType: Comment.self)
    ModelRegistry.register(modelType: User.self)
    ModelRegistry.register(modelType: Stocks.self)
  }
}