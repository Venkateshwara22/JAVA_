package com.example.demo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entities.bikes;
import com.example.demo.repository.bikesrepository;

@Service
public class bikesservice {
    
    @Autowired
    bikesrepository brepo;

    public List<bikes> getAll() {
        return brepo.findAll();
    }

    public bikes savebikes(bikes bk) {
        return brepo.save(bk);
    }
    
    public bikes getbikes(int bikeid) {
    	bikes b= null;
    	Optional<bikes> bk = brepo.findById(bikeid);
    	try {
    		b = bk.get();
    	}catch(NoSuchElementException e){
    		b = null;
    	}
    	return b;
    	
    }
    
    public int updateBP(int id, int bprice) {
    	return brepo.updateBikePrice(id, bprice);
    }
    
    public List<bikes> getbrand(String br){
    	return brepo.getbrand(br);
    }
    
    public List<String> getBikesinPriceRange(int minPrice, int maxPrice){
    	return brepo.getBikesinPriceRange(minPrice, maxPrice);
    }
    
   
    public Map<Integer, String> getBikeAndBrand(){
    	List<Object []> result = brepo.getBikeAndBrand();
    	Map<Integer, String> BikeAndBrand = new HashMap<>();
    	for(Object[] row:result) {
    		int bikeid = (int) row[0];
    		String brand = (String) row[1];
    		BikeAndBrand.put(bikeid, brand);
    	}
    	return BikeAndBrand;
    	}
    
    public Set<String> getDistinctBrand(){
    	return brepo.getDistinctBrands();
    }
    
    public void updateBikePricesBelowMax(int maxPrice) {
    	brepo.updateBikePricesBelowMax(maxPrice);
    }
   
}
