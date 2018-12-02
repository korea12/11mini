package com.model2.mvc.web.product;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Map;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.purchase.impl.PurchaseServiceImpl;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	public ProductController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	//@RequestMapping("/addProductView.do")
	//public String addProductView() throws Exception{
	@RequestMapping(value="addProduct", method=RequestMethod.GET)
	public String addProduct() throws Exception{
		
		System.out.println("/product/addProduct : GET");
		
		return "redirect:/product/addProductView.jsp";
	}
	
	//@RequestMapping("/addProduct.do")
	//public String addProduct(@ModelAttribute("product")
	//Product product) throws Exception{
@RequestMapping( value="addProduct", method=RequestMethod.POST)
public String addProduct(@ModelAttribute("product") Product product, @RequestParam("uploadFile") MultipartFile uploadFile) throws Exception{
		
		
		String fileName = System.currentTimeMillis()+"."+uploadFile.getOriginalFilename().split("\\.")[1];
		String path ="C:\\workspace\\11.Model2MVCShop\\WebContent\\images\\uploadFiles\\";
		System.out.println(fileName);
		System.out.println(path);
		
		File newFile = new File(path+fileName);
		uploadFile.transferTo(newFile);
		
		
		System.out.println("/product/addProduct : POST");
		product.setFileName(fileName);
		productService.addProduct(product);
		
		return "forward:/product/addProduct.jsp";
	}
	
	//@RequestMapping("/listProduct.do")
	
	
	@RequestMapping(value = "listProduct")
	public String userListProduct( @ModelAttribute("search") Search search , Model model , HttpServletRequest request, HttpSession httpSession) throws Exception{
		
		System.out.println("/product/listProduct : GET/POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map=productService.getProductList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		String menu = request.getParameter("menu");
		System.out.println("menu:"+menu);
		String location = "";
		
		if(menu.equals("manage")) {
			location = "forward:/product/adminListProduct.jsp";
		}else if(menu.equals("search")) {
			location = "forward:/product/userListProduct.jsp";
		}
		
		return location;
	}
	
	//@RequestMapping("/getProduct.do")
	@RequestMapping(value = "getProduct", method=RequestMethod.GET)
	public String getProduct(@RequestParam("prodNo") int prodNo, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		System.out.println("/product/getProduct : GET");
		
		Product product = productService.getProduct(prodNo);
		Purchase purchase = new Purchase();
		purchase.setPurchaseProd(product);
		purchase = purchaseService.getPurchase2(prodNo);
		
				
		model.addAttribute("product", product);
		String distinctCookie="";
		String history = null;
		String cookieValue = prodNo+"@"+product.getFileName();
		
		Cookie[] cookies = request.getCookies();
		if (cookies!=null && cookies.length > 0) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie cookie = cookies[i];
				if (cookie.getName().equals("history")) {
					history = cookie.getValue();
					//cookie.setValue(history+","+cookieValue);
					
					if (history != null && !history.equals("")) {
						String[] distinct = (history+","+cookieValue).split(",");
						
						distinct = new HashSet<String>(Arrays.asList(distinct)).toArray(new String[0]);
						
						System.out.println("server history: "+distinct);
						for(int j=0; j< distinct.length; j++) {
							if (j!=distinct.length-1) {
								distinctCookie= distinctCookie+distinct[j]+",";
							} else {
								distinctCookie= distinctCookie+distinct[j];
							}
							
							System.out.println("distinctCookie:"+distinctCookie);
							
						}
						System.out.println("last: "+distinctCookie);
						cookie.setValue(distinctCookie);
						cookie.setPath("/");
						cookie.setMaxAge(-1);
						response.addCookie(cookie);
					} else {
						cookie = new Cookie("history",cookieValue);
						cookie.setPath("/");
						cookie.setMaxAge(-1);
						response.addCookie(cookie);
					}	
				}else {
					/*Cookie newCookie = new Cookie("history", prodNo+"" );*/
					cookie = new Cookie("history",cookieValue);
					cookie.setPath("/");
					cookie.setMaxAge(-1);
					response.addCookie(cookie);
				}
			}
		}
		
		
		return "forward:/product/getProduct.jsp";
	}
	//@RequestMapping("/updateProductView.do")
	@RequestMapping(value="updateProduct", method=RequestMethod.GET)
	public String updateProduct( @RequestParam("prodNo") int prodNo, Model model) throws Exception{
		System.out.println("/product/updateProduct : GET");
		
		Product product = productService.getProduct(prodNo);
		
		model.addAttribute("product", product);
			
		
		return "forward:/product/updateProduct.jsp";
	}
	
	//@RequestMapping("/updateProduct.do")
	@RequestMapping(value="updateProduct", method=RequestMethod.POST)
	public String updateProduct( @ModelAttribute("product") Product product, Model model, HttpServletRequest request, @RequestParam(value ="uploadFile", required =false) MultipartFile uploadFile)throws Exception{
		System.out.println("/product/updateProduct : POST");
		
		if(uploadFile!=null && !uploadFile.isEmpty()) {
			String fileName = System.currentTimeMillis()+"."+uploadFile.getOriginalFilename().split("\\.")[1];
			String path ="C:\\workspace\\11.Model2MVCShop\\WebContent\\images\\uploadFiles\\";
			System.out.println(fileName);
			System.out.println(path);
			File newFile = new File(path+fileName);
			uploadFile.transferTo(newFile);
		
			product.setFileName(fileName);
		}
		
		
		productService.updateProduct(product);
		
		return "redirect:/product/getProduct?prodNo="+product.getProdNo()+"&menu="+request.getParameter("menu");
	}
	
}
