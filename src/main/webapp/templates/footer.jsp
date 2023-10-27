<!-- La importación de Bootstrap se realiza para aplicar estilos. -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>       
<!-- Aquí comienza la creación de los scripts. -->
<!-- Este script está destinado a la función de mostrar los detalles del perro.-->
<script>
    // La función se encarga de mostrar los datos en la ventana modal.
    $('#exampleModal').on('show.bs.modal', function (event) {
        // El botón que activó el evento.
        var button = $(event.relatedTarget); 
        // Recupera el nombre del perro.
        var nombre = button.data('nombre'); 
        // Ejecuta una solicitud AJAX al servlet para obtener los detalles del perro según su nombre.
        $.ajax({
            // Sustituye 'id' por el nombre del parámetro que esperas en tu servlet.
            url: 'svCaninos?nombre=' + nombre, 
            method: 'GET',
            success: function (data) {
        // Actualiza el contenido del modal con la información detallada del perro.                   
        $('#perro-details').html(data);            
    },
            error: function () {
        // Gestiona errores aquí si es necesario.
        console.log('Error al cargar los detalles del perro.');
    }
        });
    });
</script>   
<!-- El siguiente script muestra en una ventana modal al perro más viejo de una lista.-->
<script>
    $(document).ready(function() {       
        // El siguiente botón muestra al perro más viejo de una lista. Al hacer clic en él, se abrirá una ventana modal con la información del perro más viejo.   
        $('#btnMostrarPerroMasViejo').click(function() {       
        // Estamos iniciando variables para llevar un registro del perro más viejo.       
        var edadMasViejo = -Infinity;      
        var filaMasViejo = null;           
        // Recorremos las filas para identificar al perro más viejo.         
        $('tr').each(function() {            
        var edad = parseInt($(this).find('td:nth-child(5)').text()); // Suponiendo que la columna de edad es la quinta (índice 4)            
        if (!isNaN(edad) && edad > edadMasViejo) {           
            edadMasViejo = edad;           
            filaMasViejo = $(this);          
        }          
    });                 
        if (filaMasViejo !== null) {                
        // Obtenemos todos los datos del perro más antiguo                       
        var nombrePerroMasViejo = filaMasViejo.find('td:nth-child(1)').text(); // Nombre               
        var razaPerroMasViejo = filaMasViejo.find('td:nth-child(2)').text(); // Raza                
        var edadPerroMasViejo = filaMasViejo.find('td:nth-child(5)').text(); // Edad               
        var puntosPerroMasViejo = filaMasViejo.find('td:nth-child(4)').text(); // Puntos                
        var fotoPerroMasViejo = filaMasViejo.find('td:nth-child(3)').text(); // Foto (ubicación)            
        // Actualizamos los elementos en la ventana modal con la información del perro.            
        $('#nombreMayorPuntaje').text(nombrePerroMasViejo);              
        $('#razaMayorPuntaje').text(razaPerroMasViejo);              
        $('#edadMayorPuntaje').text(edadPerroMasViejo);               
        $('#puntosMayorPuntaje').text(puntosPerroMasViejo);               
        $('#imagenMayorPuntaje').attr('src', 'foto/' + fotoPerroMasViejo); // Modifica aquí la ruta de acuerdo a la estructura de tus directorios.             
        $('#modalMayorPuntaje').modal('show');              
    }   else    {                           
        alert('No hay perros en la lista.');         
    }    
});
});
</script>                        
<!-- Este script se utiliza para resaltar al perro perdedor o con la puntuación más baja.-->
<script>
    $(document).ready(function() {        
        // Botón para mostrar el perro con la puntuación más baja.     
        $('#btnMostrarMenorPuntaje').click(function() {        
        // Estamos inicializando variables para hacer un seguimiento del perro con la puntuación más baja.         
        var menorPuntaje = Infinity;      
        var filaMenorPuntaje = null;
        // Recorremos las filas para localizar al perro con la puntuación más baja         
        $('tr').each(function() {               
        var puntaje = parseInt($(this).find('td:nth-child(4)').text()); 
        if (!isNaN(puntaje) && puntaje < menorPuntaje) {   
            menorPuntaje = puntaje;               
            filaMenorPuntaje = $(this);             
        }            
    });           
        if (filaMenorPuntaje !== null) {           
        // Obtenemos todos los datos del perro con la puntuación más baja.            
        var nombrePerroMenorPuntaje = filaMenorPuntaje.find('td:nth-child(1)').text(); // Nombre              
        var razaPerroMenorPuntaje = filaMenorPuntaje.find('td:nth-child(2)').text(); // Raza              
        var edadPerroMenorPuntaje = filaMenorPuntaje.find('td:nth-child(5)').text(); // Edad                
        var puntosPerroMenorPuntaje = filaMenorPuntaje.find('td:nth-child(4)').text(); // Puntos           
        var fotoPerroMenorPuntaje = filaMenorPuntaje.find('td:nth-child(3)').text(); // Foto (ubicación)            
        // Actualizamos los elementos en la ventana modal con la información del perro.               
        $('#nombreMayorPuntaje').text(nombrePerroMenorPuntaje);               
        $('#razaMayorPuntaje').text(razaPerroMenorPuntaje);
    
        $('#edadMayorPuntaje').text(edadPerroMenorPuntaje);                
        $('#puntosMayorPuntaje').text(puntosPerroMenorPuntaje);                
        $('#imagenMayorPuntaje').attr('src', 'foto/' + fotoPerroMenorPuntaje);                         
        $('#modalMayorPuntaje').modal('show');           
    } else {                       
        alert('No hay perros en la lista.');         
    }
});   
});
</script>

<!-- Este script se utiliza para resaltar al perro con la puntuación más alta, destacándolo como el ganador.-->
                                                                                    
<script>
    $(document).ready(function() {
        $('#btnMostrarMayorPuntaje').click(function() {           
        // Estamos inicializando variables para llevar un registro del perro con la puntuación más alta.          
        var mayorPuntaje = -1;          
        var filaMayorPuntaje = null;           
        // Recorremos las filas para identificar al perro con la puntuación más alta.            
        $('tr').each(function() {             
        var puntaje = parseInt($(this).find('td:nth-child(4)').text());             
        if (!isNaN(puntaje) && puntaje > mayorPuntaje) {            
            mayorPuntaje = puntaje;                      
            filaMayorPuntaje = $(this);           
        }            
    });            
        if (filaMayorPuntaje !== null) {               
        // Obtenemos todos los datos del perro con la puntuación más alta.           
        var nombrePerroMayorPuntaje = filaMayorPuntaje.find('td:nth-child(1)').text(); // Nombre           
        var razaPerroMayorPuntaje = filaMayorPuntaje.find('td:nth-child(2)').text(); // Raza                      
        var edadPerroMayorPuntaje = filaMayorPuntaje.find('td:nth-child(5)').text(); // Edad              
        var puntosPerroMayorPuntaje = filaMayorPuntaje.find('td:nth-child(4)').text(); // Puntos                
        var fotoPerroMayorPuntaje = filaMayorPuntaje.find('td:nth-child(3)').text(); // Foto (ubicación)              
        // Actualizamos los elementos en la ventana modal con la información del perro.               
        $('#nombreMayorPuntaje').text(nombrePerroMayorPuntaje);               
        $('#razaMayorPuntaje').text(razaPerroMayorPuntaje);                
        $('#edadMayorPuntaje').text(edadPerroMayorPuntaje);              
        $('#puntosMayorPuntaje').text(puntosPerroMayorPuntaje);      
        $('#imagenMayorPuntaje').attr('src', 'foto/' + fotoPerroMayorPuntaje);           
        $('#modalMayorPuntaje').modal('show');           
    } else {           
        alert('No hay perros en la lista.');            
    }
});
});
</script>
<!-- Este script permite eliminar la información de un perro.-->             
<script>
    function eliminarPerro(nombrePerro) {
                       
        if (confirm("          ¿Estás seguro de que quieres eliminar a " + nombrePerro + "?" + "\n" +                        
                "\n" +                         
                "                          Esta acción no se puede cancelar.")) {                                 
            // Envía una solicitud AJAX al servidor para eliminar al perro.                              
            $.ajax({                                
                type: 'GET',                                                
                url: 'svCaninos?eliminar=' + nombrePerro,                                        
                success: function (data) {                                                                                           
        // Actualiza la tabla en la página sin necesidad de recargarla.                                       
        location.reload();                                    
    },                                   
                error: function () {                                   
        console.log('Error al eliminar el perro.');                                 
    }                             
            });                             
        }
    }
</script> 


<!-- Este script es para ordenar la lista de los perritos por su nombre en este caso se uso de la A a la Z-->

<script>  
    function ordenarPorNombre() {
        // Obtén la tabla de perritos    
        var table = document.querySelector("table tbody");    
        // Obtén las filas de la tabla excluyendo la primera (encabezado)      
        var rows = Array.from(table.rows);
        // Ordena las filas por nombre en orden alfabético    
        rows.sort(function (a, b) {     
        var nombreA = a.cells[0].textContent.toLowerCase();     
        var nombreB = b.cells[0].textContent.toLowerCase();     
        return nombreA.localeCompare(nombreB);  
    });    
        // Elimina todas las filas existentes de la tabla    
        while (table.rows.length > 1) {    
        table.deleteRow(1);    
    }
        // Agrega las filas ordenadas de nuevo a la tabla    
        rows.forEach(function (row) {          
        table.appendChild(row);    
    });
}
</script>

<!-- Este script es para ordenar la lista de perros por edad, mostrando los perros con mayor edad inicialmente -->
<script>
     
    function ordenarPorEdadDescendente() { 
        // Obtén la tabla de perritos   
        var table = document.querySelector("table tbody");   
        // Obtén las filas de la tabla excluyendo la primera (encabezado)        
        var rows = Array.from(table.rows);   
        // Ordena las filas por edad en orden descendente    
        rows.sort(function (a, b) {
        var edadA = parseInt(a.cells[4].textContent);   
        var edadB = parseInt(b.cells[4].textContent);
        return edadB - edadA;    
    });    
        // Elimina todas las filas existentes de la tabla    
        while (table.rows.length > 1) {      
        table.deleteRow(1);    
    }    
        // Agrega las filas ordenadas de nuevo a la tabla    
        rows.forEach(function (row) {       
        table.appendChild(row);
    });
}
</script>

<!-- Este script es para ordenar la lista de perros segun cantidad de puntos -->
<script>
    function ordenarPorPuntos() {
        // Recuperar la tabla de la página
        var table = document.querySelector("table tbody");
        // Obtener todas las filas de la tabla
        var rows = Array.from(table.rows);
        // Ordenar las filas por puntos (asegúrate de que los puntos sean números)
        rows.sort(function (a, b) {           
        var puntosA = parseInt(a.cells[3].textContent);           
        var puntosB = parseInt(b.cells[3].textContent);         
        return puntosB - puntosA;        
    });              
    // Limpiar la tabla    
        table.innerHTML = "";
        // Agregar las filas ordenadas de nuevo a la tabla         
        rows.forEach(function (row) {     
        table.appendChild(row);        
    });
}
</script>


<!-- Este script se utiliza para notificar con una ventana modal emergente la existencia de un nombre duplicado de un perro y prevenir errores.-->
<script>
    // Se comprueba si es necesario mostrar el modal de nombre duplicado cuando se ingresa un perro con el mismo nombre.
    <% if (request.getAttribute("nombreDuplicado") != null) { %>                            
    $(document).ready(function() {                           
        $('#nombreDuplicadoModal').modal('show');                           
    });                          
    <% } %>
</script>
<!--Este script se utiliza para buscar a un perro por su nombre.-->
<script>
    $(document).ready(function() {
  
        $('#btnBuscar').click(function() {
        var nombreABuscar = $('#nombrePerroABuscar').val().trim();
        var modalTitle = $('#modalBusqueda').find('.modal-title'); 
        if (nombreABuscar === '') {          
            // Mostrar la ventana modal con un título de error si el campo de búsqueda está vacío          
            modalTitle.text('Error');
            $('#alertaBusquedaVacia').show();
            // Borrar el contenido de la ventana modal para eliminar la información del perro previamente buscado.
            $('#perro-detailss').html('');
            return; 
        } else {
            // Esconder el mensaje de alerta si se proporcionó un nombre válido.
            $('#alertaBusquedaVacia').hide();
        }        
        // Restablecer el título por defecto de la ventana modal.
        modalTitle.text('¿Este es el perrito que buscabas?');               
        // Hacer una solicitud AJAX al servidor para buscar al perro por nombre.       
        $.ajax({          
            type: 'GET',
            //Se utilizó 'nombre' para simplificar y recorrerlo, no hay razones para imponer sanciones por esto.        
            url: 'svCaninos?nombre=' + nombreABuscar,            
            success: function(data) {                
        // Comprobar si se encontraron resultados antes de mostrar la ventana modal.               
        if (data.trim() !== '') {         
            // Actualizar la tabla de resultados con los detalles del perro.                  
            $('#perro-detailss').html(data);               
        } else {                
            // Mostrar un mensaje si no se encontraron resultados  
            alert('No se encontraron resultados para el nombre de perro ingresado.');                
            // Borrar el contenido de la ventana modal para eliminar la información del perro previamente buscado              
            $('#perro-detailss').html('');             
        }     
    },            
            error: function() {              
        // Manejar errores aquí si es necesario             
        console.log('Error al buscar el perro.');           
    }         
        });
    });
});               
</script>

<!-- Este script se utiliza para editar la información del perro seleccionado-->
<script>
   
    function abrirFormularioEdicion(nombrePerro, razaPerro, puntosPerro, edadPerro, fotoPerro) {
    
        // Llena el formulario de edición con los datos actuales del perro.   
        document.getElementById("editDogNombre").value = nombrePerro;    
        document.getElementById("nuevoNombre").value = nombrePerro;
    
        document.getElementById("editDogRaza").value = razaPerro;    
        document.getElementById("nuevaRaza").value = razaPerro;
    
        // Para la imagen, estableciendo la foto actual del perrito.   
        var imgElement = document.getElementById("fotoActual");    
        imgElement.src = "<%= request.getContextPath() %>/foto/" + fotoPerro;         
        
        document.getElementById("editDogPuntos").value = puntosPerro;
        document.getElementById("nuevosPuntos").value = puntosPerro;
       
        document.getElementById("editDogEdad").value = edadPerro;
        document.getElementById("nuevaEdad").value = edadPerro;    
    $('#editModal').modal('show');
}
</script>
</body>
</html>