//
//  DecimalUtils.swift
//  Bankey
//
//  Created by Артем Орлов on 19.10.2022.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        NSDecimalNumber(decimal: self).doubleValue
    }
}
