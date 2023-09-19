//
//  PersonaView.swift
//  WorkUp4IAM
//
//  Created by Khang Lu Minh on 12/09/2023.
//

import SwiftUI
import Combine

struct TrainingView: View {
    
    var allExercises: [Exercise] = Exercise.top
    @State private var searchText: String = ""
    @State private var filteredExercises: [Exercise] = Exercise.top
    
    var body: some View {
            NavigationView {
                VStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .padding(.leading, 10) // Add padding to the search icon
                            
                        TextField("Search for exercise...", text: $searchText)
                            .textFieldStyle(PlainTextFieldStyle()) // Use plain style
                            .background(Color.white) // Add a background color
                            .padding(.vertical, 10)
                            .onChange(of: searchText) { newValue in
                                filterExercises()
                            }
                            .foregroundColor(.primary)
                            .accentColor(.purple)
                        
                        Button(action: {
                            searchText = ""
                            filterExercises()
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                                .opacity(searchText.isEmpty ? 0 : 1)
                                .frame(width: 20, height: 20) // Increase button size
                        }
                        .padding(.trailing, 10) // Add padding to the clear button
                    }
                    .padding(.horizontal, 16)
                    
                    List(filteredExercises, id: \.id) { ex in
                        CardView(exercise: ex)
                            .listRowBackground(Color.clear)
                    }
                }
                .navigationBarTitle("Exercise List")
                .background(Color.secondaryBackground)
                .edgesIgnoringSafeArea(.bottom)
            }
            .onAppear {
                UITableView.appearance().separatorStyle = .none
            }
        }
        
        private func filterExercises() {
            if searchText.isEmpty {
                filteredExercises = allExercises
            } else {
                filteredExercises = allExercises.filter { ex in
                    ex.name.localizedCaseInsensitiveContains(searchText)
                }
            }
        }
    }

struct CardView: View {
    var exercise: Exercise
    @State private var reps: String = ""

    var body: some View {
        VStack {
            Image(exercise.imageLink)
                .resizable()
                .scaledToFill()
                .frame(height: 150)
                .cornerRadius(16)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.purple, lineWidth: 2)
                )
                .clipped()
            
            VStack(alignment: .leading, spacing: 8) {
                Text(exercise.name)
                    .font(.title2)
                    .bold()
                
                Text(exercise.description)
                    .font(.subheadline)
                    .lineLimit(2)
                    .foregroundColor(.secondary)
                
                HStack {
                    TextField("Reps", text: $reps)
                        .frame(width: 80)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .font(.system(size: 12))
                        .keyboardType(.numberPad)
                        .onSubmit { // Handle the text field submission
                            handleRepsSubmission()
                        }
                    
                    Spacer()
                    
                    Text("Calories: \(calculatedCalories)")
                        .font(.system(size: 14))
                        .bold()
                        .foregroundColor(.purple)
                }
            }
            .padding()
        }
        .background(Color.cardBackground) // Card background color
        .cornerRadius(16)
        .shadow(radius: 2) // Reduced shadow
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
    }
    
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
}


extension Color {
    static let secondaryBackground = Color("SecondaryBackground") // Define your background color
    static let cardBackground = Color("CardBackground") // Define your card background color
}

struct TrainingView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingView()
    }
}

