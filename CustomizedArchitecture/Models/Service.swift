//
//  Service.swift
//  CustomizedArchitecture
//
//  Created by Cecilia Chen on 1/11/25.
//

import Foundation

struct Service: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let description: String
    let price: Double
}

let sampleServices = [
    Service(name: "Home Cleaning", description: "Professional home cleaning service.", price: 49.99),
    Service(name: "Lawn Mowing", description: "Keep your lawn tidy and neat.", price: 29.99),
    Service(name: "Car Wash", description: "Detailed car cleaning inside and out.", price: 19.99),
    Service(name: "Dog Walking", description: "Daily dog walking service.", price: 14.99)
]
