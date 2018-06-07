/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LocadoraVeiculos.PedidoServlet;

import LocadoraVeiculos.DaoPedido;
import LocadoraVeiculos.DaoPlano;
import LocadoraVeiculos.Pedido;
import LocadoraVeiculos.Plano;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
public long DiferencaDatas(String dataInicial, String dataFinal){
		Date data1 = new Date(), data2 = new Date();
		Calendar c1 = Calendar.getInstance();
		//Pega a primeira data
		c1.set(Integer.parseInt(dataInicial.substring(0, 4)), Integer.parseInt(dataInicial.substring(4, 6)), Integer.parseInt(dataInicial.substring(6, 8)));
		data1.setTime(c1.getTimeInMillis());
		//Pega a segunda data
		c1.set(Integer.parseInt(dataFinal.substring(0, 4)), Integer.parseInt(dataFinal.substring(4, 6)), Integer.parseInt(dataFinal.substring(6, 8)));
		data2.setTime(c1.getTimeInMillis());
		return (data2.getTime() - data1.getTime()) /1000/60/60/24;
	}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        DaoPedido conn = new DaoPedido();
        DaoPlano conn2 = new DaoPlano();
        Pedido p = new Pedido();
        String idplano = request.getParameter("idplano");
        String idcarro = request.getParameter("idcarro");
        String idfilial = request.getParameter("idfilial");
        String dtlocacao = request.getParameter("dtlocacao");
        String dtdevolucao = request.getParameter("dtdevolucao");
     
        Plano plan = new Plano();
        try {
            plan = conn2.select(Integer.parseInt(idplano));
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CadastroPedidoServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CadastroPedidoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        java.sql.Date data = null;
        java.sql.Date data2 = null;
        try {
            data = new java.sql.Date(format.parse(dtlocacao).getTime());
            data2 = new java.sql.Date(format.parse(dtdevolucao).getTime());

       
             long tempo1 = data.getTime();  
             long tempo2 = data2.getTime();  
             long difTempo = tempo2 - tempo1;  
             int diasAlug = (int) ((difTempo + 60L * 60 * 1000) / (24L * 60 * 60 * 1000)) + 1;  
            
            double valorT = (diasAlug * plan.getValor());

            p.setDataLocacao((java.sql.Date) data);
            p.setDataDevolucao((java.sql.Date) data2);
            p.setDiasAlugados((int) diasAlug);
            p.setValorTotal(valorT);
            p.setIdCarro(Integer.parseInt(idcarro));
            p.setIdfilial(Integer.parseInt(idfilial));
            p.setIdPlano(plan.getIdplano());
            p.setIdFuncionario(0);
/*PRECISA PEGAR O ID DO USUARIO LOGADO QUE FEZ O PEDIDO*/
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
