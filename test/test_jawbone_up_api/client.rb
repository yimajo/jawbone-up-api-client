require './test/minitest_helper'

module TestJawboneUPAPI
  class Client < Minitest::Test
    def setup
      @invalid_token = 'dummy'
      @access_token = ''

    end

    def test_that_it_has_a_version_number
      refute_nil ::JawboneUPAPI::Client::VERSION
    end

    def test_unauthorized
      client = JawboneUPAPI::Client.new(@invalid_token)
      sleeps = client.sleeps

      assert_equal 401, sleeps.meta.code
    end

    def test_sleeps_list
      client = JawboneUPAPI::Client.new(@access_token)
      sleeps = client.sleeps

      refute_nil sleeps.meta
      assert_equal 'OK', sleeps.meta.message
      assert_equal 200, sleeps.meta.code

      refute_nil sleeps.data
      refute_nil sleeps.data.items

      items = sleeps.data.items
      if 0 < items.count
        for item in items do
          refute_nil item.xid
          refute_nil item.date
        end
      end
    end

    def test_sleep_date
      client = JawboneUPAPI::Client.new(@access_token)
      sleeps = client.sleeps('20151207')

      refute_nil sleeps.meta
      assert_equal 'OK', sleeps.meta.message
      assert_equal 200, sleeps.meta.code

      refute_nil sleeps.data
      refute_nil sleeps.data.items

      items = sleeps.data.items
      if 0 < items.count
        for item in items do
          refute_nil item.xid
          refute_nil item.date
        end
      end
    end

    def test_moves_list
      client = JawboneUPAPI::Client.new(@access_token)
      moves = client.moves

      refute_nil moves.meta
      assert_equal 'OK', moves.meta.message
      assert_equal 200, moves.meta.code

      refute_nil moves.data
      refute_nil moves.data.items

      items = moves.data.items
      if 0 < items.count
        for item in items do
          refute_nil item.xid
          refute_nil item.date
          refute_nil item.details.steps
        end
      end
    end

    def test_moves_date
      client = JawboneUPAPI::Client.new(@access_token)
      moves = client.moves('20151207')

      refute_nil moves.meta
      assert_equal 'OK', moves.meta.message
      assert_equal 200, moves.meta.code

      refute_nil moves.data
      refute_nil moves.data.items

      items = moves.data.items
      if 0 < items.count
        for item in items do
          refute_nil item.xid
          refute_nil item.date
          refute_nil item.details.steps
        end
      end
    end
  end
end