package vn.devpro.javaweb26.controller.frontend;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.javaweb26.controller.BaseController;
import vn.devpro.javaweb26.dto.Cart;
import vn.devpro.javaweb26.dto.CartProduct;
import vn.devpro.javaweb26.dto.Customer;
import vn.devpro.javaweb26.dto.Jw26Constants;
import vn.devpro.javaweb26.model.Product;
import vn.devpro.javaweb26.model.SaleOrder;
import vn.devpro.javaweb26.model.SaleOrderProduct;
import vn.devpro.javaweb26.model.User;
import vn.devpro.javaweb26.service.ProductService;
import vn.devpro.javaweb26.service.SaleOrderService;

@Controller
public class UserCartController extends BaseController implements Jw26Constants {
	@Autowired
	private ProductService productService;

	@Autowired
	private SaleOrderService saleOrderService;

	@RequestMapping(value = "/add-to-cart", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> addToCart(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @RequestBody CartProduct addedProduct) throws IOException {

		Map<String, Object> jsonResult = new HashMap<String, Object>();

		HttpSession session = request.getSession();
		Cart cart = null;
		// Kiểm tra xem có giỏ hàng chưa
		if (session.getAttribute("cart") != null) {// đã có giỏ hàng
			cart = (Cart) session.getAttribute("cart");
		} else {// chưa có
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// Thêm hàng vào giỏ
		// +Lấy product trong DB
		
		if(addedProduct.getQuantity() == null) {
			jsonResult.put("code", 404);
			jsonResult.put("message", "Bạn chưa nhập số lượng");
		}else {
			Product dbProduct = productService.getById(addedProduct.getProductId());
			int index = cart.findProductById(addedProduct.getProductId());
			Integer newQuantity = addedProduct.getQuantity();
			
			if (newQuantity.intValue() < 1) {
				jsonResult.put("code", 404);
				jsonResult.put("message", "Số lượng sản phẩm phải lớn hơn 0");
			}
			else {
				if (index != -1) {// TH1: sản phẩm có trong giỏ => tăng quantity
					cart.getCartProducts().get(index)
							.setQuantity(cart.getCartProducts().get(index).getQuantity() + addedProduct.getQuantity());
				} else {// TH2: sản phẩm chưa có trong giỏ hàng => thêm mới
					addedProduct.setAvatar(dbProduct.getAvatar());
					addedProduct.setProductName(dbProduct.getName());
					addedProduct.setPrice(dbProduct.getPrice());

					cart.getCartProducts().add(addedProduct);
				}

				// Thiết lập biến session cho cart
				session.setAttribute("cart", cart);

				// Trả về tổng số sản phẩm
				model.addAttribute("totalCartProducts", cart.totalCartProducts());

				jsonResult.put("code", 404);
				jsonResult.put("message", "Đã thêm sản phẩm '" + dbProduct.getName() + "' vào giỏ hàng");
				jsonResult.put("totalCartProducts", cart.totalCartProducts());
			}
		}
		
		return ResponseEntity.ok(jsonResult);
	}

	@RequestMapping(value = "/cart-view", method = RequestMethod.GET)
	public String cartView(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {

		// Lấy giỏ hàng
		HttpSession session = request.getSession();
		String errorMessage = null;

		Cart cart = (Cart) session.getAttribute("cart");
		if (cart != null) {
			cart = (Cart) session.getAttribute("cart");// Khong can model attribute cart
			model.addAttribute("totalCartPrice", cart.totalCartPrice());
			model.addAttribute("totalCartProducts", cart.totalCartProducts());
		} else {
			errorMessage = "Chưa có sản phẩm trong giỏ hàng";
		}

		model.addAttribute("errorMessage", errorMessage);
		if(isLogined()) {
			model.addAttribute("user", getLoginedUser());
		}else {
			model.addAttribute("user", new User());
		}
		return "frontend/cart-view";
	}

	@RequestMapping(value = "/update-product-quantity", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> updateProductQuantity(final Model model,
			final HttpServletRequest request, final HttpServletResponse response,
			@RequestBody CartProduct updatedProduct) throws IOException {

		// Lấy giỏ hàng
		HttpSession session = request.getSession();

		Cart cart = (Cart) session.getAttribute("cart");
		int index = cart.findProductById(updatedProduct.getProductId());

		Integer newQuantity = cart.getCartProducts().get(index).getQuantity() + updatedProduct.getQuantity();
		if (newQuantity.intValue() < 1) {
			newQuantity = 1;
		}
		cart.getCartProducts().get(index).setQuantity(newQuantity);

		session.setAttribute("cart", cart);

		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 202);
		jsonResult.put("totalCartProducts", cart.totalCartProducts());
		jsonResult.put("totalCartPrice", cart.totalCartPrice());
		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = "/change-product-quantity", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> updateProductQuantity1(final Model model,
			final HttpServletRequest request, final HttpServletResponse response,
			@RequestBody CartProduct updatedProduct) throws IOException {

		// Lấy giỏ hàng
		HttpSession session = request.getSession();

		Cart cart = (Cart) session.getAttribute("cart");
		int index = cart.findProductById(updatedProduct.getProductId());

		Integer newQuantity = updatedProduct.getQuantity();
		if (newQuantity.intValue() < 1) {
			newQuantity = 1;
		}
		cart.getCartProducts().get(index).setQuantity(newQuantity);

		session.setAttribute("cart", cart);

		Map<String, Object> jsonResult = new HashMap<String, Object>();
		
		jsonResult.put("totalCartProducts", cart.totalCartProducts());
		jsonResult.put("totalCartPrice", cart.totalCartPrice());
		return ResponseEntity.ok(jsonResult);
	}

	@RequestMapping(value = "/product-cart-delete/{productId}", method = RequestMethod.GET)
	public String deleteCartProduct(final Model model, final HttpServletRequest request,
			@PathVariable("productId") int productId) throws IOException {
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		int index = cart.findProductById(productId);

		if (index != -1) {
			cart.getCartProducts().remove(index);
		}

//		if (cart.totalCartProducts() == 0) {
//			cart = null;
//		}

		session.setAttribute("cart", cart);
		model.addAttribute("totalCartPrice", cart.totalCartPrice());
		model.addAttribute("totalCartProducts", cart.totalCartProducts());
		return "redirect:/cart-view";
	}

	@RequestMapping(value = "/place-order", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> placeOrder(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @RequestBody Customer customer) throws IOException {

		Map<String, Object> jsonResult = new HashMap<String, Object>();

		// Kiểm tra thông tin bắt buộc
		if (customer.getTxtName().isEmpty()) {
			jsonResult.put("code", 404);
			jsonResult.put("message", "Bạn chưa nhập họ tên");
		} else if (customer.getTxtMobile().isEmpty()) {
			jsonResult.put("code", 404);
			jsonResult.put("message", "Bạn chưa nhập số điện thoại");
		} else if (customer.getTxtAddress().isEmpty()) {
			jsonResult.put("code", 404);
			jsonResult.put("message", "Bạn chưa nhập địa chỉ");
		} else {
			HttpSession session = request.getSession();
			Cart cart = (Cart) session.getAttribute("cart");
			if (cart != null) {
				if (cart.totalCartProducts().intValue() > 0) {
					SaleOrder saleOrder = new SaleOrder();
					saleOrder.setCode(customer.getTxtMobile());
					saleOrder.setCustomerName(customer.getTxtName());
					saleOrder.setCustomerMobile(customer.getTxtMobile());
					saleOrder.setCustomerEmail(customer.getTxtEmail());
					saleOrder.setCustomerAddress(customer.getTxtAddress());
					saleOrder.setStatus(false);
					saleOrder.setTotal(cart.totalCartPrice());
					saleOrder.setCreateDate(new Date());
					if(isLogined()) {
						saleOrder.setUser(getLoginedUser());
						saleOrder.setUserCreateSaleOrder(getLoginedUser());
					}else {
						User user = new User();
						user.setId(19);
						saleOrder.setUser(user);
					}
					
					for (CartProduct cartProduct : cart.getCartProducts()) {
						SaleOrderProduct saleOrderProduct = new SaleOrderProduct();
						saleOrderProduct.setQuantity(cartProduct.getQuantity());
						Product product = productService.getById(cartProduct.getProductId());
						saleOrderProduct.setProduct(product);
						saleOrder.addRelationalSaleOrderProduct(saleOrderProduct);
					}
					saleOrderService.saveOrUpdate(saleOrder);
					// Xóa giỏ hàng sau khi lưu thành công
					cart = new Cart();
					session.setAttribute("cart", null);
					jsonResult.put("code", 202);
					jsonResult.put("message", "Bạn đã đặt hàng thành công");
				} else {
					jsonResult.put("code", 202);
					jsonResult.put("message", "Không có sản phẩm");
				}
			} else {
				jsonResult.put("code", 202);
				jsonResult.put("message", "Chưa có giỏ hàng");
			}
		}

		return ResponseEntity.ok(jsonResult);
	}
}
