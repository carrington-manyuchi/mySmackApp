//
//  AvatarPickerCollectionViewCell.swift
//  mySmackApp
//
//  Created by Manyuchi, Carrington C on 2025/03/20.
//

import UIKit

enum AvatarType {
    case dark
    case light
}

class AvatarPickerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    func setupView() {
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
    func configureCell(index: Int, type: AvatarType) {
        if type == AvatarType.dark {
            avatarImage.image = UIImage(named: "dark\(index)")
            self.layer.backgroundColor = UIColor.lightGray.cgColor
        } else {
            avatarImage.image = UIImage(named: "light\(index)")
            self.layer.backgroundColor = UIColor.gray.cgColor
        }
    }
    
    
}
