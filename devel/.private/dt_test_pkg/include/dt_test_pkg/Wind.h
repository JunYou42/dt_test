// Generated by gencpp from file dt_test_pkg/Wind.msg
// DO NOT EDIT!


#ifndef DT_TEST_PKG_MESSAGE_WIND_H
#define DT_TEST_PKG_MESSAGE_WIND_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace dt_test_pkg
{
template <class ContainerAllocator>
struct Wind_
{
  typedef Wind_<ContainerAllocator> Type;

  Wind_()
    : wind_x(0.0)
    , wind_y(0.0)
    , wind_z(0.0)  {
    }
  Wind_(const ContainerAllocator& _alloc)
    : wind_x(0.0)
    , wind_y(0.0)
    , wind_z(0.0)  {
  (void)_alloc;
    }



   typedef double _wind_x_type;
  _wind_x_type wind_x;

   typedef double _wind_y_type;
  _wind_y_type wind_y;

   typedef double _wind_z_type;
  _wind_z_type wind_z;





  typedef boost::shared_ptr< ::dt_test_pkg::Wind_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::dt_test_pkg::Wind_<ContainerAllocator> const> ConstPtr;

}; // struct Wind_

typedef ::dt_test_pkg::Wind_<std::allocator<void> > Wind;

typedef boost::shared_ptr< ::dt_test_pkg::Wind > WindPtr;
typedef boost::shared_ptr< ::dt_test_pkg::Wind const> WindConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::dt_test_pkg::Wind_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::dt_test_pkg::Wind_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::dt_test_pkg::Wind_<ContainerAllocator1> & lhs, const ::dt_test_pkg::Wind_<ContainerAllocator2> & rhs)
{
  return lhs.wind_x == rhs.wind_x &&
    lhs.wind_y == rhs.wind_y &&
    lhs.wind_z == rhs.wind_z;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::dt_test_pkg::Wind_<ContainerAllocator1> & lhs, const ::dt_test_pkg::Wind_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace dt_test_pkg

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::dt_test_pkg::Wind_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::dt_test_pkg::Wind_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::dt_test_pkg::Wind_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::dt_test_pkg::Wind_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::dt_test_pkg::Wind_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::dt_test_pkg::Wind_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::dt_test_pkg::Wind_<ContainerAllocator> >
{
  static const char* value()
  {
    return "8f26644c548e30cf22288c73078d1351";
  }

  static const char* value(const ::dt_test_pkg::Wind_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x8f26644c548e30cfULL;
  static const uint64_t static_value2 = 0x22288c73078d1351ULL;
};

template<class ContainerAllocator>
struct DataType< ::dt_test_pkg::Wind_<ContainerAllocator> >
{
  static const char* value()
  {
    return "dt_test_pkg/Wind";
  }

  static const char* value(const ::dt_test_pkg::Wind_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::dt_test_pkg::Wind_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 wind_x\n"
"float64 wind_y\n"
"float64 wind_z\n"
;
  }

  static const char* value(const ::dt_test_pkg::Wind_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::dt_test_pkg::Wind_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.wind_x);
      stream.next(m.wind_y);
      stream.next(m.wind_z);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Wind_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::dt_test_pkg::Wind_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::dt_test_pkg::Wind_<ContainerAllocator>& v)
  {
    s << indent << "wind_x: ";
    Printer<double>::stream(s, indent + "  ", v.wind_x);
    s << indent << "wind_y: ";
    Printer<double>::stream(s, indent + "  ", v.wind_y);
    s << indent << "wind_z: ";
    Printer<double>::stream(s, indent + "  ", v.wind_z);
  }
};

} // namespace message_operations
} // namespace ros

#endif // DT_TEST_PKG_MESSAGE_WIND_H
