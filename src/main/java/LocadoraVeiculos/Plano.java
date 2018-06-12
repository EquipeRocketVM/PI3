/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LocadoraVeiculos;

import java.text.DateFormat;
import java.text.SimpleDateFormat;


public class Plano {
    
    private int idplano;
    
    private String plano;

    private double valor;
      
    public Plano() {
      
    }
    
    public Plano(String ds_plano, double valor) {

      this.plano = ds_plano;
      this.valor = valor;
    
    }

    /**
     * @return the idplano
     */
    public int getIdplano() {
        return idplano;
    }

    /**
     * @param idplano the idplano to set
     */
    public void setIdplano(int idplano) {
        this.idplano = idplano;
    }

    /**
     * @return the plano
     */
    public String getPlano() {
        return plano;
    }

    /**
     * @param plano the plano to set
     */
    public void setPlano(String plano) {
        this.plano = plano;
    }

    /**
     * @return the valor
     */
    public double getValor() {
        return valor;
    }

    /**
     * @param valor the valor to set
     */
    public void setValor(double valor) {
        this.valor = valor;
    }

   

    
}
