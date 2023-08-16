//
//  WeatherView.swift
//  SwiftUIRiveWeatherAnimatedApp
//
//  Created by ipeerless on 16/08/2023.
//

import SwiftUI

struct WeatherView: View {
    @State private var searchText = ""
    var searchResults: [Forecast] {
        if searchText.isEmpty {
            return Forecast.cities
        } else {
            return Forecast.cities.filter {$0.location.contains(searchText)
                
            }
        }
    }
    var body: some View {
        ZStack(content: {
            Color.background
                .ignoresSafeArea()
            ScrollView(showsIndicators: false, content: {
                VStack(spacing: 20, content: {
                    ForEach(searchResults) { forecast in
                        WeatherWidget(forecast: forecast)
                    }
                })
            })
            .safeAreaInset(edge: .top) {
                EmptyView()
                    .frame(height: 110)
            }
           
        })
        .overlay(content: {
            NavigationBar(searchText: $searchText)
        })
        .navigationBarHidden(true)
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search for city or airport")
    }
}

#Preview {
    NavigationView {
        WeatherView()
    }
}
