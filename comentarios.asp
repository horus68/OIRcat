<!--#include file="admin/config.asp"-->
<!--#include file="admin/functions.asp"-->
<%
 strURL=strROOT & "/cgi/www.exe/[in=getlt.in]?expressao=" & request("id")
 strHTML=decodeUTF8(getUrl(strURL))
 strURL=strROOT & "/cgi/www.exe/[in=getmaillt.in]?expressao=" & request("id")
 strMAIL=getUrl(strURL)
 tmp=split(request("mfn"),"@@")
%>
<link rel="stylesheet" href="/<%=spastaOPAC%>/css/default.min.css?version=001" type="text/css" />
<script type="text/javascript" src="/<%=spastaOPAC%>/js/geral.min.js"></script>
<script defer="defer" type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="/<%=spastaOPAC%>/js/md5.js"></script>
<script>
	function filterText(sText) {
        var reBadWords = /<%=  ReadFile(Server.MapPath("/rbcatalogo/bases/bwords.stw"))%>/gi;
        return sText.replace(reBadWords, function (sMatch) {
		  return sMatch.replace(/./g, "*");
		  });
	}

$(document).ready(function() {
	$("#live-preview-form input, #live-preview-form textarea").bind("blur keyup",function() {
		$("#lp-comment").text(filterText($("#comment").val()));
		$("#lp-comment").html($("#lp-comment").html().replace(/\n/g,"<br />"));
		$("#ftext").val(filterText($("#comment").val()));
		//name & websites 
		if($("#name").val()) {
			if($("#website").val() && /http:\/\/[A-Za-z0-9\.-]{3,}\.[A-Za-z]{2}/.test($("#website").val())) {
				$("#lp-name").html("<a href=\"" + $("#website").val() + "\">" + $("#name").val() + "</a> diz:");
			}
			else {
				$("#lp-name").text($("#name").val() + " diz:");
			}
		}
		
		//gravatar 
		if($("#email").val() && /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/.test($("#email").val())) {
				var md5Email = hex_md5($("#email").val());
				$("#lp-avatar").html("<img src=\"http://www.gravatar.com/avatar.php?gravatar_id=" + md5Email + "&size=80&rating=G&default=monsterid\" alt=\"" + $("#lp-name").val() + "\" />");
		}
		
	});
});

function check_comm(f) {
  var flag=true;
  if ($("#comment").val() == '') flag= false;
  return flag;   
}
</script>
<div id="principal" style="width:500px">
	<p style="font-size:0.8em;text-align:justify">
		AVISO IMPORTANTE: O conte�do dos coment�rios � da inteira responsabilidade do respetivo autor. 
		<br />N�o � permitida a utiliza��o de linguagem impr�pria ou inj�rias a terceiros, sob pena de suspens�o da inscri��o do utilizador.
	</p>
	<form action="/rbcatalogo/cgi/www.exe/[in=newcomm.in]" method="post">
		<input type="hidden" name="id" value="<%=request("id")%>">
		<input type="hidden" name="expr1" value="<%=tmp(0)%>">
		<input type="hidden" name="expr2" value="<%=tmp(1)%>">
		<input type="hidden" name="ftext" id="ftext" value="">
		<div><span style="float:right;margin-right:30px"><a href="javascript:void(0)" onclick="javascript:history.go(-1)"><img src="imagens/picactions/icon_close.svg" alt="Fechar janela" title="Fechar janela"  height="25" width="25"/></a></span><span style="font-size:1.1em; font-weight:bold">ADICIONAR COMENT�RIO</span>
		</div>
		<div id="live-preview-form" class="lp-block">
			<p>
				<strong>Nome:</strong>
				<br />
				<input type="text" name="name" id="name" readonly value="<%=strHTML %>" class="input" />
				<br />
				<br />
				<strong>Coment�rio:</strong>
				<br />
				<textarea name="comment" id="comment" class="input" rows="4"></textarea>
			</p>
		</div>
		<div style="float:right;margin:-5px 15px 0 0">
			<input type="submit" value=" Enviar " class="botao botao1" onclick="return check_comm(this);">
		</div>
		<div style="margin:12px 0 0 0;font-style:italic;font-size:0.9em">Antevis�o:</div>
		<div id="live-preview-display" class="lp-block" style="margin:0">
			<div id="lp-avatar"></div>
			<div id="lp-name"></div>
			<div id="lp-comment" class="wordwrap"></div>
		</div>
	</form>
</div>
