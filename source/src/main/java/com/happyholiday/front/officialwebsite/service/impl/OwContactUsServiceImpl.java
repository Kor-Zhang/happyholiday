package com.happyholiday.front.officialwebsite.service.impl;

import java.sql.Timestamp;
import java.util.Date;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.SendFailedException;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyholiday.PubStatic;
import com.happyholiday.front.officialwebsite.OwFrontStatic;
import com.happyholiday.front.officialwebsite.dao.OwContactUsDaoI;
import com.happyholiday.front.officialwebsite.exception.OfficialwebsiteException;
import com.happyholiday.front.officialwebsite.pageModel.PageOwContactUs;
import com.happyholiday.front.officialwebsite.service.OwContactUsServiceI;
import com.happyholiday.front.officialwebsite.util.OwFrontTools;
import com.happyholiday.model.OfficialwebsiteContactUs;
import com.happyholiday.util.PubConfig;
import com.happyholiday.util.PubMail;
@Service(value="owContactUsService")
public class OwContactUsServiceImpl implements OwContactUsServiceI{
	//注入owIndexDisplayDao
	private OwContactUsDaoI owContactUsDao;
	
	public OwContactUsDaoI getOwContactUsDao() {
		return owContactUsDao;
	}
	@Autowired
	public void setOwContactUsDao(OwContactUsDaoI owContactUsDao) {
		this.owContactUsDao = owContactUsDao;
	}

	
	@Override
	public void saveContactUsMsg(PageOwContactUs pageModel)
			throws Exception {
		//验证邮箱是否为空
		if(OwFrontTools.isEmptyTrimString(pageModel.getEmail())){
			throw new OfficialwebsiteException("请填写email信息！");
		}
		//验证邮箱格式
		/*String format = "^\\s*\\w+(?:\\.{0,1}[\\w-]+)*@[a-zA-Z0-9]+(?:[-.][a-zA-Z0-9]+)*\\.[a-zA-Z]+\\s*$";
		if(!format.matches(pageModel.getEmail())){
			throw new OfficialwebsiteException("请填写正确的邮箱格式");
		}*/
		//验证姓名是否为空
		if(OwFrontTools.isEmptyTrimString(pageModel.getPersonOrOrg())){
			throw new OfficialwebsiteException("请填写您的姓名/组织");
		}
		//验证留言信息是否为空
		if(OwFrontTools.isEmptyTrimString(pageModel.getMsg())){
			throw new OfficialwebsiteException("请填写留言信息");
		}
		OfficialwebsiteContactUs owContactUs = new OfficialwebsiteContactUs();
		BeanUtils.copyProperties(pageModel, owContactUs);
		owContactUs.setId(UUID.randomUUID().toString());
		owContactUs.setCreateTime(new Timestamp(new Date().getTime()));
		owContactUs.setUpdateTime(new Timestamp(new Date().getTime()));
		owContactUs.setStatus(OwFrontStatic.OFFICIALWEBSITE_CONTACT_US_STATUS_SUBMITED);
		owContactUs.setIsDelete(false);
		owContactUsDao.save(owContactUs);

		//开启一个线程发送邮件
		final String email = owContactUs.getEmail();
		final PubMail mail = new PubMail();
		final String content = (String) mail.getConfig("userAdviceContent");
		final String subject = (String) mail.getConfig("userAdviceSubject");
		try{
			new Thread(new Runnable() {
				
				@Override
				public void run() {
					// send mail
					
					try {
						mail.sendMessage(email, subject, content);
					} catch (Exception e) {
						e.printStackTrace();
						
					}
				}
			}).start();;
						
		}catch(Exception e){
			e.printStackTrace();
			throw new Exception("发送邮箱失败");
		}
	}
	
}
