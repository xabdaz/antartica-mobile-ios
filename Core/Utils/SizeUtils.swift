//
//  SizeUtils.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 25/10/21.
//

import UIKit

public struct SizeUtils {
    public static func getWidth(containerWidth: CGFloat, horizontalPadding: CGFloat) -> CGFloat {
        let width: CGFloat = containerWidth - (horizontalPadding * 2)
        return width
    }
    public static func getWidthGrid(
        containerWidth: CGFloat,
        horizontalPadding: CGFloat,
        columnSpacing: CGFloat,
        columnCount: Int
    ) -> CGFloat {
        let spaceWidth: CGFloat = SizeUtils.getWidth(
            containerWidth: containerWidth, horizontalPadding: horizontalPadding
        )
        let totalColumnSpacing: CGFloat = CGFloat(columnCount - 1) * columnSpacing
        let width: CGFloat = (spaceWidth - totalColumnSpacing) / CGFloat(columnCount)
        return width
    }
}
