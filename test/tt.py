#coding: utf-8
import multiprocessing
from cProfile import run
from urllib.error import URLError
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
import threading
import time
import random


def run(browser, url,interval):
    if "firefox" in browser :
        driver = webdriver.Firefox()
    elif "chrome" in browser :
        # driver = webdriver.Chrome()
        # option = webdriver.ChromeOptions()
        # option.add_argument('headless')
        # option.add_argument('--disable-gpu')
        #  webdriver.Chrome(executable_path= driver_path)
        s = Service("chromedriver.exe")
        driver = webdriver.Chrome(service=s)
        driver.implicitly_wait(1)
        driver.get(url=url)
        time.sleep(interval)
        driver.quit() 



def run_pool():
    n=1
    pool = multiprocessing.Pool(processes = n)
    for i in range(n):
        # interval = random.randint(80,130) 
        pool.apply_async(run,)  

    print ("Mark~ Mark~ Mark~~~~~~~~~~~~~~~~~~~~~~")
    pool.close()
    pool.join()   #调用join之前，先调用close函数，否则会出错。执行完close后不会有新的进程加入到pool,join函数等待所有子进程结束
    print( "Sub-process(es) done.")


data = {
    # "firefox": "http://www.xqtesting.com",
    "chrome1": "https://www.bilibili.com/video/BV1Nr4y1J7bY?spm_id_from=333.999.0.0",
    "chrome2": "https://www.bilibili.com/video/BV1FK4y1Y7TC/?spm_id_from=333.788.recommend_more_video.-1",
    "chrome3": "https://www.bilibili.com/video/BV1Nr4y1J7bY?spm_id_from=333.999.0.0",
    "chrome4": "https://www.bilibili.com/video/BV1Nr4y1J7bY?spm_id_from=333.999.0.0",
}

def run_pool2():
    threads = []
    for browser, url in data.items():
        interval = random.randint(80,130)
        t1 = threading.Thread(target=run, args=(browser, url,interval,))
        t1.start()
        threads.append(t1)
    # 启动
    for t2 in threads:
        
        t2.join()

def run_pool3():
    process_list = []
    for browser, url in data.items():
        interval = random.randint(80,130)
        t1 = multiprocessing.Process(target=run, args=(browser, url,interval,))
        t1.start()
        process_list.append(t1)
    # 
    for t2 in process_list:
        
        t2.join()

if __name__ == '__main__':
    s = time.time()

    # while True:
        # run_pool()

    run_pool3()
    e = time.time()
    print('总用时：',e-s)

