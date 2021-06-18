/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User;
import java.sql.*;
import Connection.MySQLConnUtils;

/**
 *
 * @author Pawel
 */
public class Questionnaire {

                    Connection connection = null;
                    PreparedStatement insertChildren = null;
                    PreparedStatement findId = null;
                    PreparedStatement getLectures = null;
                    PreparedStatement downloadLectures = null;
                    PreparedStatement insertQuestionnaire = null;
                    ResultSet resultSet = null;
                    ResultSet lecturesSet = null;

                    public Questionnaire() {

                        try {
                            connection = MySQLConnUtils.getMySQLConnection();

                            insertChildren = connection.prepareStatement(
                                    "INSERT INTO lectures (leader_id, topic, date, t_start, t_stop, hall) VALUES (?, ?, ?, ?, ?, ?)");
                            findId = connection.prepareStatement(
                                    "SELECT ID FROM users WHERE email = ?");
                            getLectures = connection.prepareStatement(
                                    "SELECT lecture_id FROM signed WHERE user_id = ?");
                            downloadLectures = connection.prepareStatement(
                                    "SELECT id, topic, mail FROM lectures INNER JOIN signed ON lectures.id = signed.lecture_id WHERE mail = ?");
                            insertQuestionnaire = connection.prepareStatement(
                                    "INSERT INTO questionnaire");
                        } catch (SQLException | ClassNotFoundException e) {
                            e.printStackTrace();
                        }
                    }

                    public int setQuestionnaire(int user_id, String email, String best_lectures, int intention, String impression) {

                        int result = 0;

                        try {
                            insertChildren.setInt(1, user_id);
                            insertChildren.setString(2, email);
                            insertChildren.setString(3, best_lectures);
                            insertChildren.setInt(4, intention);
                            insertChildren.setString(5, impression);
                            result = insertChildren.executeUpdate();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }

                        return result;
                    }

                    public ResultSet getID(String email) {
                        ResultSet rs = null;

                        try {
                            findId.setString(1, email);
                            rs = findId.executeQuery();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }

                        return rs;
                    }

                    public ResultSet getLectures(String mail) {
                        ResultSet rs = null;

                        try {
                            downloadLectures.setString(1, mail);
                            rs = downloadLectures.executeQuery();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }

                        return rs;
                    }
                }