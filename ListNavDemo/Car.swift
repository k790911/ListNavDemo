//
//  Car.swift
//  ListNavDemo
//
//  Created by 김재훈 on 5/25/24.
//  Car 구조체 추가

import Foundation

struct Car: Codable, Identifiable {
    var id: String
    var name: String
    
    var description: String
    var isHybrid: Bool
    
    var imageName: String
}
