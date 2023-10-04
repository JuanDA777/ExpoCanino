
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
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container-fluid">
                  <a class="navbar-brand">Organizador</a>
                  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                  </button>
                  <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                      
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" >
                          Ordenamientos
                        </a>
                        <ul class="dropdown-menu">
                          <li><a class="dropdown-item" id="ordenamiento-nombre" data-value="nombre"   href="#">Por nombre</a></li>
                          <li><a class="dropdown-item" id="ordenamiento-puntos" data-value="puntos"  href="#">Por puntos</a></li>
                          <li><a class="dropdown-item" id="ordenamiento-raza" data-value="raza"  href="#">Por raza </a></li>

                        </ul>
                    </li>
                    </ul>
                    <form class="d-flex" action="SvPerro" method="GET">
                        <input class="form-control me-2" type="search" name="nombre" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Buscar</button>
                    </form>
                  </div>
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
                            <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-nombre="<%= perro.getNombre()%>"><i class="fas fa-eye"></i></a> <!-- Icono de ventana modal -->
                            
                            <a href="#" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#editarModal"
                               data-nombre="<%= perro.getNombre()%>"
                               data-raza="<%= perro.getRaza()%>"
                               data-imagen="<%= perro.getImagen()%>"
                               data-puntos="<%= perro.getPuntos()%>"
                               data-edad="<%= perro.getEdad()%>">
                                <i class="fas fa-pencil-alt"></i>
                            </a>
                            
                            <a href="#" class="btn btn-danger eliminar" data-elimniar="<%= perro.getNombre()%>"><i class="fas fa-trash-alt"></i>  </a> <!-- Icono para borrar -->
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

<div class="modal fade" id="editarModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Editar Perro</h5>
                
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <h6 class="modal-subtitle text-muted" id="exampleModalLabel">
                    Nota: Seleccione la imagen que ya tenía previamente si desea editar otro dato distinto de la imagen, de lo contrario, el proceso no funcionará.
                </h6>
            <div class="modal-body">
                <form action="SvEditarPerro" method="POST" enctype="multipart/form-data">
                    <!-- Campo oculto para almacenar el nombre del perro -->
                    <input type="hidden" name="perro-edit-nombre" id="perro-edit-nombre" value="">


                    <!-- Input para la raza con el valor actual del perro -->
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="raza">Raza:</label>
                        <input type="text" name="raza" id="editar-raza" class="form-control">
                    </div>
                    <!-- Input para la foto (imagen actual del perro) -->
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="imagen">Imagen:</label>
                        <input type="file" name="imagen" class="form-control" id="imagen-perro-editar" required>
                    </div>
                    <!-- Input para los puntos con el valor actual del perro -->
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="puntos">Puntos:</label>
                        <select name="puntos" class="form-select" id="editar-puntos">
                            <option selected>Seleccione...</option>
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
                            <!-- Agrega todas las opciones necesarias aqu? -->
                        </select>
                    </div>
                    <!-- Input para la edad con el valor actual del perro -->
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="edad">Edad:</label>
                        <input type="text" name="edad" id="editar-edad" class="form-control">
                    </div>
                    <button type="submit" class="btn btn-primary">Guardar Cambios</button>
                </form>
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
        var nombre = button.data('nombre'); // Se obtiene el nombre del perro

        // Realiza una solicitud AJAX al servlet para obtener los detalles del perro por su nombre
        $.ajax({
            url: 'SvPerro?nombre=' + nombre, // Cambia 'id' por el nombre del parámetro que esperas en tu servlet
            method: 'GET',
            success: function (data) {
                // Actualiza el contenido del modal con los detalles del perro
                $('#perro-details').html(data);
            },
            error: function () {
                // Manejo de errores por si llegara a ser necesario
                console.log('Error al cargar los detalles del perro.');
            }
        });
    });

</script>


<script>
    $('#editarModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Bot?n que desencaden? el evento
        var nombre = button.data('nombre'); // Obt�n el nombre del perro
        var raza = button.data('raza'); // Obt?n la raza del perro
        var imagen = button.data('imagen'); // Obt?n la imagen del perro
        var puntos = button.data('puntos'); // Obt?n los puntos del perro
        var edad = button.data('edad'); // Obt?n la edad del perro

        // Rellena los campos del formulario con los datos del perro
        $('#perro-edit-nombre').val(nombre);
        $('#editar-raza').val(raza);
        $('#editar-puntos').val(puntos);
        $('#editar-edad').val(edad);
        // Rellena otros campos del formulario de la misma manera

        // Actualiza la imagen del perro en el formulario (si lo deseas)
        // Esto es opcional y depende de c?mo quieras mostrar la imagen

        $('#imagen-perro-editar').attr('src', './imagenes/' + imagen);
    });
    
    $('.eliminar').click(function() {
    var nombre=$(this).data('elimniar');
    $.ajax({
        url: 'SvEliminar?nombre=' + nombre,
        method: 'POST',
        success: function () {
                                                    
        window.location.href = 'index.jsp';
        },
        error: function () {
            
             }
        });
    });
    
    
     $('#ordenamiento-nombre').click(function() {
            var campo = $(this).data('value');
            console.log("holi, gracias por su seleccion: "+campo);
            $.ajax({
                url: 'SvEliminar?value=' + campo,
                method: 'GET',
                success: function () {

                window.location.href = 'index.jsp';
                },
                error: function () {

                     }
                });
          });
         
        $('#ordenamiento-puntos').click(function() {
            var campo = $(this).data('value');
            console.log("holi, gracias por su seleccion: "+campo);
             $.ajax({
                url: 'SvEliminar?value=' + campo,
                method: 'GET',
                success: function () {

                window.location.href = 'index.jsp';
                },
                error: function () {

                     }
                });
          });
          
          $('#ordenamiento-raza').click(function() {
            var campo = $(this).data('value');
            console.log("holi, gracias por su seleccion: "+campo);
             $.ajax({
                url: 'SvEliminar?value=' + campo,
                method: 'GET',
                success: function () {

                window.location.href = 'index.jsp';
                },
                error: function () {

                     }
                });
          });
          
</script>

<%@include file= "templates/fooder.jsp" %>