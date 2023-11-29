package com.example.demo.entities;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="bikeinfo")
public class bikes {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int bikeid;
	
	@Column
	String bname;
	
	@Column 
	int bprice;
	
	@Column
	String brand;
	
	@JsonFormat(pattern = "yyyy-MM-dd")
	@Column
    Date date;
	
	public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

	public int getBikeid() {
		return bikeid;
	}

	public void setBikeid(int bikeid) {
		this.bikeid = bikeid;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public int getBprice() {
		return bprice;
	}

	public void setBprice(int bprice) {
		this.bprice = bprice;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public bikes(int bikeid, String bname, int bprice, String brand, Date date) {
		super();
		this.bikeid = bikeid;
		this.bname = bname;
		this.bprice = bprice;
		this.brand = brand;
		this.date = date;
	}

	public bikes() {
		super();
		// TODO Auto-generated constructor stub
	}


	
	
}
