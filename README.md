# MikroTik RouterOS VLAN Automation (Terraform + Git + CI/CD)

مرجع هندسي لإدارة موارد الشبكة على MikroTik RouterOS ككود (`Infrastructure as Code`) عبر واجهة `REST API` فوق `HTTPS` (المنفذ `443`)، مع فصل واضح بين:
- **الطبقة الأولى (البنية التحتية المُدارة):** تهيئة عنوان الإدارة وشهادة TLS وتفعيل `www-ssl` على الراوتر.
- **الطبقة الثانية (التطوير والمعاينة المحلية):** تعريف الموارد والمتغيرات في `variables.tf` و`main.tf`، وحفظ القيم المحلية في `terraform.tfvars` (المستبعد عبر `.gitignore`).
- **الطبقة الثالثة (الحوكمة وCI/CD):** إدارة الفروع والمراجعات (`Pull Request`) وتمرير الأسرار عبر متغيرات البيئة/الأسرار المؤمّنة.

## المتغيرات الأساسية (`variables.tf`)
- `router_host`: رابط واجهة `REST API` للراوتر (مثال: `https://192.168.56.10`).
- `router_username`: اسم المستخدم (الافتراضي `admin`).
- `router_password`: كلمة المرور (`sensitive = true`) — يُفضّل تمريرها عبر `TF_VAR_router_password`.
- `router_insecure`: السماح بالشهادات الذاتية في بيئة المختبر (`true` / `false`).
- `vlans`: خريطة شبكات الـ VLAN (`vlan_id` و`interface`).

## التشغيل الآمن محلياً
```bash
export TF_VAR_router_password="your-router-password"
terraform fmt
terraform init
terraform validate
terraform plan
