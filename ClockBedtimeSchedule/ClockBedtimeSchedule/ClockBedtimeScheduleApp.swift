//
//  ClockBedtimeScheduleApp.swift
//  ClockBedtimeSchedule
//
//  Created by Ginger on 04/11/2020.
//

import SwiftUI

@main
struct ClockBedtimeScheduleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(totalLocation: .zero, totalStartLocation: .zero, sleepLocation: .zero, sleepStartLocation: .zero, wakeupLocation: .zero, wakeupStartLocation: .zero)
        }
    }
}
