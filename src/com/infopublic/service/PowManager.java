package com.infopublic.service;

import java.util.List;




import com.infopublic.entity.Page;
import com.infopublic.entity.Pow;
import com.infopublic.util.PageData;

public interface PowManager {
	public List<Pow> getPowlist(PageData pd)throws Exception;
	public Pow getnowPow(PageData pd)throws Exception;
	public List<Pow> getOrgnzdata(Page page) throws Exception; //
	public List<Pow> getdataview(PageData pd)throws Exception;
}
