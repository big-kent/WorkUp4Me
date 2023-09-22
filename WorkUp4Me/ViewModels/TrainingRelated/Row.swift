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
        ZStack{
            HStack{
                VStack(alignment: .leading, spacing: 0.8) {
                    Spacer()
                    Text(current.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .lineLimit(1)
                    
                    Text(current.description)
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                    
                    HStack(spacing: 50) {
                        TextField("Number of reps", text: $textInput)
                            .frame(width: 110)
                            .padding(5)
                            .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.secondary))
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                            .font(.system(size: 12))
                        
                        Text("Calories: " + String(updatedCalories))
                            .font(.footnote)
                            .bold()
                            .padding(5)
                            .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.secondary))
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(.secondary)
                }
                .padding(.all, 20)
                .padding(.vertical, 20)
                .frame(height: 250)
                .background(.ultraThinMaterial,in:
                                RoundedRectangle(cornerRadius: 30,style: .continuous))
                .shadow(color: Color(.black).opacity(0.3), radius: 10, x: 0, y: 10)
                .padding(.horizontal, 20)
                .frame(width: .infinity, alignment: .leading)
            }
        }
    }
}
struct Row_Previews: PreviewProvider {
    static var previews: some View {
        Row(current: Exercise.top[0])
    }
}

