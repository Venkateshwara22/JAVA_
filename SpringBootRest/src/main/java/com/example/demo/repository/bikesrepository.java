package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.demo.entities.bikes;

import jakarta.transaction.Transactional;

@Transactional
@Repository
public interface bikesrepository extends JpaRepository<bikes, Integer> {

	//JPQL
	//ExecuteUpdate(it returns it)
	@Modifying
	@Query("update bikes set bprice =  :price where bikeid = :id")
	public int updateBikePrice(int id, int price);
	
	//executeQuery
	@Query("select b from bikes b where brand = :br ")
	public List<bikes> getbrand(String br);
	
	@Query("select bname from bikes where bprice between :minPrice and :maxPrice")
	public List<String> getBikesinPriceRange(@Param("minPrice") int minPrice, @Param("maxPrice") int maxPrice);

	@Query("select b.bikeid, b.brand from bikes b order by b.bikeid limit 5 offset 5")
	public List<Object []> getBikeAndBrand();
	//Using Object allows for flexibility in handling different data types that may be returned from the database columns.
	//Since there are multiple columns selected, each row in the result set is represented as an array of objects.
	//The array elements correspond to the selected columns in the order they appear in the query.
}
