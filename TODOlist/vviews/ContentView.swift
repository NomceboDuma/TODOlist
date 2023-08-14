//
//  ContentView.swift
//  TODOlist
//
//  Created by Nomcebo Duma on 2023/03/11.
//

import SwiftUI

enum Priority: String, Identifiable, CaseIterable {
    
    var id: UUID {
        return UUID()
    }
    case House = "House Staff"
    case Shopping = "Shopping"
    case SchoolWork = "SchoolWork"
    case inprogress = "inprogress"
}
extension Priority {
    var title: String {
        switch self {
        case.House:
            return "House staff"
        case .Shopping:
            return "Shopping"
        case .SchoolWork:
            return "School"
        case .inprogress:
            return "InProgress"
        }
    }
}
struct ContentView: View {
    
    @State private var selectedTask: Task?
    @State private var isRenamingTask = false
    @State private var stroken = false
    @State private var isOn = false
    @State private var title: String = ""
    @State private var selectedPriority: Priority = .inprogress
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(key: "dateCreated", ascending: false)])private var allTasks: FetchedResults<Task>
    
    @State var dateCreated: Date = Date()
    @State var textField: String = ""
    @State var dataArray:[String] = []
    @State var reminderIsOn = false
    @State var setDueDate = Date.now
    @State var notes = ""
    @State var isCompleted = false
    
    @State var searchText = ""
    
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
    
    @ViewBuilder
    private func styleForPriority(value: String?) -> some View {
        
        if let  value = value,
           !value.isEmpty {
            let priority = Priority(rawValue: value)
            
            switch priority {
            case .House:
                Image(systemName: "house.circle")
            case .SchoolWork:
                Image(systemName: "book.circle")
            case .Shopping:
                Image(systemName: "cart.circle")
            case .inprogress:
                Image(systemName: "minus.circle")
            case .none:
                Image(systemName: "minus.circle")
            }
        }
         else {
            Image(systemName: "circle")


        }

    }
    
    private func moveTask(from source: IndexSet,to destination: Int) {
        let reversedSource = source.sorted()
        for _ in reversedSource.reversed() {
            //  Task.insert(Task.remove(at: index), at: destination)
            do {
                try viewContext.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    private func deleteTask(at offsets: IndexSet) {
        offsets.forEach { index in
            let task = allTasks[index]
            viewContext.delete(task)
            do {
                try viewContext.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    private func updateTask(_ task: Task) {
        
        task.isFavourite = !task.isFavourite
        
        do {
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    var body: some View {
        
        NavigationView {
            VStack {
                TextField("AddItem", text: $title)
                    .textFieldStyle(.roundedBorder)
                
                Picker("Priority", selection: $selectedPriority) {
                    ForEach(Priority.allCases) { Priority in Text(Priority.title).tag(Priority)
                    }
                }.pickerStyle(.segmented)
                
                Button("save")  {
                    saveTask()
                    
                }
                .padding(10)
                .frame(maxWidth: 100)
                .background(Color.purple)
                .foregroundColor(.white)
                .cornerRadius(10)
                Spacer()
                
                
                 List {
                    ForEach(allTasks) { task in
                        HStack {
                            styleForPriority(value: task.group?.title)
                            Spacer().frame(width: 40)
                            
                           
                            TextField("Enter task title", text: Binding(
                                get: { task.title ?? "" },
                                set: { newValue in
                                    task.title = newValue
                                
                                    saveTask()
                                }
                            ))
                            
                            Spacer()
                            NavigationLink(destination: EditView(task: task)) {}
                            
                            Image(systemName: "")
                                .foregroundColor(.black)
                                .padding()
                                .frame(width: 20, height: 20)
                                .background(Color.white.opacity(0.4))
                                .clipShape(Circle())
                            Image(systemName: task.isFavourite ? "checkmark.square": "square")
                                .foregroundColor(.black)
                                .onTapGesture {
                                    updateTask(task)
                                }
                        }
                    }.onDelete(perform: deleteTask)
                        .onMove(perform: moveTask )
                }

                Spacer()
            }
            .padding()
            
            .navigationTitle("ToDoList....📝")
            .font(.custom("American Typewriter", size: 12))
            .toolbar {
                NavigationLink(destination: DetailView()) {
                    Image(systemName: "")
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: 20, height: 20)
                        .background(Color.white.opacity(0.4))
                        .clipShape(Circle())
                }
            }
            .navigationBarItems(leading: Button(action: {
                //code for leading button
            }, label: {
                Text("")
            }), trailing: EditButton())
            .searchable(text: $searchText)
            
            
        }
    
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let persistenceController = PersistenceController.shared
        ContentView().environment(\.managedObjectContext,persistenceController.container.viewContext)
        
    }
}










