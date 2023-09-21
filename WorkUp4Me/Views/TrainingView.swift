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

import SwiftUI
import Combine

struct TrainingView: View {
    
    var allExercises: [Exercise] = Exercise.top
    @State private var searchText: String = ""
    @State private var selectedCategory: String? = nil // Default to nil (no category selected)
    @State private var isSheetPresented = false
    @State private var selectedExercise: Exercise? = nil
    
    // Create a list of unique categories from allExercises
    var categories: [String] {
        let allCategories = allExercises.map { $0.category }
        return Array(Set(allCategories))
    }
    
    // Computed property to filter exercises based on search text and category
    var filteredExercises: [Exercise] {
        var filtered = allExercises
        
        if !searchText.isEmpty {
            filtered = filtered.filter { ex in
                ex.name.localizedCaseInsensitiveContains(searchText)
            }
        }
        
        if let selectedCategory = selectedCategory, !selectedCategory.isEmpty {
            filtered = filtered.filter { ex in
                ex.category == selectedCategory
            }
        }
        
        return filtered
    }
    
    // Function to filter exercises
    private func filterExercises() {
        // Implement the filterExercises logic here
        // You can copy the code from your previous filterExercises function
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
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
                
                // Add a Picker for category selection
                Picker(selection: $selectedCategory, label: Text("Select Category")) {
                    Text("All").tag(nil as String?) // Include an "All" option
                    ForEach(categories, id: \.self) { category in
                        Text(category).tag(category as String?)
                    }
                }
                .pickerStyle(MenuPickerStyle()) // Dropdown style
                .padding(.horizontal, 16)
                .foregroundColor(.primary) // Text color
                .accentColor(.purple) // Accent color
                
                // Conditional rendering of CardViews based on the filter
                if filteredExercises.isEmpty {
                    Text("No exercises found")
                        .font(.headline)
                        .foregroundColor(.secondary)
                        .padding(.top, 20)
                } else {
                    List(filteredExercises, id: \.id) { ex in
                        CardView(exercise: ex)
                            .listRowBackground(Color.clear) // Transparent list row background
                            .onTapGesture {
                                selectedExercise = ex
                                isSheetPresented.toggle()
                            }
                    }
                }
                
                // Button to present a sheet
                Button(action: {
                    if let firstFilteredExercise = filteredExercises.first {
                        selectedExercise = firstFilteredExercise // Select the first filtered exercise by default
                        isSheetPresented.toggle()
                    }
                }) {
                    Image(systemName: "line.horizontal.3.decrease.circle")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.clear) // Clear background
                        .foregroundColor(.purple) // Text color
                        .cornerRadius(10)
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 20)
                .sheet(isPresented: $isSheetPresented) {
                    if let exercise = selectedExercise {
                        ExerciseDetailsView(exercise: exercise)
                    }
                }
            }
        
            .edgesIgnoringSafeArea(.bottom) // Ignore safe area for full-width background
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .overlay(
                NavigationBar(title: "Training")
            )
        }
        .onAppear {
            UITableView.appearance().separatorStyle = .none // Remove list separators
        }
    }
}

struct ExerciseDetailsView: View {
    var exercise: Exercise
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 16) {
                Image(exercise.imageLink)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                
                Text(exercise.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text(exercise.description)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                
                Divider()
                
                HStack {
                    Text("Category:")
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Spacer()
                    
                    Text(exercise.category)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                HStack {
                    Text("Calories:")
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Spacer()
                    
                    Text("\(exercise.calories)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationBarTitle(exercise.name, displayMode: .inline)
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

