/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LocadoraVeiculos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoCarro {

    private Connection obterConexao() throws ClassNotFoundException, SQLException {
        // 1A) Declarar o driver JDBC de acordo com o Banco de dados usado
        Class.forName("com.mysql.jdbc.Driver");

        Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/locadora", "root", "");
        return conn;
    }

    public void incluir(Carro p) throws ClassNotFoundException, SQLException {

        try (Connection conn = obterConexao()) {
            conn.setAutoCommit(false);

            try (PreparedStatement stmt
                    = conn.prepareStatement(
                            "INSERT INTO locadora.Carro (ds_carro, fabricante, cor, ano,"
                            + " valor, id_plano, id_status) VALUES (?,?,?,?,?,?,?)")) {
                stmt.setString(1, p.getCarro());
                stmt.setString(2, p.getFabricante());
                stmt.setString(3, p.getCor());
                stmt.setInt(4, p.getAno());
                stmt.setDouble(5, p.getValor());
                stmt.setInt(6, p.getIdplano());
                stmt.setInt(7, 1);

                int status = stmt.executeUpdate();

                // Efetivar todas as operações no BD
                conn.commit();
            }

        } catch (SQLException e) {
            // Em caso de erro, volta para situação inicial

            throw e;
        }

    }

    // preciso fazer um select que nem esse mas para o nome do carro
    public Carro select(int id) throws ClassNotFoundException, SQLException {

        Carro carro = new Carro();

        try (Connection conn = obterConexao();
                PreparedStatement stmt = conn.prepareStatement(
                        "select * FROM locadora.Carro WHERE id_carro = " + id);
                ResultSet resultados = stmt.executeQuery()) {

            while (resultados.next()) {

                String nomeCarro = resultados.getString("ds_carro");
                String fabricante = resultados.getString("fabricante");
                String cor = resultados.getString("cor");
                int ano = resultados.getInt("ano");
                double valor = resultados.getDouble("valor");
                int idclass = resultados.getInt("id_plano");

                carro.setIdcarro(id);
                carro.setCarro(nomeCarro);
                carro.setFabricante(fabricante);
                carro.setCor(cor);
                carro.setAno(ano);
                carro.setValor(valor);
                carro.setIdplano(idclass);

            }
            conn.close();

        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.err.println(ex.getMessage());
        }
        return carro;
    }

    //fiz isso aqui para ver se quando eu buscar no pesquisar vai como nome e não id
    public Carro selectNome(String nomeCarro) throws ClassNotFoundException, SQLException {

        Carro carro = new Carro();

        try (Connection conn = obterConexao();
                PreparedStatement stmt = conn.prepareStatement(
                        "select * FROM locadora.Carro WHERE ds_carro = " + nomeCarro);
                ResultSet resultados = stmt.executeQuery()) {

            while (resultados.next()) {

                //String nomeCarro = resultados.getString("ds_carro");
                int id = resultados.getInt("id_carro");
                nomeCarro = resultados.getString("ds_carro");
                String fabricante = resultados.getString("fabricante");
                String cor = resultados.getString("cor");
                int ano = resultados.getInt("ano");
                double valor = resultados.getDouble("valor");
                int idclass = resultados.getInt("id_plano");

                carro.setIdcarro(id);
                carro.setCarro(nomeCarro);
                carro.setFabricante(fabricante);
                carro.setCor(cor);
                carro.setAno(ano);
                carro.setValor(valor);
                carro.setIdplano(idclass);

            }
            conn.close();

        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.err.println(ex.getMessage());
        }
        return carro;
    }
    
    
    
    public List<Carro> listar() throws ClassNotFoundException, SQLException {

        List<Carro> lista = new ArrayList<Carro>();

        try (Connection conn = obterConexao();
                PreparedStatement stmt = conn.prepareStatement(
                        "SELECT id_carro, ds_carro, fabricante, cor, ano, valor, id_plano "
                        + " FROM locadora.Carro a"
                        + " where id_status = 1");
                ResultSet resultados = stmt.executeQuery()) {

            while (resultados.next()) {
                int id = resultados.getInt("id_carro");
                String carro = resultados.getString("ds_carro");
                String fabricante = resultados.getString("fabricante");
                String cor = resultados.getString("cor");
                int ano = resultados.getInt("ano");
                double valor = resultados.getDouble("valor");
                int idplano = resultados.getInt("id_plano");

                Carro p = new Carro();

                p.setIdcarro(id);
                p.setCarro(carro);
                p.setFabricante(fabricante);
                p.setCor(cor);
                p.setAno(ano);
                p.setValor(valor);
                p.setIdplano(idplano);

                lista.add(p);

            }
        }
        return lista;
    }

    public void atualizar(Carro P) throws ClassNotFoundException, SQLException {
        try {

            System.out.println("METODO UPDATE");
            System.out.println(P.getCarro() + " esse é o Carro");
            System.out.println(P.getAno() + " esse é o ano do carro");

            System.out.println(P.getValor()+ " esse é o valor do carro");
            System.out.println(P.getCor() + " esse é a cor do carro");
            System.out.println(P.getFabricante() + " esse é o fabricante carro");
            System.out.println(P.getIdcarro() + " esse é o ID");

            Connection conn = obterConexao();
            PreparedStatement stmt = conn.prepareStatement(" UPDATE Carro SET "
                    + " ds_carro = ?, fabricante =?, cor=?,  ano=?, valor=?, id_plano=? "
                    + " WHERE id_carro = ? ");
            stmt.setString(1, P.getCarro());
            stmt.setString(2, P.getFabricante());
            stmt.setString(3, P.getCor());
            stmt.setInt(4, P.getAno());
            stmt.setDouble(5, P.getValor());
            stmt.setInt(6, P.getIdplano());
            stmt.setInt(7, P.getIdcarro());
            stmt.executeUpdate();

            conn.close();

        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.err.println(ex.getMessage());
        }

    }

    public boolean excluir(int id) throws ClassNotFoundException, SQLException {

        boolean deletado = false;
        try (Connection conn = obterConexao();
                PreparedStatement stmt = conn.prepareStatement(
                        "update locadora.Carro set id_status = 0 WHERE id_carro = ? ")) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
            deletado = true;
            conn.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.err.println(ex.getMessage());
        }
        return deletado;
    }
}
