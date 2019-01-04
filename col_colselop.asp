<!--#include file="admin/config.asp"-->
<!--#include file="admin/functions.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:og="http://ogp.me/ns#" xmlns:fb="http://www.facebook.com/2008/fbml" xml:lang="pt-PT" lang="pt-PT">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta name="robots" content="noindex, nofollow" />
	<title>Existências - <%=stitulo%></title>
	<link rel="stylesheet" href="css/default.min.css?version=001" type="text/css" />
	<script type="text/javascript" src="js/users_col.min.js"></script>
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
		<h1 style="font-variant: small-caps">Catálogo Coletivo: Gestão da coleção</h1>
	</div>
	<!-- Segmento Navegação topo -->
	<div class="col3-contentor">
		<div class="col3">
			<p class="fil">» <a href="default.asp">Entrada</a> » <a href="col.asp?id=3">Coleção</a> » Existências</p>
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
	<div id="principal">
		<div id="admbotoes" style="float:right;margin-right:30px"><a href="col.asp?id=3"><img src="imagens/picactions/icon_close.svg" height="25" width="25" title="Voltar à página anterior" alt="Voltar à página anterior"></a>
		</div>
			<%Set objXmlHttp = Server.CreateObject("Msxml2.ServerXMLHTTP")
			objXmlHttp.open "GET", strROOT & "/cgi/www.exe/[in=getuser.in]?expressao=SIGLA " & ucase(request("users")), False
			objXmlHttp.send
			strHTML = objXmlHttp.responseText
			if strHTML<>"" then
			siglaEXT= mid(strHTML,1,len(strHTML)-2)
			end if
		 %>
		<h2><img src="imagens/pictitulos/pic_graficos_alt.svg" alt="Gráficos de análise de existências" title="Gráficos de análise de existências" height="70" width="70"/><br />Análise de existências</h2>
		<h4>
			<% if request("criterio")="X" then  response.write "Toda a rede" else response.write "Biblioteca/Entidade: " & ucase(request("users")) & " (" & siglaEXT & ")"  end if%>
		</h4>
			<p>Nota: para uma pesquisa geral pode carregar em "Pesquisar" sem colocar qualquer critério ou termo de pesquisa</p>
		<div class="col5-contentor" style="width:100%">
			<div class="col5" sstyle="min-width:50%">
				<form name="frmselcri" id="frmselcri" action="cgi/www.exe/[in=gescol.in]" method="post" onSubmit="return false">
					<input type="hidden" name="ut" value="<%=ucase(session("user"))%>">
					<input type="hidden" id="base" name="base" value="<% =lcase(request("base")) %>">
					<input type="hidden" name="lim_inicio" value="1">
					<input type="hidden" name="expressao" id="expressao" value="">
					<input type="hidden" id="op" name="op" value="<% if request("users")<>"" then response.write lcase(request("users")) else response.write "X" end if %>">
					<input type="hidden" name="entidade" id="expressao" value="<%=sentidade%>">
					<p>Selecione o critério:<br />
						<select name="opges" id="opges">
							<option value="" selected>Sem critério ou por palavra</option>
							<option value="AS">Por assunto</option>
							<option value="CDU">Por CDU</option>
							<option value="AU">Por autor</option>
							<option value="TI">Por título</option>
							<option value="COL">Por coleção</option>
						</select></p>
					<p>Registos por página:<br /><input type="text" size="10" id="limites" name="limites" value="25"></p>
			</div>
			<div class="col5" style="min-width:50%">
				<p>Termo a pesquisar:
					<br /><input type="text" size="50" id="termo" name="termo">
					<br />Apenas ocorrências exatas: <input type="checkbox" id="PFX" name="PFX">
				</p>
			</div>
		</div>
		<div align="center"><input type="button" value="Pesquisar" class="botao botao1" onClick="getOpCol();return false;">
				</form>
		</div>
	</div>

</body>

</html>
