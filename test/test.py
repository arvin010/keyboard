#!/usr/bin/env python3

from re import U
import requests as req
import time
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By

def run(browser, url):
    if "firefox" in browser :
        driver = webdriver.Firefox()
    elif "chrome" in browser :
        # driver = webdriver.Chrome()
        options = webdriver.ChromeOptions()
        # options.add_argument('headless')
        # options.add_argument('--disable-gpu')
        # webdriver.Chrome(executable_path= driver_path)
        driver_path = Service("chromedriver.exe")
        driver = webdriver.Chrome(chrome_options=options,service=driver_path)
        driver.implicitly_wait(1)


        driver.get(url)
        driver.maximize_window()
        # print("####################################################第",j,"页，第",count,"条记录")
        # 获取列表页handle
        # list_page_handle = browser.current_window_handle
        div_content = driver.find_element(By.XPATH  ,'//*[@id="submit-video-list"]/ul[2]/li[1]/a')
        print(1111111111111111,div_content)
        time.sleep(1000)
        # li_list = div_content.find_elements_by_tag_name('li')

        # print(resp.text)



if __name__=='__main__':
    

    url="https://space.bilibili.com/520934641/video"
    run("chrome",url=url)