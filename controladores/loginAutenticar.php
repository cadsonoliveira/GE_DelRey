<?php

    session_start();
    
    include_once("../classes/classUsuario.php");
    include_once("../classes/classPersistencia.php");

	$pers = new Persistencia();
	
	$sSql = "SELECT * FROM comm_monitor_2_sge WHERE id_communication = '1'";
	$pers->bExecute($sSql); // Executa o SQL
	$pers->bDados(); // Pega o vetor de dados
	
	$dados = $pers->getDbArrayDados();
	
	date_default_timezone_set("America/Sao_Paulo");
	//echo date_default_timezone_get();
	
	$now = time(); 
	$timeDB = strtotime( $dados['last_update']);
	$difTime = $now - $timeDB;
	
	//echo date('r', $timeDB);
	
	// Verifica a licença no banco e data da última vez que rodou o monitor (menos de 3600 segundos atrás)
	if ($difTime > 3600){
    	if(isset($_POST)){
			$user = addslashes($_POST['user']);
			$pass = md5($_POST['pass']);

			$sSql = "SELECT * FROM usuario WHERE login = '".$user."' AND senha = '".$pass."'";

			$pers->bExecute($sSql);
			if($pers->getDbNumRows() > 0){
				#Se o usuário for válido
				$pers->bDados();
				$vet_resultado = $pers->getDbArrayDados();
				#Instacia o objeto usuario
				$usuario = new Usuario($vet_resultado['id_pessoa']);
				$data_ultimo_acesso = $usuario->getUltimoAcesso();
				#Atualiza a data e hora do último acesso
				date_default_timezone_set('America/Sao_Paulo');
				$data_corrente = date("Y-m-d H:i:s");
				$usuario->setUltimoAcesso($data_corrente);
				$usuario->bUpdate();

				#Autentica a sessao
				$_SESSION['USUARIO']['VALIDA'] = true;
				$_SESSION['USUARIO']['ID'] = $usuario->getId();
				$_SESSION['USUARIO']['NOME'] = $usuario->getNome();
				$_SESSION['USUARIO']['EMAIL'] = $usuario->getContato()->getEmail();
				$_SESSION['USUARIO']['ULTIMO_ACESSO'] = $data_ultimo_acesso;
				header("Location: ../layouts/index.php");
			} else {
				header("Location: ../layouts/login.php?tipo=1");
			}
		} else {
			header("Location: ../layouts/login.php?tipo=3");
		}
	} else {
		header("Location: ../layouts/login.php?tipo=6");
	}
?>