/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LocadoraVeiculos;

import LocadoraVeiculos.Filial;
import com.mysql.jdbc.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoPlano {

    private static Connection obterConexao() throws ClassNotFoundException, SQLException {
        // 1A) Declarar o driver JDBC de acordo com o Banco de dados usado
        Class.forName("com.mysql.jdbc.Driver");

        Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/locadora", "root", "");
        return conn;
    }

    public static List<Plano> listar() throws ClassNotFoundException, SQLException {

        List<Plano> lista = new ArrayList<Plano>();

        try (Connection conn = obterConexao();
                PreparedStatement stmt = conn.prepareStatement(
                        "SELECT a.id_plano, a.ds_plano, a.valor "
                        + " FROM locadora.Plano a "
                        + " where a.id_status = 1 ");
                ResultSet resultados = stmt.executeQuery()) {

            System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa retornou consulta");

            while (resultados.next()) {
                int id_plano = resultados.getInt("id_plano");
                String ds_plano = resultados.getString("ds_plano");
                double valor = resultados.getDouble("valor");

                Plano p = new Plano();

                p.setIdplano(id_plano);
                p.setPlano(ds_plano);
                p.setValor(valor);

                lista.add(p);

                System.out.println(id_plano + ", " + ds_plano);
            }
        }
        return lista;
    }

    public void incluir(Plano p) throws ClassNotFoundException, SQLException {

        try (Connection conn = obterConexao()) {
            conn.setAutoCommit(false);


            try (PreparedStatement stmt
                    = conn.prepareStatement(
                            " INSERT INTO locadora.Plano (ds_plano, "
                            + "valor, id_status) VALUES (?,?,?,?) ")) {
                stmt.setString(1, p.getPlano());
                stmt.setDouble(2, p.getValor());
                stmt.setInt(3, 1);

                int status = stmt.executeUpdate();

                // Efetivar todas as operações no BD
                conn.commit();
            }

        } catch (SQLException e) {
            // Em caso de erro, volta para situação inicial

            throw e;
        }

    }

    public void atualizar(Plano P) throws ClassNotFoundException, SQLException {
        try {

            Connection conn = obterConexao();
            PreparedStatement stmt = conn.prepareStatement(" UPDATE Plano SET "
                    + " ds_plano = ?, valor=? "
                    + " WHERE id_plano = ? ");
            stmt.setString(1, P.getPlano());
            stmt.setDouble(2, P.getValor());
            stmt.setInt(3, P.getIdplano());
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
                        "update locadora.Plano set id_status = 0 WHERE id_plano = ? ")) {
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

    public Plano select(int id) throws ClassNotFoundException, SQLException {

        Plano plano = new Plano();

        try (Connection conn = obterConexao();
                PreparedStatement stmt = conn.prepareStatement(
                        "SELECT a.id_plano, a.ds_plano,  a.valor "
                        + " WHERE a.id_status = 1 and a.id_plano = " + id);
                ResultSet resultados = stmt.executeQuery()) {

            while (resultados.next()) {

                int idplano = resultados.getInt("id_plano");
                String ds_plano = resultados.getString("ds_plano");
                double valor = resultados.getInt("valor");

                System.out.println("O nome do plano é: " + ds_plano);

                plano.setIdplano(idplano);
                plano.setPlano(ds_plano);
                plano.setValor(valor);

            }
            conn.close();

        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.err.println(ex.getMessage());
        }
        return plano;
    }

}
