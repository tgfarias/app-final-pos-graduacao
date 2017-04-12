//
//  ParseJson.swift
//  LayoutsAdaptaveis
//
//  Created by Tiago Costa on 12/04/17.
//  Copyright © 2017 FCTecnologia. All rights reserved.
//

import Foundation

// CLASSE QUE PUXA DADOS DO WEBSERVICE
class Endereco
{
    var cep: Int!
    var uf: String!
    var localidade: String!
    var bairro: String!
    var logradouro: String!
    var unidade: String!
    var ibge: String!
    var gia: String!
}

class ParseJson
{
    func buscaDados(cep:String)->[Endereco]
    {
        var enderecos = [Endereco]()
        
        do
        {
            //Baixa os dados da Web
            let caminho = URL(string: "https://viacep.com.br/ws/"+cep+"/json")
            let dados = try Data(contentsOf: caminho!)
            
            if (dados.count == 0)
            {
                return enderecos
            }
            
            //Realiza o parsing dos dados
            let arrayEnderecos = try JSONSerialization.jsonObject(with: dados, options: .mutableContainers) as? Array<Any>
            
            if let vetorEnderecos = arrayEnderecos
            {
                for json in vetorEnderecos
                {
                    let json = json as! NSDictionary
                    let end = Endereco()
                    end.cep = json["idcliente"] as! Int
                    end.uf = json["nome"] as! String
                    end.localidade = json["descricao"] as! String
                    end.bairro = json["cliente_desde"] as! String
                    end.unidade = json["icone"] as! String
                    enderecos.append(end)
                }
            }
        }
        catch
        {}
        
        return enderecos;
    }
}
