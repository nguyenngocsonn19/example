package phone;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class phoneDB {

    private DataSource dataSource;

    public phoneDB(DataSource theDataSource){
        dataSource = theDataSource;
    }



   public List<phone> getPhone() throws Exception{
        List<phone> phones = new ArrayList<>();

        Connection connection =null;
        Statement statement =null;
        ResultSet resultSet=null;

        try {
            String url ="jdbc:mysql://localhost:3306/phone";
            String username = "root";
            String password ="";
            Class.forName("com.mysql.jdbc.Driver");

            connection = DriverManager.getConnection(url,username,password);
            String sql = "SELECT * FROM phonetable";

            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);

            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String price = resultSet.getString("price");
                String brand = resultSet.getString("brand");
                String description = resultSet.getString("description");

                phone tempPhone = new phone(id,name,price,brand,description);

                phones.add(tempPhone);
            }
            return phones;


        }finally {
            close(connection,statement,resultSet);
        }
   }

    private void close(Connection connection, Statement statement, ResultSet resultSet) {
        try {
            if (resultSet != null) {
                resultSet.close();
            }
            if (statement != null) {
                statement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            System.out.println("Lỗi khi đóng kết nối cơ sở dữ liệu: " + e.getMessage());
        }
    }


    public void addPhone(phone thePhone) throws Exception{
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            String url ="jdbc:mysql://localhost:3306/phone";
            String username = "root";
            String password ="";
            Class.forName("com.mysql.jdbc.Driver");

            connection = DriverManager.getConnection(url,username,password);

            String sql = "INSERT INTO phonetable ( name, price, brand, description) VALUES (?,?,?,?)";
            statement = connection.prepareStatement(sql);

            statement.setString(1,thePhone.getName());
            statement.setString(2,thePhone.getPrice());
            statement.setString(3,thePhone.getBrand());
            statement.setString(4,thePhone.getDescription());

            statement.execute();
        }finally {
            close(connection,statement,null);
        }
    }


}
