//
//  FoodRepository.swift
//  FavoriteFoodModule
//
//  Created by aldo vernando on 15/02/21.
//

import Foundation
import RxSwift
import FoodCatalogueModule

protocol FoodRepositoryProtocol {
    func getFavoriteFood() -> Observable<[FoodModel]>
    func addFavoriteFood(food: FoodModel) -> Observable<Bool>
    func isFavorite(id: String) -> Bool
    func removeFavoriteFood(id: String) -> Observable<Bool>
}

class FoodRepository: FoodRepositoryProtocol {
    
    private let locale: LocaleDataSourceProtocol
    
    init(locale: LocaleDataSourceProtocol) {
        self.locale = locale
    }
    
    func getFavoriteFood() -> Observable<[FoodModel]> {
        
        var foods: [FoodModel] = []
            
        return Observable<[FoodModel]>.create { observer in
            
            self.locale.getFoods()
                .observeOn(MainScheduler.instance)
                .subscribe { result in
                    foods = result.map { food -> FoodModel in
                        
                        return FoodModel(id: food.id, label: food.name, nutrients: nil, category: food.category, categoryLabel: nil, image: food.image ?? "")
                    }
                } onCompleted: {
                    observer.onNext(foods)
                    observer.onCompleted()
                }
            
            return Disposables.create()
        }
    }
    
    func addFavoriteFood(food: FoodModel) -> Observable<Bool> {
        let food = FoodEntity(id: food.id, name: food.label, category: food.category ?? "", image: food.image)
        return locale.addFood(food: food)
    }
    
    func isFavorite(id: String) -> Bool {
        return locale.isFoodExists(id: id)
    }
    
    func removeFavoriteFood(id: String) -> Observable<Bool> {
        return locale.removeFood(id: id)
    }
}
