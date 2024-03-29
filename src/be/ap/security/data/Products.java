package be.ap.security.data;

import java.sql.*;

public class Products {
    private static Connection conn;

    static {
        try {
            Class.forName("org.h2.Driver");
            conn = DriverManager.getConnection("jdbc:h2:mem:test", "sa", "");
            conn.createStatement().execute("CREATE TABLE ARTICLES\n" +
                    "(\n" +
                    "    Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,\n" +
                    "    Product_name VARCHAR(50) NOT NULL,\n" +
                    "    Price DECIMAL NOT NULL\n" +
                    ");\n" +
                    "INSERT INTO ARTICLES VALUES(null, 'fuze tea', '1.15');\n" +
                    "INSERT INTO ARTICLES VALUES(null, 'ice tea', '1');\n" +
                    "INSERT INTO ARTICLES VALUES(null, 'green tea', '1.10');");

        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public static String getProducts(String search) throws SQLException {
        StringBuilder query = new StringBuilder("select * FROM ARTICLES");
        if (search != null && !search.equals("")) {
            query.append(" where PRODUCT_NAME like '").append(search).append("'");
        }
        query.append(';');
        Statement statement = conn.createStatement();
        ResultSet resultSet = statement.executeQuery(query.toString());
        StringBuilder stringBuilder = new StringBuilder("<table><tr><th>Id</th><th>Product name</th><th>Price</th></tr>");
        while (resultSet.next()) {
            stringBuilder.append("<tr><td>").append(resultSet.getString(1)).append("</td><td>").append(resultSet.getString(2)).append("</td><td>").append(resultSet.getString(3)).append("</td></tr>");
        }
        stringBuilder.append("</table>");
        return stringBuilder.toString();

    }
}
