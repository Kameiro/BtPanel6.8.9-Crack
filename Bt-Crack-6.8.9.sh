#!/bin/bash
Green_font="\033[32m" && Yellow_font="\033[33m" && Red_font="\033[31m" && Font_suffix="\033[0m"
Info="${Green_font}[Info]${Font_suffix}"
Error="${Red_font}[Error]${Font_suffix}"
Important_one="${Red_font}[选择前须知:]${Font_suffix}"
Important_two="${Red_font}[温馨提示：必须先在面板成功安装插件后才能进行破解。]${Font_suffix}"
PANEL_DIR=/www/server/panel
bt_domain=http://img.viapi.cn/bt
PLUGIN_RETURN="${Yellow_font}在面板安装插件完成之后，从下表选择你要破解的插件:${Font_suffix}"
MAIN_RETURN=${Red_font}[宝塔面板v6.8.9破解脚本]${Font_suffix}
MAIN_RETURN1=${Red_font}[升级专业版，请按提示进行操作！]${Font_suffix}
MAIN_RETURN0=${Red_font}[全自动安装，请按提示进行操作！]${Font_suffix}
MAIN_RETURNWEB=${Red_font}[快速安装环境]${Font_suffix}
MAIN_RETURNWEB0=${Red_font}[编译安装环境]${Font_suffix}
MAIN_RETURNNGINX0=${Red_font}[快速安装Nginx]${Font_suffix}
MAIN_RETURNMYSQL0=${Red_font}[快速安装Mysql]${Font_suffix}
MAIN_RETURNPHP0=${Red_font}[快速安装PHP]${Font_suffix}
MAIN_RETURNNGINX1=${Red_font}[编译Nginx]${Font_suffix}
MAIN_RETURNMYSQL1=${Red_font}[编译安装Mysql]${Font_suffix}
MAIN_RETURNPHP1=${Red_font}[编译安装PHP]${Font_suffix}
MAIN_RETURN5=${Red_font}[请到面板手动安装：监控报表、同步工具，在回到此处执行！]${Font_suffix}
MAIN_RETURNPHPMYADMIN0=${Red_font}[快速安装PhPMyadmin]${Font_suffix}
MAIN_RETURNPHPMYADMIN1=${Red_font}[编译安装PhPMyadmin]${Font_suffix}
MAIN_RETURNWEBLEFT=${Red_font}[选择你需要的环境]${Font_suffix}
MAIN_RETURNAPACHE0=${Red_font}[快速安装Apache]${Font_suffix}
MAIN_RETURNAPACHE1=${Red_font}[编译安装Apache]${Font_suffix}
MAIN_RETURN110=${Red_font}[请先到面板安装安装插件，在一一执行命令！]${Font_suffix}
MAIN_RETURN10=${Green_font}[确保你面板安装过次环境，否则无法使用，请看提醒A、提醒B哦！]${Font_suffix}
MAIN_RETURNFHQ=${Red_font}防火墙破解${Font_suffix}
MAIN_RETURNFHQN=${Red_font}Nginx防火墙破解${Font_suffix}
MAIN_RETURNFHQA=${Red_font}Apache防火墙破解${Font_suffix}

install_bt_panel_pro(){
	curl http://download.bt.cn/install/update6.sh|bash
	echo -e "${Info} 宝塔专业版安装完成，正在进行下一步操作!"
}

get_crack_file(){
	mkdir /root/btpanelv6.8.9_crack
	cd /root/btpanelv6.8.9_crack
    wget -N --no-check-certificate ${bt_domain}/btpanelv6.8.9_crack.zip
    #mv Panel-5.9.0_pro.zip panel.zip
    unzip -o btpanelv6.8.9_crack.zip > /dev/null
	cd /www/server/panel/plugin
	wget -N --no-check-certificate ${bt_domain}/plugin.zip
	unzip -o plugin.zip > /dev/null
	rm -rf /www/server/panel/plugin/plugin.zip
}

getwaf_sss(){
	mkdir /root/waf_sss
	cd /root/waf_sss
	wget -N --no-check-certificate ${bt_domain}/btwaf_main.zip
	unzip -o btwaf_main.zip > /dev/null
	install_btwaf
}

getwaf_ssr(){
	mkdir /root/waf_ssr
	cd /root/waf_ssr
	wget -N --no-check-certificate ${bt_domain}/btwaf_main1.zip
	unzip -o btwaf_main1.zip > /dev/null
	install_btwaf1
}

getwaf_ssss(){
	mkdir /root/waf_sss
	cd /root/waf_sss
	wget -N --no-check-certificate ${bt_domain}/btwaf_httpd_main.zip
	unzip -o btwaf_httpd_main.zip > /dev/null
	install_btwaf_httpd
}

copy_class_file(){
    cp -pf /root/btpanelv6.8.9_crack/soft.html ${PANEL_DIR}/BTPanel/templates/default/soft.html
	cp -pf /root/btpanelv6.8.9_crack/index.html ${PANEL_DIR}/BTPanel/templates/default/index.html
	cp -pf /root/btpanelv6.8.9_crack/soft.js ${PANEL_DIR}/BTPanel/static/js/soft.js
	cp -pf /root/btpanelv6.8.9_crack/panelPlugin.py ${PANEL_DIR}/class/panelPlugin.py
	echo -e "${Info} 复制Class文件完成，正在进行下一步操作!"
}

restart_btpanel(){
	/etc/init.d/bt restart
	echo -e "${Info} 重启宝塔面板完成，正在进行下一步操作!"
}

del_crack_file(){
	rm -rf /root/btpanelv6.8.9_crack
	rm -rf /crack6.8.9.sh
	rm -rf /install.sh
	MAIN_RETURN=${Red_font}[删除破解包]${Font_suffix}操作已完成。
	exit 1
}

install_total_main(){
	cp -pf /root/btpanelv6.8.9_crack/total_main.py ${PANEL_DIR}/plugin/total/total_main.py
	PLUGIN_RETURN=${Red_font}[网站监控报表]${Font_suffix}破解完成，继续破解或返回主菜单: && plugin_choose
}

install_rsync(){
	cp -pf /root/btpanelv6.8.9_crack/rsync_main.py ${PANEL_DIR}/plugin/rsync/rsync_main.py
	PLUGIN_RETURN=${Red_font}[数据同步工具]${Font_suffix}破解完成，继续破解或返回主菜单: && plugin_choose
}

install_btwaf(){
	cp -pf /root/waf_sss/btwaf_main.py ${PANEL_DIR}/plugin/btwaf/btwaf_main.py
	rm -rf /root/waf_sss
	echo -e "\033[43;35m Nginx 防火墙：A 部分修复完毕！ \033[0m \n" 
	fhqn
}

install_btwaf1(){
	cp -pf /root/waf_ssr/btwaf_main.py ${PANEL_DIR}/plugin/btwaf/btwaf_main.py
	rm -rf /root/waf_ssr
	echo -e "\033[43;35m Nginx 防火墙：B 部分修复完毕！ \033[0m \n" 
	fhqn
}

install_btwaf_httpd(){
    cp -pf /root/waf_sss/btwaf_httpd_main.py ${PANEL_DIR}/plugin/btwaf_httpd/btwaf_httpd_main.py
    PLUGIN_RETURN=${Red_font}[Apache防火墙]${Font_suffix}修复完成!
	rm -rf /root/waf_sss
	echo -e "\033[43;35m Apache 防火墙：修复完毕！ \033[0m \n" 
	fhqa
	echo -e "\033[43;35m Apache 防火墙：修复完毕！ \033[0m \n" 
}

starts(){
	install_bt_panel_pro
	get_crack_file
	copy_class_file
	restart_btpanel
	MAIN_RETURN=${Red_font}[专业版安装]${Font_suffix}操作已完成。
	plugin_choose
}

starts0(){
	yum install -y wget && wget -O install.sh http://download.bt.cn/install/install_6.0.sh && sh install.sh
	echo -e "${Info} 宝塔官方版安装完成，请进行下一步操作!"
	MAIN_RETURN=${Red_font}[宝塔官方版安装]${Font_suffix}操作已完成。
	install_bt_panel_pro
	get_crack_file
	copy_class_file
	restart_btpanel
	MAIN_RETURN=${Red_font}[专业版安装]${Font_suffix}操作已完成。
	plugin_choose
}

web(){
clear
echo -e "${Green_font}
#=======================================
 提醒A：Nginx或Apache环境可能需要先在面
 板安装过一次，才能使用命令安装！
 提醒B：安装过Nginx或Apache环境，才能使
 用命令安装其他的环境哦！请知晓！
#=======================================
${Font_suffix}"
rm -rf /nginx.sh
rm -rf /mysql.sh
rm -rf /php.sh
rm -rf /pure-ftpd.sh
rm -rf /phpmyadmin.sh
rm -rf /apache.sh
echo -e "${MAIN_RETURNWEB}"
echo -e "1.选择 Nginx or Apache 版本 ${MAIN_RETURN10}\n2.选择 MySQL 版本\n3.选择 PHP 版本\n4.安装 Pure-Ftpd\n5.安装 PhPMyadmin\n6.返回上目录"
read -p "输入数字以选择:" web0
while [[ ! "${web0}" =~ ^[1-6]$ ]]
	do
		echo -e "${Error} 无效输入"
		echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" web0
	done	
if [[ "${web0}" == "1" ]]; then
    weblft
elif [[ "${web0}" == "2" ]]; then
    wget http://download.bt.cn/install/1/mysql.sh
	mysql1
elif [[ "${web0}" == "3" ]]; then
	 wget http://download.bt.cn/install/1/php.sh
	php1
elif [[ "${web0}" == "4" ]]; then
    Pure-Ftpd0
elif [[ "${web0}" == "5" ]]; then
    wget http://download.bt.cn/install/1/phpmyadmin.sh
    phpmyadmin0
elif [[ "${web0}" == "6" ]]; then
	main
fi	
}

weblft(){
clear
echo -e "${MAIN_RETURNWEBLEFT}"
echo -e "1.Nginx\n2.Apache\n3.返回上目录"
read -p "输入数字以选择:" weblft0
while [[ ! "${weblft0}" =~ ^[1-3]$ ]]
	do
		echo -e "${Error} 无效输入"
		echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" weblft0
	done	
if [[ "${weblft0}" == "1" ]]; then
	wget http://download.bt.cn/install/1/nginx.sh
	nginx1
elif [[ "${weblft0}" == "2" ]]; then
	wget http://download.bt.cn/install/1/apache.sh
	apache1
elif [[ "${weblft0}" == "3" ]]; then
	web
	
fi
}

apache1(){
clear
echo -e "${MAIN_RETURNAPACHE0}"
echo -e "1.Apache 2.2\n2.Apache 2.4\n3.返回上目录"
read -p "输入数字以选择:" apache2
while [[ ! "${apache2}" =~ ^[1-3]$ ]]
	do
		echo -e "${Error} 无效输入"
		echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" apache2
	done	
if [[ "${apache2}" == "1" ]]; then
	bash apache.sh install 2.2
elif [[ "${apache2}" == "2" ]]; then
	bash apache.sh install 2.4
elif [[ "${apache2}" == "3" ]]; then
	weblft
	
fi	
	echo -e "\033[43;35m 快速安装：Apache 安装操作已完成！ \033[0m \n" 
    web	
}



Pure-Ftpd(){
	wget http://download.bt.cn/install/0/pure-ftpd.sh
	bash pure-ftpd.sh install
	echo -e "\033[43;35m 编译安装：Pure-Ftpd 安装操作已完成！ \033[0m \n" 
	installweb
}

Pure-Ftpd0(){
	wget http://download.bt.cn/install/1/pure-ftpd.sh
	bash pure-ftpd.sh install
	echo -e "\033[43;35m 快速安装：Pure-Ftpd 安装操作已完成！ \033[0m \n" 
	web
}

phpmyadmin(){
clear
echo -e "${MAIN_RETURNPHPMYADMIN1}"
echo -e "1.PhPMyadmin 4.0\n2.PhPMyadmin 4.4\n3.PhPMyadmin 4.6\n4.PhPMyadmin 4.7\n5.PhPMyadmin 4.8\n6.返回上目录"	
read -p "输入数字以选择:" phpmyadmin1
while [[ ! "${phpmyadmin1}" =~ ^[1-6]$ ]]
	do
		echo -e "${Error} 无效输入"
		echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" phpmyadmin1
	done	
if [[ "${phpmyadmin1}" == "1" ]]; then
	bash phpmyadmin.sh install 4.0
elif [[ "${phpmyadmin1}" == "2" ]]; then
	bash phpmyadmin.sh install 4.4
elif [[ "${phpmyadmin1}" == "3" ]]; then
	bash phpmyadmin.sh install 4.6
elif [[ "${phpmyadmin1}" == "4" ]]; then
	bash phpmyadmin.sh install 4.7
elif [[ "${phpmyadmin1}" == "5" ]]; then
	bash phpmyadmin.sh install 4.8
elif [[ "${phpmyadmin1}" == "6" ]]; then
    installweb
	
fi
	echo -e "\033[43;35m 编译安装：PhPMyadmin 安装操作已完成！ \033[0m \n" 
    installweb	
}

phpmyadmin0(){
clear
echo -e "${MAIN_RETURNPHPMYADMIN0}"	
echo -e "1.PhPMyadmin 4.0\n2.PhPMyadmin 4.4\n3.PhPMyadmin 4.6\n4.PhPMyadmin 4.7\n5.PhPMyadmin 4.8\n6.返回上目录"	
read -p "输入数字以选择:" phpmyadmin2
while [[ ! "${phpmyadmin2}" =~ ^[1-6]$ ]]
	do
		echo -e "${Error} 无效输入"
		echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" phpmyadmin2
	done	
if [[ "${phpmyadmin2}" == "1" ]]; then
	bash phpmyadmin.sh install 4.0
elif [[ "${phpmyadmin2}" == "2" ]]; then
	bash phpmyadmin.sh install 4.4
elif [[ "${phpmyadmin2}" == "3" ]]; then
	bash phpmyadmin.sh install 4.6
elif [[ "${phpmyadmin2}" == "4" ]]; then
	bash phpmyadmin.sh install 4.7
elif [[ "${phpmyadmin2}" == "5" ]]; then
	bash phpmyadmin.sh install 4.8
elif [[ "${phpmyadmin2}" == "6" ]]; then
    web	
	
fi
echo -e "\033[43;35m 快速安装：PhPMyadmin 安装操作已完成！ \033[0m \n" 
web	
}

installweb(){
clear
echo -e "${Green_font}
#=======================================
 提醒A：Nginx或Apache环境可能需要先在面
 板安装过一次，才能使用命令安装！
 提醒B：安装过Nginx或Apache环境，才能使
 用命令安装其他的环境哦！请知晓！
#=======================================
${Font_suffix}"
rm -rf /nginx.sh
rm -rf /mysql.sh
rm -rf /php.sh
rm -rf /pure-ftpd.sh
rm -rf /phpmyadmin.sh
rm -rf /apache.sh
echo -e "${MAIN_RETURNWEB0}"
echo -e "1.选择 Nginx or Apache 版本 ${MAIN_RETURN10}\n2.选择 MySQL 版本\n3.选择 PHP 版本\n4.安装 Pure-Ftpd\n5.安装 PhPMyadmin\n6.返回上目录"
read -p "输入数字以选择:" function0
while [[ ! "${function0}" =~ ^[1-6]$ ]]
	do
		echo -e "${Error} 无效输入"
		echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" function0
	done	
if [[ "${function0}" == "1" ]]; then
	weblft1
elif [[ "${function0}" == "2" ]]; then
    wget http://download.bt.cn/install/0/mysql.sh
	mysql
elif [[ "${function0}" == "3" ]]; then
	 wget http://download.bt.cn/install/0/php.sh
	 php
elif [[ "${function0}" == "4" ]]; then
	Pure-Ftpd
elif [[ "${function0}" == "5" ]]; then
    wget http://download.bt.cn/install/0/phpmyadmin.sh
	phpmyadmin
elif [[ "${function0}" == "6" ]]; then
    main	
fi	
}


weblft1(){
clear
echo -e "${MAIN_RETURNWEBLEFT}"
echo -e "1.Nginx\n2.Apache\n3.返回上目录"
read -p "输入数字以选择:" weblft0
while [[ ! "${weblft0}" =~ ^[1-3]$ ]]
	do
		echo -e "${Error} 无效输入"
		echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" weblft0
	done	
if [[ "${weblft0}" == "1" ]]; then
	wget http://download.bt.cn/install/0/nginx.sh
	nginx
elif [[ "${weblft0}" == "2" ]]; then
	wget http://download.bt.cn/install/0/apache.sh
	apache
elif [[ "${weblft0}" == "3" ]]; then
	installweb	
	
fi
}

apache(){
clear
echo -e "${MAIN_RETURNAPACHE1}"
echo -e "1.Apache 2.2\n2.Apache 2.4\n3.返回上目录"
read -p "输入数字以选择:" apache3

while [[ ! "${apache3}" =~ ^[1-3]$ ]]
	do
		echo -e "${Error} 无效输入"
		echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" apache3
	done	
if [[ "${apache3}" == "1" ]]; then
	bash apache.sh install 2.2
elif [[ "${apache3}" == "2" ]]; then
	bash apache.sh install 2.4
elif [[ "${apache3}" == "3" ]]; then
	weblft1
	
fi	
	echo -e "\033[43;35m 编译安装：Apache 安装操作已完成！ \033[0m \n" 
    installweb	
}

nginx(){
clear
echo -e "${MAIN_RETURNNGINX1}"
echo -e "1.Nginx 1.10\n2.Nginx 1.8\n3.Nginx 1.14\n4.Nginx 1.15\n5.Nginx -Tengine2.2.3\n6.Nginx openresty\n7.返回上目录"
read -p "输入数字以选择:" nginx0
while [[ ! "${nginx0}" =~ ^[1-7]$ ]]
	do
		echo -e "${Error} 无效输入"
		echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" nginx0
	done
if [[ "${nginx0}" == "1" ]]; then
	bash nginx.sh install 1.10
elif [[ "${nginx0}" == "2" ]]; then
    bash nginx.sh install 1.8
elif [[ "${nginx0}" == "3" ]]; then
	bash nginx.sh install 1.14
elif [[ "${nginx0}" == "4" ]]; then
	bash nginx.sh install 1.15
elif [[ "${nginx0}" == "5" ]]; then
	bash nginx.sh install -Tengine2.2.3
elif [[ "${nginx0}" == "6" ]]; then
	bash nginx.sh install openresty
elif [[ "${nginx0}" == "7" ]]; then
	weblft1

fi
echo -e "\033[43;35m 编译安装：Nginx 安装操作已完成！ \033[0m \n" 
installweb
}

nginx1(){
clear
echo -e "${MAIN_RETURNNGINX0}"
echo -e "1.Nginx 1.10\n2.Nginx 1.8\n3.Nginx 1.14\n4.Nginx 1.15\n5.Nginx -Tengine2.2.3\n6.Nginx openresty\n7.返回上目录"
read -p "输入数字以选择:" nginx2
while [[ ! "${nginx2}" =~ ^[1-7]$ ]]
	do
		echo -e "${Error} 无效输入"
		echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" nginx2
	done
if [[ "${nginx2}" == "1" ]]; then
	bash nginx.sh install 1.10
elif [[ "${nginx2}" == "2" ]]; then
    bash nginx.sh install 1.8
elif [[ "${nginx2}" == "3" ]]; then
	bash nginx.sh install 1.14
elif [[ "${nginx2}" == "4" ]]; then
	bash nginx.sh install 1.15
elif [[ "${nginx2}" == "5" ]]; then
	bash nginx.sh install -Tengine2.2.3
elif [[ "${nginx2}" == "6" ]]; then
	bash nginx.sh install openresty
elif [[ "${nginx2}" == "7" ]]; then
	weblft
	
fi
echo -e "\033[43;35m 快速安装：Nginx 安装操作已完成！ \033[0m \n" 
web
}

mysql(){
clear
echo -e "${MAIN_RETURNMYSQL1}"
echo -e "0.Mysql 5.1\n1.Mysql 5.5\n2.Mysql 5.6\n3.Mysql 5.7\n4.Mysql 8.0\n5.Mysql Alisql\n6.Mysql Mariadb 5.5\n7.Mysql Mariadb 10.0\n8.Mysql Mariadb 10.1\n9.Mysql Mariadb 10.2\n10.Mysql Mariadb 10.3\n11.返回上目录"
read -p "输入数字以选择:" mysql0
if [[ "${mysql0}" == "0" ]]; then
	bash mysql.sh install 5.1
elif [[ "${mysql0}" == "1" ]]; then
    bash mysql.sh install 5.5	
elif [[ "${mysql0}" == "2" ]]; then
    bash mysql.sh install 5.6
elif [[ "${mysql0}" == "3" ]]; then
	bash mysql.sh install 5.7
elif [[ "${mysql0}" == "4" ]]; then
	bash mysql.sh install 8.0
elif [[ "${mysql0}" == "5" ]]; then
	bash mysql.sh install alisql
elif [[ "${mysql0}" == "6" ]]; then
	bash mysql.sh install mariadb_5.5
elif [[ "${mysql0}" == "7" ]]; then
	bash mysql.sh install mariadb_10.0
elif [[ "${mysql0}" == "8" ]]; then
	bash mysql.sh install mariadb_10.1
elif [[ "${mysql0}" == "9" ]]; then
	bash mysql.sh install mariadb_10.2
elif [[ "${mysql0}" == "10" ]]; then
    bash mysql.sh install mariadb_10.3
elif [[ "${mysql0}" == "11" ]]; then
    installweb	
	if [ -f "/usr/bin/mysql" ]; then
		rm -rf ${Setup_Path}/src/*
		rm -rf ${Setup_Path}/update
	fi
	rm -f ${Setup_Path}/version_check.pl
	/etc/init.d/mysqld start
fi
echo -e "\033[43;35m 编译安装：Mysql 安装操作已完成！ \033[0m \n" 
installweb
}

mysql1(){
clear
echo -e "${MAIN_RETURNMYSQL0}"
echo -e "0.Mysql 5.1\n1.Mysql 5.5\n2.Mysql 5.6\n3.Mysql 5.7\n4.Mysql 8.0\n5.Mysql Alisql\n6.Mysql Mariadb 5.5\n7.Mysql Mariadb 10.0\n8.Mysql Mariadb 10.1\n9.Mysql Mariadb 10.2\n10.Mysql Mariadb 10.3\n11.返回上目录"
read -p "输入数字以选择:" mysql2
if [[ "${mysql2}" == "0" ]]; then
	bash mysql.sh install 5.1
elif [[ "${mysql2}" == "1" ]]; then
    bash mysql.sh install 5.5	
elif [[ "${mysql2}" == "2" ]]; then
    bash mysql.sh install 5.6
elif [[ "${mysql2}" == "3" ]]; then
	bash mysql.sh install 5.7
elif [[ "${mysql2}" == "4" ]]; then
	bash mysql.sh install 8.0
elif [[ "${mysql2}" == "5" ]]; then
	bash mysql.sh install alisql
elif [[ "${mysql2}" == "6" ]]; then
	bash mysql.sh install mariadb_5.5
elif [[ "${mysql2}" == "7" ]]; then
	bash mysql.sh install mariadb_10.0
elif [[ "${mysql2}" == "8" ]]; then
	bash mysql.sh install mariadb_10.1
elif [[ "${mysql2}" == "9" ]]; then
	bash mysql.sh install mariadb_10.2
elif [[ "${mysql2}" == "10" ]]; then
    bash mysql.sh install mariadb_10.3
elif [[ "${mysql2}" == "11" ]]; then
	web	

	if [ -f "/usr/bin/mysql" ]; then
		rm -rf ${Setup_Path}/src/*
		rm -rf ${Setup_Path}/update
	fi
	rm -f ${Setup_Path}/version_check.pl
	/etc/init.d/mysqld start
fi
echo -e "\033[43;35m 快速安装：Mysql 安装操作已完成！ \033[0m \n" 
web
}

php(){
clear
echo -e "${MAIN_RETURNPHP1}"
echo -e "1.Php 5.2\n2.Php 5.3\n3.Php 5.4 \n4.Php 5.5\n5.Php 5.6\n6.Php 7.0\n7.Php 7.1\n8.Php 7.2\n9.Php 7.3\n0.返回上目录"
read -p "输入数字以选择:" php0
while [[ ! "${php0}" =~ ^[0-9]$ ]]
	do
		echo -e "${Error} 无效输入"
		echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" php0
	done	
if [[ "${php0}" == "1" ]]; then
	bash php.sh install 5.2
elif [[ "${php0}" == "2" ]]; then
    bash php.sh install 5.3
elif [[ "${php0}" == "3" ]]; then
	bash php.sh install 5.4
elif [[ "${php0}" == "4" ]]; then
	bash php.sh install 5.5
elif [[ "${php0}" == "5" ]]; then
	bash php.sh install 5.6
elif [[ "${php0}" == "6" ]]; then
	bash php.sh install 7.0
elif [[ "${php0}" == "7" ]]; then
	bash php.sh install 7.1
elif [[ "${php0}" == "8" ]]; then
	bash php.sh install 7.2
elif [[ "${php0}" == "9" ]]; then
	bash php.sh install 7.3
elif [[ "${php0}" == "0" ]]; then
	installweb
	
fi
echo -e "\033[43;35m 编译安装：PHP 安装操作已完成！ \033[0m \n" 
installweb
}

php1(){
clear
echo -e "${MAIN_RETURNPHP0}"
echo -e "1.Php 5.2\n2.Php 5.3\n3.Php 5.4 \n4.Php 5.5\n5.Php 5.6\n6.Php 7.0\n7.Php 7.1\n8.Php 7.2\n9.Php 7.3\n0.返回上目录"
read -p "输入数字以选择:" php2
while [[ ! "${php2}" =~ ^[0-9]$ ]]
	do
		echo -e "${Error} 无效输入"
		echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" php2
	done	
if [[ "${php2}" == "1" ]]; then
	bash php.sh install 5.2
elif [[ "${php2}" == "2" ]]; then
    bash php.sh install 5.3
elif [[ "${php2}" == "3" ]]; then
	bash php.sh install 5.4
elif [[ "${php2}" == "4" ]]; then
	bash php.sh install 5.5
elif [[ "${php2}" == "5" ]]; then
	bash php.sh install 5.6
elif [[ "${php2}" == "6" ]]; then
	bash php.sh install 7.0
elif [[ "${php2}" == "7" ]]; then
	bash php.sh install 7.1
elif [[ "${php2}" == "8" ]]; then
	bash php.sh install 7.2
elif [[ "${php2}" == "9" ]]; then
	bash php.sh install 7.3
elif [[ "${php2}" == "0" ]]; then
	web	
	
fi
echo -e "\033[43;35m 快速安装：PHP 安装操作已完成！ \033[0m \n" 
web
}

fhq(){
clear
echo -e "${Green_font}
#=======================================
 请一定看清楚说明，再去破解防火墙插件！
#=======================================
${Font_suffix}"
echo -e "${MAIN_RETURNFHQ}"
echo -e "1.Nginx 防火墙\n2.Apache 防火墙\n3.返回上目录"
read -p "输入数字以选择:" fhq0
while [[ ! "${fhq0}" =~ ^[0-3]$ ]]
	do
		echo -e "${Error} 无效输入"
		echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" fhq0
	done
if [[ "${fhq0}" == "1" ]]; then
	fhqn
elif [[ "${fhq0}" == "2" ]]; then
    fhqa
elif [[ "${fhq0}" == "3" ]]; then
    main

fi
}


fhqn(){
clear
echo -e "${Green_font}
#=======================================
第一步：先安装防火墙，然后执行 修复补丁A
第二步：接着打开防火墙，会显示插件已到期
第三部：然后执行 修复补丁B  在启动防火墙
#=======================================
${Font_suffix}"

echo -e "${MAIN_RETURNFHQN}"

echo -e "1.Nginx 防火墙 修复补丁 A\n2.Nginx 防火墙 修复补丁 B\n3.返回上目录"

read -p "输入数字以选择:" fhqn0


while [[ ! "${fhqn0}" =~ ^[0-3]$ ]]
	do
		echo -e "${Error} 无效输入"
		echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" fhqn0
	done

if [[ "${fhqn0}" == "1" ]]; then
	getwaf_sss
elif [[ "${fhqn0}" == "2" ]]; then
    getwaf_ssr
elif [[ "${fhqn0}" == "3" ]]; then
    fhq

fi	
}



fhqa(){
clear
echo -e "${Green_font}
#=======================================
Apahce：先安装防火墙，然后执行 修复补丁
#=======================================
${Font_suffix}"
echo -e "${MAIN_RETURNFHQA}"

echo -e "1.Apache 防火墙 修复补丁\n2.返回上目录"

read -p "输入数字以选择:" fhqa0


while [[ ! "${fhqa0}" =~ ^[0-2]$ ]]
	do
		echo -e "${Error} 无效输入"
		echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" fhqa0
	done


if [[ "${fhqa0}" == "1" ]]; then
	getwaf_ssss
elif [[ "${fhqa0}" == "2" ]]; then
    fhq

fi	
}




plugin_choose(){
clear
echo -e "${White_font}
#====================================================
# ${Important_one} 
# ${Important_two} 
#====================================================
# ${PLUGIN_RETURN}
#====================================================
#          1.网站监控报表
#          2.数据同步工具
#          3.返回主菜单
#    说明：其他插件无需破解，安装即可用！
# ${RETURN110}
#====================================================
${Font_suffix}"
/etc/init.d/bt default
echo -e "${MAIN_RETURN5}"
read -p "输入数字以选择:" choose_function

while [[ ! "${choose_function}" =~ ^[1-3]$ ]]
	do
		echo -e "${Error} 无效输入"
		echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" choose_function
	done

if [[ "${choose_function}" == "1" ]]; then
	install_total_main
elif [[ "${choose_function}" == "2" ]]; then
	install_rsync
elif [[ "${choose_function}" == "3" ]]; then
	main
fi
}

main(){
clear
echo -e "${Green_font}
#=======================================
# Name:bt-6.8.9-crack-JiaJiaFix
# Version:6.8.9
# 甲甲修复BUG+添加功能
# 本版本甲甲修复内容：
# 1.无法正常安装宝塔的BUG
# 2.脚本无法正常执行的BUG
# 3.添加功能：修复指定插件
#=======================================
${Font_suffix}"
echo -e "${MAIN_RETURN}"
echo -e "1.未安装宝塔版 ${MAIN_RETURN0}\n2.已安装宝塔版 ${MAIN_RETURN1}\n3.快速安装环境\n4.编译安装环境\n5.修复防火墙\n6.破解无法使用插件\n7.退出脚本"
read -p "输入数字以选择:" function

while [[ ! "${function}" =~ ^[1-6]$ ]]
	do
		echo -e "${Error} 无效输入"
		echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" function
	done

if [[ "${function}" == "1" ]]; then
	starts0	
elif [[ "${function}" == "2" ]]; then
    starts
elif [[ "${function}" == "3" ]]; then
    web	
elif [[ "${function}" == "4" ]]; then
	installweb	
elif [[ "${function}" == "5" ]]; then
	fhq
elif [[ "${function}" == "6" ]]; then
	plugin_choose
elif [[ "${function}" == "7" ]]; then
	del_crack_file	
else
	clear
	exit 1
fi	
}

main
