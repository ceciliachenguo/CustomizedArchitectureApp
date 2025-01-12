//
//  Order.swift
//  CustomizedArchitecture
//
//  Created by Cecilia Chen on 1/11/25.
//

import Foundation

struct Order: Identifiable, Hashable {
    let id = UUID()
    let serviceName: String
    let totalAmount: Double
}

let sampleOrders = [
    Order(serviceName: "Home Cleaning", totalAmount: 49.99),
    Order(serviceName: "Lawn Mowing", totalAmount: 29.99),
    Order(serviceName: "Car Wash", totalAmount: 19.99),
    Order(serviceName: "Dog Walking", totalAmount: 14.99)
]
