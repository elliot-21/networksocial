//
//  ListaNotificacion.swift
//  network_social
//
//  Created by Leonardo Hernandez Sanchez on 05/01/22.
//

import UIKit

class ListaNotificacion: UITableViewCell {
    
    @IBOutlet weak var lblUser: UILabel!
    @IBOutlet weak var lblDescripcion: UILabel!
    @IBOutlet weak var lblFecha: UILabel!
    
    
    static let identificador = "Identificador_Celda_Notificacion"
    
    static func nib() -> UINib
    {
        return UINib(nibName: "ListaNotificacion", bundle: nil)
    }
    
    var id = -1
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func configurar_celda(Datos : [Any])
    {
        id = Datos[0] as! Int
        lblUser.text = "\(Datos[1] as! String)"
        lblDescripcion.text = "\(Datos[2] as! String)"
        lblFecha.text = Obtener_valor_fecha(fecha: Date(), stilo: "Fecha_Usuario")
        
    }
    
    func regresa_id() -> Int
    {
        return id
    }
    
    
}
