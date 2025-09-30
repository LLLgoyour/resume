#import "chicv.typ": *;

#let Chinese = 0
#let EnglishFull = 1
#let Simplified = 2
#let runReader(mode) = {
  let translate(zh: [], en: []) = {
    if mode == Chinese {
      zh
    } else {
      en
    }
  }
  let noSimple(simple: [], content) = {
    if mode == Simplified {
      simple
    } else {
      content
    }
  }
  let months = ("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
  let translate-date(month, year) = translate(
    zh: [#year 年 #month 月],
    en: [#months.at(month - 1), #year],
  )
  let current = translate(
    zh: [至今],
    en: [Present],
  )

  let edu = {
    translate(en: [== Education], zh: [== 教育经历])
    let colby-gpa = 0

    let colby-courses = (
      ([CS 231], [Data Structures and Algorithms], [数据结构和算法]),
      ([MA 160], [Series and Multivariable Calculus], [级数和多元微积分]),
      ([MA 262], [Vector Calculus], [向量分析]),
    )
    let colby-date = [_#translate-date(8, 2025) -- #translate(en: [Present], zh: [至今])_
    ]
    let colby-degree = translate(
      en: [B.A. Candidate in Mathematics and Computer Science],
      zh: [数学与计算机专业文学士],
    )
    translate(
      en: cventry(
        tl: [*Colby College*, Waterville, ME, USA],
        tr: colby-date,
      )[#colby-degree (with Minor in Music), GPA N/A (First Semester)
        #noSimple(simple: [,
          _Selected Courses_: #colby-courses.map(item => item.at(0)).join(", ")])[\
          _Selected Courses_: #colby-courses.map(item => item.at(0) + " " + item.at(1)).join(", ")]],
      zh: cventry(
        tl: [科尔比学院，美国，缅因州，沃特维尔],
        tr: colby-date,
      )[#colby-degree，（副专业：音乐），GPA N/A (第一学期) \
        _部分选修课程_：#colby-courses.map(item => item.at(0) + " " + item.at(2)).join(", ")],
    )
  }

  let camden-filmfest = {
    let camden-date = [_#translate-date(9, 2025)_]
    translate(
      en: cventry(
        tl: [*Camden Film Festival*, _Volunteer_, Camden, ME, USA],
        tr: camden-date,
      )[
        #noSimple[
          - Assisted in event setup, ticketing, and guiding guests at the Camden Opera House.
          - Supported screenings and live events, ensuring smooth operations for attendees and staff.
          - Gained hands-on experience in arts event management and community engagement.
        ]
      ],
      zh: cventry(
        tl: [*卡姆登歌剧院*，卡姆登电影节志愿者],
        tr: camden-date,
      )[
        #noSimple[
          - 协助活动布置、票务工作，并为Camden电影节的来宾提供引导。
          - 支持放映和现场活动，确保观众和工作人员的顺利体验。
          - 获得了艺术活动管理和社区参与的实践经验。
        ]
      ],
    )
  }

  let fvs-media = {
    let fvs-date = [_#translate-date(8, 2022) -- #translate-date(5, 2025)_]
    translate(
      en: cventry(
        tl: [*Fountain Valley School of Colorado*, _Media Team_, Colorado Springs, CO, USA],
        tr: fvs-date,
      )[#noSimple[
        - Collaborated with the media team to broadcast, create and edit videos for school events, including sports games and academic competitions.
        - Assisted in managing the school's Instagram accounts, promoting events and engaging with the community.
      ]],
      zh: cventry(
        tl: [*科罗拉多喷泉谷学校*，_媒体团队_，美国，科罗拉多州，科罗拉多泉],
        tr: fvs-date,
      )[#noSimple[
        - 与媒体团队合作，为学校活动（包括体育比赛和学术竞赛）现场直播、制作和编辑视频。
        - 协助管理学校的Instagram账户，宣传活动并与社区互动。
      ]],
    )
  }

  let chinadaily = {
    let chinadaily-date = [_#translate-date(6, 2025) -- #translate-date(7, 2025)_]
    translate(
      en: cventry(
        tl: [*China Daily*, _Features Reporter Intern_, Beijing, China],
        tr: chinadaily-date,
      )[#noSimple[
        - Engaged in interviews with renowned artists, including Russian theater director Yury Butusov, enriching content quality.
        - Mastered video editing techniques, producing compelling short videos that enhanced project visibility.
        - Contributed to high-profile cultural events, demonstrating adaptability and a commitment to excellence in reporting.
      ]],
      zh: cventry(
        tl: [*中国日报社*，_特写记者实习生_，中国，北京],
        tr: chinadaily-date,
      )[ #noSimple[
        - 参与采访知名艺术家，包括俄罗斯戏剧导演尤里·布图索夫，丰富了内容质量。
        - 掌握视频剪辑技巧，制作了提高项目影响力的短视频。
        - 参与高规格文化活动报道，展现了适应力与对新闻报道卓越性的追求。
      ]],
    )
  }

  let dagro = {
    let dagro-date = [_#translate-date(6, 2022) -- #translate-date(8, 2022), #translate-date(6, 2023) -- #translate-date(8, 2023)_]
    translate(
      en: cventry(
        tl: [*Dagro Chemical (Chengwu) Co., Ltd.*, _Chemical Lab Intern_, Chengwu, Shandong, China],
        tr: dagro-date,
      )[#noSimple[
        - Assisted in the chemical laboratory, analyzing concentrations of samples and ensuring process quality across multiple stages of production for agricultural product intermediates.
        - Supported inventory management, gaining knowledge of logistics and storage systems to maintain necessary materials for production.
        - Learned the specific functions of factory equipment, sewage treatment processes, and manufacturing procedures in workshops.
        - Observed and studied colleagues’ research and development techniques to improve production procedures.
      ]],
      zh: cventry(
        tl: [*达瑞化工（成武）有限公司*，_化学实验室实习生_，中国，山东，成武],
        tr: dagro-date,
      )[#noSimple[
        - 在化学实验室协助工作，分析样品浓度，确保农业产品中间体生产的多个阶段的工艺质量。
        - 支持库存管理，学习物流和存储系统知识，以维持生产所需的材料。
        - 学习工厂设备的具体功能、污水处理过程和车间的制造程序。
        - 观察和学习同事的研究和开发技术，以改进生产程序。
      ]],
    )
  }

  // let kray = {
  //   let kray-date = [_#translate-date(6, 2024) -- #translate-date(8, 2024)_]
  //   translate(
  //     en: cventry(
  //       tl: [*Kray Builds Design & Construction, LLC*, _Construction Assistant_, ],
  //       tr: kray-date,
  //     )[#noSimple[
  //       - Excavated a pit to install a rod for hanging lights and electrical outlets, ensuring proper measurements and stability.
  //       - Collaborated with other workers and the project leader to plan and execute the installation, following county safety standards and functional requirements.
  //     ]],
  //     zh: cventry(
  //       tl: [*克雷设计与施工有限责任公司*，建筑助理],
  //       tr: kray-date,
  //     )[#noSimple[
  //       - 挖掘坑洞以安装悬挂灯具和电源插座的杆子，确保测量和稳定性。
  //       - 与其他工人和项目负责人合作，计划和执行安装，遵循县安全标准和功能要求。
  //     ]],
  //   )
  // }

  let achievements = {
    let apscholar-date = [_#translate-date(4, 2023) -- #translate-date(5, 2025)_]
    let deanslist-date = [_#translate-date(8, 2021) -- #translate-date(5, 2025)_]
    let usaco-date = [_#translate-date(12, 2023)_]
    let yale-date = [_#translate-date(7, 2023)_]
    translate(
      en: cventry(
        tl: [*Dean's List*],
        tr: deanslist-date,
      )[],
      zh: cventry(
        tl: [*院长嘉奖名单*],
        tr: deanslist-date,
      )[],
    )
    translate(
      en: cventry(
        tl: [*AP Scholar Award*],
        tr: apscholar-date,
      )[],
      zh: cventry(
        tl: [*AP 学者奖*],
        tr: apscholar-date,
      )[],
    )
    translate(
      en: cventry(
        tl: [*USA Computing Olympiad Platinum Division Qualifier*],
        tr: usaco-date,
      )[],
      zh: cventry(
        tl: [*美国计算机奥林匹克竞赛 (USACO) 铂金级资格赛晋级者*],
        tr: usaco-date,
      )[],
    )
    translate(
      en: cventry(
        tl: [*Scholar, Yale Young Global Scholars*],
        tr: yale-date,
      )[
        - Attended Yale Young Global Scholars in the Literature, Philosophy, & Culture (LPC) session.
        - Engaged in two weeks of academic lectures and participated in various seminars on classical philosophy, minority culture, global architectural styles and music.
        - Collaborated with peers to present a group research project, using spoken-word poetry as a creative exploration of literary techniques and romance in literature.
      ],
      zh: cventry(
        tl: [*耶鲁大学青年全球学者项目学者*],
        tr: yale-date,
      )[
        - 参加了耶鲁大学青年全球学者项目的文学、哲学与文化（LPC）项目。
        - 参与了为期两周的学术讲座，并参加了关于古典哲学，少数族裔文化，世界建筑风格和音乐的各种研讨会。
        - 与同龄人合作，展示了一项小组研究项目，使用口语诗歌作为对文学技巧和文学中的浪漫的创造性探索。
      ],
    )
  }
  let presentation = {
    let presentation-date = [_#translate-date(10, 2023)_]
    translate(
      en: cventry(
        tl: [*Presenter, Unity Day Workshop: Diversity in Photography*],
        tr: presentation-date,
      )[
        - Researched, explored, and presented various themes, styles, and cultural movements in photography history for a Unity Day workshop to students, a school event celebrating diverse cultures, focusing on photographers from various cultural backgrounds.
      ],
      zh: cventry(
        tl: [*文化日工作坊：摄影中的多样性*，演讲者],
        tr: presentation-date,
      )[
        - 研究、探索并展示了摄影历史中的各种主题、风格和文化运动，在文化日为学生们进行演讲，这是一个庆祝多元文化的学校活动，重点介绍了来自不同文化背景的摄影师。
      ],
    )
  }
  let handout = {
    let handout-date = [_#translate-date(7, 2021) -- #translate-date(12, 2022)_]
    let ghLink = githublink("LLLgoyour/Handout")
    translate(
      en: cventry(
        tl: [*Physics Handout Translator*],
        tr: handout-date,
      )[
        - Collaborated with friends to assist Professor Wang Yi at HKUST in translating physics handouts (#ghLink) from English to Chinese covering topics such as relativity, quantum theory, particle-wave duality, and statistical physics. Gained experience using LaTeX and Overleaf to collaborate on the translation and formatting of scientific material.
      ],
      zh: cventry(
        tl: [*物理讲义翻译员*],
        tr: handout-date,
      )[
        - 与朋友合作，协助香港科技大学的王一教授将物理讲义 (#ghLink) 从英语翻译成中文，内容涵盖相对论、量子理论、波粒二象性和统计物理等主题。获得了使用 LaTeX 和 Overleaf 协作翻译和格式化科学材料的经验。
      ],
    )
  }

  let skills = {
    let devTools = {
      let tools = ("GitLab", "GitHub", "BitBucket", "Slack", "Overleaf")
      translate(
        en: [
          - Tools: editor-agnostic, have experience with team tools like #tools.join(", ") and more.
        ],
        zh: [- 开发工具：能适应常见编辑器/操作系统，有使用 #tools.join("、") 等团队协作工具的经验。],
      )
    }
    let progLang = {
      let very = "Java, Python, LaTeX"
      let somehow = "C, C++, Mathematica, Go, Pascal"
      translate(
        en: [
          - Programming Languages: multilingual (not limited to any specific language), especially experienced in #very, comfortable with #somehow (in random order).
        ],
        zh: [
          - 编程语言：泛语言（编程不受特定语言限制），且尤其熟悉 #very，较为熟悉 #somehow（排名均不分先后）。
        ],
      )
    }
    let PyJava = {
      let before-swing = "NumPy for JupyterNotebook"
      translate(
        en: [
          - Java/Python: *6 years of experience*, familiar with #before-swing, basic to advanced algorithms, number theory and group theory for competitive coding.
        ],
        zh: [- Java/Python：*6 年开发经验*，熟悉 #before-swing 以及在算法竞赛中会应用到的初级到高级算法与数论和图论。],
      )
    }
    let webDev = translate(
      en: [
        - Web Development: *3 years of experience*, familiar with mainstream frameworks and languages including Vue.JS.
      ],
      zh: [- 网页开发：*3 年开发经验*，熟悉主流框架与语言如Vue.JS。],
    )
    let office-tools = translate(
      en: [
        - Office Tools: *3 years of experience*, familiar with Microsoft Office, Google Docs, and other office tools.
      ],
      zh: [- 办公软件：*8 年使用经验*，熟悉 Microsoft Office、Google Docs 等办公软件。],
    )
    progLang
    PyJava
    noSimple[#webDev]
    devTools
    office-tools
  }

  let misc = {
    translate(
      en: [
        - Languages: English - proficient (SAT 1450/1600: English 680, Math 770, top 3 percentile among all participants), Chinese - native speaker
        - Interests:
          - Varsity Alpine Ski Team (2021-2023): Participated in competitive skiing, contributing to the team's achievements in various championships.
          - Founder and Keyboard Player, Careless Youth Band (2021-2024): Founded and led the band, organizing rehearsals and performances, and composing original music.
      ],
      zh: [
        - 语言：English - 精通 (SAT 1450/1600: English 680, Math 770，全部考生中头部3%)，汉语 - 母语水平
        - 兴趣爱好：
          - 校队高山滑雪队 (2021-2023)：参与竞技滑雪（小回转，大回转），为团队在各种锦标赛中的获奖做出贡献。
          - 乐队 Careless Youth 的创始人和键盘手 (2021-2024)：创立并领导乐队，组织排练和演出，并创作原创音乐。
      ],
    )
    // translate(
    //   en: [
    //     - Latest revision of this resume: one-page version #enSimple, complete version: #enElab
    //     #noSimple[- Get the Chinese version of this resume: #cnLink]
    //   ],
    //   zh: [- 获取此简历的最新更新：中文版本 #cnLink，英语版本 #enElab，单页版本（仅英语）：#enSimple]
    // )
  }

  // Start of the document

  translate(en: [= #smallcaps[Jack Dai]], zh: [= 戴相承])

  [#link("mailto:xchdai@gmail.com")[xchdai\@gmail.com] $dot.c$ #iconlink("https://lllgoyour.com") $dot.c$ #iconlink(
      "https://github.com/LLLgoyour",
      icon: "github",
    )
    #iconlink(
      "https://www.linkedin.com/in/jack-d-91259534b/",
      icon: "linkedin",
    )
  ]

  edu

  translate(en: [== Work Experience], zh: [== 工作经历])
  camden-filmfest
  chinadaily
  fvs-media
  dagro
  // kray

  noSimple[
    #translate(en: [== Related Projects], zh: [== 项目经历])
    //
    // cs231
    #handout
  ]

  noSimple[
    #translate(en: [== Academic Experience], zh: [== 学术经历])
    #presentation
  ]
  translate(en: [== Achievements], zh: [== 成就])
  achievements
  translate(en: [== Skills], zh: [== 技能])
  skills

  translate(en: [== Misc], zh: [== 其它])
  misc

  // https://github.com/typst/typst/issues/1462
  //   {
  //     set text(size: 0pt)
  //     [@SIT]
  //     noSimple[@ExactlyApplied, @Guest, @ExtTyApp, @FordHelix]
  //   }
  //   translate(en: [== Papers], zh: [== 论文])
  //   bibliography("pub.bib", title: none)
}
