# Challenge-Academy
# Jogo de RPG : Omega

import Foundation

# Enum para erros

enum InventarioErros: Error{
    case saldoInsuficiente
}

# Funcao com o inventario e mercado de itens

func Mercado() throws{
    let ListaMercado = ["Cajado do Abismo,3500", "Livro de Sangue,4000", "Pocao de Cura,50", "Pocao de Mana,100"] // Predefinições
    var listaInventario = ["Machado da Floresta,1000", "Cajado das Montanhas,3000"] 
    var temp = 0
    var opcao = 0
    var itemComprar = 0
    var itemVender = 0
    var listaInventario_temp = [String]()
    var listaMercado_String = [String]()
    var listaMercado_Int = [Int]()
    var listaInventario_String = [String]()
    var listaInventario_Int = [Int]()
    var listaMercado_temp = [String]()
    print("==> Entrando em: Torre Divina\n")
    print("'Ola, sou Aelfrun. O indomavel feiticeiro anciao. Bem vindo/a a minha colecao. \n Hoje esta em estoque'")
    for _ in 0..<ListaMercado.count # Imprimir o que é vendido no mercado de itens
    {
        listaMercado_temp = ListaMercado[temp].components(separatedBy: ",") // Separacao de virgulas para array de String (Nome do objeto) e Int (Preço do objeto)
        listaMercado_String.append(listaMercado_temp[0])
        listaMercado_Int.append(Int(listaMercado_temp[1]) ?? 0)
        print("\(temp) - \(listaMercado_String[temp]) por \(listaMercado_Int[temp]) moedas.")
        temp += 1
    }
    print("")
    print("'O que voce gostaria de fazer?'")
    print("0 - Comprar um item.")
    print("1 - Vender um item\n")
    opcao = Int(readLine() ?? "" ) ?? 0 // Saber se gostaria de vender ou comprar um item
    temp = 0
    for _ in 0..<listaInventario.count
    {
        listaInventario_temp = listaInventario[temp].components(separatedBy: ",")
        listaInventario_String.append(listaInventario_temp[0])
        listaInventario_Int.append(Int(listaInventario_temp[1]) ?? 0)
        temp += 1
    }
    temp = 0
    print ("\nMoedas: ")
    var moedas = Int(readLine() ?? "") ?? 0 // Saber quantas moedas o jogador tem no momento
    if opcao == 0 // Se a opção 0 foi selecionada, o código para comprar item irá se executar
    {
    
        print("\n 'Qual item voce gostaria de comprar?'\n")
        
        temp = 0
        itemComprar = Int(readLine() ?? "") ?? 0
        
        temp = 0
        
        if moedas >= listaMercado_Int[itemComprar]
        {
            listaInventario.append(ListaMercado[itemComprar])
            listaInventario_temp = listaInventario[listaInventario.count - 1].components(separatedBy: ",")
            listaInventario_String.append(listaInventario_temp[0])
            listaInventario_Int.append(Int(listaInventario_temp[1]) ?? 0)
            moedas = moedas - listaMercado_Int[itemComprar]
            
            print("\n Moedas: \(moedas)")
            print("\n Inventário: ")
            temp = 0
            for _ in 0..<listaInventario.count
        {
            print("\(listaInventario_String[temp]) | \(listaInventario_Int[temp]) moedas")
            temp += 1
            
        }
            temp = 0
        
        }
        else
        {
            throw InventarioErros.saldoInsuficiente // Se não tiver saldo suficiente, retornar Erro
        }
        
    }
    else if opcao == 1 // Se a opção 1 foi selecionada, o código para vender item do inventário irá se executar
    {
        print("Qual item voce gostaria de vender?")
        print("")
        temp = 0
        itemVender = Int(readLine() ?? "") ?? 0
        listaInventario_temp = listaInventario[listaInventario.count].components(separatedBy: ",")
        listaInventario_String.append(listaInventario_temp[0])
        listaInventario_Int.append(Int(listaInventario_temp[1]) ?? 0)
        for _ in 0..<listaInventario.count
        {
            print("\(temp) - \(listaInventario_String[temp]) | \(listaInventario_Int[temp])")
            temp += 1
            
        }
        
        
        
        moedas += listaInventario_Int[itemVender]
        listaInventario.remove(at: itemVender)
        print("\n Moedas: \(moedas)")
        print("\n Inventário: ")
        for _ in 0..<listaInventario.count
        {
            print("\(listaInventario_String[temp]) | \(listaInventario_Int[temp]) moedas")
            temp += 1
        }
    }
}

var moedas = 0



do {
    try Mercado() // Fazer a função rodar
}
catch InventarioErros.saldoInsuficiente { // Exibir a mensagem de erro
    print("Saldo insuficiente")
}
