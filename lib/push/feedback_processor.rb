module Push
  class FeedbackProcessor
    def self.process(feedback)
      if feedback.instance_of? Push::FeedbackGcm
        if feedback.follow_up == 'delete'
          Push::Daemon.logger.info("[FeedbackProcessor] GCM follow_up:delete")
          # TODO: delete gcm device

        elsif feedback.follow_up == 'update'
          # TODO: update gcm device
          # device = feedback.update_to
          Push::Daemon.logger.info("[FeedbackProcessor] GCM follow_up:update")

        end
      #elsif feedback.instance_of? Push::FeedbackC2dm
      #  if feedback.follow_up == 'delete'
      #    # TODO: delete c2dm device
      #
      #  end
      #elsif feedback.instance_of? Push::FeedbackApns
      #  if feedback.follow_up == 'delete'
      #    # TODO: delete apns device
      #
      #  end
      else
        Push::Daemon.logger.info("[FeedbackProcessor] Unknown feedback type")
      end
    end
  end
end