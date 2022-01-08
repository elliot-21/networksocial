//
//  PerfilScreen.swift
//  network_social
//
//  Created by Leonardo Hernandez Sanchez on 05/01/22.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage


class PerfilScreen: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    private let db = Firestore.firestore()
    @IBOutlet weak var imgPerfil: UIImageView!
    @IBOutlet weak var lblPost: UILabel!
    @IBOutlet weak var lblFollowers: UILabel!
    @IBOutlet weak var lblFollowing: UILabel!
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblCiudad: UILabel!
    @IBOutlet weak var tablaPerfilUser: UITableView!
    var cambio = 0
    
    var Post =  [Any]()
    var PostLiked =  [Any]()
    var UserName = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        llenadoLabels()
        tablaPerfilUser.delegate = self
        tablaPerfilUser.dataSource = self
        tablaPerfilUser.register(PostFeed.nib(), forCellReuseIdentifier: PostFeed.identificador)
        ConsultaUser()
        TablaPost()
        TablaLiked()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if cambio == 0{
            return Post.count
        }
        return PostLiked.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if cambio == 0{
            let indice = indexPath.row
            var celda_post = tableView.dequeueReusableCell(withIdentifier: PostFeed.identificador, for: indexPath) as! PostFeed
            celda_post.configurar_celda(Datos: Post[indice] as! [Any])
            return celda_post
        }
        let indice = indexPath.row
        var celda_post = tableView.dequeueReusableCell(withIdentifier: PostFeed.identificador, for: indexPath) as! PostFeed
        celda_post.configurar_celda(Datos: PostLiked[indice] as! [Any])
        return celda_post
        
        
    }
    @IBAction func botonCerrarSession(_ sender: Any) {
        do{
            try Auth.auth().signOut()
            navigationController?.popViewController(animated: true)
        }catch{
            Alerta_Mensaje(title: "Aviso", Mensaje: "Error al Cerrar Sesion")
        }
    }
    
    @IBAction func segmentBoton(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            cambio = 0
            self.tablaPerfilUser.reloadData()
        }
        if sender.selectedSegmentIndex == 1{
            cambio = 1
            self.tablaPerfilUser.reloadData()
            print(cambio)
        }
    }

    func ConsultaUser(){
        db.collection("users").document(Gcorreo).getDocument{
            (documentSnapshot, error) in
            if let document = documentSnapshot, error == nil{
                if let nombre = document.get("nombre") as? String{
                    self.lblNombre.text = nombre
                    self.UserName = nombre
                }
                if let urlimage = document.get("urlimage") as? String{
                    self.imgPerfil.cargar_imagen_URL(direccion_url: urlimage)
                    self.imgPerfil.imagen_circular()
                    
                }
            }
        }
    }
    
    func TablaPost(){
        Post = [
            [1,"My User","La amistad es un alma que habita en dos cuerpos; un corazón que habita en dos almas.","Likes 10"],
            [2,"My User","Decidí enamorarme de la vida, es la única que no me va a dejar sin antes hacerlo yo","Likes 21"],
            [3,"My User"," Me gusta pensar en todas esas personas que me enseñaron cosas que nunca había imaginado antes","Likes 21"]
        ]
    }
    
    func TablaLiked(){
        PostLiked = [
            [1,"Other user","La amistad es un alma que habita en dos cuerpos; un corazón que habita en dos almas.","Likes 100"],
        ]
    }
    func llenadoLabels(){
        lblPost.text = ("\(numberRandom())")
        lblFollowers.text = ("\(numberRandom())")
        lblFollowing.text = ("\(numberRandom())")
    }
    
    

}
