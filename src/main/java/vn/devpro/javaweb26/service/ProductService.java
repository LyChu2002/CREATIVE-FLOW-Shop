package vn.devpro.javaweb26.service;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import vn.devpro.javaweb26.dto.Jw26Constants;
import vn.devpro.javaweb26.dto.SearchModel;
import vn.devpro.javaweb26.model.Product;
import vn.devpro.javaweb26.model.ProductImage;

@Service
public class ProductService extends BaseService<Product> implements Jw26Constants{
	@Override
	public Class<Product> clazz() {
		
		return Product.class;
	}
	
	//Hàm kiểm tra xem file có được upload không
	public boolean isUploadFile(MultipartFile file) {
		if(file == null || file.getOriginalFilename().isEmpty()) {
			return false;
		}
		return true;
	}
	
	//Hàm kiểm tra danh sách file có upload không
	public boolean isUploadFiles(MultipartFile[] files) {
		if(files == null || files.length == 0) {
			return false;
		}
		return true; //Có upload ít nhất 1 file
	}
	
//---------------save new product----------------------------------
	@Transactional
	public Product saveAddProduct(Product product, MultipartFile avatarFile, MultipartFile[] imageFiles) throws IOException{
		if(isUploadFile(avatarFile)) {
			String path = FOLDER_UPLOAD + "Product/Avatar/" + avatarFile.getOriginalFilename();
			File file = new File(path);
			avatarFile.transferTo(file);
			//Lưu đường dẫn vào tbl_product
			product.setAvatar("Product/Avatar/" + avatarFile.getOriginalFilename());;
		}
		
		if(isUploadFiles(imageFiles)) {
			for(MultipartFile imageFile : imageFiles) {
				if(isUploadFile(imageFile)) {
					String path = FOLDER_UPLOAD + "Product/Image/" + imageFile.getOriginalFilename();
					File file = new File(path);
					imageFile.transferTo(file);
					//Lưu đường dẫn vào tbl_product_image
					ProductImage productImage = new ProductImage();
					productImage.setTitle(imageFile.getOriginalFilename());
					productImage.setPath("Product/Image/" + imageFile.getOriginalFilename());
					productImage.setStatus(Boolean.TRUE);
					productImage.setCreateDate(new Date());
					product.addRelationalProductImage(productImage);
				}
			}
		}
		return super.saveOrUpdate(product);
	}
	
//----------save edit product--------------------------------
	@Transactional
	public Product saveEditProduct(Product product, MultipartFile avatarFile, MultipartFile[] imageFiles) throws IOException{
		Product dbProduct = super.getById(product.getId());
		if(isUploadFile(avatarFile)) {
			//Xóa avatar cũ
			String path = FOLDER_UPLOAD + dbProduct.getAvatar();
			File file = new File(path);
			file.delete();
			
			//Lưu avatar file mới vào thư mục Product/Avatar
			path = FOLDER_UPLOAD + "Product/Avatar/" + avatarFile.getOriginalFilename();
			file = new File(path);
			avatarFile.transferTo(file);
			//Lưu dường dẫn vào bảng tbl_product
			product.setAvatar("Product/Avatar/" + avatarFile.getOriginalFilename());
		}
		else {
			product.setAvatar(dbProduct.getAvatar());
		}
		//Lưu imageFile
		if(isUploadFiles(imageFiles)) {
			for(MultipartFile imageFile : imageFiles) {
				if(isUploadFile(imageFile)) {
					String path = FOLDER_UPLOAD + "Product/Image/" + imageFile.getOriginalFilename();
					File file = new File(path);
					imageFile.transferTo(file);
					//Lưu đường dẫn vào tbl_product_image
					ProductImage productImage = new ProductImage();
					productImage.setTitle(imageFile.getOriginalFilename());
					productImage.setPath("Product/Image/" + imageFile.getOriginalFilename());
					productImage.setStatus(Boolean.TRUE);
					productImage.setCreateDate(new Date());
					product.addRelationalProductImage(productImage);
				}
			}
		}
		return super.saveOrUpdate(product);
	}
	
	public List<Product> findAllActive(){
		return super.executeNativeSql("SELECT * FROM tbl_product WHERE status = 1");
	}
	
	public List<Product> findAllNew(){
		return super.executeNativeSql("SELECT * FROM tbl_product WHERE status=1 AND is_new = 1");
	}
	
	public List<Product> findProductByCategory(int categoryId){
		return super.executeNativeSql("SELECT * FROM tbl_product WHERE status = 1 AND category_id = " + categoryId);
	}
//-----------------Search product-----------------------------
	public List<Product> searchProduct(SearchModel productSearch){
		String sql = "SELECT * FROM tbl_product p "
				+ "INNER JOIN tbl_category q ON  p.category_id = q.id WHERE 1=1";
		
		//Tìm kiếm với status
		if(productSearch.getStatus() != 2) {
			sql += " AND p.status = " + productSearch.getStatus();
		}
		
		//Tìm kiếm với category
		if(productSearch.getCategoryId() != 0) {
			sql += " AND p.category_id = " + productSearch.getCategoryId();
		}
		
		//Tìm kiếm với statusQuantity
		if(productSearch.getStatusQuantity() != 2) {
			if(productSearch.getStatusQuantity() == 1) {
				sql += " AND p.warehouse_quantity > 0";
			}
			else if(productSearch.getStatusQuantity() == 0) {
				sql += " AND p.warehouse_quantity = 0";
			}
		}
		
		//Tìm kiếm với keyword
		
		if(!StringUtils.isEmpty(productSearch.getKeyword())) {
			String keyword = productSearch.getKeyword().toLowerCase();
			sql += " AND (LOWER(p.name) like '%" + keyword + "%'" +
				" OR LOWER(p.short_description) like '%" + keyword + "%'" +
				" OR LOWER(p.detail_description) like '%" + keyword + "%'" +
				" OR LOWER(q.name) like '%" + keyword + "%')";
		}
		
		sql += " ORDER BY p.create_date desc";
		

		return super.executeNativeSql(sql);
	}
	
	public List<Product> listProducts(SearchModel searchModel){
		String sql = "SELECT * FROM tbl_product p WHERE status = 1";
		
		if(!StringUtils.isEmpty(searchModel.getKeyword())) {
			String keyword = searchModel.getKeyword().toLowerCase();
			sql += " AND (LOWER(p.name) LIKE '%" + keyword + "%')";
		}
		
		if(searchModel.getPrice() != 0) {
			if(searchModel.getPrice() == 1) {
				sql += " AND p.price BETWEEN 0 AND 200000";
			}else if(searchModel.getPrice() == 2) {
				sql += " AND p.price BETWEEN 200000 AND 400000";
			}else if(searchModel.getPrice() == 3) {
				sql += " AND p.price BETWEEN 400000 AND 800000";
			}else if(searchModel.getPrice() == 4) {
				sql += " AND p.price BETWEEN 800000 AND 1000000";
			}else {
				sql += " AND p.price > 10000000";
			}
		}
		
		if(searchModel.getCategoryId() != 0) {
			sql += " AND p.category_id = " + searchModel.getCategoryId();
		}
		
		if(searchModel.getPriceSort() != 2) {
			if(searchModel.getPriceSort() == 1) {
				sql += " ORDER BY p.price DESC";
			}else {
				sql += " ORDER BY p.price ASC";
			}
		}
		return super.executeNativeSql(sql);
	}
}
