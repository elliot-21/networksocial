//
//  RegisterScreen.swift
//  network_social
//
//  Created by Leonardo Hernandez Sanchez on 05/01/22.
//

import UIKit
import MobileCoreServices

class RegisterScreen: UIViewController, UIDocumentPickerDelegate{
    
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtCorreo: UITextField!
    @IBOutlet weak var txtContraseña: UITextField!
    @IBOutlet weak var btnRegistrar: UIButton!
    @IBOutlet weak var btnImagen: UIButton!
    
    var oculto = false
    var Boton_ver:UIButton?
    var urlFile: URL?
    var urlImagen: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtboton()
        poner_barra_navegacion()
    }
    
    
    @IBAction func btnUpImage(_ sender: Any) {
        let fileTypes = [String(kUTTypeImage)]
        let viewPickerFile = UIDocumentPickerViewController(documentTypes: fileTypes, in: .import)
        viewPickerFile.delegate = self
        self.present(viewPickerFile, animated: true, completion: nil)
          
    }
    
    @IBAction func botonRegistrar(_ sender: Any) {
        var nombre = txtNombre.text
        var correo = txtCorreo.text
        var contraseña = txtContraseña.text
        
        if txtCorreo.valida_vacio() || txtContraseña.valida_vacio() || txtNombre.valida_vacio() || self.urlImagen! == nil
        {
            Alerta_Mensaje(title: "Aviso", Mensaje: "Completar todos los Campos o Poner Foto de Perfil")
        }else{
            if txtCorreo.isValidEmail(correo!) == false
            {
                Alerta_Mensaje(title: "Aviso", Mensaje: "Formato de Correo Incorrecto ")
            }else if contraseña!.count <= 6 {
                Alerta_Mensaje(title: "Aviso", Mensaje: "Contraseña debe ser mayor a 6 diigitos")
            }else{
                let RegisterUser = RegisterUser()
                var newUrl = "\(self.urlImagen!)"
                RegisterUser.UserRegister(correo: correo!, contraseña: contraseña!,urlImage: newUrl,nombre: nombre!){
                    (exito) in
                    self.Alerta_Mensaje(title: "Aviso", Mensaje: "Registro Exitoso")
                    self.cleanCampos()
                }fallo: { fallo in
                    self.Alerta_Mensaje(title: "Aviso", Mensaje: "\(fallo)")
                }
            }
        }
    }
    
    
    
    @objc func ver_contra()
    {
        txtContraseña.Visualizar_Contrasena()
        if (oculto)
        {
            Boton_ver!.setTitle("Ver", for: .normal)
        }
        else
        {
           Boton_ver!.setTitle("Ocultar", for: .normal)
        }
        oculto = !oculto
    }
    
    func txtboton(){
        Boton_ver = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        Boton_ver!.setTitle("ver", for: .normal)
        Boton_ver!.setTitleColor(UIColor.blue, for: .normal)
        Boton_ver!.addTarget(self, action: #selector(ver_contra), for: .touchUpInside)
        Boton_ver!.backgroundColor = .white
        Boton_ver!.alpha = CGFloat(0.5)
        txtContraseña.leftView = Boton_ver
        txtContraseña.leftViewMode = .always
        
        
    }
    
    func cleanCampos(){
        txtNombre.text = ""
        txtCorreo.text = ""
        txtContraseña.text = ""
    }
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        if controller.documentPickerMode == .import {
            guard let url = urls.first else {
                return
            }
            do {
                if let filename = urls.first?.lastPathComponent {
                    urlFile = url
                    print(filename)
                    let upImage = RegisterUser()
                    upImage.uploadFile(urlFile: urlFile){
                        (exito) in
                        self.urlImagen = URL(string: exito)
                        self.Alerta_Mensaje(title: "Aviso", Mensaje: "Imagen agregada correctamente")
                        controller.dismiss(animated: true, completion: nil)
                        
                    }fallo: { fallo in
                        self.Alerta_Mensaje(title: "Aviso", Mensaje: "Error al subir imagen")
                    }
                    
                }
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
   
    

}
