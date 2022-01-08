//
//  MensajesScreen.swift
//  network_social
//
//  Created by Leonardo Hernandez Sanchez on 05/01/22.
//

import UIKit

class MensajesScreen: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var listaChats: UITableView!
    var cont = 1
    var datos = [Any]()

    override func viewDidLoad() {
        super.viewDidLoad()
        listaChats.delegate = self
        listaChats.dataSource = self
        listaChats.register(ListaChats.nib(), forCellReuseIdentifier: ListaChats.identificador)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indice = indexPath.row
        var celda_chat = tableView.dequeueReusableCell(withIdentifier: ListaChats.identificador, for: indexPath) as! ListaChats
        celda_chat.configurar_celda(Datos: datos[indice] as! [Any])
        return celda_chat
    }
    @IBAction func newChat(_ sender: Any) {
        datos.append([cont, "\(cont)", "\(cont)"])
        cont = cont + 1
        listaChats.reloadData()
    }
    

}
