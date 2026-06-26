-- 0008_create_storage_bucket_ocr.sql
-- Creates Supabase Storage bucket for OCR images.

INSERT INTO storage.buckets (id, name, public, avif_autodetection, file_size_limit, allowed_mime_types)
VALUES (
    'ocr-images',
    'ocr-images',
    true,
    false,
    10485760,
    '{"image/png", "image/jpeg", "image/webp"}'
)
ON CONFLICT (id) DO NOTHING;

-- Allow public access to the bucket
CREATE POLICY "Public access to ocr-images"
ON storage.objects FOR SELECT
USING (bucket_id = 'ocr-images');
