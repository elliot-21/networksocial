
import UIKit
import Charts
import SwiftUI

class GraficasScreen: UIViewController, ChartViewDelegate {
    
    
    @IBOutlet weak var lblQuestion: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        ConfigurarPieChart()
    }
    
    
    @IBAction func SegmentQuestion(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
           ConfigurarPieChart()
        }
        if sender.selectedSegmentIndex == 1{
           llenar_PieChartQ1()
        }
        if sender.selectedSegmentIndex == 2{
            llenar_PieChartQ2()
        }
        if sender.selectedSegmentIndex == 3{
           llenar_PieChartQ3()
        }
        if sender.selectedSegmentIndex == 4{
           llenar_PieChartQ4()
        }
        
        
    }
    
    
    func ConfigurarPieChart(){
        let ServicioWeb = QuestionsService()
         ServicioWeb.WebSeerviceQuestions(){
             (exito) in
             DispatchQueue.main.async {
                 self.lblQuestion.text = exito?.questions![2].text
                 let pieChart = PieChartView(frame: CGRect(x: 0, y: 0,
                                                           width: self.view.frame.width,
                                                           height: self.view.frame.width))
                 var entries = [PieChartDataEntry]()
                 
                 for x in 0...10{
                     entries.append(PieChartDataEntry(value: Double(x),
                                                      data: Double.random(in: 0...20)))
                 }
                 let set = PieChartDataSet(entries: entries, label: "\(exito?.questions![0].text!)")
                 
                 let data = PieChartData(dataSet: set)
                 pieChart.data = data
                 self.view.addSubview(pieChart)
                 pieChart.backgroundColor = .white
                 pieChart.center = self.view.center
                 
                 
                 
             }
         }fallo: { fallo in
             self.Alerta_Mensaje(title: "Aviso", Mensaje: "Fallo en Servidor")
         }
    }
    
    func llenar_PieChartQ1(){
        let ServicioWeb = QuestionsService()
         ServicioWeb.WebSeerviceQuestions(){
             (exito) in
             DispatchQueue.main.async {
                 self.lblQuestion.text = exito?.questions![1].text
                 let barChart = BarChartView(frame: CGRect(x: 0, y: 0,
                                                           width: self.view.frame.width,
                                                           height: self.view.frame.width))
                 var entries = [BarChartDataEntry]()
                 for x in 0...10{
                     entries.append(BarChartDataEntry(x: Double(x),
                                                      y: Double.random(in: 0...20)))
                 }
                 let set = BarChartDataSet(entries: entries, label: "Cost1")
                 let data = BarChartData(dataSet: set)
                 barChart.data = data
                 self.view.addSubview(barChart)
                 barChart.backgroundColor = .white
                 barChart.center = self.view.center
             }
         }fallo: { fallo in
             self.Alerta_Mensaje(title: "Aviso", Mensaje: "Fallo en Servidor")
         }
    }
    func llenar_PieChartQ2(){
        let ServicioWeb = QuestionsService()
         ServicioWeb.WebSeerviceQuestions(){
             (exito) in
             DispatchQueue.main.async {
                 self.lblQuestion.text = exito?.questions![2].text
                 let pieChart = PieChartView(frame: CGRect(x: 0, y: 0,
                                                           width: self.view.frame.width,
                                                           height: self.view.frame.width))
                 var entries = [PieChartDataEntry]()
                 
                 for x in 0...10{
                     entries.append(PieChartDataEntry(value: Double(x),
                                                      data: Double.random(in: 0...20)))
                 }
                 let set = PieChartDataSet(entries: entries, label: "\(exito?.questions![0].text!)")
                 
                 let data = PieChartData(dataSet: set)
                 pieChart.data = data
                 self.view.addSubview(pieChart)
                 pieChart.backgroundColor = .white
                 pieChart.center = self.view.center
             }
         }fallo: { fallo in
             self.Alerta_Mensaje(title: "Aviso", Mensaje: "Fallo en Servidor")
         }
        
    }
    func llenar_PieChartQ3(){
        let ServicioWeb = QuestionsService()
         ServicioWeb.WebSeerviceQuestions(){
             (exito) in
             DispatchQueue.main.async {
                 self.lblQuestion.text = exito?.questions![3].text
                 let barChart = BarChartView(frame: CGRect(x: 0, y: 0,
                                                           width: self.view.frame.width,
                                                           height: self.view.frame.width))
                 var entries = [BarChartDataEntry]()
                 for x in 0...10{
                     entries.append(BarChartDataEntry(x: Double(x),
                                                      y: Double.random(in: 0...20)))
                 }
                 let set = BarChartDataSet(entries: entries, label: "Cost1")
                 let data = BarChartData(dataSet: set)
                 barChart.data = data
                 self.view.addSubview(barChart)
                 barChart.backgroundColor = .white
                 barChart.center = self.view.center
             }
         }fallo: { fallo in
             self.Alerta_Mensaje(title: "Aviso", Mensaje: "Fallo en Servidor")
         }
        
    }
    func llenar_PieChartQ4(){
        let ServicioWeb = QuestionsService()
         ServicioWeb.WebSeerviceQuestions(){
             (exito) in
             DispatchQueue.main.async {
                 self.lblQuestion.text = exito?.questions![4].text
                 let pieChart = PieChartView(frame: CGRect(x: 0, y: 0,
                                                           width: self.view.frame.width,
                                                           height: self.view.frame.width))
                 var entries = [PieChartDataEntry]()
                 for x in 0...10{
                     entries.append(PieChartDataEntry(value: Double(x),
                                                      data: Double.random(in: 0...20)))
                 }
                 let set = PieChartDataSet(entries: entries, label: "\(exito?.questions![0].text!)")
                 let data = PieChartData(dataSet: set)
                 pieChart.data = data
                 self.view.addSubview(pieChart)
                 pieChart.backgroundColor = .white
                 pieChart.center = self.view.center
             }
         }fallo: { fallo in
             self.Alerta_Mensaje(title: "Aviso", Mensaje: "Fallo en Servidor")
         }
        
    }
    
    
}
