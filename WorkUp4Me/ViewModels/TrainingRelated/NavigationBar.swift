/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2023B
 Assessment: Assignment 3
 Author: Lu Minh Khang, Trinh Xuan Khanh, Nguyen Viet Quan, Vo Phuc Duy Nhat, Duong Khoi
 ID: s3863969,
 Created date: 10/09/2023
 Last modified: 23/09/2023
 Acknowledgement: None
*/

import SwiftUI

struct NavigationBar: View {
    var title = "" // The title to be displayed in the navigation bar
    
    var body: some View {
        ZStack{
            // Background with a slight blur effect
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
            
            Text(title) // Display the title
                .font(.largeTitle.weight(.bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
        }
        .frame(height: 70) // Set the height of the navigation bar
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(title: "Course") // Preview with a title "Course"
    }
}

