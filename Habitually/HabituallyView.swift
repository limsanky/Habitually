//
//  HabituallyView.swift
//  Habitually
//
//  Created by Sankarshana V on 2022/02/03.
//

import SwiftUI

struct HabituallyView: View {
    @ObservedObject var habits: Habits
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HabituallyView(habits: Habits())
    }
}
