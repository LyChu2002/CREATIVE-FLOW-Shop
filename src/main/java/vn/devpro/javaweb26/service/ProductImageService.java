package vn.devpro.javaweb26.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.devpro.javaweb26.model.ProductImage;

@Service
public class ProductImageService extends BaseService<ProductImage>{
	@Override
	public Class<ProductImage> clazz() {
		// TODO Auto-generated method stub
		return ProductImage.class;
	}
	
	public List<ProductImage> findAllImageByProduct(int productId){
		return super.executeNativeSql("SELECT * FROM tbl_product_image WHERE product_id = " + productId + " LIMIT 4");
	}
}
