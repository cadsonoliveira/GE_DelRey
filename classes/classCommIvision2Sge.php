<?php

    include_once("classPersistencia.php");

    class CommIvision2Sge extends Persistencia {
	
        private $iId;
        private $cModoCam;
        private $cVideoIniciado;
		private $iCameraConectada;
		private $iTimeout;

        public function __construct($id = 0) {
            parent::__construct();

            if($id != 0) {
                $this->getCommIvision2SgeById($id);
            } else {
                $this->iId = $id;
                $this->cModoCam = "";
                $this->cVideoIniciado = "";
                $this->iCameraConectada = "";
                $this->iTimeout = 0;
            }
        }

        public function bFetchObject($sql) {
            $this->bExecute($sql);
            $this->bDados();

            $res = $this->getDbArrayDados();

            if($res['id_comm_ivision_2_sge']!="") {
                $this->setId(utf8_encode($res['id_comm_ivision_2_sge']));
                $this->setModoCam(utf8_encode($res['modo_cam']));
                $this->setVideoIniciado(utf8_encode($res['video_iniciado']));
                $this->setCameraConectada(utf8_encode($res['camera_conectada']));
                $this->setTimeout($res['timeout']);
            } else {
                $this->setId(utf8_encode(""));
                $this->setModoCam("");
                $this->setVideoIniciado("");
                $this->setCameraConectada("");
                $this->setTimeout("0");
            }
        }

        public function getCommIvision2SgeById($id) {
            $sSql= "SELECT * FROM comm_ivision_2_sge WHERE id_comm_ivision_2_sge=".$id;

            $this->bFetchObject($sSql);
        }

        public function bUpdate() {
            if(($this->getId()) == 0) {
                $sSql = "INSERT INTO comm_ivision_2_sge (modo_cam, video_iniciado, camera_conectada) VALUES (";
                $sSql .= " '".utf8_decode($this->getModoCam())."', ";
                $sSql .= " '".utf8_decode($this->getVideoIniciado())."', ";
                $sSql .= " ".$this->getTimeout().", ";
                $sSql .= " ".utf8_decode($this->getCameraConectada()).") ";

                if(!$this->bExecute($sSql)) {
                    $this->imprimeErro('Ocorreu um erro ao tentar inserir o objeto!');
                    return false;
                } else {
                    $this->setId(mysql_insert_id());
                    return true;
                }
            } else {
                $sSql = "UPDATE comm_ivision_2_sge SET ";
                $sSql .= " modo_cam = '".utf8_decode($this->getModoCam())."', ";
                $sSql .= " video_iniciado = '".utf8_decode($this->getVideoIniciado())."', ";
                $sSql .= " camera_conectada = ".utf8_decode($this->getCameraConectada()).", ";
                $sSql .= " timeout = ".$this->getTimeout()." ";

                $sSql .= " WHERE id_comm_ivision_2_sge=".$this->getId();

                if(!$this->bExecute($sSql)) {
                    $this->imprimeErro('Ocorreu um erro ao tentar alterar registro!');
                    return false;
                } else {
                    return true;
                }

            }
        }

        public function bDelete() {
            $sSql = "DELETE FROM comm_ivision_2_sge WHERE id_comm_ivision_2_sge=".$this->getId();

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
            echo 'ID...............:'.$this->getId().'<br>';
            echo 'MODO CAM.........:'.$this->getModoCam().'<br>';
            echo 'VIDEO INICIADO...:'.$this->getVideoIniciado().'<br>';
            echo 'CAMERA CONECTADA.:'.$this->getCameraConectada().'<br>';
			echo '</pre>';
        }

        ## MÉTODO GET's DA CLASSE ##
        public function getId() { return $this->iId; }
		public function getModoCam() { return $this->cModoCam; }
        public function getVideoIniciado() { return $this->cVideoIniciado; }
        public function getCameraConectada() { return $this->iCameraConectada; }
		public function getTimeout() { return $this->iTimeout; }

        ## MÉTODO SET's DA CLASSE ##
        public function setId($id) { $this->iId = $id; }
		public function setModoCam($modo_cam) { $this->cModoCam = $modo_cam; }
        public function setVideoIniciado($video_iniciado) { $this->cVideoIniciado = $video_iniciado; }
        public function setCameraConectada($camera_conectada) { $this->iCameraConectada = $camera_conectada; }
		public function setTimeout($timeout) { $this->iTimeout = $timeout; }

    }
?>
