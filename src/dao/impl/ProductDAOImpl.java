package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dao.ProductDAO;
import model.Product;
import util.Constants;
import util.DBConnection;
import util.OrderBy;

public class ProductDAOImpl implements ProductDAO {
	
	@Override
	public Product addProduct(Product product) {
		String sql = "INSERT INTO product(name, categoryID, price, details, img) VALUES (?,?,?,?,?)";
		try(
			Connection conn = DBConnection.getCon();
			PreparedStatement ps = conn.prepareStatement(sql);
		){
			ps.setString(1, product.getName());
			ps.setInt(2, product.getCategory().getId());
			//ps.setInt(3, product.getBrand().getId());
			ps.setDouble(3, product.getPrice());
			ps.setString(4, product.getDetails());
                        ps.setString(5, product.getImg());
			ps.executeUpdate();
			return product;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void updateProduct(Product product) {
		String sql = "UPDATE product SET name = ?, categoryID = ?,"
				+ "price = ?, details = ?, img = ? WHERE id = ?";
		try(
			Connection conn = DBConnection.getCon();
			PreparedStatement ps = conn.prepareStatement(sql);
		){
			ps.setString(1, product.getName());
			ps.setInt(2, product.getCategory().getId());
			ps.setDouble(3, product.getPrice());
			ps.setString(4, product.getDetails());
                        ps.setString(5, product.getImg());
                        ps.setInt(6, product.getId());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean removeProduct(int id) {
		String sql = "DELETE FROM product WHERE id = " + id;
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
	public List<Product> getProductsByName(String name, OrderBy orderBy) {
		List<Product> list = new ArrayList<>();
		String sql = "SELECT * FROM product WHERE name LIKE ? ORDER BY " + orderBy.getSomething();
		try(
			Connection conn = DBConnection.getCon();
			PreparedStatement ps = conn.prepareStatement(sql);
		){
			ps.setString(1, name);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Product product = new Product();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setCategory(new CategoryDAOImpl().getCategoryById(rs.getInt("categoryID")));	
				product.setPrice(rs.getDouble("price"));
				product.setDetails(rs.getString("details"));
                                product.setImg(rs.getString("img"));
				list.add(product);
			}
			rs.close();
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Product> getAllProducts(OrderBy orderBy) {
		List<Product> list = new ArrayList<>();
		String sql = "SELECT * FROM product ORDER BY " + orderBy.getSomething();
		try(
			Connection conn = DBConnection.getCon();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
		){
			while(rs.next()) {
				Product product = new Product();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setCategory(new CategoryDAOImpl().getCategoryById(rs.getInt("categoryID")));
				product.setPrice(rs.getDouble("price"));
				product.setDetails(rs.getString("details"));
                                product.setImg(rs.getString("img"));
				list.add(product);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Product> getAllProductsLimit(OrderBy orderBy, int pageId) {
		List<Product> list = new ArrayList<>();
		String sql = "SELECT * FROM product ORDER BY " + orderBy.getSomething()
					+ " LIMIT " + ((pageId - 1) * Constants.NUMBER_PER_PAGES) + "," + Constants.NUMBER_PER_PAGES ;
		try(
			Connection conn = DBConnection.getCon();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
		){
			while(rs.next()) {
				Product product = new Product();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setCategory(new CategoryDAOImpl().getCategoryById(rs.getInt("categoryID")));
				product.setPrice(rs.getDouble("price"));
				product.setDetails(rs.getString("details"));
                                product.setImg(rs.getString("img"));
				list.add(product);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int countProducts() {
		String sql = "SELECT COUNT(*) AS products FROM product";
		try(
			Connection conn = DBConnection.getCon();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
		){
			if(rs.next())
				return rs.getInt("products");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public Product getProductById(int id) {
		String sql = "SELECT * FROM product WHERE id = " + id;
		try(
			Connection conn = DBConnection.getCon();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
		){
			if(rs.next()) {
				Product product = new Product();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setCategory(new CategoryDAOImpl().getCategoryById(rs.getInt("categoryID")));
				product.setPrice(rs.getDouble("price"));
				product.setDetails(rs.getString("details"));
                                product.setImg(rs.getString("img"));
				return product;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Product> getLimitProductsByCategory(int categoryId, OrderBy orderBy, int pageId) {
		List<Product> list = new ArrayList<>();
		String sql = "SELECT * FROM product WHERE categoryID = " + categoryId + " ORDER BY " + orderBy.getSomething()
					+ " LIMIT " + ((pageId - 1) * Constants.NUMBER_PER_PAGES) + "," + Constants.NUMBER_PER_PAGES ;
		try(
			Connection conn = DBConnection.getCon();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
		){
			while(rs.next()) {
				Product product = new Product();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setCategory(new CategoryDAOImpl().getCategoryById(rs.getInt("categoryID")));
				product.setPrice(rs.getDouble("price"));
				product.setDetails(rs.getString("details"));
                                product.setImg(rs.getString("img"));
				list.add(product);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Product> getLimitProductsByKeyWord(String keyword, OrderBy orderBy, int pageId) {
		List<Product> list = new ArrayList<>();
		String sql = "SELECT * FROM product WHERE name LIKE N'%" + keyword + "%' ORDER BY " + orderBy.getSomething()
					+ " LIMIT " + ((pageId - 1) * Constants.NUMBER_PER_PAGES) + "," + Constants.NUMBER_PER_PAGES ;
		try(
			Connection conn = DBConnection.getCon();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
		){
			while(rs.next()) {
				Product product = new Product();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setCategory(new CategoryDAOImpl().getCategoryById(rs.getInt("categoryID")));
				product.setPrice(rs.getDouble("price"));
				product.setDetails(rs.getString("details"));
                                product.setImg(rs.getString("img"));
				list.add(product);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

}
