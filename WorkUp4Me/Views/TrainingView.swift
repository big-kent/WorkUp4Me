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
    @State var show = true
    @Namespace var namespace
    
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
    
    @State private var startAnimation: Bool = false
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color("Mint"), Color("Purple")], startPoint: startAnimation ? .topLeading : .bottomLeading, endPoint: startAnimation ? .bottomTrailing : .topTrailing)
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    withAnimation(.linear(duration: 5.0).repeatForever()) {
                        startAnimation.toggle()
                    }
                }
            
            VStack(spacing: 0) {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.blue)
                        .padding(.leading, 10)
                    TextField("Search for exercise...", text: $searchText)
                        .textFieldStyle(PlainTextFieldStyle())
                        .background(Color.white)
                        .padding(.vertical, 10)
                        .onChange(of: searchText) { newValue in
                            filterExercises()
                        }
                        .foregroundColor(.primary) // Set text color to primary color
                    
                    Button(action: {
                        searchText = ""
                        filterExercises()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                            .opacity(searchText.isEmpty ? 0 : 1)
                            .frame(width: 20, height: 20)
                    }
                }
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.white))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.white))
                .padding()
                
                Picker(selection: $selectedCategory, label: Text("Select Category")) {
                    Text("All").tag(nil as String?)
                    ForEach(categories, id: \.self) { category in
                        Text(category).tag(category as String?)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding(5)
                .foregroundColor(.primary) // Set text color to primary color
                .accentColor(.black) // Set accent color for buttons
                
                if filteredExercises.isEmpty {
                    Text("No exercises found")
                        .font(.headline)
                        .foregroundColor(.secondary)
                        .padding(.top, 20)
                } else {
                    List(filteredExercises, id: \.id) { ex in
                        CardView(exercise: ex)
                            .listRowBackground(Color.clear)
                            .onTapGesture {
                                selectedExercise = ex
                                isSheetPresented.toggle()
                            }
                    }
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 50)
            })
            .overlay(
                NavigationBar(title: "Training")
            )
        }
        .onAppear {
            UITableView.appearance().separatorStyle = .none
        }
    }

}

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

struct TrainingView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingView()
    }
}

