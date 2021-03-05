// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "6249b93017c2ecda78fc8f19bf0a1a6c"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: Stocks.self)
    ModelRegistry.register(modelType: User.self)
  }
}