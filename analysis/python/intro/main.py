import pandas as pd
import requests as rq
from bs4 import BeautifulSoup
import re
import time
import seaborn as sns
import matplotlib.pyplot as plt

def skills_scraper(title,city,state,pages=1):
    '''
    DESCRIBE
    '''

    what=what.strip()
    city=city.strip()
    state=state.strip()

    post_num=0

    links=[]
    counter=0
    base_url='https://www.indeed.com/jobs?q='+what+'&l='+city+'%2C+'+state+'&start='
    # URL GENERATOR
    while counter<=pages:
        links.append(base_url+str(counter)+'0')
        counter+=1

    posts=[]
    skill_freq={}
    # SCRAPE THE POST INFO
    for link in links:
        # MAKE CONNECTION
        sleep(1) # let's not crash any servers!
        page=requests.get(link)
        soup=BeautifulSoup(page.content, 'html.parser')
        for post in soup.find_all('div', {'class': re.compile('.row.result')}):
            post_num+=1
            # DEF company
            company_tags=[
                ['a','data-tn-element','companyName'],
                ['span','class','company']
            ]
            company='N/A'
            for one,two,three in company_tags:
                while company=='N/A':
                    try:
                        company=post.find(one,{two:three}).text.strip().replace('\n', '')
                    except:
                        break
                    continue
            # DEF title
            try:
                title = post.find('a', {'data-tn-element': re.compile('.[Tt]itle')}).text.strip().replace('\n', '')
            except:
                title = 'N/A'
            # DEF location, city, state
            try:
                location = post.find('span', {'class': re.compile('location')}).text.strip().replace('\n', '')
                city_ = location.partition(',')[0].strip()
                state_ = location.partition(',')[2].strip()[0:2]
                del location
            except:
                location = 'N/A'
            # DEF skills
            try:
                skills = post.find('span', {'class': re.compile('experienceList')}).text.strip().replace('\n', '')
                for skill in [x.strip() for x in skills.split(',')]:
                    if skill not in skill_freq:
                        skill_freq[skill] = 0
                    skill_freq[skill] += 1
            except:
                skills = 'N/A'
            posts.append([title, company, city_, state_, skills])



    print('Number of posts scraped: {}'.format(post_num))
    data=pd.DataFrame.from_dict(skill_freq,orient='index')
    data.columns=['count']
    three_fourths=round(len(data)*(3/4))
    top_75pct=data.sort_values('count',ascending=False).iloc[:three_fourths]
    the_rest=data.sort_values('count',ascending=False).iloc[three_fourths:]
    print('\n','Here is a sample of the posts you scraped!','\n')

    for idx,post in enumerate(posts[:round(post_num*(1/4))]):
        print('-----------Job #{} out of {}-----------'.format(idx+1,post_num))
        print('Job Title: {}'.format(post[0]))
        print('Company Name: {}'.format(post[1]))
        print('City: {}'.format(post[2]))
        print('State: {}'.format(post[3]))
        print('Skills: {}'.format(post[4]))
        print('---------------------------------------')

    # VISUAL ANALYSIS
    sns.set()
    sns.barplot(x=top_75pct.index,y=top_75pct['count'])
    plt.title('Top 75% {} Skills from {}, {}'.format(what.title(),city.title(),state.upper()))
    plt.xlabel('Skills')
    plt.xticks(rotation='vertical')
    plt.ylabel('Frequency out of {} Job Postings'.format(post_num))
    plt.tight_layout()
    plt.savefig('Top75pct+'+what.replace(' ', '+')+'+'+city.replace(' ', '+')+'+'+state.replace(' ', '+')+'.jpg')

    sns.barplot(x=the_rest.index,y=the_rest['count'])
    plt.title('NOT Top 75% {} Skills from {}, {}'.format(what.title(),city.title(),state.upper()))
    plt.xlabel('Skills')
    plt.xticks(rotation='vertical')
    plt.ylabel('Frequency out of {} Job Postings'.format(post_num))
    plt.ylim(ymax=top_75pct['count'].max())
    plt.tight_layout()
    plt.savefig('NOT_Top75pct+'+what.replace(' ', '+')+'+'+city.replace(' ', '+')+'+'+state.replace(' ', '+')+'.jpg')

    return posts

if __name__=='__main__':
    ds='data scientist'
    de='data engineer'
    au='austin'
    tx='tx'
    se='seattle'
    wa='wa'

    ds_=skills_scraper(ds,se,wa)
    de_=skills_scraper(de,se,wa)
    au_=skills_scraper(ds,au,tx)
