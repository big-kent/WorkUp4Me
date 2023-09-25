//
//  CardView.swift
//  WorkUp4Me
//
//  Created by Người dùng Khách on 25/09/2023.
//

import SwiftUI

struct CardView: View {
    
    var calculatedCalories: Int {
        if let repsValue = Int(reps) {
            return repsValue * exercise.calories
        } else {
            return 0
        }
    }
    
    func handleRepsSubmission() {
        // Handle text field submission here, if needed
        // For example, you can save the value or perform an action
        print("Reps submitted: \(reps)")
    }
    
    var exercise: Exercise
    @State private var reps: String = ""
    
    var body: some View {
        VStack {
            Image(exercise.imageLink)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .cornerRadius(30)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(exercise.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.linearGradient(colors: [.black, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .lineLimit(1)
                
                Text(exercise.description)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.black)
                
                HStack {
                    TextField("Reps", text: $reps)
                        .border(Color.black, width: 1)
                        .foregroundColor(Color.black)
                        .cornerRadius(10)
                        .frame(width: 80)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .font(.system(size: 12))
                        .keyboardType(.numberPad)
                        .onSubmit {
                            handleRepsSubmission()
                        }
                    
                    Spacer()
                    
                    Text("Calories: \(calculatedCalories)")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                }
            }
            .padding( 20)
        }
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [.white]), // Customize gradient colors here
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .shadow(color: Color(.black).opacity(0.3), radius: 5, x: 0, y: 8)
        )
    }
}

