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
import java.util.Date;
import java.util.List;

public class DaoPedido {

    private Connection obterConexao() throws ClassNotFoundException, SQLException {
        // 1A) Declarar o driver JDBC de acordo com o Banco de dados usado
        Class.forName("com.mysql.jdbc.Driver");

        Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/locadora", "root", "");
        return conn;
    }

    public List<Pedido> listar() throws ClassNotFoundException, SQLException {

        List<Pedido> lista = new ArrayList<Pedido>();

        try (Connection conn = obterConexao();
                PreparedStatement stmt = conn.prepareStatement(
                        " SELECT p.id_pedido, cl.id_cliente, pl.id_plano, ca.id_carro, pf.id_funcionario, "
                        + "f.id_filial "
                        + "p.dtlocacao, p.dtdevolucao, p.dias_alugados, p.ped_status,  p.vlr_total "
                        + "FROM locadora.PEDIDO P "
                        + " INNER JOIN locadora.CLIENTE CL ON P.ID_CLIENTE = CL.ID_CLIENTE "
                        + " INNER JOIN locadora.PLANO PL ON P.ID_PLANO = PL.ID_PLANO "
                        + " INNER JOIN locadora.CARRO CA ON P.ID_CARRO = CA.ID_CARRO "
                        + " INNER JOIN locadora.PESSOAFUNCIONARIO PF ON P.ID_FUNCIONARIO = PF.ID_FUNCIONARIO "
                        + " INNER JOIN locadora.FILIAL F ON P.ID_FILIAL = F.ID_FILIAL");
                ResultSet resultados = stmt.executeQuery()) {

            System.out.println("retornou consulta");

            while (resultados.next()) {
                int Id = resultados.getInt("id_pedido");
                int IdPessoa = resultados.getInt("id_cliente");
                int IdPlano = resultados.getInt("id_plano");
                int IdCarro = resultados.getInt("id_carro");
                int IdFuncionario = resultados.getInt("id_funcionario");
                int Idfilial = resultados.getInt("id_filial");
                Date DataDevolucao = resultados.getDate("dtlocacao");
                int DiasAlugados = resultados.getInt("dias_alugados");
                String Status = resultados.getString("ped_status");
                double ValorTotal = resultados.getDouble("vlr_total");

                Pedido p = new Pedido();

                p.setId(Id);
                p.setIdPessoa(IdPessoa);
                p.setIdPlano(IdPlano);
                p.setIdCarro(IdCarro);
                p.setIdFuncionario(IdFuncionario);
                p.setIdfilial(Idfilial);
                p.setDataDevolucao(DataDevolucao);
                p.setDiasAlugados(DiasAlugados);
                p.setStatus(Status);
                p.setValorTotal(ValorTotal);

                lista.add(p);

                System.out.println("Inserido na lista!!!");
            }
        }
        return lista;
    }

    public void incluir(Pedido p) throws ClassNotFoundException, SQLException {
        try (Connection conn = obterConexao()) {
            conn.setAutoCommit(false);

            System.out.println(p.getId() + " id Pedido é: ");

            try (PreparedStatement stmt
                    = conn.prepareStatement(
                            " INSERT INTO locadora.Pedido (id_pedido, id_cliente, id_plano,"
                            + " id_carro, id_funcionario, id_filial"
                            + "dtlocacao, dtdevolucao, dias_alugados, ped_status,  vlr_total) "
                            + "VALUES (?,?,?,?,?,?,?,?,?,?,?) ")) {
                stmt.setLong(1, p.getId());
                stmt.setLong(2, p.getIdPessoa());
                stmt.setLong(3, p.getIdPlano());
                stmt.setLong(4, p.getIdCarro());
                stmt.setLong(5, p.getIdFuncionario());
                stmt.setLong(6, p.getIdfilial());
                stmt.setDate(7, (java.sql.Date) p.getDataLocacao());
                stmt.setDate(8, (java.sql.Date) p.getDataDevolucao());
                stmt.setInt(9, p.getDiasAlugados());
                stmt.setString(10, p.getStatus());
                stmt.setDouble(11, p.getValorTotal());
                System.out.println("testeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
                int status = stmt.executeUpdate();

                // Efetivar todas as operações no BD
                conn.commit();
            }
        } catch (SQLException e) {
            System.out.println("erro dao pedido");

            throw e;
        }
    }

    public void atualizar(Pedido P) throws ClassNotFoundException, SQLException {
        try {

            Connection conn = obterConexao();
            PreparedStatement stmt = conn.prepareStatement(" UPDATE locadora.Pedido SET "
                    + " dtlocacao = ?, dtdevolucao = ?, dias_alugados = ?, ped_status = ?, vlr_total = ? "
                    + " WHERE id_pedido = ? ");

            stmt.setDate(1, (java.sql.Date) P.getDataLocacao());
            stmt.setDate(2, (java.sql.Date) P.getDataDevolucao());
            stmt.setInt(3, P.getDiasAlugados());
            stmt.setString(4, P.getStatus());
            stmt.setDouble(5, P.getValorTotal());

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
                        "DELETE locadora.Pedido  WHERE id_pedido = ? ")) {
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

    public Pedido select(int id) throws ClassNotFoundException, SQLException {

        Pedido p = new Pedido();

        try (Connection conn = obterConexao();
                PreparedStatement stmt = conn.prepareStatement(
                        "SELECT p.id_pedido, cl.id_cliente, pl.id_plano, ca.id_carro,"
                        + " pf.id_funcionario, f.id_filial"
                        + "p.dtlocacao, p.dtdevolucao, p.dias_alugados, p.ped_status,  p.vlr_total"
                        + "FROM locadora.PEDIDO P"
                        + "INNER JOIN locadora.CLIENTE CL ON P.ID_CLIENTE = CL.ID_CLIENTE"
                        + "INNER JOIN locadora.PLANO PL ON P.ID_PLANO = PL.ID_PLANO"
                        + "INNER JOIN locadora.CARRO CA ON P.ID_CARRO = CA.ID_CARRO"
                        + "INNER JOIN locadora.PESSOAFUNCIONARIO PF ON P.ID_FUNCIONARIO = PF.ID_FUNCIONARIO"
                        + "INNER JOIN locadora.FILIAL F ON P.ID_FILIAL = F.ID_FILIAL");
                ResultSet resultados = stmt.executeQuery()) {

            while (resultados.next()) {

                int Id = resultados.getInt("id_pedido");
                int IdPessoa = resultados.getInt("id_cliente");
                int IdPlano = resultados.getInt("id_plano");
                int IdCarro = resultados.getInt("id_carro");
                int IdFuncionario = resultados.getInt("id_funcionario");
                int Idfilial = resultados.getInt("id_filial");
                Date DataDevolucao = resultados.getDate("dtlocacao");
                int DiasAlugados = resultados.getInt("dias_alugados");
                String Status = resultados.getString("ped_status");
                double ValorTotal = resultados.getDouble("vlr_total");

                System.out.println("Id do pedido: " + Id);

                p.setId(Id);
                p.setIdPessoa(IdPessoa);
                p.setIdPlano(IdPlano);
                p.setIdCarro(IdCarro);
                p.setIdFuncionario(IdFuncionario);
                p.setIdfilial(Idfilial);
                p.setDataDevolucao(DataDevolucao);
                p.setDiasAlugados(DiasAlugados);
                p.setStatus(Status);
                p.setValorTotal(ValorTotal);

            }
            conn.close();

        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.err.println(ex.getMessage());
        }
        return p;
    }

}
