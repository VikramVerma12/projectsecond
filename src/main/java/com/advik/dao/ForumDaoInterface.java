package com.advik.dao;

import java.util.*;
import com.advik.model.*;
	
public interface ForumDaoInterface
{
	public void createNewForum(Forum f);
	public List<Forum> getForum();
	public void editForum(Forum user);
	public Forum getForum(int forumUser);
	public void delete(int fid);
	//public List<Forum> getForumList(String UserName);
	public Forum getForum(String forumUser);


	
	
}
