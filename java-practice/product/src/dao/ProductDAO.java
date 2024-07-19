package dao;

import java.util.List;
import model.Product;

public interface ProductDAO {

	List<Product> getProducts();
	
	void addProduct(Product product);
	void deleteProduct(Product product);
	void updateProduct(Product product);
}
