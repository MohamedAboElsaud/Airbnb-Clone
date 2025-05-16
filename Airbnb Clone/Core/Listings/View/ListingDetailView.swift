//
//  ListingDetailView.swift
//  Airbnb Clone
//
//  Created by mohamed ahmed on 10/05/2025.
//

import SwiftUI
import MapKit
struct ListingDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @State var listing: Listing
    @State private var cameraPosition: MapCameraPosition

    init( listing: Listing) {
        self.listing = listing

        let region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: listing.latitude, longitude: listing.longitude),
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )

        self._cameraPosition = State(initialValue: .region(region))
    }
    var body: some View {
        ScrollView {
            ZStack(alignment:.topLeading){
                ListingImageCarouselView(images: listing.imageURLs)
                    .frame(height: 320)
                    .overlay(alignment: .topTrailing) {
                        Button {
                            listing
                                .isFavorite.toggle()
                        } label: {
                            Image(systemName: listing
                                .isFavorite ? "heart.fill" : "heart")
                                .font(.largeTitle)
                                .foregroundStyle(listing
                                    .isFavorite ? .red : .black)
                                .padding(.top,15)
                                .padding()
                                .opacity(0.9)
                                .fontWeight(.thin)
                                .shadow(color: .black.opacity(0.4), radius: 2, x: 0, y: 0)

                        }

                    }
                    .overlay(alignment: .topLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                                .background{
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: 39, height: 39)
                                }
                                .padding(32)
                                .padding(.top,5)
                        }
                    }



            }


            headerDetails

            Divider()

            HStack{
                VStack(alignment: .leading, spacing: 4) {
                    Text("Entire \(listing.type) hosted by\n\(listing.ownerName)")
                        .font(.headline)

                    HStack(spacing:2){
                        Text("\(listing.numberOfQuests) quests -")
                        Text("\(listing.numberOfBedrooms) bedrooms -")
                        Text("\(listing.numberOfBeds) beds -")
                        Text("\(listing.numberOfBathrooms) baths")
                    }
                    .font(.caption)
                }
                Spacer()
                Image("\(listing.ownerImageUrl)")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 65, height: 65)
                    .clipShape(.circle)
            }
            .padding()

            Divider()

            listingFeatures

            Divider()
            // bedrooms
            VStack(alignment: .leading, spacing: 16) {
                Text("Where you'll sleep")
                    .font(.headline)

                ScrollView(.horizontal,showsIndicators: false){
                    HStack(spacing:16){
                        ForEach(1 ... listing.numberOfBedrooms,id: \.self){bedroom in
                            VStack{
                                Image(systemName: "bed.double")

                                Text("bedroom \(bedroom)")
                            }
                            .frame(width: 132, height: 100, alignment: .center)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                }
                .scrollTargetBehavior(.paging)
            }
            .padding()
            Divider()
            // offers
            VStack(alignment: .leading, spacing: 16) {
                Text("What this offers")
                    .font(.headline)
                ForEach(listing.amenities){ amenity in
                    HStack(){
                        Image(systemName: amenity.imageName)
                                .frame(width: 32)
                        Text(amenity.title)
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Spacer()

                    }
                }
            }
            .padding()

            Divider()

            VStack(alignment: .leading, spacing: 16) {
                Text("Where you'll be")
                    .font(.headline)

                Map(position: $cameraPosition) {
                    Annotation(listing.ownerName, coordinate: CLLocationCoordinate2D(latitude: listing.latitude, longitude: listing.longitude)) {
                        LocationMapAnnotationView()
                    }
                }
                .aspectRatio(1.4, contentMode: .fit)
                .cornerRadius(30)
            }
            .padding()

        }
        .toolbarVisibility(.hidden, for: .tabBar)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .padding(.bottom,78)
        .overlay(alignment: .bottom){
            VStack {


                Divider()
                    .padding(.bottom)
                HStack{
                    VStack(alignment:.leading){
                        Text("$\(listing.pricePerNight)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Text("Total before taxes")
                            .font(.footnote)
                        Text("\(listing.address)")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()
                    }
                    Spacer()
                    Button {

                    } label: {
                        Text("Reserve")
                            .font(.subheadline)
                            .fontWeight(.semibold)

                            .frame(width: 140, height: 40)
                            .foregroundStyle(.white)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }

                }
                .padding(.horizontal,32)
            }
            .background(.thinMaterial)

            }

        .ignoresSafeArea( edges: .top)
    }
}

#Preview {
    ListingDetailView(listing: DeveloperPreview.shard.listings[0])
}

extension ListingDetailView{
    var headerDetails: some View{
        VStack(alignment: .leading, spacing: 8) {
            Text(listing.title)
                .font(.title)
                .fontWeight(.semibold)

            VStack(alignment: .leading){
                HStack(spacing: 2){

                    Image(systemName: "star.fill")
                    Text("\(listing.rating)")
                    Text(" - ")
                    Text("28 reviews")
                        .underline()
                        .fontWeight(.semibold)

                }
                .foregroundStyle(.black)
                Text("\(listing.city), \(listing.state)")
            }
            .font(.caption)
        }
        .padding(.leading)
        .frame(maxWidth: .infinity,alignment: .leading)

    }

    var listingFeatures: some View{
        VStack(alignment: .leading, spacing: 16) {
            ForEach(listing.features,id:\.self){feature in
                HStack(spacing: 12) {
                    Image(systemName: feature.imageName)
                    VStack(alignment:.leading){
                        Text(feature.title)
                            .font(.footnote)
                            .fontWeight(.bold)
                        Text(feature.subtitle)
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    Spacer()
                }
            }
        }
        .padding()

    }
}
