//
//  ViewController.swift
//  try3
//
//  Created by seongjun cho on 2022/03/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UITextField!
    @IBOutlet weak var btns: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func touch(_ sender: UIButton) {

        display.text! += sender.currentTitle!
    }
    @IBAction func do_cal(_ sender: UIButton) {
        var elemental = ""
        var j : Int = 0
        var slicer: [String] = [""]
 
        for elemental in display.text!
        {
            if (elemental == "+" || elemental == "-" || elemental == "*" || elemental == "/"){
                slicer.append(String(elemental))
                slicer.append("")
                j += 2
            }
            else
            {
                slicer[j] += String(elemental);
            }
        }
        
        j = 0;
        while (j < slicer.count)
        {
            if (slicer[j] == "*"){
               slicer[j - 1] = String(Int64(slicer[j - 1])! * Int64(slicer[j + 1])!)
                slicer.remove(at: j)
                slicer.remove(at: j)
            }
            else if (slicer[j] == "/"){
                slicer[j - 1] = String(Int64(slicer[j - 1])! / Int64(slicer[j + 1])!)
                 slicer.remove(at: j)
                 slicer.remove(at: j)
            }
            j += 1
        }
        var num : Int64 = Int64(slicer[0])!
        j = 0;
        while (j < slicer.count)
        {
            if (slicer[j] == "+"){
                num += Int64(slicer[j + 1])!
            }
            else if (slicer[j] == "-"){
                num -= Int64(slicer[j + 1])!
            }
            j += 1
        }
        display.text! = String(num)
    }
}
