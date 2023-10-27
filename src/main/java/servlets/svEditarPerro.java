package servlets;
//librerias importadas
import com.umariana.exposicionCanina.Perro;
import com.umariana.exposicionCanina.Persistencia;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
/**
 *
 * @author 
 */
@MultipartConfig
@WebServlet(name = "svEditarPerro", urlPatterns = {"/svEditarPerro"})
public class svEditarPerro extends HttpServlet {
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
    }
     /**
 * En este método doPost se realizará la acción que permite editar la información del perro.
 * @param request Objeto HttpServletRequest que contiene la solicitud HTTP.
 * @param response Objeto HttpServletResponse que se utiliza para enviar la respuesta HTTP.
 * @throws ServletException Si ocurre un error durante el servlet.
 * @throws IOException Si ocurre un error de entrada/salida durante la comunicación HTTP.
 */

     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
// Métodos para guardar las sesiones que almacenan los datos del perro y la ruta de la ejecución.
        HttpSession session = request.getSession();
        ServletContext context = getServletContext();
// Creación de un array para almacenar los datos de los perros.
        ArrayList<Perro> misPerros = new ArrayList<>();
        try 
        {
            Persistencia.lectura(misPerros, context);
        }    
        catch (ClassNotFoundException ex)
        {
            Logger.getLogger(svCaninos.class.getName()).log(Level.SEVERE, null, ex);
        }
        processRequest(request, response);
    
    String nombreEditar = request.getParameter("nombreEditar");
    String uploadPath = context.getRealPath("/foto");
    if (nombreEditar != null && !nombreEditar.isEmpty()) {
        // Implementa la lógica para editar el perro con el nombre proporcionado.
        // Busca el perro por el nombre original (nombreEditar) y realiza las modificaciones necesarias.

        Perro editarPerro = buscarPerroPorNombre(nombreEditar);

        if (editarPerro != null) {
// Se obtienen los nuevos valores del formulario de edición para actualizar la información del perro.
            String nuevoNombre = request.getParameter("nuevoNombre");
            String nuevaRaza = request.getParameter("nuevaRaza");
            String nuevoPuntos = request.getParameter("nuevosPuntos");
            String nuevaEdad = request.getParameter("nuevaEdad");
            Part nuevaFotoPart = request.getPart("fotoEditar");
            editarPerro.setNombre(nuevoNombre);
            editarPerro.setRaza(nuevaRaza);
            editarPerro.setPuntos(Integer.parseInt(nuevoPuntos));
            editarPerro.setEdad(Integer.parseInt(nuevaEdad));
            if (nuevaFotoPart != null && nuevaFotoPart.getSize() > 0) {
                String nuevoNombreArchivo = nuevoNombre +
                        nuevaFotoPart.getSubmittedFileName().substring(
                                nuevaFotoPart.getSubmittedFileName().lastIndexOf('.')
                        );
                String nuevoFilePath = uploadPath + File.separator + nuevoNombreArchivo;
                try (InputStream fileContent = nuevaFotoPart.getInputStream();
                     FileOutputStream outputStream = new FileOutputStream(nuevoFilePath)) {
                    int read;
                    byte[] buffer = new byte[1024];
                    while ((read = fileContent.read(buffer)) != -1) {
                        outputStream.write(buffer, 0, read);
                    }
                }

                // Actualiza el nombre de la foto en el perro
                editarPerro.setFoto(nuevoNombreArchivo);
            }

            // Actualiza la lista de perros y guarda en el contexto
            Persistencia.escritura(misPerros, context);

            // Redirige de nuevo a la página deseada (en este caso, index.jsp)
            response.sendRedirect("index.jsp");
            return; // Importante: salir del método doPost para evitar procesamiento adicional
        }
    }
    }
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}