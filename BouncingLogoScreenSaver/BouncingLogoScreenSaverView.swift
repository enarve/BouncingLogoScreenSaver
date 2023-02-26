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
    private var logoRadius: CGFloat = .zero
    private var desiredVelocityMagnitude: CGFloat = 5
    private var velocityDenominator: CGFloat = 150
    
    private var colors: [NSColor] = [
        NSColor(hex: "#61BB46"),
        NSColor(hex: "#FDB827"),
        NSColor(hex: "#F5821F"),
        NSColor(hex: "#E03A3E"),
        NSColor(hex: "#963D97"),
        NSColor(hex: "#009DDC")
    ]
    private var color: NSColor = .white
    
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
        var previousColor: NSColor?
        if let previousColorIndex = colors.firstIndex(of: color) {
            previousColor = colors[previousColorIndex]
            colors.remove(at: previousColorIndex)
        }
        let nextColorIndex = Int.random(in: 0..<colors.count)
        color = colors[nextColorIndex]
        
        if let previousColor = previousColor {
            colors.append(previousColor)
        }
    }
    
    func getLogoPosition() -> CGPoint {
        let buffer = logoRadius + CGFloat(2)
        let maxXPosition = frame.width - logoRadius * 2
        let maxYPosition = frame.height - logoRadius * 2 * 1.195
        let position = CGPoint(x: CGFloat.random(in: buffer...(maxXPosition - buffer)), y: CGFloat.random(in: buffer...(maxYPosition - buffer)))
        print(position)
        return position
    }
    
    // Inits
    
    override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
        
        window?.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(NSWindowDelegate.windowDidResize(_:)), name: NSWindow.didResizeNotification, object: nil)
        
        logoRadius = min(frame.width, frame.height) / CGFloat(12)

        logoPosition = getLogoPosition()
        
        desiredVelocityMagnitude = sqrt(pow(frame.width, 2) - pow(frame.height, 2)) / velocityDenominator
        logoVelocity = initialVelocity()
        
        self.wantsLayer = true
        self.layer?.backgroundColor = .black
//        changeColor()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Lifecycle
    
    override func draw(_ rect: NSRect) {
        drawLogo()
    }

    private func drawLogo() {
        let logoRect = NSRect(x: logoPosition.x - logoRadius,
                              y: logoPosition.y - logoRadius,
                              width: logoRadius * 2,
                              height: logoRadius * 2 * 1.195)

        let logo = Logo.path(bounds: logoRect)
        color.setFill()
        logo.fill()
    }
    
    override func animateOneFrame() {
        super.animateOneFrame()
        animationTimeInterval = 0.0002
        let oobAxes = logoIsOOB()
            if oobAxes.xAxis {
//                changeColor()
                logoVelocity.dx *= -1
            }
            if oobAxes.yAxis {
//                changeColor()
                logoVelocity.dy *= -1
            }

            logoPosition.x += logoVelocity.dx
            logoPosition.y += logoVelocity.dy

        setNeedsDisplay(bounds)
            
    }
    
    func windowDidResize(_ notification: Notification) {
        logoRadius = min(frame.width, frame.height) / CGFloat(10)
        logoPosition = getLogoPosition()
        
        if frame.width >= frame.height {
            desiredVelocityMagnitude = sqrt(pow(frame.width, 2) - pow(frame.height, 2)) / velocityDenominator
        } else {
            desiredVelocityMagnitude = sqrt(pow(frame.height, 2) - pow(frame.width, 2)) / velocityDenominator
        }
        logoVelocity = initialVelocity()
    }
    
}
