//
//  MacSize.swift
//  
//
//  Created by Kevin Waltz on 04.05.23.
//

import Foundation

public enum MacSize: Int, Comparable {
    case unknown = 0
    
    case screen11Inch,
         screen12Inch,
         screen13Inch,
         screen14Inch,
         screen15Inch,
         screen16Inch,
         screen17Inch,
         screen20Inch,
         screen21_5Inch,
         screen24Inch,
         screen27Inch
    
    
    var title: String {
        switch self {
        case .unknown: return "-"
        case .screen11Inch: return "11\""
        case .screen12Inch: return "12\""
        case .screen13Inch: return "13\""
        case .screen14Inch: return "14\""
        case .screen15Inch: return "15\""
        case .screen16Inch: return "16\""
        case .screen17Inch: return "17\""
        case .screen20Inch: return "20\""
        case .screen21_5Inch: return "21.5\""
        case .screen24Inch: return "24\""
        case .screen27Inch: return "27\""
        }
    }
}

public func <(lhs: MacSize, rhs: MacSize) -> Bool {
    return lhs.rawValue < rhs.rawValue
}

public func ==(lhs: MacSize, rhs: MacSize) -> Bool {
    return lhs.rawValue == rhs.rawValue
}
