import axios from "axios";

const fetch = () => axios.get("/tasks");
const show = slug => axios.get(`/tasks/${slug}`);

const create = payload =>
  axios.post("/tasks", {
    tasks: payload,
  });

const update = ({ slug, payload }) =>
  axios.put(`/tasks/${slug}`, {
    task: payload,
  });

const destroy = slug => axios.delete(`/tasks/${slug}`);

const tasksApi = {
  fetch,
  create,
  show,
  update,
  destroy,
};

export default tasksApi;
