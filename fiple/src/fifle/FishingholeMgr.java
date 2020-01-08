package fifle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import dbcp.DBConnectionMgr;

public class FishingholeMgr {
	private DBConnectionMgr pool;
	
	public FishingholeMgr() {
		try{
			pool = DBConnectionMgr.getInstance();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public FishingholeBean FishingHoleBrowse(String code){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		FishingholeBean flist = new FishingholeBean();
		
		try {
			//어장 정보 구하는 코드
			con = pool.getConnection();
			sql = "SELECT * FROM fishinghole WHERE code=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, code);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			flist.setName(rs.getString(2));
			flist.setEvm(rs.getString(3));
			flist.setAddr1(rs.getString(4));
			flist.setAddr2(rs.getString(5));
			flist.setTel(rs.getString(6));
			flist.setHours(rs.getString(7));
			flist.setCharge(rs.getString(8));
			
			
			//종 구하는 코드
			sql = "SELECT species FROM fholeandfspecies WHERE code=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, code);
			
			rs = pstmt.executeQuery();
			
			Vector<String> species = new Vector<String>();
			while(rs.next()) {
				species.add(rs.getString(1));
			}
			flist.setSpecies(species);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return flist;
	}
	public boolean FishingHoleModify(FishingholeBean bean, String[] spCol) {
		boolean flag = false;
		Connection con = null;
		PreparedStatement pstmtfh = null;
		PreparedStatement pstmtsp1 = null;
		PreparedStatement pstmtsp2 = null;
		String sql = null;
		
		try {
			con = pool.getConnection( );
			//트랜젝션 실행
			try {
				con.setAutoCommit(false);
				//어장 정보 구현
				sql = "UPDATE fishinghole SET name = ?, evm = ?, addr1 = ?, addr2 = ?, tel = ?, hours = ?, charge = ? WHERE code = ?";
				pstmtfh = con.prepareStatement(sql);
				pstmtfh.setString(1, bean.getName( ));
				pstmtfh.setString(2, bean.getEvm( ));
				pstmtfh.setString(3, bean.getAddr1( ));
				pstmtfh.setString(4, bean.getAddr2( ));
				pstmtfh.setString(5, bean.getTel( ));
				pstmtfh.setString(6, bean.getHours( ));
				pstmtfh.setString(7, bean.getCharge( ));
				pstmtfh.setString(8, bean.getCode( ));
				pstmtfh.executeUpdate();
				

				//기존 종 데이터 삭제
				sql = "DELETE FROM fholeandfspecies WHERE code=?";
				pstmtsp1 = con.prepareStatement(sql);
				pstmtsp1.setString(1, bean.getCode());
				pstmtsp1.executeUpdate();


				//갱신된 데이터 입력
				sql = "INSERT INTO fholeandfspecies(code,species) VALUES ";
				
				for(int i = 0; i < spCol.length-1; i++) {
					String s = "('"+bean.getCode()+"','"+spCol[i]+"')";
					sql = sql+s+",";
				}
					sql=sql+"('"+bean.getCode()+"','"+spCol[spCol.length-1]+"')";
					
				pstmtsp2 = con.prepareStatement(sql);
				pstmtsp2.executeUpdate();


				con.commit();
				flag = true;
				
			}catch(SQLException e) {
				e.printStackTrace();
				con.rollback();
			}
			
		}catch(Exception e) {
			e.printStackTrace( );
		}finally {
			pool.freeConnection(con);
		}
		
		return flag;
	}
	
	public boolean FishingholeDelete(String code) {
		boolean flag = false;
		Connection con = null;
		PreparedStatement pstmtsp1 = null;
		PreparedStatement pstmtsp2 = null;
		String sql = null;
		
		try {
			con = pool.getConnection( );
			//트랜젝션 실행
			try {
				con.setAutoCommit(false);
				
				sql = "DELETE FROM fholeandfspecies WHERE code=?";
				pstmtsp1 = con.prepareStatement(sql);
				pstmtsp1.setString(1, code);
				pstmtsp1.executeUpdate();
				
				sql = "DELETE FROM fishinghole WHERE code=?";
				pstmtsp2 = con.prepareStatement(sql);
				pstmtsp2.setString(1, code);
				pstmtsp2.executeUpdate();
				
				con.commit();
				flag = true;
				
			}catch(SQLException e) {
				e.printStackTrace();
				con.rollback();
			}
			
		}catch(Exception e) {
			e.printStackTrace( );
		}finally {
			pool.freeConnection(con);
		}
		
		return flag;
	}
	
	public Vector<String> getFishSpecies() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;

		Vector<String> vlist=new Vector<String>(); 
		
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM fishspecies";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vlist.add(rs.getString(1));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return vlist;
	}
}
