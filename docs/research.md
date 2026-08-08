# X 信息流优化：证据与可操作结论

## 1. X 的公开流水线

X 的开源 `twitter/the-algorithm` 将 For You 描述为候选生成、特征补全、机器学习排序、过滤/启发式、混排和产品呈现。公开的过滤项包括作者多样性、内容平衡、反馈疲劳、去重、已见内容移除和屏蔽/静音可见性过滤。[Home Mixer README](https://github.com/twitter/the-algorithm/blob/main/home-mixer/README.md)

X 公开的 For You/Following 说明明确：For You 会混合关注账号、关注主题和推荐内容；Following 是只来自已关注账号的时间线。[X Help: About your For you timeline](https://help.x.com/en/using-x/x-timeline)

2026 年公开的 `xai-org/x-algorithm` 进一步把 For You 描述为 Thunder（关注网络）与 Phoenix（站外检索）候选源，经 Grok 模型预测多种互动概率后合并排序，并在后处理阶段做去重检查。[xai-org/x-algorithm](https://github.com/xai-org/x-algorithm)

## 2. 由证据推出的策略

### 策略 A：先切换信息入口

Following 直接去掉站外候选源，是最强、最可验证、最容易撤销的“降推荐”动作。它不是改写算法，而是选择不同产品管线。

### 策略 B：把反馈当作精确标签

点赞、回复、转发、点开帖子和停留都可能成为用户信号；因此“随手点开再骂”仍可能给系统留下正向兴趣信号。需要把不想再见的对象变成明确的 Not interested、静音字词或静音账号反馈，并保留目标清单。

### 策略 C：用多样性指标做反馈回路

每周固定抽样 20–50 条，比较作者集中度、主题熵、重复率和站外比例。只有指标改善且用户主观满意度没有下降，才保留设置；否则撤销最近一次变更。指标是诊断工具，不是给作者或观点贴质量标签。

### 策略 D：不做模拟互动和自动取关

X 官方规则禁止自动化主动关注和取消关注。[X Rules and best practices](https://help.x.com/en/rules-and-policies/x-rules-and-best-practices) 因此本项目不通过批量取关“破解”推荐，也不模拟点赞/转发来训练账号。

## 3. 社区说法如何处理

社区文章常声称固定发帖频率、视频、早期互动或某种文案能获得更多分发。这些是面向发布者的经验，不等于用户端能消除信息茧房；若没有可复现样本和对照组，本项目只把它们当假设，不写进自动化设置。
