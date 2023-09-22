//
//  LocationsDataService.swift
//  WorkUp4Me
//
//  Created by Võ Phúc Duy Nhật on 21/09/2023.
//

import Foundation
import MapKit

class LocationsDataService {
    
    static let locations: [Location] = [
        Location(
            name: "California Gym",
            cityName: "LIM TOWER District 3",
            coordinates: CLLocationCoordinate2D(latitude: 10.77476271362452, longitude: 106.68841593529855),
            description: "Possessing a convenient location right in the city center, California Fitness & Yoga District 3 promises to be a place to help you easily maintain a healthy lifestyle for your busy schedule.",
            imageNames: [
                "California-D3",
                "California-D3-2",
                "California-D3-3",
                "California-D3-4"
            ],
            link: "https://cali.vn/ho-chi-minh/lim-tower-club"),
        Location(
            name: " FIT Center",
            cityName: "District 3",
            coordinates: CLLocationCoordinate2D(latitude: 10.771565625490844, longitude: 106.68457476852889),
            description: "Coming from a dermatologist background, Ms. Nguyen Thi Thanh Ha (Fit Center Director) soon received a formula for exercising that has great effects on health and skin condition. It can be said that skin waves are a reflection of your health. Regular exercise will help you have healthy skin, more than any high-end cosmetics or diet. This has been proven by Ms. Ha's 12 years of solid experience in the beauty industry and her willingness to treat >100,000 customers. And publish your own main experience.",
            imageNames: [
                "Fit",
                "fit-2",
                "fit-3",
                "fit-5"
            ],
            link: "https://fitcenter.vn/phong-tap-quan-3/"),
        Location(
            name: "T-Gym",
            cityName: "Binh Chanh District",
            coordinates: CLLocationCoordinate2D(latitude: 10.73397522529543, longitude: 106.67804535868876),
            description: "T-Gym is a cutting-edge fitness center that redefines your fitness journey with top-notch equipment, expert trainers, and a supportive community. Whether you're a beginner or a seasoned athlete, T-Gym is your path to a healthier, happier life.",
            imageNames: [
                "tgym",
                "tgym-2",
                "tgym-3",
            ],
            link: "https://www.facebook.com/phongtapgymq8"),
        Location(
            name: "Fit Force",
            cityName: "District 1",
            coordinates: CLLocationCoordinate2D(latitude: 10.768226355781236, longitude: 106.68875949166264),
            description: "Fit Force Fitness and Yoga centers are strategically located in various cities and regions, offering a diverse range of fitness and wellness options. These centers aim to provide convenient access to their programs, with locations in urban areas, suburbs, and even smaller towns. Whether you're looking for high-intensity workouts or peaceful yoga sessions, you can typically find Fit Force Fitness and Yoga centers to cater to your fitness needs in various settings.",
            imageNames: [
                "fitforce",
                "fitforce-2",
                "fitforce-3",
                "fitforce-4"
            ],
            link: "https://www.facebook.com/fitforcevn/?locale=vi_VN"),
        Location(
            name: "Ga Gym",
            cityName: "District 10",
            coordinates: CLLocationCoordinate2D(latitude: 10.774797639786032, longitude: 106.67798768936257),
            description: "Welcome to Ga Gym, your gateway to a healthier and stronger you. At Ga Gym, we're committed to helping you reach your fitness goals and transform your lifestyle. Our state-of-the-art facilities, experienced trainers, and diverse range of fitness programs make us the perfect destination for individuals of all fitness levels. Whether you're a beginner looking to start your fitness journey or a seasoned athlete seeking to challenge your limits, Ga Gym is here to support you every step of the way. Join us today and discover a new level of fitness and wellness.",
            imageNames: [
                "gagym",
                "gagym-2",
                "gagym-3",
                "gagym-4"
            ],
            link: "https://gagym.vn"),
        Location(
            name: "CITY Gym",
            cityName: "District 10",
            coordinates: CLLocationCoordinate2D(latitude: 10.772348743087381, longitude: 106.6688401980551),
            description: "CITIGYM Van Hanh Mall set a record for the gym in the largest shopping center in Vietnam - 6000m2, with modern design and accommodating the entire Fitness industry. The Blockbuster has been ignited and will explode in October. Let's go saw bomb today!",
            imageNames: [
                "citygym",
                "citygym-2",
                "citygym-3",
                "citygym-4",
                "citygym-5"
            ],
            link: "https://citigym.com.vn/clb/gym-quan-10"),
        Location(
            name: "California Gym",
            cityName: "Hoan Kiem District",
            coordinates: CLLocationCoordinate2D(latitude: 21.02607471774706, longitude: 105.8480507063944),
            description: "Welcome to California Gym, your premier fitness destination in the heart of Hoan Kiem District. With a commitment to wellness and vitality, California Gym offers a top-tier fitness experience that caters to all your health and fitness needs. Our state-of-the-art facilities, dedicated trainers, and a wide range of fitness programs ensure that you can achieve your goals, whether you're a seasoned athlete or just starting your fitness journey. Join us at California Gym in Hoan Kiem District and embark on a path to a healthier and more active lifestyle.",
            imageNames: [
                "caligym",
                "caligym-2",
                "caligym-3",
                "caligym-4",
                "caligym-5"
            ],
            link: "https://cali.vn/ha-noi/capital-tower"),
        Location(
            name: " Elite Fitness",
            cityName: "Ly Thuong Kiet",
            coordinates: CLLocationCoordinate2D(latitude: 21.023406017881573, longitude: 105.85491818008408),
            description: "Welcome to Elite Fitness, where excellence meets wellness. At Elite Fitness, we are dedicated to providing you with a fitness experience that goes beyond the ordinary. Our cutting-edge facilities, highly skilled trainers, and diverse array of fitness programs are designed to elevate your physical and mental well-being. Whether you're a fitness enthusiast looking to push your limits or someone starting their fitness journey, Elite Fitness is your destination for achieving your health and fitness goals. Join us and experience the elite standard of fitness and wellness.",
            imageNames: [
                "elite",
                "elit-2",
                "elit-3",
                "elit-4"
            ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
    ]
    
}
