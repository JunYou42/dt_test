;; Auto-generated. Do not edit!


(when (boundp 'dt_test_pkg::Wind)
  (if (not (find-package "DT_TEST_PKG"))
    (make-package "DT_TEST_PKG"))
  (shadow 'Wind (find-package "DT_TEST_PKG")))
(unless (find-package "DT_TEST_PKG::WIND")
  (make-package "DT_TEST_PKG::WIND"))

(in-package "ROS")
;;//! \htmlinclude Wind.msg.html


(defclass dt_test_pkg::Wind
  :super ros::object
  :slots (_wind_x _wind_y _wind_z ))

(defmethod dt_test_pkg::Wind
  (:init
   (&key
    ((:wind_x __wind_x) 0.0)
    ((:wind_y __wind_y) 0.0)
    ((:wind_z __wind_z) 0.0)
    )
   (send-super :init)
   (setq _wind_x (float __wind_x))
   (setq _wind_y (float __wind_y))
   (setq _wind_z (float __wind_z))
   self)
  (:wind_x
   (&optional __wind_x)
   (if __wind_x (setq _wind_x __wind_x)) _wind_x)
  (:wind_y
   (&optional __wind_y)
   (if __wind_y (setq _wind_y __wind_y)) _wind_y)
  (:wind_z
   (&optional __wind_z)
   (if __wind_z (setq _wind_z __wind_z)) _wind_z)
  (:serialization-length
   ()
   (+
    ;; float64 _wind_x
    8
    ;; float64 _wind_y
    8
    ;; float64 _wind_z
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _wind_x
       (sys::poke _wind_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _wind_y
       (sys::poke _wind_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _wind_z
       (sys::poke _wind_z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _wind_x
     (setq _wind_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _wind_y
     (setq _wind_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _wind_z
     (setq _wind_z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get dt_test_pkg::Wind :md5sum-) "8f26644c548e30cf22288c73078d1351")
(setf (get dt_test_pkg::Wind :datatype-) "dt_test_pkg/Wind")
(setf (get dt_test_pkg::Wind :definition-)
      "float64 wind_x
float64 wind_y
float64 wind_z

")



(provide :dt_test_pkg/Wind "8f26644c548e30cf22288c73078d1351")


