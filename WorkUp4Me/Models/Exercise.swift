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
        ),
        Exercise(
            name: "Lunges",
            description: "Lunges target the quadriceps, hamstrings, and glutes, helping to build leg strength and stability.",
            imageLink: "Lunges",
            calories: 15,
            category: "Legs"
        ),
        Exercise(
            name: "Plank",
            description: "Planks are an isometric core exercise that strengthens the abdominal muscles and improves posture.",
            imageLink: "Plank",
            calories: 8,
            category: "Core"
        ),
        Exercise(
            name: "Burpees",
            description: "Burpees are a full-body exercise that combines squats, push-ups, and jumps for an intense workout.",
            imageLink: "Burpees",
            calories: 18,
            category: "Cardio"
        ),
        Exercise(
            name: "Mountain Climbers",
            description: "Mountain Climbers are a cardio exercise that also engages the core, shoulders, and legs.",
            imageLink: "Mountain Climbers",
            calories: 12,
            category: "Cardio"
        ),
        Exercise(
            name: "Bicycle Crunches",
            description: "Bicycle Crunches are an advanced core exercise that target the obliques and rectus abdominis.",
            imageLink: "Bicycle Crunches",
            calories: 10,
            category: "Core"
        ),
        Exercise(
            name: "Leg Press",
            description: "Leg Press is a machine-based exercise that primarily targets the quadriceps and glutes.",
            imageLink: "Leg Press",
            calories: 20,
            category: "Legs"
        ),
        Exercise(
            name: "Push Press",
            description: "Push Press is a compound exercise that works the shoulders, triceps, and upper body.",
            imageLink: "Push Press",
            calories: 22,
            category: "Shoulders"
        ),
        Exercise(
            name: "Russian Twists",
            description: "Russian Twists are a core exercise that targets the obliques and helps improve rotational strength.",
            imageLink: "Russian Twists",
            calories: 10,
            category: "Core"
        ),
        Exercise(
            name: "Seated Row",
            description: "Seated Row is a machine-based exercise that works the upper back and biceps.",
            imageLink: "Seated Row",
            calories: 16,
            category: "Back"
        ),
        Exercise(
            name: "Box Jumps",
            description: "Box Jumps are a plyometric exercise that improves explosive power and lower body strength.",
            imageLink: "Box Jumps",
            calories: 18,
            category: "Legs"
        ),
        Exercise(
            name: "Push-Up Variations",
            description: "Push-Up Variations include different hand positions and stances to target various muscle groups.",
            imageLink: "Push-Up Variations",
            calories: 20,
            category: "Chest and Tricep"
        ),
        Exercise(
            name: "Tricep Dips",
            description: "Tricep Dips primarily target the triceps and are effective for building arm strength.",
            imageLink: "Tricep Dips",
            calories: 12,
            category: "Arms"
        ),
        Exercise(
            name: "Standing Calf Raises",
            description: "Standing Calf Raises strengthen the calf muscles and improve lower leg stability.",
            imageLink: "Standing Calf Raises",
            calories: 10,
            category: "Legs"
        ),
        Exercise(
            name: "Hanging Leg Raises",
            description: "Hanging Leg Raises are an advanced core exercise that targets the lower abs and hip flexors.",
            imageLink: "Hanging Leg Raises",
            calories: 12,
            category: "Core"
        ),
        Exercise(
            name: "Lat Pulldowns",
            description: "Lat Pulldowns are a machine-based exercise that work the upper back and lats.",
            imageLink: "Lat Pulldowns",
            calories: 16,
            category: "Back"
        ),
        Exercise(
            name: "Side Plank",
            description: "Side Plank is a core exercise that targets the obliques and helps improve lateral stability.",
            imageLink: "Side Plank",
            calories: 8,
            category: "Core"
        ),
        Exercise(
            name: "Leg Curls",
            description: "Leg Curls target the hamstrings and are essential for balanced leg development.",
            imageLink: "Leg Curls",
            calories: 14,
            category: "Legs"
        ),
        Exercise(
            name: "Incline Bench Press",
            description: "Incline Bench Press is a variation of the bench press that targets the upper chest muscles.",
            imageLink: "Incline Bench Press",
            calories: 25,
            category: "Chest"
        ),
        Exercise(
            name: "Barbell Rows",
            description: "Barbell Rows are a compound exercise that strengthen the back and biceps.",
            imageLink: "Barbell Rows",
            calories: 22,
            category: "Back"
        )
    ]

}

