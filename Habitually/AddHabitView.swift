//
//  AddHabitView.swift
//  Habitually
//
//  Created by Sankarshana V on 2022/02/04.
//

import SwiftUI

struct AddHabitView: View {
    @State private var title = "hi"
    @State private var desc = ""
    @State private var days = 0
    @State private var time = 0.0
    @State private var type: HabitType = .reading
    
    @Environment(\.dismiss) private var dismiss
    
    @EnvironmentObject var viewModel: Habits
    
    var body: some View {
        NavigationView {
            Form {
                typePicker
                addTitle
                addDesc
                addTime
                addDays
            }
            .navigationBarTitle("Create Habit")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    cancel
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    if title != "" {
                        save
                    }
                }
            }
        }
    }
    
    private var cancel: some View {
        Button("Cancel", role: .destructive) {
            dismiss()
        }
    }
    
    private var save: some View {
        Button("Save") {
            let habit = Habit(habitType: type, description: desc, timePerformed: time, title: title, daysCompleted: days, id: UUID())
            
            viewModel.add(habit)
            dismiss()
        }
    }
    
    private var addTitle: some View {
        Section("Title") {
            TextField("Add Title", text: $title)
        }
    }
    
    private var addDesc: some View {
        Section("Description") {
            TextField("Add Desciption", text: $desc)
        }
    }
    
    private var addTime: some View {
        Section("Minutes Invested") {
            TextField("Add Time", value: $time, format: .number)
        }
    }
    
    private var addDays: some View {
        Section("Days Performed") {
            Stepper("\(days)", value: $days, in: 0...365)
        }
    }
    
    private var typePicker: some View {
        Section("Type") {
            Picker("\(type.rawValue.capitalized)", selection: $type) {
                ForEach(HabitType.allCases) { Text($0.rawValue.capitalized) }
            }
        }
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView()
    }
}
