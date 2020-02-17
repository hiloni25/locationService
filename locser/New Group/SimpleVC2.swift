//
//  SimpleVC2.swift
//  locser
//
//  Created by Hiloni Mehta on 2/16/20.
//  Copyright © 2020 Hiloni Mehta. All rights reserved.
//

import UIKit
import FirebaseDatabase


class SimpleVC2: UIViewController {
    
    @IBOutlet weak var lab1: UILabel!
    struct post{
        let latitude: String!
        let longitude: String!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("entered view2")
        
        //let abc = curl "https://locser-c26a4.firebaseio.com/"
        //print("abc")
        //print(abc)
        
        //let abc = curl 'https://[PROJECT_ID].firebaseio.com/users/jack/name.json'
        //let posts = [post]
        let ref = Database.database().reference()
        
        ref.child("posts").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            print(value)
            for i in Array(value!){
                print(i.1)
                
                let newi = i.1 as? NSDictionary
                print(type(of: newi))
                
                //var date: __NSCFString = 0
                //var lat: __NSCFString = 0
                //var long: String = ""
                var abc:String = ""
                
                for (item) in newi!{
                    print(item)
                    let key = item.0 as? String
                    if(key == "date"){
                        //print("yes")
                        let date = item.1
                        print(date)
                    }
                    else if(key == "latitude"){
                        let lat = item.1
                        //let lat: String? = item.objectForKey("latitude")? as? String
                        print(lat)
                        abc = lat as? String ?? "102.34"
                        //self.lab1.text = abc
                    }
                    else{
                        let long = item.1 
                        print(long)
                    }
                    
                }
                
                print(abc)
                self.lab1.text = abc
                //let lat = value?["date"] as? String
                //let lat = value?["latitude"] as? String ?? ""
                //print(lat)
                //print(newi["latitude"])
                //print(newi["latitude"])
                
                
                //print(type(of: i))
                //for (key,val) in i as? String ?? ""{
                //    print(val)
                //}
                //for (key,val) in i as? Array{
                 //   print(val)
                //}
                //let latitude = i["latitude"]
                //let latitude = i["latitude"] as? String ?? ""
                //print("lati")
                //print(latitude)
            }
            //let username = value?["username"] as? String ?? ""
            //let user = User(username: username)
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        
        //ref.child("posts").observeSingleEvent(of: .value,with:{ (snapshot)
            
           // let value = snapshot.value as? NSDictionary
            //print(value)
        //})
            
        
        
        
        
        
      
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

}
