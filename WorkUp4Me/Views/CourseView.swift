//
//  CourseView.swift
//  WorkUp4UI
//
//  Created by Võ Phúc Duy Nhật on 14/09/2023.
//

import SwiftUI

struct CourseView: View {
    var body: some View {
        ZStack{
            NavigationBar(title: "Featured")
                .padding(5)
            
            ScrollView{
                FeatureItem()
            }
            .padding(.top, 70)
        }
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView()
    }
}
