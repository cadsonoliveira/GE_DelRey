-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: 
-- Versão do Servidor: 5.5.24-log
-- Versão do PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `easysge`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `anamnese`
--

CREATE TABLE IF NOT EXISTS `anamnese` (
  `id_anamnese` int(11) NOT NULL AUTO_INCREMENT,
  `id_pessoa` int(11) NOT NULL,
  `boa_saude` char(1) DEFAULT NULL,
  `boa_saude_porque` varchar(255) DEFAULT NULL,
  `visitas_freq_medico` char(1) DEFAULT NULL,
  `visitas_freq_medico_motivo` varchar(255) DEFAULT NULL,
  `medicacao_rotina` char(1) DEFAULT NULL,
  `medicacao_rotina_qual` varchar(255) DEFAULT NULL,
  `alergia` char(1) DEFAULT NULL,
  `alergia_de_que` varchar(255) DEFAULT NULL,
  `doencas_previas` char(1) DEFAULT NULL,
  `doencas_previas_qual` varchar(255) DEFAULT NULL,
  `cirurgias_previas` char(1) DEFAULT NULL,
  `cirurgias_previas_qual` varchar(255) DEFAULT NULL,
  `hepatite` char(1) DEFAULT NULL,
  `diabetis` char(1) DEFAULT NULL,
  `febre_reumatica` char(1) DEFAULT NULL,
  `doencas_arterial` char(1) DEFAULT NULL,
  `pressao_arterial` char(1) DEFAULT NULL,
  `acid_fraturas_odont` char(1) DEFAULT NULL,
  `acid_fraturas_odont_qual` varchar(255) DEFAULT NULL,
  `dific_abert_boca` char(1) DEFAULT NULL,
  `muita_salivacao` char(1) DEFAULT NULL,
  `ansia_vomito` char(1) DEFAULT NULL,
  `dor_nas_costas` char(1) DEFAULT NULL,
  `traumatismo_dentario` char(1) DEFAULT NULL,
  `recomendacao_medica` varchar(255) DEFAULT NULL,
  `restricao_medicamentos` char(1) DEFAULT NULL,
  `restricao_medicamentos_qual` varchar(255) DEFAULT NULL,
  `visita_regular_dent` char(1) DEFAULT NULL,
  `ultimo_trat_odont` int(11) DEFAULT NULL,
  `inf_adicional_importante` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_anamnese`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `anamnese`
--

INSERT INTO `anamnese` (`id_anamnese`, `id_pessoa`, `boa_saude`, `boa_saude_porque`, `visitas_freq_medico`, `visitas_freq_medico_motivo`, `medicacao_rotina`, `medicacao_rotina_qual`, `alergia`, `alergia_de_que`, `doencas_previas`, `doencas_previas_qual`, `cirurgias_previas`, `cirurgias_previas_qual`, `hepatite`, `diabetis`, `febre_reumatica`, `doencas_arterial`, `pressao_arterial`, `acid_fraturas_odont`, `acid_fraturas_odont_qual`, `dific_abert_boca`, `muita_salivacao`, `ansia_vomito`, `dor_nas_costas`, `traumatismo_dentario`, `recomendacao_medica`, `restricao_medicamentos`, `restricao_medicamentos_qual`, `visita_regular_dent`, `ultimo_trat_odont`, `inf_adicional_importante`) VALUES
(5, 58, 'S', '', 'N', '', 'N', '', 'N', '', '', '', '', '', 'N', 'N', 'N', 'N', 'N', '', '', 'N', '', '', '', '', '', '', '', '', NULL, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `arcada_dentaria`
--

CREATE TABLE IF NOT EXISTS `arcada_dentaria` (
  `id_arcada_dentaria` int(11) NOT NULL AUTO_INCREMENT,
  `id_pessoa` int(11) NOT NULL,
  `dente` varchar(2) DEFAULT NULL,
  `obs` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_arcada_dentaria`),
  KEY `id_ad_pessoa` (`id_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `comm_ivision_2_sge`
--

CREATE TABLE IF NOT EXISTS `comm_ivision_2_sge` (
  `id_comm_ivision_2_sge` int(11) NOT NULL AUTO_INCREMENT,
  `modo_cam` char(1) NOT NULL,
  `video_iniciado` char(1) NOT NULL,
  `camera_conectada` int(11) NOT NULL,
  `timeout` int(11) NOT NULL,
  PRIMARY KEY (`id_comm_ivision_2_sge`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `comm_ivision_2_sge`
--

INSERT INTO `comm_ivision_2_sge` (`id_comm_ivision_2_sge`, `modo_cam`, `video_iniciado`, `camera_conectada`, `timeout`) VALUES
(1, 'F', 'F', 0, 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `comm_monitor_2_sge`
--

CREATE TABLE IF NOT EXISTS `comm_monitor_2_sge` (
  `id_communication` int(11) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `license` char(1) NOT NULL,
  PRIMARY KEY (`id_communication`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `comm_monitor_2_sge`
--

INSERT INTO `comm_monitor_2_sge` (`id_communication`, `last_update`, `license`) VALUES
(1, '2012-12-15 17:59:33', '1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `comm_sge_2_ivision`
--

CREATE TABLE IF NOT EXISTS `comm_sge_2_ivision` (
  `id_comm_sge_2_ivision` int(11) NOT NULL AUTO_INCREMENT,
  `gravar_video` char(1) NOT NULL,
  PRIMARY KEY (`id_comm_sge_2_ivision`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `comm_sge_2_ivision`
--

INSERT INTO `comm_sge_2_ivision` (`id_comm_sge_2_ivision`, `gravar_video`) VALUES
(1, 'T');

-- --------------------------------------------------------

--
-- Estrutura da tabela `comm_user_2_sge_ivision`
--

CREATE TABLE IF NOT EXISTS `comm_user_2_sge_ivision` (
  `id_comm_user_2_sge_ivision` int(11) NOT NULL AUTO_INCREMENT,
  `rotulo` varchar(50) NOT NULL,
  `ip` varchar(15) NOT NULL,
  PRIMARY KEY (`id_comm_user_2_sge_ivision`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `configuracao`
--

CREATE TABLE IF NOT EXISTS `configuracao` (
  `id_configuracao` int(11) NOT NULL AUTO_INCREMENT,
  `id_especialidade` int(11) NOT NULL,
  `texto_index` longtext,
  PRIMARY KEY (`id_configuracao`),
  KEY `id_especialidade` (`id_especialidade`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `configuracao`
--

INSERT INTO `configuracao` (`id_configuracao`, `id_especialidade`, `texto_index`) VALUES
(1, 1, '<p>A prática endodontica, nos tempos atuais, exige tanto do clínico como do especialista, rapidez, efetividade, qualidade e principalmente economia. A EASY EQUIPAMENTOS ODONTOLÓGICOS desenvolveu e produziu uma completa linha de produtos para a endodontia.</p>\n\n<p>Empresa 100% nacional, a Easy é referência em inovação, atendimento e assistência técnica. A empresa se fortaleceu, agregando à sua estrutura uma parceria com o N.T.E. (Núcleo de Treinamento em Endodontia avançada), dirigido e coordenado pelo criador do sistema, o Dr.Henrique Bassi, que juntamente com sua equipe, novos materiais e equipamentos são pesquisados, desenvolvidos e testados, o que garante a eficiência e qualidade dos produtos Easy, juntamente com o permanente suporte técnico e científico ao usuário. Os produtos começaram com um protótipo físico que não passava de um motor ligado à um emaranhado de fios em uma caixa de pilhas, mas por trás dele existia muita força de vontade. Dois meses depois surgia o primeiro Easy Endo System, marcado pela simplicidade e pela promessa de se tornar a terceira geração de motores para endodontia.</p>\n\n<p>Com muita ousadia, tempos depois lançamos o mais revolucionário aparelho de endodontia, Easy Endo SI, ele é nosso maior exemplo de perfeita interação entre a indústria e a pesquisa. O SI alia eficiência e maior segurança no uso das limas rotatórias.\nHá quase 10 anos, a Easy conta com uma estrutura otimizada, novas técnicas e uma linha de produtos com 7 itens - uma grande evolução que não vai parar. Nos próximos anos, vamos criar mais opções, incorporar tecnologias de ponta e inovar em produtos de vanguarda. Através destes produtos, a empresa tem tido a grata satisfação de não apenas obter um contínuo crescimento, mas acima de tudo, poder perceber o elevado grau de satisfação de seus usuários. Além disso, os aparelhos tém sido cada vez mais adotados em diversos cursos de graduação e pós-graduação pelo Brasil e alguns países como Argentina,Chile,Venezuela e República Dominicana.</p>');

-- --------------------------------------------------------

--
-- Estrutura da tabela `consulta`
--

CREATE TABLE IF NOT EXISTS `consulta` (
  `id_consulta` int(11) NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `duracao` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_consulta`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `consulta`
--

INSERT INTO `consulta` (`id_consulta`, `data`, `hora`, `duracao`, `status`) VALUES
(1, '2013-05-31', '11:00:00', 120, 0),
(2, '2013-05-31', '09:00:00', 30, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `contato`
--

CREATE TABLE IF NOT EXISTS `contato` (
  `id_contato` int(11) NOT NULL AUTO_INCREMENT,
  `tel_fixo` varchar(14) DEFAULT NULL,
  `tel_comercial` varchar(14) DEFAULT NULL,
  `tel_celular` varchar(16) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_contato`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=133 ;

--
-- Extraindo dados da tabela `contato`
--

INSERT INTO `contato` (`id_contato`, `tel_fixo`, `tel_comercial`, `tel_celular`, `email`) VALUES
(113, '(31) 1234-5678', '(21) 1234-5678', '(11) 1-2345-6789', 'teste@teste.com'),
(114, '', '', '', ''),
(115, '', '', '', ''),
(116, '', '', '', ''),
(117, '', '', '', ''),
(118, '', '', '', ''),
(119, '', '', '', ''),
(120, '', '', '', ''),
(121, '', '', '', ''),
(122, '', '', '', ''),
(123, '', '', '', ''),
(124, '', '', '', ''),
(125, '', '', '', ''),
(126, '(31) 1234-5678', '(21) 1234-5678', '(11) 1-2345-6789', 'plano@plano.com'),
(127, '', '', '', ''),
(128, '', '', '', ''),
(129, '(31) 1234-5678', '(21) 1234-5678', '(11) 1-2345-6789', 'teste@teste.com'),
(130, '(31) 1234-5678', '(21) 1234-5678', '(11) 1-2345-6789', 'teste@teste.com'),
(131, '(31) 1234-5678', '(21) 1234-5678', '(11) 1-2345-6789', 'teste@teste.com'),
(132, '(31) 1234-5678', '(21) 1234-5678', '(11) 1-2345-6789', 'usuario@usuario.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `dentista_encaminhador`
--

CREATE TABLE IF NOT EXISTS `dentista_encaminhador` (
  `id_dentista_encaminhador` int(11) NOT NULL AUTO_INCREMENT,
  `CRO` varchar(20) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `id_contato` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_dentista_encaminhador`),
  KEY `id_de_contato` (`id_contato`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `documentos`
--

CREATE TABLE IF NOT EXISTS `documentos` (
  `id_documento` int(11) NOT NULL AUTO_INCREMENT,
  `id_pessoa` int(11) NOT NULL,
  `observacoes` varchar(500) DEFAULT NULL,
  `imagem_caminho` varchar(200) DEFAULT NULL,
  `data_documento` date DEFAULT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_documento`),
  KEY `id_do_pessoa` (`id_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE IF NOT EXISTS `endereco` (
  `id_endereco` int(11) NOT NULL AUTO_INCREMENT,
  `logradouro` varchar(45) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `complemento` varchar(45) DEFAULT NULL,
  `bairro` varchar(45) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `sigla_estado` varchar(2) DEFAULT NULL,
  `cep` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`id_endereco`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=94 ;

--
-- Extraindo dados da tabela `endereco`
--

INSERT INTO `endereco` (`id_endereco`, `logradouro`, `numero`, `complemento`, `bairro`, `cidade`, `sigla_estado`, `cep`) VALUES
(68, 'RUA DOIS', '1111111111', 'CASA', 'JARDIM', 'CATHARINES', 'ES', '31710-000'),
(71, 'RUA DOIS', '1111111111', 'CASA', 'JARDIM', 'CATHARINES', 'ES', '31710-000'),
(72, 'RUA DOIS', '1111111111', 'CASA', 'JARDIM', 'CATHARINES', 'ES', '31710-000'),
(73, 'RUA ', '1111111111', 'CASA', 'JARDIM', 'CATHARINES', 'ES', '31710-000'),
(74, 'RUA ', '1111111111', 'CASA', 'JARDIM', 'CATHARINES', 'ES', '31710-000'),
(75, 'RUA ', '1111111111', 'CASA', 'JARDIM', 'CATHARINES', 'ES', '31710-000'),
(76, '', '', '', '', '', 'MG', ''),
(77, 'RUA UM', '1111', 'CASA', 'CENTRO', 'BELO HORIZONTE', 'MG', '31710-690'),
(78, '', '', '', '', '', 'MG', ''),
(79, '', '', '', '', '', 'MG', ''),
(80, '', '', '', '', '', 'MG', ''),
(81, '', '', '', '', '', 'MG', ''),
(82, '', '', '', '', '', 'MG', ''),
(83, '', '', '', '', '', 'MG', ''),
(84, '', '', '', '', '', 'MG', ''),
(85, '', '', '', '', '', 'MG', ''),
(86, '', '', '', '', '', 'MG', ''),
(87, '', '', '', '', '', 'MG', ''),
(88, '', '', '', '', '', 'MG', ''),
(89, '', '', '', '', '', 'MG', ''),
(90, 'RUA UM', '1111', 'CASA', 'CENTRO', 'BELO HORIZONTE', 'MG', '31710-690'),
(91, 'RUA UM', '1111', 'CASA', 'CENTRO', 'BELO HORIZONTE', 'MG', '31710-690'),
(92, 'RUA UM', '1111', 'CASA', 'CENTRO', 'BELO HORIZONTE', 'MG', '31710-690'),
(93, 'RUA UM', '1111', 'CASA', 'CENTRO', 'BELO HORIZONTE', 'MG', '31710-690');

-- --------------------------------------------------------

--
-- Estrutura da tabela `er_consulta_tratamento`
--

CREATE TABLE IF NOT EXISTS `er_consulta_tratamento` (
  `id_consulta_tratamento` int(11) NOT NULL AUTO_INCREMENT,
  `id_consulta` int(11) NOT NULL,
  `id_tratamento` int(11) NOT NULL,
  PRIMARY KEY (`id_consulta_tratamento`),
  KEY `id_erct_consulta` (`id_consulta`),
  KEY `id_erct_tratamento` (`id_tratamento`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `er_consulta_tratamento`
--

INSERT INTO `er_consulta_tratamento` (`id_consulta_tratamento`, `id_consulta`, `id_tratamento`) VALUES
(1, 1, 55),
(2, 2, 63);

-- --------------------------------------------------------

--
-- Estrutura da tabela `er_especialidade_dentista`
--

CREATE TABLE IF NOT EXISTS `er_especialidade_dentista` (
  `id_especialidade_dentista` int(11) NOT NULL AUTO_INCREMENT,
  `id_dentista_encaminhador` int(11) NOT NULL,
  `id_especialidade` int(11) NOT NULL,
  PRIMARY KEY (`id_especialidade_dentista`),
  KEY `id_ered_dentista_encaminhador` (`id_dentista_encaminhador`),
  KEY `id_ered_especialidade` (`id_especialidade_dentista`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `especialidade`
--

CREATE TABLE IF NOT EXISTS `especialidade` (
  `id_especialidade` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) NOT NULL,
  PRIMARY KEY (`id_especialidade`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=40 ;

--
-- Extraindo dados da tabela `especialidade`
--

INSERT INTO `especialidade` (`id_especialidade`, `descricao`) VALUES
(1, 'Endodontia'),
(2, 'Reabilitação Oral'),
(4, 'Periodontia'),
(5, 'Implantologia'),
(6, 'Radiologia'),
(7, 'Pediatria'),
(8, 'Ortodontia'),
(9, 'Cirurgia Geral'),
(10, 'Dentistica'),
(11, 'Especialidade 01'),
(12, 'especialidade 02'),
(13, 'especialidade 03'),
(14, 'especialidade 04'),
(15, 'especialidade 05'),
(16, 'Especialidade 06'),
(17, 'Especialidade 07'),
(18, 'Especialidade 08'),
(19, 'Especialidade 09'),
(20, 'Especialidade 10'),
(21, 'Especialidade 11'),
(22, 'Especialidade 12'),
(23, 'Especialidade 13'),
(24, 'Especialidade 14'),
(25, 'Especialidade 15'),
(26, 'Especialidade 16'),
(27, 'Especialidade 17'),
(28, 'Especialidade 18'),
(29, 'Especialidade 19'),
(30, 'Especialidade 20'),
(31, 'Especialidade 21'),
(32, 'Especialidade 22'),
(33, 'Especialidade 23'),
(34, 'Especialidade 24'),
(35, 'Especialidade 26'),
(36, 'Especialidade 27'),
(37, 'Especialidade 28'),
(38, 'Especialidade 29'),
(39, 'Especialidade 30');

-- --------------------------------------------------------

--
-- Estrutura da tabela `especialidade_usuario`
--

CREATE TABLE IF NOT EXISTS `especialidade_usuario` (
  `id_pessoa` int(11) NOT NULL,
  `id_especialidade` int(11) NOT NULL,
  PRIMARY KEY (`id_pessoa`,`id_especialidade`),
  KEY `id_especialidade` (`id_especialidade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `especialidade_usuario`
--

INSERT INTO `especialidade_usuario` (`id_pessoa`, `id_especialidade`) VALUES
(57, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `imagem`
--

CREATE TABLE IF NOT EXISTS `imagem` (
  `id_imagem` int(11) NOT NULL AUTO_INCREMENT,
  `id_tratamento` int(11) DEFAULT NULL,
  `indice` int(11) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `caminho` varchar(50) NOT NULL,
  `obs` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_imagem`),
  KEY `id_img_tratamento` (`id_tratamento`),
  KEY `id_imagem` (`id_imagem`),
  KEY `id_tratamento` (`id_tratamento`),
  KEY `id_imagem_2` (`id_imagem`),
  KEY `id_tratamento_2` (`id_tratamento`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=65 ;

--
-- Extraindo dados da tabela `imagem`
--

INSERT INTO `imagem` (`id_imagem`, `id_tratamento`, `indice`, `data`, `caminho`, `obs`) VALUES
(30, 55, 2, '2013-05-22', '2205201316052169.jpg', 'Consulta padrão'),
(31, 55, 2, '2013-05-22', '2205201316052163.jpg', 'Consulta padrão'),
(32, 55, 2, '2013-05-22', '2205201316052152.jpg', 'Consulta padrão'),
(33, 55, 2, '2013-05-22', '2205201316052161.jpg', 'Consulta padrão'),
(34, 55, 2, '2013-05-22', '2205201316052173.jpg', 'Consulta padrão'),
(35, 55, 2, '2013-05-22', '2205201316052122.jpg', 'Consulta padrão'),
(36, 55, 2, '2013-05-22', '2205201316052159.jpg', 'Consulta padrão'),
(37, 55, 2, '2013-05-22', '2205201316052142.jpg', 'Consulta padrão'),
(38, 55, 2, '2013-05-22', '2205201316052189.jpg', 'Consulta padrão'),
(39, 55, 2, '2013-05-22', '2205201316052123.jpg', 'Consulta padrão'),
(40, 55, 2, '2013-05-22', '2205201318053985.jpg', 'Consulta padrão'),
(41, 55, 2, '2013-05-22', '2205201318053974.jpg', 'Consulta padrão'),
(42, 55, 2, '2013-05-22', '2205201318053987.jpg', 'Consulta padrão'),
(43, 55, 2, '2013-05-22', '2205201318053991.jpg', 'Consulta padrão'),
(44, 55, 2, '2013-05-22', '2205201318053954.jpg', 'Consulta padrão'),
(45, 55, 2, '2013-05-22', '2205201318053922.jpg', 'Consulta padrão'),
(46, 55, 2, '2013-05-22', '2205201318053922.jpg', 'Consulta padrão'),
(47, 55, 2, '2013-05-22', '2205201318053944.jpg', 'Consulta padrão'),
(48, 55, 2, '2013-05-22', '2205201318053925.jpg', 'Consulta padrão'),
(49, 55, 2, '2013-05-22', '2205201318053991.jpg', 'Consulta padrão'),
(50, 55, 2, '2013-05-22', '2205201318053966.jpg', 'Consulta padrão'),
(51, 55, 2, '2013-05-22', '2205201318053928.jpg', 'Consulta padrão'),
(52, 55, 2, '2013-05-22', '2205201318053997.jpg', 'Consulta padrão'),
(53, 55, 2, '2013-05-22', '2205201318053937.jpg', 'Consulta padrão'),
(54, 55, 2, '2013-05-22', '2205201318053990.jpg', 'Consulta padrão'),
(55, 55, 2, '2013-05-22', '2205201318053978.jpg', 'Consulta padrão'),
(56, 55, 2, '2013-05-22', '2205201318053914.jpg', 'Consulta padrão'),
(57, 55, 2, '2013-05-22', '2205201318053972.jpg', 'Consulta padrão'),
(58, 55, 2, '2013-05-22', '2205201318053914.jpg', 'Consulta padrão'),
(59, 55, 2, '2013-05-22', '2205201318053976.jpg', 'Consulta padrão'),
(60, 55, 2, '2013-05-22', '2205201318053977.jpg', 'Consulta padrão'),
(61, 55, 2, '2013-05-22', '2205201318053954.jpg', 'Consulta padrão'),
(62, 55, 2, '2013-05-22', '2205201318054012.jpg', 'Consulta padrão'),
(63, 55, 2, '2013-05-22', '2205201318054057.jpg', 'Consulta padrão'),
(64, 55, 2, '2013-05-22', '2205201318054028.jpg', 'Consulta padrão');

-- --------------------------------------------------------

--
-- Estrutura da tabela `img_parametros`
--

CREATE TABLE IF NOT EXISTS `img_parametros` (
  `id_img_parametros` int(11) NOT NULL AUTO_INCREMENT,
  `id_imagem` int(11) NOT NULL,
  PRIMARY KEY (`id_img_parametros`),
  KEY `id_imgpar_imagem` (`id_imagem`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `match_code`
--

CREATE TABLE IF NOT EXISTS `match_code` (
  `id_match_code` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(80) NOT NULL,
  `tipo` enum('TRATAMENTO','RETRATAMENTO') NOT NULL,
  `id_especialidade` int(11) NOT NULL,
  PRIMARY KEY (`id_match_code`),
  KEY `id_especialidade` (`id_especialidade`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Extraindo dados da tabela `match_code`
--

INSERT INTO `match_code` (`id_match_code`, `descricao`, `tipo`, `id_especialidade`) VALUES
(1, 'RIZOGENESE INCOMPLETA', 'TRATAMENTO', 1),
(2, 'ABCESSO AGUDO OU CRÔNICO', 'TRATAMENTO', 1),
(3, 'FINALIDADE PROTÉTICA', 'TRATAMENTO', 1),
(4, 'NECROSE PULPAR', 'TRATAMENTO', 1),
(5, 'DIAGNÓ\0STICO DE TRINCA OU FRATURA', 'TRATAMENTO', 1),
(6, 'PROCEDIMENTO PRÉ PROTÓTICO', 'TRATAMENTO', 1),
(7, 'DESCONTAMINAÇÃO POR PDT', 'TRATAMENTO', 1),
(8, 'REABSORÇÃO INTERNA OU EXTERNA', 'TRATAMENTO', 1),
(9, 'ESPAÇO PRA PINO', 'TRATAMENTO', 1),
(10, 'REMOÇÃO DE NÚCLEO METÁLICO', 'RETRATAMENTO', 1),
(11, 'REMOÇÃO DE NÚ\0CLEO DE FIBRA', 'RETRATAMENTO', 1),
(12, 'REMOÇÃ\0O DE CONE DE AG', 'RETRATAMENTO', 1),
(13, 'REMOÇÃ\0O DE LIMA FRATURADA', 'RETRATAMENTO', 1),
(14, 'VEDAMENTO DE PERFURAÇÃ\0O - MTA', 'RETRATAMENTO', 1),
(15, 'VEDAMENTO DE PERFURAÇÃO - MEMBRANA DE COLÁ\0GENO', 'RETRATAMENTO', 1),
(16, 'VEDAMENTO DE PERFURAÇÃ\0O - OUTRO', 'RETRATAMENTO', 1),
(17, 'REMOÇÃO DE COROA PROTÓ\0TICA', 'RETRATAMENTO', 1),
(18, 'CIRURGIA PERIAPICAL - CURETAGEM', 'RETRATAMENTO', 1),
(19, 'CIRURGIA PERIAPICAL - APICETOMIA', 'RETRATAMENTO', 1),
(20, 'ESPAÇ\0O PRA PINO', 'RETRATAMENTO', 1),
(21, 'CONSULTA', 'TRATAMENTO', 1),
(22, 'PROCEDIMENTO 01', 'TRATAMENTO', 1),
(23, 'PROCEDIMENTO 02', 'TRATAMENTO', 1),
(24, 'PROCEDIMENTO 03', 'TRATAMENTO', 1),
(25, 'PROCEDIMENTO 04', 'TRATAMENTO', 1),
(26, 'PROCEDIMENTO 05', 'TRATAMENTO', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `paciente`
--

CREATE TABLE IF NOT EXISTS `paciente` (
  `id_pessoa` int(11) NOT NULL AUTO_INCREMENT,
  `id_plano_saude` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `obs` varchar(500) DEFAULT NULL,
  `data_cadastro` date DEFAULT NULL,
  `num_carteira_convenio` varchar(20) DEFAULT NULL,
  `validade_carteira` varchar(10) DEFAULT NULL,
  `caminho_foto` varchar(50) DEFAULT NULL,
  `id_dentista_encaminhador` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pessoa`),
  KEY `id_p_dentista_encaminhador` (`id_dentista_encaminhador`),
  KEY `id_p_plano_saude` (`id_plano_saude`),
  KEY `id_p_pessoa` (`id_pessoa`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=70 ;

--
-- Extraindo dados da tabela `paciente`
--

INSERT INTO `paciente` (`id_pessoa`, `id_plano_saude`, `status`, `obs`, `data_cadastro`, `num_carteira_convenio`, `validade_carteira`, `caminho_foto`, `id_dentista_encaminhador`) VALUES
(58, 1, 0, '', '2013-05-22', '', '', '2205201316052539.jpg', NULL),
(59, NULL, 0, '', '2013-05-22', '', '', '2205201316053358.jpg', NULL),
(60, NULL, 0, '', '2013-05-22', '', '', '2305201315055911.jpg', NULL),
(61, NULL, 0, '', '2013-05-23', '', '', '', NULL),
(62, NULL, 0, '', '2013-05-23', '', '', '', NULL),
(63, NULL, 0, '', '2013-05-23', '', '', '', NULL),
(64, NULL, 0, '', '2013-05-23', '', '', '2305201309054621.jpg', NULL),
(65, NULL, 0, '', '2013-05-23', '', '', '', NULL),
(66, NULL, 0, '', '2013-05-23', '', '', '', NULL),
(67, NULL, 0, '', '2013-05-23', '', '', '', NULL),
(68, NULL, 0, '', '2013-05-23', '', '', '', NULL),
(69, NULL, 0, '', '2013-05-23', '', '', '', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa`
--

CREATE TABLE IF NOT EXISTS `pessoa` (
  `id_pessoa` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `sexo` enum('M','F') DEFAULT NULL,
  `rg` varchar(15) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `data_nasc` date DEFAULT NULL,
  `id_contato` int(11) DEFAULT NULL,
  `id_endereco` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pessoa`),
  KEY `id_pe_telefone` (`id_contato`),
  KEY `id_pe_endereco` (`id_endereco`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=70 ;

--
-- Extraindo dados da tabela `pessoa`
--

INSERT INTO `pessoa` (`id_pessoa`, `nome`, `sexo`, `rg`, `cpf`, `data_nasc`, `id_contato`, `id_endereco`) VALUES
(57, 'ADMINISTRADOR', 'M', '00-00.000.000', '812.333.931-38', '1990-06-05', 132, 93),
(58, 'PACIENTE 01 - PACIENTE PARA TESTE', 'M', '', '', '1990-06-05', 114, 78),
(59, 'PACIENTE 02', 'M', '', '', '1990-06-05', 115, 79),
(60, 'PACIENTE 03', '', '', '', '1990-06-05', 116, 80),
(61, 'PACIENTE 04', 'F', '', '', '1990-06-05', 117, 81),
(62, 'PACIENTE 05', 'M', '', '', '1987-05-08', 118, 82),
(63, 'PACIENTE 06', 'F', '', '', '1987-05-08', 119, 83),
(64, 'PACIENTE 07', 'M', '', '', '1987-05-08', 120, 84),
(65, 'PACIENTE 08', '', '', '', '1987-05-08', 121, 85),
(66, 'PACIENTE 09', '', '', '', '1987-05-08', 122, 86),
(67, 'PACIENTE 10', '', '', '', '1987-05-08', 123, 87),
(68, 'PACIENTE 11', '', '', '', '1987-05-08', 124, 88),
(69, 'PACIENTE 12', '', '', '', '1985-05-08', 125, 89);

-- --------------------------------------------------------

--
-- Estrutura da tabela `planosaude`
--

CREATE TABLE IF NOT EXISTS `planosaude` (
  `id_plano_saude` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(15) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `id_contato` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_plano_saude`),
  KEY `id_ps_contato` (`id_contato`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `planosaude`
--

INSERT INTO `planosaude` (`id_plano_saude`, `codigo`, `nome`, `id_contato`) VALUES
(1, '', 'PLANO 01', 126),
(2, '', 'PLANO 02', 127),
(3, '', 'PLANO 03', 128);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tratamento`
--

CREATE TABLE IF NOT EXISTS `tratamento` (
  `id_tratamento` int(11) NOT NULL AUTO_INCREMENT,
  `dente` varchar(3) NOT NULL,
  `id_pessoa` int(11) DEFAULT NULL,
  `data_inic` date NOT NULL,
  `data_term` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `id_match_code` int(11) NOT NULL,
  `descricao` varchar(500) DEFAULT NULL,
  `sucesso` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_tratamento`),
  KEY `id_trat_pessoa` (`id_pessoa`),
  KEY `id_match_code` (`id_match_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=67 ;

--
-- Extraindo dados da tabela `tratamento`
--

INSERT INTO `tratamento` (`id_tratamento`, `dente`, `id_pessoa`, `data_inic`, `data_term`, `status`, `id_match_code`, `descricao`, `sucesso`) VALUES
(55, '100', 58, '2013-05-22', NULL, 0, 21, 'Consulta padrão', 2),
(56, '100', 59, '2013-05-22', NULL, 0, 21, 'Consulta padrão', 2),
(57, '100', 60, '2013-05-22', NULL, 0, 21, 'Consulta padrão', 2),
(58, '100', 61, '2013-05-23', NULL, 0, 21, 'Consulta padrão', 2),
(59, '100', 62, '2013-05-23', NULL, 0, 21, 'Consulta padrão', 2),
(60, '100', 63, '2013-05-23', NULL, 0, 21, 'Consulta padrão', 2),
(61, '100', 64, '2013-05-23', NULL, 0, 21, 'Consulta padrão', 2),
(62, '100', 65, '2013-05-23', NULL, 0, 21, 'Consulta padrão', 2),
(63, '100', 66, '2013-05-23', NULL, 0, 21, 'Consulta padrão', 2),
(64, '100', 67, '2013-05-23', NULL, 0, 21, 'Consulta padrão', 2),
(65, '100', 68, '2013-05-23', NULL, 0, 21, 'Consulta padrão', 2),
(66, '100', 69, '2013-05-23', NULL, 0, 21, 'Consulta padrão', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id_pessoa` int(11) NOT NULL,
  `login` varchar(15) DEFAULT NULL,
  `senha` varchar(45) DEFAULT NULL,
  `tipo_acesso` varchar(20) DEFAULT NULL,
  `cro` varchar(20) NOT NULL,
  `ultimo_acesso` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pessoa`),
  KEY `id_pessoa` (`id_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id_pessoa`, `login`, `senha`, `tipo_acesso`, `cro`, `ultimo_acesso`) VALUES
(57, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Dentista', '01234567890123456789', '2013-05-23 20:54:49');

--
-- Restrições para as tabelas dumpadas
--

--
-- Restrições para a tabela `arcada_dentaria`
--
ALTER TABLE `arcada_dentaria`
  ADD CONSTRAINT `id_ad_pessoa` FOREIGN KEY (`id_pessoa`) REFERENCES `paciente` (`id_pessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `configuracao`
--
ALTER TABLE `configuracao`
  ADD CONSTRAINT `configuracao_ibfk_1` FOREIGN KEY (`id_especialidade`) REFERENCES `especialidade` (`id_especialidade`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `dentista_encaminhador`
--
ALTER TABLE `dentista_encaminhador`
  ADD CONSTRAINT `id_de_contato` FOREIGN KEY (`id_contato`) REFERENCES `contato` (`id_contato`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `documentos`
--
ALTER TABLE `documentos`
  ADD CONSTRAINT `id_do_pessoa` FOREIGN KEY (`id_pessoa`) REFERENCES `paciente` (`id_pessoa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para a tabela `er_consulta_tratamento`
--
ALTER TABLE `er_consulta_tratamento`
  ADD CONSTRAINT `id_erct_consulta` FOREIGN KEY (`id_consulta`) REFERENCES `consulta` (`id_consulta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `id_erct_tratamento` FOREIGN KEY (`id_tratamento`) REFERENCES `tratamento` (`id_tratamento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `er_especialidade_dentista`
--
ALTER TABLE `er_especialidade_dentista`
  ADD CONSTRAINT `id_ered_dentista_encaminhador` FOREIGN KEY (`id_dentista_encaminhador`) REFERENCES `dentista_encaminhador` (`id_dentista_encaminhador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `id_ered_especialidade` FOREIGN KEY (`id_especialidade_dentista`) REFERENCES `especialidade` (`id_especialidade`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `especialidade_usuario`
--
ALTER TABLE `especialidade_usuario`
  ADD CONSTRAINT `especialidade_usuario_ibfk_1` FOREIGN KEY (`id_pessoa`) REFERENCES `usuario` (`id_pessoa`),
  ADD CONSTRAINT `especialidade_usuario_ibfk_2` FOREIGN KEY (`id_especialidade`) REFERENCES `especialidade` (`id_especialidade`);

--
-- Restrições para a tabela `imagem`
--
ALTER TABLE `imagem`
  ADD CONSTRAINT `id_img_tratamento` FOREIGN KEY (`id_tratamento`) REFERENCES `tratamento` (`id_tratamento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `img_parametros`
--
ALTER TABLE `img_parametros`
  ADD CONSTRAINT `id_imgpar_imagem` FOREIGN KEY (`id_imagem`) REFERENCES `imagem` (`id_imagem`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para a tabela `match_code`
--
ALTER TABLE `match_code`
  ADD CONSTRAINT `match_code_ibfk_1` FOREIGN KEY (`id_especialidade`) REFERENCES `especialidade` (`id_especialidade`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `paciente`
--
ALTER TABLE `paciente`
  ADD CONSTRAINT `id_p_dentista_encaminhador` FOREIGN KEY (`id_dentista_encaminhador`) REFERENCES `dentista_encaminhador` (`id_dentista_encaminhador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `id_p_pessoa` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id_pessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `id_p_plano_saude` FOREIGN KEY (`id_plano_saude`) REFERENCES `planosaude` (`id_plano_saude`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `pessoa`
--
ALTER TABLE `pessoa`
  ADD CONSTRAINT `id_pe_endereco` FOREIGN KEY (`id_endereco`) REFERENCES `endereco` (`id_endereco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `id_pe_telefone` FOREIGN KEY (`id_contato`) REFERENCES `contato` (`id_contato`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `planosaude`
--
ALTER TABLE `planosaude`
  ADD CONSTRAINT `id_ps_contato` FOREIGN KEY (`id_contato`) REFERENCES `contato` (`id_contato`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `tratamento`
--
ALTER TABLE `tratamento`
  ADD CONSTRAINT `id_trat_pessoa` FOREIGN KEY (`id_pessoa`) REFERENCES `paciente` (`id_pessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tratamento_ibfk_1` FOREIGN KEY (`id_match_code`) REFERENCES `match_code` (`id_match_code`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `id_pessoa` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id_pessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
