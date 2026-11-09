# Review of ComplexComparisonPartII (pull request #848 at 490f7c9)

**Verdict:** needs changes

This is a full review of a head the previous round (r19) also read. `TauCetiRoadmap/ComplexComparisonPartII/` has 0 changed lines. I read all 5082 README lines and all of `Suggested.lean` again.

- R01 of r19 is not repaired and is carried as R01.
- R02 and R03 are new: a supplier citation and a layer-shape defect that earlier rounds did not report.

## R01 (P2) — The frame-torsor bijection, the holomorphic exponential sequence and the `c₁` identification still have two owners across the open heads

**Location:** `TauCetiRoadmap/ComplexComparisonPartII/README.md:146`: "C5.4 is the single owner, on every complex manifold, of … the frame-torsor bijection from holomorphic line-bundle classes to `H¹(M,O_M^×)`, the holomorphic exponential sequence with its cocycle `δu`, and the identification of its connecting map". The same claim is made at :90–93, :3709–3719 and :4984–4988.

**Claim:** C5.4 is the only owner of these three objects, and K3Surfaces §1.1 takes the bijection from C5.4 (:4984).

**Witness:** ComplexKahlerGeometry #1234 (`06e0a3f7`), README:690–694: "K4.P owns, on every complex manifold, the holomorphic exponential sequence, the isomorphism `Pic_hol(M)≃H¹(M,𝒪×)` and the identification of its connecting map … It supplies this segment … to ComplexComparisonPartII C5.4".

None of the heads involved has moved since r19:

- #1234 `06e0a3f7`
- #1285 `2ddcd6be`
- #1375 `c1d6da06`
- #1186 `be6ed5f4`
- #1398 `b55cf4d8`

I reread every line cited below at those heads.

| Object | Owner named | Where |
| --- | --- | --- |
| Frame-torsor bijection `Pic_hol(M) ≃ H¹(M,O_Mˣ)` | ComplexComparisonPartII C5.4 | this README :91, :146, :3709–3715, :4984 |
| Frame-torsor bijection | ComplexKahlerGeometry K4.P | #1234 README:690–694 |
| Frame-torsor bijection | ComplexKahlerGeometry, through `gap:integral-topology` | #1285 README:156–177 and :403–406 ("no part of that comparison is constructed here"); #1375 README:13 |
| Exponential sequence and `c₁` identification | ComplexComparisonPartII C5.4 | this README; #1285 :412–419; #1375 :13; #1186 :719 |
| Exponential sequence and `c₁` identification | ComplexKahlerGeometry K4.P | #1234 :690–694 and :769–770, used inside #1234 at :2260 |

Two open roadmaps therefore both claim these objects. #1234 also hands the segment to C5.4, while C5.4 says it takes from K4 "only the holomorphic line bundles and their Chern connection" (:146).

- On main (`13665dd`), ComplexKahlerGeometry has 0 occurrences of "exponential sequence", `Pic_hol` or `O^×`. So :146 is true of main.
- The pull-request description still records no settlement.

The single-owner settlement that fits the merge order is unchanged:

- C5.4 is at `ORDER.txt:39`. Every consumer is later: K3Surfaces :134, GeometricQuantization :152, K3SurfacesAndSymplecticBoundedness :314.
- #1234's torus use at :2255–2263 needs only isomorphism classes of K4's line bundles under `⊗`, which ComplexKahlerGeometry can define itself.
- #1234 revises a roadmap on main, so it is not a dependency of this roadmap. ComplexKahlerGeometry precedes this roadmap, so it cannot cite C5.4.

**Repair:** In the pull request's merge-order block, add this paragraph. It edits no file in the folder.

> **Ownership.** ComplexComparisonPartII C5.4 is the single owner, on every complex manifold, of `Pic_hol(M) ≃ H¹(M,O_M^×)` with its tensor, dual and pullback laws, the holomorphic exponential sequence and the identification of its connecting map with the integral first Chern class. ComplexKahlerGeometry on main states none of them. ComplexKahlerGeometry #1234 drops K4.P's ownership claim (README :690–694, :769–770) without citing C5.4, which it precedes; its torus application at :2255–2263 reads isomorphism classes of K4's line bundles directly. K3Surfaces #1285 replaces `gap:integral-topology` (README :156–177, :403–406) by a citation of C5.4. K3SurfacesAndSymplecticBoundedness #1375 re-points README :13 to C5.4.

Tested on the refuting lines: with this paragraph, #1234 :690, #1285 :403 and #1375 :13 are each named together with the edit that makes them cite the one owner, and :4984 then states the settled consumption. If the repair job cannot edit the pull-request description, it should mark R01 `not actionable in this package` and give that reason, because no edit to this folder can remove the claims in #1234 and #1285.

## R02 (P3) — C3.2d.5 cites a ModularCurves declaration that exists nowhere, and attributes a Tau Ceti declaration to ModularCurves

**Location:** `TauCetiRoadmap/ComplexComparisonPartII/README.md:2399`: "use ModularCurves §0B's `FiniteFlatCommGroupScheme.cartierDual` and `cartierDualBaseChangeIso` for scheme-base Cartier duality and its arbitrary-base-change comparison". The same pair appears in the *Needs:* line at :2401.

**Claim:** ModularCurves §0B supplies two declarations with these names: a scheme-base Cartier dual and its arbitrary-base-change isomorphism.

**Witness:** `FiniteFlatCommGroupScheme.cartierDual` occurs nowhere: not in ModularCurves on main, not at the pins, not in the 467 open heads. `cartierDualBaseChangeIso` is pinned Tau Ceti `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDualBaseChangeIso` (`BaseChange.lean:204`), for affine base change only.

The mathematics C3.2d.5 needs is supplied, but under no name:

- ModularCurves §0B on main (README:688, paragraph :748–757) constructs Cartier duality on `TauCeti.AlgebraicGeometry.FiniteFlatCommGroupScheme S` over an arbitrary base scheme, by gluing Tau Ceti's affine dualities along `cartierDualBaseChangeIso`. It proves evaluation, biduality, preservation of rank and arbitrary base change.
- ModularCurves lists `cartierDualBaseChangeIso` among its own Tau Ceti suppliers (README:347–360).
- The dependency is therefore real. Only the two backticked names are wrong, which is supplier drift at locator level.

**Repair:**

1. At :2399, replace "ModularCurves §0B's `FiniteFlatCommGroupScheme.cartierDual` and `cartierDualBaseChangeIso`" with "ModularCurves §0B's Cartier duality on `TauCeti.AlgebraicGeometry.FiniteFlatCommGroupScheme S` over an arbitrary base scheme, with its biduality, rank and arbitrary-base-change comparisons, glued from Tau Ceti's affine `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDualBaseChangeIso`".
2. At :2401, change the *Needs:* entry to "ModularCurves §0B (Cartier duality on `FiniteFlatCommGroupScheme S` over an arbitrary base and its base change); Tau Ceti `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDualBaseChangeIso`".
3. Add that declaration, with its module `TauCeti.AlgebraicGeometry.AffineGroupScheme.CartierDuality.BaseChange`, to *From Tau Ceti (pinned)*.

Tested: every backticked name in the repaired sentences exists, either at the pin (`FiniteFlatCommGroupScheme` in `…/GroupScheme/KilledByRank.lean:83`, `cartierDualBaseChangeIso` at `BaseChange.lean:204`) or as the cited ModularCurves §0B paragraph on main (:754–757). The C3.2d.5 Checks are unaffected: for `M = (ℤ/n)_B` the dual is `μ_n`, which is §0B's `((ℤ/Nℤ)_S)ᴰ ≅ μ_N` at :763.

## R03 (P3) — Two layers do not end with `### Examples` and `### Dependencies`, and C1.9 sits after Layer C1's closing sections

**Location:**

- Layer C-1 (`README.md:891–1092`) has the headings C-1.1–C-1.4 and then `## Layer C0`. It has no `### Examples` and no `### Dependencies`.
- Layer C6 (:4377–4920) has `### Dependencies` at :4907 but no `### Examples`.
- In Layer C1, `### Examples` (:1826) and `### Dependencies` (:1843) are followed by `### C1.9` (:1854–2070).

**Claim:** The README is in the house shape, in which every layer ends with `### Examples` and `### Dependencies`.

**Witness:** These are the README's own headings: `grep -n '^#'` lists :891, :893, :984, :1008, :1067, :1093 for C-1, and :4391–4850 then :4907 for C6. Layer C1's `### Dependencies` (:1843–1852) already lists C1.9's inputs, although C1.9 comes after it.

**Repair:**

1. **Layer C1.** Move C1's `### Examples` and `### Dependencies` (:1826–1852) so they follow C1.9 (after :2069).
2. **Layer C-1.** Before `## Layer C0`, add:
   - `### Examples`, collecting existing instances: the dual-number point (`ε ≠ 0`, one topological point), the doubled origin (non-Hausdorff, not separated), `⊔_{n∈ℕ} A¹` (locally of finite type, not quasi-compact), the node `xy = 0` (both completions `ℂ[[x,y]]/(xy)`), and the `n = b = 2` SNC chart `(Δ*)²`.
   - `### Dependencies`, listing the *Needs:* of C-1.1–C-1.4: ComplexKahlerGeometry K3–K4; RealAnalyticGeometry R3.2 item 0; AlgebraicModuliForArithmeticGeometry Layer 3, §6.1 and §§7.6.1/7.7; SchemeAndStackFoundations Layer 1 (§§1.4–1.5/1.14); ResolutionOfSingularitiesCharacteristicZero §§1.3, 6.2, 6.4; the Mathlib analytic inverse APIs cited at :1077; Tau Ceti `AnalyticAt.exists_openPartialHomeomorph` and `TauCeti.ContDiffOn.exists_openPartialHomeomorph`.
3. **Layer C6.** Before :4907, add `### Examples` collecting the Kummer class on `G_m` with transport `exp(2πi/n)`, `H⁰_c(A¹) = 0`, the `⊔_{n≥1} G_m` cover of unbounded degree, and the trace `(a,b) ↦ a + b` on `A¹ ⊔ A¹`.

Tested: after the repair, `grep -n '^## \|^### Examples\|^### Dependencies'` shows each of the seven layers closing with both headings, in that order.

## Previous findings

- **r19 R01 — not repaired.** README :146 still reads "C5.4 is the single owner …", and :4984 still reads "**K3Surfaces §1.1** … use C5.4's frame-torsor bijection". The folder is byte-identical (`changes.md`: 0 lines), and the pull-request description has no ownership paragraph. The finding is carried as R01.
- No repair report marks R01 `not actionable in this package`, so R01 carries no `Re-raised:` line.

## Verified sound

### Gate, dependency check, Lean

- **Gate.** My run on `490f7c9` exited 0 and printed:

  ```text
  gate ComplexComparisonPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```

  The worker's run on the same head also records `build=0`.
- **Dependency check** (`--movable`), in full. It printed no UPWARD, CYCLE or `moved:` line and exited 0.

  ```text
  depcheck: 239 roadmaps, 2365 edges, 0 problem(s)
  ```

- **Diff scope.** `git diff --stat origin/main...HEAD` outside the folder is empty. No `design/plan.json` is readable, so no gaps are declared.
- **Elaboration.** `lake env lean` on `Suggested.lean` gives exactly four `declaration uses sorry` warnings, at :116, :127, :154 and :172, and exit 0.
- **Signatures.** I elaborated a scratch copy with `#check @` for all four declarations. Every type is identical to the worker's signature file, and no binder is lost:
  - `montelTheorem` keeps `[FiniteDimensional ℂ E]`;
  - `schwartzFiniteness` keeps the complete, metrizable, locally convex, Hausdorff structure on both spaces;
  - `holomorphicPoincare` keeps `IsManifold 𝓘(ℂ, E) ∞ M`;
  - `nonempty_sheafSingularComparison` keeps `LocallyContractibleSpace T`.
- **One-tactic probe.**
  - Copy A replaced each `sorry` by `first | rfl | infer_instance | simp | trivial | aesop`. All four failed (unsolved goals at :121, :136, :164; `aesop` made no progress at :178).
  - Copy B used `exact?`. All four failed.
  - So nothing is padding.
- **Duplication at the pins.** None of the four headlines exists at the pins:
  - Tau Ceti's `TauCeti.montel` (`…/Conformal/Montel/Basic.lean:58`) has `Ω ⊆ ℂ` only.
  - No Schwartz or Sella theorem is present in either library.
  - The Poincaré operator `TauCeti.poincareHomotopy` carries no type or `∂̄` condition.

### Headline theorems

The README table at :45–54 lists 67 headline targets: 6 + 9 + 14 + 2 + 9 + 6 + 14 + 7 across C-1 to C6.

- Four are stated: `montelTheorem`, `schwartzFiniteness`, `holomorphicPoincare` (stalkwise, positive degrees) and `nonempty_sheafSingularComparison`.
- The other 63 are named in the module docstring, layer by layer, each with the carrier it lacks: analytic spaces with nilpotents, analytification, the algebraic-space derived categories, the holomorphic de Rham sheaf complex, log structures, and constructible étale coefficients with the site morphism. The docstring also covers C1.9's curve maps.
- README and Lean agree in generality:
  - :2772–2773 states that the local Poincaré statement needs no finite dimension, Hausdorff or countability hypothesis, which matches Lean's arbitrary normed `E`.
  - :2933–2940 matches `LocallyContractibleSpace`. The pinned definition is the classical null-homotopic-inclusion notion that nLab calls "semilocally contractible" (`Mathlib/Topology/Homotopy/LocallyContractible.lean:44–60`).
- The `Nonempty (≃+)` form of the sheaf–singular comparison is what is statable: the canonical map needs a resolution that is absent at the pins. The README specifies that map at :2937–2944, and the docstring says so.

### Sources: the seeded sample (all 15 targets)

| Target | Source and locator verified | Text lines read |
| --- | --- | --- |
| Riemann surface of a smooth curve | SGA 1 XII Prop. 3.1 (étale, smooth, separated; printed pp. 244–245) and Prop. 3.2 (proper, finite; pp. 245–247) | `sga1` lines 9594–9638, 9639–9700 |
| Curve GAGA as named maps | SGA 1 XII Thm. 4.4, p. 249, proof p. 250; Thm. 4.2 for `f` proper between schemes locally of finite type, p. 248 | `sga1` lines 9738, 9805, 9811–9830 |
| `IsDifferentialOperator` | EGA IV₄ §16.7, printed pp. 36–39; Déf. (16.8.1) p. 39; Prop. (16.8.8) p. 42, whose (a)⇔(b) is the commutator criterion; Prop. (16.8.9) and (16.8.9.2) p. 43 | `ega4-4` lines 1259, 1371–1375, 1489–1499, 1526–1537 |
| `holomorphicConnectionDictionary` | Deligne, LNM 163, I.2.3 (p. 6), Déf. 2.4 (p. 7), 2.7 tensor/Hom/dual (p. 8), 2.8–2.9 horizontal maps (pp. 8–9), 2.13 (p. 11), Prop. 2.16 (p. 12), Prop. 2.19 (p. 13) | IAS copy (`Number9.pdf`, not in the manifest), lines 230, 260, 278–308, 379, 404, 442 |
| `artinDeRhamBetti` | Deligne 1968, Lemme (5.5.3) and (5.5.4), printed p. 124, under (5.5) and (5.5.1): a finite-dimensional local `ℂ`-algebra | Numdam `PMIHES_1968__35__107_0` (not in the manifest), lines 651–701 |
| `CurrentCalculus` | Demailly I (2.1) p. 13, (2.3) p. 14, (2.6) `⟨dT,u⟩ = (−1)^{q+1}⟨T,du⟩` and (2.7) `d[Z] = (−1)^{m−p+1}[∂Z]` p. 15; III (1.1) p. 130, (1.14) p. 133; III (2.2)–(2.3) pp. 138–140 | author's `agbook.pdf` (not in the manifest), lines 505, 538, 599, 617, 6463, 6611, 6885–6928 |
| `realComplexCurrentComparison` | Demailly I (2.1)–(2.7) pp. 13–15; III (1.15) p. 134, (1.21)–(1.22) pp. 135–136, Wirtinger (1.24) p. 136 | same, lines 6671, 6761, 6781, 6818 |
| `analyticSetLocalFiniteMass` | Demailly III (2.5)–(2.6) p. 140: Lelong's local finite mass of `[A_reg]` | same, lines 6990–6997 |
| `complexAlgebraicTopology` | SGA 1 XII §§1–3 (local topology, separatedness). Hironaka and Bochnak–Coste–Roy: see *Not verifiable* | `sga1` lines 9594–9700 |
| `topologicalCoefficientComparison` | Sella: Theorem p. 2, Lemma 0.1 pp. 2–4, Example 0.3 p. 5, nestings p. 6. Hatcher §3.H p. 333: direct cochains are lifts of simplices. Dimca: see *Not verifiable* | arXiv:1602.06674v3 lines 45, 69, 157, 188; `hatcher-at` lines 14576–14584 |
| `riemannExistence` | SGA 1 XII Thm. 5.1, printed p. 251, stated for `X` locally of finite type over `ℂ` | `sga1` lines 9872–9875 |
| The comparison as `IsIso` of a named unit map | SGA 4 XVI Thm. 4.1, p. 638: the diagram of site morphisms `ε` and the comparison morphism. XI Déf. 3.1 and Prop. 3.3, p. 549; Thm. 4.4, p. 552; Var. 4.6, p. 553 | `sga4` lines 24606, 24629, 24767, 24818, 28350–28362 |
| `artinComparisonCompactSupport` | SGA 4 XVII Cor. 5.3.5, p. 705: separated, compactifiable, any torsion sheaf. XVI 4.1(i): `f` proper, any torsion sheaf | `sga4` lines 31745–31747, 28359–28361 |
| `relativeArtinComparison` | SGA 4 XVI 4.1 (i) proper / (ii) constructible, p. 638; XVII Thm. 5.3.3, p. 704, and Var. 5.3.4(i), p. 705 | `sga4` lines 28350–28362, 31733, 31740 |
| `artinSmoothTrace` | SGA 4 XVIII Thm. 2.9 (uniqueness of trace under Var 1–Var 2 …), Prop. 2.10, Thm. 3.2.5 (Poincaré duality) | `sga4` lines 37209–37225, 37405, 38315 |

Further locators read this round, outside the sample:

- SGA 1 XII Prop. 1.3.1 p. 241, Prop. 2.4 p. 243 and Lemme 2.5 p. 244 (lines 9479, 9545, 9581).
- Kleiman Prop. 5.10 p. 41, Prop. 5.20 p. 47 and Thm. 6.16 p. 58 (`kleiman-picard` lines 1983, 2242, 2782).
- Deligne LNM 163, II §5 (lines 3059–3132).

### Adversarial pass (computed this round)

| # | Statement | Instances | Values computed (left / right) | Result |
| --- | --- | --- | --- | --- |
| 1 | `montelTheorem` | `Ω = ∅`; `ℂ²` with `z₁ⁿ` on the unit polydisc; `ℓ²` with `⟨·,e_n⟩` | Vacuous for `Ω = ∅`; `sup_K |z₁|ⁿ → 0`, limit 0; at `x = r e_n`, `|f_n − f_m| = r` for `m ≠ n`, so no subsequence converges | `FiniteDimensional` is needed and present |
| 2 | `schwartzFiniteness` | `ℂ`: `g = id`, `h = −id`; `ℓ²`: `g = id`, `h = −diag(1, 1/2, …)`; `g = 0`, `h = diag(1/n)`; `ℓ²`: `h = −id` | Range `{0}`, codim 1; `diag(0, 1/2, 2/3, …)` has range `{x₁ = 0}`, codim 1; dense non-closed range (`g` not surjective); codim `∞` (`h` not compact) | Both hypotheses used; holds |
| 3 | `holomorphicPoincare` | `ℂ`, `α = dz`; `ℂ`, `dz̄`; `ℂ²`, `dz₁∧dz₂` | `η = ∫₀¹ dz(z) dt = z`, type `(0,0)`; `dz̄` has type `(0,1)` (excluded by `hα`) and radial primitive `z̄`; `η = (z₁dz₂ − z₂dz₁)/2`, type `(1,0)`, `dη = dz₁∧dz₂`; adding `d|z₁|²` creates a `(0,1)` part `z₁dz̄₁` | The type clause on `η` is needed and present |
| 4 | `nonempty_sheafSingularComparison` | point; `∅`; `S¹`, `A = ℤ`; Warsaw circle | `A`/`A`; `0`/`0`; `H¹ = ℤ`/`ℤ`; sheaf `H¹ = ℤ` vs singular `H¹ = 0` (not LC) | Hypothesis needed and present |
| 5 | Riemann surface of a curve | `P¹`; `z ↦ z²` on `G_m` vs `A¹`; nodal cubic; doubled origin | Transition `z ↦ 1/z` on `ℂ*`; derivative `2z ≠ 0` on `ℂ*`, `0` at `0`; gradient `(−3x² − 2x, 2y) = 0` at the node; no disjoint neighbourhoods of the two origins | Smooth and separated both used |
| 6 | Curve GAGA maps | `E: y² = x³ − x`; `P¹`, `D = ∞`; `E ∖ ∞` | `ord_∞ x = −2`, `ord_∞ y = −3`; `∂_x(y² − x³ + x) = 1` at `(0,0)`, so `y` is a parameter and `ord x = 2`; `div x = 2(0,0) − 2∞`, degree 0; sections `a + bz`, dimension 2 = `h⁰(O(1))`, opposite sign gives 0; `Pic = E(ℂ) ≠ 0` vs trivial holomorphic `Pic` | Properness needed; holds |
| 7 | `IsDifferentialOperator` | `ℂ[z]`; `𝔽₂[z]`; `𝔽₃[z]`; `P^m(k[z])` | `[d/dz, z] = id`; `t²`-coefficient of `(z+t)²` is 1 while `(d/dz)²z² = 0`; `t³`-coefficient of `(z+t)⁴` is `4z = z`, and `(d/dz)³ = 0` since `3 ∣ n(n−1)(n−2)`; `k[z₁,z₂]/(z₂−z₁)^{m+1} = A[t]/(t^{m+1})` | Matches EGA (16.8.8) |
| 8 | `holomorphicConnectionDictionary` | `d + z dw` on `ℂ²`; line gauge `g`; left gauge `h = g⁻¹` | Curvature `dA + A∧A = dz∧dw`; `A + g⁻¹dg`; `hAh⁻¹ + h d(h⁻¹) = hAh⁻¹ − (dh)h⁻¹` | All four Checks hold |
| 9 | `artinDeRhamBetti` | `A = ℂ[ε]/ε²`, `X = P¹_A`; `X = Spec A` | `H⁰ = H² = A`, length 2 = `2·1`, `H¹ = 0`; complex `A` in degree 0 | Matches Deligne (5.5.4) |
| 10 | `CurrentCalculus` | `k`-form `α`; `[Z]` with boundary; `ℂ` wedge; `|z|⁻²` | `∫d(α∧η) = 0` gives `∫dα∧η = (−1)^{k+1}∫α∧dη`; `d[Z] = (−1)^{k+1}[∂Z]` with `k = 2n − dim Z`, which is Demailly (2.7); `(a dx + b dy)∧(φ dx + ψ dy) = (aψ − bφ)dx∧dy`; `∫₀^ε r⁻²·2πr dr = ∞` | Holds |
| 11 | `realComplexCurrentComparison` | disc `q = 2`, `n = 1`; segment `q = 1`; `½δ_a` | `(−1)^{2n−q+1} = −1`: `dJ₂[D] = −J₁[∂D]`; `(−1)^2 = +1`: `dJ₁[a,b] = J₀(δ_b − δ_a)`; mass `½`, not integral | Holds |
| 12 | `analyticSetLocalFiniteMass` | line in `ℂ²`; node `xy = 0`; metrics `cg ≤ h ≤ Cg` | `πR²` on `B(0,R)`, infinite in total; `2πR²`, no atom; lengths scale by `√c`, `√C`, so `2d`-volumes scale by `c^d`, `C^d` | Holds |
| 13 | `complexAlgebraicTopology` | `A¹`; `P¹` with strata `{0}`, `{∞}`, `ℂ*`; node; doubled origin | Contractible, noncompact; `ℂ*` is a union of open simplices but not a subcomplex; cone on two circles at the node; non-Hausdorff | Holds |
| 14 | `topologicalCoefficientComparison` | `𝔽₃`, monodromy `−1`; `𝔽₅`, transport 2; `(0,1) ⊂ [0,1]`; `ℤ/2` over `ℤ/4` | `ker(−1 − 1) = ker(−2) = 0`; dual transport `3` (`2·3 ≡ 1`); `0 → H⁰_c → Λ → Λ² → H¹_c → 0` gives `H⁰_c = 0`, `H¹_c = Λ`, against `H¹ = 0`; `Tor_i = ℤ/2` for all `i`, so not perfect | Holds |
| 15 | `riemannExistence` | `z ↦ zⁿ` on `ℂ*`; `⊔_{n≥1} G_m` | Deck group `ℤ/n`; fibre `n` on the `n`-th copy, finite étale with unbounded degree | Locally-finite-type scope = SGA 1 XII 5.1 |
| 16 | `IsIso` of the named unit map | `G_m`, `ℤ/n`, `n ≥ 3`; `Spec ℂ`, `Λ = ℤ/4`, `K = ℤ/2` | Kummer class ↦ torsor with transport `e^{2πi/n}`; the negated isomorphism gives `e^{−2πi/n}`, which differs for `n ≥ 3` (equal for `n = 2`, hence the bound); `K` lies in `Dᵇ_c` but not in ctf | Check correct, including its `n ≥ 3` |
| 17 | `artinComparisonCompactSupport` | `A¹`; `G_m ⊂ A¹`; `Spec ℂ`, `ℤ/2` over `ℤ/4` | `H⁰_c = 0` vs `H⁰ = Λ`; `0 = H⁰_c(A¹) → H⁰(pt) = Λ → H¹_c(G_m) → H¹_c(A¹) = 0` gives `H¹_c(G_m) = Λ` through the connecting map, and `H²_c(G_m) ≅ H²_c(A¹) = Λ(−1)`; identity in degree 0 | Holds |
| 18 | `relativeArtinComparison` | `j: G_m ↪ A¹`, `μ_n`; `K = ⊕_x (i_x)_*Λ` on `A¹`; same on `P¹` | `(R¹j_*μ_n)_0 ≅ ℤ/n`; étale `H⁰` = finitely supported functions, but `1_ℤ` (closed, discrete, infinite) is an analytic section, so the map is not surjective; on `P¹` both sides are finitely supported | Constructibility needed in (i); holds |
| 19 | `artinSmoothTrace` | `A¹ ⊔ A¹ → pt`; `P¹` | `H²_c(Λ(1)) = Λ²`, trace `(a,b) ↦ a + b`, not injective for `n > 1`; `c₁(O(1)) ↦ 1` | Holds |
| 20 | C5.4 bijection and exponential sequence (R01) | `ℂ*`; `P¹`; `O(p − q)` on `E`; `L ⊗ L∨`; Enriques `K` | `H¹(O) = H²(ℤ) = 0` gives `Pic = 0` without compactness; `δ[O(1)] = +1`, and `−1` with `exp(−2πiu)`; `[O(p − q)] ≠ 1` but `δ = 0`; cocycles `u + (−u) = 0`; `δ[K]` is nonzero 2-torsion with zero real image | Mathematics holds; ownership is R01 |
| 21 | C3.2d.5 (R02) | cited names; `M = (ℤ/n)_B`; `M = 0` | `FiniteFlatCommGroupScheme.cartierDual`: 0 hits on main, at the pins and at the open heads; `cartierDualBaseChangeIso` has type `cartierDual S (baseChange G) ≅ baseChange (cartierDual R G)`, affine base; `D(M) = μ_n` = ModularCurves :763; both sheaves terminal for `M = 0` | Mathematics holds; locator is R02 |
| 22 | Layer shape (R03) | headings of C-1, C1 and C6 | C-1: 0 `Examples`, 0 `Dependencies`; C6: 0 `Examples`, 1 `Dependencies`; C1: `Examples` :1826 and `Dependencies` :1843 come before C1.9 :1854 | R03 |
| 23 | C1.3 / C1.4 Gaussian line | `e^{−|z|²}` on `ℂ` and `ℂ²` | `Θ = ∂∂̄|z|² = dz∧dz̄`; `[iΘ,Λ]` on `(p,q)` is `p + q − n`: `−1` on `(0,1)`, `+1` on `(2,1)`, `k` on `(n,k)`, so the bound is `k^{−1/2}`; `(i/2π)dz∧dz̄ = dd_c|z|²` | Holds |
| 24 | C1.7 / C1.8 twists | `P¹`, `k = 2, −2`; two copies of `P¹` glued along `P¹ ∖ {0}` | `binom(3,1) = 3`; `binom(1,1) = 1`, monomial `(Z₀Z₁)⁻¹`; Mayer–Vietoris `0 → ℂ → ℂ² → O(ℂ) → H¹ → 0` gives `H¹(O) = O(ℂ)/ℂ` | Hausdorff needed in Cartan–Serre |
| 25 | C3.2b non-quasi-separated `U` | `A = ∏ℂ`, `M = ⊕_j A` | `Γ(W) = ∏_i e_iM`; the image `{(e_im)_i}` has bounded `j`-support while `(δ_ij)_i` does not, so `H¹ ≠ 0`; for `M = A` the image is all of `∏ℂ` | Holds |
| 26 | C3.2e / C3.2f.1 | Enriques, char ≠ 2; ordinary Enriques, char 2 | `Pic⁰ = 0`, `Pic^τ = ℤ/2`; `μ₂ = Spec k[t]/(t²−1) = k[t]/((t−1)²)` | Holds |
| 27 | C5.6 strip, monodromy, lattices | `−1/4`; `3/4 + 3/4`; `1/4`; trivial `G_m`, frames `z⁻¹`, `z`, global `z⁻¹` | `3/4`; `1/2`; `e^{−πi/2} = −i`; `O(1)` terms with matrix `diag(0, −1)`, so `H⁰ = H¹ = ℂ`; `O(−1)` terms, acyclic; `O` terms with differential `−1`, acyclic | Holds |
| 28 | C5.7 residues | `dz/z` on `G_m`; `a dz/z + b dz/(z−1)` | Residues `(1, −1)`, periods `(2πi, −2πi)`; `a + b − (a+b) = 0` | Holds |
| 29 | C4.1 images | `(x,y) ↦ (x,xy)` | Image `{x ≠ 0} ∪ {(0,0)}`, not closed | Properness needed |

### Citations, ownership and order

- **Tau Ceti names.** All 93 backticked `TauCeti.*` names resolve at pin `2fd255d9`.
- **Mathlib names.** More than 35 Mathlib names checked at pin `1b1ccf4b` resolve. Among them: `AddSubmonoid.NSMulSaturated` is the `to_additive` form of `Submonoid.PowSaturated` (`GroupTheory/Subgroup/Saturated.lean:31`); `KaehlerDifferential.ideal` is at `RingTheory/Kaehler/Basic.lean:62`; `Laplacian.laplacian` is at `Analysis/Distribution/DerivNotation.lean:268–270`; `Manifold.IsSubmersion`, `Bundle.Trivialization.pullback` and `ChartedSpace.locallyRingedSpace` are also present.
- **Citation-tool leads.** All 39 leads are supplier target names:
  - every `VanishingCycles.*` and `ClassicalAlgebraic.*` name is in EtaleCohomologyFoundations on main, with §0.7 at :441, §0.8 at :567 and §0.11 at :1159;
  - `ClassicalDerived.*` is in EnhancedDerivedSheaves :30, E1.9 at :1057 and E3.2 at :1167;
  - `spaceDQCoh.*`, `ModuliDescent.*`, `ParameterFormalExports` and `universalFlatteningProperSupport` are in AlgebraicModuliForArithmeticGeometry #853;
  - `DeRham.d_leibniz` is in DerivedDeRhamCohomology;
  - `TauCeti.Analysis.Fredholm.CompactPerturbation` is an existing module.
- **Other supplier names on main.** `perfectInverseSystemEffectivity` (DerivedModuleAlgebra :2202), `cechSingularCWTypeComparison` (CharacteristicClasses :640) and `finite_semialgebraic_triangulation` (AffineMorseLefschetz :950) resolve. The one name that does not resolve is R02.
- **Overlaps.** No other pull request changes this roadmap. No cited id is dropped, and none is defined only by an open revision.
- **Ownership of headlines.** No other `Suggested.lean` declares any of the four headlines.
- **FormalConnectionsOpers (#1056, `19335eca`).** It consumes C5.1's order predicate (README :610, :677) and no longer declares `IsDifferentialOperator`.
- **#196.** bwangpj's `ComplexComparison` (`4bd7237`) duplicates C-1.1 and C6. It is not in `ORDER.txt` and depends on CohomologicalPointCounting, which this roadmap may never cite. So this roadmap is the admissible owner, as recorded in r14 and r17.
- **AlgebraicModuliForArithmeticGeometry and CrystallineCohomology.** Their mentions of this roadmap are boundary statements, not consumption.
- **Main.** It moved from `35884a8` to `13665dd`, but only through CI files and the ComplexManifolds progress report. ComplexKahlerGeometry still has 0 exponential-sequence hits, so :146 is true.
- **Merge order.** This roadmap is at `ORDER.txt:39`. Its open suppliers DerivedDeRhamCohomology, CrystallineCohomology and AlgebraicModuliForArithmeticGeometry precede it, and EtaleCohomologyFoundations (:42) is on main.
- **Shape and policy.**
  - Every definition I sampled has at least three Checks, among them all the C5.5 log objects, `RegularSingular`, `CanonicalLogExtension`, `CurveLogComplex`, `SmallSingularCochains`, `sncPolydiscChart` and the C0 carriers.
  - I found no LaTeX, `lemma`, pull-request number, process word, copied passage, algorithm, `set_option` or sorry'd data.
  - The old → new line at :377–379 is the permitted renaming record.
- **Carried from r17, not reread.** Milne §21, Bhatt–Scholze §§6.5–6.8, Freitag and the Stacks tags are outside this round's sample; their r17 verification carries.

## Not verifiable

- **Kato**, *Logarithmic structures of Fontaine–Illusie* (C5.5): no legal copy; the JHU Press volume is not open.
- **Dimca**, *Sheaves in Topology* (C6.1, part of the seeded `topologicalCoefficientComparison`): paywalled (Springer).
- **Hironaka**, *Triangulations of algebraic sets*, and **Bochnak–Coste–Roy**, Thm. 9.2.1 (C6.0, part of the seeded `complexAlgebraicTopology`): no open host found; paywalled.
- **Kleiman's published numbering "9.6.16"** (C3.2e): the AMS chapter is paywalled. The arXiv Theorem 6.16 on p. 58 was verified.

## Source issues

- **Misprint** in Deligne, LNM 163 at II.5.3, printed p. 94: the paragraph introducing the section `τ` of `ℂ → ℂ/ℤ` is numbered 4.3, inside §5 between 5.2 and Proposition 5.4; it should be numbered 5.3, as Proposition 5.4 and equation (5.3.1) refer to it; affects nothing.
