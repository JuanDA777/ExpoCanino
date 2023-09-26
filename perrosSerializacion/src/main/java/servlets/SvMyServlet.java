/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import com.umariana.perrosserializacion.Perro;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SvControl", urlPatterns = {"/SvMyServlet"})
public class SvMyServlet extends HttpServlet {

    ArrayList<Perro> listadoPerrosGuardados = new ArrayList<>();
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        }
    


  @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    FileInputStream cargar = new FileInputStream(getServletContext().getRealPath("perrosRegistrados.txt"));
    ObjectInputStream caragado = new ObjectInputStream(cargar);
    try {
        ArrayList<Perro> perrosACargar = (ArrayList<Perro>) caragado.readObject();
     listadoPerrosGuardados.clear(); 
     listadoPerrosGuardados.addAll(perrosACargar); 
        caragado.close();
    } catch (IOException | ClassNotFoundException ex) {
        Logger.getLogger(SvMyServlet.class.getName()).log(Level.SEVERE, null, ex);
    }
    request.setAttribute( "listadoPerrosGuardados", listadoPerrosGuardados);
    request.getRequestDispatcher("index.jsp").forward(request, response);
}



    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Agregando todos los atributos de un perro, estos atributos vienen del formulario en index
        String nombre = request.getParameter("nombre");
        String raza = request.getParameter("raza");
        String fotos = request.getParameter("fotos");
        String puntos = request.getParameter("puntos");
        String edad = request.getParameter("edad");

        // Creando objeto con los datos ingresados o traídos del formulario
        Perro nuevoPerro = new Perro(nombre, raza, fotos, Integer.parseInt(puntos), Integer.parseInt(edad));

        // Agregar el nuevo perro a la lista
     listadoPerrosGuardados.add(nuevoPerro);

        // Serializar la lista completa y escribirla en el archivo
        FileOutputStream archivo = new FileOutputStream(getServletContext().getRealPath("perrosRegistrados.txt"));
        ObjectOutputStream cargado = new ObjectOutputStream(archivo);
        cargado.writeObject (listadoPerrosGuardados);

        cargado.close();
        archivo.close();

        // Redirigir a la página index.jsp
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }


    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

    

}
