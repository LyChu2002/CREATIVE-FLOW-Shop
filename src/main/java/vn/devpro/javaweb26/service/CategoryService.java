package vn.devpro.javaweb26.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import vn.devpro.javaweb26.dto.SearchModel;
import vn.devpro.javaweb26.model.Category;

@Service
public class CategoryService extends BaseService<Category>{
	@Override
	public Class<Category> clazz() {
		
		return Category.class;
	}
	
	@Transactional
	public void deleteCategoryById(int id) {
		super.deleteById(id);
	}
	
	public List<Category> findAllActive(){
		return super.executeNativeSql("SELECT * FROM tbl_category WHERE status = 1");
	}
	
//---------Search category-------------------------
	public List<Category> searchCategory(SearchModel categorySearch){
		String sql = "SELECT * FROM tbl_category p WHERE 1=1";
		//Tìm kiếm với tiêu chí status
		if(categorySearch.getStatus() != 2) {
			sql += " AND p.status = " + categorySearch.getStatus();
		}
		
		//Tìm kiếm với tiêu chí date to date
		if(!StringUtils.isEmpty(categorySearch.getBeginDate()) && !StringUtils.isEmpty(categorySearch.getEndDate())) {
			String beginDate = categorySearch.getBeginDate();
			String endDate = categorySearch.getEndDate();
			sql += " AND p.create_date BETWEEN '" + beginDate + "' AND '" + endDate + "'";
		}
		return super.executeNativeSql(sql);
	}
}
