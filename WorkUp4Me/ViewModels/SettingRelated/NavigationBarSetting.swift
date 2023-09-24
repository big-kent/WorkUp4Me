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

struct NavigationBarSetting: View {
    var title = ""
    var image = ""
    var body: some View {
            ZStack{
                Color.clear
                    .background(.ultraThinMaterial)
                    .blur(radius: 10)
                HStack{
                    Text(title)
                        .font(.largeTitle.weight(.bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 20)
                    Spacer()
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 50, maxHeight: 50)
                        .cornerRadius(25)
                        .padding()
                }
            }
                .frame(height: 70)
                .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct NavigationBarSetting_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarSetting(title: "Course",image: "profile")
    }
}
