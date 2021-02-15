//
//  FoodInteractor.swift
//  FavoriteFoodModule
//
//  Created by aldo vernando on 15/02/21.
//

import Foundation
import RxSwift
import FoodCatalogueModule

public protocol FoodUseCase {
    func getFavoriteFood() -> Observable<[FoodModel]>
    func addFavoriteFood(food: FoodModel) -> Observable<Bool>
    func isFavorite(id: String) -> Bool
    func removeFavoriteFood(id: String) -> Observable<Bool>
}

public class FoodInteractor: FoodUseCase {
    
    private let foodRepository: FoodRepositoryProtocol
    
    init(repository: FoodRepositoryProtocol) {
        self.foodRepository = repository
    }
    
    public func getFavoriteFood() -> Observable<[FoodModel]> {
        return foodRepository.getFavoriteFood()
    }
    
    public func addFavoriteFood(food: FoodModel) -> Observable<Bool> {
        return foodRepository.addFavoriteFood(food: food)
    }
    
    public func isFavorite(id: String) -> Bool {
        return foodRepository.isFavorite(id: id)
    }
    
    public func removeFavoriteFood(id: String) -> Observable<Bool> {
        return foodRepository.removeFavoriteFood(id: id)
    }
}
