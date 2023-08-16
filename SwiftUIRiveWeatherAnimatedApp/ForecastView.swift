//
//  ForecastView.swift
//  SwiftUIRiveWeatherAnimatedApp
//
//  Created by ipeerless on 14/08/2023.
//

import SwiftUI

struct ForecastView: View {
    var bottomSheetTransitionProrated: CGFloat = 1
    @State private var selection = 0
    var body: some View {
        ScrollView {
            VStack(spacing: 0){
                SegmentedControl(selection: $selection)
                ScrollView(.horizontal,showsIndicators: false) {
                    if selection == 0 {
                        HStack(spacing: 12, content: {
                            ForEach(Forecast.hourly) { forecast in
                                ForecastCard(forecast: forecast, forecastPeriod:.hourly)
                            }
                            .transition(.offset(x: -430))
                        })
                        .padding(.vertical, 20)
                    } else {
                        ForEach(Forecast.daily) { forecast in
                            ForecastCard(forecast: forecast, forecastPeriod:.daily)
                        }
                        .transition(.offset(x: -430))
                    }
                }
                .padding(.horizontal, 20)
                
                Image("Forecast Widgets")
                    .opacity(bottomSheetTransitionProrated * 115)
                
            }
        }
        .backgroundBlur(radius: 25, opaque: true)
        .background(Color.bottomSheetBackground)
        .clipShape(RoundedRectangle(cornerRadius: 44))
        innerShadow(shape: RoundedRectangle(cornerRadius: 44), color: Color.bottomSheetBorderMiddle, lineWidth: 1, offsetX: 0, offsetY: 1, blur: 0, blendMode: .overlay, opacity: 1 - bottomSheetTransitionProrated)
        
            .overlay {
                // MARK: Bottom Sheet Separator
                Divider()
                    .blendMode(.overlay)
                    .background(Color.bottomSheetBorderTop)
                    .frame(maxHeight: .infinity, alignment: .top)
                    .clipShape(RoundedRectangle(cornerRadius: 44))
            }
            .overlay {
                // MARK: Drag Indicator
                RoundedRectangle(cornerRadius: 10)
                    .fill(.black.opacity(0.3))
                    .frame(width: 48, height: 5)
                    .frame(height: 20)
                    .frame(maxHeight: .infinity, alignment: .top)
            }
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView()
            .preferredColorScheme(.dark)
    }
}
