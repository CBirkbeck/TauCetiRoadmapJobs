# Review of GlobalQuadraticForms (pull request #1215 at 7498694)

**Verdict:** needs changes

Two P3 findings, no P1 or P2. Both concern the pull request as a whole, not the mathematics of
this folder: they are the previous review's R01 and R02, which this head does not repair. The
previous R03 (the 7.3 route) and R04 (the 5.1 *Needs:* lines) are repaired; see the first part of
Verified sound. Every statement of the README and all 8 declarations of `Suggested.lean` pass the
adversarial pass below. All 156 dotted library names cited by the README resolve at the pins, and
the Milne locators are correct.

## R01 (P3) — The conflicting revision #1200 of this roadmap is still open, and no order is stated

**Location.** The pull-request description (title "ClassFieldTheory: correct hypotheses,
conductors and lifting"); `TauCetiRoadmap/GlobalQuadraticForms/README.md` and `Suggested.lean` as
a whole.

**Claim.** Not repaired (this was R01 at `c4ff4fc`; no repair report marks it not actionable).
This pull request rewrites GlobalQuadraticForms: against main, `README.md` changes by 2238 lines
and `Suggested.lean` by 581. The description still names only ClassFieldTheory. #1200 ("Fix
rank-four discriminant sign comparison", head `f028c07`) changes the same two files. The two heads
conflict, and `f028c07` is not an ancestor of this head. Its fix, the rank-four real-place remark,
is already here at 7.2 (README lines 924–926), so this pull request supersedes #1200.

**Witness.** `roadmaps overlaps GlobalQuadraticForms`: "#1200 and #1215 conflict in
`README.md`, `Suggested.lean`". #1200's `Suggested.lean` still declares
`equivalent_of_locallyEquivalent` and `injective_wittRing_baseChange_places [Invertible (2 : K)]`.
This head declares neither.

**Repair.** Say in the description that this pull request revises GlobalQuadraticForms and
supersedes #1200, whose rank-four fix is 7.2 lines 924–926 here, and close #1200. Otherwise, state
which of the two merges first and rebase the other on it. Test: after the repair,
`roadmaps overlaps GlobalQuadraticForms` lists no other open pull request that changes this roadmap.

## R02 (P3) — A change outside the folders this pull request is named for

**Location.** `Completed/LocalGaloisGroups/Suggested.lean`, 112 changed lines, from commit
`1abcd32c` ("ClassFieldTheory: review repairs with consumers kept building").

**Claim.** Not repaired (this was R02 at `c4ff4fc`). The folders named as this pull request's own
are ClassFieldTheory, QuadraticFormInvariants and GlobalQuadraticForms. The pull request also
edits a fourth folder, so that folder gets no review. The gate's `outside-folder` check does not
list it, because it reports only `TauCetiRoadmap/` folders.

**Witness.** `git diff --stat origin/main...HEAD`, with the three named folders excluded, lists
`Completed/LocalGaloisGroups/Suggested.lean | 112`. That file imports
`TauCetiRoadmap.ClassFieldTheory.Suggested`, and the edit follows ClassFieldTheory's renames: for
example `ClassFieldTheory.artinMap K x` becomes `TauCeti.ClassFieldTheory.artinMap K x`.
`1abcd32c` is on this head and not on `origin/main`.

**Repair.** Name `Completed/LocalGaloisGroups` in the description as a folder this pull request
changes: a consumer updated so that it keeps building after the ClassFieldTheory renames. It then
gets its own review. Otherwise, keep the ClassFieldTheory names it imports and drop the edit. Test:
the same `git diff --stat` then lists either nothing or only folders the description names.

## Verified sound

**The previous review's findings, finding by finding.**

- R01 and R02: not repaired. The description is unchanged, #1200 is still open and conflicting,
  and `Completed/LocalGaloisGroups/Suggested.lean` is still changed. They are R01 and R02 above.
- R03 (7.3 needed 4.2 to get from 7.2 to "record = I"): **repaired**.
  - 7.3 (lines 958–966) now routes the forward direction through the reduction of 72:1 and 6.2:
    "`GlobalFormInvariants.IsAdmissible.exists_isLocalRealization` gives a family `(U, R)`
    realizing `I`; the reduction of 72:1 … gives a regular `W` … 6.2 … makes the representation
    global, and the reduction then returns a regular form … whose record is `I`".
  - This matches the pinned conclusion of
    `GlobalFormInvariants.IsLocalRealization.exists_locallyRepresents_prod`
    (`PrescribedLocalForms.lean:140`). Given the global representation, it returns
    `∃ Q, ∃ hQ, Q.globalInvariants hQ = I`.
  - The *Needs:* line (982–990) now lists 4.1, 6.2, the reduction and the three regularity
    lemmas, and drops 7.2.
  - The ⚠ paragraph (973–980) correctly explains why the 7.2 statement alone would need 4.2.
- R04 (5.1 *Needs:* lines): **repaired**.
  - The ternary *Needs:* (708–718) now lists `QuadraticMap.Equivalent.anisotropic_iff`,
    `QuadraticForm.QuadraticMap.Equivalent.isLocallyIsotropic_iff`, both `_smul` lemmas, both
    `Prod` and `WeightedSumSquares` isometries, and
    `QuadraticMap.not_anisotropic_prod_of_represents_neg`.
  - The binary *Needs:* (705–707) adds `QuadraticForm.Nondegenerate.atFinitePlace` and
    `Module.finrank_baseChange`.
  - The supplier contracts (lines 228–230) name `atFinitePlace_smul` and `atRealPlace_smul`.
  - I tested the route on `⟨2, 2, −6⟩`. Scaling by `1/2` gives `d = −1` and `a = 3`, and the form
    is anisotropic at `ℚ₃` both before and after scaling.

**Gate and supply direction.**

- The worker's gate at this head passes every check, including the targeted build.
- I re-ran it. Its only failing lines are `outside-folder` lines for five files of ClassFieldTheory
  and QuadraticFormInvariants, the pull request's own folders, so they are not findings.
- The dependency check prints `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`: no UPWARD or
  CYCLE line.
- The roadmap is on main and names no roadmap supplier ("There is no roadmap supplier"). Its
  inputs are Mathlib and Tau Ceti declarations.
- `roadmaps resolve` on the README finds no unresolved citation and no unresolved Lean name.

**Lean.**

- `lake env lean TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` gives exactly 8 warnings, all
  "declaration uses `sorry`".
- I elaborated `#check @name` for all 8 declarations in one scratch file, with universes shown, and
  compared each with its README statement:
  - `K : Type u_1` everywhere, and forms on `V : Type u_2` and `W : Type u_3` in independent
    universes, as the Conventions say.
  - `[FiniteDimensional K V]` and `[FiniteDimensional K W]` are present in every signature that
    mentions `V` or `W`.
  - `hQ`/`hR` are explicit, and `a ≠ 0` appears only in 6.1.
  - `exists_globalForm_of_isAdmissible` produces a form on `Fin I.rank → K`.
  - No section binder is lost, and the Lean generality equals the README's.
- One-tactic probe on a scratch copy, `first | simp | rfl | infer_instance | (constructor <;> simp)`
  in place of each `sorry`: all 8 fail. There is no padding.
- Headlines: every headline the module docstring lists (4.2, 5.5, 6.1, 6.2, 6.3, 7.3, 8.1, 8.3)
  is stated. These include the Summary's four end theorems.
- 8.4 is the reverse direction of 6.3, and the docstring says so. 8.2 follows from 8.3 by Witt
  decomposition.
- I searched the pins for an existing Hasse–Minkowski, global-square or Witt-injectivity theorem
  and found none.

**Library declarations at the pins.**

- I `#check`ed all 156 dotted names in the README in one file (Mathlib plus 60 Tau Ceti modules):
  all resolve.
- I opened the declarations new at this head and compared each with its README gloss:
  - `QuadraticMap.IsometryEquiv.represents_iff` (`Representation.lean:184`).
  - `QuadraticMap.IsRepresentedBy.exists_equivalent_prod` (`Representation.lean:277`): needs
    `Invertible 2`, `FiniteDimensional K V₁` and both forms regular; returns a regular `Q|_P` with
    `Q ≅ Q₁ ⊥ Q|_P`.
  - From `Radical.lean`:
    - `QuadraticMap.Nondegenerate.prod` (line 514).
    - `QuadraticMap.Nondegenerate.exists_isUnit` (line 530, `[Nontrivial V]`, which fits "rank zero
      being immediate" in 6.2).
    - `QuadraticMap.nondegenerate_smul_sq` (line 677, `a ≠ 0`, `IsDomain`, `Invertible 2`).
    - `QuadraticMap.nondegenerate_smul_iff` (line 151, `IsUnit a`).
  - `QuadraticForm.nondegenerate_weightedSumSquares_one_neg` and
    `QuadraticForm.nondegenerate_weightedSumSquares_neg_self_mul` (`CorrectionPlanes.lean:69, 74`).
  - `QuadraticForm.atFinitePlaceWeightedSumSquares` and `QuadraticForm.atRealPlaceWeightedSumSquares`
    (`Localization.lean:265, 278`), and `QuadraticForm.atFinitePlace_smul` and
    `QuadraticForm.atRealPlace_smul` (`Operations.lean:212, 222`).
  - `QuadraticForm.discr_atFinitePlace` (`Discriminant.lean:42`).
  - `QuadraticForm.not_anisotropic_iff_discr_eq_neg_one_of_finrank_eq_two` (`LowRank.lean:173`).
  - Mathlib's `Module.finrank_baseChange` (`LinearAlgebra/Dimension/Constructions.lean:375`).
- Mathlib's `QuadraticMap.Nondegenerate` (`Radical.lean:115`) has the two fields `radical_eq_bot`
  and `rank_rad_polar_le`. The second is automatic when `2` is invertible, which matches the gloss
  at README lines 171–174.
- `GlobalFormInvariants.IsAdmissible` (`Invariants.lean:178`) has the eight clauses the README
  lists at lines 268–270. The local predicates (`Predicates.lean:51–151`) are conjunctions over
  finite and real places only.
- Exactly eight general inputs fix `K : Type`; these are the eight the README lists. The ninth
  declaration with `K : Type` is the `ℚ(√5)` worked example, which is not an input.
- Sign prescription with a prescribed second argument (`exists_hilbertSymbol_eq_ite`) asks that
  `b` be a nonsquare at `S`, negative at `T`, and that `#S + #T` be even, as 4.1 item 3 states.
- `finrank_le_index_range_ideleClassNormMap` (`FirstInequality.lean:108`) asks for `IsGalois` and
  `IsCyclic`, as the contracts say.
- I checked every Tau Ceti file path the README names (59 files): all exist.

**Sources (seeded sample).** In `milne-cft`, printed page = PDF page − 9: page 229 begins after
line 10411, and page 252 is PDF page 261.

| Target | Milne, Ch. VIII | `milne-cft` line | Result |
|---|---|---|---|
| 4.2 | Thm 1.1, p. 229; Ex. 1.3, p. 229 | 10384, 10397 | Matches; `n = 2` meets the `μ_n ⊂ K` hypothesis; Milne's finitely many exceptions may include every archimedean place, so 4.2 rightly has no archimedean hypothesis |
| 4.3 | Thm 3.1 (Hasse norm theorem), p. 234 | 10629 | Cyclic `L/K`, the quadratic case cited |
| 5.1 | Thm 3.5, p. 235; Prop. 3.7(b), (c), p. 236; proof of 3.5(b), p. 237 | 10686, 10698–10701, 10772–10778 | Matches; the README's "Theorem 3.1" for `n = 3` corrects Milne's slip (Source issues) |
| 7.2 | Thm 6.10, Prop. 6.11, p. 255; real remarks, p. 256 | 11745, 11758–11763, 11781–11785 | Matches: one local class in rank 1 and in rank 2 with `d = −1`; over `ℝ`, `d` and `S` fix `t` only for `r ≤ 3` |
| 7.4 | Thm 6.3, p. 252; Thm 6.10, p. 255 | 11619, 11745 | Matches; the `i ≤ j` factor `(−1, d)` is common to both forms (Remark 6.6, line 11677) |
| 8.2 | Prop. 6.2, p. 251; Thm 6.3, p. 252 | 11574, 11619 | Matches |
| 8.3, 8.4 | Thm 6.3, p. 252 | 11619 | Matches; Milne also covers degenerate forms, and the roadmap narrows to its regular setting |

**Adversarial pass.** Each row gives the values computed on both sides of the statement.

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| Discriminant convention | `H`, `⟨1,1⟩` | Plain `[−1]`, `[1]`; signed `[1]`, `[−1]` | Conventions Check distinguishes them |
| Hasse convention | `H` over `ℝ` | `i<j`: `(1,−1)=1`; `i≤j`: `(1,1)(1,−1)(−1,−1)=−1` | Distinguished |
| Real Hasse `(−1)^(q(q−1)/2)` | `q=0..4` | `1,1,−1,−1,1`; with `d=(−1)^q`, rank 4 `d=[1]` gives `q∈{0,2,4}` and signs `1,−1,1` | `(4,0)` and `(0,4)` collide, as 7.2 says; rank ≤ 3 is separated |
| 4.1 transport | `ℚ(i)`, conjugation | `2+i ≡ 4 = 2²` mod `(2−i)`, a unit there; valuation `1` at `(2+i)`. `σ(2+i)=2−i` is a square at `σ(2−i)=(2+i)` | Places must follow `σ` |
| 4.1, 71:19a | `b=−1`, `S={3}`, `T={∞}`, `a=−3` | `ℝ`: both negative, so `−1`. `3`: `(−1/3)=−1`. `2`: `ε(−3)=0`, so `1` | Holds |
| 4.1, 71:19a | `S={5}` | `−1 = 2²` in `ℚ₅` | Hypothesis needed |
| 4.1, 71:19 | `S={2}`, `T={∞}`; `S={3}`, `T=∅` | `(−1,−1)=−1` exactly at `2` and `∞`; odd count | Holds; parity excluded |
| 4.2 | `ℚ(i)`, `a=−1` | `−1=i²`; square at every `v` | Both true |
| 4.2 | `ℚ`, `a=−7` | Square in `ℚ₂` (`−7≡1` mod 8), nonsquare at `p=3` and every `p` with `(p/7)=−1` | Hypothesis fails for every finite `S`; conclusion false |
| 4.2, exponent | `16`, `n=8` | `(−1/p)(2/p)(−2/p)=(4/p)=1`, so one of `x²−2`, `x²+2`, `x²+2x+2` has a root in `ℚ_p` for each odd `p`; `16^(1/8)=√2∈ℝ`; not in `ℚ` | Eighth-power analogue false, as the Check says |
| 4.3 | `d=5`, `a=−1` | `2²−5·1²=−1` | Both true |
| 4.3 | `d=3`, `a=−1` | `(3,−1)₃=(−1/3)=−1` | Both false |
| 5.1 binary | `⟨1,−2⟩` over `ℚ`; over `ℚ(√2)` | Isotropic iff `2` is a square: not in `ℚ₃`; `(√2)²−2=0` | Both false; both true |
| 5.1 ternary | `⟨1,1,−7⟩` | `d=−1`, `a=7`: `(−1,7)₇=−1`, `(−1,7)₂=(−1)^{1·1}=−1`, `ℝ`: `1`; two places | Both false |
| 5.1 ternary | `⟨1,1,−5⟩` | `1+4−5=0` | Both true |
| 5.5 | Rank 0, rank 1 | Anisotropic over `K` and every `K_v` | Both false |
| 5.5 | `⟨1,1,1,−7⟩` | `⟨1,1,1⟩` over `ℚ₂` misses exactly the class `−1`, and `7 ≡ −1` mod 8 | Anisotropic at `ℚ₂`; both false |
| 5.5 | `⟨1,1,1,−1⟩` | `1+0+0−1=0` | Both true |
| 5.5 route | `U=⟨1,1⟩`, `W=⟨1,−1,1⟩` | `x=(1,0)`: `b=1`, `W(0,1,0)=−1`; `x=0` gives `⟨0⟩ ⊥ W`, singular | `U(x)≠0` needed |
| 6.1 | `⟨1,1,1⟩`, `a=7`; `a=3` | `7` missed at `ℚ₂`; `1+1+1=3` | Both false; both true |
| 6.1 | `a=0` | Zero vector on both sides | Both true; `a≠0` serves only the route, as the README says |
| 6.2 | `⟨1,7⟩` into `⟨1,1,1⟩` | `⟨7⟩` not represented at `ℚ₂` | Both false |
| 6.2 | `⟨1,2⟩` into `⟨1,1,1⟩` | `e₁ ↦ 1`, `(0,1,1) ↦ 2`, orthogonal | Both true |
| 6.2 Check | `⟨c⟩` into `H` | `((1+c)²−(1−c)²)/4=c` | Holds |
| 6.3 | `⟨1,3⟩` vs `⟨1,1⟩`; `⟨1,1⟩` vs `⟨2,2⟩` | `[3]≠[1]` at `ℚ₃`; `(x+y)²+(x−y)²=2x²+2y²` | Both false; both true |
| 7.2 | `ℚ`, `n=2`, `d=[−1]`, `U_v=H`, `R=⟨1,−1⟩` | All `s_v=1`, real `q=1` gives `1`; product `1` | `V=H` |
| 7.2 Check | `⟨−1,−1,−1⟩` | `s₂=(−1,−1)₂³=−1`, real `(−1)^3=−1`; product `1` | Hypotheses hold |
| 7.3 | `ℚ`, `(2,[1], s=−1 at 2 and 3, p=2)` | No rank-two clause (`−1` nonsquare in `ℚ₂`, `ℚ₃`); `q=0`; product `(−1)(−1)·1=1`. `⟨3,3⟩`: `(3,−1)₃=−1`, `(3,−1)₂=(−1)^{1·1}=−1`, `ℝ`: `1` | Admissible and realized by `⟨3,3⟩` |
| 7.3 | Zero record; rank-one record with `s=−1` at two places | `rank 0`; `isAdmissible_rankOne_iff_eq_empty` | Not admissible |
| 7.3 route (R03) | `ℚ(√5)` record | Reduction output has record `I` itself; via 7.2, local discriminants `[1]` and 4.2 give `d(V)=[1]` | Both routes reach `I` |
| 7.4 / 8.1 | `⟨3,3⟩` vs `⟨1,1⟩` | `s₂,s₃` differ; `⟨3,3⟩` misses `1` since `3` is not a sum of two squares | Records differ; not isometric |
| 8.1 | `⟨1,2,2⟩` vs `⟨1,1,1⟩` | `d=[4]=[1]`; `s=(2,2)=(2,−1)=1` (`−1=1−2·1`); index `3` | Equal records; isometric |
| 8.1 | Two zero forms; zero form vs `⟨1⟩` | Ranks `0,0`; `0,1` | Both true; both false |
| 8.2 | `⟨1,1,−3,−3⟩` | `d=[9]=[1]`, signature `(2,2)`. `s=(−3,−1)`: `−1` at 3, `1` at 2. `s(2H)=(−1,−1)`: `1` at 3, `−1` at 2 | Not locally hyperbolic at `ℚ₂`, `ℚ₃`; not hyperbolic |
| 8.2 | `⟨1,−1,2,−2⟩` | `d=[4]=[1]=d(2H)` | Hyperbolic |
| 8.3 | Class of `⟨1,1,−3,−3⟩`; class of `H` | Nonzero at `ℚ₂`, `ℚ₃`, zero at `ℝ`; zero everywhere | Image nonzero, image zero |
| 8.3, complex places | — | A class vanishing at one `v` has even dimension, which is all of `W(ℂ)=ℤ/2` | Complex places add nothing |
| 8.4 | `⟨1,2,2⟩`, `⟨1,1,1⟩` | Locally isometric (same invariants) | Isometric |
| Worked example | `ℚ(√5)`, `⟨1,θ,θ⟩` | `d=θ²=[1]`; indices `3`, `1`; real Hasse `1`, `−1`; `s_v=(θ,−1)_v`, `θ` a unit, so `−1` only above `2`; product `1` | Matches |

**Citations of this roadmap by others.**

- Anchors cited on main and at open heads all match headings at this head:
  - `#layer-4-global-square-norm-and-approximation-lemmas` (ClassicalArithmeticCompletion on main,
    lines 189, 804, 2607).
  - `#61-scalar-representation`, `#63-hasseminkowski-isometry` and
    `#84-the-form-theoretic-so-kernel-consequence` (OrthogonalSpinGroups, #1181).
- Main's `Suggested.lean` declares 33 Lean names that this head drops. Of these, other roadmaps
  cite these:
  - `equivalent_of_locallyEquivalent` (IntegralLattices, OrthogonalSpinGroups #1181). It is aliased
    at 8.4 as the reverse direction of `hasseMinkowski_equivalent`.
  - `exists_hilbertSymbol_eq_neg_one_iff_pair` (GL2AutomorphicRepresentationsAndTransfer #931,
    QuaternionArithmetic #1722). The section map, line 76, sends it to
    `exists_pair_hilbertSymbol_eq_ite`.
  - `hilbertSymbol_real`, `LocallyRepresentsScalar`, `atFinitePlace`, `atRealPlace`,
    `unitAtFinitePlace` and `unitAtRealPlace`: Tau Ceti declarations named in the section map and
    the contracts.
- MetaplecticAutomorphicForms (#1063) cites "GlobalQuadraticForms Layer 3" for admissible
  invariant systems. The section map's Layer 3 line covers this.

**Ownership.**

- Every roadmap that mentions Hasse–Minkowski names this roadmap as owner (`roadmaps grep`):
  - ClassFieldTheory on main (line 216) and at #1411.
  - QuadraticFormInvariants on main and at #617, #1411 and #1797.
  - OrthogonalSpinGroups on main (lines 66–68).
  - IntegralLattices, K3Surfaces (§5.5), K3SurfacesAndSymplecticBoundedness (§5.5),
    GeometryOfNumbersAndQuadraticArithmetic (Layers 5–6) and QuaternionArithmetic.
- None states its own global square theorem or Hasse–Minkowski.
- No other roadmap's `Suggested.lean` declares a name in `TauCetiRoadmap.GlobalQuadraticForms`;
  only #1200, a revision of this roadmap, does (R01).

## Not verifiable

- O'Meara, *Introduction to Quadratic Forms*, is `uncertified` (paywalled; cited by locator), so I
  could not read 58:7, 65:15, 66:1, 66:3, 66:4, 66:5, 71:19, 71:19a and 72:1. They are the only
  locators for the sampled 4.1 item 3, 5.5, 6.1, 6.2, 6.3, 7.3 and 8.1, and a co-locator for 4.2
  and 7.2. Milne independently supports most of these, read in `milne-cft`:
  - 4.2: Thm 1.1, line 10384.
  - 5.5: Thm 3.5(b), p. 235, line 10689.
  - 6.1: Cor. 3.6, p. 236, line 10694.
  - 6.3 and 8.4: Thm 6.3, p. 252, line 11619.
  - 7.2 and 7.3: Thm 6.12, p. 256, line 11792.
- Serre, *A Course in Arithmetic*, is `uncertified`: Ch. III §1.2 Thm 1, §2.2 Thm 3, Ch. IV §2.1,
  §3.2 Thm 8. The `i < j` convention attributed to Serre is confirmed through `milne-cft` line 11677
  (Remark 6.6).
- Ownership against open pull requests was checked through `roadmaps grep` over all 458 open heads,
  not by reading each sibling checkout.

## Source issues

- **Misprint** in milne-cft at Ch. VIII, proof of Theorem 3.5(b), p. 237: the source says the cases `n = 3, 4` follow from Proposition 3.7(c),(d) and Theorem 1.1; it should be Theorem 3.1, the Hasse norm theorem, which those reductions to norms require; affects the proof.
- **Misprint** in milne-cft at Ch. VIII, proof of Theorem 3.5(b), p. 237: the source says the induction hypothesis is Theorem 3.1b for `n − 1`; it should be Theorem 3.5(b) for `n − 1` variables; affects nothing.
- **Gap** in milne-cft at Ch. VIII, proof of Theorem 3.5(b), `n ≥ 5`, p. 237: the source approximates `x₁, x₂` near local solutions on the exceptional set `S`; it should also require `c = a x₁² + b x₂² ≠ 0`, which nothing forces when `S` is empty and without which `cY² − r` is degenerate; affects the proof.
- **Misprint** in milne-cft at Ch. VIII, proof of Theorem 6.10, p. 255: the source gives `S(q₁ ⊥ aZ²) = (a, d(q₁)) S(q₁)`, the recursion for the `i < j` invariant; for its own `i ≤ j` invariant it should be `(a, a·d(q₁)) S(q₁)`; affects nothing.
- **Misprint** in milne-cft at Ch. VIII, proof of Theorem 6.3, p. 252: the source names the complements `q₁, q′₁` and then calls them `q₁, q₂`; it should be `q′₁` throughout; affects nothing.
