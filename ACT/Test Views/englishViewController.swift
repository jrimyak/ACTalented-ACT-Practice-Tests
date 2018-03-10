//
//  englishViewController.swift
//  ACT
//
//  Created by Noah Cooper on 11/10/17.
//  Copyright © 2017 Alright Development. All rights reserved.
//

import UIKit
import CoreData
import GameplayKit

class englishViewController: UIViewController {
    @IBOutlet var navigation: UINavigationItem!
    @IBOutlet var ButtonA: UIButton!
    @IBOutlet var ButtonB: UIButton!
    @IBOutlet var ButtonC: UIButton!
    @IBOutlet var ButtonD: UIButton!
    @IBOutlet var textView: UITextView!
    
    //variables for the timer
    var startTime = TimeInterval()
    var timer = Timer()
    
    //important starter variables for the shuffle class
    var questionNumberText = 1
    var currentQuestion = 0
    var rightAnswerPlacement:UInt32 = 0
    var points = 0
    
    var questions = ["For the following questions, select the best fit change of the wording in brackets:\n My father, though he is only in his early fifties, is stuck in his [old-fashioned ways. He has] a general mistrust of any innovation or technology that he can’t immediately grasp.", "He [has run] a small grocery store in town, but it hasn't changed much since 1975.", "The speed [that] sound travels through a given medium depends on a number of factors.", "In the years since the Concorde [has been] decommissioned, only fighter pilots and astronauts have been able to experience the sensation of breaking “the sound barrier.”", "How would the author start this sentence to be most optimistic about the potential for the technology:\n [Newer and faster] 'Supersonic Passenger Planes' are being developed that will be technologically superior to the Concorde.", "[It's] maximum altitude reached 32,000 feet!", "Johnny was an excellent salesman, and [all of his co-workers were jealous].", "Johnny ended up going home[; and he] made himself a peanut butter sandwich to celebrate.", "The winter breeze chilled the pedestrians. [Furthermore], they didn't seen to mind.", "It has become [increasingly important] to protect existing hives, as the American honeybee population has declined significantly over the past 10 years.", "Perhaps at no time is protection more necessary than in early spring when the hives are full of [young, baby] bees.", "Which of the following alternatives is not acceptable: The hives [must have] an outer case placed around them.", "For the following questions, select the best fit change of the wording in brackets:\n The students at lunch ate their food[, swiftly]", "Paul stormed into the cafeteria [and] demanding nourishment", "My friend Ellen is typical [of many more] potters in that some pieces she shapes on a spinning potter’s wheel", "How can the author show the fire is extremely intense:\n By nightfall [a controlled inferno roars] in the kiln", "Which of the following is not acceptable: [Occasionally], the fire chugs like a train engine, hungry for more oxygen", "Soon after I arrived, my [aunt said] she had a gift for me.", "Rosie must [have heard] us talking, because she ambled over to us", "[She, it turns out:] is a tortoise", "My aunt said that she [would have checked] with my parents, who each agreed that if I wanted to take responsibility for Rosie, I could take her home with me.", "I learned that tortoises are among the most endangered [families in] reptiles", "Bell took [Virginia Kentucky and Tennessee] for 39 votes", "The seceding states met [at Montgomery Alabama]", "Which of the following is not acceptable:\n The republican party--who were purely [sectional elected] a hostile man", "For the following questions, select the best fit change of the wording in brackets:\n The wild bungalows of the Amazon River forest seemed [large and exotic]", "Banneker's grandmother was a student in Georgia [whom,] after completing medical school, was on her way to becoming a radiologist.", "He dismantled a watch, made drawings of [it's] components, and put it back together.", "The watch [keeps] percise time throughout the nineteenth century.", "He took over the farm and cared for his [sisters. Therefore,] he taught himself to play the violin.", "Which of the following is most specific to Banneker's importance:\n Grandson of an indentured servant, Banneker [liked to play music and study astronomy]", "Today, many people use kayaks for white water sports and for touring wilderness areas [that are extremley wild]", "The typical [boats are;] the swift white water kayak and the larger one for the sea", "Today, the equipment for both ships [are] similar", "Which is following is not correct:\n The calculus students learned many applications of [integration;] arc length, volume, and bounded area", "They all [fear] last week's Taylor Series quiz.", "'The greatest rapper ever is [Soulja Boy',] the pre-teen interjected."]
    var answers = [["No Change", "old-fashioned ways he has", "old-fashioned ways. He's having", "old-fashioned ways, and still has"], ["runs", "No Change", "had ran", "was running"], ["at which", "No Change", "to which", "a"], ["was", "No Change", "had been", "ended to be"], ["The future of commercial aircraft called", "No change", "The safe", "No other aircraft prior was as functional as the"], ["Its", "No Change", "A plane's", "The Concorde"], ["No Change", "his great sales attracted envious thoughts", "jealousy described the mood of the co-workers", "Johnny caused the co-workers jealousy"], [". He", "No Change", "and he", "then he"], ["However", "No Change", "Moreover", "On the other hand"], ["No Change", "importantly increasing", "an increase in importance", "an importance with increasing necessity"], ["young", "young and infant", "young baby", "No Change"], ["does require", "need", "should be built with", "couldn't survive without"], ["swiftly", "No Change", "swift", "in a swift manner"], ["OMIT the underlined phrase", "No Change", "and he was", ", and"], ["of many", "No Change", "mostly of", "for most"], ["No Change", "The fire is stronger than ever", "More heat is being produced", "A kind of intenze blaze is"], ["Time or again", "On occasion", "Once in a while", "Now and then"], ["No Change", "aunt said,", "aunt, said", "aunt said:"], ["No Change", "have heard of", "of heard about", "of heard"], ["She, it turns out,", "She, it turns out", "She it turns out,", "No Change"], ["had checked", "would check", "No Change", "must check"], ["families of", "family of", "family in", "No Change"], ["Virginia, Kentucky, and Tenneseee", "No Change", "Virgnia Kentucky, and Tennessee", ", Virginia, Kentucky, and Tennessee"], ["in Montgomery, Alabama", "at Montgomery, Alabama", "in Montgomery Alabama", "No Change"], ["sectional--elected", "sectional, elected", "sectional. Elected", "divided--voted for"], ["No Change", "large, and exotic", "large and, exotic", ", large and exotic"],["who,", "OMIT the underlined phrase", "which,", "No Change"], ["its", "No Change", "its'", "their"], ["kept", "No Change", "has kept", "still keeps"], ["sisters. In addition,", "No Change", "sisters, in addition,", "sisters, therefore,"], ["defied academic societal norms", "was very well rounded", "did not appreciate his past", "No Change"], ["OMIT the underlined phrase", "No Change", "which are remote", "that are uncivilized"], ["boats are", "boats, are", "No Change", ", boats, are"], ["is", "No Change", "was", "were"], ["No Change", "integration:", "integration such as", "integration like"], ["feared", "No Change", "was fearing", "were fearing"], ["Soulja Boy,'", "No Change", "Soulja Boy'", "Soulja Boy,"]]
    
    
    
    override func viewDidLoad() {
        //title of the test
        navigation.prompt = "English"
        
        //initializes timer
        let aSelector : Selector = #selector(englishViewController.updateTime)
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: aSelector, userInfo: nil, repeats: true)
        startTime = NSDate.timeIntervalSinceReferenceDate
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        //loads the first question
        newQuestion()
    }
    
    func newQuestion()
    {
        
        //fills the question text view with the question number and question
        textView.text = "Question \(questionNumberText): \n \(questions[currentQuestion])"
        
        
        //prints where the right answer should be
        print(rightAnswerPlacement)
        
        //following code shuffles the possible answers
        var button:UIButton = UIButton()
        
        
        let numbers = [1, 2, 3, 4]
        var shuffled = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: numbers) as! [Int]
        
        
        rightAnswerPlacement = UInt32(shuffled[0])
        for i in 1...4
        {
            button = view.viewWithTag(i) as! UIButton
            if (i == Int(rightAnswerPlacement))
            {
                button.setTitle(answers[currentQuestion][0], for: .normal)
                
            }
            if (i == shuffled[1]) {
                button.setTitle(answers[currentQuestion][1], for: .normal)
                
            }
            if (i == shuffled[2]) {
                button.setTitle(answers[currentQuestion][2], for: .normal)
                
            }
            
            if (i == shuffled[3]) {
                button.setTitle(answers[currentQuestion][3], for: .normal)
                
            }
            
            
            
        }
        
        
        currentQuestion += 1
        questionNumberText += 1
    }
    
    @IBAction func pressed(_ sender: AnyObject) {
        if (((sender) as AnyObject).tag == Int(rightAnswerPlacement))
        {
            
            let correctAlert = UIAlertController(title: "Correct!", message: "Good Job!", preferredStyle: .alert)
            let correctAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            correctAlert.addAction(correctAction)
            self.present(correctAlert, animated: true, completion: nil)
            print ("RIGHT!")
            points += 1
        }
        else
        {
            let incorrectAlert = UIAlertController(title: "Incorrect", message: "Good Try!", preferredStyle: .alert)
            let incorrectAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            incorrectAlert.addAction(incorrectAction)
            self.present(incorrectAlert, animated: true, completion: nil)
            print ("WRONG!!!!!!")
        }
        
        //set to number of questions so you can load all of the questions
        if (currentQuestion != 36)
        {
            newQuestion()
            
        }
        else
        {
            //final screen. shows final score
            textView.text = "Test Complete. You scored \(points)! View your new average in your profile. Your time was \(navigation.title!)."
            
            textView.textColor = UIColor.blue
            
            //save the score to CoreData
            var mathScore = Double()
            var sciScore = Double()
            var rdgScore = Double()
            var engScore = Double()
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "Scores", in: context)
            let newScore = NSManagedObject(entity: entity!, insertInto: context)
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Scores")
            request.returnsObjectsAsFaults = false
            do {
                let result = try context.fetch(request)
                for data in result as! [NSManagedObject] {
                    
                    mathScore = data.value(forKey: "math") as! Double
                    sciScore = data.value(forKey: "science") as! Double
                    rdgScore = data.value(forKey: "reading") as! Double
                    engScore = data.value(forKey: "english") as! Double
                    
                }
                
            } catch {
                
                print("Failed")
            }
            
            engScore = Double(points)
            print("\(mathScore)", "\(sciScore)", "\(rdgScore)", "\(engScore)")
            newScore.setValue(sciScore, forKey: "science")
            newScore.setValue(mathScore, forKey: "math")
            newScore.setValue(rdgScore, forKey: "reading")
            newScore.setValue(engScore, forKey: "english")
            
            do {
                try context.save()
                print("saved")
            } catch {
                print("Failed saving")
            }
            
            timer.invalidate()
            var button:UIButton = UIButton()
            for i in 1...4 {
                button = view.viewWithTag(i) as! UIButton
                button.isHidden = true
                
                
            }
            
            
        }
    
    }
    
    @objc func updateTime() {
        
        let currentTime = NSDate.timeIntervalSinceReferenceDate
        
        //Find the difference between current time and start time.
        
        var elapsedTime: TimeInterval = currentTime - startTime
        
        //calculate the minutes in elapsed time.
        
        let minutes = UInt8(elapsedTime / 60.0)
        
        elapsedTime -= (TimeInterval(minutes) * 60)
        
        //calculate the seconds in elapsed time.
        
        let seconds = UInt8(elapsedTime)
        
        elapsedTime -= TimeInterval(seconds)
        
        
        
        
        
        //add the leading zero for minutes, seconds and millseconds and store them as string constants
        
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
        
        
        //concatenate minuets, seconds and milliseconds as assign it to the UILabel
        
        navigation.title = "\(strMinutes):\(strSeconds)"
        
    }
    
    @IBAction func exit(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
