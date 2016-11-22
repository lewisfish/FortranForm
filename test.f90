program testimage

   use Image
   use Draw
   
   implicit none
   
   type(RGBAimage) :: img
   type(RGBA)      :: colour
   type(point)    :: p1, p2!, p3
   ! integer        :: i, j
   
   !read in image
   call init_image(img)
!   call read_ppm('mona.ppm', img)
!   call write_ppm('fds.ppm', img, 'P6')
   
   !write uniform colour image out
  call init_image(img)
  call alloc_image(img, 200, 200)
  call fill_img(img, RGBA(0,0,0,0))
  p1 = point(100,100)
  p2 = point(50, 50)
  call draw_rectangle(img, p1, p2, RGBA(255,0,0,0), .TRUE.)

  p2 =point(0,0)
  p1 = point(70,70)
  colour=RGBA(0,0,255,128)
    call draw_circle(img, point(160, 50), 50, colour, .True., .TRUE.)
  call draw_rectangle(img, p1, p2, RGBA(0,255,0,128), .TRUE., .TRUE.)
  call save_image( img, 'test','.png')

!   ! draw square using set_pixel
!   do i = 50, 100
!      do j=50, 100
!         call set_pixel(img, j, i, RGB(0,0,0))
!      end do
!   end do
!   
!   ! get pixel colour
!   call get_pixel(img, 100, 200, colour)
!   print*,colour
!   call write_ppm('pixel.ppm', img, 'P6')
!   
  colour = RGBA(0,0,255,150)
!   !draw filled circle
  call init_image(img)
  call alloc_image(img, 200, 200)
  call fill_img(img, RGBA(255, 255, 255,255))
  call draw_circle(img, point(100, 100), 50, colour, .True., .TRUE.)
  call write_ppm('circle.ppm', img, 'P6')
!   
!   !draw rectangle
  call init_image(img)
  call alloc_image(img, 200, 200)
  call fill_img(img, RGBA(255, 255, 255, 255))
  p1 = point(100,100)
  p2 = point(50, 50)
  call draw_rectangle(img, p1, p2, RGBA(0,0,0,150), .TRUE., .TRUE.)
  call write_ppm('rect.ppm', img, 'P6')
!   
!   !draw line
!   p2=point(55,80)
!   call fill_img(img, RGB(0, 0, 0))
!   p1 = point(50,100)
!   p2 = point(75, 75)
!   p3 = point(100, 100)
!   call draw_polygon(img, colour, p1, p2, p3, .true.)
!   call write_ppm('line.ppm', img, 'P6')
!   call save_image(img, 'testfile', '.svg')
end program
