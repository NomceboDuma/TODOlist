//
//  File.swift
//  TODOlist
//
//  Created by Nomcebo Duma on 2023/03/11.
//

//import Foundation
//nvironment(\.managedObjectContext) private var viewContext
//@FetchRequest( entity: ToDolists.entity(),sortDescriptors:[]) private var todolists: FetchedResults<ToDolists>
//@State var name: String = ""
//@State var date: String = ""
//NavigationView {
//    
//    TextField("TODOLists name", text: $name)
//    TextField(" TODOLists date", text: $date)
//    
//    HStack {
//        Spacer()
//        Button("Add") {
//            addList()
//            
//        }
//        Spacer()
//        NavigationLink(destination: ResultView(name: name, viewContext: viewContext)) {
//            
//            Text("Find")
//        }
//        
//        Spacer()
//        Button("Clear") {
//            name = ""
//            date = ""
//        }
//        Spacer()
//        
//    }
//    .padding()
//    .textFieldStyle(RoundedBorderTextFieldStyle())
//    
//    
//    List {
//        ForEach(todolists) { ToDolists in
//            HStack {
//                Text(ToDolists.name ?? "Not found")
//                Spacer()
//                Text(ToDolists.date ?? "Not found")
//                
//                
//            }
//        }
//        .onDelete(perform: deleteTODOLists)
//    }
//    .navigationTitle("TODOLists...📝")
//    
//}
//.padding()
//
//.textFieldStyle(RoundedBorderTextFieldStyle())
//
//}
//
//
//private func addList() {
//
//withAnimation {
//    let todolists = ToDolists(context: viewContext)
//    todolists.name = name
//    todolists.date = date
//    
//    saveContext()
//    
//    
//}
//}
//
//private func saveContext() {
//do {
//    try viewContext.save()
//} catch {
//    let error = error as NSError
//    fatalError("An error occured: \(error)")
//    
//}
//
//}
//private func deleteTODOLists(offset: IndexSet) {
//withAnimation {
//    offset.map { todolists[$0]}.forEach(viewContext.delete)
//    saveContext()
//}
//}
//struct ResultView: View {
//    
//    
//    
//    var name: String
//    var viewContext: NSManagedObjectContext
//@State var matches: [ToDolists]?
//
//var body: some View {
//    
//    return VStack {
//        List {
//            ForEach(matches ?? []) { match in
//                HStack {
//                    Text(match.name ?? "Not found")
//                    Spacer()
//                    Text(match.date ?? "Not found")
//                }
//            }
//        }
//        navigationTitle("Results")
//    }
//    .task {
//        
//        let fetchRequest: NSFetchRequest<ToDolists> = ToDolists.fetchRequest()
//        
//        fetchRequest.entity = ToDolists.entity()
//        fetchRequest.predicate = NSPredicate(
//            format: "name CONTAINS %@", name
//            )
//        matches = try? viewContext.fetch(fetchRequest)
//    }
//    }
//}
