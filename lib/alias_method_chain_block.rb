class Object
  if method_defined? :alias_method_chain
    # alias method chain the :alias_method_chain method.  meta.
    # todo: complete me
  else
    def alias_method_chain(target_class, target, feature, feature_proc, &block)
      target_class.send :alias_method, "#{target}_without_#{feature}", target
      target_class.send :define_method, target, &feature_proc

      block.call

      target_class.send :remove_method, target
      target_class.send :alias_method, target, "#{target}_without_#{feature}"
    end
  end
end
