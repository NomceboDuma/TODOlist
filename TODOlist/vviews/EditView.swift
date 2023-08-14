//
//  EditView.swift
//  TODOlist
//
//  Created by Nomcebo Duma on 2023/03/23.
//

import SwiftUI

struct EditView: View {
    @State private var title: String = ""
    @ObservedObject var task: Task
    @State var setDueDate = Date.now
    
    private func SaveTask() {
        do{
            try task.managedObjectContext?.save()
        }catch{
            print(error.localizedDescription)
        }
    }
    // other view components abd logic here
    
    var body: some View {
        VStack{
            
            TextField("Title", text: $title)
            Picker("Priority", selection: $task.priority) {
                ForEach(Priority.allCases) {priority in
                    Text(priority.title).tag(priority.rawValue)
                }
            }.pickerStyle(.menu)
            Button("save") {
                SaveTask()
            }
            .padding(10)
            .frame(maxWidth: 100)
            .background(Color.purple)
            .foregroundColor(.white)
            .cornerRadius(10)
            Spacer()
            DatePicker("Set Due Date", selection: $setDueDate)
                .padding(.bottom,50)
        }
        }
    }



struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(task: Task())
    }
}
