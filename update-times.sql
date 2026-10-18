-- شغّل هذا مرة واحدة فقط في Supabase > SQL Editor لتحويل المواعيد الصباحية إلى مسائية (+12 ساعة)
-- يؤثر فقط على المواعيد قبل الساعة 12 ظهرًا، فلا يضاعف التحويل لو شُغّل مرتين.
update hadarat
set time = to_char((time::time + interval '12 hours'), 'HH24:MI'), updated_at = now()
where time::time < time '12:00';
