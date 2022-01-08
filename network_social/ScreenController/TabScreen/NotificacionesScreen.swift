//
//  NotificacionesScreen.swift
//  network_social
//
//  Created by Leonardo Hernandez Sanchez on 05/01/22.
//

import UIKit

class NotificacionesScreen: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var listaNotificaciones: UITableView!
    
    var notificaciones =  [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listaNotificaciones.delegate = self
        listaNotificaciones.dataSource = self
        listaNotificaciones.register(ListaNotificacion.nib(), forCellReuseIdentifier: ListaNotificacion.identificador)
        notificaciones = [
            [1,"Pedro","Presione para eliminar"],
            [2,"Juan","Nueva etiqueta"],
            [3,"Carlos","Nueva mencion"]
        ]
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificaciones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indice = indexPath.row
        var celda_notificaciones = tableView.dequeueReusableCell(withIdentifier: ListaNotificacion.identificador, for: indexPath) as! ListaNotificacion
        celda_notificaciones.configurar_celda(Datos: notificaciones[indice] as! [Any])
        return celda_notificaciones
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var Numero_fila = indexPath.row
        var fila_seleccionada = notificaciones[Numero_fila] as! [Any]
        listaNotificaciones.reloadData()
        let Mensaje_alerta = UIAlertController(title: "Eliminar", message: "Estas Seguro?", preferredStyle: UIAlertController.Style.alert)
        let BotonAlertaCancelar = UIAlertAction(title: "Cancelar", style: UIAlertAction.Style.default, handler: nil)
        let BotonAlertaOK = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:
                                        { _ in
                                                self.notificaciones.remove(at: Numero_fila)
                                                self.listaNotificaciones.reloadData()
                                            })
        Mensaje_alerta.addAction(BotonAlertaOK)
        Mensaje_alerta.addAction(BotonAlertaCancelar)
        self.present(Mensaje_alerta, animated: true, completion: nil)
    }
    
    
  
}
