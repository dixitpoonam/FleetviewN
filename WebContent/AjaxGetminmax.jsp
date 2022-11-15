<%@page import="java.io.*" import="java.sql.*"%>
<%@page import="java.text.*"%>
<%!Connection con1;%>

<%
	try {

		String MM_dbConn_DRIVER = "com.mysql.jdbc.Driver";
		String DB_NAME4 = "jdbc:mysql://173.234.153.82:3306/db_gps";

		String MM_dbConn_USERNAME = "fleetview";
		String MM_dbConn_PASSWORD = "1@flv";

		Class.forName(MM_dbConn_DRIVER);
		con1 = DriverManager.getConnection(DB_NAME4, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);

		Statement stmt1 = con1.createStatement();
		Statement stmt2 = con1.createStatement();
		ResultSet rs2 = null;
		String sql = "";
		String OwnerName = request.getParameter("owner");
		String vehno = "", vehno2 = "";
		String trans = "";
		String Minhum = "", Maxhum = "", vehno3 = "";
		trans = session.getValue("usertypevalue").toString();
		System.out.println("OwnerName   " + OwnerName);
%>

<%
	sql = "select * from db_gps.t_defaultvals where OwnerName='" + trans + "'";
		System.out.println("sql   " + sql);

		rs2 = stmt2.executeQuery(sql);
		while (rs2.next()) {
			if (OwnerName.equalsIgnoreCase("Sensor1")) {
				vehno = rs2.getString("Mintemp1");

				vehno2 = rs2.getString("Maxtemp1");

			} else if (OwnerName.equalsIgnoreCase("Sensor2")) {
				vehno = rs2.getString("Mintemp2");

				vehno2 = rs2.getString("Maxtemp2");

			} else if (OwnerName.equalsIgnoreCase("Sensor3")) {
				vehno = rs2.getString("Mintemp3");

				vehno2 = rs2.getString("Maxtemp3");

			} else if (OwnerName.equalsIgnoreCase("Sensor4")) {
				vehno = rs2.getString("Mintemp4");

				vehno2 = rs2.getString("Maxtemp4");

			} else if (OwnerName.equalsIgnoreCase("Sensor6")) {
				vehno = rs2.getString("MinHumidity");

				vehno2 = rs2.getString("MaxHumidity");

			}
			 else if (OwnerName.equalsIgnoreCase("Sensor7")) {
					vehno = rs2.getString("Minhumi2");

					vehno2 = rs2.getString("Maxhumi2");

				}
			 else if (OwnerName.equalsIgnoreCase("Sensor8")) {
					vehno = rs2.getString("Minhumi3");

					vehno2 = rs2.getString("Maxhumi3");

				}
			 else if (OwnerName.equalsIgnoreCase("Sensor9")) {
					vehno = rs2.getString("Minhumi4");

					vehno2 = rs2.getString("Maxhumi4");

				}

			if(vehno.equalsIgnoreCase("-") || vehno2.equalsIgnoreCase("-"))
			{
				
				System.out.println("INN:-" + vehno3);

				vehno="0";
				vehno2="90";
			}
			vehno3 = vehno + "#" + vehno2;

		}

		System.out.println("vehno3:-" + vehno3);
		out.println(vehno3);
%>
<%
	} catch (Exception e) {
		out.println(e);
	}
%>