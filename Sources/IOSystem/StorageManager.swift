//
//  File.swift
//  
//
//  Created by Kevin Waltz on 04.07.22.
//

import Foundation

public class StorageManager {
    // MARK: - Values in GB (GigaBytes)
    
    public static var totalDiskSpaceInGB: Double {
        Units(bytes: totalDiskSpaceInBytes).gigabytes
    }
    
    public static var usedDiskSpaceInGB: Double {
        Units(bytes: usedDiskSpaceInBytes).gigabytes
    }
    
    public static var freeDiskSpaceInGB: Double {
        Units(bytes: freeDiskSpaceInBytes).gigabytes
    }
}

fileprivate extension StorageManager {
    static var totalDiskSpaceInBytes: Int64 {
        guard let systemAttributes = try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory() as String), let space = (systemAttributes[FileAttributeKey.systemSize] as? NSNumber)?.int64Value else { return 0 }
        return space
    }
    
    static var usedDiskSpaceInBytes: Int64 {
       totalDiskSpaceInBytes - freeDiskSpaceInBytes
    }
    
    static var freeDiskSpaceInBytes: Int64 {
        (try? URL(fileURLWithPath: NSHomeDirectory() as String).resourceValues(forKeys: [URLResourceKey.volumeAvailableCapacityForImportantUsageKey]).volumeAvailableCapacityForImportantUsage) ?? 0
    }
}

fileprivate struct Units {
    init(bytes: Int64) {
        self.bytes = bytes
    }
    
    let bytes: Int64
    
    var kilobytes: Double {
        return (Double(bytes) / 1_024)
    }
    
    var megabytes: Double {
        return (kilobytes / 1_024  * 100).rounded() / 100
    }
    
    var gigabytes: Double {
        return (megabytes / 1_024  * 100).rounded() / 100
    }
}
