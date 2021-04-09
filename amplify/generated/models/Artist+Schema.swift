// swiftlint:disable all
import Amplify
import Foundation

extension Artist {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case value
    case name
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let artist = Artist.keys
    
    model.pluralName = "Artists"
    
    model.fields(
      .id(),
      .field(artist.value, is: .required, ofType: .double),
      .field(artist.name, is: .required, ofType: .string)
    )
    }
}