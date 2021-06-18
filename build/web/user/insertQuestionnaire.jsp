<%@page import="java.sql.*"%>
<%@page import="Connection.MySQLConnUtils"%>
<%@page import="User.InsertQuestionnaire"%>
<%@page import="User.Questionnaire"%>

<%

    int uid = 0;
    Questionnaire qrs = new Questionnaire();
    String email1 = session.getAttribute("Email").toString();
    ResultSet rs_id = qrs.getID(email1);

    while (rs_id.next()) {
        uid = rs_id.getInt("id");
    }

    String choosesports = "";
    String lectures[] = request.getParameterValues("lectureTopics");
    String lecture = String.join(",", lectures);
    int intention = Integer.parseInt(request.getParameter("intention"));
    String spec = request.getParameter("spec");
    
    InsertQuestionnaire insq = new InsertQuestionnaire();
    int k = insq.setQuestionnaire(uid, email1, lecture, intention, spec);
    
    if(k == 1){
        out.println("Ankieta wypelniona poprawnie!\nDziekujemy!");
    } else {
        out.println("Nie udalo sie wyslac ankiety. Prosze sprobowac ponownie pozniej.");
    }


%>