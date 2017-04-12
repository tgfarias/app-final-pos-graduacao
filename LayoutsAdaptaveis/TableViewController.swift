//
//  TableViewController.swift
//  LayoutsAdaptaveis
//
//  Created by Tiago Costa on 12/04/17.
//  Copyright © 2017 FCTecnologia. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tvTableView: UITableView!
    var listEnderecos:[Endereco]!
    override func viewDidLoad() {
        super.viewDidLoad()
        tvTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //Metodos de datasource
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1//listEnderecos!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let celula = tableView.dequeueReusableCell(withIdentifier: "celula") as! CelulaPersonalisada
        
    
       // celula.uf = listEnderecos[indexPath.row].uf
        //elula.vrNome.text = vrClientes[indexPath.row].nome
//        celula.vrDescricao.text = vrClientes[indexPath.row].desc
//        celula.vrData.text = String(vrClientes[indexPath.row].data)
//        celula.vrImagem.donwloadImage(url: vrClientes[indexPath.row].url_foto)
        
        return celula
    }
    
    //Metodos de delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
    }
    
}
