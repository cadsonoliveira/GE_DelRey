<?php

    include_once("classPersistencia.php");

    class CommSge2Ivision extends Persistencia {
	
        private $iId;
        private $iGravarVideo;

        public function __construct($id = 0) {
            parent::__construct();

            if($id != 0) {
                $this->getCommSge2IvisionById($id);
            } else {
                $this->iId = $id;
                $this->iGravarVideo = 0;
            }
        }

        public function bFetchObject($sql) {
            $this->bExecute($sql);
            $this->bDados();

            $res = $this->getDbArrayDados();

            if($res['id_comm_sge_2_ivision']!="") {
                $this->setId(utf8_encode($res['id_comm_sge_2_ivision']));
                $this->setGravarVideo(utf8_encode($res['gravar_video']));
            } else {
                $this->setId(utf8_encode(""));
                $this->setGravarVideo("");
            }
        }

        public function getCommSge2IvisionById($id) {
            $sSql= "SELECT * FROM comm_sge_2_ivision WHERE id_comm_sge_2_ivision=".$id;

            $this->bFetchObject($sSql);
        }

        public function bUpdate() {
            if(($this->getId()) == 0) {
            #INSERIR UM NOVA ESPECIALIDADE   NO BANCO DE DADOS
                $sSql = "INSERT INTO comm_sge_2_ivision (gravar_video) VALUES (";
                $sSql .= " ".utf8_decode($this->getGravarVideo()).") ";

                if(!$this->bExecute($sSql)) {
                    $this->imprimeErro('Ocorreu um erro ao tentar inserir o objeto!');
                    return false;
                } else {
                    $this->setId(mysql_insert_id());
                    return true;
                }
            } else {
            #ALTERAR UM ENDERECO NO BANCO DE DADOS
                $sSql = "UPDATE comm_sge_2_ivision SET ";
                $sSql .= " gravar_video = ".utf8_decode($this->getGravarVideo())." ";

                $sSql .= " WHERE id_comm_sge_2_ivision=".$this->getId();

                if(!$this->bExecute($sSql)) {
                    $this->imprimeErro('Ocorreu um erro ao tentar alterar registro!');
                    return false;
                } else {
                    return true;
                }

            }
        }

        public function bDelete() {
            $sSql = "DELETE FROM comm_sge_2_ivision WHERE id_comm_sge_2_ivision=".$this->getId();

            if(!$this->bExecute($sSql)) {
                $this->imprimeErro('Ocorreu um erro ao tentar excluir o registro!');
                return false;
            } else {
                return true;
            }
        }

        public function toString() {
			echo '<pre>';
            echo '### COMM IVISION 2 SGE ###<br>';
            echo 'ID.............:'.$this->getId().'<br>';
            echo 'GRAVAR VIDEO...:'.$this->getGravarVideo().'<br>';
			echo '</pre>';
        }

        ## M�TODO GET's DA CLASSE ##
        public function getId() { return $this->iId; }
        public function getGravarVideo() { return $this->iGravarVideo; }

        ## M�TODO SET's DA CLASSE ##
        public function setId($id) { $this->iId = $id; }
        public function setGravarVideo($gravar_video) { $this->iGravarVideo = $gravar_video; }

    }
?>
