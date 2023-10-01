
<%@page import="com.umariana.seralizacionperro.ExposicionPerros"%>
<%@page import="com.umariana.seralizacionperro.Perro"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%@include file= "templates/header.jsp" %>


<div class="container p-4"> <!-- clase contenedora -->
    <div class="row">
        <img src="imagenes/logo.jpg" class="img-fluid max-height-100" alt="Banner">  
        <div class="col-md-4">  <!-- clase division por 4 columnas -->
            <div class="card card-body"> 
                <!-- tarjeta de trabajo -->
                <h3>Insertar nuevo perro</h3>
                <!-- Enctype sirve para subir archivos-->
                <form action="SvPerro" method="POST" enctype="multipart/form-data" > 
                    <!-- Input para el nombre-->
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="nombre">Nombre:</label>
                        <input type="text" name ="nombre" class="form-control">
                    </div>                                            
                    <!-- Input para la raza-->
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="raza">Raza:</label>
                        <input type="text" name="raza" class="form-control">
                    </div>
                    <!-- Input para la foto-->
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="imagen">Imagen:</label>
                        <input type="file" name="imagen" class="form-control"  >
                    </div>
                    <!-- Input para los puntos-->                   
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="puntos">Puntos:</label>
                        <select name="puntos" class="form-select" >
                            <option selected>Selecione...</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>                          
                        </select>                  
                    </div>
                    <!-- Input para la edad-->
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="edad">Edad:</label>
                        <input type="text" name="edad"  class="form-control"   >
                    </div>
                    <input type="submit" value="Agregar perro" class ="form-control"/>
                </form><br>


                
            </div>    
        </div> 
        <!-- Tabla de datos -->


        <div class="col-md-8">
            <nav class="navbar navbar-dark bg-dark">
                <div class="container-fluid">
                    <a class="navbar-brand">Buscar por nombre:</a>
                    <form class="d-flex" action="SvPerro" method="get">
                        <input class="form-control me-2" type="search" name="nombre" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Buscar</button>
                    </form>
                </div>
            </nav>
            <table class="table table-bordered table-dark">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Raza</th>
                        <th>Imagen</th>
                        <th>Puntos</th>
                        <th>Edad</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Obtener array list de la solicitud utilizando el método cargarPerros
                        ServletContext context = request.getServletContext();
                        ArrayList<Perro> darPerros = ExposicionPerros.cargarPerros(context);

                        // Recorrido de la lista y asignacion de los datos en las casillas
                        if (darPerros != null) {
                            for (Perro perro : darPerros) {
                    %>
                    <tr>
                        <td><%= perro.getNombre()%></td>
                        <td><%= perro.getRaza()%></td>
                        <td><%= perro.getImagen()%></td>
                        <td><%= perro.getPuntos()%></td>
                        <td><%= perro.getEdad()%></td>
                        <td>
                            <!-- Agrega íconos FontAwesome para vista, editar y borrar -->
                            <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-nombre="<%= perro.getNombre()%>"><i class="fas fa-eye"></i></a> <!-- Icono para vista -->
                            <i class="fas fa-pencil-alt"></i> <!-- Icono para editar -->
                            <a href="#" onclick="eliminarPerro('<%= perro.getNombre()%>');" class="btn btn-danger"><i class="fas fa-trash-alt"></i></a>

                        </td>

                    </tr>
                    <%
                            }
                        }
                    %>
                </tbody> 
            </table>
        </div>
    </div>  
</div>    

<!-- ventana Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Detalles del Perro</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div id="perro-details">
                    <!-- Aqui se mostraran los detalles del perro -->
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>

<script>
    // funcion para mostrar los datos en la ventana modal
    $('#exampleModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Botón que desencadenó el evento
        var nombre = button.data('nombre'); // Obtén el nombre del perro

        // Realiza una solicitud AJAX al servlet para obtener los detalles del perro por su nombre
        $.ajax({
            url: 'SvPerro?nombre=' + nombre, // Cambia 'id' por el nombre del parámetro que esperas en tu servlet
            method: 'GET',
            success: function (data) {
                // Actualiza el contenido del modal con los detalles del perro
                $('#perro-details').html(data);
            },
            error: function () {
                // Maneja errores aquí si es necesario
                console.log('Error al cargar los detalles del perro.');
            }
        });
    });

</script>



<%@include file= "templates/fooder.jsp" %>