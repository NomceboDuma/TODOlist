//
//  DetailView.swift
//  TODOlist
//
//  Created by Nomcebo Duma on 2023/03/14.
//

import SwiftUI

struct DetailView: View {
    @State var textEditorText: String = ""
    @State var savedText: String = ""
    @State private var selectedPriority: Priority = .inprogress
    @State private var newtitle = ""
    @State private var title: String = ""
    @Environment(\.managedObjectContext) private var viewContext
    @State var setDueDate = Date.now
    
    private func saveTask() {
        do {
            let task = Task(context: viewContext)
            task.title = title
            task.priority = selectedPriority.rawValue
            task.dateCreated = Date()
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
            
        }
        
    }
    
    var body: some View {
        NavigationView {
            
            VStack {
            
                TextEditor(text: $title)
                    .textFieldStyle(.roundedBorder)
                DatePicker("Set Due Date", selection: $setDueDate)
                    .padding(.bottom,50)
                
//                Picker("Priority", selection: $selectedPriority) {
//                    ForEach(Priority.allCases) { Priority in Text(Priority.title).tag(Priority)
//                    }
//                }.pickerStyle(.wheel)
                
                Button("save")  {
                    saveTask()
                    
                }
                
                .padding(10)
                .frame(maxWidth: 100)
                .background(Color.purple)
                .foregroundColor(.white)
                .cornerRadius(10)
                Spacer()
                
            }
//                TextField("", text: $newtitle)
//                    .frame(height: 250)
//                    .background(Color(.secondarySystemBackground))
//                    .foregroundColor(Color("fontColor"))
//                Button(action: {
//                }, label: {
//                    Text("save".uppercased())
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .background(Color.purple)
//                        .cornerRadius(10)
//
//                })
//                Text(savedText)
//
//                Spacer()
//
//            }
//            .padding()
//            //.background(Color(.s))
//
//            Picker("Priority", selection: $selectedPriority) {
//                ForEach(Priority.allCases) { Priority in Text(Priority.title).tag(Priority)
//                }
//                Spacer()
//            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
