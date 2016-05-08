<?php
	//Antiga página pacientes_documento.php
    session_start();

    if((!isset($_SESSION['USUARIO'])) && ($_SESSION['USUARIO']['VALIDA'] != true)){
       header("Location: ../layouts/login.php?tipo=2");
    } else {
        include_once("../funcoes/common.php");
        include_once("../classes/classPaciente.php");
        include_once("../classes/classEndereco.php");
        include_once("../classes/classPlanoSaude.php");
        include_once("../classes/classDentistaEncaminhador.php");
        include_once("../classes/classTabela.php");

        if(isset($_SESSION['PACIENTE']['ID'])) {
            $id_paciente = $_SESSION['PACIENTE']['ID'];//$_POST['id_paciente'];
        } else {
            header("Location: pacientes.php");
        }

        $paciente = new Paciente($id_paciente);
        $dent_enc = new DentistaEncaminhador($paciente->getIdDentistaEncaminhador());
        $plano = new PlanoSaude($paciente->getIdPlanoSaude());
	}
	
	$nome_pac = "";
	if(isset($_SESSION['PACIENTE']['ID'])){
		$paciente = new Paciente($_SESSION['PACIENTE']['ID']);
		$nome_pac = utf8_encode(ucwords(strtolower(utf8_decode($paciente->getNome()))));
	}
	
	$sql = "SELECT t.id_tratamento, t.dente, t.data_inic, mc.descricao, t.descricao AS obs, e.descricao AS especialidade
											FROM tratamento t, match_code mc, especialidade e
											WHERE t.id_match_code = mc.id_match_code
											AND t.id_pessoa = ".$paciente->getId()."
											AND mc.id_especialidade = e.id_especialidade
											ORDER BY t.data_inic, id_tratamento";
									
                                    $sql_x = "SELECT i.id_imagem, t.dente, mc.descricao, i.obs,
                                                   i.caminho, i.data, t.id_tratamento, t.data_inic
                                            FROM imagem i, tratamento t, match_code mc
                                            WHERE i.id_tratamento = t.id_tratamento
                                            AND t.id_match_code = mc.id_match_code
                                            AND t.id_pessoa =".$paciente->getId()."
                                            GROUP BY t.id_tratamento
                                            ORDER BY id_tratamento";

	$pers = new Persistencia();
	$pers->bExecute($sql);

	$html_tabela = '';

	$cont = 0;
	while($cont < $pers->getDbNumRows()) {
		$pers->bCarregaRegistroPorLinha($cont);
		$result = $pers->getDbArrayDados();

		$data = decodeDate($result['data_inic']);
		
		if($cont % 2 == 0){
			$cor_linha_tabela = "tableColor1";
		}else{
			$cor_linha_tabela = "tableColor2";
		}
		
		$html_tabela .= '
			<tr class="'.$cor_linha_tabela.'">
				<td class="numero">'.$result['id_tratamento'].'</td>
				<td class="numero">'.utf8_encode($result['dente']).'</td>
				<td class="dataInicio">'.$data.'</td>
				<td class="especialidadeDocumentos">'.utf8_encode($result['especialidade']).'</td>
				<td class="tratamentosDocumentos">'.utf8_encode($result['descricao']).'</td>
				<td class="observacoes">'.utf8_encode($result['obs']).'</td>
				<td class="opcoesDocumentos">
					<span style="display:block; margin:auto; width:52px;">
						<a class="documentos ir" href="#" onclick="abrir_tratamento('.$result['id_tratamento'].');" title="Dados tratamento">Dados Tratamento</a>
						<a class="download ir" href="#div_doc_a" onclick="download_doc(\'\','.$paciente->getId().', 2, '.$result['id_tratamento'].')" title="Download dos documentos do tratamento">Download</a>
					</span>
				</td>
			</tr>
		';
		$cont++;
	}
	
	 $sql = "SELECT * FROM documentos WHERE id_pessoa=".$paciente->getId();

	$pers = new Persistencia();
	$pers->bExecute($sql);

	$html_tabela_doc = '';

	$cont = 0;
	
	if(!$pers->getDbNumRows() > 0) {
			$html_tabela_doc = '<tr>
									<td colspan="4" style="text-align:center;">Nenhum documento!</td>
							   </tr>';
		} else {
			while($cont < $pers->getDbNumRows()){
				$pers->bCarregaRegistroPorLinha($cont);
				$result = $pers->getDbArrayDados();
		
				if($cont % 2 == 0){
					$cor_linha_tabela = "tableColor1";
				}else{
					$cor_linha_tabela = "tableColor2";
				}
				
				$html_tabela_doc .= '
					<tr class="'.$cor_linha_tabela.'">
						<td class="numero">'.$result['id_documento'].'</td>
						<td class="observacoes">'.utf8_encode($result['observacoes']).'</td>
						<td class="data">'.decodeDate($result['data_documento']).'</td>
						<td class="data">'.decodeDate(substr($result['data_cadastro'], 0, 10)).'</td>
						<td class="operacoes">
							<span style="display:block; margin:auto; width:80px;">
								<a class="visualizarDocumentos ir" href="#div_doc_a" onclick="visualiza_doc(\''.$result['imagem_caminho'].'\','.$paciente->getId().', \''.decodeDate($result['data_documento']).'\', \''.decodeDate(substr($result['data_cadastro'],0, 10)).'\')" title="Visualizar Documento">Visualizar Documento</a>
								<a class="download ir" href="#div_doc_a" onclick="download_doc(\''.$result['imagem_caminho'].'\','.$paciente->getId().', 1, '.$result['id_documento'].')" title="Download do Documento">Download</a>
								<a class="excluir ir" href="#div_doc_a" onclick="remove_doc('.$result['id_documento'].');" title="Excluir Documento">Excluir Documento</a>
							</span>
						</td>
					</tr>
		';
				$cont++;
			}
		}
?>

<?php include_once("include/header.php") ?>
<?php include_once("include/topo.php") ?>
<?php include_once("include/menu.php") ?>

    <div id="conteudo">
        <form name="cd_field" id="form" method="POST" action="dados_tratamento.php?acao=1">
                        <input type="hidden" name="id_tratamento" value="" />
        </form>
    	<?php include_once("include/dados_paciente.php") ?>
        <div id="dropshadow">
            <div id="breadcrumb">
                <ul>
                    <li><span class="breadcrumbEsquerda"></span><a href="pacientes.php" title="lista pacientes">pacientes</a><span class="breadcrumbDireita"></span>
                        <ul>
                            <li><span class="breadcrumbEsquerda bcrumbSelect"></span><h2 class="bcrumbAtivo bcrumbSelect">prontuário do paciente</h2><span class="breadcrumbDireita bcrumbSelect"></span></li>
                        </ul>
                    </li>
                </ul>
            </div> <!--Fecha div breadcrumb-->
    
            <div id="container" class="clearfix">
                <h3 class="tituloBox">Tratamentos</h3>
                <div class="separa">
                <table title="Lista de tratamentos" summary="Tabela com informações de tratamentos" style="margin-bottom:40px;">
                    <thead>
                        <tr>
                            <th class="numero">Número</th>
                            <th class="numero">Dente</th>
                            <th class="dataInicio">Data de Início</th>
                            <th class="especialidadeDocumentos">Especialidade</th>
                            <th class="tratamentosDocumentos">Tratamento</th>
                            <th>Observações</th>
                            <th class="opcoesDocumentos">Operações</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                        <?php
                            echo $html_tabela;
                        ?>
                    </tbody>
                </table>
                </div>
                
                <h3 class="tituloBox">Prontuário</h3>
                <div class="separa" id="div_doc">
                
                <table title="Lista de Prontuário do paciente" summary="Lista dos prontuário do paciente" style="margin-bottom:40px;">
                    <thead>
                        <tr>
                            <th class="numero">Número</th>
                            <th>Observações</th>
                            <th class="data">Data do documento</th>
                            <th class="data">Data de cadastro</th>
                            <th class="operacoes">Operações</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                        <?php
                            echo $html_tabela_doc;
                        ?>
                    </tbody>
                </table>
                </div>
                
                <form name ="cd_field2" id="form2" action="#" method="post">
                    <fieldset>
                        <input type="hidden" name="id_pessoa" value="<?php echo $paciente->getId();?>" />
                        <h3 class="tituloBox">Adicionar prontuário</h3>
                        <div class="formularioDividido">
                        <div class="elementosFormulario2">
                        <label for="data_doc">Data do prontuário</label>
                        <input name="data_doc" id="data_doc" type="text" class="iw120 calendar"/>
                        </div>
                        
                        <div class="elementosFormulario2">                                    
                        <label for="observacao_documento">Observações</label>
                        <textarea id="observacao_documento" name="sessao" cols="50" rows="4"></textarea>
                        </div>
                        
                        <div class="elementosFormulario2">
                        <label for="caminho_documento">Documento</label>
                        <input id="caminho_documento" name="arquivo" type="file" />
                        </div>
                        </div>
                    </fieldset>
                    <p id="botoesFormulario">
                      <button id="botaoNegativo" onclick="location.href='pacientes.php'" type="button">Cancelar</button>
                      <button class="botaoPositivo" type="button" onclick="adiciona_doc();">Adicionar Prontuário</button>
                    </p>            
                </form>
            
		<?php include_once("include/footer.php") ?>
        
        <script src="js/calendar.js" type="text/javascript"></script>
        <script src="js/micoxUpload.js" type="text/javascript"></script>
        <script src="js/common.js" type="text/javascript"></script>
        <script  type="text/javascript">

            //Calendario
            window.addEvent('domready', function() {
                dataDoc = new Calendar({ data_doc :    'd/m/Y' },{ direction: -1, tweak: {x: 6, y: 0}});
            });


            /*Visualiza Documento MODAL */
            var visualiza_doc = function(documento,id_paciente,data_doc, data_cadastro){
                var caminho = '../documentos/pacientes/'+id_paciente+'/outros_documentos/'+documento;
                var md = new Modal(['modal']);
            
                md.setHeader('Visualização de Documento');
            
                var fm = new Form('form_d',['dummy.php',''],'','');
                fm.addEvent('success',function(){
                    (function(){this.fadeAndRemove()}.bind(this)).delay(500);
                }.bind(md));
                fm.attach(md.win);
                
                fm.injectBlock('<center><b>Data do documento: </b>' + data_doc + '<b> | Data de cadastro: </b>' + data_cadastro +'<br><img src="'+ caminho + '" height="400" width="400"><\center>');
                md.show();
            }


            function remove_doc(valor){
                if(confirm("Deseja excluir este documento?")){
                    xhSendPost("../controladores/AJAX.pacientes_documento.php?div_id=div_doc&acao=excluir&id_paciente=<?php echo $id_paciente; ?>&id_doc=" + valor);
                }
            }

            function adiciona_doc(){
                if(document.cd_field2.data_doc.value == ""){
                    alert("Informe a data do documento");
                    return false;
                }
                if(document.cd_field2.sessao.value == ""){
                    alert("Descreva uma observação para o documento");
                    return false;
                }
                if(document.cd_field2.arquivo.value == ""){
                    alert("Selecione o arquivo desejado");
                    return false;
                }

                micoxUpload(document.getElementById('form2'),'../controladores/documentosGravar.php?acao=adicionar','div_doc','Carregando...','Erro ao Carregar o Documento');

                document.cd_field2.data_doc.value = "";
                document.cd_field2.sessao.value = "";
                document.cd_field2.arquivo.value = "";
            }

            function abrir_tratamento(valor){
                document.cd_field.id_tratamento.value = valor;
                document.cd_field.submit();
            }
            
            function download_doc(file, id, tipo, id_trat){
                location.href = "documentos_paciente.download.php?file=" + file + "&id=" + id + "&tipo=" + tipo + "&id_tratamento=" + id_trat;
            }
        </script>
    </body>
</html>