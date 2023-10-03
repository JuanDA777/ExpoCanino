// funcion para mostrar los datos en la ventana modal
            $('#eliminar').click(function(){
                
                var nombre = $(this).data('elimniar');// Obtén el nombre del perro

                // Realiza una solicitud AJAX al servlet para obtener los detalles del perro por su nombre
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