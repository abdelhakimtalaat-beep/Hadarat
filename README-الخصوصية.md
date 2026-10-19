# تفعيل الخصوصية (طلب انضمام + موافقة المشرف)

1. Supabase > Authentication > Providers > Email: أوقف «Confirm email» ثم Save.
2. Supabase > SQL Editor: الصق محتوى access.sql ثم Run (مرة واحدة).
3. أنشئ حساب المشرف: Authentication > Users > Add user (بريدك الحقيقي + كلمة مرور، مع Auto Confirm). ثم نفّذ:
   insert into admins(user_id) select id from auth.users where email='بريدك';
   ثم سجّل دخولك من شاشة الدخول بكتابة بريدك في خانة الرقم.
4. ارفع index.html الجديد على GitHub (واجعل المستودع Private، ولا ترفع ملفات sql). Vercel ينشر تلقائيًا.
