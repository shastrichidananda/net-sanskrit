-- Dashboard revision list: questions the signed-in student has seen but never answered.
CREATE OR REPLACE FUNCTION public.get_student_seen_unanswered()
RETURNS TABLE (
  question_id bigint,
  unit_id integer,
  question_text text,
  option_a text,
  option_b text,
  option_c text,
  option_d text,
  correct_option character,
  explanation text
)
LANGUAGE sql
SECURITY DEFINER
SET search_path TO 'public'
AS $function$
  SELECT DISTINCT ON (s.question_id)
    s.question_id,
    s.unit_id,
    q.question_text,
    q.option_a,
    q.option_b,
    q.option_c,
    q.option_d,
    q.correct_option,
    q.explanation
  FROM public.student_seen_questions s
  JOIN public.questions q ON q.id = s.question_id
  WHERE s.student_id = auth.uid()
    AND NOT EXISTS (
      SELECT 1
      FROM public.attempt_questions aq
      JOIN public.test_attempts a ON a.id = aq.attempt_id
      WHERE aq.question_id = s.question_id
        AND aq.selected_option IS NOT NULL
        AND a.student_id = auth.uid()
    )
  ORDER BY s.question_id, s.first_seen_at;
$function$;

REVOKE ALL ON FUNCTION public.get_student_seen_unanswered() FROM PUBLIC;
GRANT EXECUTE ON FUNCTION public.get_student_seen_unanswered() TO authenticated;
