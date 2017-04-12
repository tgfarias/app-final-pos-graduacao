//
//  PrincipalController.swift
//  LayoutsAdaptaveis
//
//  Created by Tiago Costa on 12/04/17.
//  Copyright © 2017 FCTecnologia. All rights reserved.
//

import UIKit

class PrincipalController: UIViewController {

    @IBOutlet weak var tfCEP: UITextField!
    
    let kCep: String!         = "cep";
    let kUF: String!          = "uf"
    let kLocalidade: String!  = "localidade"
    let kBairro: String!      = "bairro"
    let kLogradouro: String!  = "logradouro"
    let kComplemento: String! = "complemento"
    let kUnidade: String!     = "unidade"
    let kIbge: String!        = "ibge"
    let kGia: String!         = "gia"
    
    var listEnderecos:[Endereco]!

    @IBAction func btnEnviar(_ sender: AnyObject) {
        
//        let session = URLSession.shared
//        
//        let urlPath = URL(string: "https://viacep.com.br/ws/"+self.tfCEP.text!+"/json")
//        let request = NSMutableURLRequest(url: urlPath!)
//        request.timeoutInterval = 60
//        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringLocalCacheData
//        
//        let dataTask = session.dataTask(with: request, completionHandler: { (data:Data?, response:URLResponse?, error:NSError?) -> Void in
//            
//            if((error) != nil) {
//                print(error!.localizedDescription)
//            }else {
//                _ = NSString(data: data!, encoding:String.Encoding.utf8)
//                let _: NSError?
//                let jsonResult: AnyObject = try! JSONSerialization.jsonObject(with: data!, options:JSONSerialization.ReadingOptions.mutableContainers)
//                
//                DispatchQueue.main.async(execute: {
//                    let dic: NSDictionary = (jsonResult as! NSDictionary);
//                    
//                    if dic.count > 1 {
//                        self.preencheDados(jsonResult as! NSDictionary)
//                    } else {
//                        self.preencheDados(nil)
//                    }
//                })
//            }
//        })
//        dataTask.resume()
        
        
        
        
        if (tfCEP.text == "77002026")
        {
            
            listEnderecos = ParseJson().buscaDados(cep: self.tfCEP.text!)
            //Chama a proxima tela
            let viewController = self.storyboard?.instantiateViewController(withIdentifier: "tableview")
            viewController?.modalTransitionStyle = .crossDissolve
            self.present(viewController!, animated: true, completion: nil)
            
        }
//        else
//        {
//            let alert = UIAlertController(title: "Atencao", message: "Senha Inválida", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            present(alert, animated: true, completion: nil)
//        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func preencheDados(_ dados:NSDictionary!) {
        
        let x: CGFloat = 20
        var y: CGFloat = 95
        let h: CGFloat = 23
        let w: CGFloat = 1000
        
        var label: UILabel!;
        if let theLabel = self.view.viewWithTag(1000) as? UILabel {
            label = theLabel
            label.removeFromSuperview()
        } else {
            label = UILabel(frame: CGRect(x: x, y: y, width: w, height: h))
        }
        label.tag = 1000;
        if dados == nil {
            label.text = "";
        } else {
            label.text = "CEP: "+(dados.value(forKey: self.kCep) as! String);
        }
        self.view.addSubview(label)
        y += h;
        
        if let theLabel = self.view.viewWithTag(1001) as? UILabel {
            label = theLabel
            label.removeFromSuperview()
        } else {
            label = UILabel(frame: CGRect(x: x, y: y, width: w, height: h))
        }
        label.tag = 1001;
        if dados == nil {
            label.text = "";
        } else {
            label.text = "Cidade/UF: "+(dados.value(forKey: self.kLocalidade) as! String)+"/"+(dados.value(forKey: self.kUF) as! String);
        }
        self.view.addSubview(label)
        y += h;
        
        if let theLabel = self.view.viewWithTag(1002) as? UILabel {
            label = theLabel
            label.removeFromSuperview()
        } else {
            label = UILabel(frame: CGRect(x: x, y: y, width: w, height: h))
        }
        label.tag = 1002;
        if dados == nil {
            label.text = "";
        } else {
            label.text = "Bairro: "+(dados.value(forKey: self.kBairro) as! String);
        }
        self.view.addSubview(label)
        y += h;
        
        if let theLabel = self.view.viewWithTag(1003) as? UILabel {
            label = theLabel
            label.removeFromSuperview()
        } else {
            label = UILabel(frame: CGRect(x: x, y: y, width: w, height: h))
        }
        label.tag = 1003;
        if dados == nil {
            label.text = "";
        } else {
            label.text = "Logradouro: "+(dados.value(forKey: self.kLogradouro) as! String);
        }
        self.view.addSubview(label)
        y += h;
        
        if let theLabel = self.view.viewWithTag(1004) as? UILabel {
            label = theLabel
            label.removeFromSuperview()
        } else {
            label = UILabel(frame: CGRect(x: x, y: y, width: w, height: h))
        }
        label.tag = 1004;
        if dados == nil {
            label.text = "";
        } else {
            label.text = "Complemento: "+(dados.value(forKey: self.kComplemento) as! String);
        }
        self.view.addSubview(label)
        y += h;
        
        if let theLabel = self.view.viewWithTag(1005) as? UILabel {
            label = theLabel
            label.removeFromSuperview()
        } else {
            label = UILabel(frame: CGRect(x: x, y: y, width: w, height: h))
        }
        label.tag = 1005;
        if dados == nil {
            label.text = "";
        } else {
            label.text = "IBGE: "+(dados.value(forKey: self.kIbge) as! String)+" - GIA: "+(dados.value(forKey: self.kGia) as! String);
        }
        self.view.addSubview(label)
        y += h;
    }
    
}
