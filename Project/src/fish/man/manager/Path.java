package fish.man.manager;

public class Path {
	private static String curPath ;
	private static String docPath ;
	private static String newPicPath ; //Ϊ��֮����ʾ��jsp��
	
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

	public static String getNewPicPath() {
		return newPicPath;
	}

	public static void setNewPicPath(String newPicPath) {
		Path.newPicPath = newPicPath;
	}
	
}
