//
//  ContentView.swift
//  ClockBedtimeSchedule
//
//  Created by Ginger on 04/11/2020.
//

import SwiftUI

let startColor: Color = Color(red: 1.0, green: 0.63, blue: 0.05)
let endColor: Color = Color(red: 1.0, green: 0.83, blue: 0.03)

struct ContentView: View {
    @State var totalLocation: CGPoint
    @State var totalStartLocation: CGPoint
    @State var sleepLocation: CGPoint
    @State var sleepStartLocation: CGPoint
    @State var wakeupLocation: CGPoint
    @State var wakeupStartLocation: CGPoint
    
    var body: some View {
        var isFix: Bool = false
        
        if getSleepWakeupAngles(start: sleepStartLocation, end: sleepLocation) > getSleepWakeupAngles(start: wakeupStartLocation, end: wakeupLocation) {
            isFix = true
        }
        
        let totalDragGesture = DragGesture()
            .onChanged {
                totalStartLocation = $0.startLocation
                totalLocation = $0.location
            }
        
        let sleepDragGesture = DragGesture()
            .onChanged {
                sleepStartLocation = $0.startLocation
                
                sleepLocation = $0.location
            }
        
        let wakeupDragGesture = DragGesture()
            .onChanged {
                wakeupStartLocation = $0.startLocation
                wakeupLocation = $0.location
            }
        
        
        return ZStack {
            Rectangle()
                .foregroundColor(.black)
                .edgesIgnoringSafeArea(.all)
            VStack {
                //Spacer()
                ZStack {
                    Circle()
                        .stroke(Color.white.opacity(0.2), lineWidth: 40)
                        .frame(width: 314, height: 314)
                    ZStack {
                        Circle()
                            .trim(
                                from: CGFloat((isFix ? getSleepWakeupAngles(start: wakeupStartLocation, end: wakeupLocation) : getSleepWakeupAngles(start: sleepStartLocation, end: sleepLocation)) / 360.0),
                                to: CGFloat((isFix ? getSleepWakeupAngles(start: sleepStartLocation, end: sleepLocation) : getSleepWakeupAngles(start: wakeupStartLocation, end: wakeupLocation)) / 360.0)
                            )
                            .stroke(
                                AngularGradient(
                                    gradient: Gradient(colors: isFix ? [endColor, startColor] : [startColor, endColor]),
                                    center: .center,
                                    startAngle: .degrees(isFix ? getSleepWakeupAngles(start: wakeupStartLocation, end: wakeupLocation) : getSleepWakeupAngles(start: sleepStartLocation, end: sleepLocation)),
                                    endAngle: .degrees(isFix ? getSleepWakeupAngles(start: sleepStartLocation, end: sleepLocation) : getSleepWakeupAngles(start: wakeupStartLocation, end: wakeupLocation))
                                ),
                                style: StrokeStyle(lineWidth: 40, lineCap: .round)
                            )
                        ZStack {
                            // Bell
                            ZStack {
                                Circle()
                                    .foregroundColor(Color.black)
                                Image(systemName: "bell.fill")
                                    .font(.system(size: 20))
                                    .foregroundColor(endColor)
                                    .rotationEffect(.degrees(-getTotalAngles(start: totalStartLocation, end: totalLocation)-getSleepWakeupAngles(start: wakeupStartLocation, end: wakeupLocation)))
                            }
                            .offset(x: 157)
                            .rotationEffect(.degrees(getSleepWakeupAngles(start: wakeupStartLocation, end: wakeupLocation)))
                            .gesture(wakeupDragGesture)
                            
                            // ZZZ
                            ZStack {
                                Circle()
                                    .foregroundColor(Color.black)
                                Image(systemName: "zzz")
                                    .font(.system(size: 20))
                                    .foregroundColor(startColor)
                                    .rotationEffect(.degrees(-getTotalAngles(start: totalStartLocation, end: totalLocation)-getSleepWakeupAngles(start: sleepStartLocation, end: sleepLocation)))
                            }
                            .offset(x: 157)
                            .rotationEffect(.degrees(getSleepWakeupAngles(start: sleepStartLocation, end: sleepLocation)))
                            .gesture(sleepDragGesture)
                            
                            /*Path { path in
                                path.move(to: CGPoint(x: 0, y: 0))
                                path.addLine(to: sleepLocation)
                            }
                            .stroke(Color.green, lineWidth: 2)*/
                        }
                        .frame(width: 36, height: 36, alignment: .center)
                        //.border(Color.blue)
                        
                        /*Path { path in
                            path.move(to: CGPoint(x: -40, y: 157))
                            path.addLine(to: CGPoint(x: 350, y: 157))
                        }
                        .stroke(Color.white.opacity(0.5), lineWidth: 1)*/
                    }
                    .frame(width: 314, height: 314)
                    //.border(Color.red)
                    
                } .rotationEffect(.degrees(getTotalAngles(start: totalStartLocation, end: totalLocation)))
                .gesture(totalDragGesture)
                /*
                Group {
                    Text("Wakeup")
                        .font(.title)
                    Text("startx: \(wakeupStartLocation.x), starty: \(wakeupStartLocation.y)")
                        .foregroundColor(.white)
                    Text("locationx: \(wakeupLocation.x), locationy: \(wakeupLocation.y)")
                        .foregroundColor(.white)
                    Text("\(getSleepWakeupAngles(start: wakeupStartLocation, end: wakeupLocation))")
                        .foregroundColor(.white)
                        .padding(.bottom)
                }
                    
                Group {
                    Text("Sleep")
                        .font(.title)
                    Text("startx: \(sleepStartLocation.x), starty: \(sleepStartLocation.y)")
                        .foregroundColor(.white)
                    Text("locationx: \(sleepLocation.x), locationy: \(sleepLocation.y)")
                        .foregroundColor(.white)
                    Text("\(getSleepWakeupAngles(start: sleepStartLocation, end: sleepLocation))")
                        .foregroundColor(.white)
                        .padding(.bottom)
                }
                
                Group {
                    
                    Text("Total")
                        .font(.title)
                    Text("startx: \(totalStartLocation.x), starty: \(totalStartLocation.y)")
                        .foregroundColor(.white)
                    Text("locationx: \(totalLocation.x), locationy: \(totalLocation.y)")
                        .foregroundColor(.white)
                    Text("\(getSleepWakeupAngles(start: totalStartLocation, end: totalLocation))")
                        .foregroundColor(.white)
                }*/
            }
            
            /*Path { path in
                path.move(to: CGPoint(x: UIScreen.main.bounds.size.width / 2, y: 0))
                path.addLine(to: CGPoint(x: UIScreen.main.bounds.size.width / 2, y: UIScreen.main.bounds.size.height))
            }
            .stroke(Color.white.opacity(0.4), lineWidth: 1)*/
        }
    }
}

func getTotalAngles(start: CGPoint, end: CGPoint) -> Double {
    let middle = CGPoint(x: 157, y: 157)
    
    let startX = start.x - middle.x
    let startY = start.y - middle.y
    let atanStart = atan2(startX, startY)
    
    let endX = end.x - middle.x
    let endY = end.y - middle.y
    let atanEnd = atan2(endX, endY)
    
    let angle = Double(atanStart - atanEnd) * 180 / Double.pi
    return angle
}

func getSleepWakeupAngles(start: CGPoint, end: CGPoint) -> Double {
    let middle = CGPoint(x: 0, y: 0)
    
    let startX = start.x - middle.x
    let startY = start.y - middle.y
    let atanStart = atan2(startX, startY)
    
    let endX = end.x - middle.x
    let endY = end.y - middle.y
    let atanEnd = atan2(endX, endY)
    
    var angle = Double(atanStart - atanEnd) * 180 / Double.pi
    
    if (angle < 0) {
        angle += 360;
    }
    
    return angle
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(totalLocation: .zero, totalStartLocation: .zero, sleepLocation: .zero, sleepStartLocation: .zero, wakeupLocation: .zero, wakeupStartLocation: .zero)
    }
}
