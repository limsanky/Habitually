//
//  HabituallyView.swift
//  Habitually
//
//  Created by Sankarshana V on 2022/02/03.
//

import SwiftUI

struct HabituallyView: View {
    @ObservedObject var viewModel: Habits
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.habits) { habit in
                        NavigationLink {
                            SingleHabitView(habit: habit)
                        } label: {
                            VStack(alignment: .leading) {
                                habitTitle(habit)
                                habitDaysCompleted(habit)
                            }
                        }
                    }
                    .onDelete(perform: viewModel.remove)
                }
                .toolbar {
                    Button {
                        // Add a Habit
                    } label: {
                        Image(systemName: "plus.circle")
                    }
                }
            }
            .navigationTitle("Habitually!")
        }
    }
    
    func habitTitle(_ habit: Habit) -> some View {
        Text(habit.title).font(.title2)
    }
    
    func habitDaysCompleted(_ habit: Habit) -> some View {
        Text("Days Completed: \(habit.daysCompleted)").font(.caption).opacity(0.6)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let dummyHabits = Habits()
        
        let coding = Habit(habitType: .coding, timePerformed: 0, title: "Coding", daysCompleted: 0)
        let gym = Habit(habitType: .exercise, timePerformed: 30, title: "Gymming", daysCompleted: 30)
        let drawing = Habit(habitType: .drawing, timePerformed: 10, title: "Drawing", daysCompleted: 15)
        let instrument = Habit(habitType: .instrument, timePerformed: 60, title: "Playing the Guitar", daysCompleted: 600)
        
        dummyHabits.add([coding, gym, instrument, drawing])
        
        return HabituallyView(viewModel: dummyHabits)
    }
}
