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
        
    }
    //actions
    @IBAction func actionTestPageControlFer(_ sender: Any) {
        //este es un action del
        testPickerFer.selectRow(testPageControlFer.currentPage, inComponent: 0, animated: true)
        
        testLabelFer.text = "Hola "+arrayNames[testPageControlFer.currentPage]
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
        testLabelFer.text = "Hola "+valueSelected
        
        testPageControlFer.currentPage = row
        
    }//esto es para delegar la acción al seleccionar un elemento
    
    
}

