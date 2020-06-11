#include <gtest/gtest.h>
#include <module2.h>

struct Module2Test : public ::testing::Test {
  virtual void SetUp() override {

  }

  virtual void TearDown() override {}
};

TEST_F(Module2Test, CheckNames) {
  Module2 module2;
  EXPECT_EQ(module2.name(), "I am Module2!");
}
