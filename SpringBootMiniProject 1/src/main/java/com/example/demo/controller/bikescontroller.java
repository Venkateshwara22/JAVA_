	package com.example.demo.controller;
	
	import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.web.bind.annotation.GetMapping;
	import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
	
	import com.example.demo.entities.bikes;
	import com.example.demo.service.bikesservice;
	
	@RestController
	public class bikescontroller {
	
		@Autowired
		bikesservice bkservice;
		
		@GetMapping("/allbikes")	
		public List<bikes> getAll(){
			return bkservice.getAll();
		}
		
		@PostMapping("/savebikes")
		public bikes savebikes(@RequestBody bikes bk) {
			return bkservice.savebikes(bk);
			
		}
		
		@GetMapping("/getbike")
		public bikes getbike(@RequestParam("bikeid") int id) {
			return bkservice.getbikes(id);
		}
		
		@PutMapping("/updatebikes")
		public int updateBike(@RequestParam("id") int bikeid, @RequestParam("price") int bprice) {
			return bkservice.updateBP(bikeid, bprice);
		}
		
		@GetMapping("/getbrand")
		public List<bikes> getBrand(@RequestParam("br") String brand){
			return bkservice.getbrand(brand);
		}
		
		@GetMapping("/getbikesinbudget")
		public List<String> getBikesinPriceRange(@RequestParam("minPrice") int minPrice, @RequestParam("maxPrice") int maxPrice){
			return bkservice.getBikesinPriceRange(minPrice, maxPrice);
		}
		
		@GetMapping("/bikeAndbrand")
		public Map<Integer, String> getBikeAndBrand(){
			return bkservice.getBikeAndBrand();
		}
		
	}
