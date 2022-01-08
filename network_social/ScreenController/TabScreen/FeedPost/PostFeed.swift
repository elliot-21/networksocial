//
//  PostFeed.swift
//  network_social
//
//  Created by Leonardo Hernandez Sanchez on 07/01/22.
//

import UIKit

class PostFeed: UITableViewCell {
    
    @IBOutlet weak var imgPerfilUser: UIImageView!
    @IBOutlet weak var lblNombreUser: UILabel!
    @IBOutlet weak var lblfecha: UILabel!
    @IBOutlet weak var lblDescripcion: UILabel!
    @IBOutlet weak var lblNumLikes: UILabel!
    @IBOutlet weak var imgPostUser: UIImageView!
    
    static let identificador = "Identificador_Celda_Post"
    
    static func nib() -> UINib
    {
        return UINib(nibName: "PostFeed", bundle: nil)
    }
    
    var id = -1

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    
    @IBAction func btnLike(_ sender: Any) {
        var imagen = UIImage(named: "corazon")
        (sender as! UIButton).setImage(imagen, for: .normal)
    }
    @IBAction func btnComent(_ sender: Any) {
        var imagen = UIImage(named: "chat")
        (sender as! UIButton).setImage(imagen, for: .normal)
    }
    
    
    func configurar_celda(Datos : [Any])
    {
        id = Datos[0] as! Int
        lblNombreUser.text = Datos[1] as! String
        lblfecha.text = Obtener_valor_fecha(fecha: Date(), stilo: "")
        lblDescripcion.text = Datos[2] as! String
        imgPerfilUser.imagen_circular()
        imgPostUser.bordes_redondos()
        lblNumLikes.text = Datos[3] as! String
        
    }
    
    func regresa_id() -> Int
    {
        return id
    }
    
    
    
    
}
