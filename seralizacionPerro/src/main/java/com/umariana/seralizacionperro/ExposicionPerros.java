package com.umariana.seralizacionperro;
import java.io.*;
import java.util.ArrayList;
import javax.servlet.ServletContext;

public class ExposicionPerros {
    
    // Creamos la lista darPerros y la definimos 
    // La definimos como "sttatic" para que este disponible en el todo el programa
    public static ArrayList<Perro> darPerros = new ArrayList<>();
    
    // Método para guardar la lista de perros en un archivo perros.ser
    public static void guardarPerro(ArrayList<Perro> perros, ServletContext context) throws IOException {
        
        //Definimos una ruta para buscar nuestro archivo perro.ser
        String relativePath = "/data/perros.data";
        String absPath = context.getRealPath(relativePath);
        File archivo = new File(absPath);
        
        try {
            // Crear un archivo para guardar la lista de perros serializada
            FileOutputStream fos = new FileOutputStream(archivo);
            ObjectOutputStream oos = new ObjectOutputStream(fos);
            oos.writeObject(perros);
            oos.close();
            
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("Error al guardar los datos de perro: " + e.getMessage());
        }
    }

    // Método para cargar los perros desde el archivo deserializándolo
    public static ArrayList<Perro> cargarPerros(ServletContext context) throws IOException, ClassNotFoundException {
        
        //Reutilizamos la ruta previamente definida para perro.ser
        String relativePath = "/data/perros.data";
        String absPath = context.getRealPath(relativePath);
        File archivo = new File(absPath);
        
        try {
            // Cargar la lista de perros desde el archivo
            FileInputStream fis = new FileInputStream(archivo);
            ObjectInputStream ois = new ObjectInputStream(fis);
            darPerros = (ArrayList<Perro>) ois.readObject();
            ois.close();
            System.out.println("Datos de perros cargados exitosamente desde: perros.ser");
        } catch (IOException | ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("Error al cargar los datos de perros: " + e.getMessage());
        }
        return darPerros;
    }
    public static void eliminarPerro(String nombre){
        Perro perroAEliminar = null;

        //Busca al perro dentro del array existente
        for (Perro perro : darPerros) {
            if (perro.getNombre().equals(nombre)) {
                perroAEliminar = perro;
                break;
            }
        }

        //Si se encuentra al Perro se lo elimina del array
        if (perroAEliminar != null) {
            darPerros.remove(perroAEliminar);
        }
    }
    public static Perro buscarPerroPorNombre(String nombre) {
        for (Perro perro : darPerros) {
            if (perro.getNombre().equals(nombre)) {
                return perro; // Retorna  el perro si se encuentra
            }
        }
        return null; // Retorna null si no se encuentra el perro
    }
    
}

