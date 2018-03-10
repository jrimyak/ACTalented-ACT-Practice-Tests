//
//  readingViewController.swift
//  ACT
//
//  Created by Noah Cooper on 11/11/17.
//  Copyright © 2017 Alright Development. All rights reserved.
//

import UIKit
import CoreData
import GameplayKit

class readingViewController: UIViewController {
    @IBOutlet var navigation: UINavigationItem!
    @IBOutlet var textView: UITextView!
    @IBOutlet var buttonA: UIButton!
    @IBOutlet var buttonB: UIButton!
    @IBOutlet var buttonC: UIButton!
    @IBOutlet var buttonD: UIButton!
    @IBOutlet var toggleButton: UIBarButtonItem!
    @IBOutlet var passageView: UITextView!
    var passageNumber = 1
    var toggleCounter = 0
    
    //variables for the timer
    var startTime = TimeInterval()
    var timer = Timer()
    
    //important starter variables for the shuffle class
    var questionNumberText = 1
    var currentQuestion = 0
    var rightAnswerPlacement:UInt32 = 0
    var points = 0
    
    var questions = ["The narrator most likely views their grandparents with", "What can be inferred about the narrator's grandparent's magazines is that they:", "The narrator describes her grandparents' writing as", "The grandparents were largely", "The word forthcoming in the story's context most likely means:", "The narrator most likely finds his time spent with his grandparents: ", "Which of the following most describes the main idea of the passage?", "How could Princeton's response be described as?", "Which of the following was NOT a suggestion that Princeton made regarding racial protests?", "Who would have most likely been a protester at Princeton?", "Which of the following describes Wilson's actions as president in terms of the federal civil service?", "What is the definition of blemish in the context of the passage?", "Why was leaving the house like a game of 'Russian roulette?'", "What describes the tone of the passage?", "What is the lasting message of the passage?", "How can Faez's mentality be described midway through the passage?", "What was Daraa most likely described as before the war?", "Why was Faez most likely accused of being a terrorist?", "In the context of the passage, what is the definition of 'alleviate'?", "Why is hydrogen gas so hypothetically ideal?", "How does Hydrogen and Electricy team up?", "What is likely about the difference between coal and hydrogen gas?", "Why woud hydrogen gas energy be hard to implement?", "What is the main idea of the passage?", "The author describes which of the following practices as undesirable to New York society?", "As a result of her “peculiarities,” Medora offends her family by:", "It is most reasonable to infer that, after the death of Medora’s third husband, Ellen did not help her aunt primarily because:", "The third paragraph suggests that Medora’s lifestyle was primarily viewed by others as:", "What does the narrator suggest is a central characteristic of Medora Manson?", "Which of the following characters learns to do something otherwise unheard of by New York society?", "The second paragraph implies which of the following with its questions?", "The “permissive environment” is most accurately paralleled by which of the following situations?", "The word “passions” in the passage most nearly means:", "The tone of the passage can best be described as:", "The primary purpose of this passage is to:", "Which of the following does the author describe as personality traits of Emma Bovary?\nI.   imaginative\nII.  restless\nIII. spendthrift"]
    
    var answers = [["Respect", "Jealousy", "Contempt", "Pity"], ["focused on leisure", "were meant for education", "were sophisticated", "were subpar in quality"], ["brief and occassionally published", "highly regarded novels", "not allowed to publish", "scientific journalism"], ["Editors", "Authors", "Publishers", "Researchers"], ["availible", "current", "willing", "likeable"], ["Interesting", "Frustrating", "Boring", "Energizing"], ["Students protested Wilson's racist practices", "Princeton is a racist university", "Princeton sided with the protestors", "Woodrow Wilson was removed from office"], ["Progressive", "Retroactive", "Racist", "Pessimistic"], ["Remove Wilson's name", "Reach out to black students", "Incoporate all races", "Redefine Wilson's legacy"], ["US History major student", "University trustee", "High school student", "New Jersey resident"], ["Discriminatory", "Inclusive", "Open-minded", "Neutral"], ["Anomaly", "Pimple", "Error", "Highlight"], ["Raging civil war", "Religious persecution", "Gambling culture", "War with russians"], ["Miraculous", "Somber", "Neutral", "Depressing"], ["Miracles can happen in tough times", "Wartime never brings hope", "Strangers are dangerous", "The Syrian War was very bloody"], ["Terrified", "Delerious", "Relieved", "Civil"], ["Quiet and civil", "A battlefield location", "Centered around government", "Surrounded by soldiers"], ["Unreasonable suspicion", "Criminal activity", "Sociopathic tendency of troops", "Pure chance"], ["To lessen", "To increase", "To levitate", "To warm"], ["It is renewable", "It can only be used once", "It is already established", "It is widely used"], ["Power and transportaton", "Gas and utilization", "Power and utilization", "Gas and distribution"], ["Hydrogen gas is renewable", "Coal is renewable", "Hydrogen gas isn't renewable", "Coal is not energy"], ["Amount of hydrogen availible", "Feasibility of hydrogen", "Renewability", "Not easy to convert"], ["Hydrogen energy is ideal", "Hydrogen gas is impossible", "Hydrogen gas is not renewable", "Hydrogen is incredibly powerful"], ["Travelling", "Playing Piano", "Adopting Children", "Shawl Dancing"], ["Wearing a short veil", "Allowing Ellen to marry", "Returning with no money", "Refusing to dress stylishly"], ["Ellen had no money", "Ellen was not communicating", "Ellen's incoherent education", "Interfering Medora's eccentricity"], ["Unlike societal norms", "Bad example for neice", "Unforuntate and pitiful", "Disturbingly inconsistent"], ["Non-conformity", "Orthodoxy", "Immodesty", "Arrogance"], ["Ellen", "Newland", "Medora", "Count Oleska"], ["Flauber's contradicitng message", "Flaubert's self-pity", "Emma's ignorance", "Treatise against romanticism"], ["An oblivious employer", "A frequent golfer", "A frequent movie-goer", "A distracted college student"], ["Obessions", "Tantrums", "Biases", "Romances"], ["Balanced", "Skeptical", "Espitolary", "Unsympathetic"], ["Reinterpret a classic novel", "Review common misconceptions", "Explore a minor novel", "Analyze Flaubert's heroine"], ["I, II, and III", "I and II only", "II and III only", "I and III only"]]
    
    var passages = ["Once the supper table was cleared, the dishes washed, and the flowers in the garden watered, my grandparents would set to work on their magazines. They worked at the dining table, pulling the celing lamp down and reading and editing the manuscripts, the page proofs, and the bound galleys. Sometimes they did some writing as well: they insisted that each volume conclude with a brief didactic essay, and when none was forthcoming they supplied it themselves. They wrote about the importance of toothbrushing, the battle against snoring, the principles of beekeeping, the history of the postal system. The publisher gave them a free hand.","Earlier this month, the Princeton University trustees announced they were rejecting student protester demands that “Woodrow Wilson” be removed from the names of the university’s School of Public and International Affairs and a residential undergraduate college. The protesters objected to honoring Wilson because he participated in and, as president of the United States, helped lead a national wave of reaction against the progress towards equality that African Americans had made in the decades after emancipation. In particular, Wilson segregated, for the first time, the federal civil service. The trustees agreed that Wilson’s racial policies, both as president of the university (where he refused to admit African American students) and as president of the United States were a serious blemish on his record. They recommended greater efforts to recruit African American students, programs to better incorporate those students into university life, and “a much more multi-faceted understanding and representation of Wilson on our campus, especially at the school and the college where his name is commemorated.”", "He was walking to work in his hometown of Daraa, the southern Syrian city where the protests against President Bashar al-Assad first erupted. For young civilians like Faez, now 28, leaving the house in the spring of 2013 had become a game of Russian roulette. Dozens were dying each day in the civil war between Assad’s forces and antigovernment insurgents. The ancient farming town of Daraa had become a grisly battlefield. Dissidents had disappeared. Children had been plucked off the streets for suspected anti-government activities, only to be tortured by authorities. On that Tuesday morning in late March, Faez was confronted by a group of Syrian army soldiers. They were looking for a man who had been spotted with a handgun. Faez and three others were detained and accused of being terrorists. Standing at gunpoint, his hands in the air, he recalls feeling furious with himself for risking the solo walk to work. “We felt death upon us, and we accepted it,” he says now. “I can’t describe it in words.” He got lucky. At that moment, an old woman barreled into the street, begging the gun-toting soldiers to spare these men. They were her son, her nephew, her neighbors, the old lady pleaded. Faez had never seen the woman before. But the soldiers relented. The stranger saved his life.", "Hydrogen gas is thought to be the ideal fuel for a world in which air pollution has been alleviated, global warming has been arrested, and the environment has been protected in an economically sustainable manner. Hydrogen and electricity could team to provide attractive options in transportation and power generation. Interconversion between these two forms of energy suggests on-site utilization of hydrogen to generate electricity, with the electrical power grid serving in energy transportation, distribution utilization, and hydrogen regeneration as needed. A challenging problem in establishing hydrogen as a source of energy for the future is the renewable and environmentally friendly generation of large quantities of hydrogen gas. Thus, processes that are presently conceptual in nature, or at a developmental stage in the laboratory, need to be encouraged, tested for feasibility, and otherwise applied toward commercialization.", "It was generally agreed in New York that the Countess Olenska had “lost her looks.” She had appeared there first, in Newland Archer’s boyhood, as a brilliantly pretty little girl of nine or ten, of whom people said that she “ought to be painted.” Her parents had been continental wanderers, and after a roaming babyhood she had lost them both, and been taken in charge by her aunt, Medora Manson, also a wanderer, who was herself returning to New York to “settle down.”\n\n Poor Medora, repeatedly widowed, was always coming home to settle down (each time in a less expensive house), and bringing with her a new husband or an adopted child; but after a few months she invariably parted from her husband or quarrelled with her ward, and, having got rid of her house at a loss, set out again on her wanderings. As her mother had been a Rushworth, and her last unhappy marriage had linked her to one of the crazy Chiverses, New York looked indulgently on her eccentricities; but when she returned with her little orphaned niece, whose parents had been popular in spite of their regrettable taste for travel, people thought it a pity that the pretty child should be in such hands.\n\n Everyone was disposed to be kind to little Ellen Mingott, though her dusky red cheeks and tight curls gave her an air of gaiety that seemed unsuitable in a child who should still have been in black for her parents. It was one of the misguided Medora’s many peculiarities to flout the unalterable rules that regulated American mourning, and when she stepped from the steamer her family were scandalised to see that the crape veil she wore for her own brother was seven inches shorter than those of her sisters-in-law, while little Ellen was in crimson merino and amber beads.\n\n But New York had so long resigned itself to Medora that only a few old ladies shook their heads over Ellen’s gaudy clothes, while her other relations fell under the charm of her high colour and high spirits. She was a fearless and familiar little thing, who asked disconcerting questions, made precocious comments, and possessed outlandish arts, such as dancing a Spanish shawl dance and singing Neapolitan love-songs to a guitar. Under the direction of her aunt, the little girl received an expensive but incoherent education, which included “drawing from the model,” a thing never dreamed of before, and playing the piano in quintets with professional musicians.", "Certain reviewers believe that the novel Madame Bovary, an example of a well-crafted and provoking book, has an unusual and subversive theme that undermines its own medium: in short, these critics say that Flaubert’s remarkable piece of fiction is in fact a cautionary tale about the dangers of reading novels. As evidence, they point to its unsympathetic protagonist, Emma Bovary, who lives in books, romanticizing the simplest aspects of daily life—eating rich food, buying expensive clothing—as well as her relationships. Constantly dissatisfied with real life, she becomes cruel, dull-witted, and shortsighted, caring only about immediate physical gratification and material possessions. Her fantasies lead to her downfall; her relationship with her well-meaning but naïve husband Charles gradually disintegrates, her two adulterous affairs with Leon and Rodolfo end in disaster, her constant borrowing leads her family to financial ruin, and her desire to die in a gloriously dramatic fashion leads instead to an unexpectedly agonizing three days of death throes. She expects too much from life, and is punished horribly for it.\n\n But is this undercurrent an essential theme in the novel, or simply a byproduct of character and plot? Are we really to assume that Flaubert thought the novel so dangerous that he wrote a virtual manifesto on the evils of losing oneself in fiction? If this is really the case, why would he choose to disseminate this message in the very medium he so despised (and, in fact, continued to work in for the rest of his life)?\n\n Certainly Emma’s flawed personality, as well as her literary obsession, contributes to her downfall, but it is interesting to note that no other character in the novel reads habitually for pleasure. In fact, Charles spends the bulk of the novel engaged in the mundane activities of daily life: running a business, tending to family members, maintaining the household. He is naïve, true, but happy, at least until Emma’s penchant for romance begins to interfere with his responsibilities. Therefore, there really are no other appropriate characters with whom to compare her, although we can point out that the novel’s non-reading population tends to be a fairly socially responsible group. (It is also interesting to note that Flaubert hardly uses the sort of clinical, dispassionate language you might expect to see in such a novel; for example, even the most stolid characters are prone to “exclaiming” and “crying” their dialogue.) Perhaps Madame Bovary, then, was not meant to be a criticism of fiction itself, but a caution against allowing suggestible characters like Emma to have access to novels. The permissive environment in the Bovarys’ household contributes to their downfall and social ruin; the characters’ unwillingness to check Emma’s passions (and even their ignorance of the existence of such a problem) leads to the disintegration of their family."]
    
    override func viewDidLoad() {
        //title of the test
        navigation.prompt = "Reading"
        
        //initializes timer
        let aSelector : Selector = #selector(readingViewController.updateTime)
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: aSelector, userInfo: nil, repeats: true)
        startTime = NSDate.timeIntervalSinceReferenceDate
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        //loads the first question
        newQuestion()
        passageView.isEditable = false
        passageView.isHidden = true
        passageView.text = passages[0]
    }
    
    func newQuestion()
    {
        
        //fills the question text view with the question number and question
        textView.text = "Question \(questionNumberText): \n \(questions[currentQuestion])"
        
        if (currentQuestion > 5 && currentQuestion <= 11)
        {
            passageView.text = passages[1]
            passageNumber = 2
            
        }
        
        if (currentQuestion > 11 && currentQuestion <= 17)
        {
            passageView.text = passages[2]
            passageNumber = 3
        }
        
        if (currentQuestion > 17 && currentQuestion <= 23)
        {
            passageView.text = passages[3]
            passageNumber = 4
            
        }
        
        if (currentQuestion > 23 && currentQuestion <= 29)
        {
            passageView.text = passages[4]
            passageNumber = 5
            
        }
        
        if (currentQuestion > 29 && currentQuestion <= 35)
        {
            passageView.text = passages[5]
            passageNumber = 6
            
        }
        
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
        toggleButton.title = "See Passage \(passageNumber)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
            
            rdgScore = Double(points)
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
    
    @IBAction func toggle(_ sender: Any) {
        if(toggleCounter % 2 == 0)
        {
            passageView.isHidden = false
            toggleButton.title = "See Question"
            toggleCounter += 1
        } else {
            passageView.isHidden = true
            toggleButton.title = "See Passage \(passageNumber)"
            toggleCounter += 1
            
        }
        
    }
    
}
