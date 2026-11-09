# Review of ComplexComparisonPartII (pull request #848 at 03e34bc)

**Verdict:** needs changes

This is an incremental re-review of the 133 lines that changed in `TauCetiRoadmap/ComplexComparisonPartII/README.md` since `490f7c9`. `Suggested.lean` is unchanged (`git diff --stat 490f7c9 HEAD` on it is empty), and no file outside the folder changed.

- R02 and R03 of the previous report are repaired, and the repairs introduce no new defect.
- R01 is still not repaired. Its repair is a paragraph in the pull-request description, not an edit to the folder. It is carried below as R01.

## R01 (P2) — The frame-torsor bijection, the holomorphic exponential sequence and the `c₁` identification still have two owners across the open heads

**Location:** `TauCetiRoadmap/ComplexComparisonPartII/README.md:146`: "C5.4 is the single owner, on every complex manifold, of … the frame-torsor bijection from holomorphic line-bundle classes to `H¹(M,O_M^×)`, the holomorphic exponential sequence with its cocycle `δu`, and the identification of its connecting map". The same claim is at :91 and :5057 ("**K3Surfaces §1.1** and **GeometricQuantization §3.3** use C5.4's frame-torsor bijection").

**Claim:** C5.4 is the only owner of these objects, and its consumers take the bijection from C5.4.

**Witness:** ComplexKahlerGeometry #1234 (`06e0a3f7`, unchanged), README:690–694: "K4.P owns, on every complex manifold, the holomorphic exponential sequence, the isomorphism `Pic_hol(M)≃H¹(M,𝒪×)` and the identification of its connecting map … It supplies this segment … to ComplexComparisonPartII C5.4".

K3Surfaces #1285 has moved from `2ddcd6be` to `920b5227`, but the conflict is unchanged:

- **#1285 at `920b5227`:** README:184–205 still requests the frame-torsor isomorphism from ComplexKahlerGeometry as `gap:integral-topology`. README:431–435 still says "no part of that comparison is constructed here".
- **K3SurfacesAndSymplecticBoundedness #1375 (`c1d6da06`):** README:13 still routes the comparison through "K3Surfaces' contract with ComplexKahlerGeometry".
- **ComplexKahlerGeometry on main (`373d88d`):** 0 hits for "exponential sequence", `Pic_hol` or `𝒪×`. So :146 is true of main.
- **The pull-request description:** still has no ownership paragraph.

The objects therefore still have two owners across the open heads, and #1234 still hands the segment to C5.4. No repair report marks this finding `not actionable in this package`, so it carries no `Re-raised:` line.

**Repair:** unchanged from the previous report. In the pull request's merge-order block, add this paragraph. It edits no file in the folder.

> **Ownership.** ComplexComparisonPartII C5.4 is the single owner, on every complex manifold, of `Pic_hol(M) ≃ H¹(M,O_M^×)` with its tensor, dual and pullback laws, the holomorphic exponential sequence and the identification of its connecting map with the integral first Chern class. ComplexKahlerGeometry on main states none of them. ComplexKahlerGeometry #1234 drops K4.P's ownership claim (README :690–694, :769–770) without citing C5.4, which it precedes; its torus application reads isomorphism classes of K4's line bundles directly. K3Surfaces #1285 replaces `gap:integral-topology` (README :184–205, :431–435) by a citation of C5.4. K3SurfacesAndSymplecticBoundedness #1375 re-points README :13 to C5.4.

Tested on the refuting lines: with this paragraph, #1234 :690, #1285 :184 and :431, and #1375 :13 are each named together with the edit that makes them cite the one owner. :5057 then states the settled consumption. If the repair job cannot edit the pull-request description, it should mark R01 `not actionable in this package` and give that reason.

## Previous findings

- R01 — not repaired: README :146 still reads "C5.4 is the single owner, on every complex manifold, of … the frame-torsor bijection", #1234 :690 still claims K4.P owns it, and the description adds no ownership paragraph. Carried as R01.
- R02 — repaired: :2457 now reads "use ModularCurves §0B’s Cartier duality on `TauCeti.AlgebraicGeometry.FiniteFlatCommGroupScheme S` over an arbitrary base scheme `S`, with its biduality, rank and arbitrary-base-change comparisons, which §0B glues from Tau Ceti’s affine dualities along `…cartierDualBaseChangeIso`". :2459 and :704–716 were updated to match.
- R03 — repaired: C-1 closes with `### Examples` :1116 and `### Dependencies` :1133 before `## Layer C0` :1143; C1's closers :2093 and :2115 now follow C1.9 (:1876); C6 has `### Examples` :4965 before `### Dependencies` :4980.

## Verified sound

### Gate, dependency check and Lean

- **Gate.** My run on `03e34bc` exited 0. The worker's run on the same head also records `build=0`.

  ```text
  gate ComplexComparisonPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```

- **Dependency check** (`--movable`), in full. It printed no UPWARD, CYCLE or `moved:` line. This roadmap is at `ORDER.txt:39`. ModularCurves, the supplier the repaired C3.2d.5 cites, is on main.

  ```text
  depcheck: 239 roadmaps, 2365 edges, 0 problem(s)
  ```

- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with exactly four `declaration uses sorry` warnings, at :116, :127, :154 and :172.
- **Signatures.** I elaborated `#check @` for all four declarations in one scratch file. The types are identical to the worker's signature file and to r20. The binders are kept: `[FiniteDimensional ℂ E]` (`montelTheorem`), `[CompleteSpace F]` and the rest of the Fréchet structure (`schwartzFiniteness`), `IsManifold 𝓘(ℂ,E) ∞ M` (`holomorphicPoincare`) and `LocallyContractibleSpace` (`nonempty_sheafSingularComparison`).
- **Headlines and padding.** The file is unchanged, so r20's account carries:
  - 4 of the 67 headline targets are stated;
  - the other 63 are named in the docstring with the carrier each lacks;
  - the one-tactic probes (`first | rfl | infer_instance | simp | trivial | aesop`, and `exact?`) close none of the four.
- **Diff scope.** `git diff --stat origin/main...HEAD` outside the folder is empty. Added lines contain no process word, pull-request number, LaTeX or copied passage.

### Library declarations opened at the pins (for the new *From Tau Ceti* entries, :694–716)

| Declaration (pin) | File:line | What it states, compared with the README |
| --- | --- | --- |
| `AnalyticAt.exists_openPartialHomeomorph` (Tau Ceti `2fd255d9`) | `TauCeti/Analysis/Analytic/Inverse.lean:106`, variables :59–61 | `NontriviallyNormedField 𝕜`, `[CompleteSpace E]`; gives `⇑Θ = f`, `a ∈ Θ.source ⊆ s`, `AnalyticOnNhd 𝕜 f Θ.source` and `AnalyticOnNhd 𝕜 Θ.symm Θ.target`. This matches :694–698. |
| `TauCeti.ContDiffOn.exists_openPartialHomeomorph` | `TauCeti/Analysis/Calculus/InverseFunctionTheorem.lean:153`, variables :144–147 | `RCLike 𝕂`, `[CompleteSpace E]`, `IsOpen s`, `a ∈ s`, `1 ≤ n`; gives `ContDiffOn 𝕂 n Θ.symm Θ.target` with source in `s`. This matches :699–703 ("over `ℝ` or `ℂ`"). |
| `TauCeti.AlgebraicGeometry.FiniteFlatCommGroupScheme` | `TauCeti/AlgebraicGeometry/GroupScheme/FiniteFlat.lean:58–72` | Fields `IsFinite`, `Flat`, `LocallyOfFinitePresentation` of `structureMap`, `GrpObj` and `IsCommMonObj` in `Over S`. This matches :705–707. |
| `TauCeti.FiniteLocallyFreeBicommutativeHopfAlgCat.cartierDuality` | `TauCeti/Algebra/HopfAlgebra/FiniteDual/CartierDuality/Basic.lean:304` | `(…HopfAlgCat k)ᵒᵖ ≌ …HopfAlgCat k` over `[CommRing k]`; inverse `dualFunctor.rightOp` (:316–319). This matches :708–711. |
| `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDualBaseChangeIso` | `TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/BaseChange.lean:204` | `cartierDual S ((baseChangeFunctor R S).obj G) ≅ (baseChangeFunctor R S).obj (cartierDual R G)`. `baseChangeFunctor` is pullback along `Spec S ⟶ Spec R` (`TauCeti/Algebra/AlgebraicGroup/CommHopfAlgCat/BaseChange.lean:113`). This matches :712–714. |
| `TauCeti.holomorphicSheaf` (C-1 Dependencies) | `TauCeti/Analysis/Complex/HolomorphicSheaf.lean:177` | `TopCat.Sheaf (Type) (TopCat.of ℂ)`, as used at :927. |
| Mathlib `OpenPartialHomeomorph.hasFPowerSeriesAt_symm`, `OpenPartialHomeomorph.analyticAt_symm'`, `AnalyticAt.hasStrictFDerivAt` (Mathlib `1b1ccf4b`) | `Analysis/Analytic/Inverse.lean:657`, `Analysis/Calculus/FDeriv/Analytic.lean:422`, `:145` | These are the "analytic inverse APIs cited in §C-1.4" that the new C-1 *Dependencies* names. |

### Cross-roadmap citations resolved in the changed text

- **ModularCurves §0B on main (`373d88d`).** README:688 heads §0B. Lines :748–757 construct Cartier duality on `FiniteFlatCommGroupScheme S` over an arbitrary base by gluing the affine dualities along `cartierDualBaseChangeIso`, and prove evaluation, biduality, rank and arbitrary base change. That is exactly what :2457 and :2459 now say.
- **C1 *Dependencies* (:2122–2127) against C1.9's *Needs:*.** The items are §C-1.2 `complexSpaceAnalytification` and `completedAnalyticStalkComparison` (:1886, :1905), AlgebraicModuliForArithmeticGeometry §2.3 `devissageViaChow` (:1895), §3.5 `ModuliDescent.coherentPresentationDescent` and §7.7 (:1905), and SchemeAndStackFoundations §2.6 (:1886) and §4.12 (:1895, :1905). The Tau Ceti analytic inverse is at :1947. All 8 items match.
- **C-1 *Dependencies* (:1135–1141) against the seven *Needs:* lines of C-1.1–C-1.4** (:930, :949, :996, :1029, :1059, :1082, :1114). Every supplier section and declaration named there is listed, and nothing extra is.
- **Citation-tool leads.** The 39 leads are the same 39 names that r20 resolved, all in untouched text. None comes from a changed line, and the old unresolved `FiniteFlatCommGroupScheme.cartierDual` is gone.
- **Anchors.** The new `### Examples` heading in C-1 shifts GitHub's numbered `#examples-N` anchors. `roadmaps grep 'ComplexComparisonPartII/README\.md#(examples|dependencies)'` finds no link to them on main or at any open head.
- **Overlaps.** No other pull request changes this roadmap. No cited id is dropped, and none is defined only by an open revision.

### Sources rechecked where the changed Examples rest on seeded targets

- `riemannExistence`: `sga1` lines 9872–9875, SGA 1 XII Thm. 5.1 for `X` locally of finite type. This is the scope of the `⊔_{n≥1} G_m` example.
- "The Riemann surface of a smooth complex curve": `sga1` lines 9594–9600, Prop. 3.1, for morphisms of `ℂ`-schemes locally of finite type.
- `relativeArtinComparison` and the comparison as `IsIso` of a named unit map: `sga4` lines 28350–28362, XVI Thm. 4.1, cases (i) `f` proper and (ii) `F` constructible. This covers the `R¹j_*μ_n` example (`μ_n` constructible).
- `artinComparisonCompactSupport`: `sga4` lines 31745–31747, XVII Cor. 5.3.5, for separated compactifiable `X` and a torsion sheaf. This covers `H⁰_c(A¹, Λ) = 0`.
- The other seeded targets (`IsDifferentialOperator`, `holomorphicConnectionDictionary`, `artinDeRhamBetti`, `CurrentCalculus`, `realComplexCurrentComparison`, `analyticSetLocalFiniteMass`, the cotangent/log differentials, `complexAlgebraicTopology`, `topologicalCoefficientComparison`, `artinComparison`) sit in untouched text. Their verification in r20 carries, with the locators listed there.

### Adversarial table

New rows, computed this round for each changed statement:

| # | Statement (changed) | Instances | Values computed (left / right) | Result |
| --- | --- | --- | --- | --- |
| N1 | Tau Ceti analytic IFT contract (:694–698) | `f(z) = 2z + z²` at 0 over `ℂ`; `f(z) = z²` at 0 | `f′(0) = 2`, a CLE; inverse `w ↦ −1 + √(1+w)` with derivative `1/2` at 0, analytic. `f′(0) = 0` is not a CLE, so the hypothesis excludes it | The contract wording matches the pinned signature |
| N2 | Tau Ceti `C^n` IFT contract (:699–703) | `g(x) = x + x³` on `ℝ`, `s = ℝ`, `n = ∞`; `n = 0` | `g′(0) = 1`, inverse `C^∞` on the whole target; `1 ≤ n` excludes `n = 0`, as `hn0` in the proof uses | Matches |
| N3 | Cartier contracts (:704–716) | `G = (ℤ/n)_R`; base change `R → R′`; wrong direction `Spec R ⟶ Spec R′` | Hopf algebra `R^{ℤ/n}`, dual `R[t]/(tⁿ − 1)`, which is `μ_n`; `(μ_{n,R})_{R′} = μ_{n,R′}` = dual of `(ℤ/n)_{R′}`; the reversed pullback does not typecheck against `baseChangeFunctor R S` | Matches; base-change direction pinned |
| N4 | C3.2d.5 route and *Needs:* (:2457, :2459) | `M = (ℤ/n)_B`; `M = 0`; cited names | `D(M) = μ_n` = ModularCurves :763; `D(0) = 0`, terminal; all 4 backticked names resolve (FiniteFlat.lean:58, BaseChange.lean:204, Basic.lean:304, ModularCurves :748–757) | R02 repaired |
| N5 | C-1 Example: dual-number point (:1118–1120) | `Spec ℂ[ε]/(ε²)`; endomorphisms `id`, `ε ↦ 0` | 1 point; `ε ≠ 0`, `ε² = 0`; completion `ℂ[ε]/(ε²)`; `id(ε) = ε ≠ 0 = (ε ↦ 0)(ε)` over the one map of points | Holds; agrees with Checks :961, :1001, :1025 |
| N6 | C-1 Example: local rings and node (:1121–1124) | `exp(z)` at 0; `xy = 0` | If `exp = p/q` with `q(0) ≠ 0`, then `q·exp = p`, which is impossible for polynomials, so `exp ∉ ℂ[z]_(z)` but `exp ∈ ℂ{z}`; both completions `ℂ[[z]]`; `m/m²` of `ℂ[[x,y]]/(xy)` has basis `x, y`, dimension 2 | Holds; agrees with :1024, :1026 |
| N7 | C-1 Examples: doubled origin, `⊔ A¹` (:1125–1128) | Neighbourhoods `D(0,ε)` of the two origins; `⊔_{n∈ℕ} A¹` | The two discs meet in `D(0,ε) ∖ {0} ≠ ∅` for every `ε`, so the space is non-Hausdorff; countably many affine components, not quasi-compact; analytification `⊔_{n∈ℕ} ℂ` | Holds; agrees with :1017, :1063–1070 |
| N8 | C-1 Example: SNC chart (:1129–1131) | `n = b = 2`, `xy = 0`; `(u,v) ↦ (u + v², v)` | Complement `{x ≠ 0} ∩ {y ≠ 0} = (Δ*)²`, not `Δ² ∖ {0}`; the composite is `(u + v² − v², v) = (u, v)`, both ways | Holds; agrees with :1110–1111 |
| N9 | C1 Example: Picard comparison (:2109–2113) | `P¹`, `O(±1)`; `E ∖ {∞}`, `E` elliptic; negated degree | `h⁰(O(1)) = 2`, `h⁰(O(−1)) = 0`, so the map is `+deg`; the negative would send `O(1)` to a class with `h⁰ = 0`; `Pic(E∖∞) = Pic(E)/ℤ[∞] ≅ Pic⁰(E) = E(ℂ)` since `deg[∞] = 1`; on the noncompact surface `H¹(O) = H²(ℤ) = 0`, so holomorphic `Pic = 0` | Holds; agrees with :2082–2091 |
| N10 | C1 and C-1 *Dependencies* (:1135–1141, :2117–2127) | Item-by-item against the twelve *Needs:* lines | C-1: 7 *Needs:* lines, every item listed, 0 extra; C1.9: 5 *Needs:* lines, 8 supplier items, all listed | Complete |
| N11 | C6 Example: Kummer class (:4967–4970) | `G_m`, `ℤ/n`; positive loop; `j : G_m ↪ A¹` | `H¹(ℂ*, ℤ/n) = Hom(ℤ, ℤ/n) = ℤ/n`; transport `e^{iθ/n}` at `θ = 2π` is `e^{2πi/n}`, giving `1` under `ζ_n`; `(R¹j_*μ_n)_0 = H¹(Δ*, μ_n) = μ_n ≅ ℤ/n` (étale side `K^×/K^{×n}`, generated by `z`) | Holds; agrees with r20 row 16 (`n ≥ 3` sign Check) |
| N12 | C6 Examples: compact support, cover, trace (:4971–4975) | `A¹`; `⊔_{n≥1} G_m`; `A¹ ⊔ A¹ → pt`; `P¹` | `H⁰_c(A¹) = 0`, `H⁰(A¹) = Λ`, `H²_c(A¹, Λ(1)) = Λ`; fibre sizes `1, 2, 3, …` (finite étale, degree unbounded); `H²_c = Λ²`, trace `(a,b) ↦ a + b`; `deg O(1) = 1` | Holds; agrees with r20 rows 15, 17, 19 |
| N13 | C6 Example: local system and Tor (:4976–4978) | `𝔽₃`, monodromy `−1`; `ℤ/2` over `ℤ/4` | Invariants `ker(−1 − 1) = ker(−2) = ker(1) = 0` in `𝔽₃`; resolution `⋯ →2→ ℤ/4 →2→ ℤ/4 → ℤ/2`, which tensored with `ℤ/2` has zero maps, so `Tor_i = ℤ/2` for all `i` | Holds; agrees with r20 row 14 |
| N14 | Layer shape (R03) | `grep -n '^## \|^### Examples\|^### Dependencies'` | C-1 :1116/:1133; C0 :1460/:1473; C1 :2093/:2115 (after C1.9 :1876); C2 :2186/:2197; C3 :2549/:2560; C4 :2723/:2737; C5 :4409/:4419; C6 :4965/:4980. That is 8 of 8 layers | R03 repaired |
| N15 | C5.4 ownership (R01) | #1234 :690; #1285 :184, :431; #1375 :13; main CKG; description | K4.P claims ownership; `gap:integral-topology` asks ComplexKahlerGeometry for the bijection; main has 0 hits; the description has no ownership paragraph | R01 |

Rows carried from the previous report `PRREVIEW-ComplexComparisonPartII~20.md` (statements untouched by this diff; computed values there):

| r20 row | Statement | Key values (r20) |
| --- | --- | --- |
| 1 | `montelTheorem` | `ℓ²`, `⟨·,e_n⟩`: `‖f_n − f_m‖ = r` at `r e_n`, no convergent subsequence; `FiniteDimensional` needed |
| 2 | `schwartzFiniteness` | `ℓ²`, `h = −id`: codimension `∞`; `g = 0`: range dense, not closed |
| 3 | `holomorphicPoincare` | `ℂ²`, `dz₁∧dz₂`: `η = (z₁dz₂ − z₂dz₁)/2` of type `(1,0)` |
| 4 | `nonempty_sheafSingularComparison` | Warsaw circle: sheaf `H¹ = ℤ`, singular `H¹ = 0` |
| 5 | Riemann surface of a smooth curve (seeded) | nodal cubic gradient `0` at node; doubled origin non-Hausdorff |
| 6 | Curve GAGA maps | `div x = 2(0,0) − 2∞` on `y² = x³ − x`; `D = ∞` gives dimension 2 |
| 7 | `IsDifferentialOperator` (seeded) | `𝔽₂`: `(z+t)²` gives `t²`-coefficient 1, while `(d/dz)²z² = 0` |
| 8 | `holomorphicConnectionDictionary` (seeded) | curvature of `d + z dw` is `dz∧dw` |
| 9 | `artinDeRhamBetti` (seeded) | `P¹_{ℂ[ε]}`: `H⁰ = H² = A`, length 2 |
| 10 | `CurrentCalculus` (seeded) | `d[Z] = (−1)^{k+1}[∂Z]`; `∫₀^ε r⁻²·2πr dr = ∞` |
| 11 | `realComplexCurrentComparison` (seeded) | `dJ₂[D] = −J₁[∂D]` |
| 12 | `analyticSetLocalFiniteMass` (seeded) | line in `ℂ²` has mass `πR²` on `B(0,R)` |
| 13 | `complexAlgebraicTopology` (seeded) | `ℂ*` in `P¹` is a union of open simplices, not a subcomplex |
| 14 | `topologicalCoefficientComparison` (seeded) | `𝔽₃`, `−1`: `H⁰ = 0`; `Tor_i = ℤ/2` for all `i` |
| 15 | `riemannExistence` (seeded) | `⊔ G_m`, fibre `n` on the `n`-th copy |
| 16 | `IsIso` of the named unit map (seeded) | transport `e^{2πi/n}` vs `e^{−2πi/n}`, distinct for `n ≥ 3` |
| 17 | `artinComparisonCompactSupport` (seeded) | `H¹_c(G_m) = Λ`, `H²_c(G_m) = Λ(−1)` |
| 18 | `relativeArtinComparison` (seeded) | `1_ℤ` on `A¹` analytic but not étale-finite: constructibility needed |
| 19 | `artinSmoothTrace` | `A¹ ⊔ A¹`: trace `(a,b) ↦ a + b`; `c₁(O(1)) ↦ 1` |
| 20 | C5.4 bijection and exponential sequence | `δ[O(1)] = +1`; Enriques `δ[K]` nonzero 2-torsion |
| 23–29 | C1.3–C1.8, C3.2b, C3.2e–f, C5.6–C5.7, C4.1 | as tabulated in r20 (Gaussian `[iΘ,Λ]`, `binom(3,1) = 3`, `∏ℂ` counterexample, `μ₂` in char 2, residues `(1,−1)`, image of `(x,xy)`) |

The remaining seeded target, "Analytic cotangent and logarithmic differentials", is untouched and was covered by r17 and r20 (C5.5 log objects with at least three Checks each).

### Remark on untouched text (no change requested in this round)

- ModularCurves, which C3.2d.5 consumes (:2457, :2459), has no bullet under *From TauCetiRoadmap roadmaps* (:718–811) and no row in the scope table. The new *From Tau Ceti* entry at :715–716 names its §0B.

## Not verifiable

These are carried from r20. None of them is cited in the changed lines:

- **Kato**, *Logarithmic structures of Fontaine–Illusie* (C5.5): no legal copy.
- **Dimca**, *Sheaves in Topology* (part of `topologicalCoefficientComparison`): paywalled (Springer).
- **Hironaka**, *Triangulations of algebraic sets*, and **Bochnak–Coste–Roy**, Thm. 9.2.1 (part of `complexAlgebraicTopology`): no open host found.
- **Kleiman's published numbering "9.6.16"** (C3.2e): the AMS chapter is paywalled. The arXiv Theorem 6.16 was verified in r20.

## Source issues

- none
