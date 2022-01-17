//
//  ViewController.swift
//  multipleChoice
//
//  Created by Ashin Wang on 2022/1/14.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionTextLabel: UILabel!
    @IBOutlet weak var announcementText: UILabel!
    @IBOutlet weak var answerTextLabel: UILabel!
    
    var questionsText = [questions]()
    var index = 0
    
    
    @IBOutlet weak var teamRScoreLabel: UILabel!
    @IBOutlet weak var teamLScoreLabel: UILabel!
    var leftScore:Int = 0
    var rightScore:Int = 0
    
    @IBOutlet weak var leftStepperOutlet: UIStepper!
    @IBOutlet weak var rightStepperOutlet: UIStepper!
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let question1 = questions(questionText: "為什麼蠶寶寶很有錢?", answerText: "因為牠會結繭(節儉)")
        questionsText.append(question1)
        
        let question2 = questions(questionText: "為什麼小白兔不嫁給斑馬呢?", answerText: "因為兔媽媽說紋身不是好孩子")
        questionsText.append(question2)
        
        let question3 = questions(questionText: "猴子不喜歡什麼線?", answerText: "平行線(因為沒有相交)")
        questionsText.append(question3)
        
        let question4 = questions(questionText: "巧克力和西紅柿打架,為什麼是巧克力贏??", answerText: "因為巧克力棒嘛")
        questionsText.append(question4)
        
        let question5 = questions(questionText: "怎樣使麻雀安靜下來？", answerText: "壓它一下。 原因：鴉雀無聲(壓雀無聲)")
        questionsText.append(question5)
        
        let question6 = questions(questionText: "你的爸爸的妹妹的堂弟的表哥的爸爸與你叔叔的兒子的嫂子是什麼關係", answerText: "親戚關係")
        questionsText.append(question6)
        
        let question7 = questions(questionText: "他走了的英文怎麼說？", answerText: "IKEA（台語諧音）")
        questionsText.append(question7)
        
        let question8 = questions(questionText: "爲什麽大部份佛教徒都在北半球？", answerText: "南”無”阿彌陀佛")
        questionsText.append(question8)
        
        let question9 = questions(questionText: "哪一個月有二十八天？", answerText: "每個月都有28天")
        questionsText.append(question9)
        
        let question10 = questions(questionText: "鴨蛋一打有幾個？", answerText: "0個（因為一打就破了）")
        questionsText.append(question10)
        
        let question11 = questions(questionText: "醬油的哥哥是誰？", answerText: "醬油膏（台語：豆油哥）")
        questionsText.append(question11)
        
        let question12 = questions(questionText: "什麼車最多燈？", answerText: "垃圾車（因為它會一邊放音樂：登登登登登~~)")
        questionsText.append(question12)
        
        let question13 = questions(questionText: "有一隻公鹿，它走著走著，越走越快，最後怎麽樣？", answerText: "它變成了高速公路")
        questionsText.append(question13)
        
        questionsText.shuffle()
        
        questionTextLabel.text = questionsText[index].questionText
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showAnswerBtn(_ sender: UIButton) {
        answerTextLabel.text = questionsText[index].answerText
        
    }
    
    @IBAction func nextBtn(_ sender: UIButton) {
        index = (index + 1) % questionsText.count
        questionTextLabel.text = questionsText[index].questionText
        answerTextLabel.text = ""
        
    }
    
    @IBAction func leftStepper(_ sender: UIStepper) {
        leftScore = Int(leftStepperOutlet.value)
        teamLScoreLabel.text = String(leftScore)
        
        if leftScore == 10{
            announcementText.text = "🏆A隊獲勝!!!"
        }else if leftScore > 5 , rightScore < 5 {
            announcementText.text = "B隊加油!"
        }
    }
    
    @IBAction func rightStepper(_ sender: UIStepper) {
        rightScore = Int(rightStepperOutlet.value)
        teamRScoreLabel.text = String(rightScore)
        
        if rightScore == 10 {
            announcementText.text = "🏆B隊獲勝!!!"
        }else if rightScore > 5 , leftScore < 5 {
            announcementText.text = "A隊加油!"
        }
    }
    
    @IBAction func cleanBtn(_ sender: UIButton) {
        rightScore = 0
        leftScore = 0
        
        rightStepperOutlet.value = 0
        leftStepperOutlet.value = 0
        
        teamLScoreLabel.text = String(leftScore)
        teamRScoreLabel.text = String(rightScore)
        
        announcementText.text = ""
    }
    
}

