//
//  FavoritesCoreDataProvider.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 18/05/22.
//

import UIKit
import CoreData

class FavoritesCoreDataProvider: FavoritesDataProviderProtocol {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    func saveFavorite(showId: Int) {
        let favorite = Favorite(context: context)
        favorite.showId = Int32(showId)
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    func loadFavoritesIds() -> [Int] {
        var favoriteList: [Favorite] = []
        let fetchRequest: NSFetchRequest<Favorite> = Favorite.fetchRequest()
        do {
            favoriteList = try context.fetch(fetchRequest)
        } catch {
            print(error)
        }
        return favoriteList.map({ Int($0.showId) })
    }
    
    func deleteFavorite(showId: Int){
        let fetchRequest: NSFetchRequest<Favorite> = Favorite.fetchRequest()
        fetchRequest.predicate = NSPredicate.init(format: "showId==\(showId)")
        let objects = try! context.fetch(fetchRequest)
        for obj in objects {
            context.delete(obj)
        }
        
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
}
