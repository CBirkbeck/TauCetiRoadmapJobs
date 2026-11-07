# Review of NoncompactQuantumSymmetry (pull request #1015 at 04e6334)

**Verdict:** needs changes

This is an incremental re-review of the 7 README lines changed since 70440b4. Those lines replace one Check: the trivial-representation `IsKFinite` Check at `README.md:691–694`. `Suggested.lean` and `metadata.toml` are byte-identical to 70440b4, and nothing outside the folder changed.

- The gate passes every check.
- `lake env lean` reports only the five `sorry` warnings.
- The dependency check reports 0 problems.
- The replacement Check is correct (rows 144–147), so the previous R02 is repaired.

Two P3 findings remain. Neither concerns the changed lines. The pull request's description still does not name the OperatorAlgebraDynamics revision whose section ids the README cites, and the README has not been split.

## R01 (P3) — Three OperatorAlgebraDynamics ids exist only at that roadmap's open revision, which the description does not name

**Location:** `TauCetiRoadmap/NoncompactQuantumSymmetry/README.md`:
- D1.BorelPrefix at `:19`, `:96`, `:179`, `:254`, `:285`, `:303`, `:374`, `:1091`, `:1376`, `:1404`, `:1414–1415`, `:1438`, `:1440`, `:1658`, `:1680`, `:1704`, `:1991`, `:4087`;
- D1.TwistedBorel at `:19`, `:96`, `:1686`, `:1991`;
- D4.Harmonic at `:19`, `:96`, `:140`, `:165`.

Also the pull request's description: its revision-dependency line and its merge-order paragraph.

**Claim:** these citations resolve on main, or the revision that defines them is named so that it merges first.

**Witness:** main's `TauCetiRoadmap/OperatorAlgebraDynamics/README.md` has only the sections D1–D9 (`:75–627`) and no "Harmonic" anywhere. The three ids are headings only at the open revision (`:999`, `:1104`, `:1958`). The description's revision-dependency line names only #1145, and its merge-order chain does not contain #1137.

Re-raised: R01 of the review at 70440b4. No repair report marks it as not actionable.

**Repair:** nothing changes in the folder.
- Add the OperatorAlgebraDynamics revision (#1137) to the description's revision-dependency line, next to #1145, and to the merge-order chain before this pull request.
- In the same edit, the description's M0 paragraph credits AutomorphicFormsOnReductiveGroups §2.1 with "Generic finite-orbit predicates, elementary submodule/map operations and compact Banach density". It should credit CompactGroups Layer 5 (`gap:banach-gfinite-density`) with these and AutomorphicFormsOnReductiveGroups §2.1 only with `IsKFinite` and the orbit-span identification. That is what README `:9`, `:95` and `:675` say.

## R02 (P3) — Size

**Location:** the folder. The README has 9,184 lines (669,915 bytes). M5 (`:3565–6201`) has 2,637 lines and M6 (`:6202–9156`) has 2,955.

**Witness:** these figures are those of the last four reviews, plus one line. No Part II folder exists. Longer roadmaps exist on main: PerfectoidSpaces has 17,700 lines and ClassicalArithmeticCompletion 18,040. So the request does not rest on line count. It rests on M5 and M6 carrying all-sequence and tree tables. Those tables extend past the interfaces that the rest of the roadmap consumes:
- M5.DeSitterNullZero (`:5084`), M5.DeSitterRemainingTransitions (`:5388`) and M5.StructuralModelComposition (`:5744`);
- the M6 pair, exchange and tree tables, which come after M6.MeasuredPair (`:6204`).

Re-raised: R03 of the review at 70440b4. No repair report marks it as not actionable.

**Repair:** as before. Move those tables into "NoncompactQuantumSymmetry, Part II". Its introduction should say that the base roadmap stops at M5.DeSitterFiber (`:4679`) and the M6.MeasuredPair interface.

## Previous findings

- R01 — not repaired: the description's revision-dependency line still reads "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1145". D1.BorelPrefix, D1.TwistedBorel and D4.Harmonic are still cited, for example at `:96` (R01 above).
- R02 — repaired: `:691–694` now reads "the orbit of v is {v}, so its span is 0 for v=0 and ℂ for v≠0: every vector is K-finite … The wrong model 'the orbit span has dimension exactly one' excludes 0 and is not closed under addition (1+(−1)=0)".
- R03 — not repaired: the README has 9,184 lines and there is no Part II folder (R02 above).

## Verified sound

**Gate and build.** I ran the gate on this head:

`gate NoncompactQuantumSymmetry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

The worker's gate file also records `build=0`. I elaborated `TauCetiRoadmap/NoncompactQuantumSymmetry/Suggested.lean` with `lake env lean` (6.7 s). It reports `declaration uses sorry` at lines 75, 88, 100, 116 and 189 and nothing else.

Repository state:
- `git diff --stat 70440b4 HEAD` lists only `README.md` (4 insertions, 3 deletions).
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- The worktree is clean.

**Dependency check.**

`depcheck: 239 roadmaps, 2427 edges, 0 problem(s)`

There are no UPWARD, CYCLE or moved lines.

**Signatures.** The worker's signature file flags five "looks dropped" leads, all `[IsClosed (H : Set G)]`. I checked each against its elaborated type, and each shows `[IsClosed ↑H]` or `[inst_8 : IsClosed ↑H]`, so these are text-matching false positives. `Suggested.lean` is unchanged, so the previous one-tactic probe still stands: no statement closed.

**The changed Check, by object.**
- It now names no Lean counterpart, as the README's Check rule requires. The old bullet named `IsKFinite` and restated its definition; that text is gone.
- It agrees with the supplier's own Check at AutomorphicFormsOnReductiveGroups §2.1 (open head `README.md:326`): the zero vector has orbit-span dimension zero, and in the trivial representation every orbit spans at most a line.
- The supplier definitions it tests are unchanged at that head: `IsKFinite` at `:302`, the restriction `(π.restrict K.subtype).toRepresentation` at `:304`, and the CompactGroups gap declaration at `:52`.
- Within the block it agrees with the K={1} Check at `:702–704`: for H=ℂ, the multiplicity is dim H=1.
- The added lines contain no LaTeX, pull-request number, process word or local path, and they add no source locator.

**Citations of the changed passage.** Nothing in the README cites the replaced Check. M4.Endpoints (`:2394`) and the upper-endpoint block (`:3946`) consume M0 item 3's K-finite and admissible modules, whose definitions this change does not touch.

**Ownership.** The change introduces no object. Compact-finite predicate, submodule and density ownership is as at the previous review: the CompactGroups gap owns them, and AutomorphicFormsOnReductiveGroups §2.1 owns the abbreviation. The overlap file lists no other open pull request that changes this roadmap and no dropped id. Its open-revision ids are R01. Ownership against open pull requests whose files the brief does not provide was not checked beyond these objects.

**Seeded sample.** None of the fifteen sampled targets lies in the changed lines, and none cites them. Following the incremental brief, they were not re-read against their sources this round. Their locations and the carried rows on the same objects:

| Target | Line | Carried rows |
| --- | --- | --- |
| M1.Core | `:1089` | 11–16, 87–91, 122 |
| TransformationTypes.HeisenbergShear | `:1706` | 32, 123 |
| Galilei multiplication, multipliers and the Bargmann extension | `:2018` | 33–35, 99–101 |
| Full genuine irreducible classification | `:2069` | 36–38, 102–103 |
| M4.Angular | `:2323` | 46 |
| M4.Endpoints | `:2380` | 44–45, 105 |
| Discrete and limit little families | `:3254` | 43–44 |
| M5.LittleDual.CoefficientSequence | `:3869` | 109–110 |
| Separate SL(2,ℝ) upper-endpoint forms | `:3940` | 57 |
| M5.NullLittleDual | `:4211` | 41, 109–110 |
| Fixed H̃ restriction support proofs | `:5262` | 60–62 |
| Complete labelled dual and its topology | `:5823` | 52–53 |
| Positive-energy Poincaré examples | `:6529` | 69 |
| Discrete or limit-discrete spacelike input | `:7027` | 74 |
| Actual Gram strata and common subgroups | `:7749` | 79 |

The README flags no locator as unverified.

**Adversarial table.** The following rows carry forward unchanged for statements the change leaves untouched:
- rows 1–86 of the review at 777a2fe, including the five `Suggested.lean` headlines: rows 3–4 `wigner_reconstruction`, 6–9 `whitehead_one`/`whitehead_two`, 10 `exists_polishTopology_continuousSMul`, 11–16 `InducedModelData.exists_inducedRepresentation`;
- rows 87–98 of the review at 1a39856;
- rows 99–133 of the review at 46b0fee, except rows 112 and 120, which rows 139–143 superseded;
- rows 134–137 and 139–143 of the review at 70440b4.

Row 138 of that review tested the replaced Check and is superseded by rows 144–147.

New rows:

| # | Statement | Instance | Values on the two sides | Result |
| --- | --- | --- | --- | --- |
| 144 | Check `:691–693`: orbit spans and K-finiteness | trivial K on ℂ; v=0, v=1, v=2+3i | orbit {v} for nonempty K; `span{0}=0`, dim 0 <∞; `span{1}=span{2+3i}=ℂ`, dim 1; K-finite set = ℂ | Pass |
| 145 | wrong model `:693–694` | {v : dim span(Kv)=1} | equals ℂ∖{0}; 0 ∉; 1, −1 ∈ but 1+(−1)=0 ∉ | Pass: not a submodule, as stated |
| 146 | "trivial type has multiplicity one" `:693` | Haar(K)=1; τ trivial and τ nontrivial | `P_triv v=∫v dk=v`, so `H_triv=ℂ`, `Hom_K(triv,ℂ)=ℂ`, dim 1; `P_τ v=d_τ v∫conj(χ_τ)=d_τ v⟨1,χ_τ⟩=0` | Pass |
| 147 | consistency with K={1} Check `:702` and supplier Check (open head `:326`) | K={1}, H=ℂ; v=0 | multiplicity dim H=1 on both; supplier: zero vector has dimension 0, and this Check gives `span{0}=0` | Pass |

**Headlines and padding.** `Suggested.lean` is unchanged, so the previous headline audit stands. It states:
- Wigner's theorem;
- the two Whitehead lemmas;
- the Polish realization;
- the induced representation on `Lp`.

The module docstring names the headlines that are not statable and their missing carriers. There is no padding.

## Not verifiable

- No changed line adds or changes a source locator, so this round fetched no source. The previous review's list is unchanged:
  - Fell 1961: paywalled DOI.
  - Kechris 1995, Weibel 1994, Wallach 1988 and Knapp: books not held.
  - Bargmann 1947, Lang *SL₂(ℝ)*, Mackey 1952/1958, Parthasarathy 1969, Kostant–Rallis 1971, Iverson–Mack 1970 and Aghassi–Roman–Santilli: paywalled.
  - Dooley and Grundling course notes: no legal source.
  - `GelfandNaimark1947 line 1454`: the exponent of Eq. 188 is illegible in the OCR.
- The fifteen seeded-sample targets lie outside the changed lines and were not re-read against their sources this round.
- AutomorphicFormsOnReductiveGroups was read only through the roadmap service at its open head.

## Source issues

- none
