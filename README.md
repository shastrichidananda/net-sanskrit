# NET Sanskrit — UGC NET Paper 2

A simple, mobile-friendly landing page for a unit-wise UGC NET Sanskrit (Subject Code 25) mock-test portal.

## Current stage

This is the **visual homepage starter only**. The unit cards are placeholders. Student registration/login, question storage, random 100-question test generation, submission, scoring, answer review, and admin question management are not active yet.

Those features will be connected in later steps using Supabase so that student accounts, answer keys, and results are stored securely.

## Deploy on Cloudflare Pages

1. Upload `index.html` to the root of the `net-sanskrit` GitHub repository.
2. In Cloudflare, open **Workers & Pages** → **Create** → **Pages** → **Connect to Git**.
3. Select the `shastrichidananda/net-sanskrit` repository.
4. For a plain HTML site, leave the build command blank and set the output directory to `/` if the form requires it.
5. Deploy.

No build tools are required for this starter page.
