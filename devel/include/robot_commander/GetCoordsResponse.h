// Generated by gencpp from file robot_commander/GetCoordsResponse.msg
// DO NOT EDIT!


#ifndef ROBOT_COMMANDER_MESSAGE_GETCOORDSRESPONSE_H
#define ROBOT_COMMANDER_MESSAGE_GETCOORDSRESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace robot_commander
{
template <class ContainerAllocator>
struct GetCoordsResponse_
{
  typedef GetCoordsResponse_<ContainerAllocator> Type;

  GetCoordsResponse_()
    : coords_array()
    , poke_further_coords_array()  {
    }
  GetCoordsResponse_(const ContainerAllocator& _alloc)
    : coords_array(_alloc)
    , poke_further_coords_array(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<float, typename ContainerAllocator::template rebind<float>::other >  _coords_array_type;
  _coords_array_type coords_array;

   typedef std::vector<float, typename ContainerAllocator::template rebind<float>::other >  _poke_further_coords_array_type;
  _poke_further_coords_array_type poke_further_coords_array;





  typedef boost::shared_ptr< ::robot_commander::GetCoordsResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::robot_commander::GetCoordsResponse_<ContainerAllocator> const> ConstPtr;

}; // struct GetCoordsResponse_

typedef ::robot_commander::GetCoordsResponse_<std::allocator<void> > GetCoordsResponse;

typedef boost::shared_ptr< ::robot_commander::GetCoordsResponse > GetCoordsResponsePtr;
typedef boost::shared_ptr< ::robot_commander::GetCoordsResponse const> GetCoordsResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::robot_commander::GetCoordsResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::robot_commander::GetCoordsResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace robot_commander

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::robot_commander::GetCoordsResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robot_commander::GetCoordsResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robot_commander::GetCoordsResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robot_commander::GetCoordsResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robot_commander::GetCoordsResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robot_commander::GetCoordsResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::robot_commander::GetCoordsResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "6bdc879a37dd766a62c0bf088cdd4729";
  }

  static const char* value(const ::robot_commander::GetCoordsResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x6bdc879a37dd766aULL;
  static const uint64_t static_value2 = 0x62c0bf088cdd4729ULL;
};

template<class ContainerAllocator>
struct DataType< ::robot_commander::GetCoordsResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "robot_commander/GetCoordsResponse";
  }

  static const char* value(const ::robot_commander::GetCoordsResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::robot_commander::GetCoordsResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32[] coords_array\n\
float32[] poke_further_coords_array\n\
\n\
";
  }

  static const char* value(const ::robot_commander::GetCoordsResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::robot_commander::GetCoordsResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.coords_array);
      stream.next(m.poke_further_coords_array);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GetCoordsResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::robot_commander::GetCoordsResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::robot_commander::GetCoordsResponse_<ContainerAllocator>& v)
  {
    s << indent << "coords_array[]" << std::endl;
    for (size_t i = 0; i < v.coords_array.size(); ++i)
    {
      s << indent << "  coords_array[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.coords_array[i]);
    }
    s << indent << "poke_further_coords_array[]" << std::endl;
    for (size_t i = 0; i < v.poke_further_coords_array.size(); ++i)
    {
      s << indent << "  poke_further_coords_array[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.poke_further_coords_array[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROBOT_COMMANDER_MESSAGE_GETCOORDSRESPONSE_H
