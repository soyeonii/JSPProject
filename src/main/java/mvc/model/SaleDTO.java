package mvc.model;

import java.sql.Timestamp;

public class SaleDTO {
	private String id;
	private String code;
	private int quantity;
	private Timestamp saleDate;
	private String list;
	private int sum;
	private int number;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Timestamp getSaleDate() {
		return saleDate;
	}

	public void setSaleDate(Timestamp saleDate) {
		this.saleDate = saleDate;
	}

	public String getList() {
		return list;
	}

	public void setList(String list) {
		this.list = list;
	}

	public int getSum() {
		return sum;
	}

	public void setSum(int sum) {
		this.sum = sum;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}
}
