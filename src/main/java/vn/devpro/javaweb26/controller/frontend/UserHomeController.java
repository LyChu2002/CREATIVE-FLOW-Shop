package vn.devpro.javaweb26.controller.frontend;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.javaweb26.controller.BaseController;
import vn.devpro.javaweb26.dto.SearchModel;
import vn.devpro.javaweb26.model.Product;
import vn.devpro.javaweb26.model.ProductImage;
import vn.devpro.javaweb26.service.ProductImageService;
import vn.devpro.javaweb26.service.ProductService;

@Controller
public class UserHomeController extends BaseController{
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductImageService productImageService;
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response) throws IOException{
		
		SearchModel productSearch = new SearchModel();
		
		productSearch.setPrice(0);
		productSearch.setKeyword(request.getParameter("keyword"));
		productSearch.setPriceSort(2);
		
		if(!StringUtils.isEmpty(request.getParameter("page"))) {
			productSearch.setCurrentPage(Integer.parseInt(request.getParameter("page")));
		}else {
			productSearch.setCurrentPage(1);
		}
		
		List<Product> listProducts = productService.listProducts(productSearch);
		List<Product> products = new ArrayList<Product>();
		
		int sizeOfPage = 8;
		
		int totalPages = listProducts.size() / sizeOfPage;
		if(listProducts.size() % sizeOfPage > 0) {
			totalPages++;
		}
		
		if(totalPages < productSearch.getCurrentPage()) {
			productSearch.setCurrentPage(1);
		}
		
		int firstIndex = (productSearch.getCurrentPage() - 1) * sizeOfPage;
		int index = firstIndex, count = 0;
		while(index < listProducts.size() && count < sizeOfPage) {
			products.add(listProducts.get(index));
			index++;
			count++;
		}
		
		productSearch.setTotalItems(listProducts.size());
		productSearch.setSizeOfPage(sizeOfPage);
		
		model.addAttribute("products", products);
		model.addAttribute("productSearch", productSearch);
		
		List<Product> newProducts = productService.findAllNew();
		model.addAttribute("newProducts", newProducts);
		
		List<Product> gallery = productService.findAllActive();
		model.addAttribute("gallery", gallery);
		return "frontend/index";
	}
	
	@RequestMapping(value = "/product-detail/{productId}", method = RequestMethod.GET)
	public String productDetail(final Model model, final HttpServletRequest request,
			final HttpServletResponse response ,@PathVariable("productId") int productId) throws IOException{
		Product product = productService.getById(productId);
		model.addAttribute("product", product);
		
		List<ProductImage> productImages = productImageService.findAllImageByProduct(productId);
		model.addAttribute("productImages", productImages);
		
		int categoryId = product.getCategory().getId();
		List<Product> productInCategory = productService.findProductByCategory(categoryId);
		model.addAttribute("productInCategory", productInCategory);
		return "frontend/product-detail";
	}
}
