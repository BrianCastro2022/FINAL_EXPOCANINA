package servlets;
//librerias importadas
import com.umariana.exposicionCanina.Perro;
import com.umariana.exposicionCanina.Persistencia;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;

/**
 * 
 *
 * @author 
 */
// Este servlet facilita la adición de nuevos perros a una lista existente.

@MultipartConfig
@WebServlet(name = "svCaninos", urlPatterns = {"/svCaninos"})
public class svCaninos extends HttpServlet {
      ArrayList<Perro> misPerros = new ArrayList<>();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.setContentType("text/html;charset=UTF-8");          
    }
    /**
     * 
     * @throws ServletException 
     */
    public void init() throws ServletException{        
    }
    /**
     * 
     * @param nombre
     * @return 
     */
    private Perro buscarPerroPorNombre (String nombre){
        for ( Perro perro : misPerros){
            if (perro.getNombre().equals(nombre)){
                return perro;
            }
        }
        return null;
    } 
    /**
 * Método principal del servlet que maneja las solicitudes HTTP para agregar perros a la lista.
 * @param request Objeto HttpServletRequest que contiene la solicitud HTTP.
 * @param response Objeto HttpServletResponse que se utiliza para enviar la respuesta HTTP.
 * @throws ServletException Si ocurre un error durante el servlet.
 * @throws IOException Si ocurre un error de entrada/salida durante la comunicación HTTP.
 */

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {                
        HttpSession session = request.getSession();
        ServletContext context = getServletContext();
        String uploadPath = context.getRealPath("/foto");        

        try 
        {
            Persistencia.lectura(misPerros, context);
        } 
        catch (ClassNotFoundException ex) 
        {
            Logger.getLogger(svCaninos.class.getName()).log(Level.SEVERE, null, ex);
        }     
        
        
        //inicio del metodo que permite buscar al perro por su nombre
        String buscarPerroNombre = request.getParameter("buscar");        
        Perro perroABuscar = buscarPerroPorNombre(buscarPerroNombre);          
        if (buscarPerroNombre != null && !buscarPerroNombre.isEmpty()) {
            Perro perroEncontrado = buscarPerroPorNombre(buscarPerroNombre);
            if (perroEncontrado != null)                                    
            {
// Genera una respuesta HTML que contiene los detalles del perro solicitado.
                String perroHtml = 
                        "<h4 style='color: #1c1c1c; text-align: center;'><strong>Nombre</strong><br>" + "<h5 style='color: #555555; text-align: center;'</h5>"+ perroABuscar.getNombre() + "</h4>" +
                        "<h4 style='color: #1c1c1c; text-align: center;'><strong>Raza</strong><br>" + "<h5 style='color: #555555; text-align: center;'</h5>" + perroABuscar.getRaza() +"</h4>" +
                        "<h4 style='color: #1c1c1c; text-align: center;'><strong>Puntos</strong><br>" +"<h5 style='color: #555555; text-align: center;'</h5>" + perroABuscar.getPuntos() + "</h4>" +
                        "<h4 style='color: #1c1c1c; text-align: center;'><strong>Meses de edad</strong><br>" + "<h5 style='color: #555555; text-align: center;'</h5>" + perroABuscar.getEdad() + "</h4>" +
                        "<h4 style='color: #1c1c1c; text-align: center;'><strong>Foto del perrito</strong><br><br>" +
                        "<img src='" + request.getContextPath() + "/foto/" + perroABuscar.getFoto() + "' alt='" + perroABuscar.getNombre() + "' height='70%' width='75%' style='border: 2px solid #226638; border-radius:10px;'/></p>";
                response.setContentType("text/html");
                response.getWriter().write(perroHtml);
            } else {
                response.setContentType("text/plain");
                response.getWriter().write( "No hay perritos registrados con este nombre.");
            }
        }
        //fin del proceso que realiaza el metodo de buscar
        
        
        String eliminarNom = request.getParameter("eliminar");
        if (eliminarNom != null) {
            // Encuentra el perro a eliminar en la lista
            Perro perroAEliminar = buscarPerroPorNombre(eliminarNom);
            if (perroAEliminar != null) {
                // Elimina el perro de la lista
                misPerros.remove(perroAEliminar);            
            // Elimina también el archivo de la foto del perro
            String nombreArchivoFoto = perroAEliminar.getFoto();
            File archivoFoto = new File(uploadPath, nombreArchivoFoto);
            archivoFoto.delete();            
            // Guarda la lista actualizada
            Persistencia.escritura(misPerros, context);
            }
        }
        //fin del metodo para eliminar
        
        //inicio del metodo que permite visualizar al perrito
        processRequest(request, response);       
        String nombre = request.getParameter("nombre");
        Perro perro = buscarPerroPorNombre(nombre);         
        if (perro != null)                                    
        {
            // Genera la respuesta HTML con los detalles del perro
            String perroHtml = 
                    
                    "<h4 style='color: #1c1c1c; text-align: center;'><strong>Nombre</strong><br>" + "<h5 style='color: #555555; text-align: center;'</h5>"+ perro.getNombre() + "</h4>" +
                    "<h4 style='color: #1c1c1c; text-align: center;'><strong>Raza</strong><br>" + "<h5 style='color: #555555; text-align: center;'</h5>" + perro.getRaza() +"</h4>" +
                    "<h4 style='color: #1c1c1c; text-align: center;'><strong>Puntos</strong><br>" +"<h5 style='color: #555555; text-align: center;'</h5>" + perro.getPuntos() + "</h4>" +
                    "<h4 style='color: #1c1c1c; text-align: center;'><strong>Meses de edad</strong><br>" + "<h5 style='color: #555555; text-align: center;'</h5>" + perro.getEdad() + "</h4>" +
                    "<h4 style='color: #1c1c1c; text-align: center;'><strong>Foto del perrito</strong><br><br>" +
                    "<img src='" + request.getContextPath() + "/foto/" + perro.getFoto() + "' alt='" + perro.getNombre() + "' height='70%' width='75%' style='border: 2px solid #226638; border-radius:10px;'/></p>";
            
            response.setContentType("text/html");
            response.getWriter().write(perroHtml);
        } else {
            // Maneja el caso en el que no se encuentra el perro
            response.setContentType("text/plain");
            response.getWriter().write("No hay perritos registrados con este nombre.");
        }    
        //fin  metodo que permite ver al perrito con el icono 
        //cerrar doGet
    }
// Método doPost() que maneja las solicitudes POST para este servlet.
/**
 * Este método maneja las solicitudes POST para el servlet, utilizando los objetos request y response de HTTP.
 * @param request Objeto HttpServletRequest que contiene la solicitud HTTP.
 * @param response Objeto HttpServletResponse que se utiliza para enviar la respuesta HTTP.
 * @throws ServletException Si ocurre un error durante el servlet.
 * @throws IOException Si ocurre un error de entrada/salida durante la comunicación HTTP.
 */

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {                                
        HttpSession session = request.getSession();
        ServletContext context = getServletContext();
        ArrayList<Perro> misPerros = new ArrayList<>();
        try 
        {
            Persistencia.lectura(misPerros, context);
        }    
        catch (ClassNotFoundException ex)
        {
            Logger.getLogger(svCaninos.class.getName()).log(Level.SEVERE, null, ex);
        }         
        
        //aqui se recibiran los datos ingresados en el formulario
        String nombre = request.getParameter("nombre");
        // metodo para verificar si existe un perro con el mismo nombre
        boolean perroExistente = misPerros.stream().anyMatch(p -> p.getNombre().equals(nombre)); 
        if (perroExistente) {
            // mostrar una alerta al usuario en ventana modal.
            //cuando detectas que el nombre de un perro ya existe en la lista, se establece un atributo "nombreDuplicado" que se forma en la clase header
            response.setContentType("text/html");
            request.setAttribute("nombreDuplicado", true);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else {
            // Resto del código para agregar el perro
            String raza = request.getParameter("raza");
            Part filePart = request.getPart("foto");
            String puntos = request.getParameter("puntos");
            String edad = request.getParameter("edad");
            String uploadPath = context.getRealPath("/foto");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String filePath = uploadPath + File.separator + fileName;
            String nuevoNombreArchivo = nombre + fileName.substring(fileName.lastIndexOf('.'));
            String nuevoFilePath = uploadPath + File.separator + nuevoNombreArchivo;
            
            try (InputStream fileContent = filePart.getInputStream();
                    FileOutputStream outputStream = new FileOutputStream(nuevoFilePath)) {
                int read;
                byte[] buffer = new byte[1024];
                while ((read = fileContent.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, read);
                }
            }
            // Crea el objeto Perro con el nuevo nombre del archivo
            Perro perro = new Perro(nombre, raza, nuevoNombreArchivo, Integer.parseInt(puntos), Integer.parseInt(edad));
            misPerros.add(perro);
            // Persistencia y redireccionamiento
            Persistencia.escritura(misPerros, context);
            session.setAttribute("misPerros", misPerros);
            // Redireccionar a la página deseada
            response.sendRedirect("index.jsp");
        }  
    // Fin del método doPost()  
    }    
   /**
 * Devuelve una breve descripción del servlet.
 * @return una cadena de texto que contiene la descripción del servlet.
 */

    @Override
    public String getServletInfo()
    {
        return "Short description";
    }
    // </editor-fold>
}
