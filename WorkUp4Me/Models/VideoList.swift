//
//  VideoList.swift
//  WorkUp4Me
//
//  Created by Võ Phúc Duy Nhật on 23/09/2023.
//

import SwiftUI

struct Video {
    let id = UUID()
    let imageName: String
    let title: String
    let description: String
    let viewCount: Int
    let uploadDate: String
    let url: URL
}

struct VideoList {
    
    static let topTen = [
        Video(imageName: "yoga",
              title: "Beginner Yoga Classes",
              description: "Welcome to our Beginner Yoga Class, a nurturing space where you can begin or refresh your yoga journey. Our experienced instructors will guide you through foundational postures, breathing techniques, and relaxation practices to enhance flexibility, strength, and inner peace. All levels are welcome, and we can't wait to start this wellness journey with you!",
              viewCount: 1380021,
              uploadDate: "July 21, 2022",
              url: URL(string: "https://www.youtube.com/watch?v=B4kNiCWTl7M")!),
        
        Video(imageName: "run",
              title: "Beginner Running Classes",
              description: "Welcome to our Beginner Running Classes! Discover the joy of running with our supportive community. Our experienced coaches will help you build endurance, improve technique, and set achievable goals. Join us at our scenic trail location and experience the physical and mental benefits of regular running. Whether you're a complete beginner or aiming to boost your fitness, we're here to guide you. Take the first step towards a fitter, more active you!",
              viewCount: 1075112,
              uploadDate: "November 30, 2019",
              url: URL(string: "https://www.youtube.com/watch?v=kVnyY17VS9Y")!),
        
        Video(imageName: "bicycle",
              title: "Beginner Bicycle Classes",
              description: "IWelcome to Beginner Bicycle Adventures! Ready to pedal your way to a healthier, more active lifestyle? Our classes are the perfect starting point for anyone looking to learn or revisit the joys of cycling. Whether you're brand new to biking or need a refresher, our skilled instructors will guide you through the essentials. You'll gain confidence in bike handling, improve your cycling technique, and explore scenic routes. Join us and embark on a fun and fulfilling journey toward becoming a confident cyclist!",
              viewCount: 275552,
              uploadDate: "March 22, 2021",
              url: URL(string: "https://www.youtube.com/watch?v=fQqndzvURAU")!),
              
        Video(imageName: "erobic",
              title: "Beginner Erobic Classes",
              description: "Welcome to our Beginner Aerobic Classes! Are you ready to dance, move, and get fit in a fun and energetic way? Our classes are designed for beginners eager to kickstart their fitness journey. Led by passionate instructors, you'll groove to upbeat music, improve cardiovascular health, and boost your stamina. No prior experience is needed – we'll guide you through every step. Join us and let's begin your exciting journey to a healthier, happier you!",
              viewCount: 269974,
              uploadDate: "August 17, 2017",
              url: URL(string: "https://www.youtube.com/watch?v=NmWp-ScJPBk")!),
        
        Video(imageName: "body",
              title: "Full Body Course",
              description: "Welcome to our Introductory Full-Body Course! Get ready to embark on a holistic journey to improve your overall fitness and well-being. This course is designed for individuals of all levels, providing a comprehensive approach to strengthening and toning every muscle group. Our expert instructors will guide you through a variety of exercises, helping you build strength, increase flexibility, and enhance your posture. Join us to kickstart your path to a healthier, more balanced you!",
              viewCount: 272475,
              uploadDate: "February 7, 2017",
              url: URL(string: "https://www.youtube.com/watch?v=-4tcxwM4dP4")!),
        
        Video(imageName: "gym",
              title: "Beginner Gym Course",
              description: "Welcome to our Beginner Gym Classes! Ready to take your first steps towards a healthier, stronger you? Our classes are the perfect starting point for gym newcomers. Our experienced trainers will introduce you to the gym environment, guide you through basic exercises, and provide valuable fitness tips. Whether you're looking to build muscle, improve endurance, or simply get in shape, we've got you covered. Join us to kickstart your fitness journey and discover the benefits of a regular gym routine!",
              viewCount: 82619,
              uploadDate: "January 1, 2022",
              url: URL(string: "https://www.youtube.com/watch?v=7pAwqH39XXs")!),
        
        Video(imageName: "boxing",
              title: "Beginner Boxing Classes",
              description: "Welcome to our Introductory Beginner Boxing Classes! Are you ready to step into the ring and unleash your inner fighter? Our classes are tailored for beginners, offering a safe and supportive environment to learn the art of boxing. Led by experienced coaches, you'll master the fundamentals of footwork, punching techniques, and defensive skills. No prior experience is required – we'll provide the gloves and guidance you need. Join us and embark on a thrilling journey to build strength, boost confidence, and discover the incredible world of boxing!",
              viewCount: 9766913,
              uploadDate: "March 1, 2017",
              url: URL(string: "https://www.youtube.com/watch?v=LjeJmHg_S4A")!),
        
        Video(imageName: "Ballet",
              title: "Beginner Ballet Classes",
              description: "Welcome to our Introductory Beginner Ballet Classes! If you've ever dreamed of dancing gracefully on your toes, these classes are your starting point. Our expert instructors will introduce you to the enchanting world of ballet, focusing on building a strong foundation of technique, posture, and flexibility. These classes are designed for beginners of all ages, so no prior dance experience is necessary. Join us in our nurturing environment and experience the joy of movement, as you cultivate grace, strength, and artistry through ballet.",
              viewCount: 800734,
              uploadDate: "April 13, 2020",
              url: URL(string: "https://www.youtube.com/watch?v=of_zOS7T_Dw")!),
        
        Video(imageName: "Dance",
              title: "Beginner Dance Classes",
              description: "Welcome to our Introductory Beginner Dance Classes! Whether you're looking to groove on the dance floor, gain confidence, or simply have fun, our classes are the perfect starting point. Led by passionate instructors, you'll learn the basics of various dance styles in a supportive and inclusive environment. No previous dance experience is necessary – we're here to nurture your talent and help you find your rhythm. Join us, and let the music move you as you embark on an exciting journey to explore the world of dance!",
              viewCount: 100744,
              uploadDate: "January 10, 2020",
              url: URL(string: "https://www.youtube.com/watch?v=WsAcnlG7DJY")!),
        
        Video(imageName: "pole",
              title: "Beginner Pole Classes",
              description: "Welcome to our Introductory Beginner Pole Classes! Are you ready to embrace strength, grace, and empowerment in a unique way? Our classes provide a welcoming space for beginners to discover the art of pole dance. Led by experienced instructors, you'll learn foundational moves, build core strength, and gain confidence in a supportive environment. No prior pole experience is needed – we'll guide you through each step. Join us to embark on an exhilarating journey of self-discovery and self-expression, all while having a fantastic time on the pole!",
              viewCount: 460412,
              uploadDate: "August 14, 2018",
              url: URL(string: "https://www.youtube.com/watch?app=desktop&v=Tm9S9ymhr8k")!)
    ]
}
