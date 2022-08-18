//
//  ViewController.swift
//  PickerView
//
//  Created by 이정훈 on 2022/08/18.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let MAX_ARRAY_NUM = 8    //배열의 크기 지정
    let PICKER_VIEW_COLUMN = 1    //Picker View의 열의 개수를 1개로 지정
    var subject: [String] = ["국어", "수학", "과학", "영어", "사회", "음악", "미술", "체육"]
    
    @IBOutlet var pickerSubject: UIPickerView!
    @IBOutlet var lblSubject: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pickerSubject.delegate = self    //delegate 설정
        pickerSubject.dataSource = self    //delegate 설정
        
        lblSubject.text = subject[0]
    }
    
    //Picker View의 열의 개수를 정수 값으로 넘겨주는 delegate method
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    //Picker View에서 선택할 수 있는 행의 개수를 정수 값으로 넘겨주는 delegate method
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return MAX_ARRAY_NUM
    }
    
    //각 열의 타이틀을 문자열로 넘겨주는 delegate method
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return subject[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblSubject.text = subject[row]
    }
}
