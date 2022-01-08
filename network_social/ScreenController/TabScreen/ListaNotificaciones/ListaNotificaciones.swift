
import UIKit

class ListaNotificaciones: UITableViewCell {
    
    static let identificador = "Identificador_Celda_Notificaciones"
    
    static func nib() -> UINib
    {
        return UINib(nibName: "ListaNotificaciones", bundle: nil)
    }
    
    var id = -1
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configurar_celda(Datos: [Any])
    {
        id = Datos[0] as! Int
        
    }
    
    func regresa_id() -> Int
    {
        return id
    }
    
    
    
}
