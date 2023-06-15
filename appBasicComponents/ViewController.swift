//
//  ViewController.swift
//  adminGastos
//
//  Created by Fernando Contreras on 12/06/23.
//

import UIKit

class ViewController: UIViewController {

    
    //vars and constants
    private let arrayNames = ["Fer", "Bri", "Mitchu"]
    
    //Outlets declarations
    @IBOutlet weak var testLabelFer: UILabel!
    
    @IBOutlet weak var testPickerFer: UIPickerView!
    
    @IBOutlet weak var testPageControlFer: UIPageControl!
    
    @IBOutlet weak var testSegmentFer: UISegmentedControl!
    
    @IBOutlet weak var testSliderFer: UISlider!
    
    @IBOutlet weak var testStepperFer: UIStepper!
    
    @IBOutlet weak var testSwitchFer: UISwitch!
    
    //entiendo que es como el component did mount de react
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testLabelFer.text="Hola fer"
        testLabelFer.backgroundColor = UIColor.blue // es igual que ponerlo solamente .blue
        testLabelFer.textColor = .white
        
        testPickerFer.dataSource = self
        testPickerFer.delegate = self
        
        //paginator
        testPageControlFer.numberOfPages = arrayNames.count
        
        //segment
        testSegmentFer.removeAllSegments()//se borran los segmentos con los que nace del storyboard
        for (indice, elemento) in arrayNames.enumerated() { //se crea un for para cada elemento del array
            testSegmentFer.insertSegment(withTitle: elemento, at: indice, animated: true)//esto para agregar segmentos al componente segment
        }
        testSegmentFer.selectedSegmentIndex=0//se inicializa en cero la seleccion del segment
        
        //slider
        testSliderFer.minimumValue = 1
        testSliderFer.maximumValue = Float(arrayNames.count)
        
        //stepper
        testStepperFer.minimumValue = 0
        testStepperFer.maximumValue = Double(arrayNames.count-1)
        
        //switch
        testSwitchFer.isOn = false
        
    }
    
    //funcion global para setear el nombre del label desde los action de cada componente
    func setValueLabel(value incoming: String){
        
        testLabelFer.text = "Hola "+incoming
    }
    
    func setValueToOtherComponents(value incoming: Int, valueFloat incomingFloat: Float? = nil){
        
        //PICKER
        testPickerFer.selectRow(incoming, inComponent: 0, animated: true)
        
        //SEGMENT
        testSegmentFer.selectedSegmentIndex = incoming
        
        //PAGE CONTROL
        testPageControlFer.currentPage = incoming
        
        //Slider
        var valueSlider: Float = 1.0
        if incomingFloat != nil {
            valueSlider = incomingFloat!
        }else {
            valueSlider = Float(incoming+1)
        }
        testSliderFer.value = valueSlider
        
        //STEPPER
        testStepperFer.value = Double(incoming)
        
    }
    
    //actions
    @IBAction func actionTestPageControlFer(_ sender: Any) {//acction page control
        
        setValueToOtherComponents(value: testPageControlFer.currentPage)
        //esto es para darle la selección desde el page control al: picker
        //testPickerFer.selectRow(testPageControlFer.currentPage, inComponent: 0, animated: true)
        
        //:nombre al label
        setValueLabel(value: arrayNames[testPageControlFer.currentPage])
        
        //:segment
        //testSegmentFer.selectedSegmentIndex = testPageControlFer.currentPage
    }
    
    
    @IBAction func testSegmentFerAction(_ sender: Any) {//action from segment
        
        //se setea el nombre del label
        setValueLabel(value: arrayNames[testSegmentFer.selectedSegmentIndex])
        
        setValueToOtherComponents(value: testSegmentFer.selectedSegmentIndex)
        
        //esto es para darle la selección desde el segment al: picker
        //testPickerFer.selectRow(testSegmentFer.selectedSegmentIndex, inComponent: 0, animated: true)
        
        //:al page control
        //testPageControlFer.currentPage = testSegmentFer.selectedSegmentIndex
    }
    
    
    @IBAction func testSliderFerAction(_ sender: Any) {//action to slider component
        
        print(testSliderFer.value)
        
        let selectedValueSlider = Int(roundf(testSliderFer.value)-1)
        
        setValueToOtherComponents(value: selectedValueSlider, valueFloat: testSliderFer.value)
        
        setValueLabel(value: arrayNames[selectedValueSlider])
        
    }
    
    @IBAction func testStepperFerAction(_ sender: Any) {
        print(testStepperFer.value)
        let selectedValueStepper = Int(round(testStepperFer.value))
        setValueLabel(value: arrayNames[selectedValueStepper])

        setValueToOtherComponents(value: selectedValueStepper)
    }
    
    @IBAction func testSwitchFerAction(_ sender: Any) {
        
            testPickerFer.isHidden = testSwitchFer.isOn
            testStepperFer.isHidden = testSwitchFer.isOn
            testSliderFer.isHidden = testSwitchFer.isOn
            testSegmentFer.isHidden = testSwitchFer.isOn
            testPageControlFer.isHidden = testSwitchFer.isOn
    }
    
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {//el extensions es para añadir funcionalidad a un tipo calase enum etc
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }//esta funcion es de UIPickerViewDataSource que son protocolos y se extiendes a esta clase es para decirle cuantas columnas de datos va a mostrar
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayNames.count
    }// esta funcion es para decirle cuantos registros mostrará
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayNames[row]
    }//aquí se setea el nombre seleccionado
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let valueSelected = arrayNames[row]
        print(valueSelected)
        
        //esto es para darle la selección desde el pciker al: nombre del label
        setValueLabel(value: valueSelected)
        
        setValueToOtherComponents(value: row)
        
        //:page control
        //testPageControlFer.currentPage = row
        
        //:segment
        //testSegmentFer.selectedSegmentIndex = row
        
    }//esta func es para delegar la acción al seleccionar un elemento
    
    
}


