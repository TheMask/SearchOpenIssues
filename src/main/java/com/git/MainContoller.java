package main.java.com.git;

import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.eclipse.egit.github.core.Issue;
import org.eclipse.egit.github.core.Repository;
import org.eclipse.egit.github.core.client.GitHubClient;
import org.eclipse.egit.github.core.service.IssueService;
import org.eclipse.egit.github.core.service.RepositoryService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainContoller {

	@RequestMapping("/")
	public String takeInput()
	{
		return "search";
	}
	
	
	
	@RequestMapping("/output")
	public String func(HttpServletRequest req,HttpServletResponse resp) throws Exception 
	{
		String outputURL="first";
		
		try{
			String path=req.getParameter("path");
			//System.out.println(path);
			String arr[]=path.split("/");
			String repoName=arr[arr.length-1];
			String user=arr[arr.length-2];
			//System.out.println(user+" - " +path);
			
			Set<Issue> lessSeven=new LinkedHashSet<Issue>();
			Set<Issue> between24and7= new LinkedHashSet<Issue>();
			Set<Issue> greaterSeven = new LinkedHashSet<Issue>();
			
			Date yesterday=new Date(System.currentTimeMillis()-(24*60*60*1000));
			//String yesterdayDate=sdf.format(yesterday);
			Date DaysAgo7Date=new Date(System.currentTimeMillis()-7*24*60*60*1000); 
			//String DaysAgo7=sdf.format(DaysAgo7Date);
			
			
			GitHubClient git=new GitHubClient();
			git.setOAuth2Token("39de076299133c5c995ee00b1573f9826887e5bd");
			//git.setCredentials("TheMask", "sugandh4");
			RepositoryService repoService=new RepositoryService(git);
			IssueService issueService=new IssueService(git);
			Repository repo=null;
			repo=repoService.getRepository(user, repoName);
	
			System.out.println(repo.getName());
			System.out.println(repo.getOpenIssues());
			Map<String, String> paramIssue=new HashMap<String, String>();
			paramIssue.put("state", "open");
			//paramIssue.put("sort", "created");
			List<Issue> issueList=issueService.getIssues(repo,paramIssue);
			for(Issue issue:issueList)
			{
				//System.out.println(issue.getCreatedAt());
				if(issue.getCreatedAt().after(yesterday))
				lessSeven.add(issue);
				else if ((issue.getCreatedAt().before(yesterday)) && (issue.getCreatedAt().after(DaysAgo7Date)))
					between24and7.add(issue);
				else
					greaterSeven.add(issue);
			}
			
		
				
				HttpSession session=req.getSession();
				session.setAttribute("firstList", lessSeven);
				session.setAttribute("secondList", between24and7);
				session.setAttribute("thirdList", greaterSeven);
						}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
			outputURL="error";
		}
		
		System.out.println(outputURL);		
		return outputURL;
		
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
