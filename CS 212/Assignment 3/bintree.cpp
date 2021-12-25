// FILE: bintree.cpp
// IMPLEMENTS: The binary_tree node class (see bintree.h for documentation). 
#include <cassert>    // Provides assert
#include <cstdlib>   // Provides NULL, std::size_t
#include <iomanip>    // Provides std::setw
#include <iostream>   // Provides std::cout
#include "bintree.h"

namespace main_savitch_10
{
    void tree_clear(binary_tree_node*& root_ptr)
        // Library facilities used: cstdlib
    {
        if (root_ptr != NULL)
        {
            tree_clear(root_ptr->left());
            tree_clear(root_ptr->right());
            delete root_ptr;
            root_ptr = NULL;
        }
    }

    binary_tree_node* tree_copy(const binary_tree_node* root_ptr)
        // Library facilities used: cstdlib
    {
        binary_tree_node* l_ptr;
        binary_tree_node* r_ptr;

        if (root_ptr == NULL)
            return NULL;
        else
        {
            l_ptr = tree_copy(root_ptr->left());
            r_ptr = tree_copy(root_ptr->right());
            return
                new binary_tree_node(root_ptr->data(), l_ptr, r_ptr);
        }
    }
}