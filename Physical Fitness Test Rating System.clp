(deftemplate student-data
(slot name)
(slot gender)
(slot weight)
(slot height)
(slot vital-capacity (default 0))
(slot sit-and-reach (default 0))
(slot standing-long-jump (default 0))
(slot pull-up (default 0))
(slot sit-up (default 0))
(slot 1000-meter-run (default 0))
(slot 800-meter-run (default 0))
(slot 50-meter-run (default 0)))

(deftemplate physical-fitness-test
(slot name)
(slot result-vital-capacity)
(slot result-sit-and-reach)
(slot result-standing-long-jump)
(slot result-pull-up (default NoTest))
(slot result-sit-up (default NoTest))
(slot result-1000-meter-run (default NoTest))
(slot result-800-meter-run (default NoTest))
(slot result-50-meter-run))

(deffunction check-integer(?answer)
(while (not (integerp ?answer)) do
(printout t "Invalid input, reenter: ")
(bind ?answer (read)))
?answer)

(deffunction check-number(?answer)
(while (not (numberp ?answer)) do
(printout t "Invalid input, reenter: ")
(bind ?answer (read)))
?answer)

(deffunction check-string(?answer)
(while (not (lexemep ?answer)) do
(printout t "Invalid input, reenter: ")
(bind ?answer (read)))
?answer)

(deffunction precision (?num ?digits)
(bind ?m (integer (** 10 ?digits)))
(/ (integer (* ?num ?m)) ?m))

(deffunction enterStudentData()
(printout t "Enter name: ")
(bind ?name (read))
(bind ?name (check-string ?name))
(printout t "Enter gender(M/F): ")
(bind ?gender (read))
(while (and (neq ?gender M) (neq ?gender m) (neq ?gender F) (neq ?gender f))
(printout t "Invalid input, reenter gender(M/F): ")
(bind ?gender (read)))
(printout t "Enter weight (kg): ")
(bind ?weight (read))
(bind ?weight (check-number ?weight))
(printout t "Enter height (m): ")
(bind ?height (read))
(bind ?height (check-number ?height))
(if (or (eq ?gender M) (eq ?gender m))
then
(printout t "Enter vital capacity (ml): ")
(bind ?vital-capacity (read))
(bind ?vital-capacity (check-number ?vital-capacity))
(printout t "Enter sit-and-reach (cm): ")
(bind ?sit-and-reach (read))
(bind ?sit-and-reach (check-number ?sit-and-reach))
(printout t "Enter standing long jump (cm): ")
(bind ?standing-long-jump (read))
(bind ?standing-long-jump (check-number ?standing-long-jump))
(printout t "Enter number of pull up: ")
(bind ?pull-up (read))
(bind ?pull-up (check-integer ?pull-up))
(printout t "Enter duration of 1000 meter run (second): ")
(bind ?long-run (read))
(bind ?long-run(check-number ?long-run))
(printout t "Enter duration of 50 meter run (second): ")
(bind ?short-run (read))
(bind ?short-run (check-number ?short-run))
(assert (student-data (name (upcase ?name)) (gender (upcase ?gender)) (weight ?weight) (height ?height) (vital-capacity ?vital-capacity) (sit-and-reach ?sit-and-reach) (standing-long-jump ?standing-long-jump) (pull-up ?pull-up) (1000-meter-run ?long-run) (50-meter-run ?short-run)))
else
(printout t "Enter vital capacity (ml): ")
(bind ?vital-capacity (read))
(bind ?vital-capacity (check-number ?vital-capacity))
(printout t "Enter number of sit-and-reach (cm): ")
(bind ?sit-and-reach (read))
(bind ?sit-and-reach (check-number ?sit-and-reach))
(printout t "Enter standing long jump (cm): ")
(bind ?standing-long-jump (read))
(bind ?standing-long-jump (check-number ?standing-long-jump))
(printout t "Enter number of sit up: ")
(bind ?sit-up (read))
(bind ?sit-up (check-integer ?sit-up))
(printout t "Enter duration of 800 meter run (second): ")
(bind ?long-run (read))
(bind ?long run (check-number ?long-run))
(printout t "Enter duration of 50 meter run (second): ")
(bind ?short-run (read))
(bind ?short-run(check-number ?short-run))
(assert (student-data (name (upcase ?name)) (gender (upcase ?gender)) (weight ?weight) (height ?height) (vital-capacity ?vital-capacity) (sit-and-reach ?sit-and-reach) (standing-long-jump ?standing-long-jump) (sit-up ?sit-up) (800-meter-run ?long-run) (50-meter-run ?short-run)))))

(deffunction physicalFitnessTestResult(?name ?gender ?weight ?height ?vital-capacity ?sit-and-reach ?standing-long-jump ?pull-up ?sit-up ?male-long-run ?female-long-run ?short-run)
(if (or (and (>= ?vital-capacity 4800) (eq ?gender M))
(and (>= ?vital-capacity 3300) (eq ?gender F)))
then
(bind ?result-vital-capacity Excellent)
else 
(if (or (and (>= ?vital-capacity 4300) (< ?vital-capacity 4800) (eq ?gender M))
(and (>= ?vital-capacity 3000) (< ?vital-capacity 3300) (eq ?gender F)))
then
(bind ?result-vital-capacity Good)
else
(if (or (and (>= ?vital-capacity 3100) (< ?vital-capacity 4300) (eq ?gender M))
(and (>= ?vital-capacity 2000) (< ?vital-capacity 3000) (eq ?gender F)))
then
(bind ?result-vital-capacity Pass)
else
(bind ?result-vital-capacity Fail))))
(if (or (and (>= ?sit-and-reach 21.3) (eq ?gender M))
(and (>= ?sit-and-reach 22.2) (eq ?gender F)))
then
(bind ?result-sit-and-reach Excellent)
else
(if (or (and (>= ?sit-and-reach 17.7) (< ?sit-and-reach 21.3) (eq ?gender M))
(and (>= ?sit-and-reach 19) (< ?sit-and-reach 22.2) (eq ?gender F)))
then
(bind ?result-sit-and-reach Good)
else
(if (or (and (>= ?sit-and-reach 3.7) (< ?sit-and-reach 17.7) (eq ?gender M))
(and (>= ?sit-and-reach 6) (< ?sit-and-reach 19) (eq ?gender F)))
then
(bind ?result-sit-and-reach Pass)
else
(bind ?result-sit-and-reach Fail))))
(if (or (and (>= ?standing-long-jump 263) (eq ?gender M))
(and (>= ?standing-long-jump 195) (eq ?gender F)))
then
(bind ?result-standing-long-jump Excellent)
else
(if (or (and (>= ?standing-long-jump 248) (< ?standing-long-jump 263) (eq ?gender M))
(and (>= ?standing-long-jump 181) (< ?standing-long-jump 195) (eq ?gender F)))
then
(bind ?result-standing-long-jump Good)
else
(if (or (and (>= ?standing-long-jump 208) (< ?standing-long-jump 248) (eq ?gender M))
(and (>= ?standing-long-jump 151) (< ?standing-long-jump 181) (eq ?gender F)))
then
(bind ?result-standing-long-jump Pass)
else
(bind ?result-standing-long-jump Fail))))
(if (and (>= ?pull-up 17) (eq ?gender M))
then
(bind ?result-pull-up Excellent)
else
(if (and (>= ?pull-up 15) (< ?pull-up 17) (eq ?gender M))
then
(bind ?result-pull-up Good)
else
(if (and (>= ?pull-up 10) (< ?pull-up 15) (eq ?gender M))
then
(bind ?result-pull-up Pass)
else
(if (and (< ?pull-up 10) (eq ?gender M))
then
(bind ?result-pull-up Fail)
else
(bind ?result-pull-up NoTest)))))
(if (and (>= ?sit-up 52) (eq ?gender F))
then
(bind ?result-sit-up Excellent)
else
(if (and (>= ?sit-up 46) (< ?sit-up 52) (eq ?gender F))
then
(bind ?result-sit-up Good)
else
(if (and (>= ?sit-up 26) (< ?sit-up 46) (eq ?gender F))
then
(bind ?result-sit-up Pass)
else
(if (and (< ?sit-up 26) (eq ?gender F))
then
(bind ?result-sit-up Fail)
else
(bind ?result-sit-up NoTest)))))
(if (and (<= ?male-long-run 207) (eq ?gender M))
then
(bind ?result-1000-meter-run Excellent)
else
(if (and (> ?male-long-run 207) (<= ?male-long-run 222) (eq ?gender M))
then
(bind ?result-1000-meter-run Good)
else
(if (and (> ?male-long-run 222) (<= ?male-long-run 272) (eq ?gender M))
then
(bind ?result-1000-meter-run Pass)
else
(if (and (> ?male-long-run 272) (eq ?gender M))
then
(bind ?result-1000-meter-run Fail)
else
(bind ?result-1000-meter-run NoTest)))))
(if (and (<= ?female-long-run 210) (eq ?gender F))
then
(bind ?result-800-meter-run Excellent)
else
(if (and (> ?female-long-run 210) (<= ?female-long-run 224) (eq ?gender F))
then
(bind ?result-800-meter-run Good)
else
(if (and (> ?female-long-run 224) (<= ?female-long-run 274) (eq ?gender F))
then
(bind ?result-800-meter-run Pass)
else
(if (and (> ?female-long-run 274) (eq ?gender F))
then
(bind ?result-800-meter-run Fail)
else
(bind ?result-800-meter-run NoTest)))))
(if (or (and (<= ?short-run 6.9) (eq ?gender M))
(and (<= ?short-run 7.7) (eq ?gender F)))
then
(bind ?result-50-meter-run Excellent)
else
(if (or (and (> ?short-run 6.9) (<= ?short-run 7.1) (eq ?gender M))
(and (> ?short-run 7.7) (<= ?short-run 8.3) (eq ?gender F)))
then
(bind ?result-50-meter-run Good)
else
(if (or (and (> ?short-run 7.1) (<= ?short-run 9.1) (eq ?gender M))
(and (> ?short-run 8.3) (<= ?short-run 10.3) (eq ?gender F)))
then
(bind ?result-50-meter-run Pass)
else
(bind ?result-50-meter-run Fail))))
(assert (physical-fitness-test (name (upcase ?name))(result-vital-capacity ?result-vital-capacity) (result-sit-and-reach ?result-sit-and-reach) (result-standing-long-jump ?result-standing-long-jump) (result-pull-up ?result-pull-up) (result-sit-up ?result-sit-up) (result-1000-meter-run ?result-1000-meter-run) (result-800-meter-run ?result-800-meter-run) (result-50-meter-run ?result-50-meter-run))))

(deffunction getBMI (?weight ?height)
(bind ?BMI ( / ?weight (* ?height ?height)))
(bind ?BMI (precision ?BMI 2))
?BMI)

(deffunction rateBMI (?BMI)
(if (>= ?BMI 30.0)
then
(bind ?temp Obese)
else
(if (and (>= ?BMI 25.0) (< ?BMI 30.0))
then
(bind ?temp Overweight)
else
(if (and (>= ?BMI 18.5) (< ?BMI 25.0))
then
(bind ?temp Normal)
else
(bind ?temp Underweight))))
?temp)

(defrule get-data
(not (new-data))
=>
(assert (new-data))
(enterStudentData))

(defrule check-physical-fitness-test-result
(student-data (name ?name) (gender ?gender)  (weight ?weight) (height ?height) (vital-capacity ?vital-capacity) (sit-and-reach ?sit-and-reach) (standing-long-jump ?standing-long-jump) (pull-up ?pull-up) (sit-up ?sit-up) (1000-meter-run ?male-long-run) (800-meter-run ?female-long-run) (50-meter-run ?short-run))
(not (exists (physical-fitness-test (name ?name))))
=>
(physicalFitnessTestResult ?name ?gender ?weight ?height ?vital-capacity ?sit-and-reach ?standing-long-jump ?pull-up ?sit-up ?male-long-run ?female-long-run ?short-run))

(defrule display-student-result
?data <- (student-data (name ?name) (gender ?gender) (weight ?weight) (height ?height))
?result <- (physical-fitness-test (name ?name) (result-vital-capacity ?result-vital-capacity) (result-sit-and-reach ?result-sit-and-reach) (result-standing-long-jump ?result-standing-long-jump) (result-pull-up ?result-pull-up) (result-sit-up ?result-sit-up) (result-1000-meter-run ?result-1000-meter-run) (result-800-meter-run ?result-800-meter-run) (result-50-meter-run ?result-50-meter-run))
?fact <- (new-data)
=>
(printout t crlf "Result physical fitness test" crlf)
(printout t "Name: " ?name crlf)
(printout t "Gender: " ?gender crlf)
(bind ?BMI (getBMI ?weight ?height))
(printout t "BMI: " ?BMI ", " (rateBMI ?BMI) crlf)
(printout t "Vital capacity: " ?result-vital-capacity crlf)
(printout t "Sit and reach: " ?result-sit-and-reach crlf)
(printout t "Standing long jump: " ?result-standing-long-jump crlf)
(if (eq ?gender M)
then
(printout t "Pull up: " ?result-pull-up crlf)
(printout t "1000 meter run: " ?result-1000-meter-run crlf)
(printout t "50 meter run: " ?result-50-meter-run crlf crlf)
else
(printout t "Sit up: " ?result-sit-up crlf)
(printout t "800 meter run: " ?result-800-meter-run crlf)
(printout t "50 meter run: " ?result-50-meter-run crlf crlf))
(retract ?fact)
(halt))
