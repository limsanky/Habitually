//
//  SingleHabitView.swift
//  Habitually
//
//  Created by Sankarshana V on 2022/02/03.
//

import SwiftUI

struct SingleHabitView: View {
    var habit: Habit
    
    var body: some View {
        Text(habit.title)
    }
}

struct SingleHabitView_Previews: PreviewProvider {
    static var previews: some View {
        SingleHabitView(habit: Habit(habitType: .coding, timePerformed: 0, title: "Coding", daysCompleted: 50))
    }
}
