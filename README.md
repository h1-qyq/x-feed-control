# X Feed Control

一个供 Codex 使用的 X（Twitter）浏览器 Skill。它先审计 Home 时间线的
重复和集中情况，再把时间线切换到 X 已提供的 Following 入口，帮助用户减少站外
推荐带来的重复输入。

它不是 X 推荐算法的替代实现，也不会修改服务器端排序模型。仓库提供的是一份
可审计的浏览器执行契约：代理应读取规则、使用当前已登录的浏览器、验证每次写
操作的结果，并在无法验证时明确报告受阻。

## 直接使用

将下面这句话复制给 Codex：

```text
读取并执行这个仓库：https://github.com/h1-qyq/x-feed-control
只操作 X，使用我当前已登录的浏览器。先读取仓库规则并审计时间线，再执行安全设置；
任何静音、屏蔽、删除或账号关系修改，都先列出准确对象并在提交前只确认一次。
```

运行前提：当前浏览器中已经登录 X，并且 Codex 能控制这个浏览器页面。这个仓库
不提供登录流程，也不收集密码、Cookie、Token、localStorage 或浏览历史。

## 实际包含的能力

- 只读检查 Home 中可见的至少 20 条内容（不足时报告实际数量），记录作者、主题、
  来源和精确/近似重复标记。
- 在数据足够时报告作者集中度、主题集中度、重复率，以及 Following 与站外推荐的
  比例。
- 将 Home 切换到 X 页面上可见的 Following（正在关注）时间线，并重新读取页面验证
  选中状态。
- 在用户明确指定已有 List 时打开该 List；不会擅自创建 List。
- 对静音、屏蔽、不感兴趣或其他关系修改先生成对象清单；重复出现本身不会生成取关
  名单，批量取关永远不执行。

## 明确不做的事

本项目不会自动点赞、回复、转发、发帖、关注、取关、订阅、批量修改账号关系、清除
历史或重置推荐，也不会模拟互动来“训练”推荐系统。它只使用 X 页面可见的入口和
当前设置；如果页面状态、登录状态或写操作无法验证，结果应报告为 Blocked，而不
是猜测完成。

## 仓库文件

- [`SKILL.md`](SKILL.md)：Codex 执行契约和浏览器操作边界。
- [`prompts/one-click-x.txt`](prompts/one-click-x.txt)：可直接复制的一键提示词。
- [`docs/research.md`](docs/research.md)：X 公开资料、研究假设和可验证的操作原则。
- [`docs/safety.md`](docs/safety.md)：登录中断、界面改版和不可逆操作的安全边界。
- [`tests/acceptance.md`](tests/acceptance.md)：人工验收清单，不是自动化测试套件。
- [`publish.ps1`](publish.ps1)：维护者用 GitHub CLI 创建并首次推送仓库的脚本；已有
  `origin` 的克隆仓库不应重复运行。

## 开发与检查

仓库没有 `package.json`、Python 包、构建产物或运行时依赖。修改文档或执行契约后，
至少检查：

```powershell
git diff --check
git status --short
```

然后按 [`tests/acceptance.md`](tests/acceptance.md) 逐项复核。需要验证浏览器行为时，
必须在一个已登录的 X 会话中进行；不要把真实凭据写入仓库或命令行参数。

## 当前状态

这是一个面向 X 的小型、文档驱动 Skill，重点是降低推荐输入的集中度并保留用户确认
边界。它目前不支持 YouTube，也不承诺消除所有重复内容；Following 只能减少站外
候选输入，不能改写 X 的服务器端推荐模型。

## 许可证

本项目使用 [MIT License](LICENSE)。
