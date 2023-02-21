//
//
// BouncingLogoScreenSaverView.swift
// BouncingLogoScreenSaver
//
// Created by sinezeleuny on 21.02.2023
//
        

import ScreenSaver

class BouncingLogoScreenSaverView: ScreenSaverView, NSWindowDelegate {
    
    private var logoPosition: CGPoint = .zero
    private var logoVelocity: CGVector = .zero
    private var logoRadius: CGFloat = 10
    private var desiredVelocityMagnitude: CGFloat = 5
    private var velocityDenominator: CGFloat = 150
    
    private let colors: [NSColor] = [
        NSColor(hex: "#61BB46"),
        NSColor(hex: "#FDB827"),
        NSColor(hex: "#F5821F"),
        NSColor(hex: "#E03A3E"),
        NSColor(hex: "#963D97"),
        NSColor(hex: "#009DDC")
    ]
    private var colorIndex: Int = 0
    private var lighter: Bool = true
    
    private func initialVelocity() -> CGVector {
        
        let yVelocity = CGFloat.random(in: (1.5/5)*desiredVelocityMagnitude...(3.5/5)*desiredVelocityMagnitude)
        let xSign: CGFloat = Bool.random() ? 1 : -1
        let xVelocity = sqrt(pow(desiredVelocityMagnitude, 2) - pow(yVelocity, 2))
        let ySign: CGFloat = Bool.random() ? 1 : -1
        return CGVector(dx: xVelocity * xSign, dy: yVelocity * ySign)
    }
    
    private func logoIsOOB() -> (xAxis: Bool, yAxis: Bool) {
        let xAxisOOB = logoPosition.x - logoRadius <= 0 ||
            logoPosition.x + logoRadius >= bounds.width
        let yAxisOOB = logoPosition.y - logoRadius <= 0 ||
            logoPosition.y + logoRadius >= bounds.height
        return (xAxisOOB, yAxisOOB)
    }
    
    private func changeColor() {
        colorIndex = Int.random(in: 0..<colors.count)
    }
    
    // Inits
    
    override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
        
        window?.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(NSWindowDelegate.windowDidResize(_:)), name: NSWindow.didResizeNotification, object: nil)
        logoRadius = min(frame.width, frame.height) / CGFloat(12)
        
        logoPosition = CGPoint(x: frame.width / 2, y: frame.height / 2)
        
        desiredVelocityMagnitude = sqrt(pow(frame.width, 2) - pow(frame.height, 2)) / velocityDenominator
        logoVelocity = initialVelocity()
        
        changeColor()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Lifecycle
    
    override func draw(_ rect: NSRect) {
        drawBackground(.black)
        drawLogo()
    }
    
    private func drawBackground(_ color: NSColor) {
        let background = NSBezierPath(rect: bounds)
        color.setFill()
        background.fill()
    }

    private func drawLogo() {
        let logoRect = NSRect(x: logoPosition.x - logoRadius,
                              y: logoPosition.y - logoRadius,
                              width: logoRadius * 2,
                              height: logoRadius * 2)

        let logo = Logo.path(bounds: logoRect)
        
//        if lighter {
//            colors[colorIndex].lighter()!.setStroke()
//        } else {
//            colors[colorIndex].darker()!.setStroke()
//        }
        
        colors[colorIndex].setStroke()
        colors[colorIndex].setFill()
        logo.lineWidth = 1.0
        
//        logo.stroke()
        logo.fill()
    }
    
    override func animateOneFrame() {
        super.animateOneFrame()
        
        let oobAxes = logoIsOOB()
            if oobAxes.xAxis {
                logoVelocity.dx *= -1
                changeColor()
                lighter = Bool.random()
            }
            if oobAxes.yAxis {
                logoVelocity.dy *= -1
                changeColor()
                lighter = Bool.random()
            }

            logoPosition.x += logoVelocity.dx
            logoPosition.y += logoVelocity.dy

            setNeedsDisplay(bounds)
    }
    
    func windowDidResize(_ notification: Notification) {
        logoPosition = CGPoint(x: frame.width / 2, y: frame.height / 2)
        logoRadius = min(frame.width, frame.height) / CGFloat(10)
        
        desiredVelocityMagnitude = sqrt(pow(frame.width, 2) - pow(frame.height, 2)) / velocityDenominator
        logoVelocity = initialVelocity()
    }
    
}
