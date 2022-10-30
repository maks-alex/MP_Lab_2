(*Task_01*)
fun is_older (date_1: int* int* int, date_2: int* int* int) =
    if (#1 date_1) < (#1 date_2) then 
        true
    else if (#1 date_1) = (#1 date_2) then
            if (#2 date_1) < (#2 date_2) then
                true
            else if ((#2 date_1) = (#2 date_2)) andalso ((#3 date_1) < (#3 date_2)) then
                true
                else
                    false
        else
            false;


(*Task_02*)
fun number_in_month (dates: (int* int* int) list, month: int) =
    if null dates then
        0
    else
        if #2 (hd dates) = month then
            1 + number_in_month(tl dates, month)
        else
            number_in_month(tl dates, month);

(*Task_03*)
fun number_in_months (dates: (int* int* int) list, months: int list ) =
    if null months then
        0
    else 
        number_in_month(dates, hd months) + number_in_months(dates, tl months);

(*Task_04*)
fun dates_in_month (dates: (int* int* int) list, month: int) =
    if null dates then
        []
    else
        if #2 (hd dates) = month then
            (hd dates) :: dates_in_month(tl dates, month)
        else
            dates_in_month(tl dates, month);

(*Task_05*)
fun dates_in_months (dates: (int* int* int) list, months: int list) = 
    if null months then
        []
    else 
        dates_in_month(dates, hd months) @ dates_in_months(dates, tl months);


(*Task_06*)
fun get_nth (strings : string list, n : int) = 
    if null strings then
        ""
    else 
        if n = 1 then
            hd strings
        else
            get_nth(tl strings, n - 1);

(*Task_07*)
fun date_to_string (date: int* int* int) =
    get_nth(["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    , #2 date) ^ " " ^ (Int.toString (#3 date)) ^ ", " ^ (Int.toString (#1 date));

(*Task_08*)
fun number_before_reaching_sum (sum: int, numbers: int list) =
    if null numbers then
        0
    else
        if (sum - (hd numbers)) <= 0 then
            0
        else
            1 + number_before_reaching_sum(sum - (hd numbers), tl numbers);

(*Task_09*)
fun what_month (dayOfYear: int) =
    number_before_reaching_sum(dayOfYear, [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]) + 1;

(*Task_10*)
fun month_range (dayStart: int, dayEnd: int) = 
    if dayStart > dayEnd then
        []
    else 
        what_month(dayStart) :: month_range(dayStart + 1, dayEnd);

(*Task_11*)
fun min_date (dates: (int* int* int) list) =
    if null dates then 
        NONE
    else 
        let fun min_date_nonempty (dates : (int*int*int) list) =
                if null (tl dates) 
                then hd dates
                else 
                    let val tl_ans = min_date_nonempty(tl dates)
                    in
                        if is_older(hd dates, tl_ans) then
                            hd dates
                        else 
                            tl_ans
                    end
        in
            SOME (min_date_nonempty(dates))
        end;
