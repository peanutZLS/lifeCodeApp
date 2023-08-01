//
//  ViewController.swift
//  lifeNumber
//
//  Created by 郭家宇 on 2023/8/1.
//

import UIKit

class ViewController: UIViewController {



    @IBOutlet var lifecodeScore: UILabel!
    @IBOutlet var lifecodeLabel: UILabel!
    @IBOutlet var lifecodeDataPicker: UIDatePicker!
    @IBOutlet var lifecodeImage: UIImageView!
    @IBOutlet var lifeanswerLabel: UILabel!
    @IBOutlet var lifeansAge: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func resultButton(_ sender: Any) {
        starSign()
        lifecodeCalculator()
    }
    func lifecodeCalculator(){
        let lifeCodeMeanings = ["","開創", "協調", "創意", "務實", "自由","關懷", "探究", "權威", "智慧"]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yMd"
        var dateString = dateFormatter.string(from: lifecodeDataPicker.date)
        var sum = 0
        repeat{
            //每次repeat都由零開始，否則將進入無限循環
            sum = 0
            
        //for迴圈：取日期數字相加之結果
        for characters in dateString {
            //字串轉數字
            let number = Int(String(characters))!
            sum = sum + number
        }
            //得到的總和轉成字串，dateString函數=sum總和字串
            dateString = "\(sum)"
        //當sum>9時，繼續迴圈至sum<=9
        }while sum > 9
        
        lifecodeScore.text = "\(sum)"
        lifecodeLabel.text = lifeCodeMeanings[sum]
    }

    
    func starSign(){
        let pickDate = lifecodeDataPicker.date
        let dateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: pickDate)
        let year = dateComponents.year!
        let month = dateComponents.month!
        let day = dateComponents.day!
        
        //取值（現在日期）
        let today = Date()
        let currentDateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: today)
        let currentYear = currentDateComponents.year!
        var age = 0
        //計算年紀
        age = currentYear - year
        //年紀不出現負數
        if age < 0 {
            age = 0
        }
        lifeansAge.text = "Current Age:\(age)"
        //設定星座日期區間＆顯示星座對應image
        if month == 1 && day >= 19 || month == 2 && day <= 19 {
            lifeanswerLabel.text = "水瓶座 Aquarius"
            lifecodeImage.image = UIImage(named: "aquarius")
        }else if month == 2 && day >= 20 || month == 3 && day <= 20 {
            lifeanswerLabel
            lifecodeImage.image = UIImage(named: "pisces")
        }else if month == 3 && day >= 21 || month == 4 && day <= 20 {
            lifeanswerLabel.text = "牡羊座 Aries"
            lifecodeImage.image = UIImage(named: "aries")
        }else if month == 4 && day >= 21 || month == 5 && day <= 20 {
            lifeanswerLabel.text = "金牛座 Taurus"
            lifecodeImage.image = UIImage(named: "taurus")
        }else if month == 5 && day >= 21 || month == 6 && day <= 20 {
            lifeanswerLabel.text = "雙子座 Gemini"
            lifecodeImage.image = UIImage(named: "gemini")
        }else if month == 6 && day >= 21 || month == 7 && day <= 22 {
            lifeanswerLabel.text = "巨蟹座 Cancer"
            lifecodeImage.image = UIImage(named: "cancer")
        }else if month == 7 && day >= 23 || month == 8 && day <= 22 {
            lifeanswerLabel.text = "獅子座 Leo"
            lifecodeImage.image = UIImage(named: "leo")
        }else if month == 8 && day >= 23 || month == 9 && day <= 22 {
            lifeanswerLabel.text = "處女座 Virgo"
            lifecodeImage.image = UIImage(named: "virgo")
        }else if month == 9 && day >= 23 || month == 10 && day <= 22 {
            lifeanswerLabel.text = "天秤座 Libra"
            lifecodeImage.image = UIImage(named: "libra")
        }else if month == 10 && day >= 23 || month == 11 && day <= 22 {
            lifeanswerLabel.text = "天蠍座 Scorpio"
            lifecodeImage.image = UIImage(named: "scorpio")
        }else if month == 11 && day >= 23 || month == 12 && day <= 22 {
            lifeanswerLabel.text = "射手座 Sagittarius"
            lifecodeImage.image = UIImage(named: "sagittarius")
        }else{
            lifeanswerLabel.text = "摩羯座 Capricorn"
            lifecodeImage.image = UIImage(named: "capricornus")
        }
    }
}

