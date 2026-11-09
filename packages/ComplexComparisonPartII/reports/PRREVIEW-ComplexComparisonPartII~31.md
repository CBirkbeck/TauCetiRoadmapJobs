# Review of ComplexComparisonPartII (pull request #848 at fcf31bc)

**Verdict:** accepted

This is an incremental re-review of 60 changed lines since `bbf343b`. All of them are in `TauCetiRoadmap/ComplexComparisonPartII/README.md`. `Suggested.lean` and `metadata.toml` are byte-identical to `bbf343b`, and nothing outside the folder changes.

No finding remains: the previous R01 is repaired, and the repair introduces no new problem.

The repair also corrects the previous review's own suggestion. That review proposed `IsAlgClosed.of_ringEquiv` for `ULift.{u} ℂ`, but that lemma needs both fields in one universe, so it fails for `u ≠ 0`. The README instead proves the instance through `IsAlgClosed.of_exists_root`, and that route elaborates at the pin (see below).

## Previous findings

- R01 — repaired: README :1048 "Prove that the image of `φ_X` is `closedPoints X` … and that `φ_X` is injective on points. Both follow from Mathlib's `AlgebraicGeometry.pointEquivClosedPoint` … applied with `K = ULift.{u} ℂ`". C4.5 :2868–2870 and :2898–2901, C0.4 :1406–1407, C1.9 :2053–2054, and the contracts at :518–528 cite it.

  Each part of the requested repair is present:
  - **Mathlib contract.** The bullet (:518–528), now headed "(§C-1.1, C0.4, C1.9, C4.5)", states `pointEquivClosedPoint` in prose with its hypotheses, and adds `Complex.isAlgClosed`, `IsAlgClosed.of_exists_root` and `ULift.ringEquiv`.
  - **§C-1.1.**
    - It now states the identification as part of the analytification API (:1048), so later layers can cite §C-1.1 for it.
    - Its *Needs:* line (:1074) and Layer C-1 *Dependencies* (:1219–1220) name the declarations.
    - Two Checks were added (:1079–1080): the `A¹` bijection with the generic point excluded, and `Spec ℂ(t)` as the instance that the finite-type hypothesis excludes.
  - **C4.5.**
    - On the algebraic side (:2868–2870), "(§C-1.1)" is replaced by `pointEquivClosedPoint` together with §C-1.1's identification of the points of `T_X`.
    - The fibre step (:2898–2901) now argues the point: the fibre over `x` is of finite type over `κ(x) = ℂ`, it has a closed point, and that closed point is a complex point of the fibre.
    - The *Needs:* line (:2912–2919) adds the declaration, and the Layer C4 *Dependencies* (:2962) add it as well.
  - **C0.4 and C1.9.** `coherentAnalytification_faithful` (:1406–1407, *Needs:* :1416–1417) and the curve bijection `CodimensionOnePoint C ≃ T_C` (:2053–2054, *Needs:* :2128–2129) cite §C-1.1 and the declaration.

## Verified sound

### Gate, dependency check and Lean

- **Gate.** My own run on `fcf31bc` exits 0:

  ```text
  gate ComplexComparisonPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```

  The worker's `gate.md` agrees and adds `build=0`.
- **Dependency check** (`--movable`). This is its full output:

  ```text
  depcheck: 239 roadmaps, 2333 edges, 0 problem(s)
  ```

  It has no UPWARD, CYCLE or `moved:` line. This roadmap is at `ORDER.txt:39`. The changed passages add no roadmap supplier, only Mathlib declarations.
- **Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ComplexComparisonPartII'` is empty, and the worktree is clean.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 in 13 s. Its only warnings are four `declaration uses sorry`, at :119, :130, :157 and :175.
- **`#check @`, padding probe and headlines.** The file is unchanged since `bbf343b` (`git diff bbf343b HEAD` touches only the README). Its elaborated types in `scratch/signatures.md` match the previous report's `#check @` record:
  - `[FiniteDimensional ℂ E]` on `montelTheorem`;
  - `[T2Space]`, `[CompleteSpace]`, `[LocallyConvexSpace ℝ ·]` and `[MetrizableSpace]` on `E` and `F` in `schwartzFiniteness`;
  - `IsManifold 𝓘(ℂ,E) ⊤ M` on `holomorphicPoincare`;
  - `LocallyContractibleSpace ↑T` on `nonempty_sheafSingularComparison`.

  The previous report's 20 one-tactic probes, none of which closed a goal, still apply. The headline table and the docstring are untouched.
- **Citation leads.** None of the new backticked names is among the 39 leads of `scratch/citations.md`. That file lists no cross-roadmap citation as unresolved.

### Library declarations opened at the pins (for the changed passages)

**Mathlib:**

- `AlgebraicGeometry.pointEquivClosedPoint` (`AlgebraicGeometry/AlgClosed/Basic.lean:67`).
  - **Type.** `{p : Spec ↧K ⟶ X // p ≫ f = 𝟙 _} ≃ closedPoints X`, with `p ↦ p.1 (IsLocalRing.closedPoint K)`.
  - **Hypotheses.** `X : Scheme.{u}`, `K : Type u`, `[Field K]`, `[IsAlgClosed K]` and `[LocallyOfFiniteType f]`, with no separatedness or quasi-compactness.

  The README's prose at :522–525 and :1048 matches this exactly.
- `Complex.isAlgClosed` (`Analysis/Complex/Polynomial/Basic.lean:52`).
- `IsAlgClosed.of_exists_root` (`FieldTheory/IsAlgClosed/Basic.lean:182`).
- `IsAlgClosed.of_ringEquiv` (`FieldTheory/IsAlgClosed/Basic.lean:213`). Its `k` comes from `variable (k : Type u)` at :57, and `k' : Type u`, so both fields lie in one universe, as the README says.
- `ULift.ringEquiv` (`Algebra/Ring/ULift.lean:92`).
- `ULift.field` (`Algebra/Field/ULift.lean:56`).
- `closedPoints` (`Topology/JacobsonSpace.lean:36`).
- `LocallyOfFiniteType.jacobsonSpace` and `nonempty_inter_closedPoints`, re-`#check`ed.

**Tau Ceti:** only a local `let` for `ULift.{0} L` exists, in `RepresentationTheory/CharacterTable/Galois.lean:118`. It is not a declaration and is fixed to universe 0, so there is nothing to cite.

**Lean probe** (scratch file, `lake env lean`, these results exactly):

- (a) `example : IsAlgClosed (ULift.{u} ℂ) := by infer_instance` fails with `synthInstanceFailed`, so Mathlib has no instance.
- (b) `IsAlgClosed.of_ringEquiv ℂ _ ULift.ringEquiv.symm` succeeds for `ULift.{0} ℂ`.
- (c) The same term at `ULift.{1} ℂ` fails with a type mismatch, `IsAlgClosed.{0}` against `IsAlgClosed.{1}`. The README's universe remark is correct.
- (d) The README's route proves `IsAlgClosed (ULift.{u} ℂ)` for universe-polymorphic `u` with no error: `of_exists_root`, then map along `ULift.ringEquiv`, take a root by `IsAlgClosed.exists_root` over `ℂ`, and pull it back.
- (e) With (d) as a local instance, `pointEquivClosedPoint f` elaborates for `X : Scheme.{u}` and `f : X ⟶ Spec (CommRingCat.of (ULift.{u} ℂ))` with `[LocallyOfFiniteType f]`. This is §C-1.1's domain.

### Sources

- **Seeded sample, where it falls in the change.** Only "Curve GAGA as named maps" is touched, in its *Needs:* line (:2128–2129). I re-read its locator, SGA 1 XII Thm. 4.4, printed p. 249, with the proof continuing to p. 250 (`sga1` 9805–9830; page marker 265 is printed page 249). It states the equivalence on coherent modules for proper `X`, as cited.
- **The rest of the sample.** The other 14 sampled targets are untouched, and the previous report's verification of them at their locators stands.
- **New source citations.** The changed passages add none: the new mathematics is sourced to pinned Mathlib declarations, opened above.

### Duplication and ownership

- **Grep.** I grepped all 469 open heads and main for `IsAlgClosed (ULift`, for "ULift … algebraically closed", and for the closed-point/complex-point identification. Only this README matches, so §C-1.1 is the owner.
- **`pointEquivClosedPoint` elsewhere.** It is also cited by ReductiveGroups on main (:288, §3A.2, a bounded orbit-map adapter) and at that roadmap's open revisions. That is a different object, and there is no ownership conflict.
- **Overlaps.** `scratch/overlaps.md` lists no dropped id, no id that only a revision defines, and no other pull request that changes this folder.
- **Remark on untouched text** (no change requested). C3's derived GAGA (:2622–2627) also uses "closed points" with residue field `ℂ`. It reads correctly now that §C-1.1 states the identification.

### Adversarial pass

**Changed statements** (values computed this round):

| # | Statement | Instances | Values computed | Result |
| --- | --- | --- | --- | --- |
| 26 | §C-1.1: image of `φ_X` is `closedPoints X`, `φ_X` injective on points | `A¹`; `Spec ℂ[x]/(x²)`; `Spec(ℂ×ℂ)`; doubled origin; `⊔_ℕ A¹`; `∅`; `A²` generic point | **`A¹`:** `a ↦ (z−a)`, a bijection `ℂ ≅ closedPoints`. **`ℂ[x]/(x²)`:** `x ↦ a` needs `a² = 0`, so one complex point and one closed point. **`ℂ×ℂ`:** 2 and 2. **Doubled origin:** `0₁` and `0₂` are distinct complex points and distinct closed points (no separatedness needed, matching the declaration). **`⊔_ℕ A¹`:** `⊔_ℕ ℂ` on both sides (no quasi-compactness needed). **`∅`:** 0 and 0. **Generic point of `A²`:** not closed and not in the image | Holds |
| 27 | `IsAlgClosed (ULift.{u} ℂ)` proved in §C-1.1 | `u = 0`; `u = 1`; generic `u` | **Wrong model** "`of_ringEquiv` suffices": works at `u = 0` (probe b), fails at `u = 1` (probe c). **README route:** proves it for all `u` (probe d). **Mathlib instance search:** fails (probe a) | Holds; the wrong model is excluded |
| 28 | Check: `A¹` bijection, generic point excluded | `ℂ[z] → ℂ`, `z ↦ a`; a map missing `b` | **Section:** kernel `(z−a) ≠ (0)`, so the generic point `(0)` is never hit. **Missing `b`:** `{b}` is closed, hence locally closed and nonempty, with empty preimage, which is what C4.5's pull-back step forbids | Holds and discriminates |
| 29 | Check: `Spec ℂ(t)` needs finite type | `ℂ(t)` | **No section:** a `ℂ`-algebra map sends `t ↦ a`, so `1 = (t−a)(t−a)⁻¹ ↦ 0`, a contradiction; there are 0 complex points against 1 closed point. **Not of finite type:** `ℂ(t)` has infinite `ℂ`-dimension (`t` is transcendental), so by Zariski's lemma it is not a finitely generated `ℂ`-algebra | Holds |
| 30 | C0.4 `coherentAnalytification_faithful` closed-point step | `O/(z)` and `O/(z²)` on `A¹`; `exp(z)` | **`O/(z)`:** support `{(z)}`, a closed point that is the complex point 0; analytic stalk `ℂ{z}/(z) = ℂ ≠ 0`. **`O/(z²)`:** analytic stalk has dimension 2. **`exp(z)`:** non-fullness unchanged | Holds |
| 31 | C1.9 `CodimensionOnePoint C ≃ T_C` | `P¹`; elliptic `E` | **`P¹`:** codimension-one points = closed points ↔ `ℂ ∪ {∞}` = the Riemann sphere; the generic point has codimension 0 and is excluded. **`E`:** closed points ↔ `ℂ/Λ` | Holds |
| 32 | C4.5 algebraic side: closed points = image of `φ_X` | `A²∖{0}`; `⊔_ℕ A¹`; doubled origin | **`A²∖{0}`:** the open `{x≠0}` contains `(1,0)`, which is in `T_X`. **`⊔_ℕ A¹`:** each component contains `0_n`. **Doubled origin:** each origin chart meets `T_X`. **Wrong model** "every point is complex": refuted by the generic point of `A¹` | Holds |
| 33 | C4.5 fibre step: `W → X` surjective on complex points | normalization `A¹ →` nodal cubic; `Bl₀A² → A²`; generic point of `A¹` | **Nodal cubic:** the fibre over the node is `{t = ±1}`, two complex points. **Blow-up:** the fibre over 0 is `P¹`, and its closed point `[1:0]` is complex. **Wrong application at the generic point:** `κ = ℂ(z)`, and the fibre's closed points have residue fields finite over `ℂ(z)`, not `ℂ`. That is why the README applies the step only at complex points `x` with `κ(x) = ℂ` | Holds |

**Rows carried forward unchanged** from the previous report on `bbf343b`. Their statements are untouched, and the values are the ones computed there:

| # | Statement | Values (previous report) | Result |
| --- | --- | --- | --- |
| 1 | `analyticSubsetComplementConnected` | `{z₁z₂=0} ⊂ ℂ²` complement `(ℂ*)²` connected; `ℂ∖ℤ` connected; `ℂ ⊔ ℂ` needs connected `T`; `ℝ∖{0}` two components | Holds |
| 2 | `analyticConnectednessComparison` (1) | `#π₀`: `∅` 0/0; `Spec(ℂ×ℂ)` 2/2; `A¹⊔A¹` 2/2; `⊔_ℕ A¹` ℕ/ℕ; node 1/1; `A²∖{0}` 1/1 | Holds |
| 3 | `analyticConnectednessComparison` (2) | `A¹` irreducible but not `IrreducibleSpace ℂ`; node reducible; nodal cubic irreducible via `t ↦ (t²−1, t(t²−1))`; `∅` irreducible on neither side | Holds |
| 4 | C4.5 route | resolution gives `T_Y` connected (GAGA in degree 0), `T_W` connected; chain step clopen | Holds (closed-point step now rows 32–33) |
| 5 | Closed points = complex points | superseded by rows 26–29 | Repaired |
| 6 | `affineCurveConnectedness`, `puncturedRiemannSurfaceConnected` | `G_m`: `ℂ*` connected; `E∖{O}` connected; `[0,1]∖{1/2}` two components | Holds |
| 7 | `montelTheorem` | `(z₁z₂)ⁿ → 0` uniformly on compacts; `ℓ²` with `⟨e_n,·⟩`: `sup ≥ r`, no limit | Holds |
| 8 | `schwartzFiniteness` | `h = −P`, `rank P = r`: codim `r`; `−id` on `ℓ²` not compact; `−id` on `ℂ`: codim 1 | Holds |
| 9 | `holomorphicPoincare` | `η = (z₁dz₂ − z₂dz₁)/2`, `dη = dz₁∧dz₂`; `dz̄` excluded | Holds |
| 10 | `nonempty_sheafSingularComparison` | point: `A` in degree 0; Warsaw circle `Ȟ¹ = ℤ`, `H¹_sing = 0` | Holds |
| 11 | Riemann surface of a smooth curve | `P¹` transition `1/z`, derivative `−1/z² ≠ 0`; nodal cubic singular; doubled origin non-separated | Holds |
| 12 | Curve GAGA as named maps | `z/(z−1)`: divisor `[0]−[1]`; `h⁰(O([∞])) = 2`; `O(p−q)` degree 0 and nontrivial | Holds |
| 13 | `IsDifferentialOperator` | `[d/dz,z] = 1`; over `𝔽₂`, `(d/dz)²z² = 0` but `∂^{[2]}z² = 1` | Holds |
| 14 | `artinDeRhamBetti` | `P¹_A`, `A = ℂ[ε]/ε²`: `lg H⁰ = lg H² = 2`, `lg H¹ = 0` | Holds |
| 15 | `CurrentCalculus` | `∫dα∧u = (−1)^{k+1}∫α∧du`; `(a dx+b dy)∧(φdx+ψdy) = (aψ−bφ)dx∧dy` | Holds |
| 16 | `realComplexCurrentComparison` | `[D]`: sign `−1` on both sides, mass `π`; `δ₀`: `dJ₀ = 0` | Holds |
| 17 | Analytic cotangent and log differentials | `Ω¹(ℂ{z,ε}/ε²) = A dz ⊕ (A/ε)dε`; `D(eᶻ)` forced to 0; log point `ℂ·dlog t` | Holds |
| 18 | `complexAlgebraicTopology` | `P¹` strata: `ℂ*` not a subcomplex; node: cone, contractible | Holds |
| 19 | `topologicalCoefficientComparison` | `(0,1)`: `H⁰_c = 0`, `H¹_c = Λ`; `𝔽₃` monodromy −1 on `S¹`: `H⁰ = H¹ = 0` | Holds |
| 20 | `riemannExistence` | `zⁿ`: deck `ℤ/n`; `G_m⊔G_m → G_m`: `π₀` 2/2 | Holds |
| 21 | `artinComparison` | Kummer class ↦ `e^{2πi/n}`; distinguishes the negation at `n = 3` | Holds |
| 22 | `artinComparisonCompactSupport` | `A¹`: `H⁰_c = 0`, `H⁰ = Λ`, `H²_c(Λ(1)) = Λ` | Holds |
| 23 | `relativeArtinComparison` | `(R¹j_*μ_n)₀ ≅ ℤ/n`; skyscraper sum: `1_ℤ` not in the image | Holds |
| 24 | `artinSmoothTrace` | `tr c₁(O(1)) = 1` on `P¹`; `A¹⊔A¹`: `(a,b) ↦ a+b` | Holds |
| 25 | `adicArtinComparison` | `P¹`: `H²` rank 1, trace 1; torsion `⊗ℚ_ℓ = 0` | Holds |

## Not verifiable

These are carried from the previous report; the changed passages add no source citation.

- **Kato,** *Logarithmic structures of Fontaine–Illusie*: the sources service reports "no legal source found".
- **Hironaka,** *Triangulations of algebraic sets*: the sources service reports "no legal source found".
- **Bochnak–Coste–Roy,** Thm. 9.2.1: no open host is known.
- **Dimca,** *Sheaves in Topology*: the DOI resolves only to a paywalled page (uncertified).

## Source issues

- none
