//
//  MushroomEntity.swift
//  MushroomML
//
//  Created by Юрий Дубровин on 25/05/2019.
//  Copyright © 2019 Юрий Дубровин. All rights reserved.
//

import Foundation
import SQLite

let mushroom = Table("mushroom")
let idMushroom = Expression<Int64>("idMushroom")
let rusName = Expression<String>("rusName")
let latName = Expression<String>("latName")
let edibility = Expression<Int64>("edibility")
let descriptionMushroom = Expression<String>("descriptionMushroom")
let image = Expression<String>("image")
