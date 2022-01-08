//
//  ListaChats.swift
//  network_social
//
//  Created by Leonardo Hernandez Sanchez on 05/01/22.
//

import UIKit

class ListaChats: UITableViewCell {
    
    @IBOutlet weak var lblDato: UILabel!
    @IBOutlet weak var lblNumMensajes: UILabel!
    @IBOutlet weak var lblMensaje: UILabel!
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var imgAvatar: UIImageView!
    
    static let identificador = "Identificador_Celda_Lista"
    
    static func nib() -> UINib
    {
        return UINib(nibName: "ListaChats", bundle: nil)
    }
    
    var id = -1
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configurar_celda(Datos : [Any])
    {
        id = Datos[0] as! Int
        lblNombre.text = "User\(Datos[1] as! String)"
        lblMensaje.text = "Mensaje\(Datos[1] as! String)"
        lblNumMensajes.text = (Datos[1] as! String)
        lblDato.text = Obtener_valor_fecha(fecha: Date(), stilo: "Fecha_Usuario")
    }
    
    func regresa_id() -> Int
    {
        return id
    }
    
    
    
}
