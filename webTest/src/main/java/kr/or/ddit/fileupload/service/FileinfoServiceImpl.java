package kr.or.ddit.fileupload.service;

import java.util.List;

import kr.or.ddit.fileupload.dao.IfileinfoDao;
import kr.or.ddit.fileupload.dao.fileInfoImpl;
import kr.or.ddit.vo.FileinfoVO;

public class FileinfoServiceImpl implements IfileinfoService {

	private IfileinfoDao dao;
	private static FileinfoServiceImpl service;
	
	private FileinfoServiceImpl() {
		dao = fileInfoImpl.getInstance();
	}
	
	public static FileinfoServiceImpl getInstance() {
		if(service==null) service = new FileinfoServiceImpl(); 
		return service;
	}
	
	
	@Override
	public int insertFileinfo(FileinfoVO fileVo) {
		// TODO Auto-generated method stub
		return dao.insertFileinfo(fileVo);
	}

	@Override
	public List<FileinfoVO> getAllFileinfo() {
		// TODO Auto-generated method stub
		return dao.getAllFileinfo();
	}

	@Override
	public FileinfoVO getFileinfo(int fileNo) {
		// TODO Auto-generated method stub
		return dao.getFileinfo(fileNo);
	}
	
	
	
	
}
