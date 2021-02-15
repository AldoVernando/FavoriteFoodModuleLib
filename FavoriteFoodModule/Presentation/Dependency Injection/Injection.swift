//
//  Injection.swift
//  FavoriteFoodModule
//
//  Created by aldo vernando on 15/02/21.
//

import Foundation
import RealmSwift

public class Injection: NSObject {
    
    private func provideLocaleDataSource() -> LocaleDataSourceProtocol {
        let realm = try? Realm()
        return LocaleDataSource(realm: realm)
    }
    
    private func provideRepository() -> FoodRepositoryProtocol {
        let locale = provideLocaleDataSource()
        return FoodRepository(locale: locale)
    }
    
    public func provideInteractor() -> FoodUseCase {
        let foodRepository = provideRepository()
        return FoodInteractor(repository: foodRepository)
    }
}
