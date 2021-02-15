//
//  FavoriteFoodPresenter.swift
//  FavoriteFoodModule
//
//  Created by aldo vernando on 15/02/21.
//

import Foundation
import RxSwift
import FoodCatalogueModule

protocol FavoriteFoodPresenterProtocol {
    func getFavoriteFood() -> Observable<[FoodModel]>
    func addFavoriteFood(food: FoodModel) -> Observable<Bool>
    func isFavorite(id: String) -> Bool
    func removeFavoriteFood(id: String) -> Observable<Bool>
}

public class FavoriteFoodPresenter: FavoriteFoodPresenterProtocol {
    
    private let foodInteractor: FoodUseCase
    
    public init(interactor: FoodInteractor) {
        self.foodInteractor = interactor
    }
    
    public func getFavoriteFood() -> Observable<[FoodModel]> {
        return foodInteractor.getFavoriteFood()
    }
    
    public func addFavoriteFood(food: FoodModel) -> Observable<Bool> {
        return foodInteractor.addFavoriteFood(food: food)
    }
    
    public func isFavorite(id: String) -> Bool {
        return foodInteractor.isFavorite(id: id)
    }
    
    public func removeFavoriteFood(id: String) -> Observable<Bool> {
        return foodInteractor.removeFavoriteFood(id: id)
    }
}
