import Foundation
var arrDataColors: Data_Graficas?
var arrDataQuestions: DataQuestions?
var arrDataChart: DataChart?

class QuestionsService{
    
    func WebSeerviceQuestions(exito: @escaping (_ exito: Data_Graficas?) ->(),
                              fallo: @escaping (_ fallo: String) ->()){
        let url = URL(string: server)
        var request = URLRequest(url: url!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request)
        {
            (informacion, response, error) in
            
            
            if informacion == nil{
                print("Esta Vacia la informacion")
            }else{
                do{
                     
                    arrDataColors = try JSONDecoder().decode(Data_Graficas.self, from: informacion!)
                   // print(arrDataColors!)
                    exito(arrDataColors!)
                    
                }catch{
                    print("Error en la Solicitud \(error)")
                }
                
            }
        }.resume()
    }
    
}
