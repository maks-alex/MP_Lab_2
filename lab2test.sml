use "lab2func.sml";
(*Test_Function*)
fun test(fun_name : string, result_true, result_actual) =
if result_true = result_actual
then (fun_name, "Passed")
else (fun_name, "Failed");

(*Test_Task_01*)
print "Test_Task_01:\n";
test("is_older", true, is_older((2000, 1, 30), (2021, 1, 30)));
test("is_older", true, is_older((2000, 1, 30), (2000, 1, 31)));
test("is_older", false, is_older((2000, 1, 30), (2000, 1, 30)));

(*Test_Task_02*)
print "Test_Task_02:\n";
test("number_in_month", 3, number_in_month([(2022, 1, 1), (2021, 1, 1), (2020, 1, 30), (2021, 2, 31), (2020, 12, 31), (2020, 2, 1)], 1));
test("number_in_month", 0, number_in_month([(2022, 1, 1), (2021, 1, 1), (2020, 1, 30), (2021, 2, 31), (2020, 12, 31), (2020, 2, 1)], 3));
test("number_in_month", 1, number_in_month([(2022, 1, 1), (2021, 1, 1), (2020, 1, 30), (2021, 2, 31), (2020, 12, 31), (2020, 2, 1)], 12));

(*Test_Task_03*)
print "Test_Task_03:\n";
test("number_in_months", 5, number_in_months([(2022, 1, 1), (2021, 1, 1), (2020, 1, 30), (2021, 2, 31), (2020, 12, 31), (2020, 2, 1)], [1, 2]));
test("number_in_months", 3, number_in_months([(2022, 1, 1), (2021, 1, 1), (2020, 1, 30), (2021, 2, 31), (2020, 12, 31), (2020, 2, 1)], [1, 3]));
test("number_in_months", 0, number_in_months([(2022, 1, 1), (2021, 1, 1), (2020, 1, 30), (2021, 2, 31), (2020, 12, 31), (2020, 2, 1)], [3, 10, 11]));

(*Test_Task_04*)
print "Test_Task_04:\n";
test("dates_in_month", [(1981, 3, 3), (1981, 3, 10)], dates_in_month([(1981, 3, 3), (2001, 1, 3), (1981, 3, 10), (2005, 6, 30), (2022, 7, 30)], 3));
test("dates_in_month", [(1981, 3, 3)], dates_in_month([(1981, 3, 3), (2001, 1, 3), (1981, 4, 10), (2005, 6, 30), (2022, 7, 30)], 3));
test("dates_in_month", [], dates_in_month([(1981, 3, 3), (2001, 1, 3), (1981, 3, 10), (2005, 6, 30), (2022, 7, 30)], 10));

(*Test_Task_05*)
print "Test_Task_05:\n";
test("dates_in_months", [(1981, 3, 3), (1981, 3, 10), (2022, 7, 30)], dates_in_months([(1981, 3, 3), (2001, 1, 3), (1981, 3, 10), (2005, 6, 30), (2022, 7, 30)], [3, 7]));
test("dates_in_months", [(2001, 1, 3)], dates_in_months([(1981, 3, 3), (2001, 1, 3), (1981, 3, 10), (2005, 6, 30), (2022, 7, 30)], [1, 2]));
test("dates_in_months", [], dates_in_months([(1981, 3, 3), (2001, 1, 3), (1981, 3, 10), (2005, 6, 30), (2022, 7, 30)], [8, 9]));

(*Test_Task_06*)
print "Test_Task_06:\n";
test("get_nth", "apple", get_nth(["apple", "ball", "cat", "door"], 1));
test("get_nth", "door", get_nth(["apple", "ball", "cat", "door"], 4));
test("get_nth", "", get_nth(["apple", "ball", "cat", "door"], 5));

(*Test_Task_07*)
print "Test_Task_07:\n";
test("date_to_string", "March 3, 1981", date_to_string((1981, 3, 3)));
test("date_to_string", "January 2, 1948", date_to_string((1948, 1, 2)));
test("date_to_string", "April 18, 1950", date_to_string((1950, 4, 18)));

(*Test_Task_08*)
print "Test_Task_08:\n";
test("number_before_reaching_sum", 0, number_before_reaching_sum(6, [6, 5, 4, 3, 2, 1]));
test("number_before_reaching_sum", 2, number_before_reaching_sum(15, [6, 5, 4, 3, 2, 1]));
test("number_before_reaching_sum", 6, number_before_reaching_sum(22, [6, 5, 4, 3, 2, 1]));

(*Test_Task_09*)
print "Test_Task_09:\n";
test("what_month", 1, what_month(30));
test("what_month", 1, what_month(31));
test("what_month", 2, what_month(32));

(*Test_Task_10*)
print "Test_Task_10:\n";
test("month_range", [], month_range(31, 30));
test("month_range", [1], month_range(31, 31));
test("month_range", [1, 2], month_range(31, 32));
test("month_range", [1, 2, 2], month_range(31, 33));

(*Test_Task_11*)
print "Test_Task_11:\n";
test("min_date", NONE, min_date([]));
test("min_date", SOME (1948, 1, 2), min_date([(1948, 1, 2), (1950, 4, 18), (1981, 3, 3), (2010, 6, 25)]));
test("min_date", SOME (1948, 1, 2), min_date([(1950, 4, 18), (1981, 3, 3), (2010, 6, 25), (1948, 1, 2)]));

    