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

struct CourseItem: View {
    var namespace: Namespace.ID
    @Binding var show: Bool
    var body: some View {
        VStack{
            Spacer()
            VStack(alignment: .leading, spacing: 12) {
                Text("SwiftUI")
                    .font(.largeTitle.weight(.bold))
                    .matchedGeometryEffect(id: "title", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("20 Sections - 3 hours".uppercased())
                    .font(.footnote.weight(.semibold))
                    .matchedGeometryEffect(id: "subtitle", in: namespace)
                Text("Build for WorkOut4IU App for iphone 14, 14 pro, 14 promax, ipad 11 and 12.9 inch")
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
            Image("Background 5")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "background", in: namespace)
        )
        .mask(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .matchedGeometryEffect(id: "mask", in: namespace)
        )
        .frame(height: 300)
        .padding(20)    }
}

struct CourseItem_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        CourseItem(namespace: namespace, show: .constant(true))
    }
}
