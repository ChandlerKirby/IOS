//
//  AnimalViewModel.swift
//  Zoo
//
//  Created by Phantom on 13/6/2022.
//

import Foundation
import Foundation
import SwiftUI

fileprivate let defaultImage = Image(systemName: "Photo")
fileprivate var downloadedImages = [URL : Image]()
extension Animal {
    var animalKind : String {
        get {kind ?? ""}
        set {
            kind = newValue
            save()
        }
        
    }
    
    var legs: String{
        get { String(numberOfLegs)}
        set {
            guard let legs = Int16(newValue) else { return }
            numberOfLegs = legs
            save()
    }
    }
    var urlString: String{
        get { imageURL?.absoluteString ?? ""}
        set {
            guard let url = URL(string: newValue) else{ return }
            imageURL = url
            save()
        }
    }
    
    func getimage() -> Image {
        guard let url = imageURL else { return defaultImage}
        if let image = downloadedImages[url] { return image }
        guard let data = try? Data(contentsOf: url),
              let uiImg = UIImage(data:data) else { return defaultImage }
        let image = Image(uiImage: uiImg).resizable()
        downloadedImages[url] = image
        return image
    }
    
    @discardableResult
    func save() -> Bool {
        do{
            try managedObjectContext?.save()
        } catch{
            print("Error saving: \(error)")
            return false
        }
        return true
        
    }
}
