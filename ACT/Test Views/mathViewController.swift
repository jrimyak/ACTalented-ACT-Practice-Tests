//
//  mathViewController.swift
//  ACT
//
//  Created by Noah Cooper on 11/9/17.
//  Copyright © 2017 Alright Development. All rights reserved.
//

//import these three libraries for the test class
import UIKit
import CoreData
import GameplayKit

class mathViewController: UIViewController {
    
    //this is where the questions will be displayed
    @IBOutlet var textView: UITextView!
    
    //these will hold the titles to the possible answers
    @IBOutlet var buttonA: UIButton!
    @IBOutlet var buttonB: UIButton!
    @IBOutlet var buttonC: UIButton!
    @IBOutlet var buttonD: UIButton!
    
    //this will hold the timer and test title on the navigation bar
    @IBOutlet var navigation: UINavigationItem!
    
    
    //variables for the timer
    var startTime = TimeInterval()
    var timer = Timer()
    
    //important starter variables for the shuffle class
    var questionNumberText = 1
    var currentQuestion = 0
    var rightAnswerPlacement:UInt32 = 0
    var points = 0
    
    //holds all of the questions
    var questions = ["Solve for x:\n x² - 3x = kx - 6 if k = 2", "What is an equation of a line perpendicular to 3x - y = 5", "Tom worked 25 hours and received $225. At the same rate of pay, how much would he make if he worked 36 hours?", "If x = 6 and y = –2, what is the value of 3xy + 2x² – y³", "If 3x+ 5y= 4, which of the following is equivalent to the expression (6x+ 10y)(100x+ 100y)", "Solve the System for (x, y): \n3x - 2y = 44;\n 6x - 6y = 18", ".25k + .2k = 1.0. Solve for k", "9x² - 19 = -11", "Simplify i⁹⁹", "Jill drives with a constant velocity of 50 mi/hr for 2 hours and John drives with a constant velocity of 60 mi/hr for 1 hour. After how many hours does Jill's total distance surpass John's total distance?", "Consider f(x) = √x and g(x) = 7x + b. y = f(g(x)) passes through (4,6). What is the value of b?", "ln3 - ln4 = logₓ(y). Solve for (x, y)", "Given Triangle ABC, if ∠ABC = ∠BCA, BC = 2 and Perimeter = 12, what is the length of AC?", "The ratio of the side lengths of a triange is 7:11:13. In a second triangle similar to the first, the shortest side in 9 in. long. What is the length of the longest side of the second triangle?", "In Triangle ABC where B = 90° what is tanA if AB = 1, BC = 2, and AC = 4", "What is the surface area of a cylinder whose volume is 16∏ and height is 4?", "∠A is complimentary to ∠B. ∠B = 43°. In quadrilateral CDEF, ∠C = ∠D = ∠E = 100°. What is ∠F - ∠A?", "Circle A with radius of 5 contains chord BC which is 3 units from the center. How long is BC?", "sin²x + cos²x = y. If x is any given angle, what is y?", "Equilateral Triangle ABC has the same side length, x, as Square WXYZ. What is the difference in area between the square and triangle if the diagonal of the square = 5√2?", "If in right triangle ABC, ∠A = 90°, ∠B = 30°, and ∠C = 60° and AB = 2√3, what is BC?", "If a sphere is inscribed into a cylinder, and the volume of the sphere is 4.19, what is the volume of the cylinder if its height is 3?", "What is the midpoint of the inverse of y = 2x from x = [0, 2].", "In triangle ABC, ∠A = 30°, BC = 2, and AC = 1. What is sin(∠B)?", "What are the odds that Jenny will roll a pair of dice and get six on both?","For all real numbers such that p and q such that 3q = p, which expression equals the sum of 3 and q for constant b?", "An integer, c, over the interval c = [100, 999], what is the possibility that it will include the digit '0'?", "In the equation x² + bx + c = 0, what is (b, c) if x can only be -3?", "Which of the following is a rational number greater than 1?", "A bag contains 12 red marbles, 5 yellow marbles and 3 green marbles. How many blue marbles should be added so the probability of picking a red marble is 3/5?", "10th graders have a ratio of 86:255 to the school population and the 11th graders have a ratio of 18:51 to the total student population. If one student is randomly chosen, what grade are they most likely to be in?", "Which of the following expressions symbolizes interest over one year at a monthly compounded rate if A is total money, P is initial deposit and r is rate?", "A group of 7 friends are having lunch together. Each person eats at least 3/4 of a pizza. What is the smallest number of whole pizzas needed for lunch?", "What is the probability that a random point on y = x² lies in Quadrant II?", "If on the parametric plane x = asin(t) and y = bsin(t), what is the diameter of the circle generated if a = 3 and b = 3", "Given data set W = {9,10,11,7,13} what is the standard devation of W?"]
    
    //holds all of the answers
    var answers = [["x = 2, 3", "x = -2, 3", "x = -2, 2", "x = -2, -3"], ["y = -(1/3)x + 20", "y = 3x + 5", "y = (1/3)x + 5", "y = -3x + 20"], ["$324", "$300", "$540", "$810"], ["44", "-100", "-244", "-44"], ["800x + 800y", "1000x + 1000y", "600x + 1000y", "600x + 1600xy + 1000y"], ["(10, 7)", "(7, -10)", "(-10, -7)", "(-7, 10)"], ["20/9", "11/20", "9/20", "2"], ["√(8/9)", "√(9/8)", "√(160/9)", "0.94"], ["-i", "1", "i", "-1"], ["1.2 hours", "1.5 hours", "2 hours", "0 hours"], ["8", "-8", "-25", "26"], ["(e, .75)", "(e, -1)", "(.75, e)", "(-1, e)"], ["5", "7", "2", "10"], ["16.7", "15", "14.1", "17.3"], ["2", ".5", ".25", "4"], ["75.4", "50.2", "150.8", "201.6"], ["13°", "17°", "3°", "-77°"], ["8", "4", "10", "6"], ["1", "∏", ".5∏", "2"], ["25 - 6.25√3", "5√2 - 6.25√3", "25 - 5√2", "50 - .25√3"], ["4", "2", "1", "√3"], ["3П", "4.19", "12.57", "П"], ["(1, .5)", "(2, 4)", "(1, 2)", "(.5, 1)"], [".25", ".5", "1", "√3/2"], ["1/36", "1/12", "1/72", "1/6"], ["(b/3) + 3", "b+3", "3b + 3", "(b+3)(3)"], ["171/900", "19/900", "81/900", "271/999"], ["(6, 9)", "(-3, -10)", "(-6, -9)", "(3, 10)"], ["√(64/49)", "√.5", "√П", "√(1)"], ["0", "1", "11", "5"], ["10th", "11th", "12th", "Equal chance"], ["A = P(1 + r/12)¹²", "A = P(1 + r/12)", "A = P(1 - r/12)¹²", "A = P(1 + r)¹²"], ["6", "7", "5", "28"], ["1/2", "1/4", "0", "1"], ["6", "3", "6П", "9П"], ["2", "5", "10", "6"]]
    
    override func viewDidLoad() {
        //title of the test
        navigation.prompt = "Math"
        
        //initializes timer
        let aSelector : Selector = #selector(mathViewController.updateTime)
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: aSelector, userInfo: nil, repeats: true)
        startTime = NSDate.timeIntervalSinceReferenceDate
        
        super.viewDidLoad()

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
   
    
    override func viewDidAppear(_ animated: Bool)
    {
        //loads the first question
        newQuestion()
    }
    
    //Method that displays new question
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
        
        //code for when an answer is pressed. make sure to add outlets for all buttons and change to AnyObject as the sender
        
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
            
            
            
            mathScore = Double(points)
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
    
    //timer objc method
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
    
    //go back home button
    @IBAction func exit(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
