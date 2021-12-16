//
//  ViewController.swift
//  test1111
//
//  Created by Eram on 12/13/21.
//

import UIKit

class ViewController: UIViewController {
    
    var student: [String: Int] = [:]
    
    var theSum = 0
    var max = 0
    var min = 0
    var maxName = ""
    var minName = ""
    var count = 0
    var g : String = ""
    var gr : String = ""
    var mean : Double = 0.0
    
    @IBOutlet weak var t1: UITextField!
    @IBOutlet weak var t2: UITextField!
    
    @IBOutlet weak var s1: UILabel!
    @IBOutlet weak var s2: UILabel!
    @IBOutlet weak var s3: UILabel!
    
    @IBAction func add(_ sender: UIButton) {
        let getInput1 = t1.text!
        let getInput2 = Int(t2.text!)
    
        
        if t1.hasText && t2.hasText && getInput2! >= 0
        {
            student[getInput1] = getInput2
            s1.text = getInput1
            s2.text = String(getInput2!)
            s3.text = "Succeed"
            
            t1.text = nil
            t2.text = nil
            
        }else{
            s1.text = "None"
            s2.text = "None"
            s3.text = "Failed"
        }
        
        }

            
    @IBAction func calc(_ sender: Any) {
        for (key, value) in student{
            theSum = theSum + value
            if count == 0
            {
                maxName = key
                min = value
            }
            
            count = count + 1
            
        
        if min > value {
            maxName = key
            min = value
        }
    
    if max < value{
        minName = key
        max = value
    }
    
            
        }
        
     mean = Double(theSum)/Double(student.count)
    
            let grade1 = min
            switch grade1
        {
            case 93...100: g = "A"
            case 85...92: g = "B"
            case 77...84: g = "C"
            case 69...76: g = "D"
            case 60...68: g = "E"
            case 0...59: g = "F"
            default: g = ""
                
            }
        
        let grade2 = max
        switch grade2
    {
        case 93...100: gr = "A"
        case 85...92: gr = "B"
        case 77...84: gr = "C"
        case 69...76: gr = "D"
        case 60...68: gr = "E"
        case 0...59: gr = "F"
        default: gr = ""
            
        }
        
        
        
        self.performSegue(withIdentifier: "SomeID", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SomeID" {
            let destination = segue.destination as! ResultsViewController
            destination.maxN = maxName
            destination.ma = max
            destination.minN = minName
            destination.mi = min
            destination.avrg = mean
            destination.g1 = g
            destination.g2 = gr
        }
    }
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
        s1.text = "Name"
        s2.text = "Score"
    }
    
}


class ResultsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        maxName.text = maxN
        max.text = String(ma)
        minName.text = minN
        min.text = String(mi)
        avg.text = String(avrg)
        grade1.text = g1
        grade2.text = g2
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBOutlet weak var maxName: UILabel!
    @IBOutlet weak var max: UILabel!
    
    @IBOutlet weak var minName: UILabel!
    @IBOutlet weak var min: UILabel!
    
    @IBOutlet weak var avg: UILabel!
    
    @IBOutlet weak var grade1: UILabel!
    @IBOutlet weak var grade2: UILabel!
    
    var maxN : String = ""
    var ma : Int = 0
    var minN : String = ""
    var mi : Int = 0
    var avrg : Double = 0.0
    var g1 : String = ""
    var g2 : String = ""
    
    
    
}

