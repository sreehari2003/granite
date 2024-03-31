import React, { useState } from "react";
import { Container, PageTitle } from "components/commons";
import Form from "./Form";
import tasksApi from "apis/tasks";

const Create = ({ history }) => {
  const [title, setTitle] = useState("");
  const [loading, setLoading] = useState(false);

  const handleSubmit = async event => {
    event.preventDefault();
    setLoading(true);
    try {
      await tasksApi.create({ task: { title } });
      setLoading(false);
      history.push("/dashboard");
    } catch (error) {
      logger.error(error);
      setLoading(false);
    }
  };

  return (
    <Container>
      <div className="flex flex-col gap-y-8">
        <PageTitle title="Add new task" />
        <Form
          handleSubmit={handleSubmit}
          loading={loading}
          setTitle={setTitle}
        />
      </div>
    </Container>
  );
};

export default Create;