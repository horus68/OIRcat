<!--#include file="config.asp"-->
<!--#include file="functions.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pt-PT" lang="pt-PT">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta name="robots" content="noindex, nofollow" />

	<title><%= sentidade %></title>
	<link rel="stylesheet" href="../css/default.min.css?version=001" type="text/css" />
	<script language="JavaScript" src="../js/tools.min.js"></script>
	<link rel="icon" type="image/x-icon" href="<%=sFAVico%>" />
	<link rel="icon" type="image/png" sizes="32x32" href="<%=sFAVicon32%>" />
</head>

<body>
	<div class="destaque1">
		<h1>Cat�logo Coletivo: Cat�logo individual</h1>
	</div>
	<!-- Segmento Navega��o topo -->
	<div class="col3-contentor">
		<div class="col3">
			<p class="fil">� <a href="../default.asp">Zona P�blica</a> � <a href="admin.asp">Administra��o</a> � <a href="../cgi/www.exe/[in=pleitor.in]?ut=<%= lcase(SESSION("user")) %>&expressao=
					<%= REQUEST("expressao")%>"> Leitores </a> � Defini��o de permiss�es
			</p>
		</div>
		<div class="col3" id="lblutilizador">Utilizador: <span id="utilizador">
				<%= SESSION("user") %> [ <a href="admin.asp?Logout=1">Sair</a> ]
			</span>
		</div>
	</div>
	<!-- Segmento Navega��o topo - FIM -->
	<h3><span>Defini��o de permiss�es</span></h3>
	<script>
		function validadados() {
       var status=true;
       var msgconf="";
       var msg="";
       document.getElementById("activo").value= document.getElementById("v121").checked ? "1": "0";
       if (document.getElementById("v11").value=="")
        {msg= "O campo PIN � de preenchimento obrigat�rio."; status=false;}
       if (!status) alert ("ATEN��O! Existem erros no preenchimento do formul�rio.\n\n" + msg);
        return status;
       }
	   
       function voltar(){
        var str="<%=REQUEST("expressao")%>";
       nreg = str.replace(/[a-zA-Z]/g,"");
       bib = str.replace(/[0-9]/g,"");
       window.location.href= "../cgi/www.exe/[in=pleitor.in]?ut=<%= session("user") %>&expressao="+nreg+bib;
       }
      </script>
	<div id="principal">
		<div id="admbotoes" style="float:right"><a href="javascript:voltar()"><img src="../imagens/picgest/icon_close.svg" title="Voltar � p�gina anterior" alt="Voltar � p�gina anterior" height="28" width="28"/></a></div>
		<br />
		<br />
		<form name="pinleitor" id="pinleitor" action="../cgi/www.exe/[in=novpin.in]" method="post">
			<input type="hidden" name="expressao" id="expressao" value="<%= REQUEST("expressao") %>">
			<input type="hidden" name="ut" id="ut" value="<%= SESSION("user") %>">
			<input type="hidden" name="activo" id="activo" value="">
			<fieldset class="leitor"><br />
				<%
	  	strHTML = getUrl(strROOT & "/cgi/www.exe/[in=getlt.in]?expressao=" & REQUEST("expressao"))
	  %>
				<h3 style="margin-left:50px">
					<%= DecodeUTF8(strHTML) %>
				</h3>
				<div>
					<% 
	 num = stripALPHA(REQUEST("expressao"))
	 bib = stripNUM(REQUEST("expressao"))  
	%>
					<label for "v10"><span>N.� de leitor:</span></label><input size="10" type="text" name="v10" id="v10" value="<%=num %>" readonly>
					<label for "v100" class="esp">Biblioteca: &nbsp;&nbsp;</label><input size="10" type="text" name="v100" id="v100" value="<%= bib %>" readonly>
					<label for "v11" class="esp">PIN: (4 n�meros)</label>���<input size="10" type="text" name="v11" id="v11" value="" maxlength="4">
				</div>
				<br />
				<label for "v12"><span>Ativo:</span></label><input type="radio" name="v12" id="v121" checked>Sim���<input type="radio" name="v12" id="v122">N�o<br /><br />
				<label for "v13"><span>Mensagem:</span></label><textarea type="text" name="v13" id="v13"></textarea><br /><br />
				<div align="center"><input type="submit" name="submit" value="Atualizar" class="botao botao4" onClick="return validadados();"></div><br />
			</fieldset>
		</form>
	</div>
	</div>
	<script>
		document.getElementById("v11").focus()

	</script>
</body>
