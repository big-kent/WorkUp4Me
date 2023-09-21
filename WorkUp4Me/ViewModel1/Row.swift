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

struct Row: View {
    var current: Exercise
    @State var textInput: String = ""
    @State private var updatedCalories: Int = 0
    
    var body: some View {
        HStack {
            Image(current.imageLink)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            VStack(alignment: .leading) {
                Text(current.name)
                    .font(.title)
                    .bold()
                
                Text(current.description)
                    .font(.system(size: 13))
                
                HStack(spacing: 50) {
                    TextField("Number of rebs", text: $textInput)
                        .frame(width: 110)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .font(.system(size: 12))
                        .padding(5)
                        .border(.secondary)
                        .onSubmit {
                            updatedCalories = current.calories * 5
                        }
                    
                    Text("Calories: " + String(updatedCalories))
                        .font(.system(size: 13))
                        .bold()
                }
    
            }
            .frame(width: 290, height: 150)
        }
        .frame(width: .infinity, height: 150, alignment: .leading)
        .padding(.horizontal, 30)
        .overlay(
            Rectangle()
                .frame(height: 2)
                .padding(.horizontal, 50)
                .foregroundColor(.black),
            alignment: .bottom
        )
    }
}

struct Row_Previews: PreviewProvider {
    static var previews: some View {
        Row(current: Exercise.top[0])
    }
}
