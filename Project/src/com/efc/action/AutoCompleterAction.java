package com.efc.action;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

public class AutoCompleterAction extends ActionSupport {
	private List provice;

    @Override
    public String execute() throws Exception {
        List arl = new ArrayList();
        arl.add("湖南");
        arl.add("湖北");
        arl.add("上海");
        arl.add("北京");
        arl.add("天津");
        arl.add("广东");
        this.setProvice(arl);
        return SUCCESS;
    }

    public List getProvice() {
        return this.provice;
    }

    public void setProvice(List provice) {
        this.provice = provice;
    }	
}
