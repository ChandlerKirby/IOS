//
//  AnimalRowView.swift
//  Zoo
//
//  Created by Phantom on 13/6/2022.
//

import SwiftUI

struct AnimalRowView: View {
    @ObservedObject var animal: Animal
    var body: some View {
        Text(animal.animalKind)
    }
}

