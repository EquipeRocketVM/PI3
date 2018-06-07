/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LocadoraVeiculos;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoPessoa {

    public Connection obterConexao() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");

        Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/locadora", "root", "");
        return conn;
    }

    public void incluir(Pessoa p) throws ClassNotFoundException, SQLException {

        try (Connection conn = obterConexao()) {
            conn.setAutoCommit(false);
            try (PreparedStatement stmt
                    = conn.prepareStatement(
                            " INSERT INTO locadora.Pessoa (nome, sobrenome, rua, numero,"
                            + " cep, estado, cidade, cpf, dtnascimento, email, telefone, tipo, idstatus)"
                            + " VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?) ")) {

                stmt.setString(1, p.getNome());
                stmt.setString(2, p.getSobrenome());
                stmt.setString(3, p.getRua());
                stmt.setInt(4, p.getNumero());
                stmt.setInt(5, p.getCep());
                stmt.setString(6, p.getEstado());
                stmt.setString(7, p.getCidade());
                stmt.setString(8, p.getCpf());
                stmt.setDate(9, p.getDataNasc());
                stmt.setString(10, p.getEmail());
                stmt.setString(11, p.getTelefone());

                if (p.getCnh() == 0) {
                    stmt.setInt(12, 2);
                } else {
                    stmt.setInt(12, 1);
                }

                stmt.setInt(13, 1);
                int status = stmt.executeUpdate();

                conn.commit();
                int id = selectId(p.getCpf());
                p.setId(id);
                incluirFuncionario(p);

            }

        } catch (SQLException e) {
            throw e;
        }

    }

    public void incluirCliente(Pessoa p) throws ClassNotFoundException, SQLException {

        try (Connection conn = obterConexao()) {
            conn.setAutoCommit(false);
            try (PreparedStatement stmt
                    = conn.prepareStatement(
                            "INSERT INTO locadora.PessoaCliente (id_pessoa, cnh, renda)"
                            + "VALUES (?,?,?) ")) {

                stmt.setInt(1, p.getId());
                stmt.setDouble(2, p.getCnh());
                stmt.setDouble(3, p.getRenda());
                int status = stmt.executeUpdate();

                conn.commit();
                
            }

        } catch (SQLException e) {
            throw e;
        }

    }

    public void incluirFuncionario(Pessoa p) throws ClassNotFoundException, SQLException {

        try (Connection conn = obterConexao()) {
            conn.setAutoCommit(false);
            System.out.println(p.getId());
            System.out.println(p.getIdnivel());
            System.out.println(p.getCargo());
            System.out.println(p.getLogin());
            System.out.println(p.getSenha());

            try (PreparedStatement stmt
                    = conn.prepareStatement(
                            "INSERT INTO locadora.PessoaFuncionario (id_pessoa, id_nivel,"
                            + " id_cargo, login, senha, idstatus) "
                            + "VALUES (?,?,?,?,?,?) ")) {

                stmt.setInt(1, p.getId());
                stmt.setInt(2, p.getIdnivel());
                stmt.setString(3, p.getCargo());
                stmt.setString(4, p.getLogin());
                stmt.setString(5, p.getSenha());
                stmt.setInt(6, 1);
                int status = stmt.executeUpdate();

                conn.commit();
            }

        } catch (SQLException e) {
            throw e;
        }

    }

    public Pessoa selectCliente(int id) throws ClassNotFoundException, SQLException {
        Pessoa p = new Pessoa();

        try (Connection conn = obterConexao();
                PreparedStatement stmt = conn.prepareStatement(
                        " SELECT idpessoa, id_cliente, nome, sobrenome, rua, numero, cep, "
                        + "estado, cidade, cpf, dtnascimento, email, telefone, cnh, renda  "
                        + " FROM locadora.Pessoa a inner join locadora.PessoaCliente b on a.idpessoa = b.id_pessoa "
                        + " WHERE idstatus = 1 and a.idpessoa = " + id);
                ResultSet resultados = stmt.executeQuery()) {

            while (resultados.next()) {
                int idpessoa = resultados.getInt("idpessoa");
                int idcliente = resultados.getInt("id_cliente");
                String nome = resultados.getString("nome");
                String sobrenome = resultados.getString("sobrenome");
                String rua = resultados.getString("rua");
                int numero = resultados.getInt("numero");
                int cep = resultados.getInt("cep");
                String estado = resultados.getString("estado");
                String cidade = resultados.getString("cidade");
                String cpf = resultados.getString("cpf");
                Date dtnascimento = resultados.getDate("dtnascimento");
                String email = resultados.getString("email");
                String telefone = resultados.getString("telefone");
                double cnh = resultados.getDouble("cnh");
                double renda = resultados.getDouble("renda");

                p.setId(idpessoa);
                p.setIdcliente(idcliente);
                p.setNome(nome);
                p.setSobrenome(sobrenome);
                p.setRua(rua);
                p.setNumero(numero);
                p.setCep(cep);
                p.setEstado(estado);
                p.setCidade(cidade);
                p.setCpf(cpf);
                p.setDataNasc(dtnascimento);
                p.setEmail(email);
                p.setTelefone(telefone);
                p.setCnh(cnh);
                p.setRenda(renda);

            }
            conn.close();

        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.err.println(ex.getMessage());
        }
        return p;
    }

    public Pessoa selectFuncionario(int id) throws ClassNotFoundException, SQLException {
        Pessoa p = new Pessoa();

        try (Connection conn = obterConexao();
                PreparedStatement stmt = conn.prepareStatement(
                        " SELECT idpessoa,  nome, sobrenome, rua, numero, cep, estado, cidade, cpf, "
                        + "dtnascimento, email, telefone, b.id_nivel, nivel, b.id_cargo, cargo, login, senha  "
                        + " FROM locadora.Pessoa a inner join locadora.PessoaFuncionario b on a.idpessoa = b.id_pessoa "
                        + " inner join locadora.Nivel c on b.id_nivel = c.id_nivel "
                        + " inner join locadora.Cargo d on b.id_cargo = d.id_cargo "
                        + " WHERE a.idstatus = 1 and a.idpessoa = " + id);
                ResultSet resultados = stmt.executeQuery()) {

            while (resultados.next()) {

                int idpessoa = resultados.getInt("idpessoa");
                String nome = resultados.getString("nome");
                String sobrenome = resultados.getString("sobrenome");
                String rua = resultados.getString("rua");
                int numero = resultados.getInt("numero");
                int cep = resultados.getInt("cep");
                String estado = resultados.getString("estado");
                String cidade = resultados.getString("cidade");
                String cpf = resultados.getString("cpf");
                Date dtnascimento = resultados.getDate("dtnascimento");
                String email = resultados.getString("email");
                String telefone = resultados.getString("telefone");
                int idnivel = resultados.getInt("id_nivel");
                String nivel = resultados.getString("nivel");
                int idcargo = resultados.getInt("id_cargo");
                String cargo = resultados.getString("cargo");
                String login = resultados.getString("login");
                String senha = resultados.getString("senha");

                p.setId(idpessoa);
                p.setNome(nome);
                p.setSobrenome(sobrenome);
                p.setRua(rua);
                p.setNumero(numero);
                p.setCep(cep);
                p.setEstado(estado);
                p.setCidade(cidade);
                p.setCpf(cpf);
                p.setDataNasc(dtnascimento);
                p.setEmail(email);
                p.setTelefone(telefone);
                p.setIdnivel(idnivel);
                p.setNivel(nivel);
                p.setCargo(cargo);
                p.setIdcargo(idcargo);
                p.setLogin(login);
                p.setSenha(senha);

                System.out.println("Nome é:" + p.getId());
                System.out.println("Sobrenome é: " + p.getSobrenome());

            }
            conn.close();

        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
            System.out.println(" Tente novamente, por favor. ");
        } catch (ClassNotFoundException ex) {
            System.err.println(ex.getMessage());
        }
        return p;
    }

    public int selectId(String cpf) throws ClassNotFoundException, SQLException {

        Pessoa Pessoa = new Pessoa();

        try (Connection conn = obterConexao();
                PreparedStatement stmt = conn.prepareStatement(
                        "SELECT idpessoa "
                        + " From locadora.Pessoa "
                        + " WHERE cpf = " + cpf);
                ResultSet resultados = stmt.executeQuery()) {

            while (resultados.next()) {
                int idP = resultados.getInt("idpessoa");
                System.out.println("Esse é o id: " + idP);
                Pessoa.setId(idP);

            }
            conn.close();

        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.err.println(ex.getMessage());
        }
        return Pessoa.getId();
    }

    public List<Pessoa> listarCliente() throws ClassNotFoundException, SQLException {

        List<Pessoa> lista = new ArrayList<Pessoa>();

        try (Connection conn = obterConexao();
                PreparedStatement stmt = conn.prepareStatement(
                        "SELECT idpessoa, id_cliente, nome, sobrenome, "
                        + "rua, numero, cep, estado, cidade, cpf, dtnascimento, email, telefone, cnh, renda "
                        + " FROM locadora.Pessoa a inner join locadora.PessoaCliente b on a.idpessoa = b.id_pessoa "
                        + " where idstatus = 1 and tipo = 1");
                ResultSet resultados = stmt.executeQuery()) {

            while (resultados.next()) {

                int idpessoa = resultados.getInt("idpessoa");
                int idcliente = resultados.getInt("id_cliente");
                String nome = resultados.getString("nome");
                String sobrenome = resultados.getString("sobrenome");
                String rua = resultados.getString("rua");
                int numero = resultados.getInt("numero");
                int cep = resultados.getInt("cep");
                String estado = resultados.getString("estado");
                String cidade = resultados.getString("cidade");
                String cpf = resultados.getString("cpf");
                Date dtnascimento = resultados.getDate("dtnascimento");
                String email = resultados.getString("email");
                String telefone = resultados.getString("telefone");
                double cnh = resultados.getDouble("cnh");
                double renda = resultados.getDouble("renda");

                Pessoa p = new Pessoa();

                p.setId(idpessoa);
                p.setIdcliente(idcliente);
                p.setNome(nome);
                p.setSobrenome(sobrenome);
                p.setRua(rua);
                p.setNumero(numero);
                p.setCep(cep);
                p.setEstado(estado);
                p.setCidade(cidade);
                p.setCpf(cpf);
                p.setDataNasc(dtnascimento);
                p.setEmail(email);
                p.setTelefone(telefone);
                p.setCnh(cnh);
                p.setRenda(renda);

                lista.add(p);

            }
        }
        return lista;
    }

    public List<Pessoa> listarFuncionario() throws ClassNotFoundException, SQLException {

        List<Pessoa> lista = new ArrayList<Pessoa>();

        try (Connection conn = obterConexao();
                PreparedStatement stmt = conn.prepareStatement(
                        " SELECT idpessoa,  nome, sobrenome, rua, numero, cep, estado, cidade, "
                        + "cpf, dtnascimento, email, telefone, b.id_nivel, b.id_cargo, "
                        + "login, senha, nivel, d.cargo   "
                        + " FROM locadora.Pessoa a inner join locadora.PessoaFuncionario b on a.idpessoa = b.id_pessoa "
                        + " inner join locadora.Nivel c on b.id_nivel = c.id_nivel "
                        + " inner join locadora.Cargo d on b.id_cargo = d.id_cargo "
                        + " WHERE a.idstatus = 1 and tipo = 2");
                ResultSet resultados = stmt.executeQuery()) {

            while (resultados.next()) {

                int idpessoa = resultados.getInt("idpessoa");
                String nome = resultados.getString("nome");
                String sobrenome = resultados.getString("sobrenome");
                String rua = resultados.getString("rua");
                int numero = resultados.getInt("numero");
                int cep = resultados.getInt("cep");
                String estado = resultados.getString("estado");
                String cidade = resultados.getString("cidade");
                String cpf = resultados.getString("cpf");
                Date dtnascimento = resultados.getDate("dtnascimento");
                String email = resultados.getString("email");
                String telefone = resultados.getString("telefone");
                int idnivel = resultados.getInt("id_nivel");
                String nivel = resultados.getString("nivel");
                int idcargo = resultados.getInt("id_cargo");
                String cargo = resultados.getString("cargo");
                String login = resultados.getString("login");
                String senha = resultados.getString("senha");

                Pessoa p = new Pessoa();

                p.setId(idpessoa);
                p.setNome(nome);
                p.setSobrenome(sobrenome);
                p.setRua(rua);
                p.setNumero(numero);
                p.setCep(cep);
                p.setEstado(estado);
                p.setCidade(cidade);
                p.setCpf(cpf);
                p.setDataNasc(dtnascimento);
                p.setEmail(email);
                p.setTelefone(telefone);
                p.setIdnivel(idnivel);
                p.setNivel(nivel);
                p.setCargo(cargo);
                p.setIdcargo(idcargo);
                p.setLogin(login);
                p.setSenha(senha);

                lista.add(p);

            }
        }
        return lista;
    }

    public void atualizar(Pessoa P) throws ClassNotFoundException, SQLException {
        try {

            System.out.println(P.getNome());
            System.out.println(P.getSobrenome());
            System.out.println("Esse é o id do update " + P.getId());
            System.out.println(P.getCidade());

            Connection conn = obterConexao();
            PreparedStatement stmt = conn.prepareStatement(" UPDATE Pessoa SET "
                    + "  nome = ? , sobrenome = ? , rua = ? , numero = ? , cep = ? , estado = ? ,"
                    + " cidade = ? , cpf = ? , dtnascimento = ? , email = ? , telefone = ?  "
                    + " WHERE idpessoa = ? ");
            stmt.setString(1, P.getNome());
            stmt.setString(2, P.getSobrenome());
            stmt.setString(3, P.getRua());
            stmt.setInt(4, P.getNumero());
            stmt.setInt(5, P.getCep());
            stmt.setString(6, P.getEstado());
            stmt.setString(7, P.getCidade());
            stmt.setString(8, P.getCpf());
            stmt.setDate(9, P.getDataNasc());
            stmt.setString(10, P.getEmail());
            stmt.setString(11, P.getTelefone());
            stmt.setInt(12, P.getId());

            stmt.executeUpdate();

            conn.close();

        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.err.println(ex.getMessage());
        }

    }

    public void atualizarCliente(Pessoa P) throws ClassNotFoundException, SQLException {
        try {

            Connection conn = obterConexao();
            PreparedStatement stmt = conn.prepareStatement(" UPDATE PessoaCliente SET "
                    + "  cnh = ? , renda = ? "
                    + " WHERE id_pessoa = ? ");
            stmt.setDouble(1, P.getCnh());
            stmt.setDouble(2, P.getRenda());
            stmt.setInt(3, P.getId());
            stmt.executeUpdate();

            conn.close();

        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.err.println(ex.getMessage());
        }

    }

    public void atualizarFuncionario(Pessoa P) throws ClassNotFoundException, SQLException {
        try {

            Connection conn = obterConexao();
            PreparedStatement stmt = conn.prepareStatement(" UPDATE PessoaFuncionario SET "
                    + "  id_nivel = ? , id_cargo = ?, login = ?,  senha = ?"
                    + " WHERE id_pessoa = ? ");
            stmt.setDouble(1, P.getIdnivel());
            stmt.setString(2, P.getCargo());
            stmt.setString(3, P.getLogin());
            stmt.setString(4, P.getSenha());
            stmt.setInt(5, P.getId());
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
                        "update locadora.Pessoa set idstatus = 0 WHERE idpessoa = ? ")) {
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

    public Pessoa obterFunc(String login, String senha) throws ClassNotFoundException, SQLException {
        Pessoa p = new Pessoa();

        try (Connection conn = obterConexao();
                PreparedStatement stmt = conn.prepareStatement(
                        " SELECT idpessoa,  nome, sobrenome, rua, numero, cep, estado, cidade, cpf,"
                        + " dtnascimento, email, telefone, b.id_nivel, nivel, b.id_cargo, cargo, login, senha  "
                        + " FROM locadora.Pessoa a inner join locadora.PessoaFuncionario b on a.idpessoa = b.id_pessoa "
                        + " inner join locadora.Nivel c on b.id_nivel = c.id_nivel "
                        + " inner join locadora.Cargo d on b.id_cargo = d.id_cargo "
                        + " WHERE a.idstatus = 1 and b.login = '" + login + "' and b.senha = '" + senha + "'");
                ResultSet resultados = stmt.executeQuery()) {

            while (resultados.next()) {

                int idpessoa = resultados.getInt("idpessoa");
                String nome = resultados.getString("nome");
                String sobrenome = resultados.getString("sobrenome");
                String rua = resultados.getString("rua");
                int numero = resultados.getInt("numero");
                int cep = resultados.getInt("cep");
                String estado = resultados.getString("estado");
                String cidade = resultados.getString("cidade");
                String cpf = resultados.getString("cpf");
                Date dtnascimento = resultados.getDate("dtnascimento");
                String email = resultados.getString("email");
                String telefone = resultados.getString("telefone");
                int idnivel = resultados.getInt("id_nivel");
                String nivel = resultados.getString("nivel");
                int idcargo = resultados.getInt("id_cargo");
                String cargo = resultados.getString("cargo");
                String login2 = resultados.getString("login");
                String senha2 = resultados.getString("senha");

                p.setId(idpessoa);
                p.setNome(nome);
                p.setSobrenome(sobrenome);
                p.setRua(rua);
                p.setNumero(numero);
                p.setCep(cep);
                p.setEstado(estado);
                p.setCidade(cidade);
                p.setCpf(cpf);
                p.setDataNasc(dtnascimento);
                p.setEmail(email);
                p.setTelefone(telefone);
                p.setIdnivel(idnivel);
                p.setNivel(nivel);
                p.setCargo(cargo);
                p.setIdcargo(idcargo);
                p.setLogin(login2);
                p.setSenha(senha2);

            }
            conn.close();

        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.err.println(ex.getMessage());
        }
        return p;
    }

    public static Pessoa logar(String login, String senha) throws Exception {
        try {
            Pessoa pessoa = new Pessoa();
            DaoPessoa conn = new DaoPessoa();
            pessoa = conn.obterFunc(login, senha);
            if (pessoa.getId() == 0) {
                throw new Exception("CPF e/ou senha incorreto(s)");
            }
            return pessoa;
        } catch (Exception e) {
            throw e;
        }
    }

}
