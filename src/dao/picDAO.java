package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import imnu.Position;
import util.DBUtil;
public class picDAO {
	public List <String>getPicList(){
		List<String>list=new ArrayList<String>();
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//list=null;
		String sql="SELECT pic_path FROM tb_pic";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String path=rs.getString("pic_path");
				list.add(path);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.closeJDBC(rs, pstmt, conn);
		}
		return list;
	}
}
