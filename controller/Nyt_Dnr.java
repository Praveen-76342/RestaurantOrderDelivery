

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Nyt_Dnr
 */
@WebServlet("/Nyt_Dnr")
public class Nyt_Dnr extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Nyt_Dnr() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String id = request.getParameter("id");
		int price=Integer.parseInt(request.getParameter("cost"));
		Night_Dinner nytdnr = new Night_Dinner();
		boolean b = nytdnr.Dinner(id, price);
		if(b)
		{
			RequestDispatcher view=request.getRequestDispatcher("Nyt_Dnr.jsp");
			view.forward(request, response);
		
		}
	}

}
