//
//  DestinationSearchView.swift
//  Airbnb Clone
//
//  Created by mohamed ahmed on 10/05/2025.
//

import SwiftUI

enum DestinationSearchOptions {
    case location
    case dates
    case guests
}
struct DestinationSearchView: View {
    @Binding var showSearch: Bool
    @StateObject var viewModel: ExploreViewModel
    @State private var selectedOption: DestinationSearchOptions = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numberOfGuests: Int = 1


    var body: some View {

        VStack(spacing: 15){
            HStack{
                Button {
                    withAnimation(.snappy) {
                        viewModel.updateListingsForLocation()
                        showSearch.toggle()
                    }
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }

                Spacer()

                if !viewModel.searchLocation .isEmpty {
                    Button("Clear"){
                        withAnimation {
                            viewModel.searchLocation = ""
                            viewModel.updateListingsForLocation()
                            showSearch.toggle()

                        }
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
            .padding()
            VStack{

                if selectedOption == .location{
                    VStack(alignment: .leading) {
                        Text("Where to?")
                            .font(.title2)
                            .fontWeight(.semibold)
                        HStack{
                            Image(systemName: "magnifyingglass")
                                .imageScale(.small)

                            TextField("Search destination", text: $viewModel.searchLocation)
                                .font(.subheadline)
                                .onSubmit {
                                    viewModel.updateListingsForLocation()
                                    showSearch.toggle()
                                }
                        }
                        .padding(.horizontal)
                        .frame(height: 44)
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(lineWidth: 1)
                                .foregroundStyle(Color(.systemGray4))
                        }
                    }
                }
                else{
                    ShowSearchingField(title: "Where to?", description: "Add dates")

                }
            }
            .modifier(ShowSearchingFieldModifier())
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedOption = .location
                }
            }


            VStack(alignment:.leading){
                if selectedOption == .dates{
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    VStack{
                        DatePicker("From", selection: $startDate, displayedComponents: .date)
                        Divider()
                        DatePicker("To", selection: $endDate, displayedComponents: .date)

                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }else{
                    ShowSearchingField(title: "When", description: "Add dates")

                }
            }
            .modifier(ShowSearchingFieldModifier())
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedOption = .dates
                }
            }

            VStack(alignment:.leading){
                if selectedOption == .guests{
                    Text("Who's coming?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    VStack{
                        Stepper("\(numberOfGuests) Adults") {
                            numberOfGuests += 1
                        } onDecrement: {
                            guard numberOfGuests > 1 else { return }
                            numberOfGuests -= 1
                        }

                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }else{
                    ShowSearchingField(title: "Who", description: "Add guests")

                }
            }
            .modifier(ShowSearchingFieldModifier())
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedOption = .guests
                }
            }
            Spacer()
        }
    }
}

#Preview {
    DestinationSearchView(showSearch: .constant(false), viewModel: ExploreViewModel(service: ExploreService()))
}

struct ShowSearchingFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
    }
}
struct ShowSearchingField: View {
    let title : String
    let description : String
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .foregroundStyle(.gray)
                Spacer()

                Text(description)

            }
            .font(.subheadline)
            .fontWeight(.semibold)
        }
    }
}
