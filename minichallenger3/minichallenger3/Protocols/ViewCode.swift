//
//  ViewCode.swift
//  minichallenger3
//
//  Created by Lucas Tavares on 13/05/19.
//  Copyright © 2019 Guimbo. All rights reserved.
//

import Foundation

protocol ViewCode {
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfigurantion()
    func setupView()
}

extension ViewCode {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfigurantion()
    }
}
