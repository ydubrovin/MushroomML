//
//  CGImagePropertyOrientation+UIImageOrientation.swift
//  MushroomML
//
//  Created by Юрий Дубровин on 29/05/2019.
//  Copyright © 2019 Юрий Дубровин. All rights reserved.
//

import UIKit
import ImageIO

extension CGImagePropertyOrientation {
    /**
     Converts a `UIImageOrientation` to a corresponding
     `CGImagePropertyOrientation`. The cases for each
     orientation are represented by different raw values.
     
     - Tag: ConvertOrientation
     */
    init(_ orientation: UIImage.Orientation) {
        switch orientation {
        case .up: self = .up
        case .upMirrored: self = .upMirrored
        case .down: self = .down
        case .downMirrored: self = .downMirrored
        case .left: self = .left
        case .leftMirrored: self = .leftMirrored
        case .right: self = .right
        case .rightMirrored: self = .rightMirrored
        }
    }
}