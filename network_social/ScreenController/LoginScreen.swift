//
//  LoginScreen.swift
//  network_social
//
//  Created by Leonardo Hernandez Sanchez on 05/01/22.
//

import UIKit

class LoginScreen: UIViewController {
    
    @IBOutlet weak var txtCorreo: UITextField!
    @IBOutlet weak var txtContraseña: UITextField!
    @IBOutlet weak var btnInicio: UIButton!
    @IBOutlet weak var btnRegistro: UIButton!
    
    
    var oculto = false
    var Boton_ver:UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    override func viewDidAppear(_ animated: Bool) {
        quitar_barra_navegacion()
        txtboton()
    }
    
    @IBAction func botonInicio(_ sender: Any) {
        var correo = txtCorreo.text
        var contraseña = txtContraseña.text
        Gcorreo = correo!
        
        if txtCorreo.valida_vacio() || txtContraseña.valida_vacio()
        {
            Alerta_Mensaje(title: "Aviso", Mensaje: "Completar todos los Campos")
        }else{
            if txtCorreo.isValidEmail(correo!) == false
            {
                Alerta_Mensaje(title: "Aviso", Mensaje: "Formato de Correo Incorrecto")
            }else{
                        let AuthUser = AuthUser()
                AuthUser.UserAuth(correo: correo!, contraseña: contraseña!){
                    (exito)in
                    self.performSegue(withIdentifier: "Login_a_Home", sender: nil)
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
        txtCorreo.text = ""
        txtContraseña.text = ""
    }
    

}
