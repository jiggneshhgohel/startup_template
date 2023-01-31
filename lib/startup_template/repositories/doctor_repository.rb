# frozen_string_literal: true

module StartupTemplate
  module Repositories
    class DoctorRepository < Repository[:doctors]

      def find_all
        doctors.to_a
      end

      def find_by_id(id)
        find_by_pk(id).one
      end

      def create(doctor_attrs_hash)
        save_data(
          relation_obj: doctors,
          command: :create,
          doctor_attrs_hash: doctor_attrs_hash,
          transformation_func: :add_timestamps
        )
      end

      def update(id, doctor_attrs_hash)
        relation = find_by_pk(id)

        save_data(
          relation_obj: relation,
          command: :update,
          doctor_attrs_hash: doctor_attrs_hash,
          transformation_func: :touch
        )
      end

      def remove(id)
        relation = find_by_pk(id)

        changeset = relation.changeset(:delete)

        _commit_changeset(changeset)
      end

      private

      def _commit_changeset(changeset)
        changeset.commit
      end

      # Note: This should return an instance of `StartupTemplate::Persistence::Relations::Doctors`
      def find_by_pk(id)
        doctors.by_pk(id)
      end

      def save_data(relation_obj:, command:, doctor_attrs_hash:, transformation_func: nil)
        changeset = relation_obj.changeset(command, doctor_attrs_hash)

        unless transformation_func.nil?
          changeset = changeset.map(transformation_func)
        end

        _commit_changeset(changeset)
      end
    end
  end
end
