//
//  SimpleVC1.swift
//  locser
//
//  Created by Hiloni Mehta on 2/16/20.
//  Copyright © 2020 Hiloni Mehta. All rights reserved.
//

import UIKit

class SimpleVC1: UIViewController {
    //@State private var wakeUp = Date()
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var datePicker1: UIDatePicker!
    

    //@IBOutlet weak var lblDate: UILabel!
    
    //@IBOutlet weak var lblDate1: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/mm/yyyy"
        
        //lblDate.text = formatter.string(from: datePicker.date)
        
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "dd/mm/yyyy"
        
        //lblDate1.text = formatter.string(from: datePicker1.date)

        
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func dateSelected(_ sender: Any) {
        
        print("date action")
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/mm/yyyy"
        
        //lblDate.text = formatter.string(from: datePicker.date)
        
    }
    
    @IBAction func dateSelected1(_ sender: Any) {
        
        print("date1 action")
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/mm/yyyy"
        
        //lblDate1.text = formatter.string(from: datePicker1.date)
    }
}
