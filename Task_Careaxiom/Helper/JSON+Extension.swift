//
//  Json+Extension.swift
//

import Foundation

extension JSONDecoder {
  func decodeModel<T : Decodable>(type:T.Type, str:String?) -> T? {
    
    if str == nil {
      return nil
    }
    
    do {
      return try JSONDecoder().decode(type, from: str!.data(using: .utf8)!)
    } catch {
      print("Decode JSON Catch: \(type) \(error)")
    }
    return nil
  }
}
