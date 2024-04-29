package mypackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/registra")
public class registra extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public registra() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name= request.getParameter("name");
		String surname= request.getParameter("surname");
		String username= request.getParameter("username");  //abbiamo preso username e password
		String password=request.getParameter("password");
		String confermaPassword=request.getParameter("confermaPassword");
		if(password.equals(confermaPassword)){
			Connection conn=Connessione.getCon(); //abbiamo stabilito una connessione ad db
			try { 
				String sql = "INSERT INTO studente VALUES (null, ?, ?, ?, ?, ?)";
				PreparedStatement smt=conn.prepareStatement(sql);//ci siamo presi le user e password dalla tabella studente 
				smt.setString(1, username);
				smt.setString(2, password);
				smt.setString(3, "s");
				smt.setString(4, name);
				smt.setString(5, surname);
				smt.executeUpdate();
				RequestDispatcher rd3= request.getRequestDispatcher("index.jsp");
				String messaggio="Registrazione avvenuta con successo!";
				request.getSession().setAttribute("messaggio", messaggio);
				request.setAttribute("messaggio", messaggio);
				//response.sendRedirect("index.jsp");
				rd3.include(request, response);
				


			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		} else {
			RequestDispatcher rd3= request.getRequestDispatcher("registrazione.jsp");
			String messaggio="Le due password non corrispondono!";
			request.setAttribute("messaggio", messaggio);
			rd3.forward(request, response);
		}
	}






}
