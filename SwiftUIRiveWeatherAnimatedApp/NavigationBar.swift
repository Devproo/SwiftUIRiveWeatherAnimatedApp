//
//  NavigationBar.swift
//  SwiftUIRiveWeatherAnimatedApp
//
//  Created by ipeerless on 16/08/2023.
//

import SwiftUI

struct NavigationBar: View {
    @Environment(\.dismiss) var dissmiss
    @Binding  var searchText: String
    var body: some View {
        VStack(spacing: 8, content: {
            HStack(content: {
                Button(action: {dissmiss()},
                       label: {
                    HStack(spacing: 5, content: {
                        
                  
                    Image(systemName: "chevron.left")
                        .font(.system(size: 23).weight(.medium))
                        .foregroundColor(.secondary)
                    
                    Text("Weather")
                        .font(.title)
                        .foregroundColor(.primary)
                    })
                    .frame(height: 44)
                })
                Spacer()
                
                Image(systemName: "ellipsis.circle")
                    .font(.system(size: 28))
                    .frame(width: 44, height: 44, alignment: .trailing)
            })
            
            .frame(height: 52)
            HStack(spacing: 2, content: {
                Image(systemName: "magnifyingglass")
                TextField("Search for a city or an airport", text: $searchText)
            })
            .foregroundColor(.secondary)
            .padding(.horizontal, 6)
            .padding(.vertical, 7)
            .frame(height: 36, alignment: .leading)
            .background(Color.bottomSheetBackground, in: RoundedRectangle(cornerRadius: 10))
            .innerShadow(shape: RoundedRectangle(cornerRadius: 10), color: .black.opacity(0.25), lineWidth: 2, offsetX: 0, offsetY: 2, blur: 2)
        })
        .frame(height: 106, alignment: .top)
        .padding(.horizontal, 16)
        .padding(.top, 49)
        .backgroundBlur(radius: 20, opaque: true)
        .background(Color.navBarBackground)
        .frame(maxWidth: .infinity, alignment: .top)
        .ignoresSafeArea()
        
    }
}

#Preview {
    NavigationBar(searchText: .constant(""))
}
