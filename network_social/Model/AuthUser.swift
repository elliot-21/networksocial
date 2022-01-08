import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage

class AuthUser{
    private let db = Firestore.firestore()
    
    func UserAuth(correo: String, contraseña: String, exito: @escaping (_ exito: String) ->(),
                      fallo: @escaping (_ fallo: String) ->()){
        Auth.auth().signIn(withEmail: correo, password: contraseña){
            (result, error) in
            if let result = result, error == nil {
                exito("Autenticacion Exitosa")
            }else{
                let error = error as! NSError
                switch AuthErrorCode(rawValue: error.code){
                    case .operationNotAllowed:
                      fallo("Usuario sin acceso")
                    case .userDisabled:
                    fallo("Usuario deshabilitado")
                    case .wrongPassword:
                    fallo("Contraseña incorrecta")
                    case .invalidEmail:
                    fallo("Correo incorrecto")
                    default:
                        fallo("Correo no registrado")
                }
            }
        }
        
    }
    
   
    
}
