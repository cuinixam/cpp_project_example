#include <gtest/gtest.h>
#include <module1.h>

struct Module1Test : public ::testing::Test {
  virtual void SetUp() override {

  }

  virtual void TearDown() override {}
};

TEST_F(Module1Test, CheckNames) {
  Module1 module1;
  EXPECT_EQ(module1.name(), "I am Module1!");
}

TEST_F(Module1Test, Dude) {
  Module1 module1;
  EXPECT_EQ(module1.name(), "Hmm!");
}