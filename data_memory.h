/*
 * File:   data_memory.h
 * Author: Yongkang Li
 * Created on December 7, 2023
 */

#ifndef DATA_MEMORY_H
#define DATA_MEMORY_H

class DataMemory
{
public:
    static int data[26];
    static int get_val(int var_idx)
    {
        return data[var_idx];
    }
};

#endif