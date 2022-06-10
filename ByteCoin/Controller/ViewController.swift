//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, CoinManagerDelegate {
    
//    var coinManager = CoinManager()
    

    @IBOutlet weak var dollarLabel: UILabel!
    
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    var coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currencyPicker.dataSource = self
        
        currencyPicker.delegate = self
        
        coinManager.delegate = self
        
    }
    
    func didUpdatePrice(price: String, currency: String) {
        DispatchQueue.main.async {
            self.dollarLabel.text = price
            //
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        print(coinManager.currencyArray[row])
        let selectedCurrency = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: selectedCurrency)
    }
}

// MARK: - CoinManagerDelegate

//extension ViewController: CoinManagerDelegate {
//
//
//    func didUpdatePrice(price: String, currency: String) {
//        DispatchQueue.main.async {
//            self.dollarLabel.text = price
//            //
//        }
//    }
//
//    func didFailWithError(error: Error) {
//        print(error)
//    }
//
//
//}

