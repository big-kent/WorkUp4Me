/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 3
  Author: Lu Minh khang, Trinh Xuan Khanh, Nguyen Viet Quan, Vo Phuc Duy Nhat, Duong Khoi
  ID: s3863969,
  Created  date: 10/09/2023
  Last modified: 23/09/2023
  Acknowledgement: None
*/

import Foundation

struct Exercise: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var imageLink: String
    var calories: Int
    var category: String
    static let top = [
        Exercise (
            name: "Push Up",
            description: "Push Ups build the chest anywhere, anytime. You can vary the position to load the chest or triceps more.",
            imageLink: "Push Up",
            calories: 20,
            category: "Chest and Tricep"
        ),
        Exercise (
            name: "Pull Up",
            description: "Pull Ups strength standards help you to compare your one-rep max lift with other lifters at your bodyweight.",
            imageLink: "Pull Up",
            calories: 10,
            category: "Back"
        ),
        Exercise (
            name: "Squats",
            description: "Squats are a compound exercise that works multiple muscle groups including the quads, hamstrings, glutes, and lower back.",
            imageLink: "Squats",
            calories: 15,
            category: "Legs"
        ),
        Exercise (
            name: "Bench Press",
            description: "The Bench Press is a classic chest exercise that helps develop upper body strength and muscle mass.",
            imageLink: "Bench Press",
            calories: 25,
            category: "Chest"
        ),
        Exercise (
            name: "Deadlift",
            description: "Deadlifts work the lower back, glutes, hamstrings, and other muscles, making it a great overall strength builder.",
            imageLink: "Deadlift",
            calories: 30,
            category: "Back and Legs"
        ),
        Exercise (
            name: "Dumbbell Curl",
            description: "Dumbbell Curls target the biceps and help build arm strength and definition.",
            imageLink: "Dumbbell Curl",
            calories: 8,
            category: "Arms"
        ),
        Exercise (
            name: "Jumping Jacks",
            description: "Jumping Jacks are a simple and effective cardio exercise that also engage the leg and shoulder muscles.",
            imageLink: "Jumping Jacks",
            calories: 14,
            category: "Cardio"
        ),
        Exercise (
            name: "Dips",
            description: "Dips are a compound exercise that primarily works the triceps but also engage the chest and shoulders.",
            imageLink: "Dips",
            calories: 12,
            category: "Chest and Tricep"
        ),
        Exercise (
            name: "Crunches",
            description: "Crunches are an abdominal exercise that help tone and strengthen the core muscles.",
            imageLink: "Crunches",
            calories: 10,
            category: "Core"
        )
    ]

}

