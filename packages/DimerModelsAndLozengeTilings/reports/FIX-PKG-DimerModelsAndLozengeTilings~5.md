# FIX-PKG-DimerModelsAndLozengeTilings~5

Repair of the one finding of `REV-PKG-DimerModelsAndLozengeTilings~4` (P3). File changed:
`packages/DimerModelsAndLozengeTilings/README.md`, one sentence of target 2.4 (three lines in
place of one). `Suggested.lean`, `sources.toml`, `metadata.toml` and `design/plan.json` are
unchanged.

## F01 (P3) — applied differently

The review is right: 2.4 was the only numbered section naming no source key, while the
aggarwal2023 `cited_for` record lists 2.4. Old: "Thus every domain in Aggarwal's sense is simply
connected here." New: "Thus for every domain in Aggarwal's sense, an induced subgraph with vertex
set `V` whose union of faces `F(Faces(V))` is simply connected (aggarwal2023 lines 338–341), the
region `Faces(V)` of 1.3 is simply connected here."

Why the suggested wording was adjusted: an Aggarwal domain is an induced subgraph (a vertex set),
while `IsSimplyConnectedRegion` is a predicate on sets of faces; the suggested sentence called the
subgraph itself "simply connected here". The new sentence passes through 1.3's `Faces(V)`, which
1.3 already identifies with Aggarwal's induced-subgraph convention (same locator), and whose union
of faces is exactly Aggarwal's `F(R)` (the lattice triangles with all three vertices in `V`).
`sources.toml` is unchanged: its aggarwal2023 record already lists "2.1, 2.4".

Evidence read: aggarwal2023 lines 338–341 define, for an induced subgraph `R`, `V(R)` and `F(R)`
(the union of its faces in `ℝ²`), simple connectivity of `R` through `F(R)`, and a domain as a
simply connected induced subgraph.

Pattern: the other places naming Aggarwal's domains, 1.3 (line 561) and 2.1 (line 678), cite
aggarwal2023 lines 338–341 already; 10.3 points to 2.4 and cites aggarwal2023 Theorem 1.5. A scan
of all 51 numbered sections for the ten manifest keys now finds a key in every section, and every
`cited_for` record agrees with the sections that name its key, in both directions (aggarwal2023,
sheffield2005, kos2006, kenyon2009, okounkov-reshetikhin2003, cohn-kenyon-propp2001, kenyon1997,
gorin2021, thurston1990, georgii2011: no section missing, none extra).

### Adversarial pass on the changed sentence

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| Aggarwal's `F(R)` equals 1.3's `F(Faces(V))` | `V = {(0,0),(1,0),(1,1),(0,1)}`; `V = {(0,0),(1,0)}` | first: Aggarwal's faces are the triangles with all vertices in `V`, `{W(0), B(0)}` = `Faces(V)`, both unions the unit square; second: no triangle, both unions `∅` | agree |
| domain ⇒ `Faces(V)` simply connected (2.4) | unit square above; the hexagon vertex set (7 points); `V = {(0,0),(1,0)}` | square: convex, and `{W(0)} ∪ {B(0)}` by shelling (one shared edge `(0,3)`, opposite vertex `(0,1)` new); hexagon: `Faces(V) = R₆`, shelling of 2.1's last Check; two points: `F = ∅` fails Mathlib's `IsSimplyConnected` (nonempty), so not a domain in this reading and nothing is claimed, matching 2.3's third Check | true |
| no hole from an induced subgraph | `V = V(R_ring)` | `W(0)` has all three vertices in `V`, so `Faces(V) = R_ring ∪ {W(0)}`, the 13 faces meeting `W(0)`: no hole; `R_ring` itself is not of the form `Faces(V)`, consistent with the one-way claim and 2.4's third Check | consistent |

## Checks

- Elaboration: `lake env lean packages/DimerModelsAndLozengeTilings/Suggested.lean`, run from the
  content repository: exit 0; 17 warnings, each `declaration uses sorry`, at lines 115, 168, 184,
  198, 234, 245, 331, 343, 375, 387, 409, 422, 453, 490, 503, 523, 553; no other message.
- Signatures: the scratch copy of `Suggested.lean` with `#check @name` for all 57 declarations,
  elaborated once: exit 0, no error, 57 types printed, 17 `sorry` warnings. `Suggested.lean` is
  unchanged this round, so every elaborated type is the one recorded in the job's signature list;
  nothing changed and no binder was lost.
- Dependency check (`gate --depcheck … --movable`):

      depcheck: 246 roadmaps, 2241 edges, 0 problem(s)

  No UPWARD, CYCLE or `moved:` line.
- Source-key scan: every numbered section names a manifest key; all ten `cited_for` records exact.

## Notes for the maintainer

- No Lean name changed, none added or deleted; no cross-roadmap citation changed; `design/plan.json`
  keeps `"gaps": []`. No other roadmap is affected.
- No new object was stated, so no new ownership search was needed; the sentence adds a locator to
  an existing consequence of 2.4.
- No suspicious instruction was found in the review text.
