<!--#include file="admin/functions.asp"-->
<!--#include file="admin/config.asp"-->
<% 
   referer=request.servervariables("http_referer") 
   if referer = "" then  
		response.end
   end if
   getUrl(strROOT & "/cgi/www.exe/[in=iduser.in]")%>
<%  
			  redim u1(2,1000)
			  dim siglas
			  Set ObjectoFicheiro = CreateObject("Scripting.fileSystemObject")
			  Set LerTexto = ObjectoFicheiro.OpenTextFile (Server.MapPath("/rbcatalogo/bases/users.idx"), 1)
			  i=0
			  While NOT LerTexto.AtEndOfStream
			  linha= LerTexto.ReadLine 
			  siglas=split(linha,"=")
			  u1(0,i)=siglas(0)
			  u1(1,i)=siglas(1)
			  i=i+1
			  Wend
			  redim preserve u1(2,i)
			  redim u2(i,2)
			  for i=0 to ubound(u2)-1
			      u2(i,0)=u1(0,i)
				  u2(i,1)=u1(1,i)
			  next
			  DualSorter u2,1
			  Set LerTexto = nothing
			  'response.write i
			  'response.end
  %>
<%
  sentidadelonga = ReadIniFile(Server.MapPath("cgi/cgi.ini"), "GERAL", "entidadelonga")
  stitulo = ReadIniFile(Server.MapPath("cgi/cgi.ini"), "PORTAL", "titulo")
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:og="http://ogp.me/ns#" xmlns:fb="http://www.facebook.com/2008/fbml" xml:lang="pt-PT" lang="pt-PT">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta name="robots" content="index, follow" />
	<title>Pesquisas <%=stitulo%></title>
	<link rel="stylesheet" href="css/default.min.css?version=001" type="text/css" />
	<script language="JavaScript" src="js/geral.min.js"></script>
	<link rel="dns-prefetch" href="https://www.google-analytics.com" />
	<link rel="dns-prefetch" href="https://ajax.googleapis.com" />
	<link rel="dns-prefetch" href="https://cdnjs.cloudflare.com" />
	<link rel="dns-prefetch" href="//www.pesquisardocumentos.com" />
	<script defer="defer" type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" crossorigin="anonymous"></script>
	<script>
		if (typeof jQuery == 'undefined') {
    document.write(unescape("%3Cscript src='js/jquery.min.js' type='text/javascript'%3E%3C/script%3E"));
    } 
    </script>
	<script>
		function ChkLinkHref(tipo,formato,linha_in)
	{
	  var dim=0;
	  var tmp="",car="";
	  tmp=ConvUp(linha_in);
	  tmp=FindRepChar(unescape(tmp),"`","\"");
	  var param="/rbcatalogo/cgi/www.exe/[in=pesqger.in]?base=rbcatalogo&ut=<%=session("user")%>&formato="+formato+"&lim_inicio=1&limites=1&id=2";
		  param+="&user=<%=session("user")%>&nut=<%=session("nuser")%>&expressao=";
	  dim=tmp.length;
	  car=tmp.charAt(dim-1);
	  return(param);
	}

    function trocaobj(ob){
    var ihtml;
     ihtml="<select size=\"1\" class=\"trm\" name=\"Termo\" ><option value=\"\"></option>";
	 <%for i=0 to ubound(u1)-1%>
        ihtml +="<option value=\"<%=u2(i,0)%>\"><%=u2(i,1)%></option>";
     <%next%> 
     ihtml += "</select>";
  
    switch (ob.name)
     {
      case "PRFX": if(ob.value=="SI") document.getElementById("txtTermo").innerHTML=ihtml.replace("Termo","termo");  else document.getElementById("txtTermo").innerHTML="<input type=\"text\" size=\"59\" name=\"termo\" maxlength=\"80\">";break;
      case "PRFX1":if(ob.value=="SI") {document.getElementById("td1").innerHTML=ihtml.replace("Termo","Termo1");}  else {document.getElementById("td1").innerHTML="<input type=\"text\" size=\"59\" name=\"Termo1\" maxlength=\"80\">"};break;
      case "PRFX2":if(ob.value=="SI") {document.getElementById("td2").innerHTML=ihtml.replace("Termo","Termo2");}  else {document.getElementById("td2").innerHTML="<input type=\"text\" size=\"59\" name=\"Termo2\" maxlength=\"80\">"};break;
      case "PRFX3":if(ob.value=="SI") {document.getElementById("td3").innerHTML=ihtml.replace("Termo","Termo3");}  else {document.getElementById("td3").innerHTML="<input type=\"text\" size=\"59\" name=\"Termo3\" maxlength=\"80\">"};break;
      case "PRFX4":if(ob.value=="SI") {document.getElementById("td4").innerHTML=ihtml.replace("Termo","Termo4");}  else {document.getElementById("td4").innerHTML="<input type=\"text\" size=\"59\" name=\"Termo4\" maxlength=\"80\">"};break;
      case "PRFX5":if(ob.value=="SI") {document.getElementById("td5").innerHTML=ihtml.replace("Termo","Termo5");}  else {document.getElementById("td5").innerHTML="<input type=\"text\" size=\"59\" name=\"Termo5\" maxlength=\"80\">"};break;
      case "PRFX6":if(ob.value=="SI") {document.getElementById("td6").innerHTML=ihtml.replace("Termo","Termo6");}  else {document.getElementById("td6").innerHTML="<input type=\"text\" size=\"59\" name=\"Termo6\" maxlength=\"80\">"};break;
      case "PRFX7":if(ob.value=="SI") {document.getElementById("td7").innerHTML=ihtml.replace("Termo","Termo7");}  else {document.getElementById("td7").innerHTML="<input type=\"text\" size=\"59\" name=\"Termo7\" maxlength=\"80\">"};break;
     } 
    }
	
   function SwapFilter() {
      $('#txtfilter').html('[Tipo='+$('#tdoc :selected').text()+' ; Formato='+$('#formato :selected').text()+' ; Por pag.='+$('#limites :selected').text()+ ($('#dp').val() !=''? ' ; AP='+ $('#dp').val():'') + ($("#truncatura").length > 0 ? ($("#truncatura").is(':checked') ? ' ; Exata=sim':' ; Exata=n�o'):'')+']');
   }   
   $(document).ready(function(){ 
   //$('.radioButton').click(function() { 
      //var f=$(this).attr("checked");
      //$('.radioButton').attr("checked", true); 
      //$(this).attr("checked", f); 
   //});
   
   SwapFilter();
   $('#slickbox').hide(); 
   $('#slick-show').click(function() {
	 if ($(this).attr('src')=='imagens/picactions/icon_arrow_down.svg') {
	    url=$(this).attr('src').replace(/icon_arrow_down.svg/,'icon_arrow_up.svg');
		$(this).attr('alt','esconder filtros');
	    $(this).attr('title','esconder filtros');
     }else{
       	url=$(this).attr('src').replace(/icon_arrow_up.svg/,'icon_arrow_down.svg'); 
		$(this).attr('alt','mostrar filtros');
	    $(this).attr('title','mostrar filtros');
	 }	
	 $(this).attr('src',url);
	 $('#slickbox').toggle(400);
    return false;
   });
  });

</script>
	<meta name="description" content="Pesquisar nas bibliotecas da Rede de Bibliotecas do Concelho - XXPTO - Pesquise os documentos no OPAC e saiba onde os pode requisitar. Ler, ver, sentir e viver" />
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
		<h3>Cat�logo Coletivo: <%=sentidadelonga%>
		</h3>
	</div>
	<!-- Segmento Navega��o topo -->
	<div class="col3-contentor">
		<div class="col3">
			<p class="fil"><a href="default.asp">Entrada</a> �
				<% 
		select case request.querystring("bd")
		case "col"
		    base="rbcatalogo"
			designacao="Coletivo"
		case else
		    designacao=ucase(request("bd"))
		end select
		select case request("id")
		case 1 
		     response.write "Pesquisa orientada"
		case 0
		     response.write "Pesquisa simplificada"
		case 2
		     response.write "Pesquisa avan�ada"
		case 3
		     response.write "Pesquisa por etiquetas dos leitores"
		case 4
		     response.write "Navegar por termos"
		end select
		%>
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
	<!-- Segmento Navega��o de topo autenticado - Reservas desativado -->
	<%if Session("LoggedIn") or session("LeitorIn") then %>
	<div class="navegatopo">
		<% if session("nuser")<>"" then %>
		<a href="javascript:void(0)" onclick="javascript:alterarPin()" rel="nofollow"><img src="imagens/setnav/nav_leitor.svg" alt="Alterar o meu PIN" title="Alterar o meu PIN" border="0" height="28" width="28"/></a>
		<% end if%>
		<!--
  <%if (session("user")<>"" and session("user")<>"ADMIN") or session("nuser")<>"" then %> <a href="javascript:void(0)" onclick="javascript:build_reservas(&quot;<%=session("user")%>&quot;,&quot;<%=session("nuser")%>&quot;)" rel="nofollow"><img src="imagens/setnav/nav_reservas.svg" alt="As minhas reservas" title="As minhas reservas" border="0" height="28" width="28"/></a><br />
  <% end if%>
-->
	</div>
	<% end if%>
	<!-- Segmento Navega��o de topo autenticado FIM -->
	<div id="principal">
		<!-- Segmento Pesquisa orientada Cabe�alho -->
		<% if request.querystring("id")=1 then %>
		<form action="cgi/www.exe/[in=pesqger.in]" method="get" onSubmit="return ValidaData(this)">
			<input type="hidden" name="expressao" value>
			<input type="hidden" name="lim_inicio" value="1">
			<input type="hidden" name="nomemnu" value="catpesq.asp?bd=<%=request.querystring("bd")%>">
			<input type="hidden" name="id" value="1">
			<input type="hidden" name="base" value="<%=base%>">
			<% if Session("LoggedIn") or session("LeitorIn") then %>
			<input type="hidden" name="ut" value="<%=DecodeUTF8(session("user"))%>">
			<% else %>
			<input type="hidden" name="ut" value="guest">
			<% end if%>
			<input type="hidden" name="nut" value="<%=session("nuser")%>">
			<input type="hidden" name="ent" value="<%=session("entidade")%>">
			<!-- Segmento Pesquisa orientada Cabe�alho - FIM -->
			<!-- Segmento Pesquisa orientada Filtros -->
			Filtros: <img id="slick-show" src="imagens/picactions/icon_arrow_down.svg" alt="mostrar filtros" title="mostrar filtros" align="absmiddle" style="cursor:pointer" border="0" height="24" width="24" /><span style="font-size:0.8em;color:red;margin-left:15px" id="txtfilter"></span><br />
			<div id="slickbox" style="margin-top: 12px;">
				<div class="col4-contentor">
					<div class="col4">
						<p>Tipo de documento:<br />
							<select size="1" name="TDOC" id="tdoc" onchange="SwapFilter()">
								<option selected value="XX">Todos os documentos</option>
								<option value="AM">Monografia (Texto impresso)</option>
								<option value="BM">Monografia (Texto manuscrito)</option>
								<option value="CM">Partituras musicais - Impressas</option>
								<option value="DM">Partituras musicais - Manuscritas</option>
								<option value="EM">Material cartogr�fico - Impresso</option>
								<option value="FM">Material cartogr�fico - Manuscrito</option>
								<option value="GM">Material de proje��o e v�deo</option>
								<option value="IM">Registos sonoros n�o nusicais</option>
								<option value="JM">Registos sonoros nusicais</option>
								<option value="KM">Material gr�fico a duas dimens�es</option>
								<option value="LM">Recursos eletr�nicos</option>
								<option value="MM">Multim�dia</option>
								<option value="RM">Artefatos tridimensionais e realia</option>
								<option value="AA">Anal�tico</option>
								<option value="AS">Publica��o peri�dica</option>
							</select>
						</p>
						<p>Ano de publica��o:<br />
							<input type="text" size="4" name="DP" id="dp" maxlength="4" onchange="SwapFilter()">
						</p>
					</div>
					<div class="col4">
						<p>Formato de visualiza��o:<br />
							<select size="1" name="formato" id="formato" onchange="SwapFilter()">
								<option selected value="wiusr">Completo</option>
								<option value="wiabr">Abreviado</option>
								<option value="winp405">Norma NP405</option>
								<option value="wicmp">ISBD</option>
								<option value="witit">T�tulos</option>
								<option value="wibol">Boletim</option>
							</select>
						</p>
						<p>Resultados por p�gina:<br />
							<select size="1" name="limites" id="limites" onchange="SwapFilter()">
								<option value="5">5</option>
								<option value="10">10</option>
								<option selected value="25">25</option>
								<option value="50">50</option>
								<option value="100">100</option>
								<option value="250">250</option>
							</select>
						</p>
					</div>
				</div>
			</div>
			<br />
			<!-- Segmento Pesquisa orientada Filtros - FIM -->
			<!-- Segmento Pesquisa orientada Caixa -->
			<table>
				<th>Operador</th>
				<th>Campo</th>
				<th>Termo</th>
				<th>Truncatura</th>
				<tr>
					<td> </td>
					<td> <select size="1" name="PRFX1">
							<option selected value="AU">Autor</option>
							<option value="TI">T�tulo</option>
							<option value="AS">Assunto</option>
							<option value="COL">Cole��o</option>
							<option value="ISBN">ISBN</option>
							<option value="ISSN">ISSN</option>
							<option value="CDU">CDU</option>
							<option value="LED">Local</option>
							<option value="PAL">Palavra</option>
							<option value="CT">Cota</option>
							<option value="SI">Biblioteca</option>
						</select> </td>
					<td><input type="text" size="40" name="Termo1" maxlength="80" class="form-pesquisa" placeholder="Escrever numa caixa e/ou escolher biblioteca"> </td>
					<td><input type="checkbox" value="$" name="TR1" checked> </td>
				</tr>
				<tr>
					<td><select size="1" name="OP2">
							<option value="OR">OU</option>
							<option selected value="AND">E</option>
							<option value="AND NOT">N�O</option>
							<!--<option value="(G)">Campo</option>
							<option value="(F)">Ocorr�ncia</option>-->
						</select> </td>
					<td> <select size="1" name="PRFX2">
							<option value="AU">Autor</option>
							<option selected value="TI">T�tulo</option>
							<option value="AS">Assunto</option>
							<option value="COL">Cole��o</option>
							<option value="ISBN">ISBN</option>
							<option value="ISSN">ISSN</option>
							<option value="CDU">CDU</option>
							<option value="LED">Local</option>
							<option value="PAL">Palavra</option>
							<option value="CT">Cota</option>
							<option value="SI">Biblioteca</option>
						</select> </td>
					<td><input type="text" size="40" name="Termo2" maxlength="80" class="form-pesquisa"> </td>
					<td><input type="checkbox" value="$" name="TR2" checked> </td>
				</tr>
				<tr>
					<td> <select size="1" name="OP3">
							<option value="OR">OU</option>
							<option selected value="AND">E</option>
							<option value="AND NOT">N�O</option>
							<!--<option value="(G)">Campo</option>
							<option value="(F)">Ocorr�ncia</option>-->
						</select> </td>
					<td> <select size="1" name="PRFX3">
							<option value="AU">Autor</option>
							<option value="TI">T�tulo</option>
							<option selected value="AS">Assunto</option>
							<option value="COL">Cole��o</option>
							<option value="ISBN">ISBN</option>
							<option value="ISSN">ISSN</option>
							<option value="CDU">CDU</option>
							<option value="LED">Local</option>
							<option value="PAL">Palavra</option>
							<option value="CT">Cota</option>
							<option value="SI">Biblioteca</option>
						</select> </td>
					<td><input type="text" size="40" name="Termo3" maxlength="80" class="form-pesquisa"> </td>
					<td><input type="checkbox" value="$" name="TR3" checked> </td>
				</tr>
				<tr>
					<td><select size="1" name="OP4">
							<option value="OR">OU</option>
							<option selected value="AND">E</option>
							<option value="AND NOT">N�O</option>
							<!--<option value="(G)">Campo</option>
							<option value="(F)">Ocorr�ncia</option>-->
						</select> </td>
					<td> <select size="1" name="PRFX4">
							<option value="AU">Autor</option>
							<option value="TI">T�tulo</option>
							<option value="AS">Assunto</option>
							<option selected value="COL">Cole��o</option>
							<option value="ISBN">ISBN</option>
							<option value="ISSN">ISSN</option>
							<option value="CDU">CDU</option>
							<option value="LED">Local</option>
							<option value="PAL">Palavra</option>
							<option value="CT">Cota</option>
							<option value="SI">Biblioteca</option>
						</select> </td>
					<td><input type="text" size="40" name="Termo4" maxlength="80" class="form-pesquisa"> </td>
					<td><input type="checkbox" value="$" name="TR4" checked> </td>
				</tr>
				<tr>
					<td><select size="1" name="OP5">
							<option value="OR">OU</option>
							<option selected value="AND">E</option>
							<option value="AND NOT">N�O</option>
							<!--<option value="(G)">Campo</option>
							<option value="(F)">Ocorr�ncia</option>-->
						</select> </td>
					<td> <select size="1" name="PRFX5">
							<option value="AU">Autor</option>
							<option value="TI">T�tulo</option>
							<option value="AS">Assunto</option>
							<option value="COL">Cole��o</option>
							<option selected value="ISBN">ISBN</option>
							<option value="ISSN">ISSN</option>
							<option value="CDU">CDU</option>
							<option value="LED">Local</option>
							<option value="PAL">Palavra</option>
							<option value="CT">Cota</option>
							<option value="SI">Biblioteca</option>
						</select> </td>
					<td><input type="text" size="40" name="Termo5" maxlength="80" class="form-pesquisa"> </td>
					<td><input type="checkbox" value="$" name="TR5" checked> </td>
				</tr>
				<tr>
					<td><select size="1" name="OP6">
							<option value="OR">OU</option>
							<option selected value="AND">E</option>
							<option value="AND NOT">N�O</option>
							<!--<option value="(G)">Campo</option>
							<option value="(F)">Ocorr�ncia</option>-->
						</select> </td>
					<td> <select size="1" name="PRFX6">
							<option value="AU">Autor</option>
							<option value="TI">T�tulo</option>
							<option value="AS">Assunto</option>
							<option value="COL">Cole��o</option>
							<option value="ISBN">ISBN</option>
							<option value="ISSN">ISSN</option>
							<option value="CDU">CDU</option>
							<option value="LED">Local</option>
							<option selected value="PAL">Palavra</option>
							<option value="CT">Cota</option>
							<option value="SI">Biblioteca</option>
						</select> </td>
					<td><input type="text" size="40" name="Termo6" maxlength="80" class="form-pesquisa"> </td>
					<td><input type="checkbox" value="$" name="TR6" checked> </td>
				</tr>
				<tr>
					<td><select size="1" name="OP7">
							<option value="OR">OU</option>
							<option selected value="AND">E</option>
							<option value="AND NOT">N�O</option>
							<!--<option value="(G)">Campo</option>
							<option value="(F)">Ocorr�ncia</option>-->
						</select> </td>
					<td><select size="1" name="PRFX7">
							<option value="AU">Autor</option>
							<option value="TI">T�tulo</option>
							<option value="AS">Assunto</option>
							<option value="COL">Cole��o</option>
							<option value="ISBN">ISBN</option>
							<option value="ISSN">ISSN</option>
							<option value="CDU">CDU</option>
							<option value="LED">Local</option>
							<option value="PAL">Palavra</option>
							<option value="CT">Cota</option>
							<option selected value="SI">Biblioteca</option>
						</select> </td>
					<!--<td><input type="text" size="30" name="Termo7" maxlength="80" class="form-pesquisa"> </td>-->
					<td id="td7">
						<select name="Termo7" style="width:390px;">
							<option value=""></option>
							<%for i=1 to ubound(u2)%>
							<option value=<%=u2(i,0)%>><%=u2(i,1)%></option>
							<%next%>
						</select> </td>
					<td><input type="checkbox" value="$" name="TR7" checked> </td>
				</tr>
			</table>
			<br />
			<div align="center">
				<input type="submit" value="Pesquisar" onClick="return ValidaExpress(this.form)" name="Submit" class="botao botao1">
				<input type="reset" value="Limpar" name="Reset" class="botao botao2">
			</div>
		</form>
		<!-- Segmento Pesquisa orientada Caixa FIM -->
		<p class="info"><img src="imagens/pictitulos/pic_ajuda_alt.svg" alt="Ajuda" title="Ajuda" border="0" height="32" width="32" align="absmiddle"/> Informa��o: Esta pesquisa (orientada) permite utilizar operadores para relacionar dados em campos diferentes.
			<dl>
				<dd>Ao pesquisar deve indicar pelo menos <b>uma palavra com o m�nimo de dois carateres.</b></dd>
				<dd>Sem truncatura = Pesquisa exata. Pesquisar com a <b>marca de truncatura ativa</b> permite obter resultados mesmo sem indicar os dados completos (por exemplo quando s� conhece a parte inicial de um t�tulo ou para encontrar autores come�ados pelo mesmo nome)</dd>
				<dd>A pesquisa ser� realizada em todo o cat�logo mas <b>pode ser limitada a uma das bibliotecas</b> (ver campo de escolha de bibliotecas). </dd>
				<dd>Pode escolher uma biblioteca e pesquisar sem preencher nenhum dos outros campos: obter� <b>todos os documentos dessa biblioteca</b>.</dd>
			</dl>
		</p>
		<h4><a style="text-decoration:none" href="ajuda_dicas.asp"><img src="imagens/pictitulos/pic_questao_alt.svg" alt="D�vidas" title="D�vidas" border="0" height="22" width="22" align="absmiddle"/> D�vidas? Carregue aqui para ver dicas de pesquisa</a></h4>
		<br />
		<!-- Segmento Pesquisa simples Cabe�alho -->
		<% elseif request.QueryString("id")=0 then%>
		<form action="cgi/www.exe/[in=pesqger.in]" method="get">
			<input type="hidden" name="base" value="<%=base%>">
			<input type="hidden" name="expressao" value>
			<input type="hidden" name="html_form" value="rbcatalogo">
			<input type="hidden" name="lim_inicio" value="1">
			<input type="hidden" name="nomemnu" value="catpesq.asp?bd=<%=request.querystring("bd")%>">
			<input type="hidden" name="id" value="0">
			<% if Session("LoggedIn") or session("LeitorIn") then %>
			<input type="hidden" name="ut" value="<%=DecodeUTF8(session("user"))%>">
			<% else %>
			<input type="hidden" name="ut" value="guest">
			<% end if%>
			<input type="hidden" name="nut" value="<%=session("nuser")%>">
			<input type="hidden" name="ent" value="<%=session("entidade")%>">
			Filtros: <img id="slick-show" src="imagens/picactions/icon_arrow_down.svg" alt="mostrar filtros" title="mostrar filtros" align="absmiddle" style="cursor:pointer" border="0" height="24" width="24" /><span style="font-size:0.8em;color:red;margin-left:45px" id="txtfilter"></span><br />
			<!-- Segmento Pesquisa simples Cabe�alho - FIM -->
			<!-- Segmento Pesquisa simples Filtros -->
			<div id="slickbox" style="margin-top: 12px;">
				<div class="col4-contentor">
					<div class="col4">
						<p>Tipo de documento:<br />
							<select size="1" name="TDOC" id="tdoc" onchange="SwapFilter()">
								<option selected value="XX">Todos os documentos</option>
								<option value="AM">Monografia (Texto impresso)</option>
								<option value="BM">Monografia (Texto manuscrito)</option>
								<option value="CM">Partituras musicais - Impressas</option>
								<option value="DM">Partituras musicais - Manuscritas</option>
								<option value="EM">Material cartogr�fico - Impresso</option>
								<option value="FM">Material cartogr�fico - Manuscrito</option>
								<option value="GM">Material de proje��o e V�deo</option>
								<option value="IM">Registos sonoros n�o musicais</option>
								<option value="JM">Registos sonoros musicais</option>
								<option value="KM">Material gr�fico a duas dimens�es</option>
								<option value="LM">Recursos eletr�nicos</option>
								<option value="MM">Multim�dia</option>
								<option value="RM">Artefatos tridimensionias e realia</option>
								<option value="AA">Anal�tico</option>
								<option value="AS">Publica��o peri�dica</option>
							</select>
						</p>
						<p>Ano de publica��o:<br />
							<input type="text" size="4" name="DP" id="dp" maxlength="4" onchange="SwapFilter()">
						</p>
					</div>
					<div class="col4">
						<p>Formato de visualiza��o:<br />
							<select size="1" name="formato" id="formato" onchange="SwapFilter()">
								<option selected value="wiusr">Completo</option>
								<option value="wiabr">Abreviado</option>
								<option value="winp405">Norma NP405</option>
								<option value="wicmp">ISBD</option>
								<option value="witit">T�tulos</option>
								<option value="wibol">Boletim</option>
							</select>
						</p>
						<p>Resultados por p�gina:<br />
							<select size="1" name="limites" id="limites" onchange="SwapFilter()">
								<option value="5">5</option>
								<option value="10">10</option>
								<option selected value="25">25</option>
								<option value="50">50</option>
								<option value="100">100</option>
								<option value="250">250</option>
							</select>
						</p>
					</div>
				</div>
			</div>
			<br />
			<!-- Segmento Pesquisa simples Filtros - FIM -->
			<!-- Segmento Pesquisa simples Caixa -->
			<div class="caixapesquisa" style="width:100%">
				<h2 style="text-align:left; font-variant: small-caps">Palavra/Express�o a pesquisar</h2>
				<p>
					Ir� procurar em todas as bibliotecas por palavras presentes na descri��o do documento (t�tulo, autor, assunto, editora, etc.) <br />
					<input type="text" size="768" name="termo" id="simptrm" maxlength="80" class="form-pesquisa" placeholder="Escrever aqui...">
					<div align="center">
						<input type="submit" value="Pesquisar" onClick="return ValidaExpress_3(this.form)" name="Submit" class="botao botao1">
						<input type="reset" value="Limpar" name="Reset" class="botao botao2">
					</div>
			</div>
		</form>
		</p><br />
		<!-- Segmento Pesquisa simples Caixa FIM -->
		<p class="info"><img src="imagens/pictitulos/pic_ajuda_alt.svg" alt="Ajuda" title="Ajuda" border="0" height="32" width="32" align="absmiddle"/> Informa��o: Esta � uma pesquisa livre em <b>todos os campos da ficha do documento</b> (t�tulo, autor, etc.) e em <b>todas as bibliotecas</b>.
			<br />Ser�o encontrados registos de documentos que contenham <b>pelo menos UMA das palavras</b> que escrever.
			<br />Se carregar apenas no bot�o "Pesquisar", <b>sem introduzir qualquer texto</b>, ser�o apresentados <b>todos os documentos do cat�logo</b>.
			<br />
			<br />Para que a pesquisa seja <b>mais exata</b> (e com menos resultados), pode:
			<dl>
				<dd>Colocar aspas (") no in�cio e final da express�o a pesquisar (ou um sinal + entre cada palavra)</dd>
				<dd>Utilizar o modo de "Pesquisa orientada" (carregue acima em "ENTRADA" para voltar � p�gina de entrada do cat�logo)</dd>
			</dl>
		</p>
		<br />
		<h4><a style="text-decoration:none" href="ajuda_dicas.asp"><img src="imagens/pictitulos/pic_questao_alt.svg" alt="D�vidas" title="D�vidas" border="0" height="22" width="22" align="absmiddle"/> D�vidas? Carregue aqui para ver dicas de pesquisa</a></h4>
		<!-- Segmento Pesquisa por termos = em ficheiro separado -->
		<!-- Segmento Pesquisa por termos - FIM -->
		<!-- Segmento pesquisa etiquetas Cabe�alho -->
		<%else %>
		<form action="cgi/www.exe/[in=pesqger.in]" method="get">
			<input type="hidden" name="base" value="<%=base%>">
			<input type="hidden" name="expressao" value>
			<input type="hidden" name="lim_inicio" value="1">
			<input type="hidden" name="nomemnu" value="catpesq.asp?bd=<%=request.querystring("bd")%>">
			<input type="hidden" name="id" value="2">
			<% if Session("LoggedIn") or session("LeitorIn") then %>
			<input type="hidden" name="ut" value="<%=DecodeUTF8(session("user"))%>">
			<% else %>
			<input type="hidden" name="ut" value="guest">
			<% end if%>
			<input type="hidden" name="nut" value="<%=session("nuser")%>">
			<input type="hidden" name="ent" value="<%=session("entidade")%>">
			Filtros: <img id="slick-show" src="imagens/picactions/icon_arrow_down.svg" alt="mostrar filtros" title="mostrar filtros" align="absmiddle" style="cursor:pointer" border="0" height="24" width="24" /><span style="font-size:0.8em;color:red;margin-left:20px" id="txtfilter"></span><br />
			<!-- Segmento pesquisa etiquetas Filtros Cabe�alho - FIM -->
			<!-- Segmento pesquisa etiquetas Filtros -->
			<div id="slickbox" style="margin-top: 12px;">
				<div class="col4-contentor">
					<div class="col4">
						<p>Tipo de documento:<br />
							<select size="1" name="TDOC" id="tdoc" onchange="SwapFilter()">
								<option selected value="XX">Todos os documentos</option>
								<option value="AM">Monografia (Texto impresso)</option>
								<option value="BM">Monografia (Texto manuscrito)</option>
								<option value="CM">Partituras musicais - Impressas</option>
								<option value="DM">Partituras musicais - Manuscritas</option>
								<option value="EM">Material cartogr�fico - Impresso</option>
								<option value="FM">Material cartogr�fico - Manuscrito</option>
								<option value="GM">Material de proje��o e v�deo</option>
								<option value="IM">Registos sonoros n�o Musicais</option>
								<option value="JM">Registos sonoros Musicais</option>
								<option value="KM">Material gr�fico a duas dimens�es</option>
								<option value="LM">Recursos eletr�nicos</option>
								<option value="MM">Multim�dia</option>
								<option value="RM">Artefatos tridimensionais e realia</option>
								<option value="AA">Anal�tico</option>
								<option value="AS">Publica��o peri�dica</option>
							</select>
						</p>
						<p>Ano de publica��o:<br />
							<input type="text" size="4" name="DP" id="dp" maxlength="4" onkeyup="SwapFilter()">
						</p>
					</div>
					<div class="col4">
						<p>Formato de visualiza��o:<br />
							<select size="1" name="formato" id="formato" onchange="SwapFilter()">
								<option selected value="wiusr">Completo</option>
								<option value="wiabr">Abreviado</option>
								<option value="winp405">Norma NP405</option>
								<option value="wicmp">ISBD</option>
								<option value="witit">T�tulos</option>
								<option value="wibol">Boletim</option>
							</select>
						</p>
						<p>Resultados por p�gina:<br />
							<select size="1" name="limites" id="limites" onchange="SwapFilter()">
								<option value="5">5</option>
								<option value="10">10</option>
								<option selected value="25">25</option>
								<option value="50">50</option>
								<option value="100">100</option>
								<option value="250">250</option>
							</select></p>
						<p>&nbsp;&nbsp;&nbsp;Exata <input type="checkbox" class="checkbox" value="$" name="truncatura" id="truncatura" onclick="SwapFilter()">
						</p>
					</div>
				</div>
			</div>
			<br />
			<!-- Segmento pesquisa etiquetas Filtros - FIM -->
			<!-- Segmento Pesquisa etiquetas Caixa -->
			<div class="caixapesquisa">
				<span class="txtexp">Etiquetas de leitor</span>:
				<input type="text" size="74" name="termo" maxlength="80" class="form-pesquisa" placeholder="Escrever aqui...">
				<div align="center">
					<input type="submit" value="Pesquisar" onClick="return ValidaExpress_5(this.form)" name="Submit" class="botao botao1">
					<input type="reset" value="Limpar" name="Reset" class="botao botao2">
				</div>
			</div>

		</form>
		<!-- Segmento Pesquisa etiquetas Caixa FIM -->
		<!-- Segmento lista etiquetas -->

		<% if ucase(session("user"))="ADMIN" then
	        strHTML=getUrl(strROOT & "/cgi/www.exe/[in=gettags.in]?expr=MFN $")
	      else
	        strHTML=getUrl(strROOT & "/cgi/www.exe/[in=gettags.in]?expr=(MFN $) AND (LTR " & session("nuser") & ")")
	      end if
		  tabela=split(strHTML,",")
		  redim tmp(ubound(tabela)\2-1)
		  k=0
		  for i=0 to ubound(tabela)-1 step 2
			  tmp(k)=tabela(i)
			  k=k+1
		  next
		  alfavalores=sortArray(tmp)
		 response.write "<div style=""clear:both"">"
         response.write "<fieldset style=""padding:15px"">"
		  response.write "<legend style=""padding-bottom:10px"">Lista de etiquetas de leitor</legend>"
          response.write GenerateTagCloud (alfavalores, true)
		  'for i=0 to ubound(alfavalores)
		'	if alfavalores(i)<>"" then 			 
		'	 response.write "<span class=""tagBox-item""><a href="""
		'	 response.write "javascript:window.location.href=""javascript:chkLinkHref(0,&quot;wiusr&quot;,&quot;"&alfavalores(i)& "&quot;)"">" & alfavalores(i) & "</a></span>" 
		'	end if 
		'  next 	 
		  response.write "</fieldset>"
		  response.write "<div>"
       end if%>
	</div>
	<!-- Segmento lista etiquetas FIM -->
	<br />
	<div class="txtrodape" align="center"><a style="text-decoration:none" href="creditos.asp">Cat�logo Coletivo<br /> &copy; <b><%=sentidadelonga%></b></a>
	</div>
	<br />
</body>

</html>
