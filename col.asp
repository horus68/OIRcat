<!--#include file="admin/config.asp"-->
<!--#include file="admin/functions.asp"-->
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
	<link rel="dns-prefetch" href="<%=surlOPACdominio%>" />
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
		<h2><img src="imagens/pictitulos/pic_graficos_alt.svg" alt="Gr�ficos de an�lise de exist�ncias" title="Gr�ficos de an�lise de exist�ncias" height="70" width="70"/><br />
			An�lise de cole��o</h2>
		<div class="col5-contentor" style="width:100%">
			<div class="col5" style="min-width:40%">
				<div class="destaquetexto1">
				<h3>Distribui��o por �reas (CDU)</h3>
				<p style="text-align:center;"><a href="col_cdu_rede.asp" ><img src="imagens/picgraficos/graf_comparativo.svg" alt="Comparativo CDU na rede" title="Comparativo CDU na rede" height="120" width="120" style="vertical-align:middle" /></a>
					<br />[Compara��o entre entidades da rede]
				</p>
				</div>
			</div>
			<div class="col5" style="min-width:60%">
				<h3>Gr�ficos e listagens da cole��o</h3>
				<div style="margin-left:5px;">
					<form name="frmgescol" id="frmgescol" action="" method="post">
					<input type="hidden" name="ut" value="<%=ucase(session("user"))%>">
					<input type="hidden" name="base" value="<%=ssigla%>">
					<input type="hidden" name="lim_inicio" value="1">
					<input type="hidden" name="limites" value="9999999">
					<input type="hidden" id="mnu" name="mnu" value="">
					<input type="hidden" name="expressao" id="expressao" value="">
						<p>Exist�ncias e CDU:
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
			</div>
		</div>

		<br /><br />
		<h4><img src="imagens/pictitulos/pic_ajuda_alt.svg" alt="Utilizar gr�ficos" title="Utilizar gr�ficos" height="32" width="32" style="vertical-align:middle" />Informa��es: gr�ficos para an�lise de cole��o</h4>
			<p>Nas p�ginas de resultados desta pesquisa encontra �cones para gr�ficos por entidade (grupos de bibliotecas) e bibliotecas individuais.<br />
				Estes �cones aparecem na zona superior da p�gina, � direita:<br />
				<img src="imagens/picgraficos/graf_grafico.svg" alt="Gr�ficos" title="Gr�ficos" width="32" height="32" style="vertical-align:middle" /> Gr�ficos de exist�ncias (toda a rede ou por entidade)<br />
				<img src="imagens/picgraficos/graf_biblios.svg" alt="Distribui��o CDU por biblioteca" title="Distribui��o CDU por biblioteca" width="32" height="32" style="vertical-align:middle" /> Ficha CDU: distribui��o CDU e tabela de exist�ncias (por biblioteca ou entidade)<br />
				<img src="imagens/picgraficos/graf_comparativo.svg" alt="Gr�fico comparativo da CDU" title="Gr�fico comparativo da CDU" width="32" height="32" style="vertical-align:middle" /> Gr�fico comparativo de distribui��o CDU entre bibliotecas (toda a rede ou por entidade)<br />
			</p>
			<br />
			<p><img src="imagens/pictitulos/pic_questao_alt.svg" alt="D�vidas" title="D�vidas" height="32" width="32" style="vertical-align:middle" /> Saiba mais com o <a style="text-decoration:none" href="<%=sguiaUTILIZADOR%>/graficos" target="_blank" rel="noopener"> tutorial e exemplos <img src="imagens/picactions/icon_url.svg" alt="Abrir em nova janela" title="Abrir em nova janela" height="15" width="15" style="vertical-align:middle" /></a>
			</p>
			<br />
			<div align="center" style="clear:both" class="txtvoltar">
				<a style="text-decoration:none" href="default.asp"><input type="button" name="bt2" value="Voltar" class="botao botao5" ;></a>
			</div>
	</div>
</body>
