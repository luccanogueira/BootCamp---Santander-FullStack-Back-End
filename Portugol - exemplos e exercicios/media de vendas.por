programa
{
	
	funcao inicio()
	{
		cadeia funcionario
		real jan, fev, mar, abr, maio, jun, media

		escreva ("Digite o nome do funcionario: ")
		leia (funcionario)

		escreva ("Digite a valor total de vendas feitas pelo " + funcionario + " em Janeiro: ")
		leia (jan)
		escreva ("Digite a valor total de vendas feitas pelo " + funcionario + " em Fevereiro: ")
		leia (fev)
		escreva ("Digite a valor total de vendas feitas pelo " + funcionario + " em Março: ")
		leia (mar)
		escreva ("Digite a valor total de vendas feitas pelo " + funcionario + " em Abril: ")
		leia (abr)
		escreva ("Digite a valor total de vendas feitas pelo " + funcionario + " em Maio: ")
		leia (maio)
		escreva ("Digite a valor total de vendas feitas pelo " + funcionario + " em Junho: ")
		leia (jun)

		media = (jan+fev+mar+abr+maio+jun)/6
		escreva (funcionario + " realizou uma média de " + media + " vendas no primeiro semestre do ano.")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 765; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */