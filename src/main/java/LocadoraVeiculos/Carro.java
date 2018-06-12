/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LocadoraVeiculos;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

/**
 *
 * @author victor.galvao
 */
public class Carro {
    
    private int idcarro;
    
    private String carro; 
    
    private String fabricante;
    
    private String cor;
    
    private int ano;
    
    private double valor;
    
    private int idplano;
    
  
        public Carro() {
      
    }
    
    public Carro(String carro, String fabricante, String cor, int ano, double valor) {
      
      this.carro = carro;
      this.fabricante = fabricante;
      this.cor = cor;
      this.ano = ano;
      this.valor = valor;

      
    }

    public Carro(String carro, String fabricante, String cor, int parseInt, double parseDouble, int parseInt0) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

   

    /**
     * @return the idcarro
     */
    public int getIdcarro() {
        return idcarro;
    }

    /**
     * @param idcarro the idcarro to set
     */
    public void setIdcarro(int idcarro) {
        this.idcarro = idcarro;
    }

    /**
     * @return the carro
     */
    public String getCarro() {
        return carro;
    }

    /**
     * @param carro the carro to set
     */
    public void setCarro(String carro) {
        this.carro = carro;
    }

    /**
     * @return the fabricante
     */
    public String getFabricante() {
        return fabricante;
    }

    /**
     * @param fabricante the fabricante to set
     */
    public void setFabricante(String fabricante) {
        this.fabricante = fabricante;
    }

    /**
     * @return the cor
     */
    public String getCor() {
        return cor;
    }

    /**
     * @param cor the cor to set
     */
    public void setCor(String cor) {
        this.cor = cor;
    }

    /**
     * @return the ano
     */
    public int getAno() {
        return ano;
    }

    /**
     * @param ano the ano to set
     */
    public void setAno(int ano) {
        this.ano = ano;
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

    public int getIdplano() {
        return idplano;
    }

    public void setIdplano(int idplano) {
        this.idplano = idplano;
    }

   
         
    
    
}
