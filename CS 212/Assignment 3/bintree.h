#ifndef BINTREE_H
#define BINTREE_H
#include <cstdlib>  // Provides NULL and size_t

namespace main_savitch_10
{
	class binary_tree_node
	{
	public:
		// TYPEDEF
		typedef int value_type;
		// CONSTRUCTOR
		binary_tree_node(
			const int& init_data = int(),
			binary_tree_node* init_left = NULL,
			binary_tree_node* init_right = NULL
		)
		{
			data_field = init_data;
			left_field = init_left;
			right_field = init_right;
		}
		// MODIFICATION MEMBER FUNCTIONS
		int& data() { return data_field; }
		binary_tree_node*& left() { return left_field; }
		binary_tree_node*& right() { return right_field; }
		void set_data(const int& new_data) { data_field = new_data; }
		void set_left(binary_tree_node* new_left) { left_field = new_left; }
		void set_right(binary_tree_node* new_right) { right_field = new_right; }
		// CONST MEMBER FUNCTIONS
		const int& data() const { return data_field; }
		const binary_tree_node* left() const { return left_field; }
		const binary_tree_node* right() const { return right_field; }
		bool is_leaf() const
		{
			return (left_field == NULL) && (right_field == NULL);
		}
	private:
		int data_field;
		binary_tree_node* left_field;
		binary_tree_node* right_field;
	};
	void tree_clear(binary_tree_node*& root_ptr);

	binary_tree_node* tree_copy(const binary_tree_node* root_ptr);

}

#endif