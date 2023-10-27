<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>   
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exposición Canina</title>    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--importacion del boostrap para estilos adaptados-->   
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>                              
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <script src="scripts/script.js" type="text/javascript"></script>            
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP5QT5I5Fk38Hh2EVsEm/m7F5F5j4meM1a7xj" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <!-- importacion del link de font awesome para los iconos -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet">            
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- llamar a un archivo que se encuentra eb el proyecto pero esta externo -->
        <script src="scripts/script.js" type="text/javascript"></script>
        <!-- agregando las fuentes desde google fonts-->   
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Alice&family=Architects+Daughter&family=Bungee&family=Chakra+Petch:wght@300&family=Kaushan+Script&family=Khand:wght@500&family=Oswald:wght@200;400;700&family=Permanent+Marker&family=Sedgwick+Ave+Display&family=Ultra&display=swap');
        </style>
    </head>
    <body>
        <div id="nombreDuplicadoModal" class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Nombre existente</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        El nombre que ingresaste ya está en uso. Por favor, elige otro nombre.
                    </div>
                    <div class="modal-footer d-flex justify-content-center">
                        <a class="btn btn-danger btn-success" href="index.jsp" class="btn btn-secondary">Regresar</a>
                    </div>
                </div>
            </div>
        </div>



        <div style="font-family: 'Archivo Black';" class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static" id="tablaResultados">
            <div class="modal-dialog modal-dialog-centered  modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="exampleModalLabel">Detalles del Perrito</h4>
                        <button type="button" class="btn-close btn-close-danger" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div id="perro-details" class="text-center">
                        </div>
                    </div>
                    <div class="modal-footer d-flex justify-content-center">
                        <button type="button" class="btn btn-danger btn-success" data-bs-dismiss="modal" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>

        <div style="text-align: center" style="font-family: 'Archivo Black';" class="modal fade" id="editModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="exampleModalLabel">Editar Perrito</h4>
                        <button type="button" class="btn-close btn-close-danger" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="index.jsp" method="POST" enctype="multipart/form-data">
                            <input type="hidden" id="editDogNombre" name="nombreEditar">
                            <input type="hidden" id="editDogRaza" name="razaEditar">
                            <input type="hidden" id="fotoActual" name="fotoEditar">
                            <input type="hidden" id="editDogPuntos" name="puntosEditar">
                            <input type="hidden" id="editDogEdad" name="edadEditar">
                            <div class="input-group mb-3">
                                <label class="input-group-text" for="nuevoNombre" class="form-label">Nombre</label>
                                <input type="text" class="form-control" id="nuevoNombre" name="nombreEditar" required>
                            </div>                   
                            <div class="input-group mb-3">
                                <label class="input-group-text" for="nuevaRaza" class="form-label">Raza</label>
                                <input type="text" class="form-control" id="nuevaRaza" name="razaEditar" required>
                            </div>
                        <div class="input-group mb-3">
                            <label class="input-group-text" for="nuevaFoto" class="form-label">La foto no puede ser modificada</label>
                        </div>                                        
                        <div class="input-group mb-3">
                            <label class="input-group-text" for="nuevosPuntos" class="form-label">Puntos</label>
                            <select class="form-select" id="nuevosPuntos" name="puntosEditar" aria-label="Default select example" required>
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
                        <div class="input-group mb-3">
                            <label class="input-group-text" for="nuevaEdad" class="form-label">Edad</label>
                            <input type="text" class="form-control" id="nuevaEdad" name="edadEditar" required>
                        </div>                   
                        <div class="d-flex justify-content-center">
                            <button type="submit" class="btn btn-success mx-2">Guardar Cambios</button>
                            <button type="button" class="btn btn-danger btn-success mx-2" data-bs-dismiss="modal">Cancelar</button>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div> 

       
        <div style="font-family: 'Archivo Black';" class="modal fade" id="modalMayorPuntaje" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static">
            <div class="modal-dialog modal-dialog-centered  modal-dialog-scrollable" >
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="exampleModalLabel">Detalles del perrito</h4>
                        <button type="button" class="btn-close btn-close-danger" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row" class="text-center">                    
                            <div class="text-center" class="col-md-8">
                                <h3  style='color: #1c1c1c;' id="nombreMayorPuntaje"></h3> <br>
                                <h4 style='color: #1c1c1c;'><strong>Raza</strong></h4> <h4 style='color: #555555;' id="razaMayorPuntaje"></h4>
                                <h4 style='color: #1c1c1c;'><strong>Meses de edad</strong></h4> <h4 style='color: #555555;' id="edadMayorPuntaje"></h4>
                                <h4 style='color: #1c1c1c;'><strong>Puntos</strong></h4> <h4 style='color: #555555;' id="puntosMayorPuntaje"></h4>
                                <div>
                                    <h4 style='color: #1c1c1c;'><strong>Foto del perrito</strong></h4><br>
                                    <img  id="imagenMayorPuntaje" src="" alt="Foto del perro" class="img-fluid" ' height='70%' width='75%' style='border: 2px solid #226638; border-radius:10px;'>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer d-flex justify-content-center">
                        <button type="button" class="btn btn-danger btn-success" data-bs-dismiss="modal" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>   
        <div style="font-family: 'Archivo Black';" class="modal fade" id="modalBusqueda" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="exampleModalLabel">¿Este es el perrito que buscabas?</h4>
                        <button type="button" class="btn-close btn-close-danger" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div id="alertaBusquedaVacia" class="alert alert-danger" style="display: none;">
                            Ingresa un nombre de perrito para buscar.
                        </div>
                        <div id="perro-detailss" class="text-center">
                        </div>
                    </div>
                    <div class="modal-footer d-flex justify-content-center">
                        <button type="button" class="btn btn-danger btn-success" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
        
        
    


