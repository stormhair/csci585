import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Hw2{
	public static void main(String[] args)
	{
		String err = "java hw2 [window/within/nearest-neighbor/fixed] [argument list]";
		if(args.length<2)
		{
			
			System.out.println(err);
			System.exit(0);
		}
		String cmd;
		String jdbcDriver = "oracle.jdbc.driver.OracleDriver";
		String jdbcString = "jdbc:oracle:thin:@localhost:1521:orcl";
		String userName = "scott";
		String password = "tiger";
		String query = "";
		ResultSet rs = null;
		Connection conn = null;
		Statement stmt = null;
		try{
			Class.forName(jdbcDriver);
			conn = DriverManager.getConnection(jdbcString, userName, password);
			stmt = conn.createStatement();
			/*
			query = "SELECT * FROM student";
			rs = stmt.executeQuery(query);
			while(rs.next())
			{
				System.out.println(rs.getString("stu_id"));
			}
			*/
			cmd = args[0];
			if(cmd.equals("window")){
				if(args[1].equals("building")){
					query = "SELECT build_id obj_id FROM building b "
							+"WHERE SDO_GEOM.RELATE(b.area, 'ANYINTERACT', "
							+"SDO_GEOMETRY(2003, null, null, SDO_ELEM_INFO_ARRAY(1, 1003, 3), "
							+"SDO_ORDINATE_ARRAY([1], [2], [3], [4])), 0.005) = 'TRUE'";
				}
				else if(args[1].equals("student")) {
					query = "SELECT stu_id obj_id FROM student s "
							+"WHERE SDO_GEOM.RELATE(s.position, 'INSIDE', "
							+"SDO_GEOMETRY(2003, null, null, SDO_ELEM_INFO_ARRAY(1, 1003, 3), "
							+"SDO_ORDINATE_ARRAY([1], [2], [3], [4])), 0.005) = 'INSIDE'";
				}
				else if(args[1].equals("tramstops")) {
					query = "SELECT stop_id obj_id FROM tramstop t "
							+"WHERE SDO_GEOM.RELATE(t.center, 'INSIDE', "
							+"SDO_GEOMETRY(2003, null, null, SDO_ELEM_INFO_ARRAY(1, 1003, 3), "
							+"SDO_ORDINATE_ARRAY([1], [2], [3], [4])), 0.005) = 'INSIDE'";
				}
				else {
					System.out.println("The argument should be building, student, or tramstops.");
				}
				query = query.replace("[1]", args[2]).replace("[2]", args[3]).replace("[3]", args[4]).replace("[4]", args[5]);
				//
				//System.out.println(query);
				//
				rs = stmt.executeQuery(query);
				if(rs!=null) {
					while(rs.next())
					{
						System.out.println(rs.getString("obj_id"));
					}
				}
			} else if(cmd.equals("within")) {
				query = "( "
							+"select b.build_id obj_id "
							+"from student s, building b "
							+"where s.stu_id = '[sid]' and sdo_geom.within_distance(s.position, [dis], b.area, 0.005) = 'TRUE' "
						+") "
						+"union "
						+"( "
							+"select t.stop_id obj_id "
							+"from student s, tramstop t "
							+"where s.stu_id = '[sid]' and sdo_geom.within_distance(s.position, [dis], t.center, 0.005) = 'TRUE' "
						+")";
				query = query.replace("[sid]", args[1]).replace("[dis]", args[2]);
				rs = stmt.executeQuery(query);
				if(rs!=null) {
					while(rs.next())
					{
						System.out.println(rs.getString("obj_id"));
					}
				}
			} else if(cmd.equals("nearest-neighbor")) {
				if(args[1].equals("student")) {
					query = "select s.stu_id obj "
						+"from student ss, student s "
						+"where ss.stu_id = '[id]' and s.stu_id != '[id]' and SDO_NN(s.position, ss.position, 'sdo_num_res = [n]', 1) = 'TRUE'";
				} else if(args[1].equals("building")) {
					query = "select b.build_id obj "
						+"from building bb, building b "
						+"where bb.build_id = '[id]' and b.build_id != '[id]' and SDO_NN(b.area, bb.area, 'sdo_num_res = [n]', 1) = 'TRUE'";
				} else if(args[1].equals("tramstops")) {
					query = "select t.stop_id obj "
						+"from tramstop tt, tramstop t "
						+"where tt.stop_id = '[id]' and t.stop_id != '[id]' and SDO_NN(t.center, tt.center, 'sdo_num_res = [n]', 1) = 'TRUE'";
				}
				int n = Integer.valueOf(args[3])+1;
				query = query.replace("[id]", args[2]).replace("[n]", Integer.toString(n));
				rs = stmt.executeQuery(query);
				if(rs!=null) {
					while(rs.next())
					{
						System.out.println(rs.getString("obj"));
					}
				}
			} else if(cmd.equals("fixed")) {
				if(args[1].equals("1")) {
					query = "(select s.stu_id obj "
							+"from student s, tramstop t "
							+"where t.stop_id = 't2ohe' and sdo_geom.sdo_distance(s.position, t.center, 0.005)<t.radius "
							+"intersect "
							+"select s.stu_id obj "
							+"from student s, tramstop t "
							+"where t.stop_id = 't6ssl' and sdo_geom.sdo_distance(s.position, t.center, 0.005)<t.radius "
							+") "
							+"union "
							+"( "
							+"select b.build_id obj "
							+"from building b, tramstop t "
							+"where t.stop_id = 't2ohe' and sdo_geom.sdo_distance(b.area, t.center, 0.005)<t.radius "
							+"intersect "
							+"select b.build_id obj "
							+"from building b, tramstop t "
							+"where t.stop_id = 't6ssl' and sdo_geom.sdo_distance(b.area, t.center, 0.005)<t.radius "
							+")";
					rs = stmt.executeQuery(query);
					if(rs!=null) {
						while(rs.next()) {
							System.out.println(rs.getString("obj"));
						}
					}
				} else if(args[1].equals("2")) {
					query = "select s.stu_id stu, t.stop_id stops "
							+"from tramstop t, student s "
							+"where SDO_NN(t.center, s.position, 'SDO_NUM_RES=2', 1) = 'TRUE'";
					rs = stmt.executeQuery(query);
					if(rs!=null) {
						System.out.println("Student Stops");
						while(rs.next()) {
							System.out.println(rs.getString("stu")+" "+rs.getString("stops"));
						}
					}
				} else if(args[1].equals("3")) {
					query = "select stop_id as tramstop "
							+"from "
							+"( "
							+"select t.stop_id as stop_id, count(b.build_id) as num_build "
							+"from building b, tramstop t "
							+"where sdo_geom.sdo_distance(t.center, b.area, 0.005)<=250 "
							+"group by t.stop_id "
							+"order by num_build desc "
							+") "
							+"where rownum<=1";
					rs = stmt.executeQuery(query);
					if(rs!=null) {
						while(rs.next()) {
							System.out.println(rs.getString("tramstop"));
						}
					}
				} else if(args[1].equals("4")) {
					query = "select top_stu "
							+"from "
							+"( "
							+"select ss.stu_id top_stu, count(bb.build_id) num "
							+"from building bb, student ss "
							+"where ss.stu_id = (select s.stu_id stu "
							+"from building b, student s "
							+"where bb.build_id = b.build_id and sdo_nn(s.position, b.area, 'sdo_num_res = 1', 1) = 'TRUE' "
							+") "
							+"group by ss.stu_id "
							+"order by num desc "
							+") "
							+"where rownum<=5";
					rs = stmt.executeQuery(query);
					if(rs!=null) {
						while(rs.next()) {
							System.out.println(rs.getString("top_stu"));
						}
					}
				} else if(args[1].equals("5")) {
					query = "select min(x) llx, min(y) lly, max(x) urx, max(y) ury "
							+"from building b, table(sdo_util.getvertices(b.area)) p "
							+"where b.build_name like 'SS%'";
					rs = stmt.executeQuery(query);
					if(rs!=null) {
						System.out.println("The MBR is:");
						while(rs.next()) {
							System.out.println("("+rs.getString("llx")+", "+rs.getString("lly")+")"+", ("
												+rs.getString("urx")+", "+rs.getString("ury")+")");
						}
					}
				} else {
					System.out.println("java Hw2 fixed [1~5]");
				}
			} else {
				System.out.println(err);
			}
		}catch(SQLException sqlEx){
			sqlEx.printStackTrace();
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null) rs.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
	}
}