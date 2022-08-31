//
//  AnimalView.swift
//  Zoo
//
//  Created by Phantom on 13/6/2022.
//

import SwiftUI

struct AnimalView: View {
    @Environment(\.editMode) var editMode
    @ObservedObject var animal: Animal
    @State var animalKind = ""
    @State var animalLegs = ""
    @State var imageURL = ""
    var body: some View {
        List {
            if editMode?.wrappedValue == .active{
                TextField("Enter kind of animal", text: $animalKind){
                    $animal.animalKind.wrappedValue = animalKind
                }
                TextField("Enter number of legs", text: $animalLegs){
                    $animal.legs.wrappedValue = animalLegs
                }
                TextField("Enter image URL", text: $imageURL){
                    $animal.urlString.wrappedValue = imageURL
                }
                
            } else{
                Text(animal.animalKind)
                Text("Legs: \(animal.legs)")
                animal.getimage().aspectRatio(contentMode: .fit)
            }


            }.navigationTitle(animal.animalKind)
    }
    

}


