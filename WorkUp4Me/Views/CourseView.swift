//
//  CourseView.swift
//  WorkUp4UI
//
//  Created by Võ Phúc Duy Nhật on 14/09/2023.
//

import SwiftUI

struct CourseView: View {
    @State var hasScrolled = false
    @Namespace var namespace
    @State var show = false
    
    var body: some View {
        ZStack{
            ScrollView{
                FeatureItem()
                
                if !show {
                    CourseItem(namespace: namespace, show: $show)
                        .onTapGesture {
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                show.toggle()
                            }
                        }
                }
            }
        .coordinateSpace(name: "scroll")
        .safeAreaInset(edge: .top, content: {
            Color.clear.frame(height: 70)
        })
        .overlay(
            NavigationBar(title: "Featured")
        )
        
        if show {
            CourseDetailView(namespace: namespace, show: $show)
                    }
                }
        }
    }
struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView()
    }
}
