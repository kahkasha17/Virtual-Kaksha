package db;

import java.sql.Connection;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

public class DB {
    static Set<String> ar = new TreeSet<>();
    private static Connection con;
    public static int active_users=0;
    public static Connection getCon() {
        return con;
    }

    public static void setCon(Connection aCon) {
        con = aCon;
    }
    public static void addUser(String user)
    {
        ar.add(user);
    }
    public static void delUser(String user)
    {
        ar.remove(user);
    }
    public static Set<String> getUsers()
    {
       return ar;
    }
}
