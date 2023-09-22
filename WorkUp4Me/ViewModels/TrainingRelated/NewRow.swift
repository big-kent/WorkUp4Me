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

struct NewRow: View {
    var namespace: Namespace.ID
    var exercise: Exercise
    @Binding var show: Bool
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                VStack(alignment: .leading, spacing: 12) {
                    Text(exercise.name)
                        .font(.largeTitle.weight(.bold))
                        .matchedGeometryEffect(id: "title", in: namespace)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(exercise.category.uppercased())
                        .font(.footnote.weight(.semibold))
                        .matchedGeometryEffect(id: "subtitle", in: namespace)
                    Text(exercise.description)
                        .font(.footnote)
                        .matchedGeometryEffect(id: "text", in: namespace)
                }
                .padding(20)
                .background(
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                        .blur(radius: 30)
                        .matchedGeometryEffect(id: "blur", in: namespace)
                )
            }
            .foregroundColor(.white)
            .background(
                Image(exercise.imageLink)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .matchedGeometryEffect(id: "background", in: namespace)
            )
            .mask(
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .matchedGeometryEffect(id: "mask", in: namespace)
            )
            .frame(height: 250)
            .padding(20)
        }
    }
}

struct NewRow_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        NewRow(namespace: namespace, exercise: Exercise.top[0], show: .constant(true))
    }
}
