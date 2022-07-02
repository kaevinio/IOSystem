//
//  TextView.swift
//  IOSystemExample
//
//  Created by Kevin Waltz on 02.07.22.
//

import SwiftUI

struct TextView: View {
    
    var body: some View {
        HStack {
            Text(header)
                .font(.system(size: 16, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(info)
                .font(.system(size: 16))
        }
    }
    
    
    
    // MARK: - Variables
    
    let header: String
    let info: String
    
}
