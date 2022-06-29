package test;

import java.util.ArrayList;

import dao.AccountDao;
import model.Account;

public class TestGetAccByName {

    public static void main(String[] args) {
        ArrayList<Account> list = AccountDao.getAccountsByName("th");
        for (Account acc : list) {
            System.out.println(acc.toString());
        }

    }
}
