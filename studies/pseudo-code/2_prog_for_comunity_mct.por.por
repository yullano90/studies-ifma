//INFORMÁTICA PARA EDUCAÇÃO | DIDÁTICA PARA PROGRAMAÇÃO COM PORTUGOL WEB STUDIO
//GERENCIAMENTO DE PROJETOS | PROJETO: AULAS DE PROGRAMAÇÃO PARA A COMUNIDADE MONTE CASTELO
//PAPEL: PROFESSOR DE PROGRAMAÇÃO 
//CASE: SISTEMA DE HOTEL @IFMA

programa {
  funcao inicio() {
    play()
    
    funcao play() {
      atividade_Dois_UC_Dois()
      todasAsQuestoes()
    }

    //Camada de Utilização (Interface):
    funcao atividade_Dois_UC_Dois{
      cadeia aluno = " IULANO SILVA DOS SANTOS", curso = " SISTEMAS DE INFORMAÇÃO", matricula = " 0123456789"
      escreva("\n=====================================================================================")
      escreva("\nAluno: ", aluno, "\nCurso: ", curso, "\nMatrícula: ",matricula "\n")
      escreva("\n=====================================================================================")
    }

    funcao todasAsQuestoes(){
      unicoFACAENQUANTO()
      unicoPARA()
      unicoENQUANTO()

    }

    //Camada de Implementação (Operações):
    funcao unicoPARA(){
      inteiro qtdeDeHospedes, numeroDoQuarto, contador, acumulador = 0
      real valorDaDiariaQuarto
      escreva("\n\nQUESTÃO 02:\n")
      escreva("\ninforme a quantidade de hospedes: ")
      leia(qtdeDeHospedes)

      para(contador = 0; contador < qtdeDeHospedes; contador++){
          escreva("\ninforme o número do quarto e valor da diária nessa ordem: \n") 
          leia(numeroDoQuarto)
          leia(valorDaDiariaQuarto)
          escreva("Quarto ", numeroDoQuarto, ": R$", valorDaDiariaQuarto)
          acumulador = acumulador + valorDaDiariaQuarto
      }
      escreva("\nTotal de diárias: R$", acumulador)
    }

    funcao unicoFACAENQUANTO(){
      real valorDaDiaria
      inteiro quantidadeDeDias
      escreva("\n\nQUESTÃO 01:\n")
      faca {
        escreva("\nInforme valor da diária e quantidade de dias:")
        leia(valorDaDiaria)
        leia(quantidadeDeDias)
        enquanto((valorDaDiaria < 0) ou (quantidadeDeDias > 30)){
          escreva("ValorInválido")
          pare
        }
      } enquanto ((valorDaDiaria < 0) ou (quantidadeDeDias > 30)){
      escreva("Fim do programa")
    }

    funcao unicoENQUANTO(){
      escreva("\n\nQUESTÃO 03:\n")
      inteiro idadeDoHospede, gratuidades = 0, meias = 0, numHospedes = 0
      real valorDaDiaria = 0.0, totalHospedagens = 0.0, acumuladorMeiais = 0.0, acumuladorCheias = 0.0
      cadeia nomeDoHospede, op

      escreva("\nInforme valor padrão da diária: ")
      leia(valorDaDiaria)
      enquanto(op != "N"){
        escreva("\nInforme o nome do hospede e sua idade: ")
        leia(nomeDoHospede)
        leia(idadeDoHospede)
        numHospedes++
        se(idadeDoHospede >=  80){
          escreva(nomeDoHospede, " paga meia\n")
          meias++
          acumuladorMeiais = acumuladorMeiais + (valorDaDiaria/2)
        }
        se(idadeDoHospede <= 4){
          escreva(nomeDoHospede, " possui gratuidade\n")
          gratuidades++
        }
        se(idadeDoHospede > 4 e idadeDoHospede <80){
          acumuladorCheias = acumuladorCheias + valorDaDiaria
        }
        escreva("\nDigite N para parar: ")
        leia(op)
      }

      totalHospedagens = acumuladorMeiais + acumuladorCheias
      se(totalHospedagens == 0){
        escreva("\nNão houve meias nem gratuidades, valor total de diárias: ", numHospedes * valorDaDiaria)
      }
      senao{
        escreva("\nTotal de hospedagens: R$", totalHospedagens, "\nGratuidades: ",gratuidades, "\nMeias: ", meias)
        escreva("\n\nATIVIDADE 02 UC02 ENCERRADA !!!") 
      } 
    }
  }
}