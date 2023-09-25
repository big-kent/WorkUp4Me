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

struct CourseView: View {
    var video: [Video] = VideoList.topTen
    @State private var startAnimation: Bool = false

    var body: some View {
        NavigationView {
            List(video, id: \.id) { video in
                NavigationLink(
                    destination: CourseDetailView(video: video),
                    label: {
                        HStack {
                            Image(video.imageName)
                                .resizable()
                                .frame(width: 110, height: 80) // Set a fixed size
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
                    })
            }
            .coordinateSpace(name: "scroll")
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 60)
            })
            .overlay(
                NavigationBar(title: "Course")
            )
            .listStyle(PlainListStyle()) // Use PlainListStyle
            .background(LinearGradient(colors: [Color("Mint"), Color("Purple")], startPoint: startAnimation ? .topLeading : .bottomLeading, endPoint: startAnimation ? .bottomTrailing : .topTrailing)
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    withAnimation(.linear(duration: 5.0).repeatForever()) {
                        startAnimation.toggle()
                    }
                }
            ) // Set the background color of the List to red
        }
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView()
    }
}
