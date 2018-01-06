##################################################
#                                                #
# Script de teste do funcionamento da Teoria do  #
# Portfólio de Markowitz (1952)                  #
#                                                #
#                   Versão 0.0                   #
#                                                #
#        Thiago R Werminghoff, 13-12-2017        #
#                                                #
##################################################
# texto original está em markowitz.txt


# DETALHES A SE FAZER NESSE SCRIPT:
# 1. Estuda para criar fatores para a tabela original que definam
#    a área de atuação do ativo (hospitais, shoppings, comércio
#    varejista, etc.)
# 2. Veja os pacotes que peque o ticker do Yahoo! Finance, já vi
#    que tem BBAS e BBFI11B (não sei se ajuda muito pois não traz
#	 o histórico de pagamento de bônus mensal)



# 1o passo - ajusta o diretório do workspace, se necessário
setwd('/home/thiago/Documentos/Markowitz/r')

# 2o passo - importar a matriz .csv com os rendimentos
# DETALHE: os decimais DEVEM ser separados por PONTOS
historico <- data.frame(read.csv("historicos_teste.csv"))
ativos <- colnames(historico)

# 3o passo - calcula o retorno medio de cada ativo
# e transpõe a matriz (aqui feito direto com data.frame)
ret_medio <- data.frame(colMeans(historico)); names(ret_medio) <- c("Médias (totais)")

# 4o passo - calcula a matriz de covariancia
matriz_covariancia <- cov(historico)

# 5o passo - anualizar os retornos médios obtidos
retorno_anual <- (((1 + ret_medio)^12)-1)

# 6o passo - calcular a variância anual de cada ativo
# deve ter algum jeito mais simples que isso, mas por hora vai
# ter que servir. Primeiro calcula as variações individuais:
varAtivo1 <- var(historico[, 1])
varAtivo2 <- var(historico[, 2])
varAtivo3 <- var(historico[, 3])
varAtivo4 <- var(historico[, 4])
varAtivo5 <- var(historico[, 5])
varAtivo6 <- var(historico[, 6])

# Depois junta todas as variações individuais em um dataset novo,
# já com a nomenclatura dos ativos:
var_individuais <- rbind(varAtivo1, varAtivo2, varAtivo3, varAtivo4, varAtivo5, varAtivo6); rownames(var_individuais) <- c(ativos)

# 7o passo - como que calcula o diabo do Markowitz???
str(var_individuais)
ls()
print(var_individuais)
print(matriz_covariancia)
print(retorno_anual)
