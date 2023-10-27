/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.umariana.exposicionCanina;


import java.io.Serializable;
/**
 *
 * @author 
 */
// Implementando la interfaz Serializable para habilitar la serialización del objeto.
public class Perro implements Serializable {
    
    //creamos los atributos
    private String nombre;
    private String raza;
    private String foto;
    private int puntos;
    private int edad;

// Se define un constructor sin parámetros.
    public Perro() {
    }
// Creación del constructor que acepta todos los parámetros como argumentos.
    /**
     * 
     * @param nombre
     * @param raza
     * @param foto
     * @param puntos
     * @param edad 
     */
    public Perro(String nombre, String raza, String foto, int puntos, int edad) {
        this.nombre = nombre;
        this.raza = raza;
        this.foto = foto;
        this.puntos = puntos;
        this.edad = edad;
    }
// Definición de los métodos getter y setter para acceder y modificar los atributos.
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

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
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


