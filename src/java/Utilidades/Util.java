/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utilidades;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author usuario
 */
public class Util {

    public static String traducirPago(String abreviatura) {
        String cadena = "";
        switch (abreviatura) {
            case "E":
                cadena = "Efectivo";
                break;
            case "T":
                cadena = "Tarjeta";
                break;
        }
        return cadena;
    }

    public static String abreviarPago(String pago) {
        return null;

    }

    public static String convertirStringNull(String cadena) {
        if (cadena == null) {
            return null;
        } else if (cadena.equals("")) {
            return null;
        }
        return cadena;
    }

    public static String convertirNullAStringVacio(String cadena) {
        if (cadena == null) {
            return "";
        }
        if (cadena.equals("null")) {
            return "";
        }
        return cadena;
    }

    public static boolean esEntero(String s) {
        try {
            Integer.parseInt(s);
        } catch (NumberFormatException e) {
            return false;
        }
        return true;
    }

    public static String calcularHash(String cadena) {
        String resultado = "";
        try {
            String textoString = cadena;
            byte[] textoArrayBytes = textoString.getBytes();
            MessageDigest mensaje = MessageDigest.getInstance("SHA-512");
            mensaje.update(textoArrayBytes);
            byte[] resumen = mensaje.digest();
            resultado = hexadecimal(resumen);
        } catch (NoSuchAlgorithmException ex) {
            System.out.println(ex.getMessage());
        }

        return resultado;
    }

    public static String hexadecimal(byte[] arrayBytes) {
        String cadenaHexadecimal = "";
        String apoyo;
        for (int i = 0; i < arrayBytes.length; i++) {
            apoyo = Integer.toHexString(arrayBytes[i] & 0xFF);
            if (apoyo.length() == 1) {
                apoyo = "0" + apoyo;
            }
            cadenaHexadecimal = cadenaHexadecimal + apoyo;
        }
        return cadenaHexadecimal;
    }

}
