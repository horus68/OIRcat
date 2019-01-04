<!--#include file="admin/functions.asp"-->
<!--#include file="admin/config.asp"-->
<%
  strURL=strROOT & "/cgi/www.exe/[in=getpar.in]"
  strHTML=getUrl(strURL)
  valores= split(strHTML,",")
  session("portal")=valores(2)
  strURL=strROOT & "/cgi/www.exe/[in=getrates.in]?expr=MFN $"
  strHTML=getUrl(strURL)
  votos= split(strHTML,",")
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:og="http://ogp.me/ns#" xmlns:fb="http://www.facebook.com/2008/fbml" xml:lang="pt-PT" lang="pt-PT">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta name="robots" content="index, follow" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Cr�ditos - <%=stitulo%></title>
	<link rel="stylesheet" href="css/default.min.css?version=001" type="text/css" />
	<script type="text/javascript" src="js/geral.min.js"></script>
	<meta name="description" content="<%=sdescription%>" />
	<meta name="keywords" content="<%=skeywords%>" />
	<meta name="author" content="<%=sentidadelonga%>" />
	<!-- Favicon Geral -->
	<link rel="icon" type="image/x-icon" href="<%=sFAVico%>" />
	<link rel="icon" type="image/png" sizes="32x32" href="<%=sFAVicon32%>" />
	<!-- Favicon Android -->
	<link rel="manifest" href="manifest.json?v=001" />
	<meta name="theme-color" content="#cdc8b1" />
	<!-- Favicon Windows IE -->
	<meta name="msapplication-config" content="IEconfig.xml?v=001" />
	<meta name="application-name" content="<%=snomeAPP%>" />
	<meta name="msapplication-TileColor" content="#afa782" />
	<!-- Favicon iOS -->
	<link rel="apple-touch-icon-precomposed" href="<%=sFAVios%>" />
	<link rel="mask-icon" href="<%=sFAVsafari%>" color="#5bbad5" />
	<!-- Google / Search Engine Tags -->
	<meta itemprop="name" content="<%=sOGsitename%>" />
	<meta itemprop="description" content="<%=sOGdescription%>" />
	<meta itemprop="image" content="<%=sOGimage%>" />
	<!-- OpenGraph Facebook -->
	<meta property="og:image" content="<%=sOGimage%>" />
	<meta property="og:image:height" content="363" />
	<meta property="og:image:width" content="694" />
	<meta property="og:title" content="<%=sOGtitle%>" />
	<meta property="og:description" content="<%=sOGdescription%>" />
	<meta property="og:type" content="website" />
	<meta property="og:site_name" content="<%=sOGsitename%>" />
	<meta property="og:url" content="<%=surlOPAC%>" />
	<meta property="og:locale" content="pt_PT" />
</head>

<body>
	<div class="destaque1">
		<h1 style="font-variant: small-caps">Cat�logo Coletivo: <%=sentidadelonga%></h1>
	</div>
	<!-- Segmento Navega��o topo -->
	<div class="col3-contentor">
		<div class="col3">
			<p class="fil">� <a href="default.asp">Entrada</a> � Ajuda: Dicas de pesquisa</p>
		</div>
		<div class="col3" id="lblutilizador">Utilizador:
			<% if session("user")="" then response.write "Visitante" else response.write ucase(session("user"))%>
		</div>
	</div>
	<!-- Segmento Navega��o topo - FIM -->
	<br />
	<div id="principal">
		<div class="col5-contentor" style="width:100%">
			<div class="col5">
				<h3><img src="imagens/pictitulos/pic_info_alt.svg" alt="Informa��es" title="Informa��es" height="70" width="70" /><br />Informa��es sobre o cat�logo</h3>
				<dl>
					<dt>Propriedade e gest�o do cat�logo:</dt>
					<dd>
						<%=sentidadelonga%>
					</dd>
				</dl>
				<br />
				<span style="text-align:center; display: block;"><img src="<%=simglogo%>" alt="Log�tipo da Rede" title="Log�tipo da Rede" /></span>
			</div>
			<div class="col5">
				<div class="destaquetexto1">
					<h3><img src="imagens/pictitulos/pic_contacto_alt.svg" alt="Contactos da rede de bibliotecas" title="Contactos da rede de bibliotecas" height="70" width="70" /><br />Contactos</h3>
					<dl>
						<dt>Presen�a digital</dt>
						<dd>S�tio de atividades e recursos:
							<br />
							<a style="text-decoration:none" href="<%=surlPORTAL%>" target="_blank" rel="noopener"><img src="imagens/pictitulos/pic_web.svg" alt="Not�cias das bibliotecas" title="Not�cias das bibliotecas" height="32" width="32" style="vertical-align:middle" />S�tio web da rede <img src="imagens/picactions/icon_url.svg" alt="Abrir em nova janela" title="Abrir em nova janela" height="15" width="15" style="vertical-align:middle" /></a>
							<br /></dd>
						<dt>Contactos individuais das bibliotecas parceiras</dt>
						<dd>Descarregar listagem completa:
							<br />
							<a style="text-decoration:none" href="/<%=spastaOPAC%>/admin/fpdf/main.asp" target="_blank" rel="noopener"><img src="imagens/pictitulos/pic_pdf.svg" alt="Bibliotecas parceiras - PDF" title="Bibliotecas parceiras - PDF" height="32" width="32" style="vertical-align:middle" />Contactos das Bibliotecas (PDF)</a></dd>
					</dl>
					<br />
				</div>
			</div>
		</div>
		<h3><img src="imagens/pictitulos/pic_copyright_alt.svg" alt="Direitos de autor" title="Direitos de autor" height="70" width="70" /><br />Direitos de autor dos dados bibliogr�ficos</h3>
		<dl>
			<dt>Direitos de autor e de utiliza��o dos dados</dt>
			<dd>Direitos do cat�logo coletivo e conte�dos:
				<%=sentidadelonga%>
			</dd>
			<dd>� permitida a impress�o ou exporta��o dos registos bibliogr�ficos para utiliza��o individual ou por outras bibliotecas.</dd>
			<dd>N�o � permitida a comercializa��o dos registos bibliogr�ficos nem a sua disponibiliza��o em pacotes comerciais.</dd>
		</dl>
		<br />
		<h3><img src="imagens/pictitulos/pic_privacidade_alt.svg" alt="Privacidade e dados pessoais" title="Privacidade e dados pessoais" height="70" width="70" /><br />Prote��o de dados pessoais</h3>
		<p>O sistema de OPAC apenas permite a funcionalidade de pesquisa de documentos em bases de dados bibliogr�ficas. N�o existem funcionalidades de empr�stimos ou de coment�rios nem utiliza��o de dados pessoais.
		</p>
		<dl>
			<dt>Privacidade e cumprimento do Regulamento Geral da Prote��o de Dados (RGPD)</dt>
			<dd>Informa��o pessoal utilizada: n�o � utilizada qualquer informa��o pessoal de visitantes, leitores ou de t�cnicos de bibliotecas.</dd>
			<dd>Dados de utilizadores: N�o existem contas de utilizador individuais. As contas dos utilizadores institucionais n�o utilizam dados pessoais.</dd>
			<dd>Dados bibliogr�ficas s�o neutros: As bases de dados s�o fornecidas e atualizadas pelas bibliotecas parceiras de cada cat�logo.</dd>
			<dd>Contactos de bibliotecas s�o neutros e p�blicos: As informa��es sobre bibliotecas s�o dados dispon�veis publicamente e restritos a: Entidade da biblioteca, morada, telefone e endere�o de email. Estes dados foram fornecidos pelos respons�veis pelas bibliotecas listadas e s�o edit�veis pelos pr�prios utilizando a autentica��o interna da sua biblioteca.</dd>
			<dd>Informa��o de navega��o recolhida/Cookies: na opera��o do sistema na web n�o � recolhida informa��o pessoal dos visitantes. Pode existir recolha an�nima de dados atrav�s de Cookies destinados apenas ao funcionamento t�cnico do software. Ver <a style="text-decoration:none" href="<%=sguiaTEC%>/utilizadores" target="_blank" rel="noopener">mais detalhes aqui <img src="imagens/picactions/icon_url.svg" alt="Abrir em nova janela" title="Abrir em nova janela" height="15" width="15" style="vertical-align:middle" /></a></dd>
		</dl>
		<br />
		<div class="col5-contentor" style="width:100%">
			<div class="col5">
				<h3><img src="imagens/pictitulos/pic_tecnica_alt.svg" alt="Cr�ditos e tecnologia" title="Cr�ditos e tecnologia" height="70" width="70" /><br />Cr�ditos e tecnologia</h3>
				<dl>
					<dt>Cataloga��o e bases bibliogr�ficas</dt>
					<dd>Bibliotecas parceiras da
						<a style="text-decoration:none" href="<%=surlPORTAL%>" target="_top"><%=sentidadelonga%></a>
						<br /></dd>
					<dt>Tecnologia do Cat�logo:</dt>
					<dd>Software utilizado: Sistema "OIR"
						<a style="text-decoration:none" href="<%=sguiaTEC%>" target="_blank" rel="noopener"> (ver informa��es sobre o software)</a></dd>
					<dd>Recursos e cr�ditos do software:
						<a style="text-decoration:none" href="<%=sguiaTEC%>/oir/tecnologia" target="_blank" rel="noopener"> detalhes t�cnicos</a></dd>
					<dd>Desenvolvimento do software:
						<a style="text-decoration:none" href="<%=surlRBE%>" target="_blank" rel="noopener"><%=sprojetoRBE%> <br /><br /><img src="imagens/logotipo_rbe.png" alt="Rede de Bibliotecas Escolares" title="Rede de Bibliotecas Escolares" width="169" height="40" style="vertical-align:middle" hspace="3" /></a></dd>
				</dl>
				<br />
			</div>
			<div class="col5">
				<div class="destaquetexto1">
					<h3><img src="imagens/pictitulos/pic_guias_alt.svg" alt="Guias" title="Guias e Tutoriais" height="70" width="70" style="vertical-align:middle" /><br />Guias de utiliza��o</h3>
					<dl>
						<dt>Guia do utilizador (B�sico)</dt>
						<dd><a style="text-decoration:none" href="ajuda_dicas.asp"><img src="imagens/pictitulos/pic_ajuda.svg" alt="Ajuda" title="Ajuda" height="32" width="32" style="vertical-align:middle" />Ajuda: Dicas de pesquisa</a></dd>
						<dd><a style="text-decoration:none" href="ajuda_identificar.asp"><img src="imagens/pictitulos/pic_ajuda.svg" alt="Ajuda" title="Ajuda" height="32" width="32" style="vertical-align:middle" />Ajuda: Como identificar bibliotecas</a>
							<br /></dd>
						<dt>Guia do utilizador (Avan�ado)</dt>
						<dd>
							<a style="text-decoration:none" href="<%=sguiaUTILIZADOR%>" target="_blank" rel="noopener">
								<img src="imagens/pictitulos/pic_ajuda.svg" alt="S�tio de apoio a utilizadores" title="P�blico em geral - S�tio de apoio" height="32" width="32" style="vertical-align:middle" />Guias: Consulta do cat�logo pelo p�blico <img src="imagens/picactions/icon_url.svg" alt="Abrir em nova janela" title="Abrir em nova janela" height="15" width="15" style="vertical-align:middle" /></a>
							<br /></dd>
						<dt>Apoio a bibliotec�rios</dt>
						<dd>
							<a style="text-decoration:none" href="<%=sguiaTEC%>/biblio" target="_blank" rel="noopener">
								<img src="imagens/pictitulos/pic_ajuda.svg" alt="S�tio de apoio a bibliotec�rios" title="Bibliotec�rios - S�tio de apoio" height="32" width="32" style="vertical-align:middle" />Guias: Administra��o e utiliza��o do cat�logo pelos bibliotec�rios <img src="imagens/picactions/icon_url.svg" alt="Abrir em nova janela" title="Abrir em nova janela" height="15" width="15" style="vertical-align:middle" /></a>
							<br /></dd>
						<dt>Apoio a t�cnicos de inform�tica</dt>
						<dd>
							<a style="text-decoration:none" href="<%=sguiaTEC%>/tec" target="_blank" rel="noopener">
								<img src="imagens/pictitulos/pic_ajuda.svg" alt="S�tio de apoio a t�cnicos" title="T�cnicos - S�tio de apoio" height="32" width="32" style="vertical-align:middle" />Guias: Instala��o e manuten��o do cat�logo <img src="imagens/picactions/icon_url.svg" alt="Abrir em nova janela" title="Abrir em nova janela" height="15" width="15" style="vertical-align:middle" /></a></dd>
					</dl>
					<br />
				</div>
			</div>
		</div>
		<br />
		<div align="center" style="clear:both" class="txtvoltar">
			<a style="text-decoration:none" href="default.asp">
				<input type="button" name="bt2" value="Voltar" class="botao botao5" ;>
			</a>
		</div>
	</div>
	<br />
	<br />
</body>

</html>
