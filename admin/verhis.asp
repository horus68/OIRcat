<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pt-PT" lang="pt-PT">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="robots" content="noindex, nofollow" />
<link rel="stylesheet" href="../css/default.min.css?version=001" type="text/css" />
<script type="text/javascript" src="../js/sorttable.min.js"></script>
<script type="text/javascript" src="../js/tableH.min.js"></script>
<script type="text/javascript" src="../js/prototype.min.js"></script>
<title>Hist�rico de pesquisas</title> 

<script type="text/javascript">
onload = function() {
    window.focus();
 }
function clean_his()
{
  var ob=document.getElementById('box');
  var tabela=new Array();

  for (i=0;i<ob.length;i++)
  {
    
	 switch (ob.options[i].selected)
	 {
	 case true:
	        switch(i)
			{
            case 0:			
				if (!document.getElementsByTagName || !document.createTextNode) return;
				var rows = document.getElementById('users').getElementsByTagName('tbody')[0].getElementsByTagName('tr');
				
				var nc=0;var temp='';
				for (i = 0; i < rows.length; i++) {		    
					var chk=document.getElementById('row'+i).checked;
					if (chk) 
					{
					tabela[nc]=new Array();
					var id=rows[i].cells[0].innerText || rows[i].cells[0].textContent;
					//var termo=rows[i].cells[1].innerText || rows[i].cells[1].textContent;
					//var formato=rows[i].cells[2].innerText || rows[i].cells[2].textContent;
					//var tipodoc=rows[i].cells[3].innerText || rows[i].cells[3].textContent;
					//var ini=rows[i].cells[4].innerText || rows[i].cells[4].textContent;
					//var nreg=rows[i].cells[5].innerText || rows[i].cells[5].textContent;
					tabela[nc][0]=id;//tabela[nc][1]=termo;tabela[nc][2]=formato;tabela[nc][3]=tipodoc;tabela[nc][4]=ini;tabela[nc][5]=nreg;
					nc++;
					temp=tabela.join(",");
					
					}
				}					
				if (temp !='')
				{
					url ="/rbcatalogo/admin/clean_hist.asp?ids="+temp;
					
					new Ajax.Request(url, {    
					method:"get",  
					onSuccess: function(){ window.location.reload(true);},
					onFailure: function(){ alert("Ocorreu um erro. Contacte o administrador.") }   }); 
				}
				break;
			case 1:
				if (!document.getElementsByTagName || !document.createTextNode) return;
				var rows = document.getElementById('users').getElementsByTagName('tbody')[0].getElementsByTagName('tr');
				var nc=0;var temp='';
				for (i = 0; i < rows.length; i++) {		    
					tabela[nc]=new Array();
					var id=rows[i].cells[0].innerText || rows[i].cells[0].textContent;
					tabela[nc][0]=id;
					nc++;
					temp=tabela.join(",");
					
				}					
				if (temp !='')
				{
					url ="/rbcatalogo/admin/clean_hist.asp?ids="+temp;				
					new Ajax.Request(url, {    
					method:"get",  
					onSuccess: function(){ window.location.reload(true);},
					onFailure: function(){ alert("Ocorreu um erro. Contacte o administrador.") }   }); 
				}

				break;
			}
			break;
	  }	
	}
	
 	
}

 
 function usar_pesquisa(r)
 { 
   
	if (!document.getElementsByTagName || !document.createTextNode) return;
    var rows = document.getElementById('users').getElementsByTagName('tbody')[0].getElementsByTagName('tr');
    for (i = 0; i < rows.length; i++) {
        //rows[i].onclick = function() {
		  
		    var pos; var fim; var str;
			var nrow=rows[i].cells[0].innerText || rows[i].cells[0].textContent;
			if (r==nrow-1)
			{
			var termo=rows[i].cells[1].innerText || rows[i].cells[1].textContent;
			var formato=rows[i].cells[2].innerText || rows[i].cells[2].textContent;
			var tipodoc=rows[i].cells[3].innerText || rows[i].cells[3].textContent;
			var ini=rows[i].cells[4].innerText || rows[i].cells[4].textContent;
			var nreg=rows[i].cells[5].innerText || rows[i].cells[5].textContent;
			termo= termo.replace("(...)","$");
			switch (tipodoc)
			{
			case "Todos": tipodoc="XX";
			              break;
			case "Monografias (I)": tipodoc="AM";
			              break;	
			case "Monografias (M)": tipodoc="BM";
			              break;							  
			case "Partituras (I)": tipodoc="CM";
			              break;	
			case "Partituras (M)": tipodoc="DM";
			              break;	
			case "Material cartogr�fico (I)": tipodoc="EM";
			              break;	
			case "Material cartogr�fico (M)": tipodoc="FM";
			              break;	
			case "Proje��o e v�deo": tipodoc="GM";
			              break;							  
			case "Sonoros n�o musical":tipodoc="IM";
                          break;
			case "Sonoros musicais":tipodoc="JM";
                          break;
			case "Material gr�fico 2D":tipodoc="KM";
                          break;
			case "Recursos eletr�nicos":tipodoc="LM";
                          break;
			case "Peri�dicos":tipodoc="AS";
                          break;		
			case "Anal�ticos":tipodoc="AA";
                          break;	
			case "Miscel�nea":tipodoc="AC";
                          break;
			case "Recurso integrante":tipodoc="AI";
                          break;
			case "Multim�dia":tipodoc="MM";
                          break;
			case "Artefactos 3D e realia":tipodoc="RM";
                          break;						  
			case "N�o definido":tipodoc="";
						  break;
			}		
			switch (termo)
			{
			case "Qualquer termo": termo="$";
			              break;
			}
			switch (formato)
			{
			case "Completo": formato="wiusr";
			              break;		
			case "Abreviado": formato="wiabr";
			              break;		
			case "Boletim": formato="wibol";
			              break;		
			case "NP 405": formato="winp405";
			              break;		
			case "T�tulos": formato="witit";
			              break;		
			case "ISBD" : formato="wicmp";
                           break;			
						  
			}
			
            strUrl = window.opener.location.href;
			
			if (termo.indexOf('(...)') != -1 ) 
			{  
			  temp=termo.split(' (...)');
			  str=temp.join("$");
			  termo=str;
			  
			  
			}  
            
			pos= strUrl.indexOf("expressao=");
			fim= strUrl.indexOf("&",pos+9);
			str= strUrl.substr(pos+10,fim-pos-10);
			strUrl = strUrl.replace(str,termo);
			
			pos= strUrl.indexOf("TDOC=");
			if (pos !=-1)
			{
			fim= strUrl.indexOf("&",pos+4);
			str= strUrl.substr(pos+5,fim-pos-5);
			strUrl = strUrl.replace(str,tipodoc);
			}
			pos= strUrl.indexOf("lim_inicio=");
			fim= strUrl.indexOf("&",pos+10);
			str= strUrl.substr(pos+11,fim-pos-11);
			strUrl = strUrl.replace(str,ini);
			
			pos= strUrl.indexOf("limites=");
			fim= strUrl.indexOf("&",pos+7);
			str= strUrl.substr(pos+8,fim-pos-8);
			strUrl = strUrl.replace(str,nreg);
			
            pos= strUrl.indexOf("formato=");
			fim= strUrl.indexOf("&",pos+7);
			str= strUrl.substr(pos+8,fim-pos-8);
			strUrl = strUrl.replace(str,formato);

			window.opener.location.href = strUrl.substr(0,strUrl.length-1);
			
			  if (window.opener.progressWindow)
				{
				window.opener.progressWindow.close()
				}
			  window.close();
			}
    }		

}
</script>
	<link rel="icon" type="image/x-icon" href="/rbcatalogo/favicon.ico" />
	<link rel="icon" type="image/png" sizes="32x32" href="/rbcatalogo/imagens/app/favicon-32x32.png" />
</head>

<body  style="margin-left:10px;text-align:left">
		<p style="font: bold 10pt Arial ">Hist�rico de pesquisas</p>
		<%
		Dim histArray 
		Dim histMaxUsed
		histArray = Session("histArray")
		histMaxUsed = Session("histMaxUsed")
        'chave="AU ,TI ,DP ,COL ,CDU ,AS "
        'eti=split(chave,",")		
		if histMaxUsed <>"" then
            if histMaxUsed =-1 then
				response.write "<h3><center>[Hist�rico vazio]</center></h3>"		
			else
                response.write "<form name=""frmtabela"" id=""frmTabela"" method=""post"" action="""">"
                response.write "<div style=""padding-right:5px;"">A��es: <select   name=""box"" id=""box""><option value=""1"">Apagar marcadas</option><option value=""2"">Apagar todas</option></select><input type=""button"" class=""botao botao1"" onclick=""javascript:clean_his()"" value=""Ok""></div>"       
                response.write "</form>"
				response.write "<table class=""sortable"" id=""users"" summary=""Hist�rico de pesquisa"">"	
				response.write "<tr><th>ID</th><th>Express�o de pesquisa</th><th>Formato</th><th>Tipo de documento</th><th align=""center"">In�cio</th><th align=""center"">Reg/p�g.</th><th></th><th></th></tr>"		
				for i=0 to histMaxUsed 
				  select case  histArray(1,i)
				  case "XX"
				     tdoc="Todos"
				  case "AM"
				     tdoc="Monografias(I)"
				 case "BM"
				     tdoc="Monografias(M)"
				 case "CM"
				     tdoc="Partituras (I)"
				case "DM"
				     tdoc="Partituras (M)"
				case "EM"
				     tdoc="Material cartogr�fico (I)"
				case "FM"
				     tdoc="Material cartogr�fico (M)"
				case "GM"
				     tdoc="Proje��o e v�deo"
				case "IM"
				     tdoc="Registos �udio"
				case "JM"
				     tdoc="Registos musicais"
				case "KM"
				     tdoc="Materila gr�fico 2D"
				case "LM"
				     tdoc="Produtos de computador"
				case "MM"
				     tdoc="Multim�dia"
				case "RM"
				     tdoc="Artefactos 3D e realia"
				  case "AS"
				     tdoc="Peri�dicos"		  
				  case "AA"
				     tdoc="Anal�ticos"
				  case "AI"
				     tdoc="Recurso integrante"		  
				  case "AC"
				     tdoc="Miscel�nea"
				  case else
				     tdoc="N�o definido"
				  end select 	 
				  select case  histArray(0,i)
				  case "$"
				     termo="Qualquer termo"
					 criterio="Em qualquer campo"
				  case else
                     
					 termo= histArray(0,i)
		'			 flag_e=false
		'			 for k=0 to ubound(eti)-1
		'			    pos=instr(termo,eti(k))
		'				
		'				if pos>0 then 
		'				   ind=k
		'				   flag_e=true
         '                  exit for
			'			end if   
			'		 next	
'
'					 if flag_e then 
'					    etiqueta=eti(ind)
'						termo=trim(mid(termo,pos+len(etiqueta)))
'						etiqueta=trim(etiqueta)
'					 else 
'					    etiqueta=""
'					 end if
'					 if right(termo,1)="$" then
'					    dim exp
'					    exp=split(termo,"AND")
'						temp= join(exp,"(...) AND ")
 '                       exp= split(termo,"OR")
  '						temp= join(exp,"(...) OR")
'						termo=temp
'					    termo=left(termo,len(termo)-1) & " (...)"					 
'					 end if
                     termo= replace(termo,"$", " (...)") 
'					 if instr(chave,etiqueta)>0 then
'						select case etiqueta
'						case "AU"
'							criterio="No campo AUTOR"
'						case "TI"
'							criterio="No campo T�TULO"
'						case "AS"
'							criterio="No campo ASSUNTO"
'						case "COL"
'							criterio="No campo COLE��O"
'						case "DP"
'							criterio="No campo DATA DE PUBLICA��O"
'						case "CDU"
'							criterio="No campo CDU"
'						end select	
'					else
'					    criterio="Em qualquer campo"
'					end if
			
				  end select
				  select case  histArray(4,i)
				  case "wiusr"
				      formato="Completo"
				  case "wiabr"
				      formato="Abreviado"
				  case "winp405"
				      formato="NP 405"
				  case "wibol"
				      formato="Boletim"
				  case "wicmp"
				      formato="ISBD"
				  case "witit"
				      formato="T�tulos"					  
				  end select
				  response.write "<tr><td>"& i+1 &"</td><td>" & termo & "</td><td>"& formato &"</td><td>"& tdoc &"</td><td align=""center"">"& histArray(2,i) & "</td><TD align=""center"">"&histArray(3,i)&"</td><td><input type=""checkbox"" name=""row" & i & """ id=""row" & i & """ ></td><td><img onclick=""javascript:usar_pesquisa("& i &")"" style=""cursor:pointer"" src=""../imagens/picactions/icon_refresh.svg"" title=""Usar pesquisa"" height=""22"" width=""22""></td></tr>"
				next
				response.write "</table>"
            end if			
		else 
				response.write "<br /><br /><h3><center>Sess�o terminada (Hist�rico vazio)</center></h3>"		
			
		end if	
		%>		
</body>