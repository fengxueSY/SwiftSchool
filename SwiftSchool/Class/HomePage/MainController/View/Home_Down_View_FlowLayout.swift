//
//  Home_Down_View_FlowLayout.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/5/18.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit

class Home_Down_View_FlowLayout: UICollectionViewFlowLayout {
    // 是否需要设置alpha
    public var setAlpha = InnerConstant.SetAlpha
    // alpha 最小的缩放比
    public var minAlpha = InnerConstant.MinAlpha
    override init() {
        super.init()
    }
    private struct InnerConstant {
        static let MinAlpha: CGFloat = 0
        static let SetAlpha = true
    }
    override public func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    override public func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        // 屏幕上显示的cell
        let array = super.layoutAttributesForElements(in: rect) ?? []
        var attributesCopy = [UICollectionViewLayoutAttributes]()
        for itemAttributes in array {
            let itemAttributesCopy = itemAttributes.copy() as! UICollectionViewLayoutAttributes
            // add the changes to the itemAttributesCopy
            attributesCopy.append(itemAttributesCopy)
        }
        
        // 计算 CollectionView 的中点
        let centerX = collectionView!.contentOffset.x + collectionView!.frame.size.width * 0.5
        for attrs in attributesCopy {
            // 计算 cell 中点的 x 值 与 centerX 的差值
            let delta = abs(centerX - attrs.center.x)
            let baseScale = 1 - delta / (collectionView!.frame.size.width + itemSize.width)
            let alpha = minAlpha + baseScale * (1 - minAlpha)
            if setAlpha {
                // 改变透明度（越到中间 越不透明）
                attrs.alpha = abs(alpha)
            }
        }
        return attributesCopy
    }
    override public func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        let size = collectionView!.frame.size
        // 计算可见区域的面积
        let rect = CGRect.init(x: proposedContentOffset.x, y: proposedContentOffset.y, width: size.width, height: size.height)
        let array = super.layoutAttributesForElements(in: rect) ?? []
        // 计算 CollectionView 中点值
        let centerX = proposedContentOffset.x + collectionView!.frame.size.width * 0.5
        // 标记 cell 的中点与 UICollectionView 中点最小的间距
        var minDetal = CGFloat(MAXFLOAT)
        for attrs in array {
            if abs(minDetal) > abs(centerX - attrs.center.x) {
                minDetal = attrs.center.x - centerX
            }
        }
        return CGPoint.init(x: proposedContentOffset.x + minDetal, y: proposedContentOffset.y)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
