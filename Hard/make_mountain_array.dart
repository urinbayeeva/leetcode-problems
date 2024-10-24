// You may recall that an array arr is a mountain array if and only if:

// arr.length >= 3
// There exists some index i (0-indexed) with 0 < i < arr.length - 1 such that:
// arr[0] < arr[1] < ... < arr[i - 1] < arr[i]
// arr[i] > arr[i + 1] > ... > arr[arr.length - 1]
// Given an integer array nums​​​, return the minimum number of elements to remove to make nums​​​ a mountain array.

// Example 1:

// Input: nums = [1,3,1]
// Output: 0
// Explanation: The array itself is a mountain array so we do not need to remove any elements.
// Example 2:

// Input: nums = [2,1,1,5,6,2,3,1]
// Output: 3
// Explanation: One solution is to remove the elements at indices 0, 1, and 5, making the array nums = [1,5,6,3,1].

import 'dart:math';

int minimumMountainRemovals(List<int> nums) {
  int n = nums.length;

  if (n < 3) return 0;

  List<int> left = List<int>.filled(n, 1);
  List<int> right = List<int>.filled(n, 1);

  for (int i = 1; i < n; i++) {
    for (int j = 0; j < i; j++) {
      if (nums[i] > nums[j]) {
        left[i] = max(left[i], left[j] + 1);
      }
    }
  }

  for (int i = n - 2; i >= 0; i--) {
    for (int j = n - 1; j > i; j--) {
      if (nums[i] > nums[j]) {
        right[i] = max(right[i], right[j] + 1);
      }
    }
  }

  int maxMountainLength = 0;
  for (int i = 1; i < n - 1; i++) {
    if (left[i] > 1 && right[i] > 1) {
      maxMountainLength = max(maxMountainLength, left[i] + right[i] - 1);
    }
  }
  return n - maxMountainLength;
}

void main() {
  List<int> nums1 = [1, 3, 1];
  List<int> nums2 = [2, 1, 1, 5, 6, 2, 3, 1];

  print(minimumMountainRemovals(nums1));
  print(minimumMountainRemovals(nums2));
}
