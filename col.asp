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
	<title>Análise de coleção - <%=sentidadelonga%></title>
	<link rel="stylesheet" href="css/default.min.css?version=001" type="text/css" />
	<script language="JavaScript" src="js/geral.min.js"></script>
	<script type="text/javascript" src="js/prototype.min.js"></script>
	<script type="text/javascript" src="js/tabcontent.min.js"></script>
	<script type="text/javascript" src="js/users_col.min.js"></script>
	<script type="text/javascript" src="js/md5.js"></script>
	<link rel="dns-prefetch" href="https://ajax.googleapis.com" />
	<link rel="dns-prefetch" href="https://cdnjs.cloudflare.com" />
	<link rel="dns-prefetch" href="//www.pesquisardocumentos.com" />
	<meta name="description" content="XXPTO: catálogo coletivo da Rede de Bibliotecas do Concelho. Pesquise os documentos existentes nas bibliotecas deste concelho" />
	<meta name="keywords" content="Catálogo coletivo, Bibliotecas, pesquisar biblioteca, OPAC, registo bibliográfico" />
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
	<meta property="og:title" content="XXPTO - Catálogo da Rede de Bibliotecas do concelho"/>
	<meta property="og:description" content="Pesquise os documentos e saiba rapidamente onde os pode requisitar. OPAC - XXPTO: Catálogo coletivo da Rede de Bibliotecas do Concelho. Ler, ver, sentir e viver"/>
	<meta property="og:url" content="http://www.pesquisardocumentos.com/rbcatalogo/"/>
	<meta property="og:type" content="website"/>
	<meta property="og:site_name" content="Catálogo.XXPTO - Rede de bibliotecas - XXPTO"/>
	<meta property="og:locale" content="pt_PT"/>
</head>

<body>
	<div class="destaque1">
		<h1 style="font-variant: small-caps">Catálogo Coletivo: Gestão da coleção <br />
			<%=sentidadelonga%></h1>
	</div>
	<!-- Segmento Navegação topo -->
	<div class="col3-contentor">
		<div class="col3">
			<p class="fil">» <a href="default.asp">Entrada</a> » Coleção</p>
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
	<!-- Segmento Navegação topo - FIM -->
	<br />
	<div id="principal">
		<h2><img src="imagens/pictitulos/pic_graficos_alt.svg" alt="Gráficos de análise de existências" title="Gráficos de análise de existências" border="0" height="70" width="70"/><br />
			Avaliação de existências</h2>
		<div style="margin-left:5px;">
			<form name="frmgescol" id="frmgescol" action="" method="post">
				<input type="hidden" name="ut" value="<%=ucase(session("user"))%>">
				<input type="hidden" name="base" value="rbcatalogo">
				<input type="hidden" name="lim_inicio" value="1">
				<input type="hidden" name="limites" value="9999999">
				<input type="hidden" id="mnu" name="mnu" value="">
				<input type="hidden" name="expressao" id="expressao" value="">
				<p>Gráficos e listagens da coleção:
					<br />
					<select name="criterio" id="criterio" style="width:75%">
						<option value="X" selected>[Toda a rede]</option>
						<option value="i">Existências por biblioteca ou entidade</option>
						<option value="c">Ficha CDU por biblioteca ou entidade</option>
					</select>
					<input type="button" class="botao botao1" value="Selecionar" onClick="getOp(); return false;">
				</p>
			</form>
		</div>
		<br /><br />
		<h4><img src="imagens/pictitulos/pic_ajuda_alt.svg" alt="Utilizar gráficos" title="Utilizar gráficos" border="0" height="32" width="32" align="absmiddle"/>Informações: gráficos de análise da coleção</h4>
			<p>Nas páginas de resultados desta pesquisa disporá de ícones para gráficos por entidade e biblioteca.<br />
				Estas imagens aparecem na zona superior da página, à direita:<br />
				<img src="imagens/picgraficos/graf_grafico.svg" alt="Gráficos" title="Gráficos" border="0" width="32" height="32" align="absmiddle"/> Gráficos de existências<br />
				<img src="imagens/picgraficos/graf_biblios.svg" alt="Distribuição da CDU por unidade documental" title="Quantidades por biblioteca" border="0" width="32" height="32" align="absmiddle"/> Quantidades por biblioteca<br />
				<img src="imagens/picgraficos/graf_comparativo.svg" alt="Gráfico comparativo da CDU" title="Gráfico comparativo da CDU" border="0" width="32" height="32" align="absmiddle"/> Gráfico comparativo da CDU dentro das várias bibliotecas (toda a rede ou por entidade)<br />
			</p>
			<br />
			<p><img src="imagens/pictitulos/pic_questao_alt.svg" alt="Dúvidas" title="Dúvidas" border="0" height="32" width="32" align="absmiddle"/> Saiba mais com o <a style="text-decoration:none" href="https://sites.google.com/view/pesquisarcatalogo/graficos" target="_blank"> tutorial e exemplos <img src="imagens/picactions/icon_url.svg" alt="Abrir em nova janela" title="Abrir em nova janela" border="0" height="15" width="15" align="absmiddle"/></a>
			</p>
			<br />
			<div align="center" style="clear:both" class="txtvoltar">
				<a style="text-decoration:none" href="default.asp"><input type="button" name="bt2" value="Voltar" class="botao botao5" ;></a>
			</div>
	</div>
</body>
