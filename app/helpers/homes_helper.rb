module HomesHelper

  def accept_kids?(rule)
    if rule.accept_kids == true
       "お子様に安全とは言えます (7歳未満)"
    else
       "お子様には安全とは言えない/不向き (7歳未満)"
    end
  end

  def accept_babies?(rule)
    if rule.accept_babies == true
       "乳幼児に安全と言えます (2歳未満)"
    else
       "乳幼児に安全とは言えない/不向き (2歳未満)"
    end
  end

  def accept_event_party?(rule)
    if rule.accept_event_party == true
      "パーティー&イベント大歓迎！"
    else
      "パーティー&イベントお断り"
    end
  end

  def accept_smoking?(rule)
    if rule.accept_smoking == true
       "喫煙可能"
    else
       "禁煙"
    end
  end

  def accept_pet?(rule)
    if rule.accept_pet == true
       "ペット同伴可能"
    else
       "ペット同伴不可能"
    end
  end

  def single_bed?(bed)
    if bed.single_bed >= 1
      "シングルベッド #{bed.single_bed}台"
    end
  end

  def double_bed?(bed)
    if bed.double_bed >= 1
      "ダブルベッド #{bed.double_bed}台"
    end
  end

  def queen_bed?(bed)
    if bed.queen_bed >= 1
      "クイーンベッド #{bed.queen_bed}台"
    end
  end

  def sofa_bed?(bed)
    if bed.sofa_bed >= 1
      "ソファーベッド #{bed.sofa_bed}台"
    end
  end

  def level_of_cancel_policy(cancel)
    case cancel.strict_level
    when  "easy"
      "かなり適当"
    when  "normal"
      "普通"
    when  "strict"
      "厳格"
    when  "very_strict"
      "かなり厳格"
    end
  end
end
