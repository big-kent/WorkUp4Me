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
                "fit-4",
                "fit-5"
            ],
            link: "https://fitcenter.vn/phong-tap-quan-3/"),
        Location(
            name: "T-Gym",
            cityName: "Binh Chanh District",
            coordinates: CLLocationCoordinate2D(latitude: 10.73397522529543, longitude: 106.67804535868876),
            description: "The Trevi Fountain is a fountain in the Trevi district in Rome, Italy, designed by Italian architect Nicola Salvi and completed by Giuseppe Pannini and several others. Standing 26.3 metres high and 49.15 metres wide, it is the largest Baroque fountain in the city and one of the most famous fountains in the world.",
            imageNames: [
                "rome-trevifountain-1",
                "rome-trevifountain-2",
                "rome-trevifountain-3",
            ],
            link: "https://en.wikipedia.org/wiki/Trevi_Fountain"),
        Location(
            name: "Eiffel Tower",
            cityName: "Paris",
            coordinates: CLLocationCoordinate2D(latitude: 48.8584, longitude: 2.2945),
            description: "The Eiffel Tower is a wrought-iron lattice tower on the Champ de Mars in Paris, France. It is named after the engineer Gustave Eiffel, whose company designed and built the tower. Locally nicknamed 'La dame de fer', it was constructed from 1887 to 1889 as the centerpiece of the 1889 World's Fair and was initially criticized by some of France's leading artists and intellectuals for its design, but it has become a global cultural icon of France and one of the most recognizable structures in the world.",
            imageNames: [
                "paris-eiffeltower-1",
                "paris-eiffeltower-2",
            ],
            link: "https://en.wikipedia.org/wiki/Eiffel_Tower"),
        Location(
            name: "Louvre Museum",
            cityName: "Paris",
            coordinates: CLLocationCoordinate2D(latitude: 48.8606, longitude: 2.3376),
            description: "The Louvre, or the Louvre Museum, is the world's most-visited museum and a historic monument in Paris, France. It is the home of some of the best-known works of art, including the Mona Lisa and the Venus de Milo. A central landmark of the city, it is located on the Right Bank of the Seine in the city's 1st arrondissement.",
            imageNames: [
                "paris-louvre-1",
                "paris-louvre-2",
                "paris-louvre-3",
            ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
    ]
    
}
