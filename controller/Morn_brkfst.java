

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Morn_brkfst
 */
@WebServlet("/Morn_brkfast")
public class Morn_brkfst extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Morn_brkfst() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String id = request.getParameter("id");
		int price=Integer.parseInt(request.getParameter("cost"));
		Morning_Breakfast mornbrf = new Morning_Breakfast();
		boolean b = mornbrf.mornbreakfast(id, price);
		if(b)
		{
			RequestDispatcher view=request.getRequestDispatcher("Morn_brkfst.jsp");
			view.forward(request, response);
		}
	}

}
