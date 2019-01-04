<!--#include file="config.asp"-->
<!--#include file="functions.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pt-PT" lang="pt-PT">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="robots" content="noindex, nofollow" />
<link rel="stylesheet" href="/rbcatalogo/css/default.min.css?version=001"  type="text/css" />
<link rel="stylesheet" href="/rbcatalogo/js/jquery-tagbox/css/jquery.tagbox.min.css" type="text/css" />
<script type="text/javascript" src="/rbcatalogo/js/prototype.min.js"></script>
<script defer="defer" type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" crossorigin="anonymous"></script>
	<script>
		if (typeof jQuery == 'undefined') {
    document.write(unescape("%3Cscript src='../js/jquery.min.js' type='text/javascript'%3E%3C/script%3E"));
    } 
    </script>

<style>
  .quick-alert {
   margin: 1em 0;
   padding: .5em;
   background: #fffccc;
   color: #a00;
 }
</style>

<script>
  function valida(f) {
  
   var flag=true; 
   if (f.tag.value=="") {
       flag=false;
	    $("#alerta").html("<span class='quick-alert'>Aten��o! O campo n�o pode ficar vazio...</span>");
		$("#alerta").fadeIn('slow')
		$("#alerta").animate({opacity: 1.0}, 3000)
		$("#alerta").fadeOut('slow', function() {
		  $(this).hide();
		});  
	   }
   return flag;   
  }
  function cfdeltag(v) {
          var s=$("#deltag").val();		  
          url ="/rbcatalogo/cgi/www.exe/[in=deltag.in]?mfn="+v[0]+"&tag="+escape(s)+"&ltr=<%=request("user")%>&r=<%=request("nreg")%>&expr=<%=request("mfn")%>&d="+Math.random()*Math.random();	
		  window.location.href= url;
  }
  
    
  function deltag(s) {
        $("#deltag").val(s);
		url ="/rbcatalogo/cgi/www.exe/[in=chktags.in]?expr="+escape(s)+" and MFN <%=replace(request("mfn"),"@@","")%>&d="+Math.random()*Math.random();
		new Ajax.Request(url, {     
		method:"get",  
		onSuccess: function(transport){       
		var response = transport.responseText;  
		var v=response.split(",");
		if (v[0] !='') cfdeltag(v);  
		},
		onFailure: function(){ alert("Ocorreu um erro. Contacte o administrador.") }   }); 
  }
</script>
<script type="text/javascript">
window.onload = function () {
var rel = document.getElementById('forme').toBeReloaded.value; //get the current var value
if (rel==1) {
window.location.reload(); //loaded from the cache
}
else {
// retrieved from the server (reloaded)
document.getElementById('forme').toBeReloaded.value = 1;
};
}
</script>


</head>
<body >
  <div id="principal" style="width:450px">
<%

  strHTML=getUrl(strROOT & "/cgi/www.exe/[in=gettags.in]?expr=MFN " & replace(request("mfn"),"@@",""))
  valores= split(strHTML,",")
  'alfavalores= sortArray(valores)
  redim tmp(ubound(valores)\2-1,2)
  k=0
  for i=0 to ubound(valores)-1 step 2
      tmp(k,0)=valores(i)
	  tmp(k,1)=valores(i+1)
	  k=k+1
  next
  DualSorter tmp,0

  alfavalores=tmp
  'response.end
  response.write "<br />"
  response.write "<div style=float:right><input type=""image"" onclick=""window.close();"" src=""../imagens/picactions/icon_close.svg"" alt=""Fechar janela"" title=""Fechar janela"" border=""0"" height=""28"" width=""28""></div>"
  response.write "<form action=""/rbcatalogo/admin/chktag.asp"" method=""post"">"
  response.write "<input type=""hidden"" name=""mfn"" value=""" & request("mfn") & """>"
  response.write "<input type=""hidden"" name=""ip"" value=""" & request("ip") & """>"
  response.write "<input type=""hidden"" name=""ltr"" value="""& request("user") & """>"
  response.write "<input type=""hidden"" name=""nreg"" value="""& request("nreg") & """>"
  response.write "Etiquetas de leitor: <input type=""text"" value="""" name=""tag"" id=""tag""><input type=""submit"" value=""Adicionar"" class=""botao botao1"" onclick=""return valida(this.form);"">"
  response.write "</form>"
  response.write "<div id=""alerta""></div>"
  response.write "<br />"
  response.write "<fieldset style=""padding:15px"">"
  response.write "<legend style=""padding-bottom:10px"">Lista de etiquetas associadas ao registo</legend>"
  for i=0 to ubound(alfavalores)
    if alfavalores(i,0)<>"" then
     response.write "<span class=""tagBox-item"">" & alfavalores(i,0) 
	 if request("user")=alfavalores(i,1) then response.write " <a style=""text-decoration:none;background:#ff0"" href=""javascript:void(0)"" onclick=""deltag(&quot;"&alfavalores(i,0)&"&quot;)"">X</a>"
	 response.write "</span>" 
	end if 
  next 	 
  response.write "</fieldset>"
  
%>
  </div>
  <form id="forme" name="forme">
  <input type="hidden" name="toBeReloaded" id="toBeReloaded" value=0>
  <input type="hidden" id="deltag" value="">
  </form> 
  </body>
  