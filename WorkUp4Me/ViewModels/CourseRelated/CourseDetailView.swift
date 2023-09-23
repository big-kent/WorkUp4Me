//
//  VideoDetailView.swift
//  WorkUp4Me
//
//  Created by Võ Phúc Duy Nhật on 23/09/2023.
//

import SwiftUI

struct CourseDetailView: View {
    
    var video: Video
    @State private var startAnimation: Bool = false
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color("Mint"), Color("Purple")], startPoint: startAnimation ? .topLeading : .bottomLeading, endPoint: startAnimation ? .bottomTrailing : .topTrailing)
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    withAnimation(.linear(duration: 5.0).repeatForever()) {
                        startAnimation.toggle()
                    }
                }
            VStack(spacing: 20){
                Spacer()
                Image(video.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    .cornerRadius(12)
                
                Text(video.title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .padding()
                
                HStack {
                    Label("\(video.viewCount)", systemImage: "eye.fill")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Text(video.uploadDate)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Text(video.description)
                    .font(.body)
                    .padding()
                
                Spacer()
                
                Link(destination: video.url, label: {
                    Text("Watch Now")
                        .bold()
                        .font(.title2)
                        .frame(width: 280, height: 50)
                        .background(Color(.systemRed))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                })
            }
        }
    }
}
struct CourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailView(video: VideoList.topTen.first!)
    }
}
