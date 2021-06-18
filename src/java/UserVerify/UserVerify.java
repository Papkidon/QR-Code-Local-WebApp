package UserVerify;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserVerify extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String email = request.getParameter("email");

            HttpSession sel = request.getSession();
            sel.setAttribute("Email", email);

            SendEmail sm = new SendEmail();
            String code = sm.getRandom();

            User user = new User(email, code);

            boolean test = sm.sendEmail(user);

            if (test) {
                HttpSession session = request.getSession();
                session.setAttribute("authcode", user);
                response.sendRedirect("userVerify/verify.jsp");
            } else {
                response.sendRedirect("userVerify/verificationFailure.jsp");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
