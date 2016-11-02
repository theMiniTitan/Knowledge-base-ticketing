package Controllers;

import Models.Comment;
import Models.Issue;

import javax.naming.InitialContext;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * Created by Brendan on 19/10/2016.
 */
@WebServlet(urlPatterns = {"/Issue"})
public class GetIssue extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //get issue id from request
        String issueID = request.getParameter("issueID");
        ArrayList<Comment> comments = new ArrayList<>();

        String query = "SELECT * FROM Issue WHERE issueID == "+issueID; //query for the issue with matching id

        GetSQLIssues database = new GetSQLIssues();
        ArrayList<Issue> issues = database.getIssues(query); //return a list containing one issue
        Issue issue = issues.get(0);


        try{ //get all the comments

            javax.sql.DataSource datasource = (javax.sql.DataSource) new
                    InitialContext().lookup("java:/comp/env/SENG2050");

            Connection connection = datasource.getConnection();
            Statement statement = connection.createStatement();
            query = "SELECT * FROM Comment WHERE issueID == "+issueID; //query for all the comments for that issue
            ResultSet result = statement.executeQuery(query);

            while(result.next()){
                Comment comment = new Comment();
                comment.setContent(result.getString(1));
                //need to get the rest of the data
                comments.add(comment);
            }
            issue.setComments(comments);
            request.setAttribute("issue", issue); //pass the issue into the database

            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/jsp/viewIssue.jsp"); //redirect to jsp
            dispatcher.forward(request, response);
        }catch (Exception e){
            String error = "Something went wrong in GetIssue"; //set an error
            request.setAttribute("error", error);

            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/jsp/homepage.jsp"); //redirect back to homepage
            dispatcher.forward(request, response); //might be better off redirecting back to issue list
        }




    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

}