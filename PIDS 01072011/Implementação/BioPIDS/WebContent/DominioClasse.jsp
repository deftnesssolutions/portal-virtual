<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>22</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!------------------------------------------------------->
<link rel="stylesheet" href="CssDominioFilo/styles.css" type="text/css" />
<link rel="stylesheet" href="CssDominioFilo/styles3.css" type="text/css" />
<link rel="stylesheet" href="CssDominioFilo/styles4.css" type="text/css" />
<link rel="stylesheet" href="CssDominioFilo/styleTable.css"
	type="text/css" />

<%@ page
	import="java.sql.*,controle.Controle,java.util.ArrayList,itensParaPersistencia.Taxonomia"%>

</head>

<script language="JavaScript">
	function Cadastrar() {
		document.manter1.action = "/BioPIDS/CadastroTaxonomia";
		if (ValidarDados()) {
		document.forms.manter1.submit();
		}
	}
</script>
<script language="JavaScript">
function ValidarDados(){
		
		if (document.manter1.nome.value=="") {
			msg = "Preencha os campo corretamente!";
			alert(msg);
			document.forms.manter_filo.nome.focus();
			return false;
		}
		return true;
		
	}
</script>
<script language="JavaScript">
	function Excluir(id) {
		
			  
			msg = "Tem certeza que deseja apagar este registro?";  
			if(confirm(msg)){  
			location.href="ExclusaoTaxonomia?nome_tabela=Classe&id_item="+id+"";  
			}else {  
				 
			}  
	}  
	</script>
<body>
	<center>
		<table background="gradiente.jpg">
			<br> <img src="ueg.png" width="45" height="35" border="0">
					<h1>Sistema de Cataloga��o da Biodiversidade</h1>

					<table cellspacing="0" cellpadding="0" border="0">

						<TR>

							<TD></TD>
							<TD></TD>
							<BR>
								<TR>

									<td valign="top"><br> <br> <br> <br> <!------------------------------------------------------->
														<ul class="vert-one">
															<li><a href="Cadastro.jsp">Cadastro
																	de Esp�cimes</a>
															</li>
															<li><a href="TabBasicas.jsp"
																class="current">Manter Tabelas B�sicas</a>
															</li>
															<li><a href="ManterUsuarios.jsp">Manter
																	Usu�rios</a>
															</li>
															<li><a href="Relatorios.jsp">Relat�rios</a>
															</li>
															<li><a href="Configuracao.jsp">Configura��o</a>
															</li>

														</ul>
									</TD>

									<td>
										<table background="gradiente.jpg" height="500" width="740"
											cellspacing="3" cellpadding="0" border="0" bgcolor="#DCDCDC">

											<tr>

												<td valign="top" bgcolor="#ffffff">
												<table>
												<tr> <td>
												<font
													face="arial, verdana, helvetica">
														<div id="demo-container">
															<ul id="simple-menu">
																<li><a href="DominioColeta.jsp"><span>Coleta</span>
																</a>
																</li>
																<li><a href="DominioGeografia.jsp"><span>Geografia</span>
																</a>
																</li>
																<li><a href="Taxonomia.jsp"
																	class="current"><span>Taxonomia</span> </a>
																</li>
															</ul>
														</div> </font> <br>
														<div id="styleone">
															<ul>
																<li><a href="DominioReino.jsp">Reino</a>
																</li>
																<li><a href="DominioFilo.jsp"
																	>Filo</a></li>
																<li><a href="DominioClasse.jsp" class="current">Classe</a>
																</li>
																<li><a href="DominioSubClasse.jsp">SubClasse</a>
																</li>
																<li><a href="DominioOrdem.jsp">Ordem</a>
																</li>
																<li><a href="DominioSubOrdem.jsp">SubOrdem</a>
																</li>
																<li><a href="DominioFam�lia.jsp">Fam�lia</a>
																</li>
																<li><a href="DominioSubFamilia.jsp">SubFam�lia</a>
																</li>
																<li><a href="DominioGenero.jsp">G�nero</a>
																</li>
																<li><a href="DominioEspecie.jsp">Esp�cie</a>
																</li>
																<li><a href="DominioEpiteto.jsp">Ep�teto
																		Esp.</a>
																</li>

															</ul>
														</div> <br><hr />
															<center>
																<h4>Cadastro de Classes</h4>
															</center> <br> <! conte�do principal >
																<form method=post name=manter1>
																	<div id="tab" align="center">
																		
																			<table>

																				<tr>
																					<input type=hidden name="nome_tabela" value="Classe">
																						<TD>Filo</TD>
																						<td><SELECT name="pai">
																								<%
																									Controle ctrl = new Controle();
																									ArrayList<Taxonomia> filos = new ArrayList<Taxonomia>();
																									Taxonomia filo = new Taxonomia();
																									filo.setNomeTabela("Filo");
																									try {
																										filos = ctrl.todosOsItens(filo);
																										for (int i = 0; i < filos.size(); i++) {
																								%>
																								<OPTION VALUE="<%=filos.get(i).Id()%>"><%=filos.get(i).getNome()%>
																								</OPTION>
																								<%
																									}
																									} catch (Exception e) {
																									}
																								%>
																						</SELECT>
																					</td>
																						<td></td>
																						<TD>Filo</TD>
																						<TD><INPUT type=text name="nome">
																					</TD>
																						<td><input type=button onclick=Cadastrar()
																							value=Cadastrar></input>
																					</td>
																				</tr>
																			</table>
																		</form>

																		<br>
																			<table 
																				class="sofT" cellspacing="0">

																				<tr>
																					<td class="helpHed">Filo</td>
																					<td class="helpHed">Classe</td>
																					<td class="helpHed">Excluir</td>
																					<td class="helpHed">Alterar</td>

																				</tr>
																			</table>
																			<form method=post name=manter2>
																			<input type="hidden" name="nome_tabela" value="Classe"/>
																				<div id="tabela">

																					<table 
																					class="sofT" cellspacing="0">


																					<%
																						ArrayList<Taxonomia> classes = new ArrayList<Taxonomia>();
																						Taxonomia classe = new Taxonomia();
																						filo.setNomeTabela("Classe");

																						try {
																							filos = ctrl.todosOsItens(classe);
																							for (int i = 0; i < classes.size(); i++) {
																					%>


																					<tr>
																						<td>
																						<%Taxonomia r = new Taxonomia();
																						r.setNomeTabela("Filo");
																						r.setId(classes.get(i).getPai());
																						filo = ctrl.buscarItem(r);
																						
																						%>
																						<%=filo.getNome()%>
																						</td>
																						<td><%=classes.get(i).getNome()%></td>
																						<td><a href="#" onclick="Excluir('<%=classes.get(i).Id()%>')"><img src="excluir (1).gif" /></a>
																						</td>
																						<td><a href="#" onclick="Excluir('<%=classes.get(i).Id()%>')"><img src="edit.gif" /></a>
																						</td>
																						<td><input type="image" src="edit.gif"
																							onclick="" value="nulo">
																						</td>
																					</tr>
																					<%
																						}
																						} catch (Exception e) {
																						}
																					%>


																				</table>

																				</div>
																				</td>
														</form>
														</table>
												</td>

											</tr>
											


										</table></TD>
					</table>
					</TR>
		</table>
	</center>
	<!--------------------------------------------------------->
</body>
</html>
