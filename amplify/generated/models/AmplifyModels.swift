// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "9bb781cea3d55199543e2200fd4b4de2"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: Todo.self)
    ModelRegistry.register(modelType: Post.self)
    ModelRegistry.register(modelType: Comment.self)
    ModelRegistry.register(modelType: User.self)
    ModelRegistry.register(modelType: Stocks.self)
    ModelRegistry.register(modelType: Artist.self)
  }
}