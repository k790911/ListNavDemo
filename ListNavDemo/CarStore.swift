//
//  CarStore.swift
//  ListNavDemo
//
//  Created by 김재훈 on 5/25/24.
//  데이터 저장소 역할

import Foundation

class CarStore: ObservableObject {
    
    @Published var cars: [Car]
    
    init(cars: [Car] = []) {
        self.cars = cars
    }
}
