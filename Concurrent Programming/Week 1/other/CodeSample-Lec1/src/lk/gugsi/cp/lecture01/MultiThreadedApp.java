package lk.gugsi.cp.lecture01;

public class MultiThreadedApp {

	public static void main(String[] args) {
		
		System.out.println(Thread.currentThread().getName());
		
		Thread t1 = new Thread(() -> {
			for(int i = 0; i < 10; i++) {
				System.out.println(Thread.currentThread().getName()+" "+i);
			}
		});
		
		Thread t2 = new Thread(() -> {
			for(int i = 0; i < 10; i++) {
				System.out.println(Thread.currentThread().getName()+" "+i);
			}
		});
		
		Thread t3 = new Thread(() -> {
			for(int i = 0; i < 10; i++) {
				System.out.println(Thread.currentThread().getName()+" "+i);
			}
		});
		
		t1.start();
		t2.start();
		t3.start();

	}

}

//for explanation https://chatgpt.com/share/66f62fd4-13d0-8011-9f6d-b0ac50359064
