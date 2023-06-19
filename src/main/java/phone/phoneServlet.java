package phone;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.io.IOException;
import java.util.List;

@WebServlet("/phone")
@MultipartConfig
public class phoneServlet extends HttpServlet {

    private static final long serialVersionUID =  1L;

    private phoneDB phoneDBUtil;

    @Resource(name="jdbc/phone")

    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
        super.init();

        try {
            phoneDBUtil = new phoneDB(dataSource);

        }catch (Exception exc){
            throw new ServletException(exc);
        }
    }


    protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        try {
            String theCommand = request.getParameter("command");
            if(theCommand == null){
                theCommand = "list";
            }
            switch (theCommand){
                case "ADD":
                    addPhone(request,response);
                    break;

                default:
                    phoneList(request,response);
            }
        }
        catch (Exception exc){
            throw new ServletException(exc);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        doGet(request,response);
    }

    private void phoneList(HttpServletRequest request, HttpServletResponse response) throws Exception{
        List<phone> phones = phoneDBUtil.getPhone();

        request.setAttribute("PHONE_LIST",phones);

        RequestDispatcher dispatcher = request.getRequestDispatcher("phoneList.jsp");
        dispatcher.forward(request,response);
    }

    public void addPhone(HttpServletRequest request,HttpServletResponse response) throws Exception{
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String brand = request.getParameter("brand");
        String description = request.getParameter("description");

        phone thePhone = new phone(name,price,brand,description);

        phoneDBUtil.addPhone(thePhone);
        response.sendRedirect(request.getContextPath()+"/phone");
    }
}
