package com.happyholiday.front.car.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyholiday.front.car.dao.FrontSystemddlDaoI;
import com.happyholiday.front.car.pageModel.PageSystemddl;
import com.happyholiday.front.car.service.FrontSystemddlServiceI;
import com.happyholiday.front.car.util.Tools;
import com.happyholiday.model.Systemddl;

@Service(value = "frontSystemddlService")
public class SystemddlServiceImpl implements FrontSystemddlServiceI {
	private FrontSystemddlDaoI frontSystemddlDao;

	public FrontSystemddlDaoI getFrontSystemddlDao() {
		return frontSystemddlDao;
	}

	@Autowired
	public void setFrontSystemddlDao(FrontSystemddlDaoI frontSystemddlDao) {
		this.frontSystemddlDao = frontSystemddlDao;
	}

	@Override
	public List<PageSystemddl> getSystemddlByParentId(String id)
			throws Exception {
		{
			// 储存查询到的子节点
			List<Systemddl> childrens = null;

			if (id == null || id.equals("") || id.equals("null")) {
				// 获取根节点
				childrens = frontSystemddlDao
						.get("from Systemddl t where t.systemddl is null");
			} else {
				/* 获取子节点 */
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("id", id);
				childrens = frontSystemddlDao.get(
						"from Systemddl t where t.systemddl.id = :id",
						map);

			}
			List<PageSystemddl> systemddls = new ArrayList<PageSystemddl>();
			// 判断是否有节点
			if (childrens != null && !childrens.isEmpty()) {
				// 遍历节点,设置其开闭状态和url
				for (Systemddl menutree : childrens) {
					PageSystemddl systemddl = new PageSystemddl();
					// 获取子节点
					List<Systemddl> list = frontSystemddlDao.get(
							"from Systemddl t where t.systemddl.id=:parentId",
							Tools.getHashMap(new String[] { "parentId" },
									new Object[] { menutree.getId() }));
					BeanUtils.copyProperties(menutree, systemddl);
					// 设置tree节点开闭状态
					if (list != null && !list.isEmpty()) {
						systemddl.setState("closed");
					} else {

						systemddl.setState("opend");
					}
					// 设置url
					Map<String, Object> attributes = new HashMap<String, Object>();
					attributes.put("url", menutree.getUrl());
					// 设置parentid
					attributes.put("parentId", id);
					// 设置high
					attributes.put("high", menutree.getHigh());
					// 设置currthigh
					attributes.put("currtHigh", menutree.getCurrtHigh());
					systemddl.setAttrbutes(attributes);
					// 添加节点
					systemddls.add(systemddl);
				}
			}
			return systemddls;
		}

	}
}
