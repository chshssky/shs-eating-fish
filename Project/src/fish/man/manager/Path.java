package fish.man.manager;

public class Path {
	private static String curPath ;
	private static String docPath ;
	
	public static String getCurPath() {
		return curPath;
	}

	public static void setCurPath(String curPath) {
		Path.curPath = curPath;
	}

	public static String getDocPath() {
		return docPath;
	}

	public static void setDocPath(String docPath) {
		Path.docPath = docPath;
	}
	
}
