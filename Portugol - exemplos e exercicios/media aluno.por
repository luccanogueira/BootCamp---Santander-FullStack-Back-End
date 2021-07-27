programa
{
	
	funcao inicio()
	{
		// declarando variaveis
		real n1, n2, n3, n4, media
		cadeia aluno

		// intruindo e lendo cada variavel
		escreva ("Digite o nome do aluno: ")
		leia (aluno)

		escreva ("Digite a nota um do " + aluno + ": ")
		leia (n1)
		escreva ("Digite a nota dois do " + aluno + ": ")
		leia (n2)
		escreva ("Digite a nota tres do " + aluno + ": ")
		leia (n3)
		escreva ("Digite a nota quatro do " + aluno + ": ")
		leia (n4)
		
		// realizando o calculo da media
		media = (n1+n2+n3+n4)/4

		escreva ("A media que " + aluno + " obteve foi " + media)

		// verificando se o aluno está aprovado ou reprovado
		se (media >=7 ){
			escreva ("\nParabéns! Ele está aprovado!")
		}
		senao {
			escreva ("\nInfelizmente " + aluno + " foi reprovado.")
		}
	
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 245; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */