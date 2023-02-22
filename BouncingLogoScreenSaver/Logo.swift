//
//
// Logo.swift
// BouncingLogoScreenSaver
//
// Created by sinezeleuny on 21.02.2023
//
        

import Foundation
import AppKit

class Logo {
    static func path(bounds: CGRect) -> NSBezierPath {
        
        let path = NSBezierPath()
        let basicHeight = CGFloat(91.97799912230174)
//        let basicWidth = CGFloat(77.0)
        let side = min(bounds.width, bounds.height)
        let k = CGFloat(1/basicHeight) * side
        let x0 = bounds.minX
        let y0 = -bounds.minY
        
        // Apple
        path.move(to: CGPoint(x: x0 + k * 75.39,
                              y: y0 + k * 71.68))
        
        path.curve(to: CGPoint(x: x0 + k * 70.47,
                               y: y0 + k * 80.57),
                   controlPoint1: CGPoint(x: x0 + k * 74, y: y0 + k * 74.89),
                   controlPoint2: CGPoint(x: x0 + k * 72.37, y: y0 + k * 77.85))
        path.curve(to: CGPoint(x: x0 + k * 64.14, y: y0 + k * 88.27),
                   controlPoint1: CGPoint(x: x0 + k * 67.89, y: y0 + k * 84.28),
                   controlPoint2: CGPoint(x: x0 + k * 65.77, y: y0 + k * 86.85))
        path.curve(to: CGPoint(x: x0 + k * 56, y: y0 + k * 91.88),
                   controlPoint1: CGPoint(x: x0 + k * 61.61, y: y0 + k * 90.61),
                   controlPoint2: CGPoint(x: x0 + k * 58.9, y: y0 + k * 91.81))
        path.curve(to: CGPoint(x: x0 + k * 48.49, y: y0 + k * 90.07),
                   controlPoint1: CGPoint(x: x0 + k * 53.92, y: y0 + k * 91.88),
                   controlPoint2: CGPoint(x: x0 + k * 51.41, y: y0 + k * 91.28))
        path.curve(to: CGPoint(x: x0 + k * 40.4, y: y0 + k * 88.27),
                   controlPoint1: CGPoint(x: x0 + k * 45.56, y: y0 + k * 88.87),
                   controlPoint2: CGPoint(x: x0 + k * 42.86, y: y0 + k * 88.27))
        path.curve(to: CGPoint(x: x0 + k * 32.08, y: y0 + k * 90.07),
                   controlPoint1: CGPoint(x: x0 + k * 37.81, y: y0 + k * 88.27),
                   controlPoint2: CGPoint(x: x0 + k * 35.04, y: y0 + k * 88.87))
        path.curve(to: CGPoint(x: x0 + k * 24.89, y: y0 + k * 91.97),
                   controlPoint1: CGPoint(x: x0 + k * 29.11, y: y0 + k * 91.28),
                   controlPoint2: CGPoint(x: x0 + k * 26.71, y: y0 + k * 91.91))
        path.curve(to: CGPoint(x: x0 + k * 16.57, y: y0 + k * 88.27),
                   controlPoint1: CGPoint(x: x0 + k * 22.1, y: y0 + k * 92.09),
                   controlPoint2: CGPoint(x: x0 + k * 19.33, y: y0 + k * 90.86))
        path.curve(to: CGPoint(x: x0 + k * 9.94, y: y0 + k * 80.3),
                   controlPoint1: CGPoint(x: x0 + k * 14.8, y: y0 + k * 86.72),
                   controlPoint2: CGPoint(x: x0 + k * 12.59, y: y0 + k * 84.06))
        path.curve(to: CGPoint(x: x0 + k * 2.94, y: y0 + k * 66.3),
                   controlPoint1: CGPoint(x: x0 + k * 7.1, y: y0 + k * 76.28),
                   controlPoint2: CGPoint(x: x0 + k * 4.77, y: y0 + k * 71.62))
        path.curve(to: CGPoint(x: x0 + k * 0, y: y0 + k * 49.63),
                   controlPoint1: CGPoint(x: x0 + k * 0.98, y: y0 + k * 60.57),
                   controlPoint2: CGPoint(x: x0 + k * 0, y: y0 + k * 55.01))
        path.curve(to: CGPoint(x: x0 + k * 3.98, y: y0 + k * 33.69),
                   controlPoint1: CGPoint(x: x0 + k * 0, y: y0 + k * 43.46),
                   controlPoint2: CGPoint(x: x0 + k * 1.32, y: y0 + k * 38.15))
        path.curve(to: CGPoint(x: x0 + k * 12.3, y: y0 + k * 25.22),
                   controlPoint1: CGPoint(x: x0 + k * 6.06, y: y0 + k * 30.11),
                   controlPoint2: CGPoint(x: x0 + k * 8.83, y: y0 + k * 27.29))
        path.curve(to: CGPoint(x: x0 + k * 23.56, y: y0 + k * 22.02),
                   controlPoint1: CGPoint(x: x0 + k * 15.77, y: y0 + k * 23.15),
                   controlPoint2: CGPoint(x: x0 + k * 19.52, y: y0 + k * 22.09))
        path.curve(to: CGPoint(x: x0 + k * 32.26, y: y0 + k * 24.06),
                   controlPoint1: CGPoint(x: x0 + k * 25.77, y: y0 + k * 22.02),
                   controlPoint2: CGPoint(x: x0 + k * 28.66, y: y0 + k * 22.71))
        path.curve(to: CGPoint(x: x0 + k * 39.17, y: y0 + k * 26.1),
                   controlPoint1: CGPoint(x: x0 + k * 35.85, y: y0 + k * 25.42),
                   controlPoint2: CGPoint(x: x0 + k * 38.16, y: y0 + k * 26.1))
        path.curve(to: CGPoint(x: x0 + k * 46.83, y: y0 + k * 23.7),
                   controlPoint1: CGPoint(x: x0 + k * 39.92, y: y0 + k * 26.1),
                   controlPoint2: CGPoint(x: x0 + k * 42.48, y: y0 + k * 25.3))
        path.curve(to: CGPoint(x: x0 + k * 57.23, y: y0 + k * 21.84),
                   controlPoint1: CGPoint(x: x0 + k * 50.93, y: y0 + k * 22.21),
                   controlPoint2: CGPoint(x: x0 + k * 54.4, y: y0 + k * 21.6))
        path.curve(to: CGPoint(x: x0 + k * 74.55, y: y0 + k * 31.01),
                   controlPoint1: CGPoint(x: x0 + k * 64.93, y: y0 + k * 22.46),
                   controlPoint2: CGPoint(x: x0 + k * 70.7, y: y0 + k * 25.51))
        path.curve(to: CGPoint(x: x0 + k * 64.33, y: y0 + k * 48.61),
                   controlPoint1: CGPoint(x: x0 + k * 67.67, y: y0 + k * 35.2),
                   controlPoint2: CGPoint(x: x0 + k * 64.27, y: y0 + k * 41.07))
        path.curve(to: CGPoint(x: x0 + k * 70.67, y: y0 + k * 63.24),
                   controlPoint1: CGPoint(x: x0 + k * 64.39, y: y0 + k * 54.48),
                   controlPoint2: CGPoint(x: x0 + k * 66.51, y: y0 + k * 59.36))
        path.curve(to: CGPoint(x: x0 + k * 77, y: y0 + k * 67.42),
                   controlPoint1: CGPoint(x: x0 + k * 72.55, y: y0 + k * 65.04),
                   controlPoint2: CGPoint(x: x0 + k * 74.66, y: y0 + k * 66.43))
        path.curve(to: CGPoint(x: x0 + k * 75.39, y: y0 + k * 71.68),
                   controlPoint1: CGPoint(x: x0 + k * 76.49, y: y0 + k * 68.9),
                   controlPoint2: CGPoint(x: x0 + k * 75.96, y: y0 + k * 70.32))

        // Leaf
        path.move(to: CGPoint(x: x0 + k * 57.75,
                              y: y0 + k * 1.84))
        path.curve(to: CGPoint(x: x0 + k * 52.75, y: y0 + k * 14.71),
                   controlPoint1: CGPoint(x: x0 + k * 57.75, y: y0 + k * 6.44),
                   controlPoint2: CGPoint(x: x0 + k * 56.08, y: y0 + k * 10.74))
        path.curve(to: CGPoint(x: x0 + k * 38.6, y: y0 + k * 21.74),
                   controlPoint1: CGPoint(x: x0 + k * 48.73, y: y0 + k * 19.44),
                   controlPoint2: CGPoint(x: x0 + k * 43.87, y: y0 + k * 22.17))
        path.curve(to: CGPoint(x: x0 + k * 38.5, y: y0 + k * 20),
                   controlPoint1: CGPoint(x: x0 + k * 38.53, y: y0 + k * 21.19),
                   controlPoint2: CGPoint(x: x0 + k * 38.5, y: y0 + k * 20.61))
        path.curve(to: CGPoint(x: x0 + k * 43.8, y: y0 + k * 6.99),
                   controlPoint1: CGPoint(x: x0 + k * 38.5, y: y0 + k * 15.58),
                   controlPoint2: CGPoint(x: x0 + k * 40.41, y: y0 + k * 10.86))
        path.curve(to: CGPoint(x: x0 + k * 50.26, y: y0 + k * 2.11),
                   controlPoint1: CGPoint(x: x0 + k * 45.49, y: y0 + k * 5.03),
                   controlPoint2: CGPoint(x: x0 + k * 47.65, y: y0 + k * 3.41))
        path.curve(to: CGPoint(x: x0 + k * 57.65, y: y0 + k * 0),
                   controlPoint1: CGPoint(x: x0 + k * 52.87, y: y0 + k * 0.83),
                   controlPoint2: CGPoint(x: x0 + k * 55.33, y: y0 + k * 0.13))
        path.curve(to: CGPoint(x: x0 + k * 57.75, y: y0 + k * 1.84),
                   controlPoint1: CGPoint(x: x0 + k * 57.72, y: y0 + k * 0.62),
                   controlPoint2: CGPoint(x: x0 + k * 57.75, y: y0 + k * 1.23))
        path.line(to: CGPoint(x: x0 + k * 57.75, y: y0 + k * 1.84))

        path.close()
        
        let yMirror = AffineTransform(scaleByX: 1, byY: -1)
        let translation = AffineTransform(translationByX: 0, byY: path.bounds.height)
        
        path.transform(using: yMirror)
        path.transform(using: translation)
        
        return path
        
    }
}
