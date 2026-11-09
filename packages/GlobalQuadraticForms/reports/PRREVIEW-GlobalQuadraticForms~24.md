# Review of GlobalQuadraticForms (pull request #1215 at c4ff4fc)

**Verdict:** needs changes

Four P3 findings and no P1 or P2. The mathematics of every target and of all 8 statements in
`Suggested.lean` holds up under the adversarial pass below. The library citations resolve at the
pins, the universe bookkeeping of 4.1 is exact, and the Milne locators are correct. The findings
cover the pull request's coordination (R01, R02) and two incomplete routes or *Needs:* lines
(R03, R04).

## R01 (P3) — Two open revisions of this roadmap conflict, and no order is stated

**Location.** The pull-request description, titled "ClassFieldTheory: correct hypotheses, conductors
and lifting", and `TauCetiRoadmap/GlobalQuadraticForms/README.md` and `Suggested.lean` as a whole.

**Claim.** This pull request rewrites GlobalQuadraticForms: 2154 README lines and 581 Lean lines
change against main. Its description does not mention GlobalQuadraticForms. It also does not
mention the other open revision of the same folder, #1200 "Fix rank-four discriminant sign
comparison" (head `a6625dc`), whose `README.md` and `Suggested.lean` conflict with these.

**Witness.** `roadmaps overlaps GlobalQuadraticForms` reports "#1200 and #1215 conflict in
README.md, Suggested.lean". `git merge-base --is-ancestor a6625dc HEAD` fails. The two
`Suggested.lean` files differ: #1200 still declares `equivalent_of_locallyEquivalent`.

**Repair.** Say in the description that this pull request revises GlobalQuadraticForms and
supersedes #1200, and close #1200. Otherwise, say which of the two merges first and rebase the
other on it.

## R02 (P3) — An edit outside the folders this pull request names

**Location.** `Completed/LocalGaloisGroups/Suggested.lean`: 112 lines, changed by commit `1abcd32c`
("ClassFieldTheory: review repairs with consumers kept building").

**Claim.** The pull request changes a fourth folder besides ClassFieldTheory,
QuadraticFormInvariants and GlobalQuadraticForms. It is not named as part of this pull request, so
nobody reviews it.

**Witness.** `git diff --stat origin/main...HEAD` with the three named folders excluded lists
`Completed/LocalGaloisGroups/Suggested.lean | 112`. That file imports
`TauCetiRoadmap.ClassFieldTheory.Suggested`, and this pull request renames declarations there
(`ClassFieldTheory.artinMap` becomes `TauCeti.ClassFieldTheory.artinMap`).

**Repair.** Name `Completed/LocalGaloisGroups` in the description as a folder this pull request
changes: a consumer updated so that it keeps building after the ClassFieldTheory renames. It then
gets its own review. Otherwise, keep the ClassFieldTheory names it imports and drop the edit.

## R03 (P3) — 7.3 needs the global square theorem 4.2 to reach "record = I" from 7.2

**Location.** `README.md` 7.3, lines 895–897: "from
`GlobalFormInvariants.IsAdmissible.exists_isLocalRealization` and 7.2, an admissible record is the
record of a regular form on `K^(I.rank)`". The *Needs:* line is at lines 904–908.

**Claim.** 7.2 concludes only that `V_v ≅ U_v` and `V_w ≅ R_w`. Local isometry fixes the rank, the
finite Hasse signs, the positive indices and the image of the discriminant in each `K_v`. It does
not fix the global class `d(V) ∈ Kˣ/(Kˣ)²`. To get `Q.globalInvariants hQ = I` you need
`d(V)/I.discr`, which is a square in every `K_v`, to be a square in `K`. That is exactly 4.2, and
neither the route nor the *Needs:* line names it.

**Witness.** Tau Ceti's
`QuadraticForm.locallyEquivalent_iff_finrank_eq_and_discr_eq_and_finiteHasse_eq_and_realPositiveIndex_eq`
(`NumberTheory/QuadraticForm/Global/Classification.lean:135`) characterises local isometry by the
`squareClassMap` images of the discriminants at each `v`. It does not use the global discriminant.

**Repair.** Pick one of two fixes:

- Add one sentence to the 7.3 route: "the global discriminant of the form from 7.2 and `I.discr`
  have the same image in every `K_v`, so they are equal by 4.2 (`S = ∅`)". Then add 4.2 to the
  7.3 *Needs:* line and to Layer 7's Dependencies.
- Route the forward direction through 4.1 item 3 (the reduction of 72:1) and 6.2, whose output
  already has record `I`, and cite those instead of 7.2.

Tested on the `ℚ(√5)` record (rank 3, `d = [1]`, indices 3 and 1, `s = −1` above `2`):

- Every local discriminant of the form from 7.2 is `[1]`.
- 4.2 then gives `d(V) = [1] = I.discr`.

## R04 (P3) — 5.1: the binary and ternary *Needs:* lines omit inputs the route uses

**Location.** `README.md` 5.1. The ternary route is at lines 648–652: "diagonalize and scale to
`⟨1, -d, -a⟩` … 4.3 gives global representation". The *Needs:* lines are at 660–671.

**Claim.** The ternary route uses several steps whose inputs are missing from its *Needs:* line:

- It moves anisotropy and local isotropy across the diagonalizing isometry and across scaling by
  `a₁⁻¹`.
- It ends by turning a representation of `a` by `⟨1, -d⟩` into isotropy of `⟨1, -d, -a⟩`.

5.5 lists the isometry transfers for the same step. The binary route applies a rank-two criterion
over each `K_v`, which needs `Q_v` to be regular.

**Witness.**

- `QuadraticMap.not_anisotropic_prod_of_represents_neg` (`Representation.lean:220`) is in the
  supplier contracts but in no *Needs:* line.
- `QuadraticForm.atFinitePlace_smul` and `QuadraticForm.atRealPlace_smul` (`Operations.lean:212`,
  `222`) do not appear anywhere in the README.

**Repair.**

- Add to the ternary *Needs:* line: Tau Ceti `QuadraticMap.Equivalent.anisotropic_iff`,
  `QuadraticForm.QuadraticMap.Equivalent.isLocallyIsotropic_iff`,
  `QuadraticForm.atFinitePlace_smul`, `QuadraticForm.atRealPlace_smul` and
  `QuadraticMap.not_anisotropic_prod_of_represents_neg`.
- Add `QuadraticForm.Nondegenerate.atFinitePlace` to the binary *Needs:* line.
- Name the two `_smul` lemmas in the localization bullet of the supplier contracts.

Tested on `⟨2, 2, −6⟩`. Scaling by `1/2` gives `d = −1`, `a = 3`. The form is anisotropic at `ℚ₃`
both before and after scaling.

## Verified sound

**Gate and supply direction.**

- The worker's gate at this head passes every check, including the targeted build.
- I re-ran the gate. It reports `outside-folder` lines only for files of ClassFieldTheory and
  QuadraticFormInvariants, the two folders the brief names as this pull request's own.
- The dependency check output: `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`. There is no
  UPWARD or CYCLE line.
- The roadmap is on main and names no roadmap supplier: "There is no roadmap supplier".

**Lean.**

- `lake env lean` on `Suggested.lean` gives exactly 8 warnings, all "declaration uses `sorry`".
- I compared `#check @name` output for all 8 declarations with the README statements. They agree
  in generality: `K : Type u`, forms in independent universes `v` and `w`, the regularity
  hypotheses explicit, and `[FiniteDimensional]` carried in each signature. No section binder is
  lost.
- One-tactic probe on scratch copies: `by simp` closes none of the 8 and `by exact?` closes none.
  There is no padding.
- Every headline the module docstring lists (4.2, 5.5, 6.1, 6.2, 6.3, 7.3, 8.1, 8.3) is stated.
  These include the four end theorems of the Summary.
- 8.4 is the reverse direction of 6.3, and the docstring says so. 8.2 follows from 8.3 together
  with Witt decomposition.

**Library declarations at the pins.**

- I `#check`ed every dotted Lean name in the README (143 names) in one file. All resolve.
  `RegularFormClass.localHasse` at line 119 resolves under `open TauCeti` as
  `TauCeti.RegularFormClass.localHasse`.
- Exactly the eight inputs the README lists take `K : Type`:
  - `finrank_le_index_range_ideleClassNormMap`
  - `exists_sq_sub_mul_sq_iff_forall_completion`
  - `IsLocalRealization.exists_locallyRepresents_prod`
  - `hilbertSymbol_productFormula`
  - `globalInvariants_hasseProduct_eq_one`
  - `isAdmissible_globalInvariants`
  - `exists_hilbertSymbol_eq_ite`
  - `exists_pair_hilbertSymbol_eq_ite`

  Every other input is universe-polymorphic.
- `not_anisotropic_of_isLocallyIsotropic_quaternary` asks for the ternary case over every
  `L : Type u_1` in the universe of `K`. `..._of_five_le_finrank` asks for it on `presentedForm p`
  with `p.1 + 1 = finrank`. Both match 5.1 and 5.5.
- `TauCeti.WittRing.globalToLocal` uses Mathlib's `invertibleTwo` (checked with
  `pp.explicit`), as the Conventions say.
- I opened the following definitions and checked them against the README's glosses:
  - `QuadraticMap.Nondegenerate` (`Radical.lean:115`).
  - `IsLocallyIsotropic`, `LocallyRepresents`, `LocallyRepresentsScalar`, `LocallyEquivalent`
    (`Predicates.lean:51–147`).
  - `Represents` and `IsRepresentedBy` (`Representation.lean:46,49`).
  - `GlobalFormInvariants` and `IsAdmissible` (`Invariants.lean:90,190`).
  - `hilbertSymbol` (`HilbertSymbol/Basic.lean:47`).
  - `globalToLocal` and `atRealPlace` (`WittLocalization.lean:93,167`).
  - `comap_embedding_of_isReal` (`Ramification.lean:90`).
  - `equivalent_weightedSumSquares_units_of_nondegenerate'` (`IsometryEquiv.lean:177`).
- Mathlib and Tau Ceti have no Hasse–Minkowski theorem and no global square theorem at the pins.

**Sources (seeded sample).** I checked these Milne locators against `milne-cft`:

| Target | Milne, Ch. VIII | `milne-cft` lines | Result |
|---|---|---|---|
| 4.2 | Thm 1.1 and Ex. 1.3, p. 229 | 10384, 10397 | Matches; `n = 2` meets the `μ_n ⊂ K` hypothesis |
| 4.3 | Thm 3.1, p. 234 | 10629 | Cyclic Hasse norm theorem |
| 5.1 | Thm 3.5, p. 235; Prop. 3.7(b), (c), p. 236; proof of 3.5(b), p. 237 | 10686, 10698, 10772 | Matches |
| 8.2 | Prop. 6.2, p. 251 | 11574 | Matches |
| 7.4, 8.2, 8.3, 8.4 | Thm 6.3, p. 252 | 11619 | Matches; Milne's statement also covers degenerate forms, and the roadmap narrows it to its regular setting |
| 7.2, 7.4 | Thm 6.10 and Prop. 6.11, p. 255 | 11745, 11758 | Matches |
| 7.2 | Remarks on real forms before Thm 6.12, p. 256 | 11783 | Matches |

- For 5.1 `n = 3`, the README cites Thm 3.1 where Milne's text says Thm 1.1. The README is right;
  Milne's slip is listed under Source issues.
- Milne's `S` is the product over `i ≤ j` (line 11669). Remark 6.6 (line 11677) relates it to
  Serre's product over `i < j`, which is the README's convention.

**Adversarial pass.**

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| Discriminant convention | `H`, `⟨1,1⟩` | Plain discriminants `[−1]`, `[1]`; signed discriminants `[1]`, `[−1]` | Convention pinned |
| Hasse convention | `H` over `ℝ` | Product over `i<j`: `(1,−1)=1`. Product over `i≤j`: `(1,1)(1,−1)(−1,−1)=−1` | The two conventions are distinguished |
| Symbol `(a,b)=1 ⟺ b=x²−ay²` | `(−1,3)` | At `3`: `(−1/3)=−1`. At `2`: `ε(−1)ε(3)=1`, so `−1`. At `ℝ`: `1`. Product `1` | Holds |
| 4.1 transport | `ℚ(i)` with conjugation | `2+i ≡ 4` mod `(2−i)`, so a square there. Valuation `1` at `(2+i)`. `σ(2+i)=2−i` is a square at `σ𝔭̄=𝔭` | Correspondence follows `σ` |
| 4.1, 71:19a | `b=−1`, `S={3}`, `T={∞}`, `a=−3` | `ℝ`: `−1`. `3`: `−1`. `2`: `ε(−3)=0`, so `1` | Holds |
| 4.1, 71:19a | `S={5}` | `−1=2²` in `ℚ₅`, so `(a,−1)₅=1` for every `a` | The nonsquare hypothesis is needed |
| 4.1, 71:19 | `S={2}`, `T={∞}` | `(−1,−1)=−1` exactly at `2` and `∞` | Holds |
| 4.1, 71:19 | `S={3}`, `T=∅` | Odd count | Excluded by parity |
| 4.1, Hasse product | Rank 0 | All signs `1` | Holds without a rank hypothesis, as Tau Ceti states it |
| 4.2 | `a=4` | Hypothesis and conclusion both true | Holds |
| 4.2 | `a=−1`, `a=−4` | Nonsquare at every `p≡3 (4)` | Hypothesis fails, as it must |
| 4.2 | `16` with exponent `8` | An eighth power in `ℝ` and every `ℚ_p`, `p` odd, via a root of `x²+2`, `x²−2` or `x²+2x+2`; not in `ℚ` | The `n=8` analogue is false, so the statement must not be generalised |
| 4.3 | `d=−1`, `a=5` | `5=1+4`; local side holds | Both true |
| 4.3 | `d=−1`, `a=3` | Global side false; `(−1,3)₃=−1` | Both false |
| 4.3 | `d=2`, `a=−1` | `1−2=−1`; real place holds | Both true |
| 4.3 | `d=1` | `⟨1,−1⟩` is universal | Excluded by the hypothesis |
| 5.1 binary | `⟨1,1⟩`/`ℚ` | Discriminant `[1]≠[−1]` at `ℚ₃` | Both false |
| 5.1 binary | `⟨1,1⟩`/`ℚ(i)` | `1+i²=0` | Both true |
| 5.1 ternary | `⟨1,1,−3⟩` | `(−1,3)_v=−1` at `2` and `3` | Both false |
| 5.1 ternary | `⟨1,1,1⟩` | `(−1,−1)=−1` at `2` and `∞`: an even number of places | Both false |
| 5.5 | Rank 0 | Zero form anisotropic globally and at every `v` | Both false |
| 5.5 | Rank 1 | Anisotropic everywhere | Both false |
| 5.5 | `H` | Isotropic everywhere | Both true |
| 5.5 | `⟨1,1,1,1,1⟩`/`ℚ` | Anisotropic at `ℝ` | Both false |
| 6.1 | `⟨1,1⟩`, `a=3` | Fails at `ℚ₃` | Both false |
| 6.1 | `⟨1,1⟩`, `a=−1` | Fails at `ℝ` and `ℚ₂` | Both false |
| 6.1 | `a=0` | Both sides true at the zero vector | `a≠0` is required only by the route, as the README says |
| 6.2 | `⟨3⟩` into `H` | Vector `(2,−1)`: `4−1=3` | Both true |
| 6.2 | `rank Q > rank R` | — | Both false |
| 6.3 | `⟨1⟩` vs `⟨−1⟩` | Positive index `1` vs `0` at `ℝ` | Both false |
| 6.3 | `⟨1,1,−3⟩` vs `⟨1,1,−1⟩` | At `ℚ₃`: anisotropic vs isotropic | Both false |
| 6.3 | `H` vs `⟨2,−2⟩` | — | Both true |
| 7.2 | `ℚ`, rank 3, `d=[1]`, `R=⟨1,1,1⟩`, `s₂=−1` | Product `(−1)·1=−1` | Hypothesis fails |
| 7.2 | `⟨−1,−1,−1⟩` | `s₂=(−1)³`; real Hasse `(−1)^3`; product `1` | Hypotheses hold and the form realizes itself |
| 7.2 | Real signatures `(4,0)`, `(2,2)`, `(0,4)` | Hasse signs `1`, `−1`, `1` | `p_w` is needed in the record |
| 7.3 | `⟨1⟩` | Record `(1,[1],1,1)` | Admissible and realized |
| 7.3 | Zero form | Rank 0 | Realized, not admissible |
| 7.3 | Rank one, `s=−1` at two places | Product `1` | `isAdmissible_rankOne_iff_eq_empty` rules it out |
| 7.4 / 8.1 | `⟨1,1,−1⟩` vs `⟨1,2,−2⟩` | Discriminants `[−1]=[−4]`; Hasse `1` everywhere (`(2,−2)`: `−2=0²−2·1²`); index `2` | Records equal, forms isometric |
| 8.1 | `⟨1,1⟩` vs `⟨2,2⟩` | `(2,2)=1` via `4−2=2`; isometry `(x,y)↦(x+y,x−y)` | Records equal, forms isometric |
| Worked example | `ℚ(√5)`, `⟨1,θ,θ⟩` | Discriminant `θ²=[1]`; indices 3 and 1; real Hasse `1` and `−1`. `θ` is a unit of norm `−1` and `2` is inert, so only the place above `2` carries `s=−1`. Product `1` | Matches the README |
| 8.2 | `⟨1,−1,2,−2⟩` | Discriminant `[4]=[1]=d(2H)` | Hyperbolic |
| 8.2 | `⟨1,1⟩` | `[1]≠[−1]` | Not hyperbolic |
| 8.3 | `⟨1,1⟩` | Real signature `2` | Nonzero |
| 8.3 | `⟨1⟩` | Odd dimension | Nonzero at every `v` |
| 8.3 | `⟨1,1,−3⟩⊥⟨−1,−1,1⟩` | At `ℚ₃` the two summands are not isometric, and Witt cancellation applies | Nonzero |
| 8.3, complex places | — | Class `0` at one `v` gives even dimension, which is `0` in `W(ℂ)` (Tau Ceti `atComplexEmbedding_eq_zero_iff`) | Complex places add nothing |
| 7.3 route (R03) | — | Tau Ceti's local classification sees only the images `d_v` | Global `d` needs 4.2 |

**Citations of this roadmap that this pull request moves.**

- Layer 3, cited by MetaplecticAutomorphicForms (#1063, README lines 51, 1627, 1828): the overlap
  tool lists it, but the "Section and name map" maps Layer 3 to its Tau Ceti declarations
  (3.1–3.3).
- §4.4 `exists_hilbertSymbol_eq_neg_one_iff_pair`, cited by GL2AutomorphicRepresentationsAndTransfer
  (#931) and QuaternionArithmetic (#1722): the map points it to the equivalent
  `exists_pair_hilbertSymbol_eq_ite`. The `ite` form and main's per-place `↔ v ∈ Tf` form agree.
- 4.4 real symbol and product formula, cited by ClassicalArithmeticCompletion on main: mapped.
- `equivalent_of_locallyEquivalent`, cited by IntegralLattices on main: aliased in 8.4.
- Anchors `#layer-4-global-square-norm-and-approximation-lemmas`, `#61-…`, `#63-…` and `#84-…`
  still match the new headings.
- None of the dropped ids (old 4.1 vector approximation, 4.5, 5.2–5.4, 7.1, Layer 9) is cited by
  main or by any open head.
- No roadmap imports this `Suggested.lean`.

**Ownership.**

- ClassFieldTheory (this head, line 198) names this roadmap as owner of 4.2 and Hasse–Minkowski.
- QuadraticFormInvariants (this head, line 87) agrees.
- Orthogonal and Spin Groups on main (lines 940–967) assigns the `H¹` translation to Orthogonal
  Tamagawa and Lattice Mass, as 8.4 says.
- ArithmeticGaloisDuality (#858) §R02.4.5b states `Ш¹_T(K, μ_m)` for every `m`, and its case
  `m = 2` is 4.2. This roadmap is on main and already owned 4.2 there, so the citation belongs on
  ArithmeticGaloisDuality's side. That repair is for its review, not this one.

## Not verifiable

- O'Meara, *Introduction to Quadratic Forms*, is recorded as `uncertified`, so I could not read
  these locators: 58:7, 65:15, 66:1, 66:3, 66:4, 66:5, 71:19, 71:19a and 72:1. They cover the
  sampled targets 4.1 item 3, 4.2, 5.5, 6.1, 6.2, 6.3, 7.2, 7.3 and 8.1. Milne independently
  supports 4.2 (Thm 1.1), 5.5 (Thm 3.5(b)), 6.1 (Cor. 3.6, p. 236), 6.3 and 8.4 (Thm 6.3), and
  7.2 (Thm 6.12, p. 256).
- Serre, *A Course in Arithmetic*, is also `uncertified`: Ch. III §1.2 Thm 1, §2.2 Thm 3, Ch. IV
  §2.1 and §3.2 Thm 8. The convention attributed to Serre is confirmed indirectly by `milne-cft`
  line 11677.

## Source issues

- **Misprint** in milne-cft at Ch. VIII, proof of Theorem 3.5(b), p. 237: the source says the cases `n = 3, 4` follow from Proposition 3.7(c),(d) and Theorem 1.1; it should be Theorem 3.1, the Hasse norm theorem, which those reductions to norms require; affects the proof.
- **Misprint** in milne-cft at Ch. VIII, proof of Theorem 3.5(b), p. 237: the source says the induction hypothesis is Theorem 3.1b for `n − 1`; it should be Theorem 3.5(b) for `n − 1` variables; affects nothing.
- **Gap** in milne-cft at Ch. VIII, proof of Theorem 3.5(b), `n ≥ 5`, p. 237: the source says approximate `x₁, x₂` near local solutions on the exceptional set `S`; it should also require `c = a x₁² + b x₂² ≠ 0`, which nothing forces when `S` is empty and without which `cY² − r` is degenerate; affects the proof.
- **Misprint** in milne-cft at Ch. VIII, proof of Theorem 6.10, p. 255: the source says `S(q₁ ⊥ aZ²) = (a, d(q₁)) S(q₁)`, which is the recursion for the `i < j` invariant; it should be `(a, a·d(q₁)) S(q₁)` for its own `i ≤ j` invariant; affects nothing.
- **Misprint** in milne-cft at Ch. VIII, proof of Theorem 6.3, p. 252: the source names the complements `q₁, q′₁` and then `q₁, q₂`; it should be `q′₁` throughout; affects nothing.
