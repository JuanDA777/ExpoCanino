/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.umariana.perrosserializacion;

import java.io.Serializable;


public class Perro  implements Serializable {
     private String nombre;
    private String raza;
    private String imagenes;
    private int puntos;
    private int edad;
    
    public Perro(String nombre, String raza, String imagenes, int puntos, int edad) {
        this.nombre=nombre;
        this.raza=raza;
        this.imagenes=imagenes;
        this.puntos=puntos;
        this.edad=edad;
           
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getRaza() {
        return raza;
    }

    public void setRaza(String raza) {
        this.raza = raza;
    }

    public String getImagenes() {
        return imagenes;
    }

    public void setImagenes(String imagenes) {
        this.imagenes = imagenes;
    }

    public int getPuntos() {
        return puntos;
    }

    public void setPuntos(int puntos) {
        this.puntos = puntos;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }
}
