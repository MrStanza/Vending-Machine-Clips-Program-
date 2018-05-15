;TEAMWORK GROUP 5

;NALEDI MAFOJANE
;CHIRAAG MAHARAJ
;LINDOKUHLE MALAZA
;KAMOHELO MALEBO
;AMUKELANI MALULEKE
;TEBOHO MAPHIKE
;S MASEKO
;DOCTOR MASHABA
;REUBEN MASHIFANE

(deffunction add_coins (?response)
        (if (eq ?response R5) then
                (return 5))
        (if (eq ?response R2) then
                (return 2))
        (if (eq ?response R1) then
                (return 1))
        (if (eq ?response c50) then
                (return 0.50))
        (if (eq ?response c20) then
                (return 0.20))
        (if (eq ?response c10) then
                (return 0.10)))

(deffunction price-of-item (?answer)
        (if (eq ?answer 1) then
                (bind ?total-price 8.50))
        (if (eq ?answer 2) then
                (bind ?total-price 10.00))
        (if (eq ?answer 3) then 
                (bind ?total-price 12.50))
        (if (eq ?answer 4) then
                (bind ?total-price 15.00))
        (printout t "Your need to pay: R" ?total-price "0"crlf)
        (while (> ?total-price 0)
                (printout t "Add coins." crlf)
                (bind ?total-price (- ?total-price (add_coins (read))))
                (if (>= ?total-price 0) then
                (printout t "Amount outstanding: " ?total-price crlf)))
        (printout t "Amount paid in full, collect change: R" (* ?total-price -1) crlf))


(deftemplate total_paid (slot balance))
(deftemplate cola (slot price))
(deftemplate orange (slot price))
(deftemplate sweets (slot price))
(deftemplate chocolate (slot price))

(deffacts item-prices
        (cola (price 8.50))
        (orange (price 10.00))
        (sweets (price 12.50))
        (chocolate (price 15.00)))

(defrule vending-options
        =>        
        (printout t "Enter a number (1-4): " crlf
                    "1. Cola: R8.50" crlf
                    "2. Orange: R10.00" crlf
                    "3. Sweets: R12.50" crlf
                    "4. Chocolate: R15.00" crlf)
        (price-of-item(read))
(printout t crlf))
