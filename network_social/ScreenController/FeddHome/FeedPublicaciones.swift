

import UIKit

class FeedPublicaciones: UITableViewCell {
    
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblFecha: UILabel!
    @IBOutlet weak var btnMore: UIButton!
    @IBOutlet weak var lblDescripcion: UILabel!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var lblLike: UILabel!
    @IBOutlet weak var imgPublicacion: UIImageView!
    @IBOutlet weak var imgPerfil: UIImageView!
    
    static let identificador = "Identificador_Celda_Publicacion"
    
    static func nib() -> UINib
    {
        return UINib(nibName: "FeedPublicaciones", bundle: nil)
    }
    
    var id = -1

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func btnLike(_ sender: Any) {
        var imagen = UIImage(named: "corazon")
        (sender as! UIButton).setImage(imagen, for: .normal)
    }
    
    @IBAction func btnComentario(_ sender: Any) {
        var imagen = UIImage(named: "chat")
        (sender as! UIButton).setImage(imagen, for: .normal)
    }
    
    
    func configurar_celda(Datos : [Any])
    {
        id = Datos[0] as! Int
        lblNombre.text = Datos[1] as! String
        lblFecha.text = Obtener_valor_fecha(fecha: Date(), stilo: "")
        lblDescripcion.text = Datos[2] as! String
        imgPerfil.imagen_circular()
        imgPublicacion.bordes_redondos()
        lblLike.text = Datos[3] as! String
        
    }
    
    func regresa_id() -> Int
    {
        return id
    }
    
    
    
}
