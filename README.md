# NWU-Exam: 西北大学试卷排版系统

![Build Status](https://img.shields.io/badge/build-passing-brightgreen)
![Version](https://img.shields.io/badge/version-v0.1.0-blue)
![License](https://img.shields.io/badge/license-LPPL-orange)

> 基于 LaTeX3 (expl3) 构建的模块化、自动化试卷排版引擎。

## 📅 项目进度 (Project Roadmap)

- [x] **Phase 1: 核心架构搭建**
    - [x] `.dtx` + `.ins` 标准构建系统
    - [x] Git 版本控制与目录规范
    - [x] 中文环境支持 (`ctex`)
- [x] **Module A: 页面布局**
    - [x] A4 纸张设定
    - [x] **密封线系统 (Sealed Line)**: 支持双轨虚线、旋转文字、考生信息栏自动生成
- [ ] **Module B: 智能排版**
    - [ ] 选择题自动分栏算法 (Smart Choice)
    - [ ] 题目环境与自动编号
- [ ] **Module C: 自动化评分**
    - [ ] 总分自动统计
    - [ ] 得分表生成

## 🚀 快速开始 (Quick Start)

### 1. 安装
下载本项目，在终端运行安装脚本生成类文件：
```bash
latex nwu-exam.ins