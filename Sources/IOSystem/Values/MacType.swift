//
//  MacType.swift
//  
//
//  Created by Kevin Waltz on 04.05.23.
//

import Foundation

public enum MacType: String {
    case iMac,
         macMini,
         macPro,
         macBook,
         macBookAir,
         macBookPro
    
    case unknown
    
    
    public var name: String {
        switch self {
        case .unknown: return "Unknown"
        case .iMac: return "iMac"
        case .macMini: return "Mac Mini"
        case .macPro: return "Mac Pro"
        case .macBook: return "MacBook"
        case .macBookAir: return "MacBook Air"
        case .macBookPro: return "MacBook Pro"
        }
    }
}
