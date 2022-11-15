

<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@page import="java.util.Date.*"%>
<%@page import="java.util.Calendar"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.*"%>
<%@ page
	import="java.util.Properties,javax.mail.*,javax.mail.internet.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFDateUtil"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@ page import="java.io.FileNotFoundException"%>
<%@ page import="java.io.FileOutputStream"%>
<%@ page import="java.io.IOException"%>
<%@ page import="javax.activation.*"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.math.BigDecimal"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.StringTokenizer"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<script>
function Redirect(val)
{
	
	
	location.assign("UploadFleetUser.jsp?msg="+val);    //upload xls sheet page name


   
	
}

function Redirect1()
{
	
	
	alert("Please Upload Standard Format!!");
	
	location.assign("UploadFleetUser.jsp");     //upload xls sheet page name

}

</script>
<%
    System.out.println("in Insert page");
	String file1 = "";
	int saveflag = 1;
	File savedFile = null;
	String[] filepath = new String[10];
	String[] filename = new String[10];
	int count2 = 0, filecount = 0;
	String ShipmentNumber = "";
	String ShipmentNumber1 = "";

	int count = 1;
	String savefilestring = "";
	String uploadedBy = "";

	String user = session.getAttribute("dispalyname").toString();
	
	int count1 = 0;
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	System.out.println("\n\n ismultipart-->>" + isMultipart);
	if (!isMultipart) {
		System.out.println("\n\nin multipart..");
	} else {
		System.out.println("\n\n in else with  multipart..");
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		List items = null;
		try {
			items = upload.parseRequest(request);
			//      System.out.print("\n\n items==>"+items);
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		Iterator itr = items.iterator();

		while (itr.hasNext()) {
			FileItem item = (FileItem) itr.next();
			if (item.isFormField()) {
				String name1 = item.getFieldName();
				System.out.print("\n name==>" + name1);
				String value = item.getString();
				System.out.print("\n value==>" + value);

			} else {
				try {

					String itemName = item.getName();
					System.out.print("\n\nitemName==>" + itemName);
					file1 = itemName;
					if (itemName.equalsIgnoreCase("")) {
					} else {

						// savedFile = new File("/home/user/Desktop/TaskReport/"+itemName);  
						
						savedFile = new File("/home/twtech/" + itemName);                //path where file will be saved on uploading
						//savedFile = new File("/home/ashish/Documents/" + itemName);

						System.out.print("\n\nsavedFile==>" + savedFile);
						item.write(savedFile);
						filepath[filecount] = "" + savedFile;

						filename[filecount] = itemName;
						filecount++;
						if (saveflag == 1) {
							savefilestring = "" + savedFile;
							saveflag++;
						} else
							savefilestring = savefilestring + "," + savedFile;
						//out.print("successfully saved the file");
						//File file = new File(savedFile);
						String screenshot = savedFile.getAbsolutePath();
						// System.out.println("\n\nscreenshot--->>>"+screenshot);
					}

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

	}
	//=============================excel reading code========================
	try {

		//get connection
		Connection conne = null;
		Statement st6 = null, st5 = null, st4 = null,st7 = null, st8 = null, st9 = null;
		String userid = "";

		 String MM_dbConn_DRIVER = "org.gjt.mm.mysql.Driver";
		String MM_dbConn_USERNAME = "";
		String MM_dbConn_PASSWORD = "";
		String MM_dbConn_STRING = "jdbc:mysql://localhost/db_gps";

		try {
			Class.forName(MM_dbConn_DRIVER);

			Connection con2 = DriverManager.getConnection(MM_dbConn_STRING, MM_dbConn_USERNAME,
					MM_dbConn_PASSWORD);
			st4 = con2.createStatement();
			st5 = con2.createStatement();
			st6 = con2.createStatement();
			st7 = con2.createStatement();
			st8 = con2.createStatement();
			st9 = con2.createStatement();

		} catch (Exception e) {
			e.printStackTrace();
		}
 
		//select the taskowner and task creator

		String fname = "/home/twtech/" + file1;   //path from where file is to be read
 		
       //String fname = "/home/ashish/Documents/" + file1;
 		//String fname = "/home/user/Desktop/TaskReport/"+file1;

		System.out.println("The filename is :" + file1);
		System.out.println("The filepath is :" + fname);

		List sheetData = new ArrayList();
		FileInputStream fis = null;
		try {

			fis = new FileInputStream(fname);
			HSSFWorkbook workbook = new HSSFWorkbook(fis);
			HSSFSheet sheet = workbook.getSheetAt(0);
			Iterator rows = sheet.rowIterator();
			while (rows.hasNext()) {
				HSSFRow row = (HSSFRow) rows.next();
				Iterator cells = row.cellIterator();

				List data = new ArrayList();
				while (cells.hasNext()) {
					HSSFCell cell = (HSSFCell) cells.next();
					data.add(cell);

				}

				sheetData.add(data);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (fis != null) {
				fis.close();
			}
		}
		//show excel data=====
		//	System.out.println("The >>>>>>>>>>>>is :");

		int cnt = 0;
		boolean msgpgflg = false;
		ArrayList al = new ArrayList();
		String rjtask = "";
		String seventhdt = "";
		// Iterates the data and print it out to the console.	
		for (int i = 1; i < sheetData.size(); i++) {
			//cnt++;
			String row = "";
			List list = (List) sheetData.get(i);

			try {
				//System.out.println( "IN ntry   ");
				for (int j = 0; j < list.size(); j++) {
					HSSFCell cell = (HSSFCell) list.get(j);

					System.out.println("The cell type is :" + cell.getCellType());

					if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
						System.out.println("IN IFFFFFFFFF    ");
						if (HSSFDateUtil.isCellDateFormatted(cell)) {
							System.out.print(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
									.format(cell.getDateCellValue()));
							System.out.println("hibhihihihih>>>>" + cell.getDateCellValue());
							if (row.equals("")) {
								//System.out.println( "IN another iff ");
								row = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
										.format(cell.getDateCellValue());
							} else {
								row = row + "$" + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
										.format(cell.getDateCellValue());
							}
						} else {
							//	System.out.println( "INanothsr    ELS SSSSSSS ");
							System.out.print(new BigDecimal(cell.getNumericCellValue()).toString());
							if (row.equals("")) {
								row = new BigDecimal(cell.getNumericCellValue()).toString();
							} else {
								row = row + "$" + new BigDecimal(cell.getNumericCellValue()).toString();
							}
						}

					}

					else {
						//System.out.println( "IN mainn     ELS SSSSSSS ");
						System.out.print(cell.toString());
						if (row.equals("")) {
							row = cell.toString();
						} else {
							row = row + "$" + cell.toString();
						}
					}

				}
			} catch (Exception ioe) {
				System.out.println("The exception is :" + ioe);
				ioe.printStackTrace();
			}
			//code for row
			System.out.println("\nThe row is >>  " + row);

			//Insert Row into database
			 String  UserName="",Transporter="",UserType ="",FirstName ="",LastName ="",MobNo ="",Email ="" ;
			 String  Designation ="",typeofuser ="", CompanyName = "",Location ="";			
			 DecimalFormat twoDForm1 = new DecimalFormat("##.##");
			int countFeild = 0;
			try {

				StringTokenizer stringTokenizer = new StringTokenizer(row, "$");
				System.out.println("The total no. of tokens generated :  " + stringTokenizer.countTokens());
				countFeild = stringTokenizer.countTokens();

				
				
				if (stringTokenizer.countTokens() == 11) {   //here 11 is the total number of columns
					System.out.println("INN");
				
				    //get each row value
					UserName = stringTokenizer.nextToken();
					

				    //sysout each row data
					System.out.println("user name:"+UserName);
					
				    
				}
				
				//Trim the  white space
				UserName = UserName.trim();
				
				//processing for each row data
				
				
								
			} catch (Exception e) {
				System.out.println("exceptionnnn===>>" + e);
			}
 
		} //end of for loop of show excel data

		System.out.println("The total number of records in the excel sheet :" + cnt);

		

		
		if (msgpgflg == false) {
			//session.setAttribute("al",al);
			//response.sendRedirect("alertGoTo.jsp?msg=Tasks with from dates "+rjtask+" were rejected&goto=uploadTask.jsp");
			//response.sendRedirect("alertGoTo.jsp?msg=Please Upload Standard Format!!&goto=UploadShipment.jsp");
			//out.println("<script>  Redirect('"+ShipmentNumber1+"');</script>");
		}
		else
		{
			ShipmentNumber1="Done";
			out.println("<script>  Redirect('"+cnt+"');</script>");
			

		}
	} catch (Exception e) {
		System.out.println("Th exception is >>>>>" + e);

	}
%>
