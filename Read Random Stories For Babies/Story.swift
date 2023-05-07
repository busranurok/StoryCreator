//
//  History.swift
//  Read Random Stories For Babies
//
//  Created by BusranurOK on 5.10.2022.
//

import Foundation
import UIKit

class Story {
    
    var storyId: Int?
    var storyName: String?
    var storyAuthor: String?
    var storyContent: String?
    var storyImage: UIImage?
    
    init() {}
    
    init(storyId: Int, storyName: String, storyAuthor: String?, storyContent: String, storyImage: UIImage) {
        
        self.storyId = storyId
        self.storyName = storyName
        self.storyAuthor = storyAuthor
        self.storyContent = storyContent
        self.storyImage = storyImage
        
    }
    
}
