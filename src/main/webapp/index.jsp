<%@page import="com.umariana.exposicionCanina.Perro"%>
<%@page import="com.umariana.exposicionCanina.Persistencia"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>

<head>
<!-- Se pueden incluir otras etiquetas head aquí, como metadatos, enlaces a archivos CSS, scripts y más. -->
</head>

<body style="background-color: #ADD8E6; color: white; font-style: italic;">
<!-- Se emplea 'include' para integrar el contenido de otro archivo dentro de este, particularmente el encabezado. -->
    <%@include file="templates/header.jsp"%>
<!-- Se incorpora un banner en la sección principal de la interfaz. -->
    <nav class="navbar navbar-light bg-light">
        <a class="img-fluid mx-auto navbar-brand">
            <img src="imagenes/banner.jpg" style="width: 100%; height: auto;" class="d-inline-block align-top" alt="banner">
        </a>
    </nav>
    <!-- Este es un elemento contenedor -->
    <!-- Se emplea la clase 'container-fluid' para que el contenedor se extienda por toda la pantalla. -->

    <div style="font-family: 'Archivo Black';" class="container-fluid">
<!-- Se utiliza la clase 'max-width' para establecer un ancho máximo para el contenedor.-->
        <div class="row max-width">
            <!-- La clase se emplea para dividir el contenido en cuatro columnas. -->
<!-- Se utiliza la clase 'mx-auto' para centrar horizontalmente el contenedor en la página. -->

            <div class="col-md-4 mx-auto">
                <div class="card card-body">
<!-- Se genera una tarjeta de trabajo que incluye un formulario. Se establece el atributo 'enctype' para permitir la carga de archivos en formato binario. -->
                    <form action="svCaninos" method="POST" enctype="multipart/form-data">
                        <div class="mb-3 text-center">
    <label for="nombre" class="form-label" style="color: black;"><b>Nombre del Perro</b></label>
    <input type="text" name="nombre" class="form-control" id="nombre" placeholder="Ingrese el nombre" required>
</div>

<div class="mb-3 text-center">
    <label for="raza" class="form-label" style="color: black; display: block; text-align: center;"><b>Raza del Perro</b></label>
    <input type="text" name="raza" class="form-control" id="raza" placeholder="Ingrese la raza" required>
</div>


<div class="mb-3 text-center">
    <label for="foto" class="form-label" style="color: black;"><b>Foto del Perro</b></label>
    <input type="file" class="form-control" name="foto" id="foto" accept="image/jpeg, image/pjpeg, image/png, image/gif, image/svg+xml, image/bmp, image/tiff" required>
</div>

<div class="mb-3 text-center">
    <label for="puntos" class="form-label" style="color: black;"><b>Puntos del Perro</b></label>
    <select class="form-select" name="puntos" required>
        <option value="" disabled selected>Seleccione...</option>
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

<div class="mb-3 text-center">
    <label for="edad" class="form-label" style="color: black;"><b>Edad del Perro</b></label>
    <input type="text" name="edad" class="form-control" id="edad" placeholder="Ingrese la edad" required>
</div>
                        <div class="text-center">
    <button type="submit" class="btn btn-success">Agregar Perro</button>
</div>

                    </form>
                </div>
            </div>
            <!-- Se trata de una tabla de datos con un diseño en gris utilizando la clase 'table-light'.-->
            <div class="col-md-8">
                <table style="font-family: 'Archivo Black';" class="table  table-bordered table-light">
                    <script src="https://cdn.jsdelivr.net/npm/@popperjs/[email protected]/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.0.0-beta1/js/bootstrap.min.js" integrity="sha384-pzjw8f+ua7Kw1TIq0v8FqFjcJ6pajs/rfdfs3SO+kD4Ck5BdPtF+to8xM6B5z6W5" crossorigin="anonymous"></script>
                    <!-- Una barra de navegación que incorpora botones.-->
                    <div class="navbar-nav">
                        <div class="input-group">
                            <input type="text" class="form-control" id="nombrePerroABuscar" placeholder="Buscar nombre del perro">
<button class="btn btn-outline-warning text-dark" id="btnBuscar" type="button" data-bs-toggle="modal" data-bs-target="#modalBusqueda">Buscar Perro</button>
                        </div>
                    </div>
                    <thead>
                        <tr class="text-center">
                            <th>Nombre</th>
                            <th>Raza</th>
                            <th>Foto</th>
                            <th>Puntos</th>
                            <th>Edad</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>

<tbody>
<!-- Se accede al array generado durante la solicitud POST para recuperar la información de los perros. -->
    <%
        ArrayList<Perro> misPerros = new ArrayList<>();
        ServletContext context = getServletContext();
        // La información del archivo se obtiene utilizando el método de lectura de la clase de persistencia.
        Persistencia.lectura(misPerros, context);
        // El uso del condicional 'if' se emplea para verificar si no hay información en el archivo o si ocurrió algo no deseado.
        if (misPerros != null) {
// Se utiliza un bucle 'for' con el fin de asegurar que la tabla se ajuste dinámicamente a la cantidad de datos suministrados en el formulario.
            for (Perro perro : misPerros) {
    %>
    <tr id="tr" class="text-center">
<!-- Los detalles asociados a cada fila de la tabla albergan la información ingresada en el formulario. -->
        <td><i><%= perro.getNombre() %></i></td>
        <td><i><%= perro.getRaza() %></i></td>
        <td><i><%=perro.getFoto()  %></i></td>
        <td><i><%= perro.getPuntos() %></i></td>
        <td><i><%= perro.getEdad() %></i></td>
        <td>
            <a href="svCaninos" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal" data-nombre="<%=perro.getNombre()%>">
                <i class="fas fa-eye text-white"></i>
            </a>
            <a href="#editModal" class="btn btn-warning btn-sm" title="Editar" onclick="abrirFormularioEdicion('<%= perro.getNombre() %>', '<%= perro.getRaza() %>', '<%= perro.getPuntos() %>', '<%= perro.getEdad() %>')">
                <i class="fas fa-edit text-white"></i>
            </a>
            <button class="btn btn-danger btn-sm" onclick="eliminarPerro('<%= perro.getNombre() %>')">
                <i class="fas fa-trash-alt text-white"></i>
            </button>
        </td>
    </tr>
    <%
        }
    }
    %>
</tbody>

                </table>
<div class="navbar-nav">
    <div class="input-group">
        <div class="btn-group" role="group" aria-label="Botones de búsqueda y ordenamiento">
            <button class="btn btn-outline-warning text-dark" id="btnOrdenarPorNombre" onclick="ordenarPorNombre()">Ordenar por Nombre (A-Z)</button>
            <button class="btn btn-outline-warning text-dark" id="btnOrdenarPorEdad" onclick="ordenarPorEdadDescendente()">Ordenar por mayor Edad</button>
            <button class="btn btn-outline-warning text-dark" onclick="ordenarPorPuntos()">Ordenar por mayor Puntaje</button>
            <button type="button" class="btn btn-outline-warning text-dark" id="btnMostrarPerroMasViejo">Mostrar Perro Más Viejo</button>
            <button type="button" class="btn btn-outline-warning text-dark" id="btnMostrarMayorPuntaje">Mostrar Perro con Mayor Puntaje</button>
            <button type="button" class="btn btn-outline-warning text-dark" id="btnMostrarMenorPuntaje">Mostrar Perro con Menor Puntaje</button>
        </div>
    </div>
</div>


            </div>
    
        </div>
    </div>

<!-- Se emplea 'include' para incorporar un archivo dentro de otro, específicamente el pie de página que contiene los scripts desarrollados en esa sección. -->
    <%@include file="templates/footer.jsp"%>
</body>

</html>