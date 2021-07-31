<%@page import="com.sun.scenario.effect.ImageData"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.sql.*"%>
<%@page import="com.itextpdf.text.*"%>
<%@page import="com.itextpdf.text.pdf.*"%>

<%
    String stid = request.getParameter("stid");
    String stname = request.getParameter("stname");
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String database = "stangelos";
    String userid = "root";
    String password = "";

    try {
        Class.forName(driver);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Connection conn = null;
    Statement pstmt = null;
    ResultSet resultSet = null;
    try {
        Document doc = new Document();
      
        String file_name = "D:\\" + stid + " Fees Recpt.pdf";
        PdfWriter.getInstance(doc, new FileOutputStream(file_name));
        doc.open();
       String img_name = "D:\\project\\angelos\\web\\pic\\logo.jpg";
        Image data = Image.getInstance(img_name);
        data.scaleToFit(170,50);
        data.setAlignment(Element.ALIGN_CENTER);
        doc.add(data);
        Paragraph para2 = new Paragraph(" ");
        doc.add(para2);
        doc.add(para2);
        doc.add(para2);
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        conn = DriverManager.getConnection(connectionUrl + database, userid, password);
        pstmt = conn.createStatement();
        Paragraph para1 = new Paragraph("Fees Report of " +stname);

        para1.setAlignment(Element.ALIGN_CENTER);
        doc.add(para1);
        doc.add(para2);
        doc.add(para2);

        String sql = "select * from fees where stid="+stid;
        resultSet = pstmt.executeQuery(sql);
        PdfPTable table = new PdfPTable(6);
        PdfPCell c1 = new PdfPCell(new Phrase("Student Id"));
        table.addCell(c1);
        c1 = new PdfPCell(new Phrase("Cheque Details"));
        table.addCell(c1);
        c1 = new PdfPCell(new Phrase("Date"));
        table.addCell(c1);
        c1 = new PdfPCell(new Phrase("Total Fees"));
        table.addCell(c1);
        c1 = new PdfPCell(new Phrase("Fees Paid"));
        table.addCell(c1);
        c1 = new PdfPCell(new Phrase("Fees Due"));
        table.addCell(c1);

        table.setHeaderRows(1);
        while (resultSet.next()) {
            table.addCell(resultSet.getString("stid"));
            table.addCell(resultSet.getString("chqno"));
            table.addCell(resultSet.getString("dt"));
            table.addCell(resultSet.getString("total"));
            table.addCell(resultSet.getString("feespaid"));
            table.addCell(resultSet.getString("feesdue"));
        }
        doc.add(table);
        doc.add(para2);
        doc.add(para2);
        doc.add(para2);
        doc.add(para2);
        Paragraph para3 = new Paragraph("Signature of Receiver");
        para3.setAlignment(Element.ALIGN_CENTER);
        doc.add(para3);
        doc.add(para2);

        doc.close();
        conn.close();
        response.sendRedirect("feespanel.jsp");
    } catch (Exception e) {
        out.print(e);
    }


%> 