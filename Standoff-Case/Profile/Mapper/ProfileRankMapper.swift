//
//  ProfileRankMapper.swift
//  Standoff-Case
//
//  Created by Astemir Shibzuhov on 1/29/23.
//

import Foundation

enum ProfileRankMapper {
    func mapRank(_ rank: RankModel) -> ProfileRankCollectionCell.DisplayItem {
        return .init(title: rank.title, image: rank.image)
    }
}
