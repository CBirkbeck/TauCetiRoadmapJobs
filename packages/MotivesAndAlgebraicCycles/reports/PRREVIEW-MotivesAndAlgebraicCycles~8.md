# Review of MotivesAndAlgebraicCycles (pull request #1313 at 855578d)

**Verdict:** needs changes

## R01 (P3) — Qualify Hopf reconstruction in the PR summary

**Location:** PR description, `<!-- roadmap-summary -->`, “What this roadmap builds”: “The top layers reconstruct a Hopf algebra from an arbitrary category with fiber functor”.
**Claim:** This omits the neutral Tannakian hypotheses that the head requires; an arbitrary category with a fiber functor does not reconstruct a Hopf algebra.
**Witness:** `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:1118` requires a rigid symmetric monoidal category and exact faithful symmetric fiber; line 1146 excludes the matrix monoid. For its one-dimensional case, `Δ(t)=t⊗t` would require `tS(t)=1` in `K[t]`.
**Repair:** Replace that clause with “The top layers reconstruct a commutative Hopf algebra from an essentially small K-linear abelian rigid symmetric monoidal category with End(1)=K and an exact faithful K-linear strong symmetric monoidal fiber functor to finite-dimensional K-vector spaces”.

## Previous findings

- R01 — repaired: `README.md:1313` retains unconditional pullback for Gysin coniveau and conditions pullback for support coniveau on the target's Gysin description.
- R02 — repaired: `README.md:1320` retains `L¹H¹=0` and restricts nonzero `F¹H¹` to curves with a positive-genus component. Both repair records from the accepted review remain intact.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| §7.6a equivariant theory and sign twist | Real point, degrees 0, 1, 2 | Untwisted: `ℤ,0,ℤ/2`; sign-twisted: `0,ℤ/2,0`; cyclic resolution gives these same groups. | New group summary preserves the twist distinction. |
| §7.6a real-complex operations | `Spec C` over `R`; empty scheme | Free two-point orbit: `H⁰_G=ℤ`, higher groups `0`; norm of restricted `1` is `2`; empty groups `0`. | Matches the constructions cited by the summary. |
| §7.6b real-locus decomposition | Point and circle, `m=2` | Point: `H²(BC₂,𝔽₂)=𝔽₂=H⁰`; circle: `H²(S¹×BC₂)=𝔽₂²=H⁰⊕H¹`. | Identifier retained under §7.6a. |
| §7.6b purity and cycle operations | Real point in a smooth real curve | Complex supported class: degree `2`, twist `1`; real Thom class: degree `1`; point degree `1`, nonreal norm degree `2`. | Different degree shifts retained. |
| §§7.7–7.8 divisor, zero-cycle and projective-space targets | `ℙ¹_R`, codimensions `0,1,2` | Chow/admissible groups: `ℤ/ℤ`, `ℤ/ℤ`, `0/0`; unit and point map to `1`; cokernels `0`. | Summary's cases have the stated carriers. |
| §7.7 blowup cases | Blow up `ℙ²_R` at a real point; divisor center | Point: `Pic=ℤh⊕ℤE`, target `ℤ²`, defect `0`; divisor center: zero exceptional summands, defect `0`. | Codimension restrictions remain in §7.8. |
| §§7.9–7.10 detector classification | Real elliptic curve with two real components | `M=𝔽₂²`; fundamental-class image `⟨(1,1)⟩`; rank `1<2`, cokernel `𝔽₂`. | Topological failure, rather than an integral cycle-class defect. |
| §7.11 surface example | Specified connected real conic bundle over a two-component elliptic curve | Circle-bundle surface: `dim H¹=2`; stipulated algebraic image has dimension `1`; `1=2/2`. | Same sharp-bound target; construction remains required. |
| §7.9 odd-Euler torsion descent summary | Quaternionic cohomology in dimensions `0,1,2` | `N(det M)=(-1)^n`: `1,-1,1`; dimension `1` impossible; all allowable dimensions even, hence Euler sum even. | Odd Euler characteristic excludes failed torsion descent. |
| §7.12 defect comparison | `X=ℙ³_R`, `d=3` | Sheaf exponent `d−3=0`; one-cycle map onto `A_G⁴=ℤ`; defect and corresponding unramified group both `0`. | Universal surface support holds. |
| §7.13 quartic torsion | Stated `H_G⁴=ℤ⊕𝔽₂`, rank `H_G³=30` | Divisible kernel `(ℚ/ℤ)^30`, quotient `𝔽₂`; split torsion group has 2-torsion `𝔽₂^31` and 3-torsion `(ℤ/3)^30`. | Conditional hypotheses retained. |
| R01: arbitrary-category Hopf claim | Finite comodules of multiplicative `K[t]` | Antipode equation at `t`: `tS(t)=1`; evaluating at `t=0` gives `0=1`. | PR summary fails; rigidity excludes this category. |
| Neutral recognition and rigidity-to-antipode signatures | `𝔾_m`, coefficient algebra `K[t,t⁻¹]` | `S(t)=t⁻¹`; both convolution products `tt⁻¹=t⁻¹t=1=ε(t)`. | Head's hypotheses and both equations are retained. |

Rows for untouched statements stand as in the previous review, of `2fbac06`.

- Source checks: 1 legally fetched source, BenoistWittenbergI; §§1.1.1–1.1.3, equations (1.16), (1.21), (1.26), (1.29)–(1.31), Definition 1.19 and Theorems 1.18/1.21 checked at lines 338–432, 510–565, 592–671, 1181–1245; grouped cases checked at lines 1482–1543, 1582–1615, 1654–1676, 2081–2099, 2174–2181, 2231–2249, 2520–2527, 2604–2615, 2697–2735.
- Changed references: all 5 demoted identifiers (7.6b, 7.8, 7.10, 7.11, 7.13) survive; the 4 new group summaries resolve to their retained targets and local consumers; 0 new supplier citations.
- Pinned declarations: Mathlib `Mathlib/RingTheory/HopfAlgebra/Basic.lean:65` and Tau Ceti `TauCeti/Algebra/Coalgebra/Comodule/Finite/Abelian.lean:68`, :94, :101 opened; scratch `#check @name` elaboration verifies all 4 actual target signatures, with no lost hypothesis. The worker's fifth name, `has`, is prose in a docstring.
- Gate: every counter zero, `OK`; targeted build passes; direct elaboration and signature probe each give only 4 `sorry` warnings. Dependency output: `depcheck: 245 roadmaps, 2215 edges, 0 problem(s)`; no UPWARD or CYCLE.
- Headlines: Jannsen's category criterion, coalgebra reconstruction, neutral Tannaka recognition and the rigidity antipode remain the 4 Lean targets; no changed Lean statement or new statable headline. Previous padding checks stand.
- PR scope: 3 new files, 1940 inserted lines against the base; 0 removed declarations or suppliers from a base roadmap, 0 changes outside the folder; title and remaining quoted prose checked against the head.
- Overlap check: read MotivicEtaleKTheory, SchemeKTheoryOperations, EtaleDualityAndPerverseSheaves, KTheoryFiniteLocalFields, LefschetzStructures, SchemeAndStackFoundations and EtaleCohomologyFoundations; owners remain respectively Deligne/regulator comparisons, scheme K-operations, extended étale duality, higher cycles, Lefschetz operators, intersection theory and basic étale cohomology. Real semialgebraic cycle operations belong here; no new shared ownership.
- Source independence: changed passages only; 9 changed prose passages compared with BenoistWittenbergI, with no copied expression identified. Largest share among changed citation groups: BenoistWittenbergI, 5 of 5. No layer was added, removed or reordered, so the arrangement comparison was not repeated.

## Not verifiable

- DelfsHomology, Chapter III §9, Theorem 9.3: sources-service bibliographic lookup found no legal text; its locator is corroborated by BenoistWittenbergI lines 332–336, and the relevant duality is restated there at lines 440–516.
- Grothendieck1969, pp.299–303: settled as uncertified, outside the changed passages; carried from the previous report.
- KunnemannPicard, §7.17: outside the changed passages; carried from the previous report.

## Source issues

- **Error** in BenoistWittenbergI at Theorem 3.16(ii), p.55: the source says torsion Picard descent characterizes existence of an even-genus curve in every positive dimension; it should be restricted to dimension at least two or empty real locus; affects a stated result.

## For the human reviewers

- none
