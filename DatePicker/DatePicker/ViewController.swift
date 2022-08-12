//
//  ViewController.swift
//  DatePicker
//
//  Created by 이정훈 on 2022/07/19.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector: Selector = #selector(Self.updateTime)    //타이머로 사용할 함수 설정
    let interval = 1.0    //타이머 간격
    //var count = 0    label에 표시할 숫자
    
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //view가 load되면 timer 함수 시작
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {    //Swift4 이상에서 #selecrot에 인자로 사용될 함수는 objective-C와의 호환성을 위해 @objc 키워드 사용
        /*lblCurrentTime.text = String(count)
        count += 1*/
        
        let date = NSDate()    //2001년 01월 01일을 기준으로 현재 시간까지의 경과를 초 단위로 저장하는 인스턴스
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "현재시간: " + formatter.string(from: date as Date)
    }
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        //date picker를 사용하여 날짜 선택시 액션 함수가 호출되고 UIDatePicker 타입 인수가 파라미터로 전달
        
        let formatter = DateFormatter()    //날짜 형식을 지정할 인스턴스 생성
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"    //출력할 날짜 형식 지정
        lblPickerTime.text = "선택시간: " + formatter.string(from: datePickerView.date)
    }
}
