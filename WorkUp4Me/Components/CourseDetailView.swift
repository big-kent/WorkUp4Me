//
//  CourseDetailView.swift
//  WorkUp4UI
//
//  Created by Võ Phúc Duy Nhật on 15/09/2023.
//

import SwiftUI

struct CourseDetailView: View {
    var namespace: Namespace.ID
    @Binding var show: Bool
    
    var body: some View {
        ScrollView {
            VStack {
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 500)
            .padding(20)
            .foregroundColor(.black)
            .background(
                Image("Background 5")
                    .resizable()
                    .matchedGeometryEffect(id: "background", in: namespace)
            )
            .mask(
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .matchedGeometryEffect(id: "mask", in: namespace)
            )
            .overlay(
                VStack(alignment: .leading, spacing: 12) {
                    Text("Build for WorkOut4IU App for iphone 14, 14 pro, 14 promax, ipad 11 and 12.9 inch")
                        .font(.footnote)
                        .matchedGeometryEffect(id: "text", in: namespace)
                    Text("20 Sections - 3 hours".uppercased())
                        .font(.footnote.weight(.semibold))
                        .matchedGeometryEffect(id: "subtitle", in: namespace)
                    Text("SwiftUI")
                        .font(.largeTitle.weight(.bold))
                        .matchedGeometryEffect(id: "title", in: namespace)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                    .padding(20)
                    .background(
                        Rectangle()
                            .fill(.ultraThinMaterial)
                            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                            .matchedGeometryEffect(id: "blur", in: namespace)
                    )
                    .offset(y: 250)
                    .padding(20)
            )
        }
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        CourseDetailView(namespace: namespace, show: .constant(true))
    }
}
