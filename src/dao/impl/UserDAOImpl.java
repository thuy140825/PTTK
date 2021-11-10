package dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dao.UserDAO;
import model.Customer;
import util.Common;
import util.DBConnection;

public class UserDAOImpl implements UserDAO {

    @Override
    public Customer addUser(Customer user) {
        String sql = "INSERT INTO account(username, password, full_name, email, address, phone, created_date, role) VALUES (?,?,?,?,?,?,?,?)";
        try(
            Connection conn = DBConnection.getCon();
            PreparedStatement ps = conn.prepareStatement(sql);
        ){
            ps.setString(1, user.getUsername());
            ps.setString(2, Common.MD5(user.getPassword()));
            ps.setString(3, user.getFullName());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getAddress());
            ps.setString(6, user.getPhone());
            ps.setString(7, Common.dateToString(new Date(System.currentTimeMillis())));
            ps.setInt(8, user.getIsAdmin());
            ps.executeUpdate();
            return user;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void updateUser(Customer user) {
        String sql = "UPDATE account SET username = ?, password = ?, full_name = ?, email = ?,"
                        + "address = ?, phone = ?, role = ? WHERE id = ?";
        try(
            Connection conn = DBConnection.getCon();
            PreparedStatement ps = conn.prepareStatement(sql);
        ){
            ps.setString(1, user.getUsername());
            ps.setString(2, Common.MD5(user.getPassword()));
            ps.setString(3, user.getFullName());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getAddress());
            ps.setString(6, user.getPhone());
            ps.setInt(7, user.getIsAdmin());
            ps.setInt(8, user.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean removeUser(int id) {
        String sql = "DELETE FROM account WHERE id = " + id;
        try(
            Connection conn = DBConnection.getCon();
        ){
            return conn.createStatement().executeUpdate(sql) > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean isDuplicate(String username, String email) { // tra ve true neu trung username hoac email
        String sql = "SELECT * FROM account WHERE username = ? OR email = ?";
        try(
            Connection conn = DBConnection.getCon();
            PreparedStatement ps = conn.prepareStatement(sql);
        ){
            ps.setString(1, username);
            ps.setString(2, email);
            if(ps.executeQuery().next())
                return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Customer getUserByUserName(String username) {
        String sql = "SELECT * FROM account WHERE username = '" + username +"'";
        try(
            Connection conn = DBConnection.getCon();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
        ){
            Customer user = null;
            while(rs.next()) {
                user = new Customer();
                user.setId(rs.getInt("id"));
                user.setAddress(rs.getString("address"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setFullName(rs.getString("full_name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setCreatedDate(Common.dateToString(rs.getDate("created_date")));
                user.setIsAdmin(rs.getInt("role"));
            }
            return user;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Customer> getListUser() {
        List<Customer> list = new ArrayList<>();
        String sql = "SELECT * FROM account";
        try(
            Connection conn = DBConnection.getCon();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
        ){
            while(rs.next()) {
                Customer user = new Customer();
                user.setId(rs.getInt("id"));
                user.setAddress(rs.getString("address"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setFullName(rs.getString("full_name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setCreatedDate(Common.dateToString(rs.getDate("created_date")));
                user.setIsAdmin(rs.getInt("role"));
                list.add(user);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean checkLoginInfo(String username, String password) {
        String sql = "SELECT * FROM account WHERE username = ? AND password = ? AND banned = 0";
        try(
            Connection conn = DBConnection.getCon();
            PreparedStatement ps = conn.prepareStatement(sql);
        ){
            ps.setString(1, username);
            ps.setString(2, password);
            if(ps.executeQuery().next())
                return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public int countUsers() {
        String sql = "SELECT COUNT(*) AS 'tong' FROM account";
        try(
            Connection conn = DBConnection.getCon();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
        ){
            if(rs.next()) 
                return rs.getInt("tong");
        } catch (SQLException e) {
                e.printStackTrace();
        }
        return 0;
    }

    @Override
    public String getUserFullNameByIdUser(int id) {
        String sql = "SELECT full_name FROM account WHERE id = " + id;
        try(
            Connection conn = DBConnection.getCon();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
        ){
            if(rs.next()) 
                return rs.getString("full_name");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Customer getUserByUserId(int id) {
        String sql = "SELECT * FROM account WHERE id = '" + id +"'";
        try(
            Connection conn = DBConnection.getCon();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
        ){
            Customer user = null;
            while(rs.next()) {
                user = new Customer();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setFullName(rs.getString("full_name"));
                user.setEmail(rs.getString("email"));
                user.setAddress(rs.getString("address"));
                user.setPhone(rs.getString("phone"));
                user.setIsAdmin(rs.getInt("role"));
            }
            return user;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
