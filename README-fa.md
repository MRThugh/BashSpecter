<div dir="rtl">
# 🛡️ BashSpecter

[![Linux](https://img.shields.io/badge/Linux-Compatible-success?logo=linux)](https://www.linux.org/)  
[![Bash](https://img.shields.io/badge/Bash-Script-blue?logo=gnu-bash)](https://www.gnu.org/software/bash/)  
[![Security](https://img.shields.io/badge/Security-Tool-critical)](https://github.com/MRThugh/BashSpecter)  
[![Author](https://img.shields.io/badge/Author-MR.Thugh-purple)](https://github.com/MRThugh)
[![Persian](https://img.shields.io/badge/lang-PERSIAN-green)](README-fa.md)
[![English](https://img.shields.io/badge/lang-English-blue)](README.md)

```bash
██████╗  █████╗ ███████╗██╗  ██╗███████╗██████╗ ███████╗ ██████╗████████╗███████╗██████╗ 
██╔══██╗██╔══██╗██╔════╝██║  ██║██╔════╝██╔══██╗██╔════╝██╔════╝╚══██╔══╝██╔════╝██╔══██╗
██████╔╝███████║███████╗███████║█████╗  ██████╔╝█████╗  ██║        ██║   █████╗  ██████╔╝
██╔══██╗██╔══██║╚════██║██╔══██║██╔══╝  ██╔══██╗██╔══╝  ██║        ██║   ██╔══╝  ██╔══██╗
██████╔╝██║  ██║███████║██║  ██║███████╗██║  ██║███████╗╚██████╗   ██║   ███████╗██║  ██║
╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝ ╚═════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝
```

یه ابزار ساده ولی کاربردی برای بررسی هدرهای امنیتی سایت‌ها که کاملاً با **Bash خالص** نوشته شده.  
سبک، سریع و بدون هیچ خرابکاری.

**سریع • فقط خواندنی • بدون دستکاری • متن‌باز**  
ساخته شده با ☕ و 🖤 توسط MR.Thugh

---

## 🚀 قابلیت‌ها

- 🔍 بررسی هدرهای امنیتی HTTP
- ⚡ فوق سبک و سریع (کاملاً Bash)
- 🐧 سازگار با لینوکس و بدون نیاز به وابستگی
- 🛑 فقط حالت خواندنی (هیچ اکسپلویتی انجام نمی‌دهد)
- 🎨 خروجی ترمینالی با حال و هوای هکری

---

## 📦 نصب

کافیه ریپو رو کلون کنی:

```bash
git clone https://github.com/MRThugh/BashSpecter.git
cd BashSpecter
chmod +x bashspecter.sh
```

---

## 🧪 نحوه استفاده

برای بررسی یک دامنه:

```bash
./bashspecter.sh example.com
```

یا اگر بخوای مستقیم با bash اجراش کنی:

```bash
bash bashspecter.sh example.com
```

---

## 🧠 پشت صحنه چه خبره؟

BashSpecter با ارسال درخواست‌های امن **HTTP HEAD/GET** هدرهای امنیتی مهم سایت رو بررسی می‌کنه.

مثل:

- `Content-Security-Policy`
- `X-Frame-Options`
- `X-Content-Type-Options`
- `Strict-Transport-Security`
- `Referrer-Policy`

✔️ هیچ داده‌ای تغییر داده نمی‌شود  
✔️ هیچ brute force انجام نمی‌شود  
✔️ هیچ آسیب‌پذیری‌ای exploit نمی‌شود  

فقط بررسی و نمایش وضعیت امنیتی.

---

## ⚠️ نکته قانونی و اخلاقی

این ابزار فقط برای موارد زیر ساخته شده:

- آموزش و یادگیری
- تست **وب‌سایت‌های خودت**
- آشنایی با مفاهیم امنیت وب

🚫 لطفاً روی سیستم‌ها یا سایت‌هایی که مالک آن نیستی یا **اجازه تست نداری** استفاده نکن.

---

## 👑 سازنده

**MR.Thugh**  
GitHub: https://github.com/MRThugh

> «امنیت یعنی آگاهی، نه تخریب.»

---

## ⭐ حمایت

اگر این پروژه به دردت خورد:

- ⭐ بهش Star بده
- 🍴 Fork کن
- 🧠 ازش یاد بگیر

---

🐧 ساخته شده برای لینوکس • نوشته شده با Bash • متن‌باز

</div>
