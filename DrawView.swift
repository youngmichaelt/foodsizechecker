//
//  DrawView.swift
//  draw
//
//  Created by Mac on 3/19/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit


class DrawView: ShadowView{
    
    
    
    
    var pointColor: CGColor = UIColor.black.cgColor

    
    var isTouching = false
    var i = 0
    
    struct Point {
        let point: CGPoint
    }
    struct Coordinates {
        var xList : Int
        
    }
    
    var points = [Point]()
    var xList : [Int] = []
    var yList : [Int] = []
    var xList2 : [Int] = []
    var yList2 : [Int] = []
    var lengths : [Float] = []
    var widths : [Float] = []
    var areas : [Float] = []
    var areasInches : [Float] = []
    var ouncesArray : [String] = []
    var resetId = 0
    
    var plate_area = 100
    var plate_length = 10
    var deck_length = 3.5
    var deck_width = 2.5
    var deck_area = Float(8.75)
    var deck_oz = Float(3.5)
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        if i == 0{
            
            
            
            guard !isTouching else { return}
            isTouching = true
            guard let touch = touches.first else {return}
            let currentPoint = touch.location(in: self)
            let x = Int(currentPoint.x)
            let y = Int(currentPoint.y)
            xList.append(x)
            yList.append(y)
    //        let coordinates = Coordinates(xList: x)
            isTouching = false
    //        print(coordinates)
            setNeedsDisplay()
        }
        if i >= 1{
            guard !isTouching else { return}
            isTouching = true
            guard let touch = touches.first else {return}
            let currentPoint = touch.location(in: self)
            let x = Int(currentPoint.x)
            let y = Int(currentPoint.y)
            xList2.append(x)
            yList2.append(y)
            //        let coordinates = Coordinates(xList: x)
            isTouching = false
            //        print(coordinates)
            setNeedsDisplay()
        }
        
    }
    
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(10)

        context?.beginPath()
        
        
        
//        if xList != nil && xList.count > 0{
//        context?.move(to: CGPoint(x:xList[0], y:yList[0]))
//        context?.addLine(to: CGPoint(x:100, y:100))
//    //        context?.setStrokeColor(stroke.color)
//        context?.strokePath()
//        }
        if xList.count > 1{
            context?.move(to: CGPoint(x:xList[0], y:yList[0]))
            context?.addLine(to: CGPoint(x:xList[1], y:yList[1]))
            //        context?.setStrokeColor(stroke.color)
            context?.strokePath()
        }
        if xList.count > 2{
            context?.move(to: CGPoint(x:xList[1], y:yList[1]))
            context?.addLine(to: CGPoint(x:xList[2], y:yList[2]))
            //        context?.setStrokeColor(stroke.color)
            context?.strokePath()
        }
        if xList.count > 3{
            context?.move(to: CGPoint(x:xList[2], y:yList[2]))
            context?.addLine(to: CGPoint(x:xList[3], y:yList[3]))
            //        context?.setStrokeColor(stroke.color)
            context?.strokePath()
            context?.move(to: CGPoint(x:xList[3], y:yList[3]))
            context?.addLine(to: CGPoint(x:xList[0], y:yList[0]))
            //        context?.setStrokeColor(stroke.color)
            context?.strokePath()
            
            i+=1
            
        if xList2.count > 1 {
            context?.move(to: CGPoint(x:xList2[0], y:yList2[0]))
            context?.addLine(to: CGPoint(x:xList2[1], y:yList2[1]))
                //        context?.setStrokeColor(stroke.color)
            context?.strokePath()
            }
        if xList2.count > 2 {
            context?.move(to: CGPoint(x:xList2[1], y:yList2[1]))
            context?.addLine(to: CGPoint(x:xList2[2], y:yList2[2]))
                //        context?.setStrokeColor(stroke.color)
            context?.strokePath()
            }
        if xList2.count > 3 {
            context?.move(to: CGPoint(x:xList2[2], y:yList2[2]))
            context?.addLine(to: CGPoint(x:xList2[3], y:yList2[3]))
                //        context?.setStrokeColor(stroke.color)
            context?.strokePath()
            context?.move(to: CGPoint(x:xList2[3], y:yList2[3]))
            context?.addLine(to: CGPoint(x:xList2[0], y:yList2[0]))
            //        context?.setStrokeColor(stroke.color)
            context?.strokePath()
            }
            print(xList.count)
            
        }
    
    
    }
    func erase() {
       
//        yList = []
//        xList2 = []
//        yList2 = []
        xList.removeAll()
        yList.removeAll()
        xList2.removeAll()
        yList2.removeAll()
        ouncesArray.removeAll()
        setNeedsDisplay()
        
        i = 0
        resetId += 1
        print(xList)
        
    }
    
    
    
    func area()  {
        
        if resetId == 0{
        
        var width = xList[1] - xList[0]
        var length = yList[3] - yList[0]
        var area = width * length
        widths.append(Float(width))
        lengths.append(Float(length))
        areas.append(Float(area))
//        print(xList)
//        print(yList)
//        print(width, length, area)
        
        var width2 = xList2[1] - xList2[0]
        var length2 = yList2[3] - yList2[0]
        var area2 = width2 * length2
        widths.append(Float(width2))
        lengths.append(Float(length2))
        areas.append(Float(area2))
//        print(xList2)
//        print(yList2)
//        print(width2, length2, area2)
        
        
        print(widths,lengths)
        //get percent ratio of chicken to plate area
        var percentage = areas[1] / areas[0]
     
       //percent ratio of plate area in inches to big box pixels
       var a_percentage = Float(plate_area) / areas[0]

        var areas_inches = areas[1]*a_percentage
        //convert areas to area inches
        for area in areas{
            var area = area * a_percentage
            areasInches.append(area)
        }
        //get proportions of plate to box pixel length
        var l0 = Float(plate_length) / lengths[0]
        var w0 = Float(plate_length) / widths[0]
        
        var l1 = l0 * lengths[1]
        var w1 = w0 * widths[1]

        var deck_area_percent = areas_inches / deck_area

        var ounces = deck_area_percent * deck_oz
        print(areas)
        print(percentage)
        print(areas_inches)
        print(l0,w0,l1,w1)
        ouncesArray.append(String(ounces))
        print(ouncesArray)
        print(ounces)

//
//
        }
        
        if resetId >= 1{
            
            
            
            
            var width = xList[1] - xList[0]
            var length = yList[3] - yList[0]
            var area = width * length
            widths.append(Float(width))
            lengths.append(Float(length))
            areas.append(Float(area))
            //        print(xList)
            //        print(yList)
            //        print(width, length, area)
            
            var width2 = xList2[1] - xList2[0]
            var length2 = yList2[3] - yList2[0]
            var area2 = width2 * length2
            widths.append(Float(width2))
            lengths.append(Float(length2))
            areas.append(Float(area2))
            //        print(xList2)
            //        print(yList2)
            //        print(width2, length2, area2)
            
            
            print(widths,lengths)
            //get percent ratio of chicken to plate area
            var percentage = areas[3] / areas[2]
            
            //percent ratio of plate area in inches to big box pixels
            var a_percentage = Float(plate_area) / areas[2]
            
            var areas_inches = areas[3]*a_percentage
            //convert areas to area inches
            for area in areas{
                var area = area * a_percentage
                areasInches.append(area)
            }
            //get proportions of plate to box pixel length
            var l0 = Float(plate_length) / lengths[0]
            var w0 = Float(plate_length) / widths[0]
            
            var l1 = l0 * lengths[1]
            var w1 = w0 * widths[1]
            
            var deck_area_percent = areas_inches / deck_area
            
            var ounces = deck_area_percent * deck_oz
            print(areas)
            print(percentage)
            print(areas_inches)
            print(l0,w0,l1,w1)
            ouncesArray.append(String(ounces))
            print(ouncesArray)
            print(ounces)
            
            //
            //
        }
        //
//
    }
}
    
    
    
    
    
//    override func draw(_ rect: CGRect) {
//        var aPath = UIBezierPath()
//
//        aPath.move(to: CGPoint(x:1, y:1))
//
//        aPath.addLine(to: CGPoint(x:100, y:100))
//
//        //Keep using the method addLineToPoint until you get to the one where about to close the path
//
//        aPath.close()
//
//        //If you want to stroke it with a red color
//        UIColor.red.set()
//        aPath.stroke()
//        //If you want to fill it as well
//        aPath.fill()
//    }
    
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        guard !isTouching else { return}
//        isTouching = false
//        guard let touch = touches.first else {return}
//        let currentPoint = touch.location(in: self)
//        let addPoint = Point(point: currentPoint)
//        points.append(addPoint)
//
//        print(points)
//
//
//
//    }
    
    
    
    
    
//    var isDrawing = false
//    var lastPoint: CGPoint!
//    var strokeColor: CGColor = UIColor.black.cgColor
//
//    struct Stroke {
//        let startPoint: CGPoint
//        let endPoint: CGPoint
//        let color: CGColor
//
//    }
//    var strokes = [Stroke]()
//
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        guard !isDrawing else { return}
//        isDrawing = true
//        guard let touch = touches.first else {return}
//        let currentPoint = touch.location(in: self)
//        lastPoint = currentPoint
//        print(currentPoint)
//    }
//
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        guard isDrawing else {return}
//        guard let touch = touches.first else {return}
//        let currentPoint = touch.location(in: self)
//        let stroke = Stroke(startPoint: lastPoint, endPoint: currentPoint, color: strokeColor)
//        strokes.append(stroke)
//        lastPoint = currentPoint
//        setNeedsDisplay()
//        print(currentPoint)
//    }
//
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        guard isDrawing else {return}
//        isDrawing = false
//        guard let touch = touches.first else {return}
//        let currentPoint = touch.location(in: self)
//        let stroke = Stroke(startPoint: lastPoint, endPoint: currentPoint, color: strokeColor)
//        strokes.append(stroke)
//        lastPoint = nil
//        print(currentPoint)
//        setNeedsDisplay()
//    }
//
//    override func draw(_ rect: CGRect) {
//        let context = UIGraphicsGetCurrentContext()
//        for stroke in strokes {
//            context?.beginPath()
//            context?.move(to: stroke.startPoint)
//            context?.addLine(to: stroke.endPoint)
//            context?.setStrokeColor(stroke.color)
//            context?.strokePath()
//        }
//
//    }

