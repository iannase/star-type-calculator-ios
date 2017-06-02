//
//  ViewController.swift
//  Astronomy Star Type Calculator
//
//  Created by Ian on 2/11/17.
//  Copyright © 2017 IanAnnase. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let sunTemp = 5778.0;
    let sunRad = 432288.0;
    var starTemp = 0.0;
    var starRad = 0.0;
    var luminosity = 0.0;
    var tempCompare = 0.0;
    var radiusCompare = 0.0;
    var type = ""
    var color = ""
    var chromacity = ""
    var percentile = 0.0
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var starClassLabel: UILabel!
    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var magLabel: UILabel!
    @IBOutlet weak var kelvinLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var starType: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    
    
    @IBAction func sliderChange(_ sender: Any) {
        let slider1 = slider.value
        tempLabel.text = String(format: "%.2fK", slider1)
        calculate()
    }
    
        
    func calculate() {
        
        if tempLabel.text == "0K" {
            return
        }
        
        starTemp = Double(slider.value)
        tempCompare = pow(starTemp / sunTemp, 4);
        radiusCompare = pow(starRad / sunRad, 2);
        
        if (starTemp > 250 && starTemp <= 550)
        {
            type = "Y";
            percentile = 1 - (starTemp - 250.0) / 300.0
            image1.image = UIImage(named: "Y")
        }
        if (starTemp > 550 && starTemp <= 1300)
        {
            type = "T";
            percentile = 1 - (starTemp - 550.0) / 750.0
            image1.image = UIImage(named: "T")
        }
        if (starTemp > 1300 && starTemp <= 2400)
        {
            type = "L";
            percentile = 1 - (starTemp - 1300.0) / 1100.0
            image1.image = UIImage(named: "L")
        }
        if (starTemp > 2400 && starTemp <= 3500)
        {
            type = "M";
            percentile = 1 - (starTemp - 2400.0) / 1100.0;
            image1.image = UIImage(named: "M")
        }
        if (starTemp > 3500 && starTemp <= 5000)
        {
            type = "K";
            percentile = 1 - (starTemp - 3500.0) / 1500.0;
            image1.image = UIImage(named: "K")
        }
        if (starTemp > 5000 && starTemp <= 6000)
        {
            type = "G";
            percentile = 1 - (starTemp - 5000.0) / 1000.0;
            image1.image = UIImage(named: "G")
        }
        if (starTemp > 6000 && starTemp <= 7500)
        {
            type = "F";
            percentile = 1 - (starTemp - 6000.0) / 1500.0;
            image1.image = UIImage(named: "F")
        }
        if (starTemp > 7500 && starTemp <= 10000)
        {
            type = "A";
            percentile = 1 - (starTemp - 7500.0) / 2500.0;
            image1.image = UIImage(named: "A")
        }
        if (starTemp > 10000 && starTemp <= 30000)
        {
            type = "B";
            percentile = 1 - (starTemp - 10000.0) / 20000.0;
            image1.image = UIImage(named: "B")
        }
        if (starTemp > 30000 && starTemp <= 60000)
        {
            type = "O";
            percentile = 1 - (starTemp - 30000.0) / 30000.0;
            image1.image = UIImage(named: "O")
        }
        
        starType.text = String("\(type) Type")
        starClassLabel.text = String(type) + String(format:"%.2f", percentile * 10)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let contentInsets = UIEdgeInsetsMake(0.0, 0.0, 100, 0.0);
        scrollView.contentInset = contentInsets;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

