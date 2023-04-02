//INFORMÁTICA PARA EDUCAÇÃO | DIDÁTICA PARA PROGRAMAÇÃO COM PORTUGOL WEB STUDIO
//GERENCIAMENTO DE PROJETOS | PROJETO: AULAS DE PROGRAMAÇÃO PARA A COMUNIDADE MONTE CASTELO
//PAPEL: PROFESSOR DE PROGRAMAÇÃO 
//CASE: SISTEMA DE HOTEL @IFMA

programa {

  funcao inicio(){

    runApp()

    funcao runApp() {
      projetoComunidade_01()
    }

    //CAMADA DE UTILIZAÇÃO (INTERFACE):
    funcao projetoComunidade_01{
      cadeia aluno = " IULANO SILVA DOS SANTOS", curso = " SISTEMAS DE INFORMAÇÃO", matricula = " 0123456789"
      escreva("\n=====================================================================================")
      escreva("\nAluno: ", aluno, "\nCurso: ", curso, "\nMatrícula: ",matricula "\n")
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
      escreva("\nQuestão 01 | Cálculo de Despesa de Garçons: R$ ", totalDespesa "\n")
      escreva("\n=====================================================================================")
    }

    funcao questaoDois(){
      escreva("\nQuestão 02 | Simulação de Orçamento Buffet | Hotel @IFMA")
      escreva("\nReservamos o espaço no Hotel @IFMA, para no mínimo 30 pessoas e no máximo 350")
      escreva("\nPor favor, informe a quantidade de convidados dentro do padrão estabelecido: ")
      inteiro convidados
      leia(convidados)
      se((convidados <=29) ou (convidados >=351)){
      escreva("\nEncerraremos o programa, pois voce sabe valores mínimo e máximo!\n")
      escreva("Por favor, na próxima tentativa informe valores entre 30 e 350!\n")
      convidados = 0
      }senao {
        calculoDespesaBuffet(convidados)
      }
      escreva("\n=====================================================================================\n")
    }

    funcao questaoTres(){
      escreva("\nQuestão 03 | Simulação de Reserva de Auditórios | Hotel @IFMA")
      escreva("\nReservamos os Auditórios Alfa e Beta no Hotel @IFMA, nas seguintes condições de capacidade:")
      escreva("\nAuditório Alfa | 150 Lugares + 70 cadeiras adicionais - Capacidade Máxima: 220 lugares")
      escreva("\nAuditório Beta | Capacidade Máxima: 350 lugares")
      escreva("\nPor favor, informe a quantidade de convidados dentro do padrão estabelecido: ")
      inteiro volumeConvidadosAuditorio
      leia(volumeConvidadosAuditorio)
      se((volumeConvidadosAuditorio <=0) ou (volumeConvidadosAuditorio >=350)){
        escreva("\nEncerraremos o programa, pois voce já está ciente das regras para realizar uma reserva!\n")
        escreva("Por favor, na próxima tentativa informe quantidade de convidados entre 1 e 350\n")
      } 
      senao {
        sugestaoDeAuditorioIFMA(volumeConvidadosAuditorio)
      }
      escreva("\n=====================================================================================\n")
    }

    funcao questaoQuatro(){
      escreva("\nQuestão 04 | Verificação da Lavanderia e Piscina | Hotel @IFMA")
      escreva("\nDeseja verificar valores da Lavanderia e Utillização da Piscina?")
      escreva("\nDigite L para Lavanderia ou P para Piscina: ")
      cadeia opcao, opacaoTratada
      leia(opcao)
      valorLavanderiaPiscina(opcao)
    }


    //CAMADA DE IMPLEMENTAÇÃO (OPERAÇÕES):
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
        escreva("\n\nSugerimos que vc reserve o Auditório Alfa")
        se(qtdeConvidadosAuditorio < 150){
          escreva("\nVocê não precisará usar as poltronas adicionais!")
        } senao{
          inteiro poltronasAdicionais = qtdeConvidadosAuditorio - 150
          se(poltronasAdicionais == 1){
            escreva("\n Você precisará usar ", poltronasAdicionais, " poltrona adicional")
            escreva("\nMas fique tranquilo, esse mês o @IFMA estará lhe dando ELA de cortesia!")            
          }
          senao{
            escreva("\n Você precisará usar ", poltronasAdicionais, " poltronas adicionais")
            escreva("\nMas fique tranquilo, esse mês o @IFMA estará lhe dando ELAS de cortesia!")
          }
        }
      }
      senao{
      escreva("\n\nSugerimos que vc reserve o Auditório Beta")
      }
    }

    funcao calculoDespesaBuffet(inteiro qtdeConvidados){
      real cafe = (0.2 * qtdeConvidados)
      real agua = (0.5 * qtdeConvidados)
      inteiro salgadinhos = (7 * qtdeConvidados)
      escreva("\nConsumo de Itens projetado: ")
      escreva("\nConvidados: ", qtdeConvidados, "\nLitros de Água: ", agua, "\nLitros de Café: ", cafe, "\nSalgadinhos:", salgadinhos)
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
          escreva("\nOK, verificamos que é maior de idade, fizeste o exame de aptidão?: ")
          leia(exameRealizado)

          se(exameRealizado == "SIM"){
            escreva("\nVocê ESTÁ apto a usar a piscina do HOTEL @IFMA!")
          } 
          senao{
            escreva("\nFaça seu exame para que possa acessar a piscina")
          }
        }
        senao{
              escreva("\nVerificamos que voce é menor de idade, está com acompanhante?: ")
              leia(possuiAcompanhante)
              se(possuiAcompanhante == "SIM"){
                escreva("\nOK!, você fez o exame de aptidão?: ")
                leia(exameRealizado)
                se(exameRealizado == "SIM"){
                  escreva("\nVocê está apto a acessar a piscina do HOTEL @IFMA, desde que esteja acompanhado")
                } 
                senao{
                  escreva("\nFaça seu exame para que possa acessar e não esqueça, o acompanhante é obrigatório")
                }  
              } 
              senao{
                escreva("\nVocê precisa ter acompanhante e estar apto no exame, verifique isso e depois retorne!")
              }
            }
      pare
    }
  }
}