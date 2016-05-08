<?php

    include_once("classPersistencia.php");

    class CommUser2SgeIvision extends Persistencia {
	
        private $iId;
        private $sRotulo;
        private $sIp;


        public function __construct($id = 0) {
            parent::__construct();

            if($id != 0) {
                $this->getCommUser2SgeIvisionById($id);
            } else {
                $this->iId = $id;
                $this->sRotulo = "";
                $this->sIp = "";
            }
        }

        public function bFetchObject($sql) {
            $this->bExecute($sql);
            $this->bDados();

            $res = $this->getDbArrayDados();

            if($res['id_comm_user_2_sge_ivision']!="") {
                $this->setId(utf8_encode($res['id_comm_user_2_sge_ivision']));
                $this->setRotulo(utf8_encode($res['rotulo']));
                $this->setIp(utf8_encode($res['ip']));
            } else {
                $this->setId("");
                $this->setRotulo("");
                $this->setIp("");
            }
        }

        public function getCommUser2SgeIvisionById($id) {
            $sSql= "SELECT * FROM comm_user_2_sge_ivision WHERE id_comm_user_2_sge_ivision=".$id;

            $this->bFetchObject($sSql);
        }
		
        public function getCommUser2SgeIvisionByIp($ip) {
            $sSql= "SELECT * FROM comm_user_2_sge_ivision WHERE ip='".$ip."'";

            $this->bFetchObject($sSql);
        }		

        public function bUpdate() {
            if(($this->getId()) == 0) {
                $sSql = "INSERT INTO comm_user_2_sge_ivision (rotulo, ip) VALUES (";
                $sSql .= " '".utf8_decode($this->getRotulo())."', ";
                $sSql .= " '".utf8_decode($this->getIp())."') ";

                if(!$this->bExecute($sSql)) {
                    $this->imprimeErro('Ocorreu um erro ao tentar inserir o objeto!');
                    return false;
                } else {
                    $this->setId(mysql_insert_id());
                    return true;
                }
            } else {
                $sSql = "UPDATE comm_user_2_sge_ivision SET ";
                $sSql .= " rotulo = '".utf8_decode($this->getRotulo())."', ";
                $sSql .= " ip = '".utf8_decode($this->getIp())."' ";

                $sSql .= " WHERE id_comm_user_2_sge_ivision=".$this->getId();

                if(!$this->bExecute($sSql)) {
                    $this->imprimeErro('Ocorreu um erro ao tentar alterar registro!');
                    return false;
                } else {
                    return true;
                }

            }
        }

        public function bDelete() {
            $sSql = "DELETE FROM comm_user_2_sge_ivision WHERE id_comm_user_2_sge_ivision=".$this->getId();

            if(!$this->bExecute($sSql)) {
                $this->imprimeErro('Ocorreu um erro ao tentar excluir o registro!');
                return false;
            } else {
                return true;
            }
        }

        public function toString() {
			echo '<pre>';
            echo '### COMM USER 2 SGE-IVISION ###<br>';
            echo 'ID.............:'.$this->getId().'<br>';
            echo 'ROTULO.........:'.$this->getRotulo().'<br>';
            echo 'IP.............:'.$this->getIp().'<br>';
			echo '</pre>';
        }

        ## MÉTODO GET's DA CLASSE ##
        public function getId() { return $this->iId; }
		public function getRotulo() { return $this->sRotulo; }
        public function getIp() { return $this->sIp; }
        
        ## MÉTODO SET's DA CLASSE ##
        public function setId($id) { $this->iId = $id; }
		public function setRotulo($rotulo) { $this->sRotulo = $rotulo; }
        public function setIp($ip) { $this->sIp = $ip; }

    }
?>
