program randomNumGen
    implicit none
    integer :: i, seed1, seed2
    double precision :: raneq
    common / rancom / seed1, seed2
    seed1=348713
    seed2=738131
    do i=1,10
        write(*,*) 'Random numbers:',raneq()
    end do
end program randomNumGen

double precision function raneq()
! Function to generate one random number U(0,1) using the ranecu algorithm
! The ranecu algorithm is described in the paper: F. James, Comp. Phys. Comm. 60 (1990) 329
! Each time the function is called, it returns a random number and updates the seed, so there is 
! no need to call the function with a seed.
implicit none
common/rancom/seed1,seed2
integer seed1,seed2,i1,i2, iz

i1 = seed1/53668
seed1 = 40014*(seed1-i1*53668)-i1*12211
if (seed1.lt.0) seed1 = seed1 + 2147483563

i2 = seed2/52774
seed2 = 40692*(seed2-i2*52774)-i2*3791
if (seed2.lt.0) seed2 = seed2 + 2147483399

iz=seed1-seed2
if (iz.lt.1) iz=iz+2147483562
raneq=dble(iz)/2147483562.0d0
return
end

