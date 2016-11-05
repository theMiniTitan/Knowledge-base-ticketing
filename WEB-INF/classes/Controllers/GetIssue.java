package Controllers;

import Models.Comment;
import Models.Issue;
import Models.Notification;
import Models.User;

import javax.naming.InitialContext;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 * Created by Brendan on 19/10/2016.
 *
 */
@WebServlet(urlPatterns = {"/Issue"})
public class GetIssue extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getSession().setAttribute("currentPage", "getIssue");
        request.getSession().setAttribute("error", null);
        request.getSession().setAttribute("success", null);

        User user = (User) request.getSession().getAttribute("user");
        if(user == null || !user.isLoggedIn()){
            response.sendRedirect(getServletContext().getContextPath() + "/index.jsp");
            return;
        }
        //get issue id from request
        String issueID = request.getParameter("issueID");
        ArrayList<Comment> comments = new ArrayList<>();
        //System.out.println("before getIssueQuery");
        String query = "SELECT * FROM Issue WHERE issueID = "+issueID; //query for the issue with matching id

        Database database = new Database();
        ArrayList<Issue> issues = database.getIssues(query); //return a list containing one issue
        Issue issue = issues.get(0);


        if(!issue.getState().equals("KnowledgeBase")){
            try{ //get all the comments
                javax.sql.DataSource datasource = (javax.sql.DataSource) new
                        InitialContext().lookup("java:/comp/env/SENG2050");

                Connection connection = datasource.getConnection();
                Statement statement = connection.createStatement();
                query = "SELECT * FROM UserComment WHERE issueID = '"+issueID+"'"; //query for all the comments for that issue
                ResultSet result = statement.executeQuery(query);

                while(result.next()) {
                    Comment comment = new Comment();
                    comment.setCommentID(result.getInt(1));
                    comment.setSubmissionDateTime(formatDate(result.getString(2)));
                    comment.setContent(result.getString(3));
                    comment.setCommentType(result.getString(4));
                    comment.setUsername(result.getString(5));
                    comment.setIssueID(result.getInt(6));
                    comments.add(comment);
                }

                connection.close();
                result.close();

                issue.setComments(comments);

                //check if the person requesting the issue has permission
                if(user.getUsername() != issue.getUsername() && !user.isStaff() && !issue.getState().equals("knowledgeBase")){
                    request.getSession().setAttribute("error", "Permission not valid for the issue");
                    response.sendRedirect("HomePage");
                    return;
                }


                request.setAttribute("issue", issue); //pass the issue into the database

                //check if the user has a notification associated with this issue
                @SuppressWarnings("unchecked")
                ArrayList<Notification> notifications = (ArrayList<Notification>) request.getSession().getAttribute("notifications");
                for(Notification notification: notifications){
                    if(notification.getIssueID() == issue.getIssueID()){
                        notification.setSeen(true);
                        database.setNotificationToSeen(notification);
                        break;
                    }
                }

            }catch (Exception e) {
                String error = "Something went wrong in Get Issue:"; //set an error
                request.getSession().setAttribute("error", error+e.getMessage());
            }
        }

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/jsp/viewIssue.jsp"); //redirect back to homepage
        dispatcher.forward(request, response); //might be better off redirecting back to issue list
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    private Date formatDate(String str) throws java.text.ParseException
    {
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        Date date = dateFormat.parse(str);
        return date;
    }
}
