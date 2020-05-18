//
//  BrandCollectionViewCell.swift
//  NavigationExperiment3ProgrammaticContainerChild
//
//  Created by Albert Yu on 5/15/20.
//  Copyright © 2020 AlbertDemo. All rights reserved.
//

import UIKit

// RED



class BrandCollectionViewCell: UICollectionViewCell {
    var count: Int = 0
    var circleCount: Int = 0
    static let reuseIdentifier = "brand-cell"
    let titleLabel = UILabel()
    let circleColorView = UIView()
    let contentContainerView = UIView()
    let alphabetLabel = UILabel()
    
    /* Required Methods */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension BrandCollectionViewCell {
    func configure() {
        contentContainerView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(contentContainerView)
        contentView.backgroundColor = UIColor.greenApples
        self.backgroundColor = .cyan
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Name B1"
        titleLabel.textColor = .white
        titleLabel.layer.masksToBounds = false
        titleLabel.backgroundColor = UIColor.perfectOrange
        contentContainerView.addSubview(titleLabel)
        
        circleColorView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(circleColorView)
        circleColorView.backgroundColor = .red
        
        alphabetLabel.translatesAutoresizingMaskIntoConstraints = false
        alphabetLabel.text = "B"
        alphabetLabel.textColor = .white
        circleColorView.addSubview(alphabetLabel)
        
        NSLayoutConstraint.activate([
            contentContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentContainerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
           circleColorView.centerXAnchor.constraint(equalTo: contentContainerView.centerXAnchor),
            circleColorView.topAnchor.constraint(equalTo: contentContainerView.topAnchor),
            circleColorView.heightAnchor.constraint(equalTo: contentContainerView.heightAnchor, multiplier: 0.75),
            circleColorView.widthAnchor.constraint(equalTo: circleColorView.heightAnchor),
            
            alphabetLabel.centerXAnchor.constraint(equalTo: circleColorView.centerXAnchor),
            alphabetLabel.centerYAnchor.constraint(equalTo: circleColorView.centerYAnchor),
            
            
            titleLabel.centerXAnchor.constraint(equalTo: contentContainerView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: circleColorView.bottomAnchor),
            // titleLabel.bottomAnchor.constraint(equalTo: contentContainerView.bottomAnchor)
        ])
        
//        let centerY = circleColorView.center.y
//        let centerX = circleColorView.center.x
//        print("Weird \(circleColorView.center)")
//        print (centerY)
//        print (centerX)
//        let center = CGPoint(x: centerX, y: centerY)
//
//        let circlePath = UIBezierPath(arcCenter: center, radius: CGFloat(30), startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)
//        let shapeLayer = CAShapeLayer()
//        shapeLayer.path = circlePath.cgPath
//        shapeLayer.fillColor = UIColor.black.cgColor
//        shapeLayer.strokeColor = UIColor.red.cgColor
//        shapeLayer.lineWidth = 3.0
//        circleColorView.layer.addSublayer(shapeLayer)
    }
    
//    override func layoutSubviews() {
//           super.layoutSubviews()
//           drawCircle(view: circleColorView, radius: 20)
//        self.count = self.count + 1
//        print(self.count)
//        print(self.circleCount)
//       }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        drawCircle(view: circleColorView, radius: 20)
        circleColorView.bringSubviewToFront(alphabetLabel)
    }
    
    func drawCircle(view: UIView, radius: CGFloat) {
        self.circleCount = self.circleCount + 1
        
  
        let centerY = view.center.y
        let centerX = view.center.x

        let center = CGPoint(x: centerX, y: centerY)
        
        let circlePath = UIBezierPath(arcCenter: center, radius: radius, startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = UIColor.black.cgColor
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 3.0
        view.layer.addSublayer(shapeLayer)
       }
}



