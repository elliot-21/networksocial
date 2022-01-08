
import UIKit

class PublicacionesScreen: UIViewController,UITableViewDelegate,UITableViewDataSource   {
    
    @IBOutlet weak var PublicacionesFeed: UITableView!
    
    
    var Publicaciones =  [Any]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PublicacionesFeed.delegate = self
        PublicacionesFeed.dataSource = self
        PublicacionesFeed.register(FeedPublicaciones.nib(), forCellReuseIdentifier: FeedPublicaciones.identificador)
        Publicaciones = [
            [1,"Aristoteles","La amistad es un alma que habita en dos cuerpos; un corazón que habita en dos almas.","Likes 10"],
            [2,"Pablo Neruda","Decidí enamorarme de la vida, es la única que no me va a dejar sin antes hacerlo yo","Likes 21"],
            [3,"Charles Bukowski"," Me gusta pensar en todas esas personas que me enseñaron cosas que nunca había imaginado antes","Likes 10"]
        ]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Publicaciones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indice = indexPath.row
        var celda_publicaciones = tableView.dequeueReusableCell(withIdentifier: FeedPublicaciones.identificador, for: indexPath) as! FeedPublicaciones
        celda_publicaciones.configurar_celda(Datos: Publicaciones[indice] as! [Any])
        return celda_publicaciones
    }
    


}
