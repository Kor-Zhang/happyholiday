package com.happyholiday.admin.officialwebsite.service;

import com.happyholiday.admin.officialwebsite.pageModel.PageOwMembersBack;
import com.happyholiday.admin.officialwebsite.util.OwBackReturnJSON;
import com.happyholiday.model.Admins;


public interface OwMembersBackServiceI {

	void uploadMembers(Admins onlineAdmin, PageOwMembersBack pageModel) throws Exception;

	void updateMembers(Admins onlineAdmin, PageOwMembersBack pageModel) throws Exception;

	void deleteMembers(Admins onlineAdmin, PageOwMembersBack pageModel)
			throws Exception;

	OwBackReturnJSON<PageOwMembersBack> getDatagrid(Admins onlineAdmin,
			PageOwMembersBack pageModel) throws Exception;


}
