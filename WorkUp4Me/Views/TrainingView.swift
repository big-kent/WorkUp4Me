/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2023B
 Assessment: Assignment 3
 Author: Lu Minh Khang, Trinh Xuan Khanh, Nguyen Viet Quan, Vo Phuc Duy Nhat, Duong Khoi
 ID: s3863969,
 Created date: 10/09/2023
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
            ZStack{
                LinearGradient(colors: [Color("Mint"), Color("Purple")], startPoint: startAnimation ? .topLeading : .bottomLeading, endPoint: startAnimation ? .bottomTrailing : .topTrailing)
                    .edgesIgnoringSafeArea(.all)
                    .onAppear {
                        withAnimation(.linear(duration: 5.0).repeatForever()) {
                            startAnimation.toggle()
                        }
                    }
            }
            
            // Use a separate ZStack for the content
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

struct TrainingView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingView()
    }
}
