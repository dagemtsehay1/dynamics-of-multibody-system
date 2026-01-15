! CMD Version:2
! Version 2 enables expanded acceptable characters for object names.
! If unspecified, set to 1 or set to an invalid value, Adams View assumes traditional naming requirements.
!
!-------------------------- Default Units for Model ---------------------------!
!
!
defaults units  &
   length = meter  &
   angle = deg  &
   force = newton  &
   mass = kg  &
   time = sec
!
defaults units  &
   coordinate_system_type = cartesian  &
   orientation_type = body313
!
!------------------------ Default Attributes for Model ------------------------!
!
!
defaults attributes  &
   inheritance = bottom_up  &
   icon_visibility = on  &
   grid_visibility = off  &
   size_of_icons = 5.0E-02  &
   spacing_for_grid = 1.0
!
!------------------------------ Adams View Model ------------------------------!
!
!
model create  &
   model_name = Homework
!
view erase
!
!--------------------------------- Materials ----------------------------------!
!
!
material create  &
   material_name = .Homework.steel  &
   adams_id = 1  &
   density = 7801.0  &
   youngs_modulus = 2.07E+11  &
   poissons_ratio = 0.29
!
!-------------------------------- Rigid Parts ---------------------------------!
!
! Create parts and their dependent markers and graphics
!
!----------------------------------- ground -----------------------------------!
!
!
! ****** Ground Part ******
!
defaults model  &
   part_name = ground
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Homework.ground.MARKER_27  &
   adams_id = 27  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Homework.ground.MARKER_34  &
   adams_id = 34  &
   location = 0.0, 0.4, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Homework.ground.MARKER_59  &
   adams_id = 59  &
   location = 0.0, 0.7, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Homework.ground  &
   material_type = .Homework.steel
!
! ****** Points for current part ******
!
point create  &
   point_name = .Homework.ground.A  &
   location = 0.0, 0.0, 0.0
!
point create  &
   point_name = .Homework.ground.B  &
   location = 0.0, 0.4, 0.0
!
point create  &
   point_name = .Homework.ground.D  &
   location = 0.2, 0.4, 0.0
!
point create  &
   point_name = .Homework.ground.E  &
   location = 0.0, 0.7, 0.0
!
point create  &
   point_name = .Homework.ground.F  &
   location = 0.0, 0.8, 0.0
!
point create  &
   point_name = .Homework.ground.G  &
   location = 0.3, 1.0, 0.0
!
point create  &
   point_name = .Homework.ground.H  &
   location = 0.6, 0.6, 0.0
!
point create  &
   point_name = .Homework.ground.I  &
   location = 0.9, 0.6, 0.0
!
point create  &
   point_name = .Homework.ground.J  &
   location = 1.1, 0.7, 0.0
!
point create  &
   point_name = .Homework.ground.K  &
   location = 1.2, 0.9, 0.0
!
point create  &
   point_name = .Homework.ground.L  &
   location = 1.7, 0.2, 0.0
!
point create  &
   point_name = .Homework.ground.M  &
   location = 2.0, 0.4, 0.0
!
point create  &
   point_name = .Homework.ground.N  &
   location = 1.9, 0.7, 0.0
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Homework.ground  &
   name_visibility = off
!
!------------------------------------- C1 -------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
part create rigid_body name_and_position  &
   part_name = .Homework.C1  &
   adams_id = 2  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.C1
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Homework.C1.MARKER_1  &
   adams_id = 1  &
   location = 0.2, 0.4, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Homework.C1.cm  &
   adams_id = 49  &
   location = 0.15, 0.7, 0.0  &
   orientation = 172.1128817494d, 90.0d, 90.0d
!
marker create  &
   marker_name = .Homework.C1.MARKER_13  &
   adams_id = 13  &
   location = 0.0, 0.8, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Homework.C1.MARKER_19  &
   adams_id = 19  &
   location = 0.3, 1.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Homework.C1.MARKER_30  &
   adams_id = 30  &
   location = 0.2, 0.4, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Homework.C1.MARKER_60  &
   adams_id = 60  &
   location = 0.0, 0.7, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Homework.C1  &
   mass = 35.1045  &
   center_of_mass_marker = .Homework.C1.cm  &
   ixx = 0.7129247222  &
   iyy = 0.5630551778  &
   izz = 0.1644964195  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.C1.MARKER_1
!
geometry create shape extrusion  &
   extrusion_name = .Homework.C1.EXTRUSION_14  &
   adams_id = 14  &
   reference_marker = .Homework.C1.MARKER_1  &
   analytical = yes  &
   points_for_profile = 0.0, 0.0, -2.5E-02  &
      , -0.2, 0.3, -2.5E-02  &
      , -0.2, 0.4, -2.5E-02  &
      , 0.1, 0.6, -2.5E-02  &
      , 0.0, 0.0, -2.5E-02  &
   length_along_z_axis = 5.0E-02
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.C1
!
part attributes  &
   part_name = .Homework.C1  &
   color = RED  &
   name_visibility = off
!
!------------------------------------- C7 -------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
part create rigid_body name_and_position  &
   part_name = .Homework.C7  &
   adams_id = 3  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.C7
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Homework.C7.MARKER_2  &
   adams_id = 2  &
   location = 0.0, 0.8, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Homework.C7.cm  &
   adams_id = 50  &
   location = 0.85, 0.55, 0.0  &
   orientation = 250.596308812d, 90.0d, 90.0d
!
marker create  &
   marker_name = .Homework.C7.MARKER_14  &
   adams_id = 14  &
   location = 0.0, 0.8, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Homework.C7.MARKER_16  &
   adams_id = 16  &
   location = 1.7, 0.2, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Homework.C7.MARKER_17  &
   adams_id = 17  &
   location = 0.9, 0.6, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Homework.C7  &
   mass = 39.005  &
   center_of_mass_marker = .Homework.C7.cm  &
   ixx = 5.3090138889  &
   iyy = 5.2904719597  &
   izz = 3.4794012478E-02  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.C7.MARKER_2
!
geometry create shape extrusion  &
   extrusion_name = .Homework.C7.EXTRUSION_15  &
   adams_id = 15  &
   reference_marker = .Homework.C7.MARKER_2  &
   analytical = yes  &
   points_for_profile = 0.0, 0.0, -2.5E-02  &
      , 1.7, -0.6, -2.5E-02  &
      , 0.9, -0.2, -2.5E-02  &
      , 0.0, 0.0, -2.5E-02  &
   length_along_z_axis = 5.0E-02
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.C7
!
part attributes  &
   part_name = .Homework.C7  &
   color = GREEN  &
   name_visibility = off
!
!------------------------------------ C10 -------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
part create rigid_body name_and_position  &
   part_name = .Homework.C10  &
   adams_id = 4  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.C10
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Homework.C10.MARKER_3  &
   adams_id = 3  &
   location = 1.7, 0.2, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Homework.C10.cm  &
   adams_id = 51  &
   location = 1.85, 0.45, 0.0  &
   orientation = 156.3546949787d, 90.0d, 90.0d
!
marker create  &
   marker_name = .Homework.C10.MARKER_15  &
   adams_id = 15  &
   location = 1.7, 0.2, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Homework.C10.MARKER_25  &
   adams_id = 25  &
   location = 1.9, 0.7, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Homework.C10  &
   mass = 21.45275  &
   center_of_mass_marker = .Homework.C10.cm  &
   ixx = 0.3098730556  &
   iyy = 0.2648330428  &
   izz = 5.3978658627E-02  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.C10.MARKER_3
!
geometry create shape extrusion  &
   extrusion_name = .Homework.C10.EXTRUSION_16  &
   adams_id = 16  &
   reference_marker = .Homework.C10.MARKER_3  &
   analytical = yes  &
   points_for_profile = 0.0, 0.0, -2.5E-02  &
      , 0.2, 0.5, -2.5E-02  &
      , 0.3, 0.2, -2.5E-02  &
      , 0.0, 0.0, -2.5E-02  &
   length_along_z_axis = 5.0E-02
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.C10
!
part attributes  &
   part_name = .Homework.C10  &
   color = CYAN  &
   name_visibility = off
!
!------------------------------------- C8 -------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
part create rigid_body name_and_position  &
   part_name = .Homework.C8  &
   adams_id = 5  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.C8
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Homework.C8.MARKER_4  &
   adams_id = 4  &
   location = 0.6, 0.6, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Homework.C8.cm  &
   adams_id = 52  &
   location = 0.95, 0.7, 0.0  &
   orientation = 295.2269594443d, 90.0d, 90.0d
!
marker create  &
   marker_name = .Homework.C8.MARKER_18  &
   adams_id = 18  &
   location = 0.9, 0.6, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Homework.C8.MARKER_21  &
   adams_id = 21  &
   location = 1.1, 0.7, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Homework.C8.MARKER_23  &
   adams_id = 23  &
   location = 1.2, 0.9, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Homework.C8.MARKER_32  &
   adams_id = 32  &
   location = 0.6, 0.6, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Homework.C8  &
   mass = 23.403  &
   center_of_mass_marker = .Homework.C8.cm  &
   ixx = 0.5233170833  &
   iyy = 0.4962641338  &
   izz = 3.6804199544E-02  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.C8.MARKER_4
!
geometry create shape extrusion  &
   extrusion_name = .Homework.C8.EXTRUSION_17  &
   adams_id = 17  &
   reference_marker = .Homework.C8.MARKER_4  &
   analytical = yes  &
   points_for_profile = 0.0, 0.0, -2.5E-02  &
      , 0.3, 0.0, -2.5E-02  &
      , 0.5, 0.1, -2.5E-02  &
      , 0.6, 0.3, -2.5E-02  &
      , 0.0, 0.0, -2.5E-02  &
   length_along_z_axis = 5.0E-02
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.C8
!
part attributes  &
   part_name = .Homework.C8  &
   color = MAGENTA  &
   name_visibility = off
!
!------------------------------------- C2 -------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
part create rigid_body name_and_position  &
   part_name = .Homework.C2  &
   adams_id = 6  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.C2
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Homework.C2.MARKER_5  &
   adams_id = 5  &
   location = 0.3, 1.0, 0.0  &
   orientation = 339.4439547804d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Homework.C2.MARKER_6  &
   adams_id = 6  &
   location = 1.1, 0.7, 0.0  &
   orientation = 339.4439547804d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Homework.C2.cm  &
   adams_id = 53  &
   location = 0.7, 0.85, 0.0  &
   orientation = 249.4439547804d, 90.0000000143d, 90.0000003018d
!
marker create  &
   marker_name = .Homework.C2.MARKER_20  &
   adams_id = 20  &
   location = 0.3, 1.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Homework.C2.MARKER_22  &
   adams_id = 22  &
   location = 1.1, 0.7, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Homework.C2  &
   material_type = .Homework.steel
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .Homework.C2.LINK_18  &
   i_marker = .Homework.C2.MARKER_5  &
   j_marker = .Homework.C2.MARKER_6  &
   width = 4.0E-02  &
   depth = 2.0E-02
!
part attributes  &
   part_name = .Homework.C2  &
   color = RED  &
   name_visibility = off
!
!------------------------------------- C9 -------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
part create rigid_body name_and_position  &
   part_name = .Homework.C9  &
   adams_id = 7  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.C9
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Homework.C9.MARKER_7  &
   adams_id = 7  &
   location = 1.2, 0.9, 0.0  &
   orientation = 344.0546040991d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Homework.C9.MARKER_8  &
   adams_id = 8  &
   location = 1.9, 0.7, 0.0  &
   orientation = 344.0546040991d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Homework.C9.cm  &
   adams_id = 54  &
   location = 1.55, 0.8, 0.0  &
   orientation = 254.0546040991d, 90.0000000057d, 90.0000001305d
!
marker create  &
   marker_name = .Homework.C9.MARKER_24  &
   adams_id = 24  &
   location = 1.2, 0.9, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Homework.C9.MARKER_26  &
   adams_id = 26  &
   location = 1.9, 0.7, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Homework.C9  &
   material_type = .Homework.steel
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .Homework.C9.LINK_19  &
   i_marker = .Homework.C9.MARKER_7  &
   j_marker = .Homework.C9.MARKER_8  &
   width = 4.0E-02  &
   depth = 2.0E-02
!
part attributes  &
   part_name = .Homework.C9  &
   color = GREEN  &
   name_visibility = off
!
!------------------------------------- C4 -------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
part create rigid_body name_and_position  &
   part_name = .Homework.C4  &
   adams_id = 8  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.C4
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Homework.C4.MARKER_9  &
   adams_id = 9  &
   location = 0.0, 0.0, 0.0  &
   orientation = 153.4349488229d, 90.0d, 180.0d
!
marker create  &
   marker_name = .Homework.C4.cm  &
   adams_id = 55  &
   location = 5.0E-02, 0.1, 0.0  &
   orientation = 333.4349488229d, 90.0d, 0.0d
!
marker create  &
   marker_name = .Homework.C4.MARKER_28  &
   adams_id = 28  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Homework.C4.MARKER_36  &
   adams_id = 36  &
   location = 4.9999999989E-02, 0.1, 0.0  &
   orientation = 153.4349488229d, 90.0d, 180.0d
!
part create rigid_body mass_properties  &
   part_name = .Homework.C4  &
   mass = 8.7680927527  &
   center_of_mass_marker = .Homework.C4.cm  &
   ixx = 4.0040956888E-02  &
   iyy = 4.0040956888E-02  &
   izz = 7.0144742022E-03  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape cylinder  &
   cylinder_name = .Homework.C4.CYLINDER_20  &
   adams_id = 20  &
   center_marker = .Homework.C4.MARKER_9  &
   angle_extent = 360.0  &
   length = 0.2236067977  &
   radius = 4.0E-02  &
   side_count_for_body = 20  &
   segment_count_for_ends = 20
!
part attributes  &
   part_name = .Homework.C4  &
   color = CYAN  &
   name_visibility = off
!
!------------------------------------- C3 -------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
part create rigid_body name_and_position  &
   part_name = .Homework.C3  &
   adams_id = 9  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.C3
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Homework.C3.MARKER_10  &
   adams_id = 10  &
   location = 0.2, 0.4, 0.0  &
   orientation = 333.4349488229d, 90.0d, 0.0d
!
marker create  &
   marker_name = .Homework.C3.cm  &
   adams_id = 56  &
   location = 0.15, 0.3, 0.0  &
   orientation = 333.4349488229d, 90.0d, 0.0d
!
marker create  &
   marker_name = .Homework.C3.MARKER_29  &
   adams_id = 29  &
   location = 0.2, 0.4, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Homework.C3.MARKER_35  &
   adams_id = 35  &
   location = 4.9999999989E-02, 0.1, 0.0  &
   orientation = 153.4349488229d, 90.0d, 180.0d
!
part create rigid_body mass_properties  &
   part_name = .Homework.C3  &
   material_type = .Homework.steel
!
! ****** Graphics for current part ******
!
geometry create shape cylinder  &
   cylinder_name = .Homework.C3.CYLINDER_21  &
   adams_id = 21  &
   center_marker = .Homework.C3.MARKER_10  &
   angle_extent = 360.0  &
   length = 0.2236067977  &
   radius = 2.0E-02  &
   side_count_for_body = 20  &
   segment_count_for_ends = 20
!
part attributes  &
   part_name = .Homework.C3  &
   color = MAGENTA  &
   name_visibility = off
!
!------------------------------------- C6 -------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
part create rigid_body name_and_position  &
   part_name = .Homework.C6  &
   adams_id = 10  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.C6
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Homework.C6.MARKER_11  &
   adams_id = 11  &
   location = 0.0, 0.4, 0.0  &
   orientation = 108.4349488229d, 90.0d, 180.0d
!
marker create  &
   marker_name = .Homework.C6.cm  &
   adams_id = 57  &
   location = 0.15, 0.45, 0.0  &
   orientation = 288.4349488229d, 90.0d, 90.0d
!
marker create  &
   marker_name = .Homework.C6.MARKER_33  &
   adams_id = 33  &
   location = 0.0, 0.4, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Homework.C6.MARKER_39  &
   adams_id = 39  &
   location = 0.15, 0.45, 0.0  &
   orientation = 108.4349488229d, 90.0d, 180.0d
!
part create rigid_body mass_properties  &
   part_name = .Homework.C6  &
   material_type = .Homework.steel
!
! ****** Graphics for current part ******
!
geometry create shape cylinder  &
   cylinder_name = .Homework.C6.CYLINDER_22  &
   adams_id = 22  &
   center_marker = .Homework.C6.MARKER_11  &
   angle_extent = 360.0  &
   length = 0.316227766  &
   radius = 4.0E-02  &
   side_count_for_body = 20  &
   segment_count_for_ends = 20
!
part attributes  &
   part_name = .Homework.C6  &
   color = RED  &
   name_visibility = off
!
!------------------------------------- C5 -------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
part create rigid_body name_and_position  &
   part_name = .Homework.C5  &
   adams_id = 11  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.C5
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Homework.C5.MARKER_12  &
   adams_id = 12  &
   location = 0.6, 0.6, 0.0  &
   orientation = 288.4349488229d, 90.0d, 0.0d
!
marker create  &
   marker_name = .Homework.C5.cm  &
   adams_id = 58  &
   location = 0.45, 0.55, 0.0  &
   orientation = 108.4349488229d, 90.0d, 0.0d
!
marker create  &
   marker_name = .Homework.C5.MARKER_31  &
   adams_id = 31  &
   location = 0.6, 0.6, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Homework.C5.MARKER_40  &
   adams_id = 40  &
   location = 0.15, 0.45, 0.0  &
   orientation = 108.4349488229d, 90.0d, 180.0d
!
part create rigid_body mass_properties  &
   part_name = .Homework.C5  &
   material_type = .Homework.steel
!
! ****** Graphics for current part ******
!
geometry create shape cylinder  &
   cylinder_name = .Homework.C5.CYLINDER_23  &
   adams_id = 23  &
   center_marker = .Homework.C5.MARKER_12  &
   angle_extent = 360.0  &
   length = 0.316227766  &
   radius = 2.0E-02  &
   side_count_for_body = 20  &
   segment_count_for_ends = 20
!
part attributes  &
   part_name = .Homework.C5  &
   color = GREEN  &
   name_visibility = off
!
!----------------------------------- Joints -----------------------------------!
!
!
constraint create joint revolute  &
   joint_name = .Homework.JOINT_1  &
   adams_id = 1  &
   i_marker_name = .Homework.C1.MARKER_13  &
   j_marker_name = .Homework.C7.MARKER_14
!
constraint attributes  &
   constraint_name = .Homework.JOINT_1  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .Homework.JOINT_2  &
   adams_id = 2  &
   i_marker_name = .Homework.C10.MARKER_15  &
   j_marker_name = .Homework.C7.MARKER_16
!
constraint attributes  &
   constraint_name = .Homework.JOINT_2  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .Homework.JOINT_3  &
   adams_id = 3  &
   i_marker_name = .Homework.C7.MARKER_17  &
   j_marker_name = .Homework.C8.MARKER_18
!
constraint attributes  &
   constraint_name = .Homework.JOINT_3  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .Homework.JOINT_4  &
   adams_id = 4  &
   i_marker_name = .Homework.C1.MARKER_19  &
   j_marker_name = .Homework.C2.MARKER_20
!
constraint attributes  &
   constraint_name = .Homework.JOINT_4  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .Homework.JOINT_5  &
   adams_id = 5  &
   i_marker_name = .Homework.C8.MARKER_21  &
   j_marker_name = .Homework.C2.MARKER_22
!
constraint attributes  &
   constraint_name = .Homework.JOINT_5  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .Homework.JOINT_6  &
   adams_id = 6  &
   i_marker_name = .Homework.C8.MARKER_23  &
   j_marker_name = .Homework.C9.MARKER_24
!
constraint attributes  &
   constraint_name = .Homework.JOINT_6  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .Homework.JOINT_7  &
   adams_id = 7  &
   i_marker_name = .Homework.C10.MARKER_25  &
   j_marker_name = .Homework.C9.MARKER_26
!
constraint attributes  &
   constraint_name = .Homework.JOINT_7  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .Homework.JOINT_8  &
   adams_id = 8  &
   i_marker_name = .Homework.ground.MARKER_27  &
   j_marker_name = .Homework.C4.MARKER_28
!
constraint attributes  &
   constraint_name = .Homework.JOINT_8  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .Homework.JOINT_9  &
   adams_id = 9  &
   i_marker_name = .Homework.C3.MARKER_29  &
   j_marker_name = .Homework.C1.MARKER_30
!
constraint attributes  &
   constraint_name = .Homework.JOINT_9  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .Homework.JOINT_10  &
   adams_id = 10  &
   i_marker_name = .Homework.C5.MARKER_31  &
   j_marker_name = .Homework.C8.MARKER_32
!
constraint attributes  &
   constraint_name = .Homework.JOINT_10  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .Homework.JOINT_11  &
   adams_id = 11  &
   i_marker_name = .Homework.C6.MARKER_33  &
   j_marker_name = .Homework.ground.MARKER_34
!
constraint attributes  &
   constraint_name = .Homework.JOINT_11  &
   name_visibility = off
!
constraint create joint translational  &
   joint_name = .Homework.JOINT_12  &
   adams_id = 12  &
   i_marker_name = .Homework.C3.MARKER_35  &
   j_marker_name = .Homework.C4.MARKER_36
!
constraint attributes  &
   constraint_name = .Homework.JOINT_12  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .Homework.JOINT_15  &
   adams_id = 15  &
   i_marker_name = .Homework.ground.MARKER_59  &
   j_marker_name = .Homework.C1.MARKER_60
!
constraint attributes  &
   constraint_name = .Homework.JOINT_15  &
   name_visibility = off
!
constraint create joint translational  &
   joint_name = .Homework.JOINT_14  &
   adams_id = 14  &
   i_marker_name = .Homework.C6.MARKER_39  &
   j_marker_name = .Homework.C5.MARKER_40
!
constraint attributes  &
   constraint_name = .Homework.JOINT_14  &
   name_visibility = off
!
!----------------------------------- Forces -----------------------------------!
!
!
!----------------------------- Simulation Scripts -----------------------------!
!
!
simulation script create  &
   sim_script_name = .Homework.Last_Sim  &
   commands =   &
              "simulation single_run transient type=auto_select initial_static=no end_time=5.0 number_of_steps=100 model_name=.Homework"
!
!---------------------------------- Motions -----------------------------------!
!
!
constraint create motion_generator  &
   motion_name = .Homework.MOTION_1  &
   adams_id = 1  &
   type_of_freedom = translational  &
   joint_name = .Homework.JOINT_12  &
   function = ""
!
constraint attributes  &
   constraint_name = .Homework.MOTION_1  &
   name_visibility = off
!
constraint create motion_generator  &
   motion_name = .Homework.MOTION_2  &
   adams_id = 2  &
   type_of_freedom = translational  &
   joint_name = .Homework.JOINT_14  &
   function = ""
!
constraint attributes  &
   constraint_name = .Homework.MOTION_2  &
   name_visibility = off
!
!---------------------------------- Accgrav -----------------------------------!
!
!
force create body gravitational  &
   gravity_field_name = gravity  &
   x_component_gravity = 0.0  &
   y_component_gravity = -9.80665  &
   z_component_gravity = 0.0
!
!----------------------------- Analysis settings ------------------------------!
!
!
!---------------------------- Function definitions ----------------------------!
!
!
constraint modify motion_generator  &
   motion_name = .Homework.MOTION_1  &
   function = "-0.05*sin(1.5*time)"
!
constraint modify motion_generator  &
   motion_name = .Homework.MOTION_2  &
   function = "0.05*sin(1.5*time)"
!
!--------------------------- Expression definitions ---------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = ground
!
marker modify  &
   marker_name = .Homework.ground.MARKER_27  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Homework.ground.A))
!
marker modify  &
   marker_name = .Homework.ground.MARKER_34  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Homework.ground.B))
!
marker modify  &
   marker_name = .Homework.ground.MARKER_59  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Homework.ground.E))
!
material modify  &
   material_name = .Homework.steel  &
   density = (7801.0(kg/meter**3))  &
   youngs_modulus = (2.07E+11(Newton/meter**2))
!
marker modify  &
   marker_name = .Homework.C1.MARKER_1  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Homework.ground.D))  &
   relative_to = .Homework.C1
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
marker modify  &
   marker_name = .Homework.C1.MARKER_13  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Homework.ground.F))  &
   relative_to = .Homework.C1
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
marker modify  &
   marker_name = .Homework.C1.MARKER_19  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Homework.ground.G))  &
   relative_to = .Homework.C1
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
marker modify  &
   marker_name = .Homework.C1.MARKER_30  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Homework.ground.D))  &
   relative_to = .Homework.C1
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
marker modify  &
   marker_name = .Homework.C1.MARKER_60  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Homework.ground.E))  &
   relative_to = .Homework.C1
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
geometry modify shape extrusion  &
   extrusion_name = .Homework.C1.EXTRUSION_14  &
   length_along_z_axis = (5.0cm)  &
   relative_to = .Homework.C1
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
marker modify  &
   marker_name = .Homework.C7.MARKER_2  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Homework.ground.F))  &
   relative_to = .Homework.C7
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
marker modify  &
   marker_name = .Homework.C7.MARKER_14  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Homework.ground.F))  &
   relative_to = .Homework.C7
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
marker modify  &
   marker_name = .Homework.C7.MARKER_16  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Homework.ground.L))  &
   relative_to = .Homework.C7
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
marker modify  &
   marker_name = .Homework.C7.MARKER_17  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Homework.ground.I))  &
   relative_to = .Homework.C7
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
geometry modify shape extrusion  &
   extrusion_name = .Homework.C7.EXTRUSION_15  &
   length_along_z_axis = (5.0cm)  &
   relative_to = .Homework.C7
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
marker modify  &
   marker_name = .Homework.C10.MARKER_3  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Homework.ground.L))  &
   relative_to = .Homework.C10
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
marker modify  &
   marker_name = .Homework.C10.MARKER_15  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Homework.ground.L))  &
   relative_to = .Homework.C10
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
marker modify  &
   marker_name = .Homework.C10.MARKER_25  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Homework.ground.N))  &
   relative_to = .Homework.C10
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
geometry modify shape extrusion  &
   extrusion_name = .Homework.C10.EXTRUSION_16  &
   length_along_z_axis = (5.0cm)  &
   relative_to = .Homework.C10
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
marker modify  &
   marker_name = .Homework.C8.MARKER_4  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Homework.ground.H))  &
   relative_to = .Homework.C8
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
marker modify  &
   marker_name = .Homework.C8.MARKER_18  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Homework.ground.I))  &
   relative_to = .Homework.C8
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
marker modify  &
   marker_name = .Homework.C8.MARKER_21  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Homework.ground.J))  &
   relative_to = .Homework.C8
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
marker modify  &
   marker_name = .Homework.C8.MARKER_23  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Homework.ground.K))  &
   relative_to = .Homework.C8
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
marker modify  &
   marker_name = .Homework.C8.MARKER_32  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Homework.ground.H))  &
   relative_to = .Homework.C8
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
geometry modify shape extrusion  &
   extrusion_name = .Homework.C8.EXTRUSION_17  &
   length_along_z_axis = (5.0cm)  &
   relative_to = .Homework.C8
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
marker modify  &
   marker_name = .Homework.C2.MARKER_5  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Homework.ground.G))  &
   orientation =   &
      (ORI_ALONG_AXIS(.Homework.ground.G, .Homework.ground.J, "X"))  &
   relative_to = .Homework.C2
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
marker modify  &
   marker_name = .Homework.C2.MARKER_6  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Homework.ground.J))  &
   orientation =   &
      (ORI_ALONG_AXIS(.Homework.ground.G, .Homework.ground.J, "X"))  &
   relative_to = .Homework.C2
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
marker modify  &
   marker_name = .Homework.C2.MARKER_20  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Homework.ground.G))  &
   relative_to = .Homework.C2
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
marker modify  &
   marker_name = .Homework.C2.MARKER_22  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Homework.ground.J))  &
   relative_to = .Homework.C2
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
geometry modify shape link  &
   link_name = .Homework.C2.LINK_18  &
   width = (4.0cm)  &
   depth = (2.0cm)
!
marker modify  &
   marker_name = .Homework.C9.MARKER_7  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Homework.ground.K))  &
   orientation =   &
      (ORI_ALONG_AXIS(.Homework.ground.K, .Homework.ground.N, "X"))  &
   relative_to = .Homework.C9
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
marker modify  &
   marker_name = .Homework.C9.MARKER_8  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Homework.ground.N))  &
   orientation =   &
      (ORI_ALONG_AXIS(.Homework.ground.K, .Homework.ground.N, "X"))  &
   relative_to = .Homework.C9
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
marker modify  &
   marker_name = .Homework.C9.MARKER_24  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Homework.ground.K))  &
   relative_to = .Homework.C9
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
marker modify  &
   marker_name = .Homework.C9.MARKER_26  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Homework.ground.N))  &
   relative_to = .Homework.C9
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
geometry modify shape link  &
   link_name = .Homework.C9.LINK_19  &
   width = (4.0cm)  &
   depth = (2.0cm)
!
marker modify  &
   marker_name = .Homework.C4.MARKER_9  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Homework.ground.A))  &
   relative_to = .Homework.C4
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
marker modify  &
   marker_name = .Homework.C4.MARKER_28  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Homework.ground.A))  &
   relative_to = .Homework.C4
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
geometry modify shape cylinder  &
   cylinder_name = .Homework.C4.CYLINDER_20  &
   length = (0.2236067977meter)  &
   radius = (4cm)
!
marker modify  &
   marker_name = .Homework.C3.MARKER_10  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Homework.ground.D))  &
   relative_to = .Homework.C3
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
marker modify  &
   marker_name = .Homework.C3.MARKER_29  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Homework.ground.D))  &
   relative_to = .Homework.C3
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
geometry modify shape cylinder  &
   cylinder_name = .Homework.C3.CYLINDER_21  &
   length = (0.2236067977meter)  &
   radius = (2cm)
!
marker modify  &
   marker_name = .Homework.C6.MARKER_11  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Homework.ground.B))  &
   relative_to = .Homework.C6
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
marker modify  &
   marker_name = .Homework.C6.MARKER_33  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Homework.ground.B))  &
   relative_to = .Homework.C6
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
geometry modify shape cylinder  &
   cylinder_name = .Homework.C6.CYLINDER_22  &
   length = (0.316227766meter)  &
   radius = (4.0cm)
!
marker modify  &
   marker_name = .Homework.C5.MARKER_12  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Homework.ground.H))  &
   relative_to = .Homework.C5
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
marker modify  &
   marker_name = .Homework.C5.MARKER_31  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Homework.ground.H))  &
   relative_to = .Homework.C5
!
defaults coordinate_system  &
   default_coordinate_system = .Homework.ground
!
geometry modify shape cylinder  &
   cylinder_name = .Homework.C5.CYLINDER_23  &
   length = (0.316227766meter)  &
   radius = (2.0cm)
!
model display  &
   model_name = Homework
