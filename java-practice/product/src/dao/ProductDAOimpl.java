package dao;

import java.util.List;
import java.sql.DriverManager;
import java.util.ArrayList;

import model.Product;

public class ProductDAOimpl implements ProductDAO {

	Private Connection getConnection() {
		Class.forName("oracle.jdbc.OracleDriver");
		return DriverManager.getConnection("url", "revature", "password");
	}
	
	@Override
	public List<Product> getProducts() {
		List<Product> products = new ArrayList<Product>();
		Connection conn = getConnection();
		return null;
	}

	@Override
	public void addProduct(Product product) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteProduct(Product product) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateProduct(Product product) {
		// TODO Auto-generated method stub

	}

}
