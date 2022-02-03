//
//  HabituallyApp.swift
//  Habitually
//
//  Created by Sankarshana V on 2022/02/03.
//

import SwiftUI

@main
struct HabituallyApp: App {
    @StateObject var habits = Habits()
    
    var body: some Scene {
        WindowGroup {
            HabituallyView(habits: habits)
        }
    }
}
