//
//  ViewController.swift
//  Lesson_21.Animations
//
//  Created by Aleksandr Kan on 04.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var testView_02 = UIImageView()
    
    var collectionViews = [UIView]() {
        didSet {
            addElements(from: collectionViews)
        }
    }
    
    var cornersViews = [UIView]() {
        didSet {
            addElements(from: cornersViews)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let imageName = "1.png"
        let image_01 = UIImage(named: imageName)
        let imageView = UIImageView(image: image_01!)
        imageView.frame = CGRect(x: 100, y: 100, width: 200, height: 300)
        view.addSubview(imageView)
        imageView.animationDuration = 6
        imageView.startAnimating()
        
        let viewAnimated = UIImageView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        viewAnimated.backgroundColor = .white
        viewAnimated.animationDuration = 6
        viewAnimated.startAnimating()
        
        
        testView_02 = imageView
        createViews(pieces: 4)
        makeCornersViews()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animationSubViews()
        
        for (number, element) in cornersViews.enumerated() {
            viewFromCroner(element, for: number)
        }
        
    }
    
    private func animationSubViews() {
        for (index, object) in collectionViews.enumerated() {
            moveView(object, index: index)
        }
    }
    

    private func createViews(pieces count: Int) {
        for numberView in 1...count {
            let newView = UIView(frame: CGRect(x: ViewDefaultValue.x, y: ViewDefaultValue.y + Double(numberView) * ViewDefaultValue.height, width: ViewDefaultValue.width, height: ViewDefaultValue.height))
            newView.backgroundColor = self.randomColor()
            collectionViews.append(newView)
        }
    }
    
    
    private func moveView(_ item: UIView, index: Int) {
        
        UIView.animate(withDuration: 5,
                       delay: 0,
                       options: getOptions(index)) {
            item.center = CGPoint(x: self.view.bounds.width - item.frame.width / 2, y: item.frame.origin.y + item.frame.height / 2)
            item.backgroundColor = self.randomColor()
        } completion: { finished in
            print("FINISH")
        }

    }
    
   
    
    private func getOptions(_ number: Int) -> UIView.AnimationOptions {
        
        switch number {
            case 1:
                return [.curveEaseInOut, .repeat, .autoreverse]
            case 2:
                return [.curveLinear, .repeat, .autoreverse]
            case 3:
                return [.curveEaseIn, .repeat, .autoreverse]
            default:
                return [.curveEaseOut, .repeat, .autoreverse]
        }
        
    }
    
    private func randomColor() -> UIColor {
        return UIColor(red: CGFloat.random(in: 0.0...1.0), green: CGFloat.random(in: 0.0...1.0), blue: CGFloat.random(in: 0.0...1.0), alpha: 1.0)
    }
    
    
    //MARK: - Views for corners
    private func makeCornersViews() {
        for i in 0...3 {
             let (rect, color, _ ) = arrayWithValues[i]
                let newView = UIView(frame: rect)
                newView.backgroundColor = color
                cornersViews.append(newView)
    
        }
    }
    
    
    
   typealias myType = (CGRect, UIColor, Double)
    
    
    
    lazy var arrayWithValues = [(CGRect(x: 0.0, y: 0.0, width: ViewDefaultValue.width, height: ViewDefaultValue.height), #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1) , -Double.pi),
                                    (CGRect(x: view.bounds.width - ViewDefaultValue.width, y: 0.0, width: ViewDefaultValue.width, height: ViewDefaultValue.height), #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1) , Double.pi),
                                    (CGRect(x: view.bounds.width - ViewDefaultValue.width, y: view.bounds.height - ViewDefaultValue.height, width: ViewDefaultValue.width, height: ViewDefaultValue.height), #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1) , -Double.pi),
                                    (CGRect(x: 0.0, y: view.bounds.height - ViewDefaultValue.height, width: ViewDefaultValue.width, height: ViewDefaultValue.height), #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1) , Double.pi) ]

    
    private func getRCP(_ number: inout Int) -> myType {
        if number >= arrayWithValues.count { number = 0 }
        return arrayWithValues[number]
    }
    
    private func viewFromCroner(_ moveView: UIView, for index: Int) {
        var num = index + 1
        let (rect, color, pi) = getRCP(&num)
            
        UIView.animate(withDuration: 5,
                       delay: 0,
                       options: .curveEaseInOut) {
            moveView.frame = rect
            moveView.backgroundColor = color
            moveView.transform = CGAffineTransform(rotationAngle: pi)
            self.testView_02.center = CGPoint(x: Double.random(in: 0.0...820), y: Double.random(in: 0.0...1180))
        } completion: { finished in
            self.viewFromCroner(moveView, for: num)
        }

    }
    
    
    private func addElements(from array: [UIView]) {
        for element in array {
            view.addSubview(element)
        }
    }
    
    private struct ViewDefaultValue {
        static let x = 0.0
        static let y = 100.0
        static let width = 100.0
        static let height = 100.0
        
    }
    
    
}

