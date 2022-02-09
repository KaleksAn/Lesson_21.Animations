//
//  ViewController.swift
//  Lesson_21.Animations
//
//  Created by Aleksandr Kan on 04.02.2022.
//

import UIKit

class ViewController: UIViewController {

    var collectionViews = [UIView]() {
        didSet {
            for testView in collectionViews {
                view.addSubview(testView)
            }
        }
    }
    
    var cornersViews = [UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionViews = createViews(pieces: 4)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animationSubViews()
    }
    
    private func animationSubViews() {
        for (index, object) in collectionViews.enumerated() {
            moveView(object, index: index)
        }
    }
    

    private func createViews(pieces count: Int) -> [UIView] {
        var collection = [UIView]()
        
        for numberView in 1...count {
            let newView = UIView(frame: CGRect(x: ViewDefaultValue.x, y: ViewDefaultValue.y + Double(numberView) * ViewDefaultValue.height, width: ViewDefaultValue.width, height: ViewDefaultValue.height))
            newView.backgroundColor = self.randomColor()
            collection.append(newView)
        }
        
        return collection
    }
    
    
    private func moveView(_ item: UIView, index: Int) {
        
        UIView.animate(withDuration: 5,
                       delay: 0,
                       options: getOptions(index)) {
            item.center = CGPoint(x: self.view.bounds.width - item.frame.width / 2, y: item.frame.origin.y + item.frame.height / 2)
            item.backgroundColor = self.randomColor()
        } completion: { finished in
            
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
    
    
    private func makeCornersViews() {
        for i in 1...4 {
            
        }
    }
    
    private func getView(_ number: Int) -> UIView {
        
        switch number {
            case 1:
                let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: ViewDefaultValue.width, height: ViewDefaultValue.height))
                view.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
                return view
            case 2:
                let point = CGPoint(x: view.bounds.width - ViewDefaultValue.width, y: 0.0)
                let view = UIView(frame: CGRect(x: point.x, y: point.y, width: ViewDefaultValue.width, height: ViewDefaultValue.height))
                view.backgroundColor = #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
                return view
            case 3:
                let point = CGPoint(x: 0.0, y: view.bounds.height - ViewDefaultValue.height)
                let view = UIView(frame: CGRect(x: point.x, y: point.y, width: ViewDefaultValue.width, height: ViewDefaultValue.height))
                view.backgroundColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
                return view
                
            case 4:
                let point = CGPoint(x: 0.0, y: view.bounds.height - ViewDefaultValue.height)
                let view = UIView(frame: CGRect(x: point.x, y: point.y, width: ViewDefaultValue.width, height: ViewDefaultValue.height))
                view.backgroundColor = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
                return view
            default:
                return UIView()
        }
    
    }
    
    
    
    private struct ViewDefaultValue {
        static let x = 0.0
        static let y = 100.0
        static let width = 100.0
        static let height = 100.0
        
    }
    
    
}

