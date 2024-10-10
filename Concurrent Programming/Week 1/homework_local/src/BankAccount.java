import java.util.concurrent.locks.ReentrantLock;

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

	private final ReentrantLock reentrantLock;
	public BankAccount(double balance, String accountNo) {
		super();
		this.balance = balance;
		this.accountNo = accountNo;
		this.reentrantLock = new ReentrantLock();
	}
	
	// critical section since it access the balance
	// reads the balance 
	public double getBalance() {
		reentrantLock.lock();
        try {
			return balance;
        } finally {
			reentrantLock.unlock();
        }
	}

	public String getAccountNo() {
		return accountNo;
	}
	
	// part of critical section
	public void deposit(double amount) {
		reentrantLock.lock();
        try {
			if(amount >= 0) {
				balance += amount;
			} else {
				throw new IllegalArgumentException("Amount cannot be below ZERO");
			}
			System.out.println(Thread.currentThread().getName()+" balance after deposit "+balance);
        } finally {
            reentrantLock.unlock();
        }
	}
	
	// part of critical section
	public void withdraw(double amount) {
		reentrantLock.lock();
		try {
			if(amount > 0 && balance - amount >= 0) {
				balance -= amount;
			} else {
				throw new IllegalArgumentException("Invalid withdraw amount or insufficient funds");
			}
			System.out.println(Thread.currentThread().getName()+" balance after withdrawal "+balance);
		}
		finally {
			reentrantLock.unlock();
		}
	}
}
