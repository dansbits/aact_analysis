module Aact
  class FullDateTransformer

    DATES_TO_TRANSFORM = [
        { table: 'clinical_study', column: 'lastchanged_date' },
        { table: 'clinical_study', column: 'firstreceived_date' },
        { table: 'clinical_study', column: 'firstreceived_results_date' }
    ]

    def self.transform
      DATES_TO_TRANSFORM.each do |date_col|
        table = date_col[:table]
        column = date_col[:column]
        p "transforming date: #{table}.#{column}"
        DB.run "alter table #{table} add column #{column}_temp date;"
        self.assign_date(table, column)
        DB.run "alter table #{table} drop column #{column}"
        DB.run "alter table #{table} change #{column}_temp #{column} date;"
      end
    end

    private

    def self.assign_date(table, column)
      DB.run(
          "update #{table}
          set #{column}_temp = STR_TO_DATE( #{column}, '%M %d, %Y')
          where #{column} is not null and #{column} != ''"
      )
    end

  end
end
# STR_TO_DATE(firstreceived_date, '%M %d, %Y')