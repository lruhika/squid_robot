// Generated by gencpp from file robot_commander/GetCoords.msg
// DO NOT EDIT!


#ifndef ROBOT_COMMANDER_MESSAGE_GETCOORDS_H
#define ROBOT_COMMANDER_MESSAGE_GETCOORDS_H

#include <ros/service_traits.h>


#include <robot_commander/GetCoordsRequest.h>
#include <robot_commander/GetCoordsResponse.h>


namespace robot_commander
{

struct GetCoords
{

typedef GetCoordsRequest Request;
typedef GetCoordsResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct GetCoords
} // namespace robot_commander


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::robot_commander::GetCoords > {
  static const char* value()
  {
    return "5fda44d5b45a78ce5dc124b63492459c";
  }

  static const char* value(const ::robot_commander::GetCoords&) { return value(); }
};

template<>
struct DataType< ::robot_commander::GetCoords > {
  static const char* value()
  {
    return "robot_commander/GetCoords";
  }

  static const char* value(const ::robot_commander::GetCoords&) { return value(); }
};


// service_traits::MD5Sum< ::robot_commander::GetCoordsRequest> should match 
// service_traits::MD5Sum< ::robot_commander::GetCoords > 
template<>
struct MD5Sum< ::robot_commander::GetCoordsRequest>
{
  static const char* value()
  {
    return MD5Sum< ::robot_commander::GetCoords >::value();
  }
  static const char* value(const ::robot_commander::GetCoordsRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::robot_commander::GetCoordsRequest> should match 
// service_traits::DataType< ::robot_commander::GetCoords > 
template<>
struct DataType< ::robot_commander::GetCoordsRequest>
{
  static const char* value()
  {
    return DataType< ::robot_commander::GetCoords >::value();
  }
  static const char* value(const ::robot_commander::GetCoordsRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::robot_commander::GetCoordsResponse> should match 
// service_traits::MD5Sum< ::robot_commander::GetCoords > 
template<>
struct MD5Sum< ::robot_commander::GetCoordsResponse>
{
  static const char* value()
  {
    return MD5Sum< ::robot_commander::GetCoords >::value();
  }
  static const char* value(const ::robot_commander::GetCoordsResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::robot_commander::GetCoordsResponse> should match 
// service_traits::DataType< ::robot_commander::GetCoords > 
template<>
struct DataType< ::robot_commander::GetCoordsResponse>
{
  static const char* value()
  {
    return DataType< ::robot_commander::GetCoords >::value();
  }
  static const char* value(const ::robot_commander::GetCoordsResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // ROBOT_COMMANDER_MESSAGE_GETCOORDS_H
