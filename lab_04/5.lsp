(defun rollTheDices (numberOfEdges)
    (let ((sum (+ (random numberOfEdges) (random numberOfEdges) 2))) ; + 2 так как random генерируется число от нуля
    (and
        (print (list 'Сумма 'из 'броска sum))
        (if (or (= sum 2) (= sum 12)) 
            (and 
            (print '(Игрок получил возможность перебросить кости)) 
            (setq sum (rollTheDices numberOfEdges))) 
            sum)
        sum)))

(defun isWinByNumber (roll)
    (or (= roll 7) (= roll 11)))

(defun whoWon (fPlayerRoll sPlayerRoll) 
    (or 
        (if (isWinByNumber fPlayerRoll) '(Игрок 1 выиграл))
        (if (or (isWinByNumber sPlayerRoll) (> sPlayerRoll fPlayerRoll)) '(Игрок 2 выиграл))
        (if (> fPlayerRoll sPlayerRoll) '(Игрок 1 выиграл))
        'Ничья))

(defun playTheGame ()
    (print (whoWon (and 
                        (print '(Игрок 1 бросает кости)) 
                        (rollTheDices 6))
                   (and 
                        (print '(Игрок 2 бросает кости)) 
                        (rollTheDices 6)))))
		


		

(defun roll_dice () (+ (random 6) 1))



(defun make_a_move () 
	(let ((dice1 (roll_dice)) (dice2 (roll_dice)))
		(if (and (= dice1 dice2) (or (= dice1 1) (= dice1 6)))
			(and 
				(print (list 'Выпало  dice1 dice2  'Повторный 'бросок)) 
				(make_a_move)
			)
			(and 
				(print (list 'Выпало dice1 dice2))
				(+ dice1 dice2)
			)
		)
	)
)
	
	
(defun check_player_win (player_i result) 
	(if (or (= result 7) (= result 11))
		(print (list 'Игрок player_i 'набрал result 'очков 'и 'выиграл 'абсолютно))
	)
)

(defun compare_results (res1 res2) (cond ((> res1 res2) (print '))


(defun play_game () 
	(let ((res1 (make_a_move)) (res2 (make_a_move)))
		(or 
			(check_player_win 1 (make_a_move))
			(check_player_win 2 res2)
			()
			(or ((check_player_win res1) (print '(Игрок 1 абсол))))
			(and 
				(print (list 'Выпало  res1 res2  'Повторный 'бросок)) 
				(make_a_move)
			)
			(and 
				(print (list 'Выпало res1 res2))
				(+ res1 res2)
			)
		)
	)
)









