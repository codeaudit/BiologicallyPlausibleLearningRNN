# Grid search for parameters

i=0
#for G in 1.2 1.5 1.8
for G in 1.5 
do
    for ALPHAMODUL in  16.0 # 2.0
    do
        for NDUPL in   3  # Not used.
        do
        for PROBAMODUL in   .003 # .001  .01 #.03  .01 .003  # .001
        do
            for TAU in 30  #200 50
            do
                for ALPHATRACE in    .75
                do
                    for ALPHATRACEEXC in  .05 
                    do
                        for MAXDW in  1e-3 3e-3 # 5e-5 1e-4  3e-4 # 3e-4  # 1e-4 #  5e-5  # 2e-5
                        do
                            for ETA in .03  .01   #  3.0 1.5 .5  # 5.0 10.0 20.0 
                            do
                                for DENOM in  1.0  5.0 10.0
                                do
                                    for RNGSEED in 1 2 3 4 5 6 7 8 9 10  11 12 13 14 15 16 17 18 19 20
                                    do
                                        i=$((i+1))
                                        echo $i

                                        suffix="-TAU$TAU-ALPHAMODUL$ALPHAMODUL-G$G-ETA$ETA-MAXDW$MAXDW-ATRACE$ALPHATRACE-ATRACEEXC$ALPHATRACEEXC-PROBAMODUL$PROBAMODUL-DENOM$DENOM-NDUPL$NDUPL-RNGSEED$RNGSEED"   #PROBAMODUL$PROBAMODUL

                                        #mycmd="bsub -q short -g /net -oo output1.txt -eo error1.txt  -W 140:00 ../stdp learn fastpres $FASTPRES altpmult $ALTPMULT altdmult $ALTDMULT latconn $LATCONN alphainhib $ALPHAINHIB alphainhibff $ALPHAINHIBFF wpenlatmult $WPENLATMULT wpen $WPEN inputmult $NDUPL randinitw $RANDINITW" 
                                        mycmd="bsub -q short -g /net -oo output$suffix.txt -eo error$suffix.txt  -W 10:00 ./net RNGSEED $RNGSEED ETA $ETA MAXDW $MAXDW G $G ALPHATRACEEXC $ALPHATRACEEXC ALPHAMODUL $ALPHAMODUL PROBAMODUL $PROBAMODUL DENOM $DENOM TAU $TAU ALPHATRACE $ALPHATRACE NDUPL $NDUPL"

                                        echo $mycmd
                                        $mycmd

                                    done
                                done
                            done
                        done
                    done
                done
            done
        done
    done
done
done
