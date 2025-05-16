//
//  Listing.swift
//  Airbnb Clone
//
//  Created by mohamed ahmed on 11/05/2025.
//

import Foundation
struct Listing: Identifiable,Codable,Hashable{
    let id: String
    let ownerUid: String
    let ownerName:String
    let ownerImageUrl:String
    let numberOfBedrooms:Int
    let numberOfBathrooms:Int
    let numberOfQuests:Int
    let numberOfBeds:Int
    var pricePerNight:Int
    var imageURLs:[String]
    let latitude:Double
    let longitude:Double
    let address:String
    let city:String
    let state:String
    let title:String
    var rating:Double
    var features:[ListingFeatures]
    var amenities:[ListingAmenities]
    let type: ListingType
    var isFavorite:Bool = false

}
enum ListingFeatures:Int,Codable,Identifiable,Hashable{
    case selftCheckin
    case superHost

    var title: String{
        switch self{
        case .selftCheckin: return "Self check-in"
        case .superHost: return "Super host"
        }
    }
    var imageName: String{
        switch self{
        case .selftCheckin: return "door.left.hand.open"
        case .superHost: return "medal"
        }
    }

    var subtitle: String{
        switch self{
        case .selftCheckin: return "Check yourself in with the keypad"
        case .superHost: return "Super hosts are experienced, highly rated hosts who are commited to providing graet guest experiences"
        }
    }

    var id: Int { self.rawValue }
}
enum ListingAmenities:Int,Codable,Identifiable,Hashable{
    case breakfast
    case kitchen
    case parking
    case pool
    case wifi
    case tv
    case laundry
    case office
    case balcony
    case alarmSystem

    var title:String{
        switch self {
        case .breakfast:
            return "Breakfast"
        case .kitchen:
            return "Kitchen"
        case .parking:
            return "Parking"
        case .pool:
            return "Pool"
        case .wifi:
            return "Wifi"
        case .tv:
            return "Tv"
        case .laundry:
            return "Laundry"
        case .office:
            return "Office"
        case .balcony:
            return "Belcony"
        case .alarmSystem:
            return "AlarmSystem"
        }
    }

    var imageName:String{
        switch self {
        case .breakfast:
            return "breakfast.bubble"
        case .kitchen:
            return "fork.knife"
        case .parking:
            return "parking"
        case .pool:
            return "figure.pool.swim"
        case .wifi:
            return "wifi"
        case .tv:
            return "tv"
        case .laundry:
            return "lasso.badge.sparkles"
        case .office:
            return "pencel.and.ruler.fill"
        case .balcony:
            return "building"
        case .alarmSystem:
            return "checkerboard.shield"
        }

    }
    var id: Int { self.rawValue }
}

enum ListingType:Int,Codable,Identifiable,Hashable{
    case apartment
    case house
    case villa
    case townHouse

    var title:String{
        switch self {
        case .apartment: return "Apartment"
        case .house: return "House"
        case .villa: return "Villa"
        case .townHouse: return "Town House"
        }
    }
    var id: Int {return self.rawValue}
}
