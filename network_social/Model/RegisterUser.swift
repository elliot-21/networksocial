import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage

class RegisterUser{
    private let db = Firestore.firestore()
     
    
    func UserRegister(correo: String, contraseña: String,urlImage : String,nombre: String, exito: @escaping (_ exito: String) ->(),
                      fallo: @escaping (_ fallo: String) ->()){
        Auth.auth().createUser(withEmail: correo, password: contraseña){
            (result, error) in
            if let result = result, error == nil {
                self.db.collection("users").document(correo).setData(["nombre":nombre,"urlimage": urlImage])
                exito("Registro Exitoso")
            }else{
                fallo("Correo en uso o intente mas tarde")
               
            }
        }
        
        
    }
    func uploadFile(urlFile: URL?,exito: @escaping (_ exito: String) ->(),
                    fallo: @escaping (_ fallo: String) ->()) {
        var documentRoute = ""
        var file = urlFile
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var filename = String((0..<7).map{ _ in letters.randomElement()! })
        let storageReference = Storage.storage().reference(withPath: "Chats/\(filename)")
        
        let tarea_subir = storageReference.putFile(from: file!, metadata: nil)
        {
            matadatos, error in
            guard let metadatos = matadatos else
            {
                print(error?.localizedDescription)
                print("primer print")
                return
            }
            
            storageReference.downloadURL(completion: {
                url, error in
                
                if let urlText = url?.absoluteString {
                    documentRoute = urlText
                    print(documentRoute)
                    print("segundo print")
                    exito("\(documentRoute)")
                } else {
                     fallo("error subia: \(error) ")
                    print("tercero print")
                }
                
            })

        }
    }
    
    
    
}
