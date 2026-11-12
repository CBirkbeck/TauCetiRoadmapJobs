# Review of QuasiregularMaps (pull request #2134 at 3703533)

**Verdict:** needs changes

Incremental re-review of the 11 lines changed since 97e2d44 (README lines 12–14 and 447–449). The roadmap folder and the description have no open finding. The one finding left is in the board's intake record, not in the pull request.

## R01 (P2) — The board still declares the orientation-descent gap that §7.5 owns

Re-raised: H01

**Location:** `packages/QuasiregularMaps/design/plan.json:1995` on the board's main: `"slug": "orientation-descent"`, supplier DifferentialGeometry. Also line 1769 (the prerequisite `gap:orientation-descent` of the flat-manifold target) and line 1868 (“gap orientation-descent for the missing descent section”).

**Claim:** The board asks DifferentialGeometry for the orientation of the orbit space of a free, properly discontinuous, orientation-preserving action. This roadmap provides that itself: a gap that asks for what is already provided.

**Witness:** `TauCetiRoadmap/QuasiregularMaps/README.md:88`: “it is owned here (§7.5)”; the README has six contracts, all SobolevMapsBetweenManifolds, and none for this slug. The last repair report says the entry “is removed”; the board's main still has it at line 1995.

**Why the repair's reason fails:** the report records H01 as applied, but the removal was an uncommitted edit of a board checkout and did not reach the board's main (the same happened in the round before). It also records lines 1769 and 1868 as outside what a repair may edit. So no repair round can close this.

**Repair:** nothing changes in `TauCetiRoadmap/QuasiregularMaps/` or in the description. On the board's main, a maintainer of the design record removes the `orientation-descent` entry from `gaps` in `packages/QuasiregularMaps/design/plan.json`, removes the prerequisite string at line 1769 (do not substitute `target:7.5`: in the design that id is the flat theorem itself), and removes the gap clause from the supplier note at line 1868. Test: translations of `ℝⁿ` by `ℤⁿ` have `dγ = id`, `det = 1`, and §7.5 gives the unique orientation with `dπ(o) = o/Γ`; the glide `(x, y) ↦ (x + 1, −y)` has `det = −1` and is excluded. After the edit the plan and the README declare the same six gaps.

## Previous findings

- R01 — not repaired: README:88 “it is owned here (§7.5)” is right; `packages/QuasiregularMaps/design/plan.json:1995` on the board's main still has `"slug": "orientation-descent"`. R01 above.
- R02 — repaired: README:12–14 “simplicial maps between smoothly triangulated manifolds with bounded simplexwise distortion, in particular with compact source, are quasiregular”; README:447 “with bounded simplexwise distortion are quasiregular”; the description carries the same qualifier.
- R03 — repaired: the description now says “The six declared SobolevMapsBetweenManifolds supplier gaps cover …; these are prerequisite contracts, not downstream consumers”, and names Parts II and III as the consumers.

The repairs introduced no new problem: the two changed sentences now agree with the headline at README:21–23, with §6.4 (README:1542–1575) and with the module docstring of `Suggested.lean` (lines 35–37), and the description's second paragraph agrees with them.

## Verified sound

**What changed.** `git diff 97e2d44 HEAD` touches only `TauCetiRoadmap/QuasiregularMaps/README.md` (6 insertions, 5 deletions): the Summary sentence at lines 12–14 and the build overview at lines 447–449. `Suggested.lean` and `metadata.toml` are unchanged. Nothing outside the folder is changed by the pull request.

**The changed passages against what they depend on.** Both sentences summarise §6.4. I re-read §6.4 (README:1542–1575), the headline bullet (README:21–23), §7.7 (README:1784–1808), the Layer 6 example and dependencies, and the docstring of `Suggested.lean`:

- “bounded simplexwise distortion” is §6.4's hypothesis `K_p < ∞`, with `K_p = sup q_O(dp_x)` over the interiors of the top simplices. The term is used the same way in the headline bullet and in the Lean docstring.
- “in particular with compact source” is §6.4's first bullet. Pinned declaration opened: `AbstractSimplicialComplex.compactSpace_realization_iff_finite`, `TauCeti/AlgebraicTopology/SimplicialComplex/Realization/Compact.lean:97` at Tau Ceti `2fd255d9`: the realization is compact exactly when the vertex type is finite. Finitely many vertices give finitely many `n`-simplices, and `K_p` is then a maximum of finitely many finite suprema.
- The headline bullet says “closed source”, the Summary “compact source”. Under the roadmap's standing boundaryless convention these are the same.
- Source: HeikkilaPankka2025 lines 1247–1251 (Proposition B.1) is for closed `M`, `N` and `n ≥ 2`; the bound in its proof (lines 1331–1339) is a maximum over the finitely many `n`-simplices. The README says the source is the closed case, and the noncompact form rests on the roadmap's own bound. The qualified Summary no longer claims more than §6.4.
- README:55–57 (the ownership list in Scope) names “the quasiregularity of non-degenerate orientation-preserving simplicial maps” as a topic this roadmap owns. It is untouched text and an ownership item rather than a theorem statement; remark only.

**Seeded sample.** None of the fifteen sampled targets (§1.1, §1.5, §2.2, §2.6, §2.9, §2.10, §3.2, §4.1, §4.2, §4.3, §5.2, §6.2, §7.2, §7.5, §7.7) lies in a changed passage. §7.7 and §6.2 are the two that touch the changed claim: §7.7 states `K_p < ∞` explicitly (“automatic for compact `T`”) and its flat-torus corollary has compact source, so it agrees with the new Summary. The README flags no locator as unverified.

**Gate, dependency check, elaboration.** Run on this head:

    gate QuasiregularMaps: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

    depcheck: 235 roadmaps, 2133 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. `lake env lean` on `TauCetiRoadmap/QuasiregularMaps/Suggested.lean` exits 0; the only output is five `declaration uses sorry` warnings, at lines 90, 106, 160, 177 and 191. SobolevMapsBetweenManifolds is at line 402 of the merge order and QuasiregularMaps at line 403.

**Signatures, headlines and padding.** `Suggested.lean` is byte-identical to the file the previous report read, so its `#check @name` comparison of the ten declarations, its headline table (three headline families stated, five named in the docstring as not statable for want of the manifold Sobolev class) and its one-tactic probes stand as recorded there. The worker's elaborated signatures for this head show the same ten types and no lost binder; I compared them again with README §§1.1, 2.9, 3.2 and 5.1–5.3 (finite-dimensional `F` in the two §5.2 theorems, `1 ≤ p`, `1 ≤ K`, `ContinuousOn u Ω`, an actual `IsQuasiregularOn` hypothesis in both §3.2 theorems).

**Citations, overlaps, ownership.** The three resolver leads are the same as before and are explained the same way: SobolevMapsBetweenManifolds is a declared package supplier (six gaps, matching slugs in the plan and the README), and the two `IsQuasiregularOn.*` names are declared in `Suggested.lean` and elaborate. The overlap data lists no other pull request changing this roadmap, no dropped id and no id only an open revision defines. The diff adds no object, citation or supplier, so the ownership resolutions of the previous report (ten suppliers and neighbours, read at main or at their open heads) carry forward unchanged; ownership against open pull requests was not re-searched for this round.

**Description.** Read against the head: the folder contents, the simplicial sentence with its qualifier, the six SobolevMapsBetweenManifolds contracts (README “Exact supplier contracts”), local ownership of §7.5 used by §7.6, the list of what `Suggested.lean` states, and the consumers (Parts II and III) all match. The generated `depends-on` and `merge-order` blocks were not reviewed as prose.

**Adversarial table.** Rows 1–3 are computed for the changed statements. The remaining rows are carried from the previous report (its 124-row table, at 97e2d44) for the sampled targets and the headlines; their statements are untouched by the diff. The other rows of that table stand as recorded there.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Summary (README:12–14): simplicial maps with bounded simplexwise distortion are quasiregular | Strip map `(x, y) ↦ (h(x), y)`, slope `k` on the `k`-th strip; torus doubling `diag(2, 1)` | Strip: `‖dp‖² = k²`, `J = k`, `q_O = k`, `sup = ∞`, hypothesis fails and for finite `K` the strip `k > K` has `k² > K·k`. Doubling: `K_p = 4/2 = 2`, `4 ≤ 2·2` | Pass; the qualifier excludes the counterexample to the old sentence | Repairs previous R02 |
| Summary: “in particular with compact source” | Compact `T²` with the `6 × 3` grid; noncompact `ℝ²` with the identity; noncompact strip map | `T²`: 36 triangles, `K_p = max` of 36 values `= 2 < ∞`. `ℝ²` identity: `K_p = 1/1 = 1 < ∞` with infinitely many simplices. Strip map: `K_p = ∞` | Compactness is sufficient, not necessary; “in particular” is the right word | None |
| Build overview (README:447) | Same strip map on a bounded set of `m` strips versus all of `ℝ²` | Local Lipschitz constant `max(1, …, m) = m` finite on the bounded set; `K_O = m` there, `∞` globally | Layer 6's two claims are distinct: locally Lipschitz always, quasiregular only with the bound | Repairs previous R02 |
| §1.1 minimal stretch (previous report) | `diag(3, 1/2)`; projection `diag(1, 0)` | `ℓ = 1/2`, inverse norm `2`, product `1`; projection `ℓ = 0`, norm `1` | Pass | None |
| §1.5 planar linear maps (previous report) | `a = 1, b = 1/2`; conjugation | norm `3/2`, `ℓ = 1/2`, `J = 3/4`, `q_O = q_I = 3`; conjugation `J = −1`, `q_O = ∞` | Pass | None |
| §2.2 outer distortion of a map (previous report) | constant, empty domain, `z²`, fold | `esssup q_O = 0, 0, 1, ∞`; `K_O = 1, 1, 1, ∞` | Pass; the maximum with 1 matters | None |
| §2.6 vanishing differential (previous report) | connected constant; two components with values 0 and 1; Cantor function | `D = 0` in both, image of 1 and 2 points; Cantor: increment `1`, integral of derivative `0` | Connectedness and the Sobolev class are both used | None |
| §2.9 Euclidean domains (previous report) | `diag(2, 1)`; radial stretch `n = 3`, `a = 2` and `1/2` | `4 ≤ 2·2`; `(K_O, K_I) = (4, 2)` and `(2, 4)` | Pass | None |
| §2.10 Beltrami equation (previous report) | `f(z) = z + z̄/2`; conjugation | `k = 1/2`, `K = (1 + k)/(1 − k) = 3 = q_O`; conjugation `1 ≤ k·0` fails | Pass | None |
| §3.2 comparison, both Lean headlines (previous report) | `diag(1, 1, 1/2)` with `K = 2`; `diag(2, 1, 1)`; projection `diag(1, 1, 0)` | `1/2 ≤ 2²·(1/2)³ = 1/2`; `8 ≤ 2²·2 = 8`; projection: inner `0 ≤ 0` true, outer `1 ≤ 0` false | Sharp; the quasiregularity hypothesis of the converse is needed | None |
| §4.1 change of metric (previous report) | flat `T²` to `dx² + 4dy²`; target `dx² + e^{2x}dy²` | `q'_O = 2 ≤ (2/1)² = 4`; `q'_O = e^{abs x}`, supremum `∞` | Comparable metrics needed in the noncompact case | None |
| §4.2 orientations (previous report) | identity with one, then both orientations reversed | `J = −1`: `1 ≤ −K` false; `J = +1`: `1 ≤ K` true | Pass | None |
| §4.3 precomposition (previous report) | torus projection then doubling; reflection | `norm² = 4`, `J = 2`, `K_O = 2 = 1·2`; reflection `J = −1` excluded | Pass | None |
| §5.2 `ACL^p` = Sobolev, both Lean headlines (previous report) | `abs t`, `p = ∞`; Cantor function; `sqrt(abs t)` | `abs t`: both sides true; Cantor: both false (`1 ≠ 0`); square root: derivative in `L^p` iff `p < 2` on both sides | Both directions discriminated | None |
| §5.3 agreement with the classical definition, Lean headline (previous report) | `diag(2, 1)`; projection; `n = 0` | `4 = 2·2` both sides; `1 > 0` both false; `1 ≤ K` both sides | Pass | None |
| §6.2 simplicial maps (previous report) | one identified vertex pair in a triangle and a tetrahedron; fold; total collapse | ranks `1 = n − 1`, `2 = n − 1`; fold `J = ±1`; collapse rank `0` | Non-degeneracy and orientation each exclude a model | None |
| §6.4 bounded simplicial theorem (previous report) | torus doubling; partial collapse; empty source | `4 ≤ 2·2`; `1 > K·0`; `max(1, sup ∅) = 1` | Pass | None |
| §7.2 independence of the orientation (previous report) | `f ∘ R` with target orientation reversed | `J_new = −J_f(Rx)·det R = J_f(Rx)` | Same `K`, still non-constant | None |
| §7.3 independence of the metric (previous report) | target metric scaled by 9; `α = 0`, `α = −2` | norm ×3, `J` ×`3ⁿ`, factor `1`; nonpositive `α` excluded by `0 < α` | Pass | None |
| §7.5 orientations of orbit spaces (previous report) | `ℤⁿ` translations; glide; antipodal map on `S¹`, `S²` | `det = 1`; `det = −1`; degrees `+1`, `−1` | Sound; the board record still duplicates it | R01 |
| §7.6 flat manifolds (previous report) | flat torus cover; glide; half-turn with a fixed point | norm `= J = 1`; `det = −1`; not free | Pass | None |
| §7.7 branched coverings by tori (previous report) | doubling after `ℝ² → T²`; constant map | `K_π = 1`, `K_p = 2`, composite `4 ≤ 2·2`; constant has rank 0 and fails non-degeneracy | Pass | None |

## Not verifiable

- The nine works settled as uncertified (`Rickman1993`, `Vaisala1971`, `Ahlfors2006`, `Lee2012`, `Reshetnyak1989`, `IwaniecMartin2001`, `BonkHeinonen2001`, `Gromov1981`, `Gromov1999`) remain so; none is cited by a changed passage and none was requested again.

## Source issues

- **Misprint** in HeikkilaPankka2025 at arXiv v2, proof of Proposition B.1, p. 24 (line 1328): the source composes the Nash embedding before the manifold map; it should compose the embedding after the manifold map, giving `ι ∘ p : M → ℝᵐ`; affects the proof.
