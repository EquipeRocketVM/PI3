/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LocadoraVeiculos.PedidoServlet;

import LocadoraVeiculos.DaoPedido;
import LocadoraVeiculos.Pedido;
import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "CadastroPedidoServlet", urlPatterns = {"/cadastro-pedido"})
public class CadastroPedidoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        // Isso foi colocado para testar o pedido cadastro
         request.getRequestDispatcher("WEB-INF/Pedido/form-pedido-cadastro.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-MM-dd");
        DaoPedido conn = new DaoPedido();
        Pedido p = new Pedido();
        String idplano = request.getParameter("idplano");
        String idcarro = request.getParameter("idcarro");
        String idfilial = request.getParameter("idfilial");
        String dtlocacao = request.getParameter("dtlocacao");
        String dtdevolucao = request.getParameter("dtdevolucao");

        try {
            Date date1 = myFormat.parse(dtlocacao);
            Date date2 = myFormat.parse(dtdevolucao);
            long diff = date2.getTime() - date1.getTime();
            float days = (diff / (1000*60*60*24));
            DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            date1 =  (java.util.Date)formatter.parse(dtlocacao);
            java.sql.Date dataSqlLOC = new java.sql.Date(date1.getTime());
            java.sql.Date dataSqlDEV = new java.sql.Date(date2.getTime());
            
            p.setDataLocacao(date1);
            p.setDataDevolucao(date2);
            p.setDiasAlugados((int) diff);
            p.setValorTotal(days);
                       
            conn.incluir(p);
            System.out.println("PEDIDO ADD KRL! " + p.getValorTotal());   

        } catch (ParseException ex) {
            Logger.getLogger(CadastroPedidoServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CadastroPedidoServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CadastroPedidoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        

            
        
        
        //Isso foi adicionado para testar
         request.setAttribute("pedidoCadastrado", p);

       RequestDispatcher dispatcher
              = request.getRequestDispatcher("WEB-INF/Pedido/resultadoCadastro.jsp");
      dispatcher.forward(request, response);


    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) {
       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }


}
