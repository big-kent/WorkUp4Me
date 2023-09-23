//
//  CourseListView.swift
//  WorkUp4Me
//
//  Created by Võ Phúc Duy Nhật on 23/09/2023.
//

import SwiftUI

struct CourseListView: View {
    
    var video: [Video] = VideoList.topTen
    
    var body: some View {
        NavigationView {
            List(video, id: \.id) { video in
                HStack {
                    Image(video.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 70)
                        .cornerRadius(4)
                        .padding(.vertical, 10)
                    
                    VStack(alignment: .leading, spacing: 5){
                        Text(video.title)
                            .fontWeight(.semibold)
                            .lineLimit(2)
                            .minimumScaleFactor(0.5)
                        
                        Text(video.uploadDate)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
    }
}
struct CourseListView_Previews: PreviewProvider {
    static var previews: some View {
        CourseListView()
    }
}
