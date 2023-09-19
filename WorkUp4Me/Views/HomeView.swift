//
//  HomeView.swift
//  WorkUp4IAM
//
//  Created by Khang Lu Minh on 12/09/2023.
//
// For temperture this homeview is not be used


import SwiftUI

struct HomeView: View {

    var body: some View {
        NavigationView {
            ZStack {
                // Your content here
                Text("Hello, World!")
                    .padding()

                // Bottom navigation bar
                VStack {
                    Spacer()
                    BottomNavigationBar()
                        .background(BlurView())
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct BottomNavigationBar: View {
    var body: some View {
        HStack {
            Spacer()

            // Person
            VStack {
                Button(action: {
                    // Handle the button action here if needed
                }) {
                    NavigationLink(destination: TrainingView()) {
                        VStack{
                            Image(systemName: "person.fill")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                            Text("Person")
                                .font(.caption)
                                .foregroundColor(.white)
                        }
                    }
                }
            }

            Spacer()

            // Course
            VStack {
                Button(action: {
                    // Handle the button action here if needed
                }) {
                    NavigationLink(destination: CourseView()) {
                        VStack{
                            Image(systemName: "book.fill")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                            Text("Course")
                                .font(.caption)
                                .foregroundColor(.white)
                        }
                    }
                }
            }

            Spacer()

            // Session (Paying Content)
            VStack {
                Button(action: {
                    // Handle the button action here if needed
                }) {
                    NavigationLink(destination: SessionView()) {
                        VStack{
                            Image(systemName: "dollarsign.circle.fill")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                            Text("Session")
                                .font(.caption)
                                .foregroundColor(.white)
                        }
                    }
                }
            }

            Spacer()

            // Setting
            VStack {
                Button(action: {
                    // Handle the button action here if needed
                }) {
                    NavigationLink(destination: SettingView()) {
                        VStack{
                            Image(systemName: "gearshape")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                            Text("Setting")
                                .font(.caption)
                                .foregroundColor(.white)
                        }
                    }
                }
            }

            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .background(Color.gray.opacity(0.5))
        .cornerRadius(10)
    }
}

struct BlurView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIVisualEffectView {
        let blurEffect = UIBlurEffect(style: .systemMaterial)
        let blurView = UIVisualEffectView(effect: blurEffect)
        return blurView
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
