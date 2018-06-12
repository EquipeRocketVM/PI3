/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LocadoraVeiculos.CarroServlet;

import LocadoraVeiculos.Carro;
import LocadoraVeiculos.DaoCarro;
import LocadoraVeiculos.DaoPlano;
import LocadoraVeiculos.PedidoServlet.CadastroPedidoServlet;
import LocadoraVeiculos.Pessoa;
import LocadoraVeiculos.Plano;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

@WebServlet(name = "CadastroCarroServlet", urlPatterns = {"/cadastro-carro"})
public class CadastroCarroServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Pessoa funcionario = (Pessoa) request.getSession().getAttribute("funcionario");
        if (funcionario == null) {
            response.sendRedirect("index.jsp");
        }
                
        request.getRequestDispatcher("WEB-INF/Carro/form-carro-cadastro.jsp").forward(request, response);
        

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Plano> listaPlano2 = new ArrayList<Plano>();

        try {
            listaPlano2 = DaoPlano.listar();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CadastroCarroServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CadastroCarroServlet.class.getName()).log(Level.SEVERE, null, ex);
        }



        request.setAttribute("listaPlano2", listaPlano2);

        
        Pessoa funcionario = (Pessoa) request.getSession().getAttribute("funcionario");
        if (funcionario == null) {
            response.sendRedirect("index.jsp");
        }

        String carro = request.getParameter("carro");
        String fabricante = request.getParameter("fabricante");
        String cor = request.getParameter("cor");
        String ano = request.getParameter("ano");
        String valor = request.getParameter("valor");
        String plano = request.getParameter("class");

        Carro p1 = new Carro(carro, fabricante, cor, Integer.parseInt(ano), Double.parseDouble(valor), Integer.parseInt(plano));
        DaoCarro con = new DaoCarro();

        try {
            con.incluir(p1);
            System.out.println("Carro adicionado! " + p1.getCarro());
        } catch (Exception e) {

        }

        request.setAttribute("carroCadastrado", p1);

        RequestDispatcher dispatcher
                = request.getRequestDispatcher("WEB-INF/Carro/form-carro-cadastroSucess.jsp");
        dispatcher.forward(request, response);

    }

}
