# Review of ReductiveGroups (pull request #1797 at a285fd7)

**Verdict:** needs changes

Incremental re-review of 0 changed lines in `TauCetiRoadmap/ReductiveGroups/` since `11a9ca1`, the head the previous review read. The only commit since then rewrites `TauCetiRoadmap/AlgebraicTopology/` (README and Suggested.lean), one of the pull request's own folders. The previous review had one finding, on the pull-request description; the description is unchanged, so that finding stands and is the only one of this round. Everything inside the folder passes as before: gate, dependency check, elaboration, padding probe and the seeded sample.

Paths: `README.md` and `Suggested.lean` mean `TauCetiRoadmap/ReductiveGroups/…`.

## R01 (P3) — five open pull requests that change this folder conflict with it, and no order is stated

Location: the pull-request description (title "AlgebraicTopology, ReductiveGroups, LieHighestWeight, QuadraticFormInvariants: one Suggested.lean each"). Its ReductiveGroups paragraph still lists seven side files "folded into Suggested.lean section IntegralRational … SignedADE … Spectral" and says "No statement changes".

Claim: the merge order between the conflicting heads is settled, and the description describes this folder.

Witness: the overlap report lists #1332, #1676 and #1808 as conflicting with this head in `README.md` and `Suggested.lean`, and #1807 and #1854 in `README.md`; the description names none of them. `Suggested.lean:107–260` has the three namespaces `StructureAcceptance`, `SpecialLinearAcceptance` and `PlaneBraidAcceptance` with seven sorried headlines, and no section `IntegralRational`, `SignedADE`, `ADECoverLifts`, `FoldingADE`, `BruhatCoordinates`, `OrbitGeometry` or `Spectral`: the fold the description describes is not what this folder contains.

Repair: in the description, say which pull request merges first and that the others rebase on it (for example this one first; #1807 and #1854 then re-apply their three-line Layer 9E edit to this head's Layer 9E; #1676 and #1808 agree with this folder's text and need only a rebase), and replace the ReductiveGroups paragraph with what the folder now is (the rewritten README with supplier contracts and the seven-headline `Suggested.lean`). This is an edit of the pull-request text, which only the author can make; no file in the folder needs to change. Re-raised: R01 of the previous review.

## Previous findings

- R01 (five conflicting open pull requests, no stated order, description does not describe the folder) — not repaired: the description at this head is the same text; see R01 above.

## Verified sound

**The change outside the folder.** The commit `a285fd71` touches only `TauCetiRoadmap/AlgebraicTopology/README.md` and `Suggested.lean`. `README.md` cites AlgebraicTopology three times, by roadmap name only and never by section number: `:4037` ("based van Kampen theorem", the `*Needs:*` line of the plane-braid target), `:4083` ("based van Kampen and CW-cell interfaces", the Salvetti comparison route of 11B) and `:4254` (the Layer 11 Dependencies line). At this head the AlgebraicTopology README still has "Stage 1: van Kampen through the fundamental groupoid" (`TauCetiRoadmap/AlgebraicTopology/README.md:490`) and "Stage 4: CW pairs, cellular homology, and cofibrations" (`:685`), and its completion list item 1 (`:24–26`) still promises based van Kampen without connectedness assumptions on intersections, as before the commit (the same item at `11a9ca1`, line 25). Nothing ReductiveGroups consumes moved or disappeared. `git diff --stat origin/main...HEAD` outside the five folders the brief names is empty.

**Gate, dependency check, build.**
- The worker's gate at this head: every check zero, `OK`.
- Depcheck on this head with `--movable`: `depcheck: 229 roadmaps, 2318 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- `lake env lean Suggested.lean`: exit 0 in 15 s; `declaration uses sorry` at lines 124, 143, 160, 177, 199, 247 and 253 and nothing else.
- Imports: `import Mathlib` and the ten `TauCeti.*` modules of the previous round, unchanged.
- One-tactic probe (`first | rfl | (simp; done) | infer_instance | trivial | decide | (simp_all; done) | sorry` in place of each of the seven `sorry`s, on a scratch copy): all seven still report `declaration uses sorry`, none closes. No padding.
- The 15 elaborated signatures in the worker's file are those of the previous round (0 lost binders); the file is byte-identical to the one the previous review compared with `README.md:1708–1714`, `:1930–1934`, `:1959–1966`, `:2166–2171`, `:3996–4001`, `:4050`, `:4290–4292`.

**Seeded sample** (folder unchanged; the cited lines re-opened): §1.1 `jantzen-1985` line 1100 (§2.8, comodule map), line 1507 (§3.3, induction), line 1690 (§3.9, flat subgroup scheme), as cited at `README.md:855`, `:873`, `:883`; §8.1 `conrad-rgs` Definition 5.1.1 line 5651 (`:2613`) and Theorem 5.1.13 line 6011 (`:3248`); §8.2 Definition 6.1.1 line 7725 and Remark 6.1.2 line 7738 (`:2636`), Theorems 6.1.16–6.1.17 lines 8159, 8173 (`:3278`). The rest of the previous report's locator list (Milne 2017, McNinch, Conrad–Feng, Dudas–Michel, SGA 1, Gros–Kaneda, Riche, Frenkel–Kac, Brieskorn, Salvetti, Callegaro, Birman–Brendle, Fox–Neuwirth, Fadell–Neuwirth) covers text that did not change.

**Adversarial table.** No statement changed; every row is carried forward from the previous report (PRREVIEW-ReductiveGroups~54), whose values I re-read and which the unchanged file still supports.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `IsMaximalTorus.exists_conjugate_eq` | `GL₂/k̄`, `T` and `uTu⁻¹` | conjugate by `u`; both minimal among torus-quotient ideals (previous report) | Pass |
| same, nonreduced | `μ_p × 𝔾_m`, char `p` | torus quotient is reduced, ideal contains `(t−1)`; unique maximal torus, `g = 1` (previous report) | Pass |
| same, disconnected / trivial | constant `S₃`; `H = k` | augmentation ideal, conjugates equal it; `H = k`: only Hopf ideal `0`, rank-0 torus (previous report) | Pass |
| same, wrong field | `SL₂/ℝ`: diagonal torus vs `SO₂` | unbounded vs compact real points, not conjugate; excluded by `[IsAlgClosed k]` (previous report) | Pass |
| `IsParabolic.exists_levi_complement` | `P = G`; `GL₂`, `P = B` | `U = 1`, `J = 0`, identity; `J = (b)` identity, `J = (a−1)` not injective, `J = 0` not surjective (previous report) | Pass |
| same, hypotheses | `SL₂(W₂)` Greenberg transform, char `p` | smooth connected, no Levi, `hred` fails since `R_u = 𝔤^[1]` (previous report) | Pass |
| same, nonsplit | quasi-split `SU₃`; anisotropic `G` | Levi = non-split maximal torus; only `P = G`, `J = 0` (previous report) | Pass |
| `exists_levi_complement` (6A) | `𝔾_a`; `SL₂`; `𝔾_a ⋊ 𝔾_m` | `J` = augmentation; `J = 0`; `J = (x)` (previous report) | Pass |
| `lang_surjective` | `𝔾_a/𝔽₂`; `𝔾_m/𝔽_q`; `μ₂`, `q` odd; constant `C₂` | `θ² − θ = 1`; `g^(q−1)` onto; `(±1)^(q−1) = 1` misses `−1` and `C₂` fails, both excluded by `hconn` (previous report) | Pass |
| `exists_coordinatePresentation` | `n = 0, 1, 2` | `det ∅ = 1`; `x − 1`; over `ℤ/4` the inverse of `[[1,1],[0,1]]` has entry `3` (previous report) | Pass |
| `nonempty_plane_braid` | `n = 0, 1, 2` | `π₁ = 1 = B₀`; `1`; `ℂ × ℂ^×`, `π₁ = ℤ = B₂` (previous report) | Pass |
| `permutation_nonsplit` | `n = 2`; `n = 0, 1` | section needs `2m = 0` with `m` odd; trivial `S_n` excluded by `2 ≤ n` (previous report) | Pass |
| `permute` direction | `n = 3`, `σ = (012)` | `(0,1,2) ↦ (2,0,1)`, wrong convention gives `(1,2,0)` (previous report) | Pass |
| 3A.5 chart Check and natives | `D(t) → 𝔸¹`; origin `→ 𝔸¹` | `ℂ^× ⊂ ℂ` open; `{0}` closed, not open; `isClosedEmbedding_eval_generators` needs `adjoin = ⊤`, `[T1Space R]` (previous report) | Pass |
| `V₄ ⊂ PGL₂` | char 3 vs char 2 | `diag(1,−1)`, `[[0,1],[1,0]]` generate `V₄`; char 2 involutions unipotent (previous report) | Pass |
| 7b, 9A.1b, 9B.1, 9C, 10C, 11 Checks | as in the previous report | `P ∩ Q` dim 2 vs 1; `12 + 2`, `48 + 4`; `#SL₂(ℤ/4) = 48`; `E^(1)E^(1) = 2E^(2)`; socle misses `x²y²`; discriminant `4t²` (previous report) | Pass |

**Cross-roadmap and overlaps.** `roadmaps resolve` lists 12 Lean-name leads, all declared in `Suggested.lean` (`OrderedPlane`, `UnorderedPlane`, `planePermutationAction`, `planeBase`, `unorderedBase`, `nonempty_plane_braid`, `permutation_nonsplit`, `determinantRelation`, `exists_coordinatePresentation`, `exists_levi_complement` twice, `lang_surjective`) and no unresolved cross-roadmap citation. The overlap report lists no cited id dropped by an open pull request, no id defined only by an open revision, no id this pull request drops that others cite; the five conflicting heads are R01. The closest roadmaps in vocabulary (GroupSchemesOverABase, AdelicAlgebraicGroups, ClassicalGroupsPartII, SchubertGeometry, RootSystemsPartII) were settled in the previous rounds and nothing in this folder changed.

## Not verifiable

- Waterhouse, Borel and Springer are settled as uncertified and cited by locator only.
- The manifest key `milne-iag` records Milne's v2.00 notes; the README's numbering is that of the 2017 author copy, read in earlier rounds from RootSystems' cache.
- Howlett–Lehrer, Dipper–Du, Carter §1.17, Lang 1956, Steinberg 1968, Serre §§2.3, 3.3 and Gassmann are listed as references for Layers 7a–7f without locators into their texts; none is in the cache.
- Ownership against open pull requests was checked through the overlap report and the previous rounds' `roadmaps grep` runs, not against board packages that are not open pull requests.

## Source issues

- none
