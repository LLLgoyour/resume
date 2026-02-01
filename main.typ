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
    let colby-gpa = 3.6

    let colby-courses = (
      ([CS 231], [Data Structures and Algorithms], [数据结构和算法]),
      ([MA 262], [Vector Calculus], [向量分析]),
    )

    let in-progress-courses = (
      ([CS 252], [Mathematical Data Analysis and Visualization], [数学数据分析与可视化]),
      ([MA 253], [Linear Algebra], [线性代数]),
    )
    let colby-date = [_#translate-date(8, 2025) -- #translate(en: [Present], zh: [至今]) \
      #translate(en: [Expected Graduation: May 2029], zh: [预计毕业时间: 2029, 5月])_
    ]
    let colby-degree = translate(
      en: [B.A. Candidate in Mathematics and Computer Science],
      zh: [数学与计算机专业文学士],
    )
    translate(
      en: cventry(
        tl: [*Colby College*, Waterville, ME, USA],
        tr: colby-date,
      )[#colby-degree (with Minor in Music), GPA #colby-gpa/4.0 (First Semester)
        #noSimple(
          simple: [,
            _Selected Courses_: #colby-courses.map(item => item.at(0)).join(", ")
            \
            _Courses in Progress_: #in-progress-courses.map(item => item.at(0)).join(", ")
          ],
        )[\
          _Selected Courses_: #colby-courses.map(item => item.at(0) + " " + item.at(1)).join(", ")
          \
          _Courses in Progress_: #in-progress-courses.map(item => item.at(0) + " " + item.at(1)).join(", ")
        ]
      ],

      zh: cventry(
        tl: [科尔比学院，美国，缅因州，沃特维尔],
        tr: colby-date,
      )[#colby-degree，（副专业：音乐），GPA 3.60/4.00 (第一学期) \
        _部分选修课程_：#colby-courses.map(item => item.at(0) + " " + item.at(2)).join(", ")
        \
        _正在进行的课程_： #in-progress-courses.map(item => item.at(0) + " " + item.at(2)).join(", ")
      ],
    )
  }

  let sheehan-photo = {
    let sheehan-date = [#translate-date(1, 2026) -- #translate(en: [Present], zh: [至今])]
    translate(
      en: cventry(
        tl: [*Beowulf Sheehan*, Waterville, ME, USA],
        tr: sheehan-date,
        bl: [_Portrait Photography_, Assistant Photographer],
      )[#noSimple[
        - Assisted visiting artist Beowulf Sheehan with a portrait project photographing select students and members of the Colby community.
        - Supported portrait sessions with equipment setup/breakdown, lighting preparation, and on-site assistance during shoots.
        - Coordinated logistics with sitters and campus offices (availability, scheduling, and communication) to keep sessions running smoothly.
        - Worked through Colby student employment; tracked hours and followed workflow expectations discussed with the photographer.
      ]],
      zh: cventry(
        tl: [*Beowulf Sheehan*，美国，缅因州，沃特维尔],
        tr: sheehan-date,
        bl: [肖像摄影，灯光布置，拍摄协调],
      )[#noSimple[
        - 协助来访艺术家摄影师 Beowulf Sheehan 开展肖像摄影项目，拍摄对象包括部分学生及学院社区成员。
        - 负责拍摄现场支持，包括器材搭建与收纳、灯光准备、拍摄过程协助等。
        - 与被摄者及校内办公室沟通协调（时间确认、拍摄安排与信息对接），保障拍摄流程顺畅。
        - 通过学生雇佣岗位开展工作；记录工时并遵循摄影师说明的工作规范与流程。
      ]],
    )
  }

  let camden-filmfest = {
    let camden-date = [#translate-date(9, 2025)]
    translate(
      en: cventry(
        tl: [*Camden Film Festival*, Camden, ME, USA],
        tr: camden-date,
        bl: [_Event Operations_, Guest Services, Ticketing],
      )[#noSimple[
        - Assisted with event setup, check-in, ticketing, and guest guidance at the Camden Opera House.
        - Supported screenings and live events by coordinating with staff and attendees to ensure smooth operations.
        - Gained hands-on experience in arts event management and community engagement.
      ]],
      zh: cventry(
        tl: [*卡姆登电影节*，美国，缅因州，卡姆登],
        tr: camden-date,
        bl: [活动执行，观众引导，票务协助],
      )[#noSimple[
        - 协助活动布置、签到/票务工作，并在 Camden Opera House 为来宾提供引导与支持。
        - 支持放映与现场活动，与工作人员协作保障观众与团队的顺利体验。
        - 获得艺术活动执行与社区参与的实践经验。
      ]],
    )
  }

  let chinadaily = {
    let chinadaily-date = [#translate-date(6, 2025) -- #translate-date(7, 2025)]
    translate(
      en: cventry(
        tl: [*China Daily*, Beijing, China],
        tr: chinadaily-date,
        bl: [_Cultural Journalism_, Features Reporter, Videographer],
      )[#noSimple[
        - Conducted and supported interviews with artists and cultural figures (including Russian theater director Yury Butusov) to develop feature stories.
        - Reported and produced feature coverage on Beijing East Shore Jazz Club, including interviews, transcript organization, and story development.
        - Edited short-form videos for cultural coverage, improving clarity, pacing, and audience engagement.
        - Contributed to coverage of major cultural events, demonstrating adaptability and attention to editorial quality.
      ]],
      zh: cventry(
        tl: [*中国日报社*，中国，北京],
        tr: chinadaily-date,
        bl: [文化报道，人物采访，视频剪辑],
      )[#noSimple[
        - 参与人物采访与资料整理（包括俄罗斯戏剧导演尤里·布图索夫、北京东岸爵士俱乐部专题报道），为特写报道提供内容支持。
        - 负责文化类短视频剪辑与后期处理，提升叙事节奏与传播效果。
        - 参与高规格文化活动报道，展现适应力与对内容质量的把控。
      ]],
    )
  }

  let achievements = {
    let usaco-date = [_#translate-date(12, 2023)_]
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
  }

  let ymca-research = {
    let ymca-date = [_#translate-date(11, 2025) -- #translate(en: [Present], zh: [至今])_]
    translate(
      en: cventry(
        tl: [*Research Assistant*, _Advisor: Prof. Hong Zhang_, Colby College],
        tr: ymca-date,
      )[
        - Conducting historical research on the role of the YMCA in the development of modern sports and physical education in China.
        - Collecting and analyzing archival documents, biographical records, and institutional histories related to Chinese sports modernization.
        - Preparing a research paper under faculty supervision.
      ],
      zh: cventry(
        tl: [*研究助理*，_导师：张虹教授_，科尔比学院],
        tr: ymca-date,
      )[
        - 研究 YMCA 在中国现代体育与体育教育发展中的作用。
        - 整理与分析历史档案、人物资料和相关机构史料。
        - 在导师指导下撰写研究论文。
      ],
    )
  }


  let lui-project = {
    let lui-date = [_#translate-date(8, 2021) -- #translate(en: [Present], zh: [至今])_]
    let ghLink = githublink("LLLgoyour/LUI")
    translate(
      en: cventry(
        tl: [*LUI*, UI Framework Based on Microsoft Fluent UI],
        tr: lui-date,
      )[
        - Designed and developed an open-source UI component library using Vue and TypeScript, inspired by Microsoft Fluent UI design principles.
        - Implemented modular, reusable components with consistent theming, layout systems, and accessibility considerations.
        - Structured the project with clear documentation, component demos, and version control to support maintainability and developer usability.
        - Published and maintained the framework on GitHub (#ghLink) for public use and collaboration.
      ],
      zh: cventry(
        tl: [*LUI*, 基于 Microsoft Fluent UI 的前端组件库],
        tr: lui-date,
      )[
        - 使用 Vue 与 TypeScript 设计并开发了一个开源 UI 组件库，参考 Microsoft Fluent UI 的设计理念。
        - 实现了模块化、可复用的组件体系，支持统一主题、布局系统与基础可访问性设计。
        - 通过清晰的文档、组件示例与版本管理提升项目的可维护性与开发者友好度。
        - 在 GitHub 上发布并维护该框架 (#ghLink)，支持公开使用与协作开发。
      ],
    )
  }

  let cs231-project = {
    let cs231-date = [_#translate-date(9, 2025) -- #translate-date(12, 2025)_]
    let ghLink = githublink("LLLgoyour/cs231")
    translate(
      en: cventry(
        tl: [*Data Structures & Algorithms Projects*],
        tr: cs231-date,
      )[
        - Completed a series of programming projects in Java for a Data Structures and Algorithms course, implementing core data structures such as linked lists, stacks, queues, binary search trees, and hash maps.
        - Developed search algorithms including BFS, DFS, and A\* for maze-solving and pathfinding problems.
        - Built and tested algorithmic game strategies and simulations, focusing on efficiency, correctness, and performance analysis.
        - Organized coursework, labs, and project code in a structured GitHub repository (#ghLink) with documentation and version control.
      ],
      zh: cventry(
        tl: [*CS 231：数据结构与算法项目*],
        tr: cs231-date,
      )[
        - 使用 Java 完成数据结构与算法课程的一系列编程项目，实现了链表、栈、队列、二叉搜索树和哈希表等核心数据结构。
        - 编写并应用 BFS、DFS 和 A\* 搜索算法解决迷宫寻路与路径规划问题。
        - 设计并测试算法博弈策略与模拟程序，注重效率、正确性和性能分析。
        - 将课程作业、实验和项目代码系统整理至 GitHub 仓库 (#ghLink)，并进行文档管理与版本控制。
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
      let very = "Java, LaTeX"
      let somehow = "Python, C++, Mathematica, Go, HTML, JavaScript"
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
        - Web Development: *3 years of experience*, familiar with mainstream languages including Vue.JS.
      ],
      zh: [- 网页开发：*3 年开发经验*，熟悉主流框架与语言如Vue.JS。],
    )
    let office-tools = translate(
      en: [
        - Office Tools: *6 years of experience*, familiar with Microsoft Office, Google Docs, and other office tools.
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
        - Languages: bilingual in English, native in Mandarin Chinese
        - Interests:
          - Photography (2020–): Curated and exhibited multiple #link("https://sites.google.com/colby.edu/xdai/home")[photo portfolios].
          - Piano Performance (2017–): Performed in recitals and at various venues, featuring works by Liszt, Beethoven, Bach, Scriabin, and others.
          - Varsity Alpine Ski Team (2021-2023): Participated in competitive skiing, contributing to the team's achievements in various championships.
          - Founder and Keyboard Player, Careless Youth Band (2021-2025): Founded and led the band, organizing rehearsals and performances, and composing original music.
      ],
      zh: [
        - 语言：English - 精通或母语水平，汉语 - 母语水平
        - 兴趣爱好：
          - 摄影 (2020-): 整理了并展览了多个#link("https://sites.google.com/colby.edu/xdai/home")[作品集]。
          - 钢琴演奏 (2017-): 曾举办钢琴独奏音乐会，并在不同场合演奏李斯特、贝多芬、巴赫、斯克里亚宾等作曲家的作品。
          - 校队高山滑雪队 (2021-2023)：参与竞技滑雪（小回转，大回转），为团队在各种锦标赛中的获奖做出贡献。
          - 乐队 Careless Youth 的创始人和键盘手 (2021-2025)：创立并领导乐队，组织排练和演出，并创作原创音乐。
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
  sheehan-photo
  camden-filmfest
  chinadaily

  noSimple[
    #translate(en: [== Related Projects], zh: [== 项目经历])
    #cs231-project
    #lui-project
  ]

  noSimple[
    #translate(en: [== Academic Experience], zh: [== 学术经历])
    #ymca-research
  ]
  translate(en: [== Achievements], zh: [== 成就])
  achievements
  translate(en: [== Skills], zh: [== 技能])
  skills

  translate(en: [== Misc], zh: [== 其它])
  misc

  // https://github.com/typst/typst/issues/1462
  {
    set text(size: 0pt)
    [@YMCA]
    noSimple[]
  }
  translate(en: [== Publications & Works in Progress], zh: [== 准备发布的论文])
  bibliography("pub.bib", title: none)
}
