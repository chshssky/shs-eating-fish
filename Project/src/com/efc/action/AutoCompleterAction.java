package com.efc.action;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

public class AutoCompleterAction extends ActionSupport {
	private List provice;

    @Override
    public String execute() throws Exception {
        List arl = new ArrayList();
        arl.add("����");
        arl.add("����");
        arl.add("�Ϻ�");
        arl.add("����");
        arl.add("���");
        arl.add("�㶫");
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
