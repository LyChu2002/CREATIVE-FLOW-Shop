package vn.devpro.javaweb26.dto;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class Cart {
	private List<CartProduct> cartProducts = new ArrayList<CartProduct>();

	public Cart() {
		super();
	}

	public Cart(List<CartProduct> cartProducts) {
		super();
		this.cartProducts = cartProducts;
	}

	public List<CartProduct> getCartProducts() {
		return cartProducts;
	}

	public void setCartProducts(List<CartProduct> cartProducts) {
		this.cartProducts = cartProducts;
	}
	
	//Tìm sản phẩm trong giỏ hàng theo id
	public int findProductById(int id) {
		for(int index = 0; index < this.cartProducts.size(); index++) {
			if(this.cartProducts.get(index).getProductId() == id) {
				return index;
			}
		}
		return -1;
	}
	
	//Tính tổng số sản phẩm trong giỏ hàng
	public Integer totalCartProducts() {
		Integer total = 0;
		for(CartProduct cartProduct : cartProducts) {
			total += cartProduct.getQuantity();
		}
		return total;
	}
	
	//Tính tổng tiền hàng
	public BigDecimal totalCartPrice() {
		BigDecimal total = BigDecimal.ZERO;
		for(CartProduct cartProduct : cartProducts) {
			total = total.add(cartProduct.totalPrice());
		}
		return total;
	}
}
