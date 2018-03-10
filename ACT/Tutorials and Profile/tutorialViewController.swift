//
//  tutorialViewController.swift
//  ACT
//
//  Created by Noah Cooper on 11/16/17.
//  Copyright © 2017 Alright Development. All rights reserved.
//

import UIKit

class tutorialViewController: UIViewController {

    @IBOutlet var textView: UITextView!
    var totalString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        totalString += "THE HOLY GRAIL TO ACT SUCCESS:\n\n"
        totalString += "ACT Reading:\n ACT Reading is designed to trick you \nEvery question needs a single 100% correct answer\nDon’t guess randomly on reading\nLearn the types of questions\nLearn strategies\nPractice a lot\nAim for perfection\nAim for raw score for a 36\n\n"
        
        totalString += "Learning to eliminate 3 wrong answers is most effective strategy\n3 of them have something that is totally wrong about them\nNo two answers CAN work\nA single word can make an answer choice wrong\nDistractors may be too specific, too broad, reversed, or unrelated\n\n"
        
        totalString += "Before reading the answer choices, come up with an answer! Form a hunch, then verify or refute it\n\n"
        
        totalString += "Try to finish reading passage in 3 minutes and get a general understanding\nIf question is a line number question, read one sentence of context prior to the line \nDon’t close-read every detail about a passage\nGoing back to the passage guarantees reading efficiency\n\nCRITICAL SKILL: Be able to skim and digest information!\n\n"
        
        totalString += "Understand every single mistake you make\nDo a ton of practice\nBe ruthless about understanding your mistakes, or else mistake will be made over and over\nMistakes are like cockroaches, no excuses not to rid\n\n"
        
        totalString += "Why did you miss a reading question: Elimination? Carless Error? Vocab? which one plagues you the most?\n\n"
        
        totalString += "Resolve questions that you miss and struggle with each wrong answer for up to 10 minutes\n\n"
        
        totalString += "Force yourself to be fascinated by the boring subject matter. For the next 7 minutes, be passionate about the subject. Pretend your life depends on understanding the passage\n\n"
        
        totalString += "Time Saving Strategies:\n Finish with extra time, 7-8 minutes per passage and questions. To have time to recheck your work, spend less than 2 seconds per line, no more than 30 seconds to solve a question, and solve all your questions first in the book, then bubble all of them at once. Or go section by section.\n\n"
        
        totalString += "Be ready, Reading has the most volatile scores. Make sure to stay engaged and vibe with the passage\n\n\n"
        
        totalString += "14 Most Important ACT Grammar Rules:\n"
        
        totalString += "1) Surround Non-Restrictive Clauses and Appositives with commas:\n"
        totalString += "Lily, [my niece], is the most exception child in the world.\n"
        totalString += "This group, [known as the Navajo code talkers], took part in every assault in 1945.\n"
        totalString += "Bracketed is the appositive which may have no verb\n\n"
        
        totalString += "2) Don’t put a comma before or after a preposition:\n"
        totalString += "His challenge initiated a review, of students’ rights.\n"
        totalString += "CHANGE: His challenge initiated a review of students’ rights.\n\n"
        
        totalString += "3) Don’t separate two independent clauses with a comma:\n"
        totalString += "I’m going to my friend’s house, [it’s really far away].\n"
        totalString += "Underlined portion is a dependent clause\n"
        totalString += "CHANGE: I’m going to my friend’s house, but it’s really far away.\n"
        totalString += "OR: I’m going to my friend’s house; it’s really far away.\n\n"
        
        totalString += "4) Use the fewest words possible:\n"
        totalString += "Over many weeks, [as time goes by], her collection slowly grows.\n"
        totalString += "\tA. No change \n\tB. with the passing of time,\n\tC. gradually, \n\tD. OMIT underlined portion\n"
        totalString += "Correct answer: D, Omit the underlined portion. All other choices are redundant\n\n"
        
        totalString += "5) Modifiers must be next to what they’re modifying:\n"
        totalString += "[Having died] down, she bricks up the firebox.\n"
        totalString += "CHANGE: Once the blaze dies, she bricks up the firebox.\n"
        totalString += "If it wasn’t changed, the ‘died’ would describe ‘she’\n\n"
        
        totalString += "6) Keep verb tenses consistent:\n"
        totalString += "The runners continue to score. They score, that is, if [they were not to be] distracted.\n"
        totalString += "CHANGE: They score, that is, if they’re not distracted.\n\n"
        
        totalString += "7) Choose the right word based on context:\n"
        totalString += "The committee chose not to defend [it’s] decision.\n"
        totalString += "CHANGE: The committee chose not to defend its decision.\n\n"
        
        totalString += "8) Use the correct idiomatic expression:\n"
        totalString += "The court agreed with Kevin that a person’s right [for wearing] clothing is protected.\n"
        totalString += "CHANGE: The court agreed with Kevin that a person’s right to wear clothing is protected.\n\n"
        
        totalString += "9) A pronoun must agree with its antecedent:\n"
        totalString += "Marshall forgot their homework.\n"
        totalString += "CHANGE: Marshal forgot his homework.\n"
        totalString += "Also watch out for subject-verb agreement (see point 14)\n\n"
            
        totalString += "10) Use apostrophes to show possession:\n"
        totalString += "The practice of advancing a [person’s age] relates to longevity.\n"
        totalString += "NO CHANGE\n\n"
        
        totalString += "11) Colons must come after a complete sentence:\n"
        totalString += "One aspect [was: that Susan] was the only reader of her poems.\n"
        totalString += "CHANGE:  One aspect was that Susan was the only reader of her poems.\n\n"
        
        totalString += "12) Semicolons separate two complete thoughts:\n"
        totalString += "INCORRECT: Because Dave wanted an adrenaline rush; he decided to skydive\n"
        totalString += "CORRECT: Dave wanted an adrenaline rush; he decided to skydive\n"
        totalString += "CORRECT: Because Dave wanted an adrenaline rush, he decided to skydive\n\n"
        
        totalString += "13) Use the correct relative pronoun:\n"
        totalString += "Relative Pronouns must agree with their antecedents\n"
        totalString += "Who and whom: people only\n"
        totalString += "When: specific times/time periods only\n"
        totalString += "Where: places only\n"
        totalString += "Which: Any noun other than a person\n"
        totalString += "That: Any noun\n"
        totalString += "Whose: Possessive, can be used for people or things\n"
        totalString += "INCORRECT: Johnny enjoys books where he gets to choose his own adventure\n"
        totalString += "CORRECT: Johnny enjoys books in which he gets to choose his own adventure\n"
        totalString += "INCORRECT: …those village storytellers [where they] transmit culture and history.\n"
        totalString += "CORRECT:  …those village storytellers who transmit culture and history.\n"
        totalString += "Not whom because the pronoun comes before a verb\n\n"
        
        totalString += "14) Subjects and verbs must agree:\n"
        totalString += "Singular form of verb describes plural subjects and vice versa\n"
        totalString += "During the flake’s descent, other water molecules [bumps] into the hexagonal structure.\n"
        totalString += "CHANGE: During the flake’s descent, other water molecules bump…\n"
        totalString += "The verb ‘bump’ describes the plural ‘vapor molecules’\n"
        totalString += "If the verb ‘bump’ described the singular ‘flake’, it would be ‘bumps’\n\n\n"

        totalString += "ACT Science: \n\n"
        totalString += "The ACT Science isn’t about science - it’s about reading comprehension and logic\n\n"
        totalString += "Don’t waste time in the passage and figures\n"
        totalString += "ACT Science passages are full of details that don’t actually matter\n"
        totalString += "Don’t understand the passage in its entirety, you dont need to\n"
        totalString += "Skim the passage and understand the passage at a very high level:\n"
        totalString += "\tWhat’s the main point?\n\tWhat the figure showing?\n\tThat’s it.\n\n"
        
        totalString += "Find the differences in the graphs to determine what variable is being tested, don’t read the full passage. In most passages, there is crap that is never used: equations, diagrams, maps, etc.\n"
        totalString += "The ACT wants you to get bogged down in the details\n\n"
        totalString += "Understand EVERY Type of ACT Science Passage and Question\n"
        totalString += "3 Data Representation Passages: heavy on graphs and charts\n"
        totalString += "\tRead the Graph\n\tInterpret Trends\n\tCalculate Values\n"
        totalString += "3 Research Summaries Passages - describes experiment with multiple parts\n"
        totalString += "\tExperimental Design\n\tHypothetical Experimental Changes\n\tInterpreting Experiments/Purpose\n"
        totalString += "1 Conflicting Viewpoints Passages\n"
        totalString += "\tUnderstanding Viewpoints\n\tComparing Viewpoints\n\n"
        
        totalString += "Get used to weird ACT Science Graphs\n"
        totalString += "You can understand any graph the ACT throws at you by remembering: What does each axis represent? What does the graph show?\n"
        totalString += "The CRITICAL first step for every graph is to look at the two axes - what’s being shown?\n\n"
        totalString += "Eliminate carless mistakes, they are the most costly and frustrating\n"
        totalString += "Questions that cause this are mostly formatted as:\n"
        totalString += "\tNo, because A\n"
        totalString += "\tNo, because B\n"
        totalString += "\tYes, because A\n"
        totalString += "\tYes, because B\n"
        totalString += "To combat these questions, answer each half of the question independently\n\n"
        
        totalString += "Be fluent with Basic Scientific Concepts\n"
        totalString += "If you want a PERFECT SCORE, you will have to understand important scientific concepts.\n"
        totalString += "These are the only concepts that are needed prior to the ACT:\n"
        totalString += "Biology:\n"
        totalString += "\tCell Biology, DNA, RNA, Ribosomes, Natural Selection\n"
        totalString += "Chemistry:\n"
        totalString += "\tMolecule Structure, Freezing/Boiling Points of Water\n"
        totalString += "\tpH Scale\n"
        totalString += "\tMolar Mass, Charges, Phase changes\n"
        totalString += "Physics:\n"
        totalString += "\tGravity\n"
        totalString += "\tDensity Formula, Density Rules (Density = mass/volume)\n"
        totalString += "\tBasic Math Skills\n\n"
        
        totalString += "Pace your time section by section to have enough time to check work. Try to finish ACT Science in 25 MINUTES. Thus, try to finish each passage and all associated questions within 4 MINUTES. Know you have to miss 0 questions for a 36 Solve all the questions in the book, then bubble all of them at once!\n\n\n"
        
        totalString += "ACT Math:\n\n"
        totalString += "Carless mistakes will haunt you. Solve every question to have extra time to recheck your work. For the first 45 questions, spend 30-45 seconds per question. For the last 15 questions, spend 60-90 seconds per question\n\n"
        totalString += "To eliminate carless mistakes:\n Underline what the question asks to solve for\nIf solving for a particular value, write the units down\nBe careful with calculator entry, double calculate, use parentheses\nAvoid bubbling errors\n\n"
        totalString += "Memorize All Formulas and Common Math Facts:\nSlope and distance\nRight triangle rules\nGeometric formulas\n\n"
        totalString += "GOOD LUCK AND MAY THE ACT LORDS BLESS YOU WITH A 36!"

        
        
        
        textView.text = totalString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
