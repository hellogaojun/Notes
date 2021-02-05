package com.gj;

public abstract class AbstractList<E> implements List<E> {
    /**
     * 元素数量
     */
    protected int size;

    @Override
    public int size() {
        return size;
    }

    @Override
    public boolean isEmpty() {
        return size == 0;
    }

    @Override
    public boolean contains(E element) {
        return indexOf(element) != ELEMENT_NOT_FOUND;
    }

    @Override
    public void add(E element) {
        add(size, element);
    }

    /**
     * 越界检查
     * @param index
     */
    protected void rangeCheck(int index) {
        if(index < 0 | index >= size) {
            throw new IndexOutOfBoundsException("Index:" + index + ", Size:" + size);
        }
    }

    /**
     * add方法的越界检查
     */
    protected void rangeCheckForAdd(int index) {
        if(index < 0 | index > size) {
            throw new IndexOutOfBoundsException("Index:" + index + ", Size:" + size);
        }
    }
}