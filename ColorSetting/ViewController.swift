//
//  ViewController.swift
//  ColorSetting
//
//  Created by Алексей Зарудный on 04.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    class Color {
        private var red: CGFloat
        private var green: CGFloat
        private var blue: CGFloat

        init(red: Float, green: Float, blue: Float) {
            self.red = CGFloat(red)
            self.green = CGFloat(green)
            self.blue = CGFloat(blue)
        }
        func setupRed(red: Float) {
            self.red = CGFloat(red)
        }
        func setupGreen(green: Float) {
            self.green = CGFloat(green)
        }
        func setupBlue(blue: Float) {
            self.blue = CGFloat(blue)
        }
        func getColor() -> UIColor {
            let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
            return color
        }
    }

    @IBOutlet var mainArea: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redValue: UILabel!
    @IBOutlet var greenValue: UILabel!
    @IBOutlet var blueValue: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    var color: Color!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainArea.layer.cornerRadius = 20
        
        redLabel.text = "Red"
        greenLabel.text = "Green"
        blueLabel.text = "Blue"
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        color = Color(red: redSlider.value, green: greenSlider.value, blue: blueSlider.value)
        mainArea.backgroundColor = color.getColor()
    }
    
    @IBAction func redSliderAction() {
        redValue.text = String(round(redSlider.value * 100) / 100)
        color.setupRed(red: redSlider.value)
        mainArea.backgroundColor = mainArea.backgroundColor?.withAlphaComponent(CGFloat(redSlider.value))
        mainArea.backgroundColor = color.getColor()
    }

    @IBAction func greenSliderAction() {
        greenValue.text = String(round(greenSlider.value * 100) / 100)
        color.setupGreen(green: greenSlider.value)
        mainArea.backgroundColor = mainArea.backgroundColor?.withAlphaComponent(CGFloat(greenSlider.value))
        mainArea.backgroundColor = color.getColor()
    }

    @IBAction func blueSliderAction() {
       blueValue.text = String(round(blueSlider.value * 100) / 100)
        color.setupBlue(blue: blueSlider.value)
        mainArea.backgroundColor = mainArea.backgroundColor?.withAlphaComponent(CGFloat(blueSlider.value))
        mainArea.backgroundColor = color.getColor()
    }
}

