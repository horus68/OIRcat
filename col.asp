<!--#include file="admin/config.asp"-->
<!--#include file="admin/functions.asp"-->
<%
  sversao = ReadIniFile(Server.MapPath("/rbcatalogo/cgi/cgi.ini"), "GERAL", "versao")
  surlRBE = ReadIniFile(Server.MapPath("/rbcatalogo/cgi/cgi.ini"), "GERAL", "urlRBE")
  surlPORTAL = ReadIniFile(Server.MapPath("/rbcatalogo/cgi/cgi.ini"), "GERAL", "urlPORTAL")
  sentidadelonga = ReadIniFile(Server.MapPath("/rbcatalogo/cgi/cgi.ini"), "GERAL", "entidadelonga")
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:og="http://ogp.me/ns#" xmlns:fb="http://www.facebook.com/2008/fbml" xml:lang="pt-PT" lang="pt-PT">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta name="robots" content="index, follow" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>An�lise de cole��o - <%=sentidadelonga%></title>
	<link rel="stylesheet" href="css/default.min.css?version=001" type="text/css" />
	<script language="JavaScript" src="js/geral.min.js"></script>
	<script type="text/javascript" src="js/prototype.min.js"></script>
	<script type="text/javascript" src="js/tabcontent.min.js"></script>
	<script type="text/javascript" src="js/users_col.min.js"></script>
	<script type="text/javascript" src="js/md5.js"></script>
	<link rel="dns-prefetch" href="https://ajax.googleapis.com" />
	<link rel="dns-prefetch" href="https://cdnjs.cloudflare.com" />
	<link rel="dns-prefetch" href="//www.pesquisardocumentos.com" />
	<meta name="description" content="XXPTO: cat�logo coletivo da Rede de Bibliotecas do Concelho. Pesquise os documentos existentes nas bibliotecas deste concelho" />
	<meta name="keywords" content="Cat�logo coletivo, Bibliotecas, pesquisar biblioteca, OPAC, registo bibliogr�fico" />
	<meta name="author" content="Rede Concelhia de Bibliotecas - XXPTO" />
	<!-- Favicon Geral -->
	<link rel="icon" href="/rbcatalogo/favicon.ico" type="image/x-icon" />
	<link rel="icon" type="image/png" sizes="32x32" href="/rbcatalogo/imagens/app/favicon-32x32.png?v=001" />
	<!-- Favicon Android -->
	<link rel="manifest" href="manifest.json?v=001" />
	<meta name="theme-color" content="#cdc8b1" />
	<!-- Favicon Windows IE -->
	<meta name="msapplication-config" content="IEconfig.xml?v=001" />
	<meta name="application-name" content="Cat.RB XXPTO" />
	<meta name="msapplication-TileColor" content="#afa782" />
	<!-- Favicon iOS -->
	<link rel="apple-touch-icon-precomposed" href="/rbcatalogo/imagens/app/apple-touch-icon-precomposed.png?v=001" />
	<link rel="mask-icon" href="/rbcatalogo/imagens/app/safari-pinned-tab.svg?v=001" color="#5bbad5" />
	<!-- OpenGraph Facebook -->
	<meta property="og:image" content="http://www.pesquisardocumentos.com/rbcatalogo/partilhasocial.png"/>
	<meta property="og:image:height" content="363"/>
	<meta property="og:image:width" content="694"/>
	<meta property="og:title" content="XXPTO - Cat�logo da Rede de Bibliotecas do concelho"/>
	<meta property="og:description" content="Pesquise os documentos e saiba rapidamente onde os pode requisitar. OPAC - XXPTO: Cat�logo coletivo da Rede de Bibliotecas do Concelho. Ler, ver, sentir e viver"/>
	<meta property="og:url" content="http://www.pesquisardocumentos.com/rbcatalogo/"/>
	<meta property="og:type" content="website"/>
	<meta property="og:site_name" content="Cat�logo.XXPTO - Rede de bibliotecas - XXPTO"/>
	<meta property="og:locale" content="pt_PT"/>
</head>

<body>
	<div class="destaque1">
		<h1 style="font-variant: small-caps">Cat�logo Coletivo: Gest�o da cole��o <br />
			<%=sentidadelonga%></h1>
	</div>
	<!-- Segmento Navega��o topo -->
	<div class="col3-contentor">
		<div class="col3">
			<p class="fil">� <a href="default.asp">Entrada</a> � Cole��o</p>
		</div>
		<div class="col3" id="lblutilizador">
			<% if session("user")="" then 
		    response.write "Utilizador: Visitante"
		  elseif session("LeitorIn") then 
		    response.write "Utilizador: " & DecodeUTF8(session("user")) 
		  else response.write "Utilizador: " & ucase(session("user")) 
		  end if%>
			<%if Session("LoggedIn") or session("LeitorIn") then%> [ <a href="logout.asp?sys=admin">Sair</a> ]
			<%end if%>
		</div>
	</div>
	<!-- Segmento Navega��o topo - FIM -->
	<br />
	<div id="principal">
		<h2><img src="imagens/pictitulos/pic_graficos_alt.svg" alt="Gr�ficos de an�lise de exist�ncias" title="Gr�ficos de an�lise de exist�ncias" border="0" height="70" width="70"/><br />
			Avalia��o de exist�ncias</h2>
		<div style="margin-left:5px;">
			<form name="frmgescol" id="frmgescol" action="" method="post">
				<input type="hidden" name="ut" value="<%=ucase(session("user"))%>">
				<input type="hidden" name="base" value="rbcatalogo">
				<input type="hidden" name="lim_inicio" value="1">
				<input type="hidden" name="limites" value="9999999">
				<input type="hidden" id="mnu" name="mnu" value="">
				<input type="hidden" name="expressao" id="expressao" value="">
				<p>Gr�ficos e listagens da cole��o:
					<br />
					<select name="criterio" id="criterio" style="width:75%">
						<option value="X" selected>[Toda a rede]</option>
						<option value="i">Exist�ncias por biblioteca ou entidade</option>
						<option value="c">Ficha CDU por biblioteca ou entidade</option>
					</select>
					<input type="button" class="botao botao1" value="Selecionar" onClick="getOp(); return false;">
				</p>
			</form>
		</div>
		<br /><br />
		<h4><img src="imagens/pictitulos/pic_ajuda_alt.svg" alt="Utilizar gr�ficos" title="Utilizar gr�ficos" border="0" height="32" width="32" align="absmiddle"/>Informa��es: gr�ficos de an�lise da cole��o</h4>
			<p>Nas p�ginas de resultados desta pesquisa dispor� de �cones para gr�ficos por entidade e biblioteca.<br />
				Estas imagens aparecem na zona superior da p�gina, � direita:<br />
				<img src="imagens/picgraficos/graf_grafico.svg" alt="Gr�ficos" title="Gr�ficos" border="0" width="32" height="32" align="absmiddle"/> Gr�ficos de exist�ncias<br />
				<img src="imagens/picgraficos/graf_biblios.svg" alt="Distribui��o da CDU por unidade documental" title="Quantidades por biblioteca" border="0" width="32" height="32" align="absmiddle"/> Quantidades por biblioteca<br />
				<img src="imagens/picgraficos/graf_comparativo.svg" alt="Gr�fico comparativo da CDU" title="Gr�fico comparativo da CDU" border="0" width="32" height="32" align="absmiddle"/> Gr�fico comparativo da CDU dentro das v�rias bibliotecas (toda a rede ou por entidade)<br />
			</p>
			<br />
			<p><img src="imagens/pictitulos/pic_questao_alt.svg" alt="D�vidas" title="D�vidas" border="0" height="32" width="32" align="absmiddle"/> Saiba mais com o <a style="text-decoration:none" href="https://sites.google.com/view/pesquisarcatalogo/graficos" target="_blank"> tutorial e exemplos <img src="imagens/picactions/icon_url.svg" alt="Abrir em nova janela" title="Abrir em nova janela" border="0" height="15" width="15" align="absmiddle"/></a>
			</p>
			<br />
			<div align="center" style="clear:both" class="txtvoltar">
				<a style="text-decoration:none" href="default.asp"><input type="button" name="bt2" value="Voltar" class="botao botao5" ;></a>
			</div>
	</div>
</body>
