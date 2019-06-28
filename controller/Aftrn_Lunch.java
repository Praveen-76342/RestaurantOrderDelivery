

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Aftrn_Lunch
 */
@WebServlet("/Aftrn_Lunch")
public class Aftrn_Lunch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Aftrn_Lunch() {
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
		Afternoon_Lunch aftr= new Afternoon_Lunch();
		boolean b = aftr.updateLunch(id, price);
		if(b)
		{
			RequestDispatcher view=request.getRequestDispatcher("Aftrn_Lunch.jsp");
			view.forward(request, response);
		}
	}

}
