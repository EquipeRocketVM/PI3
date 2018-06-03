/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LocadoraVeiculos;

import java.sql.Date;
import java.util.List;

public class Pessoa {

    private int id;
    private int idcliente;
    private int idfuncionario;
    private String nome;
    private String sobrenome;
    private String rua;
    private int numero;
    private int cep;
    private String estado;
    private String cidade;
    private double cpf;
    private Date dataNasc;
    private String email;
    private int telefone;
    private int tipo;
    private double cnh;
    private double renda;
    private int idnivel;
    private String nivel;
    private String login;
    private String senha;
    private String cargo;
    private int idcargo;

    public Pessoa() {

    }

    public Pessoa(String nome, String sobrenome, String rua, int numero, int cep, String estado,
            String cidade, int cpf, Date dtnascimento,
            String email, int telefone, int tipo, List<Pessoa> cargos) {

        this.nome = nome;
        this.sobrenome = sobrenome;
        this.rua = rua;
        this.numero = numero;
        this.cep = cep;
        this.estado = estado;
        this.cidade = cidade;
        this.cpf = cpf;
        this.dataNasc = dtnascimento;
        this.email = email;
        this.telefone = telefone;
        this.tipo = tipo;
        this.cargo = cargo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSobrenome() {
        return sobrenome;
    }

    public void setSobrenome(String Sobrenome) {
        this.sobrenome = Sobrenome;
    }

    public String getRua() {
        return rua;
    }

    public void setRua(String Rua) {
        this.rua = Rua;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public int getCep() {
        return cep;
    }

    public void setCep(int cep) {
        this.cep = cep;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String Estado) {
        this.estado = Estado;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String Cidade) {
        this.cidade = Cidade;
    }

    public double getCpf() {
        return cpf;
    }

    public void setCpf(double cpf) {
        this.cpf = cpf;
    }

    public Date getDataNasc() {
        return dataNasc;
    }

    public void setDataNasc(Date dataNasc) {
        this.dataNasc = dataNasc;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getTelefone() {
        return telefone;
    }

    public void setTelefone(int telefone) {
        this.telefone = telefone;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public double getCnh() {
        return cnh;
    }

    public void setCnh(double cnh) {
        this.cnh = cnh;
    }

    public double getRenda() {
        return renda;
    }

    public void setRenda(double renda) {
        this.renda = renda;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getCargo() {
        return cargo;
    }
//
//    public void setCargo(String cargo) {
//        this.cargo = cargo;
//    }
//    
//    public List<Pessoa> getCargos() {
//    return cargo;
//  }

    // foi adicionado uma lista de cargos, que seriam o gerente e o vendedor 
    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    // aqui verifica se o cargo está logado
    public boolean verificarCargo(String nomeCargo) {
        List<Pessoa> cargos = null;
        for (Pessoa p : cargos) {
            if (p.getNome().equals(nomeCargo)) {
                return true;
            }
        }
        return false;
    }

   
    public int getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(int idcliente) {
        this.idcliente = idcliente;
    }

    
    public int getIdfuncionario() {
        return idfuncionario;
    }

    
    public void setIdfuncionario(int idfuncionario) {
        this.idfuncionario = idfuncionario;
    }

    public void setId(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public int getIdnivel() {
        return idnivel;
    }

    public void setIdnivel(int idnivel) {
        this.idnivel = idnivel;
    }

    public String getNivel() {
        return nivel;
    }

    public void setNivel(String nivel) {
        this.nivel = nivel;
    }

    public int getIdcargo() {
        return idcargo;
    }

    public void setIdcargo(int idcargo) {
        this.idcargo = idcargo;
    }

    // estava dando erro na pasta filter - autorização filter
    public boolean getCargo(String fodon) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
