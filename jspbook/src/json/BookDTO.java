package json;

public class BookDTO {
	private String name;
	private String writer;
	private int price;
	private String genre;
	private String publisher;
	
	BookDTO(String name, String writer, int price, String genre, String publisher) {
		this.name = name;
		this.writer = writer;
		this.price = price;
		this.genre = genre;
		this.publisher = publisher;
	}

	public String getName() {
		return name;
	}

	public String getWriter() {
		return writer;
	}

	public int getPrice() {
		return price;
	}

	public String getGenre() {
		return genre;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	@Override
	public String toString() {
		return "BookDTO [name=" + name + ", writer=" + writer + ", price=" + price + ", genre=" + genre + ", publisher="
				+ publisher + "]";
	}
	
	
	
}
