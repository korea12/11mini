package com.model2.mvc.web.product;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

@RestController
@RequestMapping("/product/*")
public class ProductRestController {
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	public ProductRestController() {
		System.out.println(this.getClass());
	}
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	@RequestMapping(value="json/addProduct", method=RequestMethod.POST)
	public Product addProduct(@RequestBody Product product) throws Exception{
		
		System.out.println("/product/json/addProduct : POST");
		
		productService.addProduct(product);
		System.out.println("\n\n======"+product+"\n\n====");
		
		return product;
	}
	
	@RequestMapping(value="json/getProduct/{prodNo}", method=RequestMethod.GET)
	public Product getProduct(@PathVariable int prodNo)throws Exception{
		System.out.println("/product/json/getProduct : GET");
		
		System.out.println(prodNo);
		return productService.getProduct(prodNo);
	}
	 
	/*@RequestMapping(value="json/listProduct/{search}", method=RequestMethod.GET)
	public Map<String, Object> listProduct()throws Exception{
		System.out.println("/product/json/listProduct: GET");
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		System.out.println("dhdh"+productService.getProductList(search));
		return productService.getProductList(search);
	}*/
	@RequestMapping(value="json/listProduct")
	public Map<String, Object> listProduct(@RequestBody(required=false) Search search)throws Exception{
		System.out.println("/product/json/listProduct: POST");
		System.out.println(search);
		if(search==null) {
			System.out.println("avd");
			search = new Search();
			search.setCurrentPage(1);
			
		}
		System.out.println(search);
		search.setPageSize(pageSize);
		System.out.println(productService.getProductList(search));
		return productService.getProductList(search);
	}
	
	@RequestMapping(value="json/updateProduct/{prodNo}", method=RequestMethod.GET)
	public Product updateProduct(@PathVariable int prodNo)throws Exception{
		System.out.println("/product/json/updateProduct: GET");
		
		return productService.getProduct(prodNo);
	}
	
	@RequestMapping(value="json/updateProduct" , method=RequestMethod.POST)
	public Product updateProduct(@RequestBody Product product) throws Exception{
		System.out.println("/product/json/updateProduct: POST");
		
		productService.getProduct(product.getProdNo());
		System.out.println(productService.getProduct(product.getProdNo()));
		productService.updateProduct(product);
		
		return product;
	}
}
