//
//  HabituallyView.swift
//  Habitually
//
//  Created by Sankarshana V on 2022/02/03.
//

import SwiftUI

struct HabituallyView: View {
    @ObservedObject var viewModel: Habits
    @State private var showAddSheet = false
    
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
                                timeInvested(in: habit)
                            }
                        }
                    }
                    .onDelete(perform: viewModel.remove)
                }
                .toolbar {
                    addButton
                }
                .sheet(isPresented: $showAddSheet) {
                    AddHabitView()
                }
            }
            .navigationTitle("Habitually!")
        }
        .environmentObject(viewModel)
    }
    
    private var addButton: some View {
        Button {
            showAddSheet = true
        } label: {
            Image(systemName: "plus")
        }
    }
    
    private func habitTitle(_ habit: Habit) -> some View {
        Text(habit.title).font(.title2)
    }
    
    private func timeInvested(in habit: Habit) -> some View {
        Text("\(habit.investedTimeInHoursInString) invested")
            .opacity(0.6)
            .font(.caption)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let dummyHabits = Habits()
        
        let coding = Habit(habitType: .coding, description: "I like coding!", timePerformed: 0, title: "Coding", daysCompleted: 0)
        let gym = Habit(habitType: .exercise, description: "", timePerformed: 30, title: "Gymming", daysCompleted: 30)
        let drawing = Habit(habitType: .drawing, description: "", timePerformed: 10, title: "Drawing", daysCompleted: 15)
        let instrument = Habit(habitType: .instrument, description: "I like playing the guitar a lot!", timePerformed: 60, title: "Playing the Guitar", daysCompleted: 600)
        
        dummyHabits.add([coding, gym, instrument, drawing])
        
        return HabituallyView(viewModel: dummyHabits)
    }
}
