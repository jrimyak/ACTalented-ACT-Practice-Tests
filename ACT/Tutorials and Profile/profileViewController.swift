//
//  profileViewController.swift
//  ACT
//
//  Created by Noah Cooper on 11/15/17.
//  Copyright © 2017 Alright Development. All rights reserved.
//

import UIKit
import CoreData

class profileViewController: UIViewController {
    var mathScore = 0
    var engScore = 0
    var sciScore = 0
    var rdgScore = 0
    
    
    var averageScore = Int()
    
    var percentiles = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 7, 12, 18, 24, 30, 36, 43, 50, 56, 63, 68, 74, 79, 83, 87, 90, 92, 95, 96, 98, 99, 99, 99, 99]
    var percentile = Int()
    
    var harvardYaleRange = false //31-35 ivy league schools
    var umichBerkeleyRange = false //29-33 top publics and high tier privates
    var uclaWiscoRange = false //27-31 high tier publics and high privates
    var alabamaRange = false //22-27 mid rank pub schools
    var nationalAverage = false //20 national average
    
    var topMath = false
    var topSci = false
    var topEng = false
    var topRdg = false
    
    var totalString = ""
    
    @IBOutlet var textView: UITextView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Scores")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                
                mathScore = Int(data.value(forKey: "math") as! Double)
                sciScore = Int(data.value(forKey: "science") as! Double)
                rdgScore = Int(data.value(forKey: "reading") as! Double)
                engScore = Int(data.value(forKey: "english") as! Double)
                
            }
            
        } catch {
            
            print("Failed")
        }
        
        print(mathScore)
        print(sciScore)
        print(rdgScore)
        print(engScore)
        
       
        
        averageScore = Int((mathScore + rdgScore + sciScore + engScore)/4)
        if(averageScore > 0)
        {
        percentile = percentiles[averageScore]
        }
        
        if(averageScore > 31)
        {
            harvardYaleRange = true
        }
        if(averageScore > 28)
        {
            umichBerkeleyRange = true
        }
        if(averageScore > 26)
        {
            uclaWiscoRange = true
        }
        if(averageScore > 22)
        {
            alabamaRange = true
        }
        if(averageScore > 19)
        {
            nationalAverage = true
        }
        
        if(mathScore >= rdgScore && mathScore >= engScore && mathScore >= sciScore)
        {
            topMath = true
        }
        if(rdgScore >= mathScore && rdgScore >= engScore && rdgScore >= sciScore)
        {
            topRdg = true
        }
        if(engScore >= rdgScore && engScore >= mathScore && engScore >= sciScore)
        {
            topEng = true
        }
        if(sciScore >= rdgScore && sciScore >= engScore && sciScore >= mathScore)
        {
            topSci = true
        }
        
        totalString += "Welcome to your profile page. At this page, you will be able to view the analytics of your tests that you have taken on ACTalented Practice Tests. For best results, make sure to complete all four of the practice tests before viewing.\n\nOur records show that your last average score was a \(averageScore).\n\nThis score is comprised of the following scores per subject:\n\nA \(mathScore) in Math\n\nA \(rdgScore) in Reading\n\n A \(engScore) in English\n\nA \(sciScore) in Science\n\nYour score puts you at a percentile of \(percentile), which means that you performed better than \(percentile)% of all students who take the ACT.\n\nIn addition, your average score can help with diagnostics about college admissions. While a score does not make or break a college application, it is a good starting point to see where you are at.\n\n"
        if(harvardYaleRange)
        {
            totalString += "Your average score is within the range of top universities like Harvard, Yale, or top-15 private schools, which is typically between 32-35, where 32 is the 25th percentile and 35 is the 75th percentile. Great work!"
        }
        if(!(harvardYaleRange) && umichBerkeleyRange)
        {
            totalString += "Your average score is within the range of top public universities like Michigan, UC Berkeley, and top-30 private schools which is typically between 29-34, where 29 is the 25th percentile and 34 is the 75th percentile. Great work!"
        }
        if(!(umichBerkeleyRange) && uclaWiscoRange)
        {
            totalString += "Your average score is within the range of high-tier public universities like Wisconsin, UCLA , and top-50 public and private schools which is typically between 27-31, where 27 is the 25th percentile and 31 is the 75th percentile. Great work!"
        }
        if(!(uclaWiscoRange) && alabamaRange)
        {
            totalString += "Your average score is within the range of mid-tier public and private universities like Iowa, Alabama, and other top-75 public and private schools which is typically between 22-28, where 22 is the 25th percentile and 28 is the 75th percentile. Great work!"
        }
        if(nationalAverage)
        {
            totalString += "\n\nYour average score surpasses the national average for all test takers in the United States (20), great job!\n\n"
        }
        if(topMath)
        {
            totalString += "Your scores indicate that one of your highest performing subjects is in Math. Great career paths/majors to pursue with a strong skillset in Math is Computer Science, Statistics, Engineering, Finance, Actuarial Science, Natural Science, Economics and many more. \n\n"
        }
        if(topSci)
        {
            totalString += "Your scores indicate that one of your highest performing subjects is in Science. Great career paths/majors to pursue with a strong skillset in Math is Computer Science, Biology, Engineering, Chemistry, Physics, Environmental Science, Medicine, Nursing, Pharmacy and many more. \n\n"
        }
        if(topEng)
        {
            totalString += "Your scores indicate that one of your highest performing subjects is in English. Great career paths/majors to pursue with a strong skillset in English is Journalism, Novel Writing, Screen Writing, Speech Writing, Editing, Publishing and many more. \n\n"
        }
        if(topRdg)
        {
            totalString += "Your scores indicate that one of your highest performing subjects is in English. Great career paths/majors to pursue with a strong skillset in Reading is History, Economics, Writing, Poetry, Speech Writing, Editing, Publishing, Political Science and many more. \n\n"
        }
        
        totalString += "Thank you for visiting the analytics page. Keep focusing on fixing your weaknesses to become a better test taker! To contact the Alright Development Team, email alrightdevelopment@gmail.com, or tweet @AlrightDev."
        
        textView.text = totalString
        
        
    }
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
       
        
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
   

}
