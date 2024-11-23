package lk.gugsi.cp.lecture01;

// Monitor class in concurrency 
public class BankAccount {
	
	// for money double is NOT suitable
	// what is the suitable data type for Money?
	private double balance;
	private String accountNo;
	// balance within the bank account object is the 
	// shared resource 
	// code that accessing the balance is known as 
	// critical section 
	// since the balance can change very fast it is 
	// important to either make it volatile or call to
	// balance variable must happen inside synchronized 
	// block
	
	public BankAccount(double balance, String accountNo) {
		super();
		this.balance = balance;
		this.accountNo = accountNo;
	}
	
	// critical section since it access the balance
	// reads the balance 
	public synchronized double getBalance() {
		return balance;
	}
	
	public String getAccountNo() {
		return accountNo;
	}
	
	// part of critical section
	public synchronized void deposit(double amount) {
		if(amount >= 0) {
			balance += amount;
		} else {
			throw new IllegalArgumentException("Amount cannot be less than zero");
		}
		System.out.println(Thread.currentThread().getName()+" balance after deposit "+balance);
	}
	
	// part of critical section
	public synchronized void withdraw(double amount) {
		
		if(amount > 0 && balance - amount >= 0) {
			balance -= amount;
		} else {
			throw new IllegalArgumentException("Invalid withdraw amount or insufficient funds");
		}
		System.out.println(Thread.currentThread().getName()+" balance after withdrawal "+balance);
	}
	
	
	

}
