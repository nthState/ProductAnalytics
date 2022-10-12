//
//  Copyright © 2022 Chris Davis, https://www.nthState.com
//
//  See LICENSE for license information.
//

import Foundation

public struct Analytics: Decodable {
  
  let categories: [String: [String: SubCategory]]
  
  // MARK: - Constructor
  
  public init(categories: [String: [String: SubCategory]]) {
    self.categories = categories
  }
  
  // MARK: - Decodable
  
  enum CodingKeys: CodingKey {
    case productAnalysis
  }
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.categories = try container.decode([String: [String: SubCategory]].self, forKey: .productAnalysis)
  }
}

public struct SubCategory: Decodable {
  let children: [Child]
  
  // MARK: - Constructor
  
  public init(children: [Child]) {
    self.children = children
  }
  
  // MARK: - Decodable
  
  enum CodingKeys: CodingKey {
    case children
  }

  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.children = try container.decode([Child].self, forKey: .children)
  }
}

public struct Child: Decodable {
  let name: String
  let value: String
}
