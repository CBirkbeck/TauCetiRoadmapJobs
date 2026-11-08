# Review of AnalyticStableMaps (pull request #987 at 8c9b5c4)

**Verdict:** needs changes

This is an incremental re-review of the 103 lines that changed since 36817fc: 37 in `README.md` and 66 in `Suggested.lean`. Nothing outside `TauCetiRoadmap/AnalyticStableMaps/` changed: `git diff --stat origin/main...HEAD` outside the folder is empty.

All four findings of the previous review are repaired. One new finding remains, a P3.

## R01 (P3) — §3.7 and the D1 contract restate the pinned dual-graph API instead of citing it

**Location.**
- `README.md` line 646 (§3.7): "Prove the combinatorial bound: … for a stable connected limit graph `Σ_v (2g_v − 2 + val_v) = 2g − 2 + n`, each ghost vertex contributes at least 1 … so `#ghost ≤ 2g − 2 + n + 2a` and `#edges ≤ 3a + 3g − 3 + n`".
- Line 98, changed in this diff: "D1 adds the node rings, the graph genus formula and pointed stability as finiteness from D0's cases."
- The new nodal bullet of "From Tau Ceti" (line 71) lists the `NodalGluing` files but leaves out `DualGraph.lean`, which sits in the same directory.

**Claim.** The README presents the sum identity, the ghost and edge bounds and the graph genus formula as work this roadmap or ComplexCurveModuli D1 still has to do. §3.7 is in the sampled set and cites the changed §1.2 and §3.4.

**Witness.** All of the following are at the pinned Tau Ceti, and all elaborate under `#check`:
- `NodalGluing.dualGraph` (`NodalGluing/DualGraph.lean` line 84), the dual graph of a `FlagPairData` and `Marking` curve, with the component genera supplied as an input.
- `NodalGluing.arithmeticGenus_dualGraph_add_card` (line 146) and `NodalGluing.isStable_dualGraph_iff` (line 171).
- `DualGraph.sum_logCanonicalDegree` (`Curves/DualGraph/Basic.lean` line 367).
- `DualGraph.IsStable.card_vertex_le` and `DualGraph.IsStable.card_edge_le`.
- `DualGraph.DegreeDecoration.IsStable` (`StableMaps/DualGraph/Basic.lean` line 105).

**Repair.**
1. In "From Tau Ceti", after the `NodalGluing` bullet, add these files and declarations:
   - `NodalGluing.dualGraph`, `NodalGluing.logCanonicalDegree_dualGraph`, `NodalGluing.card_edge_dualGraph`, `NodalGluing.arithmeticGenus_dualGraph_add_card` and `NodalGluing.isStable_dualGraph_iff` (TauCeti/AlgebraicGeometry/Curves/NodalGluing/DualGraph.lean);
   - `DualGraph.sum_logCanonicalDegree`, `DualGraph.arithmeticGenus_add_card_vertex`, `DualGraph.IsStable.card_vertex_le` and `DualGraph.IsStable.card_edge_le` (TauCeti/AlgebraicGeometry/Curves/DualGraph/Basic.lean);
   - `DualGraph.DegreeDecoration.IsStable` and `DualGraph.DegreeDecoration.sum_weightedLogCanonicalDegree` (TauCeti/AlgebraicGeometry/Curves/StableMaps/DualGraph/Basic.lean).

   Say in that bullet that the genus labels are an input.
2. In §3.7, replace the bound sentence with: "With `val_v` counting the flags and marks on v, the identity `Σ_v (2g_v − 2 + val_v) = 2g − 2 + n` is the pinned `DualGraph.sum_logCanonicalDegree` for `NodalGluing.dualGraph` labelled by the component genera. Ghost stability is `DualGraph.DegreeDecoration.IsStable` with degree 0 exactly on the constant components. For `a = 0` the bounds are `IsStable.card_vertex_le` and `IsStable.card_edge_le`; for `a > 0` they follow from the sum identity and `arithmeticGenus_add_card_vertex`." Add these names to the §3.7 *Needs:* line.
3. Line 98: "D1 adds the node rings, the identification of the genus labels of the pinned `NodalGluing.dualGraph` with the component genera (`arithmeticGenus_dualGraph_add_card` takes them as input), and pointed stability as finiteness from D0's cases."

**Tested on the instances.**
- The §3.7 Check with marks 2 + 2: `(−2+1+2) + (−2+1+2) = 2 = 2·0 − 2 + 4`. Then `card_vertex_le` gives `2 ≤ 2` and `card_edge_le` gives `1 ≤ 1`.
- The conic of §3.8, with `a = 2`: `Σ L_v = −1 − 1 = −2 = 2·0 − 2 + 0`, and `arithmeticGenus_add_card_vertex` gives `0 + 2 = 0 + #E + 1`, so `#E = 1 ≤ 3`.
- With component degrees 1 and 1, the weighted sum is `2 + 2 = 4 = −2 + 3·2`.

## Previous findings

- R01 — repaired: `Suggested.lean` lines 161–177 now state `finite_isotropy_iff`. Docstring lines 38–49 list Theorem 2 as stated, and lines 65–72 give the missing carriers for Theorems 4–6. README line 240 names the theorem.
- R02 — repaired: README line 783 now reads "the two-line map of §3.8 is a stable map whose domain is not stable … has `r_α = 4`, the minimum". Line 784 reads "`r_α = 4` is minimal … `r_α = 3` cannot occur."
- R03 — repaired: README lines 71–72 list the `NodalGluing` declarations and the fixed-J chart estimates. §1.1 (line 221), §1.2 (line 238) and §3.4 (line 610) cite them, with *Needs:* lines updated. All 30 names elaborate at the pins.
- R04 — repaired: README line 805 now has `π|c₁ − c₂|² e^(2δR)/(4δ³R²)` and `π|c₁ − c₂|² e^(2δR)/(2δR²)`, "the factor 2π being the length of the circle".

## Verified sound

**Gate, build and dependency check.**
- `gate AnalyticStableMaps` reports zero for every check, ending in "OK", exit 0.
- `lake env lean Suggested.lean` exits 0. Its only output is three `sorry` warnings, at lines 105, 128 and 161.
- The dependency check prints `depcheck: 239 roadmaps, 2428 edges, 0 problem(s)`, with no UPWARD or CYCLE line. ImplicitAtlases is at merge-order line 216 and AnalyticStableMaps at line 217.
- `overlaps.md` lists no conflicting heads and no dropped ids. `citations.md` lists no unresolved names.

**Lean form.**
- `Suggested.lean` has 4 declarations, all with explicit binders and no section `variable`s.
- The elaborated type of `finite_isotropy_iff` in `signatures.md` matches README line 240 binder for binder: finite-dimensional, T2, second-countable and boundaryless X; `Finite ι`, `Finite Flag`; compact, connected, T2 `C i`; `Marking d (Fin n ⊕ Empty)`; smooth and pseudoholomorphic components; node matching.
- `#check` was re-run in a scratch copy for the other three declarations; they are unchanged since the previous review.
- The new imports are `NodalGluing.AuxiliaryMarks` and `Diffeomorphism.FixingSubgroup.Basic`; both are pinned modules.
- One-tactic probe on a scratch copy: `simp` makes no progress, `infer_instance` and `rfl` fail, and `aesop` fails after exhaustive search. `exact AuxiliaryAut.finite_ordered_iff` and `finite_iff` are not even in scope, and they concern `ordered` rather than the u-isotropy set. No padding.

**Pinned declarations opened (Tau Ceti; file and line).**
- `NodalGluing` files:
  - `FlagPairData` (`Basic.lean` 149), with the injectivity field that makes flag points pairwise distinct;
  - `Marking` (414), with marks injective and off the flag points, and `Marking.specialPoints` (426);
  - `GluedCurve.lift` (496) and `continuous_lift` (521);
  - `Iso` (`Iso.lean` 86): a `C^n` diffeomorphism of the normalizations with the flag-pair relation iff;
  - `AuxiliaryIso` (`AuxiliaryMarks.lean` 91), `AuxiliaryAut` (275), `ordered` (345) and `unorderedAuxiliaryIsomorphismGroupoid` (444);
  - `ofComponent` (`ComponentAut.lean` 145) and `ofComponent_injective` (168);
  - `finite_ordered_iff` (`FiniteAutomorphisms.lean` 126) and `finite_iff` (138), both under `[∀ i, ConnectedSpace]`;
  - `finite_ordered_iff_forall_two_lt_encard` (163) and `…_of_complexTorus` (189);
  - `infinite_ordered_of_encard_specialPoints_le_two` (`UnstableComponent.lean` 81) and `infinite_ordered_of_specialPoints_eq_empty` (103).
- `Diffeomorph.fixingSubgroup` (`FixingSubgroup/Basic.lean`); `finite_fixingSubgroup_iff_two_lt_encard` (`OnePoint/Automorphism.lean` 204); `finite_fixingSubgroup_iff_nonempty` (`ComplexTorus.lean` 174). Both lemmas assume `n ≠ 0`.
- Chart estimates:
  - `Energy/MeanValue.lean` 294: C² J, C³ u, energy below δ gives `π r²‖∂ₛu(z₀)‖² ≤ 8∫`;
  - `Quantization.lean` 68 and 117, with δ chosen before u;
  - `Bubbling.lean` 65 and `Convergence.lean` 48, with `#Z·δ ≤ E`;
  - `SymplecticForm.exists_continuousOn_update_of_finite_energy` (`RemovableSingularity.lean` 57) and `…_memLp_fderiv_…` (`HigherIntegrability.lean` 98), with a constant ω taming bound and `p > 2`.

  The README's prose for these (lines 72 and 610) matches the pinned hypotheses.
- `TauCeti/AlgebraicGeometry/Curves/StableMaps/` (`PrestableMap`) is the scheme-theoretic notion over a base scheme. It is not a second owner of the analytic prestable maps of §1.1, which have arbitrary non-integrable J.
- The docstring's statement that the genus of a component is not at the pin holds. The pinned `NodalGluing.dualGraph` takes the genera as a free input, as its module docstring says.

**Cross-roadmap citations resolved.**
- ComplexCurveModuli on main:
  - D0 item 3 (genus 0 through HF F2.6a's `OnePoint ℂ`; genus 1 as `ℂ/Λ`) and item 5 (finite automorphisms of stable marked curves, including genus ≥ 2) together give the equivalence claimed at docstring lines 46–49 and README line 238;
  - D1 owns "pointed stability iff finiteness from D0's cases" (line 57 there).
- Ownership: `roadmaps grep` finds no other `finite_isotropy_iff` and no other owner of the isotropy-finiteness statement. GromovWittenTheory at its open head (line 25) consumes "the stability theorem (Layer 1 there)" from this roadmap. The ids §1.1, §1.2, §3.4, §5.1 and §6.1 are unchanged, so downstream citations still resolve.

**Sources read at the locators.**
- pardon13:
  - lines 4142–4153: Def. 9.2.1(i)–(vi), including `2g + n + r_α > 2`;
  - 4155–4159: Def. 9.2.2, under which transversality excludes nodes and marks;
  - 4160–4172: Def. 9.2.3(ii), with exactly `r_α` intersections;
  - 4196–4230: Def. 9.2.4 and the homeomorphism axiom. With `I = ∅` and `J = {α}`, it identifies `s_α⁻¹(0)/Γ_α` with the open set `U_∅α ⊂ X_∅`. This supports README line 783.
- is99:
  - line 299: Thm 1.1;
  - 314–326: Remark 2, marked points through attached constant discs;
  - 401: Def. 1.11;
  - 1026–1031: Lemma 3.1;
  - 1208–1215: Cor. 3.6;
  - 1233–1242: Lemma 3.7;
  - 1249–1252: Lemma 3.8;
  - 1344–1349: Thm 4.2(g) from Lemma 4.3;
  - 1576: Lemma 4.3;
  - 1902: Lemma 4.5.

  These are the locators of §3.4 and of the sampled §3.7, and all match.

**Seeded sample.**
- §3.7 (cites §1.2 and §3.4), §6.2 (§6.1), §7.2 (§6.1, §3.4), §8.1 (§5.1) and §10.1 (Layers 2–9) depend on changed passages. Only Checks and citations of those sections changed, so these targets keep their inputs. §3.7's locators were checked above, and its combinatorial bound gives R01.
- §0.2, §2.4, §2.7, §2.10, §2.15, §2.23, §3.6, §8.2, §9.2 and §13.3 are untouched by the diff and touch no changed passage. Their rows are carried from the previous report.

**Adversarial table.** Rows for statements the diff adds or changes, with values computed this round:

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `finite_isotropy_iff` (Lean, §1.2 line 240) | ι = ∅ | LHS: the only automorphism of the empty curve, 1 element; RHS vacuous | both true | none |
| same | one sphere, n = 0, u a degree-one line | u injective forces e = id, 1 element; no constant component | both true | none |
| same | sphere, `u = ℓ∘(z ↦ z²)` | `{id, z ↦ −z}`, 2 elements; RHS true | both true | none |
| same | two spheres, one node, u constant on B carrying 1 mark | fixer of `{0, ∞}` is `z ↦ az`, ℂ*; `ofComponent` injects it into the LHS set | both false | none |
| same | the same with 2 marks on B | 3 special points, fixer trivial (`2 < 3`); A has degree one, stabilizer trivial | both true | none |
| same | constant unmarked genus 2 | `|Aut| ≤ 84`; fixer of ∅ finite | both true | none |
| same | constant torus with a self-node | 2 flag points; fixer finite (`finite_fixingSubgroup_iff_nonempty`); the branch-swap involution is finite | both true | none |
| same, negative control without `hu` | `u = |z|²/(1+|z|²)` on ℙ¹ to ℂ | every rotation `z ↦ e^(iθ)z` intertwines u, so LHS infinite; RHS true | false without `hu`; `hu` needed and present | none |
| same | dim X = 0 | every u constant; reduces to the pinned `finite_ordered_iff` | consistent | none |
| §1.2 Check (genus 2) | constant unmarked genus-2 component | `84(g−1) = 84`; `2g − 2 + n = 2 > 0` | match | none |
| §5.1 Check (converse) | genus 0, one node, marks 3 + 1 | `2g + n = 4 > 2`; sphere B has `1 + 1 = 2` special points | converse fails, as stated | none |
| Layer 5 Example (two lines) | `D_α` meets each line twice, off `[0:0:1]` | 1 preimage per point; per sphere `1 + 2 = 3`; `r_α = 4`; `0 + 0 + 4 > 2`; `r_α = 3` leaves a sphere with 2 special points | match | none |
| Layer 5 Example (double cover) | `k = #(ℓ ∩ D_α)` | `r_α = 2k`; `k = 1` gives 2 < 3; `k = 2` gives 4; the deck involution has no fixed point off the branch points | match | none |
| §6.1 neck Check | `ξ = (c₁+c₂)/2 + (c₂−c₁)s/(2R)` | `∫s²e^(−2δ|s|) → 1/(2δ³)`, `∫e^(−2δ|s|) → 1/δ`; `2π·|Δ|²/(4R²)·e^(2δR)/(2δ³) = π|Δ|²e^(2δR)/(4δ³R²)`; `2π·|Δ|²/(4R²)·e^(2δR)/δ = π|Δ|²e^(2δR)/(2δR²)` | match | none |
| "From Tau Ceti", nodal bullet | `OnePoint ℂ` component with 2 or 3 special points; torus with 0 or 1 | infinite or finite; infinite or finite (pinned lemmas at 204 and 174) | match | none |
| "From Tau Ceti", chart estimates | quantifier order in `Quantization.lean` 68 | `∃ δ > 0, ∀ u`, so δ depends on J and K only | match | none |
| Conventions, target row | Lean binders of all three theorems | each has FiniteDimensional, Boundaryless, T2 and SecondCountable X and a smooth J, with no ω | match | none |
| Docstring lines 46–49 | genus of a component | pinned `dualGraph g m` takes `g` as input | match | none |
| §3.7 combinatorial bound | marks 2 + 2; conic with `a = 2` | `2 = 2·0 − 2 + 4`, `#V = 2 ≤ 2`, `#E = 1 ≤ 1`; `Σ L_v = −2`, `#E = 1 ≤ 3` | true, but restates pinned identities | R01 |

Rows carried from the previous report (PRREVIEW-AnalyticStableMaps~5, adversarial table), for statements the diff leaves untouched:

| Statement | Instances | Values computed (previous report) | Result | Change |
|---|---|---|---|---|
| Normalization, existence (Lean) | `z ↦ z²` composed with a line; genus-one double cover; X of dimension 0 | `d = 2`, `R = 2`, `2 = 2·2 − 2`; `2g − 2 = 2(−2) + 4 = 0`; `hnc` fails | true, or vacuous where it should be | none |
| Normalization, uniqueness (Lean) | `π₁ = π₂ = z²`; `π₂ = φ∘π₁` | `a = id`; `a = φ`; π₁ surjective | true | none |
| `IsSomewhereInjective` | line; double cover; constant map | injective; branch fibre `{0}` with `mfderiv = 0`; `mfderiv = 0` | both clauses needed | none |
| Genus identity (§0.5) | `g₀ = 0`, `d = 2`, `R = 4`; `z^d` | `g = 1`; `12 = 8 + 4`; `R = 2(d − 1)` | match | none |
| Matching subspace (§2.2) | one node; self-node; `k = 1`, `p = 2` | codim `2m`; `2m`; `kp = 2` | match | none |
| Fixed-j dimension (§2.10) | g = 0, 1, 2 | `2m + 2c₁ − 6`; `2c₁ − 2`; `−2m + 2c₁` | match | none |
| Bounded pieces (§2.13) | `‖du‖_∞ = 5`; ratio as ζ → z₀ | pieces with `K ≥ 5`; `|du(z₀)v| ≥ 1/K` | match | none |
| Incidence (§2.15) | lines; conics; three line points | `8 − 8 = 0`; `20 − 20 = 0`; `10 − 12 = −2` | match | none |
| Relative families (§2.16) | lines over `[0, 1]` | index `4 + 1 = 5`; outward normals `±∂_t` | match | none |
| Arbitrary targets (§2.20) | torus with fixed j and one mark; diagonal | `2c₁`; `4 + 4 − 4 = 4`, empty | match | none |
| Second countability (§3.3) | constant maps; long line | `X × |M̄_(g,n)|`; sequentially compact, not compact | match | none |
| Nodal index (§4.1) | two lines; Thm B.1.1(ii) | `20 − 12 + 4 − 4 + 2 = 10 = v` | match | none |
| Thickened topology (§5.2) | `I = ∅`; nonempty I | compact; unbounded e | match | none |
| End norm (§6.1) | `c + e^(−μs)w`; `e^(−μs)w` | `|c|² + π(1 + … + μ^(2k))/(μ − δ)`; node value 0 | match | none |
| Evaluation complement (§6.2) | `E = 0`; annulus forcing | `H = E'' = 0`; separated by `E/E''` | match | none |
| Gluing orientations (§8.2) | hyperplane; codimension 2 | 2 components; connected | match | none |
| Joint models (§12.1) | two-marked lines and the diagonal | normal dimension 4; fibre empty | match | none |
| Domain adapter (§13.3) | `M̄_(0,5)`, `M̄_(1,1)`, `M̄_(2,0)` | dimension 4; isotropy 2, 4, 6; isotropy 2 | match | none |
| Generic regularity (§2.9) | lines; conics; K3 genus 2 | 4; 10; index 2 | match | none |
| Compactness (§3.7) | (0,0,1); (0,4,0); conic | 0 and 0; 2 and 1; edges ≤ 3 | match | none |
| Topological regularity (§7.3) | two-line chart | `8 + 2 = 10 = v` | match | none |
| Functional (§9.2) | point target (1,1); (0,3) | `v = 2`, weight ½; 1 | match | none |
| Tame non-convexity (§10.1) | `J_a` | `J_a² = −id`; midpoint squares to `−2·id` | match | none |

## Not verifiable

- McDuff–Salamon, *J-holomorphic Curves and Symplectic Topology*, and Robbin–Ruan–Salamon (Math. Z. 2008): both are paywalled and cited by locator only. They are already settled as uncertified in the manifest, and no changed passage depends on them.
- Ownership against open pull requests was checked with `roadmaps grep` and `overlaps.md` at the index of 2026-11-07. Pull requests not in that index were not checked.

## Source issues

- **Misprint** in is99 at Corollary 3.6 and the remarks after Lemma 3.7, pp. 25–26 (is99 lines 1201, 1214, 1228, 1246, 1640): the source refers to the constant ε₂ of "Lemma 3.3" and to the cylinder convergence of "Lemma 3.6", but neither lemma exists. It should cite Lemma 3.4 (Second a priori estimate, which defines ε₂) and Lemma 3.7; it affects nothing.
