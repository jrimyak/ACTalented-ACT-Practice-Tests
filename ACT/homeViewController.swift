//
//  homeViewController.swift
//  ACT
//
//  Created by Noah Cooper on 11/8/17.
//  Copyright © 2017 Alright Development. All rights reserved.
//

import UIKit
import CoreData

class homeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var collectionView: UICollectionView!
    var contents = ["Math", "Reading", "English", "Science", "Tutorials", "Profile"]
    var images = [#imageLiteral(resourceName: "mathImage"), #imageLiteral(resourceName: "readingImage"), #imageLiteral(resourceName: "englishImage"), #imageLiteral(resourceName: "scienceImage"), #imageLiteral(resourceName: "tutorialImage"), #imageLiteral(resourceName: "profileImage")]

    override func viewDidLoad() {
        collectionView.delegate = self
        collectionView.dataSource = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return contents.count
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! testsCollectionViewCell
        
        cell.testLabel.text = contents[indexPath.row]
        cell.testImage.image = images[indexPath.row]
        
        
       
        
        // Configure the cell
        
        return cell
    }
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! testsCollectionViewCell
        
        if(indexPath.row <= 3)
        {
        var subjectScore = Double()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Scores")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                
            subjectScore = data.value(forKey: contents[indexPath.row].lowercased()) as! Double
                
            }
            
        } catch {
            
            print("Failed")
        }
        
        
        
        func sendToController(action: UIAlertAction) {
            performSegue(withIdentifier: contents[indexPath.row], sender: self)
        }
        
        let alert = UIAlertController(title: "\(contents[indexPath.row]) Section Exam", message: "This practice exam contains 36 questions. Your previous score was \(Int(subjectScore)). Suggested time is 30 minutes. Good luck", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: sendToController)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: contents[indexPath.row], sender: self)
        }
        
        
      
        
        
    }
    
   
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
