//
//  Copyright © 2022 Chris Davis, https://www.nthState.com
//
//  See LICENSE for license information.
//

import Foundation
import OSLog

class DataFetcher {
  
  private let logger = Logger(subsystem: subsystem, category: "Calculate")
  
  func fetch(with configuration: Configuration) async throws -> Analytics {
    
    let url: URL
    if let overrideURL = configuration.jsonURL {
      logger.log("Using JSON override URL: \(overrideURL)")
      url = overrideURL
    } else {
      logger.log("Calling API to fetch JSON")
      url = URL(string: "https://raw.githubusercontent.com/nthState/ProductAnalysis/main/Tests/ProductAnalysisCoreTests/Resources/ExampleProductKeys.json")!
    }
    
    return try await fetchAnalytics(url: url)
  }
  
}

extension DataFetcher {
  
  internal func fetchAnalytics(url: URL) async throws -> Analytics {
    
    let result: Analytics
    do {
      let (data, _) = try await URLSession.shared.data(from: url)
      result = try JSONDecoder().decode(Analytics.self, from: data)
    } catch let error {
      logger.error("fetch Analytics error: \(error.localizedDescription, privacy: .public)")
      throw error
    }
    
    return result
  }
}