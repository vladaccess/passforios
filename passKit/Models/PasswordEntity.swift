//
//  PasswordEntity.swift
//  pass
//
//  Created by Mingshen Sun on 11/2/2017.
//  Copyright © 2017 Bob Sun. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

extension PasswordEntity {
    
    public var nameWithCategory: String {
        get {
            if let p = path, p.hasSuffix(".gpg") {
                return String(p.prefix(upTo: p.index(p.endIndex, offsetBy: -4)))
            } else {
                return ""
            }
        }
    }
    
    public func getCategoryText() -> String {
        return getCategoryArray().joined(separator: " > ")
    }
    
    public func getCategoryArray() -> [String] {
        var parentEntity = parent
        var passwordCategoryArray: [String] = []
        while parentEntity != nil {
            passwordCategoryArray.append(parentEntity!.name!)
            parentEntity = parentEntity!.parent
        }
        passwordCategoryArray.reverse()
        return passwordCategoryArray
    }
    
    public func getURL() -> URL? {
        if let p = path {
            return URL(string: p.stringByAddingPercentEncodingForRFC3986()!)
        }
        return nil
    }
}
