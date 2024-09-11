//
//  DestinationSearchView.swift
//  Airbnb
//
//  Created by Anubhav Tomar on 10/09/24.
//

import SwiftUI

enum DestinationSearchOptions {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    
    @Binding var show: Bool
    @ObservedObject var viewModel: ExploreVM
    @State private var selectedOption: DestinationSearchOptions = .location
    @State private var startDate =  Date()
    @State private var endDate =  Date()
    @State private var numGuests = 0
    
    var body: some View {
        
        VStack{
            HStack {
                Button{
                    withAnimation(.snappy){
                        viewModel.updateListingForLocation()
                        show.toggle()
                    }
                }   label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                
                Spacer()
                
                if !viewModel.searchLocation.isEmpty {
                    Button("Clear") {
                        viewModel.searchLocation = ""
                        viewModel.updateListingForLocation()
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
            .padding()
            
            VStack(alignment: .leading) {
                if selectedOption == .location {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        
                        TextField("Search Destination", text: $viewModel.searchLocation)
                            .font(.subheadline)
                            .onSubmit {
                                viewModel.updateListingForLocation()
                                show.toggle()
                            }
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1.0)
                            .foregroundStyle(Color(.systemGray4))
                    }
                }   else {
                    CollapsedPickerView(title: "Where", description: "Add destination")
                }
                
                
            }
            .modifier(collapsibleDestinationViewModifier())
            .frame(height: selectedOption == .location ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy) {selectedOption = .location}
            }
            
            // Date selection view
            VStack(alignment: .leading) {
                if selectedOption == .dates {
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack {
                        DatePicker("From", selection: $startDate, displayedComponents: .date)
                        
                        Divider()
                        
                        DatePicker("To", selection: $endDate, displayedComponents: .date)
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    
                }   else {
                    VStack(alignment: .leading) {
                        CollapsedPickerView(title: "When", description: "Add dates")
                    }
                }
            }
            .modifier(collapsibleDestinationViewModifier())
            .frame(height: selectedOption == .dates ? 180 : 64)
            .onTapGesture {
                withAnimation(.snappy) {selectedOption = .dates}
            }
            
            // Num guests view
            VStack(alignment: .leading) {
                if selectedOption == .guests {
                    Text("Who's coming")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Stepper {
                        Text("\(numGuests) Adults")
                    }   onIncrement: {
                        numGuests += 1
                    }   onDecrement: {
                        guard numGuests > 0 else { return }
                        numGuests -= 1
                    }
                    
                }   else {
                    CollapsedPickerView(title: "Who", description: "Add guests")
                }
            }
            .modifier(collapsibleDestinationViewModifier())
            .frame(height: selectedOption == .guests ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy) {selectedOption = .guests}
            }
            
            Spacer()
            
        }
    }
}


struct collapsibleDestinationViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content 
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
    }
}

struct CollapsedPickerView: View {
    
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
    }
}
