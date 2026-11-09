# Review of ComplexComparisonPartII (pull request #848 at 0dec244)

**Verdict:** needs changes

This is an incremental re-review of the 29 README lines changed since `c051258` (19 added, 10 removed). The changes are:

- the UniversalCovers scope bullet (:300–303);
- a new From-Mathlib bullet for `FundamentalGroupoid` and `IsCoveringMap.monodromyFunctor` (:528–531);
- the UniversalCovers supplier contract (:930–933);
- a sentence in `realComplexCurrentComparison` on G1's Riemannian metric (:3623–3625);
- the C6.1 *Needs:* line (:4644);
- the carrier wording of Worked example 2 (:5058–5060).

`Suggested.lean` is unchanged (`git diff c051258 HEAD` touches only the README). No file outside the folder changed. The diff answers the three remarks of the previous review. Two of the answers are correct. The third, Worked example 2, introduces R02. R01 is not addressed and is carried.

## R01 (P2) — The frame-torsor bijection, the holomorphic exponential sequence and the `c₁` identification still have two owners across the open heads

**Location:** `TauCetiRoadmap/ComplexComparisonPartII/README.md:146`: "C5.4 is the single owner, on every complex manifold, of … the frame-torsor bijection from holomorphic line-bundle classes to `H¹(M,O_M^×)`, the holomorphic exponential sequence with its cocycle `δu`". The same claim appears at :91 and :5111.

**Claim:** C5.4 is the only owner of these objects, and its consumers take them from C5.4.

**Witness:** the other pull requests are unchanged at the heads the previous review read.

- **ComplexKahlerGeometry #1234 (`682823d`):** README :731–735 says that K4.P owns the exponential sequence and `Pic_hol(M)≃H¹(M,𝒪×)`, and supplies them "to ComplexComparisonPartII C5.4". :826 repeats the claim.
- **K3Surfaces #1285 (`920b522`):** :15–16 says the comparison "belongs to ComplexKahlerGeometry", and :184–188 states it as `gap:integral-topology`.
- **K3SurfacesAndSymplecticBoundedness #1375 (`c1d6da0`):** :13 says the same.

The pull-request description still has no ownership paragraph. No repair report marks R01 `not actionable in this package`.

**Repair:** unchanged from the previous review. Add the following paragraph to the merge-order block of the pull-request description. It edits no file in the folder, because ComplexKahlerGeometry on main has no K4.P and a revision cannot be a supplier.

> **Ownership.** ComplexComparisonPartII C5.4 is the single owner, on every complex manifold, of `Pic_hol(M) ≃ H¹(M,O_M^×)` with its tensor, dual and pullback laws, the holomorphic exponential sequence and the identification of its connecting map with the integral first Chern class. ComplexKahlerGeometry on main states none of them. ComplexKahlerGeometry #1234 drops K4.P's ownership claim (README :731–735, :826) and reads isomorphism classes of K4's line bundles directly. K3Surfaces #1285 replaces `gap:integral-topology` (README :15–16, :184, :434) by a citation of C5.4. K3SurfacesAndSymplecticBoundedness #1375 re-points README :13 to C5.4.

**Tested** on the refuting lines: with this paragraph, #1234 :731 and :826, #1285 :15, :184 and :434, and #1375 :13 are each named together with the edit that makes it cite the one owner. If the repair job cannot edit the description, it should mark R01 `not actionable in this package` and give that reason.

## R02 (P3) — Worked example 2's carrier has no dimension, and a K3 surface satisfies it

**Location:** `README.md:5058–5059`: "For an elliptic curve `E` over `ℂ`, taken as a proper smooth connected genus-one `ℂ`-scheme with a marked rational point".

**Claim:** this description determines the elliptic curves, and the example's values (`h⁰(Ω¹) = 1`, `H¹(E^an, ℤ)` free of rank two with an alternating form, a group law for isogenies) hold for every scheme it admits.

**Witness:** genus is a curve invariant, and the description never says dimension one. Take the Fermat quartic `X : x⁴+y⁴+z⁴+w⁴ = 0` with the point `[1:ζ:0:0]`, where `ζ⁴ = −1`. It is proper, smooth and connected, with `K_X ≅ O`. Its geometric genus is `p_g = 1`, and since `χ(O_X) = 2` its arithmetic genus is `p_a = 1`. But `h⁰(X, Ω¹) = 0` and `H¹(X^an, ℤ) = 0`.

**Repair:** replace the description by "taken as a proper smooth connected `ℂ`-scheme of dimension one with `dim H¹(E, O_E) = 1` and a marked `ℂ`-point".

**Tested:**

- The quartic `X` has dimension two and is excluded.
- `E × P¹` has dimension two and is excluded. It has `h¹(O) = 1` and `H¹ = ℤ²`, but its cup product `H¹ × H¹` lands in `H²` rather than the top degree `H⁴`, and it has no group law.
- `y² = x³ − x` with its point at infinity is included. It has dimension one and `h¹(O) = 1`, so `h⁰(Ω¹) = 1` by Serre duality, and `H¹ = ℤ²` with form matrix `[[0,1],[−1,0]]`.

## Previous findings

- R01 — not repaired: README :146 still reads "C5.4 is the single owner, on every complex manifold, of … the frame-torsor bijection". #1234 at `682823d` :731 still supplies "this segment … to ComplexComparisonPartII C5.4". The description has no ownership paragraph.

## Verified sound

### Gate, dependency check and Lean

- **Gate.** My run on `0dec244` exited 0. The worker's `gate.md` records the same result.

  ```text
  gate ComplexComparisonPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```

- **Dependency check** (`--movable`), in full. It printed no UPWARD, CYCLE or `moved:` line. This roadmap is at `ORDER.txt:39`. UniversalCovers (`Completed/`) and GeometricCurrents are on main, and `roadmaps list` shows no open pull request changing either.

  ```text
  depcheck: 240 roadmaps, 2367 edges, 0 problem(s)
  ```

- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with exactly four `declaration uses sorry` warnings, at :116, :127, :154 and :172.
- **Signatures.** I elaborated `#check @` for all four declarations in one scratch copy (exit 0). The types are identical, after whitespace normalisation, to `scratch/signatures.md`. No binder is lost: `[FiniteDimensional ℂ E]`, `[CompleteSpace F]`, `IsManifold 𝓘(ℂ,E) ⊤ M` and `LocallyContractibleSpace ↑T` are all present.
- **Unchanged file.** The file is unchanged, so the account of r20 carries: 4 of the 67 headline targets are stated, the other 63 are named in the docstring with the carrier each lacks, and the one-tactic probes close none of the four.
- **Hygiene.** The 29 changed lines contain no process word, pull-request number, LaTeX or copied passage. None of the 39 Lean-name leads of `scratch/citations.md` falls on a changed line. `scratch/overlaps.md` lists no dropped id.

### Changed passages against the pins and suppliers

- **Mathlib contract (:528–531).**
  - `IsCoveringMap.monodromyFunctor : FundamentalGroupoid X ⥤ Type _` is at `Mathlib/Topology/Homotopy/Lifting.lean:464`. Its `obj x := p ⁻¹' {x.as}` and `map f := monodromy f` are as the README describes. Bijectivity is `monodromy_bijective` (:470), and covariance is `monodromy_trans_apply` (:440).
  - The bare `FundamentalGroupoid` is the topological structure at `Mathlib/AlgebraicTopology/FundamentalGroupoid/Basic.lean:238`. The simplicial ones live in `SSet` and `SSet.Truncated`.
  - :616's `TauCeti.LocalCoefficientSystem` is built on the same groupoid.
- **UniversalCovers (:300–303, :930–933, :4644).**
  - On main, `Completed/UniversalCovers/README.md` lists `monodromyFunctor` as consumed (:33–37). Stage 2 item 8 (:111–124) gives the pointed and unpointed correspondences and "disconnected covers as functors out of the fundamental groupoid". STATUS.md marks Stages 0–2 done and names `monodromyEquivalence`.
  - The pinned `TauCeti.CoveringSpace.monodromyEquivalenceOfLocallyPathConnectedSpace` (`TauCeti/AlgebraicTopology/UniversalCover/Classification/Components.lean:96`) is `CoveringSpace (TopCat.of X) ≌ (FundamentalGroupoid X ⥤ Type u)`. It assumes exactly `[LocallyPathConnectedSpace X] [SemilocallySimplyConnectedSpace X]`, with no Hausdorff or connectedness hypothesis, and is built on Mathlib's object-level `monodromyFunctor`. So :932's hypotheses are right, and it applies to the possibly non-Hausdorff `T_X`. This settles r24's remark that the groupoid itself is Mathlib's.
- **G1's metric (:3623–3625).** GeometricCurrents on main fixes a chosen Riemannian metric (:14). G1's test forms, LF topology and dual equivalence use no metric (:137–162, "independent of atlas, frame, auxiliary connection and partition of unity", :149). The metric first enters at mass, "pointwise comass≤1" (:184). C5.4's hypotheses on `N` (Hausdorff, second countable, boundaryless, finite-dimensional) are G1's (:13–14), and they give the paracompactness that "exists (partitions of unity)" needs. This settles r24's remark.
- **Worked example 2 (:5058–5063).** The roadmap reference r24 remarked on is gone. The new carrier wording is R02.

### Seeded sample

- **`topologicalCoefficientComparison`** (its *Needs:* line changed). Hatcher §3.H, printed pp. 333–334, is `hatcher-at` lines 14546–14600. It covers local-coefficient cochains as lifts to the bundle of groups, and their identification with `Hom_ℤ[π](C_n(X̃), G)`: the direct local cochains the README cites it for. Dimca is not verifiable (below). Sella was verified in r20.
- **`realComplexCurrentComparison`** (one sentence added, no locator changed). Its Demailly locators were verified in r24.
- The other seeded targets lie outside the changed lines. Their verification in r20, r21, r23 and r24 carries.

### Adversarial table

New rows, computed this round:

| # | Statement (changed) | Instances | Values computed (left / right) | Result |
| --- | --- | --- | --- | --- |
| N28 | Mathlib `monodromyFunctor` contract :528–531 | `z ↦ z²` on `ℂ*`, `x = 1`; composition; the C6.1 `𝔽₅` Check | The fibre is `{1, −1}`. The lift of `e^{2πit}` from 1 is `e^{πit}`, which ends at `−1`, so the loop maps to the transposition, of order 2 = `\|μ₂\|`. `map(γ≫γ′) = map γ ≫ map γ′` (:440): the functor is covariant, from the fibre at the source to the fibre at the target. Transport 2 has dual `2⁻¹ = 3`, since `2·3 = 6 ≡ 1 (mod 5)` | Holds |
| N29 | UniversalCovers classification :300–303, :930–933, :4644 | `ℂ* ⊔ ℂ* → ℂ*`; base `ℂ* ⊔ {pt}`; `ℂ` with doubled origin | The trivial two-sheet cover is the 2-point functor with identity transport. It is not connected, so only the groupoid form classifies it. Over `ℂ* ⊔ {pt}` the groupoid has 2 components, and since `Components.lean:96` assumes no connectedness, covers are pairs (ℤ-set, set). The doubled origin is non-Hausdorff: by van Kampen on two copies of `ℂ` meeting in `ℂ*`, `π₁ = 1`, and gluing two trivial covers by a constant permutation gives a trivial cover. No T2 is needed | Holds |
| N30 | C5.4 metric sentence :3623–3625 | `N = ℝ` with `g = c²dx²` and `T = [0,1]`; `q = 0` with `δ_a`; the long line; `N = ∅` | The seminorms `sup_[−K,K] \|f^(k)\|` do not involve `c`. The comass of `dx` is `1/c`, so `M([0,1]) = c`: only the mass depends on the metric. In degree 0, comass is `\|f\|` and `M(δ_a) = 1`. The long line is Hausdorff but not second countable and has no Riemannian metric; C5.4's second countability excludes it. `∅` has the empty metric | Holds |
| N31 | Worked example 2 :5058–5063 | `y² = x³ − x`; the Fermat quartic K3; `E × P¹` | Curve: `h⁰(Ω¹) = 1`, `H¹ = ℤ²`, form determinant 1. K3: `p_g = p_a = 1` but `h⁰(Ω¹) = 0` and `H¹ = 0`. `E × P¹`: `h¹(O) = 1`, but `H¹ × H¹` lands in `H²`, not the top degree `H⁴`, and there is no group law | Fails as worded → R02 |
| N32 | `topologicalCoefficientComparison` (*Needs:* :4644) | Rank-one `𝔽₃` system on `ℂ*` with monodromy `−1` | `H⁰ = {v : −v = v} = {v : 2v = 0} = 0`, since 2 is a unit in `𝔽₃`. This agrees with its first Check | Holds |

Rows carried from `PRREVIEW-ComplexComparisonPartII~24.md` (and the reviews it cites) for statements this diff leaves untouched:

| Row | Statement | Key values |
| --- | --- | --- |
| N25 (r24) | G1 test-form identification (C5.4 first paragraph, unchanged part) | `V_0*⊗D ≅ ℝ`; `M(δ_a) = 1` on `ℝP²`; `rank V_1 = 2` on `ℝ²`; `Λ³ = 0` on a surface |
| N26 (r24) | UniversalCovers Stages 0–2 (statement reworded, values unchanged) | deck `ℤ/n` for `z ↦ zⁿ`; non-normal degree 3 gives `N(H)/H = 1`; the Hawaiian earring is excluded |
| N27 (r24) | `riemannExistence` | `⊔ G_m` with unbounded degrees; `ℂ[ε]/(ε²)` gives `FinSet` |
| N19, N21–N23 (r23) | RealAlgebraicGeometry; HF3a; DerivedDeRham; Crystalline | 5 cells for `X² − 1`; `H¹_c(ℝ,𝔽₃) = 𝔽₃`; `d(x^p) = 0` over `𝔽_p` |
| N16–N18 (r22), N1–N13 (r21) | ModularCurves §0B; C-1, C1, C6 examples | `(ℤ/n)ᴰ ≅ μ_n`; `H¹(ℂ*,ℤ/n) = ℤ/n`; `h⁰(O(−1)) = 0` |
| 1–4 (r20) | the four `Suggested.lean` headlines | `ℓ²` refutes Montel without `FiniteDimensional`; `h = −id` on `ℓ²`; `(z₁dz₂ − z₂dz₁)/2`; the Warsaw circle |
| 11 (r20, r24) | `realComplexCurrentComparison` signs | `(−1)^(2−2+1) = −1`, `(−1)^(2−1+1) = +1` |
| 20 (r20) | C5.4 bijection (R01) | `δ[O(1)] = +1`; Enriques `δ[K]` is nonzero 2-torsion; `[O(p−q)] ≠ 1` with `δ = 0` (:3878) |
| 5–19, 23–29 (r20) | seeded and C1–C5 targets | as tabulated in r20 |

### Remark (untouched text, no change requested)

- The heading at :862 names AlgebraicModuliForArithmeticGeometry and SchemeAndStackFoundations, but its list also carries the DerivedModuleAlgebra, EtaleCohomologyFoundations, EnhancedDerivedSheaves and UniversalCovers contracts.

## Not verifiable

These are carried from r20–r24. No changed line cites a new source.

- **Kato**, *Logarithmic structures of Fontaine–Illusie* (C5.5): no legal copy.
- **Dimca**, *Sheaves in Topology* (part of `topologicalCoefficientComparison`): paywalled (Springer).
- **Hironaka**, *Triangulations of algebraic sets*, and **Bochnak–Coste–Roy**, Thm. 9.2.1 (part of `complexAlgebraicTopology`): no open host found.
- **Kleiman's published numbering "9.6.16"** (C3.2e): the AMS chapter is paywalled. The arXiv Theorem 6.16 was verified in r20.

## Source issues

- none
