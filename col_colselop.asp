<!--#include file="admin/config.asp"-->
<!--#include file="admin/functions.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pt-PT" lang="pt-PT">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta name="robots" content="noindex, nofollow" />
	<title><%=stitulo%></title>
	<link rel="stylesheet" href="css/default.min.css?version=001" type="text/css" />
	<script type="text/javascript" src="js/users_col.min.js"></script>
	<link rel="icon" href="favicon.ico" type="image/x-icon" />
	<link rel="icon" type="image/png" sizes="32x32" href="/rbcatalogo/imagens/app/favicon-32x32.png?v=001" />
</head>

<body>
	<div class="destaque1">
		<h1 style="font-variant: small-caps">Cat�logo Coletivo: Gest�o da cole��o</h1>
	</div>
	<!-- Segmento Navega��o topo -->
	<div class="col3-contentor">
		<div class="col3">
			<p class="fil">� <a href="default.asp">Entrada</a> � <a href="col.asp?id=3">Cole��o</a> � Avalia��o das exist�ncias</p>
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
	<div id="principal">
		<div id="admbotoes" style="float:right;margin-right:30px"><a href="col.asp?id=3"><img src="imagens/picactions/icon_close.svg" height="25" width="25" border="0" title="Voltar � p�gina anterior" alt="Voltar � p�gina anterior"></a>
		</div>
			<%Set objXmlHttp = Server.CreateObject("Msxml2.ServerXMLHTTP")
			objXmlHttp.open "GET", strROOT & "/cgi/www.exe/[in=getuser.in]?expressao=SIGLA " & ucase(request("users")), False
			objXmlHttp.send
			strHTML = objXmlHttp.responseText
			if strHTML<>"" then
			siglaEXT= mid(strHTML,1,len(strHTML)-2)
			end if
		 %>
		<h3>Avalia��o das exist�ncias</h3>
		<h4>
			<% if request("criterio")="X" then  response.write "Toda a rede" else response.write "Biblioteca/Entidade: " & ucase(request("users")) & " (" & siglaEXT & ")"  end if%>
		</h4>
			<p>Nota: para uma pesquisa geral pode carregar em "Pesquisar" sem colocar qualquer crit�rio ou termo de pesquisa</p>
		<div class="col5-contentor" style="width:100%">
			<div class="col5" sstyle="min-width:50%">
				<form name="frmselcri" id="frmselcri" action="cgi/www.exe/[in=gescol.in]" method="post" onSubmit="return false">
					<input type="hidden" name="ut" value="<%=ucase(session("user"))%>">
					<input type="hidden" id="base" name="base" value="<% =lcase(request("base")) %>">
					<input type="hidden" name="lim_inicio" value="1">
					<input type="hidden" name="expressao" id="expressao" value="">
					<input type="hidden" id="op" name="op" value="<% if request("users")<>"" then response.write lcase(request("users")) else response.write "X" end if %>">
					<input type="hidden" name="entidade" id="expressao" value="<%=sentidade%>">
					<p>Selecione o crit�rio:<br />
						<select name="opges" id="opges">
							<option value="" selected>Sem crit�rio ou por palavra</option>
							<option value="AS">Por assunto</option>
							<option value="CDU">Por CDU</option>
							<option value="AU">Por autor</option>
							<option value="TI">Por t�tulo</option>
							<option value="COL">Por cole��o</option>
						</select></p>
					<p>Registos por p�gina:<br /><input type="text" size="10" id="limites" name="limites" value="25"></p>
			</div>
			<div class="col5" style="min-width:50%">
				<p>Termo a pesquisar:
					<br /><input type="text" size="50" id="termo" name="termo">
					<br />Apenas ocorr�ncias exatas: <input type="checkbox" id="PFX" name="PFX">
				</p>
			</div>
		</div>
		<div align="center"><input type="button" value="Pesquisar" class="botao botao1" onClick="getOpCol();return false;"></div>
				</form>
	</div>

</body>

</html>
