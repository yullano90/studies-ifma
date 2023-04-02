//INFORM�TICA PARA EDUCA��O | DID�TICA PARA PROGRAMA��O COM PORTUGOL WEB STUDIO
//GERENCIAMENTO DE PROJETOS | PROJETO: AULAS DE PROGRAMA��O PARA A COMUNIDADE MONTE CASTELO
//PAPEL: PROFESSOR DE PROGRAMA��O 
//CASE: SISTEMA DE HOTEL @IFMA

programa {

  funcao inicio(){

    runApp()

    funcao runApp() {
      projetoComunidade_01()
    }

    //CAMADA DE UTILIZA��O (INTERFACE):
    funcao projetoComunidade_01{
      cadeia aluno = " IULANO SILVA DOS SANTOS", curso = " SISTEMAS DE INFORMA��O", matricula = " 0123456789"
      escreva("\n=====================================================================================")
      escreva("\nAluno: ", aluno, "\nCurso: ", curso, "\nMatr�cula: ",matricula "\n")
      todasAsQuestoes()
      escreva("\n\nPROGRAMA ENCERRADO.")
      escreva("\n=====================================================================================")
    }
  
    funcao questaoUm(){
      inteiro qtdeDeGarcons = 10
      real horasTrabalhadas = 9.5
      real valorDaHoraMercado = 10.50
      real totalDespesa = calculaDespesaGarcons(horasTrabalhadas , valorDaHoraMercado, qtdeDeGarcons)
      escreva("\n=====================================================================================")
      escreva("\nQuest�o 01 | C�lculo de Despesa de Gar�ons: R$ ", totalDespesa "\n")
      escreva("\n=====================================================================================")
    }

    funcao questaoDois(){
      escreva("\nQuest�o 02 | Simula��o de Or�amento Buffet | Hotel @IFMA")
      escreva("\nReservamos o espa�o no Hotel @IFMA, para no m�nimo 30 pessoas e no m�ximo 350")
      escreva("\nPor favor, informe a quantidade de convidados dentro do padr�o estabelecido: ")
      inteiro convidados
      leia(convidados)
      se((convidados <=29) ou (convidados >=351)){
      escreva("\nEncerraremos o programa, pois voce sabe valores m�nimo e m�ximo!\n")
      escreva("Por favor, na pr�xima tentativa informe valores entre 30 e 350!\n")
      convidados = 0
      }senao {
        calculoDespesaBuffet(convidados)
      }
      escreva("\n=====================================================================================\n")
    }

    funcao questaoTres(){
      escreva("\nQuest�o 03 | Simula��o de Reserva de Audit�rios | Hotel @IFMA")
      escreva("\nReservamos os Audit�rios Alfa e Beta no Hotel @IFMA, nas seguintes condi��es de capacidade:")
      escreva("\nAudit�rio Alfa | 150 Lugares + 70 cadeiras adicionais - Capacidade M�xima: 220 lugares")
      escreva("\nAudit�rio Beta | Capacidade M�xima: 350 lugares")
      escreva("\nPor favor, informe a quantidade de convidados dentro do padr�o estabelecido: ")
      inteiro volumeConvidadosAuditorio
      leia(volumeConvidadosAuditorio)
      se((volumeConvidadosAuditorio <=0) ou (volumeConvidadosAuditorio >=350)){
        escreva("\nEncerraremos o programa, pois voce j� est� ciente das regras para realizar uma reserva!\n")
        escreva("Por favor, na pr�xima tentativa informe quantidade de convidados entre 1 e 350\n")
      } 
      senao {
        sugestaoDeAuditorioIFMA(volumeConvidadosAuditorio)
      }
      escreva("\n=====================================================================================\n")
    }

    funcao questaoQuatro(){
      escreva("\nQuest�o 04 | Verifica��o da Lavanderia e Piscina | Hotel @IFMA")
      escreva("\nDeseja verificar valores da Lavanderia e Utilliza��o da Piscina?")
      escreva("\nDigite L para Lavanderia ou P para Piscina: ")
      cadeia opcao, opacaoTratada
      leia(opcao)
      valorLavanderiaPiscina(opcao)
    }


    //CAMADA DE IMPLEMENTA��O (OPERA��ES):
    funcao todasAsQuestoes(){
      questaoUm()
      questaoDois()
      questaoTres()
      questaoQuatro()
    }

    funcao real calculaDespesaGarcons (real valorHoraGarcon, real totalHorasEvento, inteiro qtdeGarconsIFMA){
      real despesaTotal = (valorHoraGarcon * totalHorasEvento * qtdeGarconsIFMA)
      retorne despesaTotal
    }

    funcao sugestaoDeAuditorioIFMA(inteiro qtdeConvidadosAuditorio){
      se((qtdeConvidadosAuditorio > 0) e (qtdeConvidadosAuditorio <221)){
        escreva("\n\nSugerimos que vc reserve o Audit�rio Alfa")
        se(qtdeConvidadosAuditorio < 150){
          escreva("\nVoc� n�o precisar� usar as poltronas adicionais!")
        } senao{
          inteiro poltronasAdicionais = qtdeConvidadosAuditorio - 150
          se(poltronasAdicionais == 1){
            escreva("\n Voc� precisar� usar ", poltronasAdicionais, " poltrona adicional")
            escreva("\nMas fique tranquilo, esse m�s o @IFMA estar� lhe dando ELA de cortesia!")            
          }
          senao{
            escreva("\n Voc� precisar� usar ", poltronasAdicionais, " poltronas adicionais")
            escreva("\nMas fique tranquilo, esse m�s o @IFMA estar� lhe dando ELAS de cortesia!")
          }
        }
      }
      senao{
      escreva("\n\nSugerimos que vc reserve o Audit�rio Beta")
      }
    }

    funcao calculoDespesaBuffet(inteiro qtdeConvidados){
      real cafe = (0.2 * qtdeConvidados)
      real agua = (0.5 * qtdeConvidados)
      inteiro salgadinhos = (7 * qtdeConvidados)
      escreva("\nConsumo de Itens projetado: ")
      escreva("\nConvidados: ", qtdeConvidados, "\nLitros de �gua: ", agua, "\nLitros de Caf�: ", cafe, "\nSalgadinhos:", salgadinhos)
    }

    funcao valorLavanderiaPiscina(cadeia escolhaDoUsuario){
      escolha(escolhaDoUsuario)

      caso "L":
        real quilogramas, valorDaLavagem
        escreva("informe a quantidade de Kg que deseja simular o valor da lavagem: ")
        leia(quilogramas)

        se (quilogramas >= 10){
          valorDaLavagem = 15.0 * quilogramas
          escreva("Valor da Lavagem igual ou superior a 10kgs | R$: ", valorDaLavagem)
        }
        senao {
          valorDaLavagem = 20.0 * quilogramas          
          escreva("Valor da Lavagem inferior a 10kgs | R$: ", valorDaLavagem)
        }
      pare


      caso "P":
        inteiro idade
        cadeia possuiAcompanhante, exameRealizado
        escreva("\ninforme por favor sua idade: ")
        leia(idade)

        se(idade >= 18){
          escreva("\nOK, verificamos que � maior de idade, fizeste o exame de aptid�o?: ")
          leia(exameRealizado)

          se(exameRealizado == "SIM"){
            escreva("\nVoc� EST� apto a usar a piscina do HOTEL @IFMA!")
          } 
          senao{
            escreva("\nFa�a seu exame para que possa acessar a piscina")
          }
        }
        senao{
              escreva("\nVerificamos que voce � menor de idade, est� com acompanhante?: ")
              leia(possuiAcompanhante)
              se(possuiAcompanhante == "SIM"){
                escreva("\nOK!, voc� fez o exame de aptid�o?: ")
                leia(exameRealizado)
                se(exameRealizado == "SIM"){
                  escreva("\nVoc� est� apto a acessar a piscina do HOTEL @IFMA, desde que esteja acompanhado")
                } 
                senao{
                  escreva("\nFa�a seu exame para que possa acessar e n�o esque�a, o acompanhante � obrigat�rio")
                }  
              } 
              senao{
                escreva("\nVoc� precisa ter acompanhante e estar apto no exame, verifique isso e depois retorne!")
              }
            }
      pare
    }
  }
}