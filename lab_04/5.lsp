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

(defun check_continue_game (result) (not (or (= result 7) (= result 11))))

(defun make_a_move (player_i) 
	(let ((dice1 (roll_dice)) (dice2 (roll_dice)))
		(if (and (print (list 'Игрок player_i 'бросает 'кости)) (= dice1 dice2) (or (= dice1 1) (= dice1 6)))
			(and 
				(print (list 'Выпало  dice1 dice2  'Повторный 'бросок)) 
				(make_a_move player_i)
			)
			(and 
				(print (list 'Выпало dice1 dice2))
				(+ dice1 dice2)
			)
		)
	)
)
	
	
(defun compare_results (res1 res2) 
	(if (check_continue_game res2)
		(and
			(print (list 'rrrr))
			(print (list 'Сравнение 'по 'очкам))
			(print (list 'Игрок 1 'набрал res1))
			(print (list 'Игрок 2 'набрал res2))
			(cond 
				((< res1 res2) (and (print (list 'Игрок 2 'выиграл 'по 'очкам)) 2))
				((> res1 res2) (and (print (list 'Игрок 1 'выиграл 'по 'очкам)) 1))
				((and (print '(Ничья)) 0))
			)
		)	
		(and (print (list 'Игрок 2 'набрал res2 'очков 'и 'выиграл 'абсолютно)) 2)
	)
)

(defun play_game () 
	(let ((res1 (make_a_move 1)))
		(if (check_continue_game res1)
			(compare_results res1 (make_a_move 2))
			(and (print (list 'Игрок 1 'набрал res1 'очков 'и 'выиграл 'абсолютно)) 1)
		)
	)
)









