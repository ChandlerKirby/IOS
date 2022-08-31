//
//  ContentView.swift
//  Zoo
//
//  Created by Phantom on 13/6/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Animal.kind, ascending: true)],
        animation: .default)
    private var animals: FetchedResults<Animal>

    var body: some View {
        NavigationView {
            List {
                ForEach(animals) { animal in
                    NavigationLink {
                        AnimalView(animal: animal)
                            .navigationBarItems(trailing: EditButton())
                    } label: {
                        AnimalRowView(animal: animal)
                    }
                }
                .onDelete(perform: deleteAnimals)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addAnimal) {
                        Label("Add Animal", systemImage: "plus")
                    }
                }
            }
            Text("Select an animal")
        }
    }

    private func addAnimal() {
        withAnimation {
            let newAnimal = Animal(context: viewContext)
            newAnimal.kind = "New Animal"

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteAnimals(offsets: IndexSet) {
        withAnimation {
            offsets.map { animals[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let animalFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
