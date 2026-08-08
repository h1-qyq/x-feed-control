# X Feed Control

一个只针对 X（Twitter）的浏览器控制 Skill：把“重复推荐、同一作者刷屏、For You 信息茧房”变成可审计、可撤销、可复查的设置流程。

## 给普通用户的一句话

把这个仓库地址复制给 Codex，然后发送：

```text
读取并执行这个仓库：https://github.com/OWNER/x-feed-control
使用我当前已登录的浏览器，只操作 X。先按仓库规则审计，再自动完成安全设置；涉及静音、屏蔽、删除、批量取关或其他不可逆动作时，先给我精确清单并只确认一次。
```

把 `OWNER` 换成仓库实际所有者。仓库还提供可直接复制的 [一键提示词](prompts/one-click-x.txt)。

## 仓库里有什么

- [`SKILL.md`](SKILL.md)：给 Codex/浏览器代理读取的执行契约。
- [`prompts/one-click-x.txt`](prompts/one-click-x.txt)：新手直接复制的提示词。
- [`docs/research.md`](docs/research.md)：X 公开架构和可验证的优化原则。
- [`docs/safety.md`](docs/safety.md)：权限边界、撤销点和失败恢复。
- [`tests/acceptance.md`](tests/acceptance.md)：验收标准，防止代理只写教程或乱改账号。

## 重要边界

这不是“破解 X 服务器算法”，也不会模拟点赞、转发、关注或取消关注来操纵推荐。它只调节用户可见的入口、设置和明确反馈，并在每个写操作后重新读取页面验证状态。X 官方明确禁止自动化主动关注和取消关注，因此本项目永远不做批量取关。

## 当前版本

目标平台：X Web。YouTube 已明确砍掉，不在本仓库范围内。

这是一个浏览器 Skill/执行契约，不收集密码、Cookie、令牌、localStorage 或浏览历史。

## 发布到你的 GitHub

如果当前 Codex 没有 GitHub 写权限，在仓库目录执行：

```powershell
gh auth login
./publish.ps1
```

脚本会创建一个公开仓库 `x-feed-control`、推送当前 `main` 分支，并打印最终 URL。它不会读取或保存你的 GitHub token。
