//
//  SecondViewController.swift
//  lesson2
//
//  Created by GEDAKYAN Artur on 06.02.2024.
//
import UIKit

final class CustomButton: UIButton {
    
    init(title: String, imageSystemName: String) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.configure(title: title, imageSystemName: imageSystemName)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(title: String, imageSystemName: String) {
        self.setTitle(title, for: .normal)
        self.backgroundColor = .blue
        
        if let image = UIImage(systemName: imageSystemName) {
            self.setImage(image, for: .normal)
            var config = UIButton.Configuration.plain()
            config.title = title
            config.image = image
            config.imagePadding = 8
            config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
            config.imagePlacement = .trailing
            self.tintColor = .white
            self.backgroundColor = .systemBlue
            self.layer.cornerRadius = 5
            self.configuration = config
        }
    }
    
    override func tintColorDidChange() {
        super.tintColorDidChange()
        self.configuration?.background.backgroundColor = self.tintAdjustmentMode == .dimmed ? .systemGray2 : .systemBlue
        self.tintColor = self.tintAdjustmentMode == .dimmed ? .systemGray3 : .white
    }
}

