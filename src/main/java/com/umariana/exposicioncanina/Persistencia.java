package com.umariana.exposicionCanina;
//librerias importadas
import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.http.Part;

/**
 *
 * @author Brian
 */
public class Persistencia
{
// Método de escritura de datos.
/**
 * Este método se encarga de escribir la información ingresada en el formulario para luego
 * almacenarla en el archivo con extensión .ser, utilizando la serialización.
 * @param misPerros Lista de perros que se va a guardar.
 * @param context Objeto ServletContext para acceder al contexto del servlet.
 * @throws FileNotFoundException Si no se encuentra el archivo en la ruta especificada.
 * @throws IOException Si ocurre un error durante la escritura de datos.
 */

   public static void escritura(ArrayList<Perro> misPerros, ServletContext context)
           throws FileNotFoundException, IOException 
   {
        //usamos ruta relativa para generar el archivo con formato .dat para la serializacion
        String rutaRelativa = "/data/archivo.dat";
        String rutaAbsoluta = context.getRealPath(rutaRelativa);
        File archivo = new File(rutaAbsoluta);

        try 
            (FileOutputStream fos = new FileOutputStream(archivo); ObjectOutputStream oos = new ObjectOutputStream(fos))
        {
            for (Perro perro : misPerros)
            {
                oos.writeObject(perro);
            }
        }
        catch (IOException e) 
        {
            //alerta que se mostrara cuando el archivo no funciono
            System.out.println("ARCHIVO NO ENCONTRADO");
        }
    }
// Método de lectura de datos.
/**
 * Este método se encarga de leer los datos almacenados en un archivo .ser y cargarlos
 * en la lista de perros para su posterior visualización y manipulación.
 * @param misPerros Lista de perros donde se cargarán los datos.
 * @param context Objeto ServletContext para acceder al contexto del servlet.
 * @throws IOException Si ocurre un error durante la lectura del archivo.
 * @throws ClassNotFoundException Si no se encuentra la clase durante la deserialización.
 */

    public static void lectura(ArrayList<Perro> misPerros, ServletContext context) throws IOException, ClassNotFoundException {
        // Ruta relativa y absoluta del archivo de datos serializados
        String rutaRelativa = "/data/archivo.dat";
        String rutaAbsoluta = context.getRealPath(rutaRelativa);
        File archivo = new File(rutaAbsoluta);
// Estructura condicional para analizar el archivo y determinar su contenido.
// Si el archivo contiene datos, los interpreta; de lo contrario, muestra un mensaje usando 'System.out.println'.
        if (archivo.length() == 0)
        {
            System.out.println("Sin informacion que mostrar");
            return;
        }        
        try (FileInputStream fis = new FileInputStream(archivo); ObjectInputStream ois = new ObjectInputStream(fis)) 
        {
            //metodo de limpieza de datos
            misPerros.clear();
            while (true)
            {
                try 
                {                    
                    //usando el objeto del servlet verificamos lo siguiente
                    Perro perro = (Perro) ois.readObject();                   
                    misPerros.add(perro);
                } catch (EOFException e) 
                {                    
                    break;
                }
            }
        } catch (IOException e)
        {
            //manejo de excepcion que saldra cuando el archivo no funcione como se esperaba
            System.out.println("EL ARCHIVO NO FUE LEIDO");
        }
    }   
    public static Perro buscarPorNombrePerrito(String nombre) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}

