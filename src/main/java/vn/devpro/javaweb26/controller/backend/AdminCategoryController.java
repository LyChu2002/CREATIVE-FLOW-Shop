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

import vn.devpro.javaweb26.controller.BaseController;
import vn.devpro.javaweb26.dto.Jw26Constants;
import vn.devpro.javaweb26.dto.SearchModel;
import vn.devpro.javaweb26.model.Category;
import vn.devpro.javaweb26.model.User;
import vn.devpro.javaweb26.service.CategoryService;
import vn.devpro.javaweb26.service.UserService;

@Controller
public class AdminCategoryController extends BaseController implements Jw26Constants{
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private UserService userService;
	
//-------------category-list------------------------
	@RequestMapping(value = "/admin/category-list", method = RequestMethod.GET)
	public String categoryList(final Model model,
			final HttpServletRequest request) throws IOException{
//		List<Category> categories = categoryService.findAll();
//		model.addAttribute("categories", categories);
		
		SearchModel categorySearch = new SearchModel();
		
		//Tìm với tiêu chí status
		categorySearch.setStatus(2);
		if(!StringUtils.isEmpty(request.getParameter("status"))) {
			categorySearch.setStatus(Integer.parseInt(request.getParameter("status")));
		}
		
		//Tìm kiếm với tiêu chí from date to date
		categorySearch.setBeginDate(request.getParameter("beginDate"));
		categorySearch.setEndDate(request.getParameter("endDate"));
		
		
		//Phân trang
		if(!StringUtils.isEmpty(request.getParameter("page"))) {
			categorySearch.setCurrentPage(Integer.parseInt(request.getParameter("page")));
		}else {
			categorySearch.setCurrentPage(1);
		}
		
		List<Category> allCategories = categoryService.searchCategory(categorySearch);
		List<Category> categories = new ArrayList<Category>();
		
		int totalPages = allCategories.size() / SIZE_OF_PAGE;
		if(allCategories.size() % SIZE_OF_PAGE > 0) {
			totalPages++;
		}
		
		if(totalPages < categorySearch.getCurrentPage()) {
			categorySearch.setCurrentPage(1);
		}
		
		int firstIndex = (categorySearch.getCurrentPage() - 1) * SIZE_OF_PAGE;
		int index = firstIndex, count = 0;
		while(index < allCategories.size() && count < SIZE_OF_PAGE) {
			categories.add(allCategories.get(index));
			index++;
			count++;
		}
		
		categorySearch.setTotalItems(allCategories.size());
		categorySearch.setSizeOfPage(SIZE_OF_PAGE);
		
		model.addAttribute("categories", categories);
		model.addAttribute("categorySearch", categorySearch);
		
		return "backend/category-list";
	}

//-----------add new category---------------------------------
	@RequestMapping(value = "/admin/category-add", method = RequestMethod.GET)
	public String categoryAdd(final Model model) throws IOException{
		List<User> users = userService.findAll();
		model.addAttribute("users", users);
		
		Category category = new Category();
		category.setCreateDate(new Date());
		category.setUpdateDate(new Date());
		
		model.addAttribute("category", category);
		return "backend/category-add";
	}
	
//-------------save category to database--------------------------
	@RequestMapping(value = "/admin/category-add-save", method = RequestMethod.POST)
	public String categoryAddSave(final Model model, 
			final HttpServletRequest request, 
			@ModelAttribute("category") Category category)throws IOException{
		if(!StringUtils.isEmpty(request.getParameter("name"))) {
			categoryService.saveOrUpdate(category);
		}
		return "redirect:/admin/category-list";
	}
	
//--------------edit category------------------------------
	@RequestMapping(value = "/admin/category-edit/{categoryId}", method = RequestMethod.GET)
	public String categoryEdit(final Model model,
			@PathVariable("categoryId") int categoryId) throws IOException{
		List<User> users = userService.findAll();
		model.addAttribute("users", users);
		
		Category category = categoryService.getById(categoryId);
		category.setUpdateDate(new Date());
		model.addAttribute("category", category);
		
		return "backend/category-edit";
	}
	
//------------save edit category---------------------------------
	@RequestMapping(value = "/admin/category-edit-save", method = RequestMethod.POST)
	public String categoryEditSave(final Model model,
			final HttpServletRequest request,
			@ModelAttribute("category") Category category) throws IOException{
		categoryService.saveOrUpdate(category);
		return "redirect:/admin/category-list";
	}
//------------delete category------------------------
	@RequestMapping(value = "/admin/category-delete/{categoryId}", method = RequestMethod.GET)
	public String categoryDelete(final Model model,
			@PathVariable("categoryId") int categoryId) throws IOException{
		Category category = categoryService.getById(categoryId);
		category.setStatus(Boolean.FALSE);
		
		categoryService.saveOrUpdate(category);
		return "redirect:/admin/category-list";
	}
}
