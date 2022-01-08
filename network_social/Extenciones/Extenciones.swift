import UIKit
import Foundation


extension UIViewController
{
    
    func numberRandom()-> Int{
        let randomInt = Int.random(in: 21..<50)
        return randomInt 
    }
    func randomString(length: Int) -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
    func  quitar_barra_navegacion(){
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func  poner_barra_navegacion(){
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func Alerta_Mensaje(title: String, Mensaje:String)
    {
        let Mensaje_alerta = UIAlertController(title: title, message: Mensaje, preferredStyle: UIAlertController.Style.alert)
        let BotonAlertaOK = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        Mensaje_alerta.addAction(BotonAlertaOK)
        self.present(Mensaje_alerta, animated: true, completion: nil)
        
    }
    
   

}

func Obtener_valor_fecha(fecha: Date, stilo: String) -> String
{
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "es_419")
    switch stilo
    {
    case "Fecha_Usuario": formatter.dateFormat = "dd/MMMM/yyyy"
    case "Fecha_Base_datos": formatter.dateFormat = "yyyy/MM/dd"
    case "Fecha_mongo": formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    default: formatter.dateFormat = "dd/MM/yyyy hh:mm a"
    }
    return formatter.string(from: fecha)
}

extension UITextField
{
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func Visualizar_Contrasena()
    {
        self.isSecureTextEntry = !self.isSecureTextEntry
        //self.keyboardType = .namePhonePad
    }
    func valida_vacio() -> Bool
    {
        return (self.text)!.isEmpty
    }
    
}
func showToast(controller: UIViewController, message : String, seconds: Double) {
    let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
    alert.view.backgroundColor = UIColor.black
    alert.view.alpha = 0.6
    alert.view.layer.cornerRadius = 15

    controller.present(alert, animated: true)

    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
        alert.dismiss(animated: true)
    }
}

extension UIImageView
{
    func cargar_imagen_URL(direccion_url: String)
    {
        var url = URL(string: direccion_url)!
        
        DispatchQueue.global().async
        { [weak self] in
            if let data = try? Data(contentsOf: url)
            {
                if let image = UIImage(data: data)
                {
                    DispatchQueue.main.async
                    {
                        self?.image = image
                    }
                }
            }
        
        }
    }
    
    func bordes_redondos()
    {
        self.layer.borderWidth = 2
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.layer.cornerRadius = self.frame.height / 4
        self.clipsToBounds = true
    }
    func imagen_circular()
    {
        self.contentMode = UIView.ContentMode.scaleAspectFill
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = false
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.systemBlue.cgColor
        self.clipsToBounds = true
        //self.image = anyImage
    }
    
   
    
}



