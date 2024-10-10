
public class BankSimulation {

    public static void main(String[] args) {
        BankAccount account = new BankAccount(1000000, "Acc001");
        // when the husband calls the withdraw method he will acquire
        // lock on withdraw method
        // therefore no other thread can call any of the other
        // synchronized method on the above account object
        // any attempt by any other thread to call the synchronized method will
        // fail and that thread will go into BLOCKED state

        Thread husband = new Thread(()-> { account.withdraw(25000);
        }, "House Based Husband");

        Thread wife = new Thread(() -> {
            account.deposit(25000);
        }, "Career Minded Wife");

        Thread bankManager = new Thread(()->{
            synchronized(account) { // at this point of execution lock will be acquired
                double interest = account.getBalance() * 9/100/12/30;
                account.deposit(interest);
            } // lock will be released at this point
        }, "Bank Manager");

        husband.start();
        wife.start();
        bankManager.start();
    }
}
