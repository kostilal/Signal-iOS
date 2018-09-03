//
//  ProfileProductSortingListSectionController.swift
//  Shafa
//
//  Created by Костюкевич Илья on 03.09.2018.
//  Copyright © 2018 evo.company. All rights reserved.
//

import UIKit
import IGListKit

class ProfileProductSortingListSectionController: ListSectionController {
    var data: Profile.SortingViewModel?
    var selectionCompletition: SelectionHandler?
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let conteinerSize = collectionContext?.containerSize else {
            return CGSize.zero
        }
        
        return CGSize(width: conteinerSize.width, height: 30)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCellFromStoryboard(withIdentifier: "ProfileProductSortingCollectionViewCell", for: self, at: index) as? ProfileProductSortingCollectionViewCell else {
            fatalError("")
        }
        
        if let data = data?.sortingType {
            cell.sortingButton.setTitle(data.localizedString(hashValue: data.hashValue), for: .normal)
        }
        
        return cell
    }
    
    override func didUpdate(to object: Any) {
        if  let object = object as? DiffableBox<Profile.SortingViewModel> {
            data = object.value
        }
    }
    
    override func didSelectItem(at index: Int) {
        guard let type = data?.sortingType else {return}
        
        selectionCompletition?(type.hashValue)
    }
}
