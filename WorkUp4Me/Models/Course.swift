//
//  Course.swift
//  WorkUp4Me
//
//  Created by Võ Phúc Duy Nhật on 23/09/2023.
//

import Foundation

struct Course {
    let title: String
    let subtitle: String
    let description: String
    let duration: String
    let image: String // The name of the image asset
}

// Create some sample course data
let sampleCourse = Course(
    title: "Yoga",
    subtitle: "20 Sections - 3 hours",
    description: "Build for WorkOut4IU App for iPhone 14, 14 pro, 14 promax, iPad 11 and 12.9 inch",
    duration: "3 hours",
    image: "Background 5" // Make sure this matches your image asset name
)
