package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
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
	
}
