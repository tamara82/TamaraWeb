/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utilidades;

/**
 *
 * @author usuario
 */
public class Util {
    public static String traducirPago(String abreviatura){
        String cadena="";
    switch(abreviatura){
        case "E":
            cadena="Efectivo";
            break;
        case "T":
            cadena="Tarjeta";
            break;
    }
    return cadena;
    }
    
    public static String abreviarPago(String pago){
    return null;
    
    }
    public static String convertirNullAStringVacio(String cadena) {
        if (cadena == null) return "";
        if (cadena.equals("null")) return "";
        return cadena;
    }
    public static Integer convertirNullAIntVacio(Integer num) {
        if (num == null) return 0;
        if (num.equals("null")) return 0;
        return num;
    }
    
        public static boolean esEntero(String s) {
        try { 
            Integer.parseInt(s); 
        } catch(NumberFormatException e) { 
            return false; 
        }
        return true;
    }
        
    

}
