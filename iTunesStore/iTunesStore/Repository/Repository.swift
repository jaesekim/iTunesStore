//
//  Repository.swift
//  iTunesStore
//
//  Created by 김재석 on 4/8/24.
//

import Foundation
import RealmSwift

final class Repository {
    
    private let realm = try! Realm()
    
    func createItem<T: Object> (_ item: T) {
        do {
            try realm.write {
                realm.add(item)
            }
        } catch {
            print("Realm Create Error", error)
        }
    }
    
    func fetchItem<T: Object> (_ type: T.Type) -> [T] {
        return Array(realm.objects(T.self))
    }
    
    func deleteItem<T: Object> (_ item: T) {
        do {
            try realm.write {
                realm.delete(item)
            }
        } catch {
            print("Delete Item Error", error)
        }
    }
}
