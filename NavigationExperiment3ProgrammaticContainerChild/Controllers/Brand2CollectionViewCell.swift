//
//  Brand2CollectionViewCell.swift
//  NavigationExperiment3ProgrammaticContainerChild
//
//  Created by Albert Yu on 5/18/20.
//  Copyright © 2020 AlbertDemo. All rights reserved.
//

import UIKit

class Brand2CollectionViewCell: UICollectionViewCell {
        var count: Int = 0
         var circleCount: Int = 0
        static let reuseIdentifier = "brand-cell2"
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


    extension Brand2CollectionViewCell {
        func configure() {
            
            contentContainerView.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(contentContainerView)
            contentContainerView.backgroundColor = .gray
            
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.text = "B2"
            contentContainerView.addSubview(titleLabel)
            
            circleColorView.translatesAutoresizingMaskIntoConstraints = false
            // drawCircle(view: circleColorView, radius: CGFloat(20))
            circleColorView.backgroundColor = UIColor.sasssy
            contentView.addSubview(circleColorView)
            
            alphabetLabel.translatesAutoresizingMaskIntoConstraints = false
            alphabetLabel.text = "C"
            alphabetLabel.textColor = .white
            circleColorView.addSubview(alphabetLabel)
            
            // print("Hi")
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
                
                
                titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                titleLabel.topAnchor.constraint(equalTo: circleColorView.bottomAnchor),
                titleLabel.bottomAnchor.constraint(equalTo: contentContainerView.bottomAnchor)
            ])
        }
        
     override func layoutIfNeeded() {
            super.layoutIfNeeded()
        print("Break")
        print(circleColorView.center)
        print(contentContainerView.center)
        print(contentView.center)
        
            drawBlackCircle(view: circleColorView, radius: 50)
            drawCircle2(view: contentView, radius: 50)
        drawCircle3(view: contentContainerView, radius: 10)
            circleColorView.bringSubviewToFront(alphabetLabel)
        }
        

        
        
          func drawBlackCircle(view: UIView, radius: CGFloat) {
              self.circleCount = self.circleCount + 1
              
            print("black", view.center)
        
              let centerX = view.center.x
              let centerY = view.center.y

              let center = CGPoint(x: centerX, y: centerY)
              print(center)
              let circlePath = UIBezierPath(arcCenter: center, radius: radius, startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)
              let shapeLayer = CAShapeLayer()
              shapeLayer.path = circlePath.cgPath
            shapeLayer.fillColor = UIColor.clear.cgColor
              shapeLayer.strokeColor = UIColor.black.cgColor
              shapeLayer.lineWidth = 3.0
              view.layer.addSublayer(shapeLayer)
             }
        
        func dc(view: UIView, center: CGPoint, radius: CGFloat) {
              self.circleCount = self.circleCount + 1
              
            print("black", view.center)

              print(center)
              let circlePath = UIBezierPath(arcCenter: center, radius: radius, startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)
              let shapeLayer = CAShapeLayer()
              shapeLayer.path = circlePath.cgPath
            shapeLayer.fillColor = UIColor.clear.cgColor
              shapeLayer.strokeColor = UIColor.cyan.cgColor
              shapeLayer.lineWidth = 3.0
              view.layer.addSublayer(shapeLayer)
             }
        
        
    
      func drawCircle2(view: UIView, radius: CGFloat) {
          self.circleCount = self.circleCount + 1
            print("blue", view.center)
    
          let centerY = view.center.y
          let centerX = view.center.x

          let center = CGPoint(x: centerX, y: centerY)
          
          let circlePath = UIBezierPath(arcCenter: center, radius: radius, startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)
          let shapeLayer = CAShapeLayer()
          shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
          shapeLayer.strokeColor = UIColor.blue.cgColor
          shapeLayer.lineWidth = 3.0
          view.layer.addSublayer(shapeLayer)
         }
        
        
          func drawCircle3(view: UIView, radius: CGFloat) {
              self.circleCount = self.circleCount + 1
              
        
              let centerY = view.center.y
              let centerX = view.center.x

              let center = CGPoint(x: centerX, y: centerY)
              
              let circlePath = UIBezierPath(arcCenter: center, radius: radius, startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)
              let shapeLayer = CAShapeLayer()
              shapeLayer.path = circlePath.cgPath
              shapeLayer.fillColor = UIColor.red.cgColor
              shapeLayer.strokeColor = UIColor.black.cgColor
              shapeLayer.lineWidth = 3.0
              view.layer.addSublayer(shapeLayer)
             }




}
