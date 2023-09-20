programa
{	
	funcao inicio(){
		inicializarVetores()
		runApp()
	}

	const inteiro maximo = 9
	caracter globalFlag = 'S'
	cadeia vetorNomes[maximo], vetorCPF[maximo], vetorStatusDosQuartos[maximo]
	real vetorDeDespesas[maximo], valorDaDiaria = 100.0, totalDeDespesas = 0.0, vetorDeReservas[maximo]
	inteiro vetorQtdeDias[maximo], qtdeDeHospedes = 0

	funcao runApp(){
		inteiro inputMenu
		escreva("\nOlá, seja bem vindo ao Sistema de Gestão de Hotéis RS")
		escreva("\nSelecione uma das opções do menu:\n")
		showMenu()
		leia(inputMenu)
		enquanto(inputMenu < 0 ou inputMenu > 6){
			escreva("\nO valor digitado está fora das opções\n")
			showMenu()
			leia(inputMenu)
		}
		se(inputMenu >=0 ou inputMenu <=6){
		se(inputMenu == 1){cadastrarHospedes()}
		se(inputMenu == 2){exibirHospedesCadastrados()}
		se(inputMenu == 3){exibirTodosOsQuartos()}
		se(inputMenu == 4){atribuirHospedeAoQuarto()}
		se(inputMenu == 5){reservarAreaDeLazer()}
		se(inputMenu == 6){receberPagamentoParaLiberarQuartos()}
		se(inputMenu == 0){logoff()}
		}		
	}

	funcao inicializarVetores(){
		para(inteiro i = 0; i < maximo; i++){
			vetorStatusDosQuartos[i] = "LIVRE"
			vetorDeDespesas[i] = 0.0
			vetorQtdeDias[i] = 0
			vetorNomes[i] = "-"
			vetorCPF[i] = "-"	
		}			
	}

	funcao showMenu(){
		escreva("\n=======================================================")
		escreva("\n 1 - Cadastrar Hospedes")
		escreva("\n 2 - Exibir Hospedes Cadastrados")
		escreva("\n 3 - Exibir Quartos")
		escreva("\n 4 - Atribuir Hospede a um quarto")
		escreva("\n 5 - Reservar Área de Lazer")
		escreva("\n 6 - Calcular Total a Pagar")
		escreva("\n 0 - Sair\n")
		escreva("=======================================================\n\n")
	}

	funcao cadastrarHospedes(){
		escreva("\nO sistema permite cadastrar até 10 hóspedes")
		escreva("\nPara realizar o cadastro, informe os dados abaixo.\n")
		inteiro contador = 0, qtdeDias
		cadeia nomeDoHospede, cpfDoHospede
		caracter flagCadastro = 'S'

		para(inteiro i = 0; i < maximo; i++){
			inteiro x = i + 1
			se(flagCadastro == 'S'){
				escreva("Nome do Hóspede " + x + " :") 
				leia(nomeDoHospede) 
				vetorNomes[i] = nomeDoHospede
				escreva("CPF :  ") 
				leia(cpfDoHospede) 
				vetorCPF[i] = cpfDoHospede
				escreva("Quantidade de dias:  ")
				leia(qtdeDias) vetorQtdeDias[i] = qtdeDias 
				vetorDeDespesas[i] = qtdeDias * valorDaDiaria
				vetorStatusDosQuartos[i] = "OCUPADO"
				contador++
				qtdeDeHospedes = contador
				se(contador == maximo){
				  escreva("\n\nMáximo de cadastros atingido!\n\n")
				}senao{
					escreva("\nDeseja cadastrar outro hóspede? digite S, senão pressione qualquer tecla\n")
					leia(flagCadastro)
				}		
			}
		}
		para(inteiro i = 0; i < contador; i++){
			escreva("\nNome: " + vetorNomes[i] + " | CPF: " + vetorCPF[i] + " | Qtde de dias: " + vetorQtdeDias[i] + " | Despesa: " + vetorDeDespesas[i])
			totalDeDespesas = totalDeDespesas + vetorDeDespesas[i]	
			}
		escreva("\nTotal de despesas: " + totalDeDespesas)
		escreva("\n\nAs informações estão corretas? digite S para confirmar ou qualquer tecla para refazer o cadastro.\n")
		leia(flagCadastro)
		se(flagCadastro == 'S'){
			escreva("\nCadastro de hóspedes finalizado com sucesso!\n")				
			logonOuLogoff()
		} senao {
			escreva("Nesse caso, faça novamente o cadastro\n")
			cadastrarHospedes()
		}
	}

	funcao exibirHospedesCadastrados(){
		caracter operador
		inteiro indice, auxIndex = 0
		escreva("\nIdentificamos que você registrou " + qtdeDeHospedes + " hóspedes nesta sessão")
		escreva("\nDigite S para ver um quarto específico ou qualquer tecla para ver todos os hóspedes caso existam! : \n")
		leia(operador)
		se(operador == 'S'){
			escreva("\nInforme o quarto que deseja consultar: ")
			leia(indice)
			auxIndex = indice - 1
			se(indice <= qtdeDeHospedes e  indice > 0){
			escreva("\nNome: " + vetorNomes[auxIndex] + " | CPF: " + vetorCPF[auxIndex] + " | Qtde de dias: " + vetorQtdeDias[auxIndex] + " | Despesa: " + vetorDeDespesas[auxIndex])
			}senao{
				escreva("Você cadastrou "+ qtdeDeHospedes + " hóspedes!")
			}
		} senao{
		escreva("=======================================================")
		para(inteiro i = 0; i < maximo; i++){
			escreva("\nNome: " + vetorNomes[i] + " | CPF: " + vetorCPF[i] + " | Qtde de dias: " + vetorQtdeDias[i] + " | Despesa: " + vetorDeDespesas[i])
			}
		}
		escreva("\n=======================================================\n")
		logonOuLogoff()
	}

	funcao exibirTodosOsQuartos(){
		caracter option
		escreva("=======================================================")
		para(inteiro i = 0; i < maximo; i++){
			inteiro x = i + 1
			se(vetorStatusDosQuartos[i] != "LIVRE"){
				escreva("\n" + x + " - " + vetorNomes[i] + " - " + vetorStatusDosQuartos[i])
			}
			se(vetorStatusDosQuartos[i] == "LIVRE"){
				escreva("\n" + x + " - " + vetorStatusDosQuartos[i])	
			}
		}
		escreva("\n=======================================================\n\n")
		escreva("\nDeseja atribuir um hóspede a um quarto, digite S senao qualquer tecla para retornar o a menu?")
		leia(option)
			se(option == 'S'){
				atribuirHospedeAoQuarto()
			} senao{
				logonOuLogoff()
		}
	}

	funcao atribuirHospedeAoQuarto(){
	    inteiro indexQuarto, indexHospede
	    caracter operador
		escreva("\nPara atribuir um hóspede diretamente a um quarto, você precisa informar alguns dados.")
		escreva("\nNessa função, entendo que usuário vai lançar de fato índices do vetor portanto sem var aux!")
		escreva("\nÍndice do quarto: ")
		leia(indexQuarto)
		escreva("\nÍndice do hóspede: ")
		leia(indexHospede)
		
		se(indexQuarto > maximo ){
		    escreva("\nHóspede não existe! você cadastrou até o momento " + qtdeDeHospedes + " hóspedes.")
		    escreva("\nDeseja atribuir outro hóspede? digite S ou qualquer tecla para retornar ao menu principal")
		    leia(operador)
		    se(operador == 'S'){
		        atribuirHospedeAoQuarto()
		    } senao{
		        runApp()
		    }
		} senao {
		    se(vetorNomes[indexQuarto] == "-" e vetorStatusDosQuartos[indexQuarto] == "OCUPADO"){
		    escreva("\nQuarto já está ocupado ou hóspede não existe")
	        } senao{
	            vetorStatusDosQuartos[indexQuarto] = vetorNomes[indexHospede] + " - OCUPADO"
	            exibirTodosOsQuartos()
	        }
        }
        logonOuLogoff()
	}
	
	funcao reservarAreaDeLazer(){
		caracter inputReserva
		inteiro indexHospede
		escreva("\nPara realizar reservas você precisa escolher uma das opções.")
		escreva("\nDigite A • Academia R$ 20,00 \nDigite S • Salão de Festas R$ 50,00\nDigite R • Restaurante R$ 35,00\n")
		leia(inputReserva)
		escreva("Informe o quarto do hóspede que deseja realizar a reserva: ")
		leia(indexHospede)
			se(vetorNomes[indexHospede-1] == "-"){
				escreva("\nNão há hospede nesse quarto!")
			}senao{
			escolha(inputReserva){	
				caso 'A':
					escreva("\nObrigado, " + vetorNomes[indexHospede-1] + " a Academia está reservada e o valor já foi adicionado a sua conta.")
					vetorDeReservas[indexHospede-1] =  20.0
					pare	
					
				caso 'S':
					escreva("\nObrigado, " + vetorNomes[indexHospede-1] + " o Salão está reservada e o valor já foi adicionado a sua conta.")
					vetorDeReservas[indexHospede-1] = 50.0
					pare
					
				caso 'R':
					escreva("\nObrigado, " + vetorNomes[indexHospede-1] + " o Restaurante está reservada e o valor já foi adicionado a sua conta.")
					vetorDeReservas[indexHospede-1] =  35.0
					pare		
			}
		}
		logonOuLogoff()
	}

	funcao real calcularTotalDePagamento(inteiro numIndexHospede){
		real totalDePagamento = vetorDeDespesas[numIndexHospede-1] + vetorDeReservas[numIndexHospede-1]
		retorne totalDePagamento
	}

	funcao receberPagamentoParaLiberarQuartos(){
		inteiro numeroDoQuartoDoHospede
		escreva("\nInforme o número do quarto do hóspede: ")
		leia(numeroDoQuartoDoHospede)
		real pagamento = calcularTotalDePagamento(numeroDoQuartoDoHospede)
		escreva("\nHóspede: " + vetorNomes[numeroDoQuartoDoHospede-1] + " - valor R$ " + pagamento)
	}


	funcao logonOuLogoff(){
		escreva("\n\nDeseja continuar a usar o sistema? digite S, senão pressione qualquer tecla\n")
		leia(globalFlag)
		se(globalFlag != 'S'){
			logoff()
		} senao {
			runApp()
		}
	}

	funcao logoff(){
			escreva("\nObrigado por usar o Sistema de Gestão de Hotéis RS, sessão encerrada!\n")	
	}
	
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 7727; 
 * @DOBRAMENTO-CODIGO = [35, 45, 57, 103, 128, 150, 235];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {vetorNomes, 10, 8, 10}-{vetorCPF, 10, 28, 8}-{vetorStatusDosQuartos, 10, 46, 21}-{vetorDeDespesas, 11, 6, 15}-{totalDeDespesas, 11, 54, 15}-{vetorDeReservas, 11, 77, 15}-{vetorQtdeDias, 12, 9, 13}-{qtdeDeHospedes, 12, 32, 14}-{contador, 61, 10, 8}-{qtdeDias, 61, 24, 8}-{indexQuarto, 152, 13, 11}-{indexHospede, 152, 26, 12};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */