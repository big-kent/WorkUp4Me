//
//  HomeView.swift
//  WorkUp4IAM
//
//  Created by Khang Lu Minh on 12/09/2023.
//
// For temperture this homeview is not be used


import SwiftUI

struct HomeView: View {
    @State private var selectedTab = 0
    @State private var showNavigationBar = false

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                TabView(selection: $selectedTab) {
                    TrainingView()
                        .tabItem {
                            Label("Training", systemImage: "person.fill")
                        }
                        .tag(0)
                    
                    CourseView()
                        .tabItem {
                            Label("Course", systemImage: "book.fill")
                        }
                        .tag(1)
                    
                    SessionView()
                        .tabItem {
                            Label("Session", systemImage: "dollarsign.circle.fill")
                        }
                        .tag(2)
                    
                    SettingView()
                        .tabItem {
                            Label("Setting", systemImage: "gearshape")
                        }
                        .tag(3)
                }
                .accentColor(selectedTab == 2 ? .blue : .white)
                
                Spacer()
            }
            .background(selectedTab == 2 ? Color.blue : Color.clear)
            .cornerRadius(10)
            
            if showNavigationBar {
                RoundedRectangle(cornerRadius: 0)
                    .fill(Color.gray) // Set the background color to gray
                    .frame(height: 44) // Adjust the height as needed
                    .overlay(
                        HStack {
                            Button(action: {
                                selectedTab = 0
                            }) {
                                Image(systemName: "person.fill")
                                    .font(.system(size: 20))
                                    .foregroundColor(selectedTab == 0 ? .blue : .white)
                            }
                            Spacer()
                            Button(action: {
                                selectedTab = 1
                            }) {
                                Image(systemName: "book.fill")
                                    .font(.system(size: 20))
                                    .foregroundColor(selectedTab == 1 ? .blue : .white)
                            }
                            Spacer()
                            Button(action: {
                                selectedTab = 2
                            }) {
                                Image(systemName: "dollarsign.circle.fill")
                                    .font(.system(size: 20))
                                    .foregroundColor(selectedTab == 2 ? .blue : .white)
                            }
                            Spacer()
                            Button(action: {
                                selectedTab = 3
                            }) {
                                Image(systemName: "gearshape")
                                    .font(.system(size: 20))
                                    .foregroundColor(selectedTab == 3 ? .blue : .white)
                            }
                        }
                        .padding(.horizontal, 20)
                    )
                    .onAppear {
                        showNavigationBar = true
                    }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
