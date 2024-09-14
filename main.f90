program test
    use iso_c_binding, only: c_int, c_char
    implicit none

    interface
        subroutine initwindow(width, height, title) bind(c,name='InitWindow')
            import ::               c_int, c_char
            integer(c_int),         value :: width, height
            character(kind=c_char), dimension(*), intent(in) :: title
        end subroutine initwindow

        function windowshouldclose() bind(c,name='WindowShouldClose')
            import :: c_int
            integer(c_int) :: windowshouldclose
        end function windowshouldclose

        subroutine closewindow() bind(c,name='CloseWindow')
        end subroutine closewindow
        subroutine begindrawing() bind(c,name='BeginDrawing')
        end subroutine begindrawing
        subroutine enddrawing() bind(c,name='EndDrawing')
        end subroutine enddrawing
        subroutine clearbackground() bind(c,name='ClearBackground')
        end subroutine clearbackground

    end interface

    call initwindow(500, 500, "hi from fortran")

    do while (.not. windowshouldclose()==0)
        call begindrawing()
        call clearbackground()
        call enddrawing()
    end do

    call closewindow()
end program test
