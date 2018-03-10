public extension UIDevice {
    
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        case "iPod5,1":                                 return "iPod Touch 5"
        case "iPod7,1":                                 return "iPod Touch 6"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
        case "iPhone4,1":                               return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
        case "iPhone7,2":                               return "iPhone 6"
        case "iPhone7,1":                               return "iPhone 6 Plus"
        case "iPhone8,1":                               return "iPhone 6s"
        case "iPhone8,2":                               return "iPhone 6s Plus"
        case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
        case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
        case "iPhone8,4":                               return "iPhone SE"
        case "iPhone10,1", "iPhone10,4":                return "iPhone 8"
        case "iPhone10,2", "iPhone10,5":                return "iPhone 8 Plus"
        case "iPhone10,3", "iPhone10,6":                return "iPhone X"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
        case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
        case "iPad6,11", "iPad6,12":                    return "iPad 5"
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
        case "iPad6,3", "iPad6,4":                      return "iPad Pro 9.7 Inch"
        case "iPad6,7", "iPad6,8":                      return "iPad Pro 12.9 Inch"
        case "iPad7,1", "iPad7,2":                      return "iPad Pro 12.9 Inch 2. Generation"
        case "iPad7,3", "iPad7,4":                      return "iPad Pro 10.5 Inch"
        case "AppleTV5,3":                              return "Apple TV"
        case "AppleTV6,2":                              return "Apple TV 4K"
        case "AudioAccessory1,1":                       return "HomePod"
        case "i386", "x86_64":                          return "Simulator"
        default:                                        return identifier
        }
    }
    
}

//
//  ViewController.swift
//  ACT
//
//  Created by Noah Cooper on 11/7/17.
//  Copyright © 2017 Alright Development. All rights reserved.
//



import UIKit
import CoreData
import GameplayKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet var loginText: UITextField!
    
    var userID = String()

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.loginText.resignFirstResponder()
        
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    
    
    override func viewWillAppear(_ animated: Bool) {
        

        
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                
                userID = data.value(forKey: "username") as! String
                
                
            }
            
        } catch {
            
            print("Failed")
        }
        
        print(userID)
        
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        print(userID != "")
        if(userID != "")
        {
            performSegue(withIdentifier: "go", sender: self)
        } else {
            let modelName = UIDevice.current.modelName
            
            
            if(modelName == "iPhone 4" || modelName == "iPhone 4s" || modelName == "iPhone 5" || modelName == "iPhone 5s" || modelName == "iPhone 5c" || modelName == "iPhone SE" || modelName == "iPod Touch 5")
            {
                let alert = UIAlertController(title: "Sorry", message: "Version 3.0 is not supported on \(modelName)", preferredStyle: .alert)
                present(alert, animated: true, completion: nil)
            }
            
            if(modelName == "iPad 2" || modelName == "iPad 3" || modelName == "iPad 4" || modelName == "iPad Air" || modelName == "iPad Air 2" || modelName == "iPad 5" || modelName == "iPad Mini" || modelName == "iPad Mini 2" || modelName == "iPad Mini 3" || modelName == "iPad Mini 4" || modelName == "iPad Pro 9.7 Inch" || modelName == "iPad Pro 12.9 Inch" || modelName == "iPad Pro 12.9 Inch 2. Generation" || modelName == "iPad Pro 10.5 Inch" || modelName == "Simulator")
            {
                let alert = UIAlertController(title: "Disclaimer:", message: "Version 3.0 is not fully optimized for \(modelName). For best resolution, use on iPhone", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(action)
                present(alert, animated: true, completion: nil)
            }
        }
       
        
        
    }
    
    override func viewDidLoad() {
       
        
        
       
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func login(_ sender: Any) {
        
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)
            let scoreEntity = NSEntityDescription.entity(forEntityName: "Scores", in: context)
            let newUser = NSManagedObject(entity: entity!, insertInto: context)
            let newScore = NSManagedObject(entity: scoreEntity!, insertInto: context)
            
            
            
            if(loginText.text != "")
            {
                
                
                newUser.setValue(loginText.text!, forKey: "username")
                
                
                newScore.setValue(0, forKey: "math")
                newScore.setValue(0, forKey: "reading")
                newScore.setValue(0, forKey: "science")
                newScore.setValue(0, forKey: "english")
                
                do {
                    try context.save()
                    print("saved")
                } catch {
                    print("Failed saving")
                }
                
                
                
                performSegue(withIdentifier: "go", sender: self)
                
                
            }
            

            
         else {
            let alert = UIAlertController(title: "Please fill out the field", message: "Try again", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    
}

