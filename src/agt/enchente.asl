!monitorar_rio.

// Agent sample_agent in project main

/* Initial beliefs and rules */
nivel_rio_max(rio_ararangua, 3).
nivel_alerta_rio(rio_ararangua, 2.5).
nivel_critico_rio(rio_ararangua, 3.5).
nivel_atual(rio_ararangua, 3.6).

/* Initial goals */

// 1. Verificação nível crítico
+!monitorar_rio: nivel_critico_rio(NomeRio, Z) & nivel_atual(NomeRio, Y) & nivel_rio_max(NomeRio, X) & Y >= Z
    <-
        .print("Nível do rio atual: ", Y, "m (Nível Máximo: ", X, "m) - SITUAÇÃO CRÍTICA!").

// 2. Verificação acima do limite máximo
+!monitorar_rio: nivel_rio_max(NomeRio, X) & nivel_atual(NomeRio, Y) & Y >= X
    <-
        .print("Nível do rio atual: ", Y, "m (Limite máximo: ", X, "m) - LIMITE ATINGIDO!").

// 3. Verificação de atenção
+!monitorar_rio: nivel_alerta_rio(NomeRio, A) & nivel_atual(NomeRio, Y) & nivel_rio_max(NomeRio, X) & Y >= A
    <-
        .print("Nível do rio atual:", Y, "m (Limite máximo: ", X, "m) - ATENÇÃO" ) .

// 4. Verificação do nível normal
+!monitorar_rio: nivel_alerta_rio(NomeRio, A) & nivel_atual(NomeRio, Y) & nivel_rio_max(NomeRio, X) & Y < A
    <-
        .print("Nível do rio atual:", Y, "m (Limite máximo: ", X, "m) - NIVEL NORMAL" ) .

{ include("$jacamo/templates/common-cartago.asl") }
{ include("$jacamo/templates/common-moise.asl") }