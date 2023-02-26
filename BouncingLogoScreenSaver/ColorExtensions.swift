//
//
// Extensions.swift
// BouncingLogoScreenSaver
//
// Created by sinezeleuny on 21.02.2023
//
        

import AppKit

extension NSColor {
    convenience init(hex: String, alpha: CGFloat = 1) {
        assert(hex[hex.startIndex] == "#", "Expected hex string of format #RRGGBB")
  
        let scanner = Scanner(string: hex)
        
        scanner.currentIndex = scanner.string.index(after: scanner.currentIndex)
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        self.init(
            red:   CGFloat((rgb & 0xFF0000) >> 16)/255.0,
            green: CGFloat((rgb &   0xFF00) >>  8)/255.0,
            blue:  CGFloat((rgb &     0xFF)      )/255.0,
            alpha: alpha)
    }
    
    func lighter(by percentage: CGFloat = 30.0) -> NSColor? {
            return self.adjust(by: abs(percentage) )
        }

    func darker(by percentage: CGFloat = 30.0) -> NSColor? {
        return self.adjust(by: -1 * abs(percentage) )
    }

    func adjust(by percentage: CGFloat = 30.0) -> NSColor? {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return NSColor(red: min(red + percentage/100, 1.0),
                       green: min(green + percentage/100, 1.0),
                       blue: min(blue + percentage/100, 1.0),
                       alpha: alpha)
    }
}
