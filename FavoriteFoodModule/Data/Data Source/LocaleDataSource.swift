//
//  LocaleDataSource.swift
//  FavoriteFoodModule
//
//  Created by aldo vernando on 15/02/21.
//

import Foundation
import RealmSwift
import RxSwift

protocol LocaleDataSourceProtocol {
    func getFoods() -> Observable<[FoodEntity]>
    func addFood(food: FoodEntity) -> Observable<Bool>
    func isFoodExists(id: String) -> Bool
    func removeFood(id: String) -> Observable<Bool>
}

class LocaleDataSource: NSObject {
    
    let realm: Realm?
    init(realm: Realm?) {
        self.realm = realm
    }
}

extension LocaleDataSource: LocaleDataSourceProtocol {
    
    func getFoods() -> Observable<[FoodEntity]> {
        
        return Observable<[FoodEntity]>.create { observer in
            if let realm = self.realm {
                let foods = realm.objects(FoodEntity.self).sorted(byKeyPath: "name", ascending: true)
                observer.onNext(Array(foods))
                observer.onCompleted()
            }
            
            return Disposables.create()
        }
    }
    
    func addFood(food: FoodEntity) -> Observable<Bool> {
        
        return Observable<Bool>.create { observer in
            if let realm = self.realm {
                do {
                    try realm.write {
                        realm.add(food, update: .all)
                        observer.onNext(true)
                        observer.onCompleted()
                    }
                } catch let error {
                    observer.onError(error)
                }
            }
            
            return Disposables.create()
        }
    }
    
    func isFoodExists(id: String) -> Bool {
        if let realm = realm {
            return realm.object(ofType: FoodEntity.self, forPrimaryKey: id) != nil
        }
        return false
    }
    
    func removeFood(id: String) -> Observable<Bool> {
        
        return Observable<Bool>.create { observer in
            if let realm = self.realm {
                do {
                    try realm.write {
                        if let object = realm.object(ofType: FoodEntity.self, forPrimaryKey: id) {
                            realm.delete(object)
                            observer.onNext(true)
                            observer.onCompleted()
                        }
                    }
                } catch let error {
                    observer.onError(error)
                }
            }
            
            return Disposables.create()
        }
    }
}
