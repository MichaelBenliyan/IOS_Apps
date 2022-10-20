import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightValue: UILabel!
    @IBOutlet weak var heightValue: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        heightValue.text = "\(String(format: "%.2f", sender.value)) m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightValue.text = "\(String(format: "%.0f", sender.value)) kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        calculatorBrain.calcBMI(height: heightSlider.value, weight: weightSlider.value)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMI()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}

