# GATE-RepresentationTheory~6: answers to human review of the smooth Banach representations roadmap

Head examined: `a1c513c`, compared with main `775563e` and with the pinned Mathlib and Tau Ceti. The changes under review are `TauCetiRoadmap/RepresentationTheory/SmoothBanachRepresentations/README.md` and `.../SmoothBanachRepresentations/Suggested.lean`. This job may edit only `TauCetiRoadmap/RepresentationTheory/README.md` (the family index, which contains none of the defects raised) and `TauCetiRoadmap/RepresentationTheory/Suggested.lean`. The only change is a new family-level `Suggested.lean` that the gate requires (commit `a9b331c7`). It holds `import Mathlib`, the module docstring and an empty `namespace TauCetiRoadmap.RepresentationTheory`, and declares nothing. It is the same file earlier rounds of this family added (`41d01d3`, `e7b55654`, `bd22cebe`). No review point could be repaired in the editable files. Where a point is correct but still unrepaired at head, the section below says so and gives the exact repair. Those repairs are collected again at the end for a job that is allowed to edit `SmoothBanachRepresentations/`. Such points are marked *answered*, because the four labels have no "valid, not repaired" option.

Points H01–H06 come from roed-math (review of `8e6feb3`), H07–H08 from CBirkbeck, and H09–H12 from kim-em (the reply describing `a1c513c`).

## H01 (roed-math) — answered

The point is correct, but the repair at head is not valid against main. SB7.3 at `a1c513c` (`SmoothBanachRepresentations/README.md` line 154; supplier bullet line 39; proof-order paragraph) consumes "NoncommutativeGeometry N1.Tensor … over both ℝ and ℂ, with scalar restriction/complexification comparisons". On main, NoncommutativeGeometry has no `N1.Tensor` clause and no anchor `#n1tensor-completed-locally-convex-projective-tensors`. Its N1 (main README lines 84–99) builds the completed projective tensor of Hausdorff locally convex spaces under the standing scope "Algebras are complex" (line 12), with no real case and no scalar-comparison maps. Those exist only in the open revision pull request to NoncommutativeGeometry (`N1.Tensor`, its line 87). A revision of an existing roadmap is never a dependency, so SB7.3 must cite NoncommutativeGeometry as it is on main.

Required repair (not made here):
- For 𝕜=ℂ, cite "NoncommutativeGeometry N1", without the anchor and without the "sole owner over ℝ and ℂ / scalar comparisons" clause.
- For 𝕜=ℝ, either state the real locally convex projective tensor and its universal property as a target in SB7.3 (the same seminorm formula over ℝ), or limit the real case to the jointly continuous bilinear map `E∞ × F∞ → (E ⊗̂_π F)∞` with dense span. That map needs only BanachSpaceTheory B4 (over `𝕜 = ℝ` or `ℂ` on main, its line 11) and SB2.

## H02 (roed-math) — applied

Applied at `a1c513c`, SB8 last paragraph. "Prove the equality of its rapid-decay seminorms with the present derivative seminorms" became "define the same Fréchet topology by explicit finite-order estimates in both directions … `Q_k≤C_k P_k` and `P_m≤D_m Q_(m+3)`", keeping the `2πi` normalisation and the `1+U₁` witness. I recomputed the estimates (table below): `C_k = 3^k` and `D_m = (2^(m+1)−1)(2π)^m S` with `S = Σ_(r,s)(1+|r|+|s|)^(−3) < ∞`, both independent of θ because `‖U₁^r U₂^s‖ = 1`. At θ=0, `a = 1+U₁` gives `Q_0 = 1` and `P_0 = sup_z |1+z| = 2`. One wording defect remains: the paragraph writes `δ_j(U₁^rU₂^s)=2πi n_j U₁^rU₂^s` with `n_j` undefined, and it should read `(n_1,n_2)=(r,s)`.

## H03 (roed-math) — answered

The point is correct and is not applied at head. `TauCeti.Semigroups.StronglyContinuousGroup` exists at the pin (`TauCeti/Analysis/Semigroups/Group/Basic.lean` line 74), together with:
- `toSemigroup` (line 202);
- `mem_domain_of_hasDerivAt_zero`, `generator_eq_of_hasDerivAt_zero` and `hasDerivAt_zero` (`Group/Generator.lean` lines 149, 154, 227);
- `map_mem_domain` and `generator_map` (lines 125, 131).

So SB0.2's "identify its domain and values with the two-sided derivative at zero … one-sided/two-sided comparison from the inverse group law" restates pinned results. Required repair:
- In SB0.2, construct `t ↦ π(exp(tX))` as a `StronglyContinuousGroup` and obtain the semigroup by `toSemigroup`.
- In `Suggested.lean`, replace `oneParameterSemigroup` by a `StronglyContinuousGroup`-valued definition and delete `mem_generator_domain_iff`. Once the group is constructed, that theorem follows from the two pinned lemmas above, so it is padding.

## H04 (roed-math) — answered

The point is correct and is not applied at head. `TauCeti/Analysis/Semigroups/Generator/ComplexLinear.lean` supplies the following for a complex-linear real semigroup:
- `IsComplexLinear` (line 75);
- `complexDomain` (147) and `complexGenerator` (168);
- `complexGenerator_restrictScalars` (206);
- `dense_complexDomain` (199) and `isClosed_complexGenerator` (217).

SB0.2's "prove that the domain is a 𝕜-submodule and A_X is 𝕜-linear" is therefore pinned for 𝕜=ℂ and should cite these names. The remaining obligation is only that the semigroup built from `π` satisfies `IsComplexLinear`.

## H05 (roed-math) — answered

The point is correct and is not applied at head. `Continuous.integrable_of_hasCompactSupport` (Mathlib `MeasureTheory/Function/LocallyIntegrable.lean` line 622) needs only `OpensMeasurableSpace` and `IsFiniteMeasureOnCompacts μ`, with no separability. `Suggested.lean`'s `integrable_compact_smul_orbit` follows from it in one step: `(hf.smul (hπ v)).integrable_of_hasCompactSupport hfc.smul_right`. I did not elaborate this line, because this job may run no Lean command other than the one given. So the theorem is a library consequence and should be deleted. SB1.3's "supply strong measurability from finite-chart compact localization and separable compact images" should cite the Mathlib lemma instead. The local bound `norm_smear_le` and localised Fubini remain targets.

## H06 (roed-math) — answered

This concerns another roadmap. SB's ownership paragraph (line 42) already names NoncompactQuantumSymmetry M0 as a consumer of SB0–SB6, which is the correct direction. NoncompactQuantumSymmetry at its open head `72e22bd` still contains no citation of SmoothBanachRepresentations (searched for "SmoothBanach"). The reciprocal link is that roadmap's edit, and nothing here changes.

## H07 (CBirkbeck) — answered

The consumption is real, and it creates a two-roadmap cycle. AutomorphicFormsOnReductiveGroups (head `c00e220`) consumes SB0–SB4 (its README lines 8, 42, 52, 54, 304), while SB4 consumes its §2.1 (H08). In the merge order, AutomorphicFormsOnReductiveGroups is line 68 and RepresentationTheory is line 181. Running depcheck on that README reports `UPWARD: AutomorphicFormsOnReductiveGroups (#67) -> RepresentationTheory (#180) at README lines [8, 42, 52, 54, 304]`.

The section-level graph is acyclic (§2.1 prefix → SB4 → §2.7), but the merge order works at roadmap level. One side must move ownership. The cleanest break moves SB4's compact-Lie G-finite clause (the real complexification adapter and smooth-topology density) into AutomorphicFormsOnReductiveGroups §2.7, which already consumes SB0–SB4. RepresentationTheory would then not consume that roadmap at all, and that roadmap would move after RepresentationTheory.

## H08 (CBirkbeck) — applied

Applied at `a1c513c`, ownership paragraph (line 42) and SB4 second paragraph: the common G-finite predicate and complex Banach density are now owned by AutomorphicFormsOnReductiveGroups §2.1 (`IsGFinite`, `gFiniteSubmodule_dense`, at its head lines 289–311). Two residual defects remain at head.
- Both sentences still route through "CompactGroups Layer5.1's application interface / application witnesses and covariance refinements". CompactGroups on main has no Layer 5.1 and no G-finite API (main README: Layer 5 is Peter–Weyl, line 318). That subsection exists only in the open CompactGroups revision. Required repair: delete the CompactGroups Layer 5.1 clauses, and cite CompactGroups on main only for Peter–Weyl representative-function density (Layer 5).
- The citation is a commit-pinned GitHub blob URL (`…/blob/04038f3…/AutomorphicFormsOnReductiveGroups/README.md#21-…`). It should be the roadmap-and-section citation "AutomorphicFormsOnReductiveGroups §2.1" (relative link `../../AutomorphicFormsOnReductiveGroups/README.md#21-compact-finite-vectors-and-admissibility`). The section heading is unchanged at head `c00e220`.

Whether this edge survives depends on the cycle in H07.

## H09 (kim-em) — disputed

The claim that "NCG's independent early N1.Tensor is the sole completed locally convex projective tensor supplier over both ℝ and ℂ" holds only on the open NoncommutativeGeometry revision, not on main. On main, N1 is untitled as a tensor clause and has complex standing scope (main README lines 12, 84–99). A revision pull request cannot supply this roadmap, so SB7.3 as written depends on unmerged text. The repair is given in H01.

## H10 (kim-em) — answered

Confirmed. The SB8 paragraph at `a1c513c` asks for equivalence of seminorm families with two-sided finite-order estimates, and both estimates hold with the constants computed in H02. The remaining nit is the undefined `n_j` noted in H02.

## H11 (kim-em) — answered

Partly confirmed. The ownership paragraph and SB4 agree on AutomorphicFormsOnReductiveGroups §2.1. The real adapter's names all exist at the pin:
- `TauCeti.Complexification` with `reCLM` (`TauCeti/Analysis/Normed/Module/Complexification.lean` line 274);
- `ofRealLI` (line 288);
- `ContinuousLinearMap.complexify` (line 356).

Both sentences still also route through CompactGroups Layer 5.1, which is absent from main, and the roadmap-level cycle of H07 is unresolved.

## H12 (kim-em) — answered

The NoncompactQuantumSymmetry reciprocal correction is not at that roadmap's open head `72e22bd` (see H06). It is outside this roadmap and needs no change here. The CI statement concerns a run, not the roadmap text, and has no bearing on its content.

## Adversarial pass on the statements the review touches

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| SB8 `Q_k ≤ C_k P_k` | `k=0`; `k=1`, `a=U₁^r U₂^s`; general `k` | `k=0`: `Q_0=sup\|a_rs\| ≤ ‖a‖=P_0` (τ a state, `\|a_rs\|=\|τ((U₁^rU₂^s)*a)\|≤‖a‖`). `k=1`, monomial: `Q_1=1+\|r\|+\|s\|`, `P_1=1+2π\|r\|+2π\|s\|`, ratio ≤ 1. General: `(1+\|r\|+\|s\|)^k ≤ 3^k(1+\|r\|^k+\|s\|^k)` and `\|r\|^k\|a_rs\| ≤ (2π)^(−k)‖δ₁^k a‖`, so `C_k=3^k` | holds, θ-independent | none (n_j nit, H02) |
| SB8 `P_m ≤ D_m Q_(m+3)` | `m=0`; general `m`; lattice count | `#{(r,s): \|r\|+\|s\|=n}=4n`, so `S=1+Σ_(n≥1) 4n/(1+n)^3 < ∞` (exponent 3 > 2); `‖δ_w a‖ ≤ (2π)^\|w\| S Q_(\|w\|+3)`; `2^(m+1)−1` words, so `D_m=(2^(m+1)−1)(2π)^m S` | holds; `Q_(m+2)` would fail (`Σ 4n/(1+n)^2` diverges) | none |
| SB8 witness `1+U₁`, θ=0 | `A_0=C(𝕋²)`, `U₁=e^(2πix)` | `Q_0=max(1,1)=1`; `P_0=sup_x\|1+e^(2πix)\|=2` | not isometric, as stated | none |
| SB8 `2πi` normalisation | gauge action `α_t(U_j)=e^(2πit_j)U_j` on `ℝ²/ℤ²` | `d/dt\|₀ e^(2πitr)=2πir` | matches `δ₁(U₁^rU₂^s)=2πir U₁^rU₂^s` | none |
| `integrable_compact_smul_orbit` | non-separable `E` (e.g. `ℓ^∞`); `G` discrete; `f=0` | Mathlib lemma needs only `OpensMeasurableSpace G` (from `BorelSpace`) and `IsFiniteMeasureOnCompacts μ`; continuity of `g↦f g • π g v` from `hf`, `hπ v`; compact support from `hfc` | true, and a one-step library consequence | delete (H05; not applied, out of edit scope) |
| `mem_generator_domain_iff` | `G=(ℝ,+)`, `π(t)v=e^t v`; `v=0` | domain = `E`, derivative `v`; with a `StronglyContinuousGroup` both directions are `hasDerivAt_zero` / `mem_domain_of_hasDerivAt_zero` (these need `CompleteSpace E`, which is in scope via `hComplete`) | true; padding once H03 is applied | delete after H03 (not applied) |
| SB7.3 supplier "N1.Tensor over ℝ and ℂ" | main NCG README | no `N1.Tensor` heading; "Algebras are complex" (line 12); N1 lines 84–99 give no real case and no scalar comparisons | citation unsupported on main | repair in H01 (not applied) |
| SB4 "CompactGroups Layer5.1 interface" | main CompactGroups README | no Layer 5.1, no orbit-span predicate (headings: Layer 5 = Peter–Weyl, line 318) | citation unsupported on main | repair in H08 (not applied) |

The mechanical `#check @name` comparison was not run. The new family-level `Suggested.lean` declares nothing, so there is no name to compare, and `SmoothBanachRepresentations/Suggested.lean` is unchanged.

## Other defects found while checking (not raised by reviewers)

These are listed for whoever can edit `SmoothBanachRepresentations/`:
- `Suggested.lean` imports eleven `Mathlib.*` and `TauCeti.*` submodules instead of the single `import Mathlib` plus the `TauCeti.*` modules it uses.
- `Suggested.lean` is complex-only, while the README is over `𝕜 = ℝ` or `ℂ`.
- The module docstring is not in the "<title>: target signatures" form.
- The README lacks the roadmap shape the repository requires: Scope and ownership, Conventions, supplier contracts, per-layer Checks, Examples and Dependencies sections.
- The family index `TauCetiRoadmap/RepresentationTheory/README.md` does not list SmoothBanachRepresentations. A separate open pull request adds that entry, so it is not added here.

## Repairs required outside this job's editable files

1. SB7.3, supplier bullet and proof-order paragraph: cite NoncommutativeGeometry N1 as on main (complex), with no `N1.Tensor` anchor or ℝ/ℂ claim. For 𝕜=ℝ, state the real projective tensor here or restrict to the bilinear map with dense span (H01, H09).
2. SB8: define `n_j` as `(n_1,n_2)=(r,s)` (H02).
3. SB0.2 and `Suggested.lean`: build a `StronglyContinuousGroup` and use `toSemigroup`. Cite the pinned generator and complex-generator lemmas, and delete `mem_generator_domain_iff` (H03, H04).
4. SB1.3 and `Suggested.lean`: cite `Continuous.integrable_of_hasCompactSupport` and delete `integrable_compact_smul_orbit` (H05).
5. Ownership paragraph and SB4: drop the CompactGroups Layer 5.1 clauses, and replace the commit-pinned URL with "AutomorphicFormsOnReductiveGroups §2.1" (H08, H11).
6. Resolve the AutomorphicFormsOnReductiveGroups ⇄ RepresentationTheory cycle by moving SB4's compact-Lie G-finite clause to that roadmap's §2.7, or by an equivalent move of ownership (H07).

## Ownership against open pull requests

Checked with `roadmaps grep` for the G-finite predicate and density (`G-finite|IsGFinite|orbit-span`) and for the locally convex projective tensor:
- The G-finite predicate and density are claimed by AutomorphicFormsOnReductiveGroups §2.1 (new roadmap, earlier in the order) and by the open CompactGroups revision (Layer 5.1). That revision is not citable.
- The locally convex projective tensor is on main in NoncommutativeGeometry N1, with a real-scalar extension only in its open revision.

## The `missing-files` repair request

The previous attempt failed with `missing-files=1: TauCetiRoadmap/RepresentationTheory/Suggested.lean`. This is now repaired by adding the family-level file described at the top. It declares nothing:
- On main, `TauCetiRoadmap/RepresentationTheory/` is a family index, with one subfolder per roadmap.
- Each headline theorem belongs to a member roadmap's own `Suggested.lean`.
- Restating any headline here would plan it twice.

The roadmap under review is still `SmoothBanachRepresentations/`. Its `Suggested.lean` is not the module that the briefed build compiles, and none of the commands this job may run builds it. A job that targets `TauCetiRoadmap/RepresentationTheory/SmoothBanachRepresentations/` with edit permission on its two files is needed to apply repairs 1–6 above.

## Build and gate

- `lake build TauCetiRoadmap.RepresentationTheory.Suggested`: `Build completed successfully (8976 jobs).`
- Gate: `gate RepresentationTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`) on `TauCetiRoadmap/RepresentationTheory/README.md`: `depcheck: 162 roadmaps, 1169 edges, 0 problem(s)`. Run on `SmoothBanachRepresentations/README.md` under the name RepresentationTheory, it gives `depcheck: 162 roadmaps, 1170 edges, 0 problem(s)`. There is no UPWARD or CYCLE line for this roadmap. The cycle of H07 shows only from the other roadmap's side, as quoted there.
- The gate does not cover the member roadmap's own files (see the limitation above).

No suspicious instructions were found in the review text.
