package vn.devpro.javaweb26.controller.backend;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import vn.devpro.javaweb26.controller.BaseController;
import vn.devpro.javaweb26.dto.Jw26Constants;
import vn.devpro.javaweb26.dto.SearchModel;
import vn.devpro.javaweb26.model.Category;
import vn.devpro.javaweb26.model.Product;
import vn.devpro.javaweb26.model.User;
import vn.devpro.javaweb26.service.CategoryService;
import vn.devpro.javaweb26.service.ProductService;
import vn.devpro.javaweb26.service.UserService;

@Controller
public class AdminProductController extends BaseController implements Jw26Constants{
	@Autowired
	private UserService userService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CategoryService categoryService;
	
//-------------product-list---------------------------
	@RequestMapping(value = "/admin/product-list", method = RequestMethod.GET)
	public String productList(final Model model,
			final HttpServletRequest request) throws IOException{
//		List<Product> products = productService.findAllActive();
//		model.addAttribute("products", products);
		
		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);
		
		SearchModel productSearch = new SearchModel();
		
		//Tìm với tiêu chí status
		productSearch.setStatus(2);
		if(!StringUtils.isEmpty(request.getParameter("status"))) {
			productSearch.setStatus(Integer.parseInt(request.getParameter("status")));
		}
		
		//Tìm với tiêu chí category
		productSearch.setCategoryId(0);
		if(!StringUtils.isEmpty(request.getParameter("categoryId"))) {
			productSearch.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
		}
		
		//Tìm với tiêu chí statusQuantity
		productSearch.setStatusQuantity(2);
		if(!StringUtils.isEmpty(request.getParameter("statusQuantity"))) {
			productSearch.setStatusQuantity(Integer.parseInt(request.getParameter("statusQuantity")));
		}
		
		//Tìm với tiêu chí keyword
		
		productSearch.setKeyword(request.getParameter("keyword"));
		
		
		//bat dau phan trang
		if(!StringUtils.isEmpty(request.getParameter("page"))) {//Bấm nút chuyển trang
			productSearch.setCurrentPage(Integer.parseInt(request.getParameter("page")));
		}
		else {
			productSearch.setCurrentPage(1);//Lần đầu truy cập luôn hiển thị trang 1
		}

		List<Product> allProducts = productService.searchProduct(productSearch);//Tim kiem cac sp thoa man dk
		List<Product> products = new ArrayList<Product>();
		
		//Tong so trang nho hon trang hien tai
		int totalPages = allProducts.size() / SIZE_OF_PAGE;
		if(allProducts.size() % SIZE_OF_PAGE > 0) {
			totalPages++;
		}
		
		if(totalPages < productSearch.getCurrentPage()) {
			productSearch.setCurrentPage(1);
		}
		
		int firstIndex = (productSearch.getCurrentPage() -  1) * SIZE_OF_PAGE;
		int index = firstIndex, count = 0;
		while(index < allProducts.size() && count < SIZE_OF_PAGE) {
			products.add(allProducts.get(index));
			index++;
			count++;
		}
		
		//phân trang
				
		productSearch.setSizeOfPage(SIZE_OF_PAGE);//So ban ghi tren 1 trang
		productSearch.setTotalItems(allProducts.size());//Tong so san pham
		
		
		model.addAttribute("products", products);
		model.addAttribute("productSearch", productSearch);
				
		
		return "backend/product-list";
	}
//------------add new product-------------------------
	@RequestMapping(value = "/admin/product-add", method = RequestMethod.GET)
	public String productAdd(final Model model) throws IOException{
		List<Category> categories = categoryService.findAllActive();
		model.addAttribute("categories", categories);
		
		List<User> users = userService.findAllActive();
		model.addAttribute("users", users);
		
		Product product = new Product();
		product.setCreateDate(new Date());
		product.setUpdateDate(new Date());
		model.addAttribute("product", product);
		
		return "backend/product-add";
	}
//-----------------save new product-----------------------
	@RequestMapping(value = "/admin/product-add-save", method = RequestMethod.POST)
	public String productAddSave(final Model model,
			final HttpServletRequest request,
			@ModelAttribute("product") Product product,
			@RequestParam("avatarFile") MultipartFile avatarFile,
			@RequestParam("imageFiles") MultipartFile[] imageFiles) throws IOException{
//		if(!StringUtils.isEmpty(request.getParameter("category.id"))) {
//			productService.saveOrUpdate(product);
//		}
		productService.saveAddProduct(product, avatarFile, imageFiles);
		
		return "redirect:/admin/product-list";
	}
//----------------edit product------------------------------
	@RequestMapping(value = "/admin/product-edit/{productId}", method = RequestMethod.GET)
	public String productEdit(final Model model,
			@PathVariable("productId") int productId) throws IOException{
		Product product = productService.getById(productId);
		model.addAttribute("product", product);
		
		List<User> users = userService.findAllActive();
		model.addAttribute("users", users);
		
		List<Category> categories = categoryService.findAllActive();
		model.addAttribute("categories", categories);
		
		return "backend/product-edit";
	}
//---------------save edit product-------------------------
	@RequestMapping(value = "/admin/product-edit-save", method = RequestMethod.POST)
	public String productEditSave(final Model model,
			final HttpServletRequest request,
			@ModelAttribute("product") Product product,
			@RequestParam("avatarFile") MultipartFile avatarFile,
			@RequestParam("imageFiles") MultipartFile[] imageFiles)throws IOException{
		productService.saveEditProduct(product, avatarFile, imageFiles);
		return "redirect:/admin/product-list";
	}
//------------delete product---------------------------------
	@RequestMapping(value = "/admin/product-delete/{productId}", method = RequestMethod.GET)
	public String productDelete(final Model model,
			@PathVariable("productId") int productId) throws IOException{
		Product product = productService.getById(productId);
		product.setStatus(Boolean.FALSE);
		productService.saveOrUpdate(product);
		return "redirect:/admin/product-list";
	}
}
