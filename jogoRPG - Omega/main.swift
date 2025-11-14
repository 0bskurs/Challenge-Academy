//
//  main.swift
//  jogoRPG - Omega
//
//  Created by LUCAS MAGNO CAMPOS OLIVEIRA on 14/11/25.
//

import Foundation

enum InventarioErros: Error{
    case saldoInsuficiente
}


func Inventario(Lista: Array<String>) throws {

    var listaInventario_String = [String]()
    var listaInventario_Int = [Int]()
    var listaInventario_temp = [String]()
    var temp = 0
    
    for _ in 0..<Lista.count
    {
        listaInventario_temp = listaInventario[temp].components(separatedBy: ",")
        listaInventario_String.append(listaInventario_temp[0])
        listaInventario_Int.append(Int(listaInventario_temp[1]) ?? 0)
        print("\(listaInventario_String[temp])")
        temp += 1
    }
    print ("Moedas: ")
    return moedas = Int(readLine() ?? "") ?? 0
    
}
func Mercado(ListaMercado: Array<String>, ListaInventario: Array<String>) throws {
    var temp = 0
    var opcao = 0
    var itemComprar = 0
    var itemVender = 0
    var listaMercado_String = [String]()
    var listaMercado_Int = [Int]()
    var listaInventario_String = [String]()
    var listaInventario_Int = [Int]()
    var listaInventario_temp = [String]()
    print("**Feiticeiro ancião - Aelfrun** \n")
    print("- Olá. Bem vindo/a a minha coleção. \n Hoje está em estoque:")
    print("")
    print("O que você gostaria de fazer?")
    print("0 - Comprar um item.")
    print("1 - Vender um item")
    opcao = Int(readLine() ?? "") ?? 0
    for _ in 0..<ListaInventario.count
    {
        listaInventario_temp = ListaInventario[temp].components(separatedBy: ",")
        listaInventario_String.append(listaInventario_temp[0])
        listaInventario_Int.append(Int(listaInventario_temp[1]) ?? 0)
        temp += 1
    }
    if opcao == 0
    {
        print("Qual item você gostaria de comprar?")
        print("")
        for _ in 0..<ListaMercado.count
        {
            print("\(temp) -> \(listaMercado_String[temp]) | \(listaMercado_Int[temp])")
            temp += 1
        }
        itemComprar = Int(readLine() ?? "") ?? 0
        if moedas >= listaMercado_Int[itemComprar]
        {
            listaInventario.append(ListaMercado[itemComprar])
            print("Moedas: \(moedas)")
        }
        else
        {
            throw InventarioErros.saldoInsuficiente
        }
        
    }
    else if opcao == 1
    {
        print("Qual item você gostaria de vender?")
        print("")
        for _ in 0..<listaMercado.count
        {
            print("\(temp) - \(listaInventario_String[temp]) | \(listaInventario_Int[temp])")
            temp += 1
        }
        itemVender = Int(readLine() ?? "") ?? 0
        moedas += listaInventario_Int[itemVender]
        listaInventario.remove(at: itemVender)
        print("Moedas: \(moedas)")
    }
}

var moedas = 0
var listaMercado = ["Cajado do Abismo,3500", "Livro de Sangue,4000", "Pocao de Cura,50", "Pocao de Mana,100"]

var listaInventario = ["Machado da Floresta,1000", "Cajado das Montanhas,3000"]
do {
    try Inventario(Lista: listaInventario)
    try Mercado(ListaMercado: listaMercado, ListaInventario: listaInventario)
    try Inventario(Lista: listaInventario)
}
catch InventarioErros.saldoInsuficiente {
    print("Saldo insuficiente")
}






