<%@page import="java.util.List"%>
<%@page import="com.umariana.perrosserializacion.Perro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
                <%@include file="templates/header.jsp"%>
        </div>
        
        
        <div class="row">
            
            <div class="col-md-4">
                <div class="card mb-3" style="max-width: 540px;">
                            <div class="row g-0">
                              
                              <div class="col-md-12">
                                <div class="card-body">
                                  <h5 class="card-title">Insertar nuevo perro</h5>
                  
                                  
                                  <div class="card-text">
                                      <form action="SvMyServlet" method="POST">
                                           <div class="input-group mb-3">
                                                <label for="nombre" class="input-group-text">Nombre</label>
                                                <input class="form-control" type="text" id="nombre" name="nombre">
                                            </div>
                                            <div class="input-group mb-3">
                                                <label for="raza" class="input-group-text" >Raza</label><br>
                                                <input class="form-control" type="text" name="raza">
                                            </div>
                                            <div class="input-group mb-3">
                                              <label for="fotos" class="input-group-text">Foto</label>
                                              <input class="form-control" type="text" id="fotos" name="fotos">
                                            </div>
                                            <div class="input-group mb-3">
                                                <label class="input-group-text" for="puntos">puntos</label>
                                                <select class="form-select" id="puntos" name="puntos">
                                                  <option selected>0</option>
                                                  <option value="1">1</option>
                                                  <option value="2">2</option>
                                                  <option value="3">3</option>
                                                  <option value="4">4</option>
                                                  <option value="5">5</option>
                                                  <option value="6">6</option>
                                                  <option value="7">7</option>
                                                  <option value="8">8</option>
                                                  <option value="9">9</option>
                                                </select>
                                             </div>
                                            <div class="input-group mb-3">
                                              <label for="edad" class="input-group-text">Edad</label>
                                              <input class="form-control" type="text" id="edad" name="edad">
                                            </div>
                                            
                                            <input class='btn btn-success' type="submit" value="Insertar Perro">
                                        </form>
                                  </div>
                                  
                                  
                                  
                                </div>
                              </div>
                            </div>
                
                
                </div>
            </div>
            
            
                        <div class="col-md-8">
                            <%
                                // Obtener los datos de la solicitud
                                List<Perro> listadoPerrosGuardados = (List<Perro>) request.getAttribute("listadoPerrosGuardados");

                                
                            %>
                        
                        <table class="table table-dark" >
                             <thead>
                                <tr>
                                  <th scope="col">Nombre</th>
                                  <th scope="col">Raza</th>
                                  <th scope="col">Foto</th>
                                  <th scope="col">Puntos</th>
                                  <th scope="col">Edad</th>
                                  <th scope="col">Acciones</th>
                                </tr>
                              </thead>
                            
                            <tbody>
                                <%if (listadoPerrosGuardados!=null){ %>
                                    <% for (Perro perro : listadoPerrosGuardados) { %>
                                
                                <tr>
                                    <th scope="row"><%= perro.getNombre() %></th>
                                    <td><%= perro.getRaza() %></td>
                                    <td><%= perro.getImagenes() %></td>
                                    <td><%= perro.getPuntos() %></td>
                                    <td><%= perro.getEdad() %></td>
                                    <td>accion</td>
                                </tr>
                               
                              <% } %>
                                
                                <%}%>
                                
                                
                                
                            </tbody>
                        </table>

                    </div>

                </div>
                            <a href="SvMyServlet" class="btn btn-success">Ver todod los perros </a>
                
            </div>
            
            
            
        </div>
        
        <div>
             <%@include file="templates/footer.jsp"%>
        </div>
        
    </body>
</html>
