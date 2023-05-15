//
//  File.swift
//  
//
//  Created by Alvaro Cofre Perez on 14-05-23.
//

import Foundation
import SwiftUI


extension Color {
    
    public static let themeAccent = Color("AccentColor", bundle: .module)
    public static let themePrimary = Color("PrimaryColor", bundle: .module)
    public static let themeSecondary = Color("SecondaryColor", bundle: .module)
    
    public static let themeSuccess = Color("SuccessColor", bundle: .module)
    public static let themeWarning = Color("WarningColor", bundle: .module)
    public static let themeDanger = Color("DangerColor", bundle: .module)
    public static let themeInfo = Color("InfoColor", bundle: .module)
    
    public static let themeBackground = Color("BackgroundColor", bundle: .module)
    public static let themeForeground = Color("ForegroundColor", bundle: .module)
    
    public static let themeBorderLineSelected = Color("BorderLineSelectedColor", bundle: .module)
    public static let themeBackgroundSoftColor = Color("BackgroundSoftColor", bundle: .module)
    
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

struct ColorExtensionView : View {
    var body: some View {
        VStack {
            Circle()
                .fill(Color.red)
                .hLeading()
            Circle()
                .fill(Color.themeAccent)
                .hLeading()
        }
    }
}

struct ColorExtensionView_Preview :  PreviewProvider {
    static var previews: some View {
        ColorExtensionView()
    }
}




