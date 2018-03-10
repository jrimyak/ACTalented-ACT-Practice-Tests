//
//  scienceViewController.swift
//  ACT
//
//  Created by Noah Cooper on 11/13/17.
//  Copyright © 2017 Alright Development. All rights reserved.
//

import UIKit
import CoreData
import GameplayKit

class scienceViewController: UIViewController {
    @IBOutlet var textView: UITextView!
    
    @IBOutlet var toggleButton: UIBarButtonItem!
    @IBOutlet var navigation: UINavigationItem!
    @IBOutlet var graphImage: UIImageView!
    @IBOutlet var graphText: UITextView!
    @IBOutlet var graphView: UIView!
    @IBOutlet var buttonD: UIButton!
    @IBOutlet var buttonC: UIButton!
    @IBOutlet var buttonB: UIButton!
    @IBOutlet var buttonA: UIButton!
    
    var toggleCounter = 0
    
    //variables for the timer
    var startTime = TimeInterval()
    var timer = Timer()
    
    //important starter variables for the shuffle class
    var questionNumberText = 1
    var currentQuestion = 0
    var rightAnswerPlacement:UInt32 = 0
    var points = 0
    
    var questions = ["If a pendulum with L of 175cm was tested, what would be the approximate time period?", "How accurate was the predicted T for a pendulum with an L of 350cm?", "What is the relationship between the length of the pendulum and time of the period of the pendulum.", "For angle of 80 degrees, the difference in actual data and predicted data was about:", "The greatest gravitational potential energy of the marker was when the pendulum was at Angle = ?°", "Which of the following changes would yield the greatest positive change in T?", "If I scientist working with Mineral 1 needed the element with an x-ray intensity between 250 and 500, which would he select?", "As atomic number increases, x-ray intensity decreases. Which of the following groups of the periodic table would have the highest x-ray intensity?", "If a scientist was trying to find an element with the most energy to power his lamp but the least amount of x-ray emission, which would he choose?", "What is the difference in keV between Manganese and Oxygen?", "The which of the following elements has an x-ray intensity a fourth of that of O in Mineral 2?", "Based on the results Mineral 2, suppose Mineral 3 was composed of MnSiO₃. What would be the 3 respective keV peaks?", "What would be the approximate density of Liquid 6 with H20 mass of 0g and Ethanol mass of 40g", "What did the scientists determine about the effect of the mass of Ethanol (E) on Density (D)?", "Which of the following had the most mass per unit of volume?", "Did the mass of water affect the mass of KI?", "Which two elements make up KI?", "As mass of KI increased, mass of solution ___ and density ___", "What can you infer about 'roll time?'", "What is the effect of shaking the tap water on roll time?", "Why will bubbles or carbonation cause a slower roll time?", "Which trial did shaking cause a greater effect?", "If Trial 6 was the bottle rolled after 24 hours, what would the roll time before shaking likely be?", "How WOULDN'T the students test the same dependent variable with a different independent variable?", "Which scientist would argue that more variation in genetic code is vital to proving the substance of genetic material?", "A student found that the genetic material of bacteria was composed of 60% of the cell material. Which scientist would this benefit?", "Which of the following is one of the bases that make up a nucleotide?", "What can you infer about Scientist 1's definition of a gene?", "Which scientist would argue that genetic material is found inside the cell?", "What do both scientists agree about in regards to genetic material?", "What can you infer about a polymer if a nucleotide is a monomer?", "What element would Scientist 2 argue that genetic material's code must contain?", "How would Scientist 1 classify the genetic material of the bacteria?", "Use prior knowledge to answer the next three questions:\n Which of the following pH levels is the most acidc?", "A wooden cube has an edge length L and mass M. Which of the following cubes with given mass/length combinations has the largest density?", "Which cell organelle is not found in animal cells?"]
    var answers = [["2.65s", "2.85s", "2.50s", "3.50s"], ["Underestimate", "Overestimate", "Accurate", "Not sufficient data"], ["Direct; as L inc, T inc", "Direct; as L inc, T dec", "Inverse; as L inc, T dec", "Inverse; as L inc, T inc"], ["0.05 seconds", ".1 seconds", ".5 seconds", "2 seconds"], ["90", "10", "0", "45"], ["Angle from 50° to 70°", "Angle from 10° to 30°", "Angle from 70° to 50°", "Angle from 10° to 30°"], ["Ca", "Mn", "O", "C"], ["Group 1 (H)", "Group 2 (Li)", "Group 3 (Na)", "Group 4 (K)"], ["Cr", "O", "Si", "C"], ["About 5 keV", "About 1 keV", "About 1.5 keV", "About 6 keV"], ["Mn", "Ca", "C", "Fe"], ["0.5, 1.9 and 5.9 keV", "0.5, 3.7 and 5.9 keV", "1.5, 1.9 and 5.9 keV", "1.5, 1.9, and 6.9 keV"], ["Less than .79g", "About .8g", "About .9g", "About .999g"], [ "Inverse; As E inc, D dec", "Inverse; As E inc, D inc", "Direct; As E inc, D inc", "Direct; As E inc, D dec"],  ["Liquid 4", "Liquid 3", "Liquid 2", "Liquid 1"], ["No, the students dictated the [KI]", "No, the students dictated the [H20]", "Yes, the students dictated the [KI]", "Yes, the students dictated the [H20]"], ["Potassium and Iodine", "Potassium and Iodide", "Krypton and Iodine", "Krypton and Iodide"], ["increased, increased", "increased, decreased", "decreased, increased", "decreased, decreased"], ["Time for bottle to roll across a plane", "Time for bubbles to form", "Time between shaking and rolling", "Time for liquids to change"], ["No effect", "Increased roll time", "Decreased roll time", "Not enough data"], ["Bottle becomes more dense", "Bottle has less volume", "Bottle has more volume", "Bottle becomes less dense"], ["Trial 5, difference is greater", "Trial 5, difference is less", "Trial 4, difference is greater", "Trial 4, difference is less"], ["1.7s", "1.75s", "1.96s", "2s"] ,["Maniuplate roll time", "Manipulate temperature", "Manipulate type of liquid", "Manipulate volume of bottle"], ["Scientist 1: plenty amino acids", "Scientist 1: few amino acids", "Scientist 2: plenty nucleotides", "Scientist 2: few nucleotides"], ["Scientist 1: more massive", "Scientist 1: less massive", "Scientist 2: more massive", "Scientist 2: less massive"], ["Adenine", "Amino acids", "DNA", "Protein"], ["Amino acid code of traits", "Nucleotide code of traits", "Number of chromosomes", "Protein that makes up nucleotides"], ["Scientist 2: Phosphorus in cell", "Scientist 2: Phosphorus outside cell", "Scientist 1: Sulfur in cell", "Scientist 1: Sulfur outside cell"], ["It contains a code", "It is made of protein", "It is made of DNA", "Only found in bacteria"], ["Multiple monomers together", "Smaller than a monomer", "Not related", "Different entities"], ["Nitrogen", "Oxygen", "Sulfur", "Carbon"], ["Combination of amino acids", "Type of amino acids", "Combination of nucleotides", "Type of nucleotides"], ["2", "5", "7", "14"], ["M and L", "2M and 2L", "3M and 3L", "M and 3L"], ["Cell wall", "Cytoplasm", "Lysosome", "Nucleus"]]
    
    override func viewDidLoad() {
        //title of the test
        navigation.prompt = "Science"
        
        //initializes timer
        let aSelector : Selector = #selector(scienceViewController.updateTime)
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: aSelector, userInfo: nil, repeats: true)
        startTime = NSDate.timeIntervalSinceReferenceDate
        
        if (currentQuestion == 0) {
            graphImage.image = #imageLiteral(resourceName: "data1A")
            
            print("image1")
        }
        
        
        graphText.text = "Scientist 1: Protein is the genetic material of bacteria because of the Sulfur found on the exterior of microscopic bacteria. Proteins make up over half of a cell's weight. The different amino acids in proteins can compose the genetic code which determines the traits of genes. There are many more types of amino acids than types of nucleotides (the monomers of DNA)\n\nScientist 2: DNA is the genetic material of bacteria because of the Phosphorus found within microscopic bacteria. DNA contains 4 different nucleotides which, with combinations of nitrogenous base pairs, makes up the genetic code. It is less massive than proteins, but more consistent across different organisms. Amount of DNA is also correlated to the number of chromosomes in a cell. Proteins have no such correlation."
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool)
    {
        //loads the first question
        newQuestion()
        graphView.isHidden = true
        graphText.isHidden = true
        graphText.isEditable = false
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

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
            
            sciScore = Double(points)
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
        
        if (currentQuestion == 4) {
            graphImage.image = #imageLiteral(resourceName: "data1B")
            
            print("image2")
        }
        if (currentQuestion ==  7) {
            graphImage.image = #imageLiteral(resourceName: "data2B")
            
            print("image3")
        }
        if (currentQuestion == 10) {
            graphImage.image = #imageLiteral(resourceName: "data2A")
            
            print("image4")
        }
        if (currentQuestion == 13) {
            graphImage.image = #imageLiteral(resourceName: "exp1A")
            
            print("image1")
        }
        if (currentQuestion == 16) {
            graphImage.image = #imageLiteral(resourceName: "exp2A")
            
            print("image2")
        }
        if (currentQuestion ==  19) {
            graphImage.image = #imageLiteral(resourceName: "exp1B")
            
            print("image3")
        }
        if (currentQuestion == 22) {
            graphImage.image = #imageLiteral(resourceName: "exp2B")
            
            print("image4")
        }
        if(currentQuestion == 25) {
            graphImage.isHidden = true
            graphText.isHidden = false
        }
        if(currentQuestion == 34) {
            graphText.text = "Use prior science knowledge to answer question"
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
    
    @IBAction func toggle(_ sender: Any) {
        if(toggleCounter % 2 == 0)
        {
            graphView.isHidden = false
            toggleButton.title = "View Question"

            toggleCounter += 1
            
        } else {
            graphView.isHidden = true
            toggleButton.title = "View Graph"
            toggleCounter += 1
            
        }
        
    }
    }
    

