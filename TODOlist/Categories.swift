//
//  Categories.swift
//  TODOlist
//
//  Created by Nomcebo Duma on 2023/03/23.
//
//
import SwiftUI

//enum Category: String, Identifiable, CaseIterable {
//
//
//    var id: UUID {
//        return UUID()
//    }
//    case Category = "Category"
//    case House = "House"
//    case Shopping = "Shopping"
//    case School = "School"
//
//}
//extension Category {
//    var title: String {
//        switch self {
//        case.House:
//            return "House staff"
//        case .Shopping:
//            return "Shopping"
//        case .School:
//            return "School"
//        case .Category:
//            return "Category"
//
//        }
//    }
//}
 
//struct Categories: View {
//    @State private var selectedGroup = .cate
//    @State private var title: String = ""
//    @Environment(\.managedObjectContext) private var viewContext
//    
//    @FetchRequest(entity: Group.entity(), sortDescriptors: [NSSortDescriptor(key: "dateCreated", ascending: false)])private var allTasks: FetchedResults<Group>
//    
////    
//    private func updateTask(_ task: Task) {
//        
//        task.isFavourite = !task.isFavourite
//        
//        do {
//            try viewContext.save()
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
//    
//    
//    
//    
//    private func saveTask() {
//        do {
//            let task = Task(context: viewContext)
//            task.title = title
//            task.category = selectedCategory.rawValue
//            task.dateCreated = Date()
//            try viewContext.save()
//        } catch {
//            print(error.localizedDescription)
//            
//        }
//        
//    }
//    
//    private func styleForCategory(value: String) -> Color {
//        let Category = Category(rawValue: value)
//        
//        switch Category {
//        case .Shopping:
//            return Color.green
//        case .House:
//            return Color.yellow
//        case .School:
//            return Color.red
//        case .none:
//            return Color.white
//        case .some(.Category):
//            return Color.white
//        }
//    }
//    
//    
//    var body: some View {
//        NavigationStack {
//            Form {
//                Section {
//                    TextField("Add Category", text: $title)
//                        .textFieldStyle(.roundedBorder)
//                    
//                    Picker("", selection: $selectedCategory) {
//                        ForEach(Category.allCases) { Category in Text(Category.title).tag(Category)
//                        }
//                    }.pickerStyle(.menu)
//                    
//                    
//                    Button("save")  {
//                        saveTask()
//                        
//                    }
//                    .padding(10)
//                    .frame(maxWidth: .infinity)
//                    .background(Color.purple)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//                    Spacer()
//                    
//                    List {
//                        ForEach(allTasks) { task in
//                            HStack {
//                                Circle()
//                                    .fill(styleForCategory(value: task.category!))
//                                    .frame(width: 15, height:  15)
//                                Spacer().frame(width: 20)
//                                Text(task.title ?? "")
//                                Spacer()
//                                //                                    NavigationLink(destination: Categories()) {
//                                //                                    Image(systemName: task.isFavourite ? "": "")
//                                    .foregroundColor(.black)
//                                    .onTapGesture {
//                                        updateTask(task)
//                                    }
//                            }
//                        }
//                        }
//                    }
//                }
//            }
//        }
//        
//        
//        struct Categories_Previews: PreviewProvider {
//            static var previews: some View {
//                Categories()
//            }
//        }
//    }

