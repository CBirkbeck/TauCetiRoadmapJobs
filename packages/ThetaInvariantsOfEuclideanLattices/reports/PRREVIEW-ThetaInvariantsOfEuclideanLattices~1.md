# Review of ThetaInvariantsOfEuclideanLattices (pull request #2038 at def594f)

**Verdict:** needs changes

Blocking: R01 (P1) and R02 (P2). R03–R11 are P3. Paths are relative to the repository; the README
is `TauCetiRoadmap/ThetaInvariantsOfEuclideanLattices/README.md`, the Lean file
`TauCetiRoadmap/ThetaInvariantsOfEuclideanLattices/Suggested.lean`.

## R01 (P1) — the route of 1.7 rests on two results that nothing owns

**Location.** README:305–308: "Route: the value `jacobiTheta i`, by the evaluation of `E₄/θ⁸` at
`i` and the Chowla–Selberg value of the period of `y² = 4x³ − 4x` … *Needs:* Mathlib `jacobiTheta`,
`Real.Gamma`; 1.1."

**Claim.** The route, which is van der Geer–Schoof's proof of their Proposition 4 (GS98 lines
702–717), needs two inputs:

- `E₄(i)/θ(i)⁸ = 3/4`;
- `π⁴E₄(i)/ω₀⁴ = 48`, where `ω₀` is the real half-period of `y² = 4x³ − 4x`.

Neither input is a target of this roadmap or a named supplier section, and neither is a declaration
at the pins. The *Needs:* line names neither.

**Witness.** Nothing at the pinned Mathlib or Tau Ceti evaluates `E₄` at `i` or relates
`jacobiTheta` to an elliptic integral. The nearest declaration is Tau Ceti
`ZLattice.thetaForm_eq_E₄` (`TauCeti/NumberTheory/ModularForms/ThetaSeries/Eisenstein.lean:95`),
which covers even unimodular lattices of rank 8 only. `roadmaps grep` finds no roadmap that owns
either value.

**Repair.** State the inputs as targets of Layer 1, each with a locator and a *Needs:* line, and
list them in the *Needs:* of 1.7. Either route closes:

- (a) van der Geer–Schoof's two values. Computed: `E₄(i) = 1.4557629`,
  `E₄(i)/θ(i)⁸ = 0.7500000` and `π⁴E₄(i)/ω₀⁴ = 48.0000000`, with `ω₀ = Γ(1/4)²/(4√(2π))`.
- (b) Jacobi's relation `θ(i)² = 2K(1/√2)/π`. Computed: `1.1803406 = 1.1803406`. Combine it with
  Tau Ceti `legendreK_one_div_sqrt_two`
  (`TauCeti/Analysis/SpecialFunctions/EllipticIntegral/Lemniscate.lean:148`) and the reflection
  formula `Γ(1/4)Γ(3/4) = π√2`.

Either route gives `π^(1/4)/Γ(3/4) = 1.0864348`.

## R02 (P2) — the Layer 4 headlines are statable at the pins but absent from Suggested.lean

**Location.** Suggested.lean:40–44: "Not stated: README 4.1–4.5 … lacking LFunctions'
`latticeTheta` … Writing that series out over the fractional ideal here would restate LFunctions'
definition."

**Claim.** The only carrier these statements need is a real `tsum` over a fractional ideal. Every
ingredient is in Mathlib: `FractionalIdeal (𝓞 K)⁰ K`, `InfinitePlace.mk`, `InfinitePlace.mult`,
`FractionalIdeal.dual`, `FractionalIdeal.absNorm` and `NumberField.discr`. LFunctions'
`latticeTheta` is a roadmap name, not a pinned carrier. This file already writes out
GeometryOfNumbersAndQuadraticArithmetic's `ρ_1` in exactly this way for `h0θ` (Suggested.lean:15–18).
The headlines 4.2–4.5 therefore need one simple definition with a real body.

**Witness.** In a scratch copy I added this definition:

```lean
noncomputable def h0Div (K : Type*) [Field K] [NumberField K]
    (I : FractionalIdeal (𝓞 K)⁰ K) (x : InfinitePlace K → ℝ) : ℝ :=
  Real.log (∑' f : I, Real.exp (-π * ∑ σ : K →+* ℂ,
    Real.exp (-2 * x (InfinitePlace.mk σ) / (InfinitePlace.mk σ).mult) * ‖σ (f : K)‖ ^ 2))
```

With it, the following elaborate under `lake env lean` with only `sorry` warnings:

- 4.3: `I ≠ 0 → h0Div K I x - h0Div K (FractionalIdeal.dual ℤ ℚ I) (-x) = (∑ v, x v - Real.log (FractionalIdeal.absNorm I)) - Real.log |(discr K : ℝ)| / 2`;
- 4.2 for `spanSingleton _ f⁻¹ * I` and `x v - v.mult * Real.log (v f)`;
- 4.5 with its degree-zero hypothesis.

The 4.3 statement checks on two fields:

- ℚ, `I = ℤ`, `x = 1`: `1.0000000 − 0.0000000 = 1`;
- ℚ(i), `I = ℤ[i]`, `x = 0`: `2(0.0037279 − 0.3503015) = −0.6931472 = −½ log 4`.

**Repair.** Add this definition under a name of this roadmap. Add a section
`/-! ## Layer 4: Arakelov divisors of a number field -/` stating 4.2, 4.3, 4.4 (an `∃ β`
before the `∀ D`) and 4.5. Delete the "Not stated" paragraph of the module docstring, and name the
definition in README 4.1.

## R03 (P3) — 3.3 at `x = 0` is GeometryOfNumbersAndQuadraticArithmetic's `gaussian_variable_tail`

**Location.**

- README:50–56: "the scale and tail bounds at radius `√n` … This roadmap adds … the tail bound at
  every radius with the coset factor one (3.3)".
- README:435–436: the route and *Needs:* of 3.2 use 3.3, at `x = 0` only.

**Claim.** GeometryOfNumbersAndQuadraticArithmetic §4.4 proves `gaussian_variable_tail` (line 1830
of its README at its head). For every `c ≥ (2π)^(−1/2)`, it bounds the unshifted mass at norm at
least `c√n` by `b(c)ⁿ ρ_1(L)`. At `c = t/√(2π)`, `b(c) = t·exp(−(t² − 1)/2)`, so this is 3.3 at
`x = 0`, at every radius. The Scope paragraph lists only bounds "at radius `√n`" for that roadmap.
What 3.3 adds is the shift `x`, which 3.2 does not use.

**Witness.** At `t = 2.6`, `b(t/√(2π)) = 0.1459504`, and 3.3's factor is
`2.6·e^(−2.88) = 0.1459504`.

**Repair.**

- In Scope, list `gaussian_variable_tail` (GeometryOfNumbersAndQuadraticArithmetic §4.4) as that
  roadmap's.
- Say in one clause that 3.3 differs only by the shift `x ∈ E`, with coset factor one.
- In the route and *Needs:* of 3.2, cite `gaussian_variable_tail` in place of 3.3.

## R04 (P3) — Groenewegen's Proposition 4.4 does not state the inequality of 3.1

**Location.** README:417: "(Bost, Proposition 2.6.2, (2.6.4) and (2.6.6), p. 21; Groenewegen,
Proposition 4.4, p. 148)".

**Claim.** Groenewegen's Proposition 4.4 (Gro01, p. 148) states a different bound:

- it assumes that the minimum is at least `√n`;
- it bounds `k⁰(L)` by `1` plus `3ⁿπ/(π − log 3)` times `e^(−πλ²)`;
- it has no factor `(1 − n/(2πr²))⁻¹` and no regime `n < 2πr²`.

Bost calls his Proposition 2.6.2 a slightly improved version of it (Bos15 line 1490).

**Witness.** At `2ℤ` with `λ = 2`, Groenewegen's bound on `exp h0θ − 1` is `0.0000161`; the bound of
3.1 is `0.0000109`.

**Repair.** Cite Groenewegen as "cf. Proposition 4.4, the weaker form for `λ₁ ≥ √n`", or drop him
from the locator of 3.1.

## R05 (P3) — the lattice-point count in the route of 3.1 is owned by SieveMethodsAndPrimePatterns §0.11a

**Location.** README:418–421: "`N_L(ρ) = #{v ∈ L | ‖v‖ ≤ ρ} ≤ (2ρ/r + 1)ⁿ` by disjoint balls …
*Needs:* 1.1; Mathlib `Real.Gamma`, `MeasureTheory.Measure.addHaar_ball`."

**Claim.** SieveMethodsAndPrimePatterns comes earlier in the merge order, and
GeometryOfNumbersAndQuadraticArithmetic §4.1 already defers to it. Its §0.11a "first-minimum bound"
proves `|L ∩ K| ≤ (⌊2/λ₀⌋ + 1)^d` for a symmetric convex body `K` and a full lattice `L`. With `K`
the closed ball of radius `ρ`, this is the count in the route. 3.1 re-derives that count instead of
citing it.

**Witness.** `TauCetiRoadmap/SieveMethodsAndPrimePatterns/README.md:1011`, at the head of its pull
request.

**Repair.** In the route and *Needs:* of 3.1, cite SieveMethodsAndPrimePatterns §0.11a (the
first-minimum bound, for `K` the closed `ρ`-ball) in place of the disjoint-ball argument, and keep
`Real.Gamma`. Checked on `2ℤ` with `ρ = 5`: the count is `5 ≤ ⌊10/2⌋ + 1 = 6`.

## R06 (P3) — the routes of 4.4 and 4.5 move a complex place by `u` where it must move by `2u`

**Location.**

- README:540–541: "raise `D` to degree `½ log|Δ_K|` by `u = (½ log|Δ_K| − deg D)/n` at every
  place".
- README:560: "lower `D` to `D′` of degree `0` by `u = deg D/n` at every place".

**Claim.** Moving every `x_v` by `u` changes the degree by `(r₁ + r₂)u`, not by `nu`. Van der Geer
and Schoof move a real place by `u` and a complex place by `2u` (GS98 lines 533–538 and 662–667).

**Witness.** Take ℚ(i) and `D = (ℤ[i], 2)`, so `deg D = 2` and `u = 1`.

- Moving by `u` gives `(ℤ[i], 1)`, of degree `1`, not `0`.
- Moving by `mult v · u` gives `(ℤ[i], 0)`, of degree `0`.

**Repair.** In both routes, write "replace `x_v` by `x_v ± mult v · u`". This scales `‖·‖_D` by
`e^(∓u)`.

## R07 (P3) — the projected lattice is called discrete and full without a supplier

**Location.**

- README:90–91: "the quotient lattice is then discrete and full in `K^⊥`".
- README:374 and README:390–391: the *Needs:* lines of 2.3 and 2.4.

**Claim.** Two targets depend on this fact:

- 2.3 needs `π_(K^⊥)(L)` discrete. Otherwise its `tsum` is the junk value `0`, and at
  `K = ℝ(1, √2)` the statement would read `0.1658 ≤ 0`.
- 2.4 applies 1.2 inside `K^⊥`, which needs both instances on the projected lattice.

GeometryOfNumbersAndQuadraticArithmetic §0.2.2 `projected_adapted_basis` (line 293 of its README at
its head) proves the projection discrete and full.

**Witness.** That roadmap's Check, that the projection of `ℤ²` off the diagonal is the integral span
of the projected `e₂`, agrees with this README's witness `ℤ(½, −½)`.

**Repair.** Cite GeometryOfNumbersAndQuadraticArithmetic §0.2.2 `projected_adapted_basis` in
Conventions and in the *Needs:* of 2.3 and 2.4.

## R08 (P3) — `h0θ_nonneg` carries two hypotheses it does not need

**Location.**

- Suggested.lean:78: `theorem h0θ_nonneg [FiniteDimensional ℝ E] (L : Submodule ℤ E) [DiscreteTopology L]`.
- README:227.

**Claim.** The inequality holds for every ℤ-submodule of every normed group. If the series is
summable, its `tsum` is at least the term `1` at `0`. If it is not, the `tsum` is `0` and
`log 0 = 0`.

**Witness.** A probe theorem for `{G} [NormedAddCommGroup G] (L : Submodule ℤ G)` elaborates with
no `sorry`; the proof is six tactic lines (a case split on summability, then
`Summable.le_tsum` or `tsum_eq_zero_of_not_summable`). For the non-discrete `ℤ + √2ℤ ⊂ ℝ` it gives
`h0θ = 0 ≥ 0`.

**Repair.**

- Drop `[FiniteDimensional ℝ E]` and `[DiscreteTopology L]` from `h0θ_nonneg`.
- In README 1.3, say "for every `L : Submodule ℤ E`".
- `h0θ_eq_zero_iff` keeps both hypotheses; the third Check of 1.3 is the witness that it needs them.

## R09 (P3) — two Check values are wrong in their last digits

**Location.**

- README:200: "`log 0.0864348 = −2.44838`".
- README:347: "`0.9135791 · 1.0864348 = 0.9925425 < 1.1803405`".

**Witness.** `log 0.0864348112 = −2.4483648`. `0.9135791 · 1.0864348 = 0.9925442`.
`1.0864348² = 1.1803406`.

**Repair.** Write `−2.44836`, `0.9925442` and `1.1803406`.

## R10 (P3) — the definitions of 1.1 and 4.1 have no API list

**Location.** README:187–195 (1.1) and README:480–489 (4.1). Each is prose followed directly by
**Checks.**

**Claim.** Later targets use facts about these definitions that are stated nowhere:

- summability for a discrete `L` in a finite-dimensional `E`;
- `exp(h0θ L)` equals the sum, which 3.1 and 3.2 use because they are stated with `exp(h0θ L)`;
- invariance of `h0θ` under isometric isomorphisms, which 2.3 and 2.4 use to read `L ∩ K` and
  `π_(K^⊥)(L)`, and 4.1 uses to read `O(D)`;
- `h⁰(D) = h0θ` of the Euclidean lattice `O(D)`.

**Witness.** `exp(h0θ ℤ) = exp(0.0829015) = 1.0864348`, which is the sum.

**Repair.** After each definition, add an API bullet list stating these facts with their hypotheses.
Give the locators where they exist: Tau Ceti `ZLattice.summable_exp_neg_mul_norm_add_sq` for
summability, and Bost (2.2.4) for `O(D)`.

## R11 (P3) — Research context repeats an overstatement of an abstract

**Location.** README:596–597: "(Tran–Tian–Feaver 2023), whose abstract states it for every field of
unit rank `0` or `1`".

**Claim.** The abstract does say this (TTF23 lines 10–11). The paper's own introduction (TTF23 lines
21–26) cites proofs only for:

- quadratic fields;
- certain pure cubic fields;
- quadratic extensions of imaginary quadratic fields.

**Witness.** `ℚ(ζ₅)` is Galois over ℚ and has unit rank `1`. Its only quadratic subfield, `ℚ(√5)`,
is real. So it is in none of the listed families, yet within the conjecture.

**Repair.** Delete the clause "whose abstract states it for every field of unit rank `0` or `1`";
the sentence's list of families stays.

## Verified sound

**Gate and build.**

- Gate: the worker's gate at def594f reports every scanner at `0` and the build `OK`
 .
- `lake env lean` on Suggested.lean prints 16 "declaration uses `sorry`" warnings (lines 71, 78,
  84, 90, 98, 106, 113, 119, 127, 135, 146, 156, 166, 178, 188 and 199) and nothing else.
- The imports are `Mathlib` and `TauCeti.Algebra.Module.ZLattice.Dual`, which exists at the pin.
- There is no `set_option`, no sorry'd data and no `lemma`.

**Dependency check.** The output, verbatim:

```text
depcheck: 236 roadmaps, 2265 edges, 0 problem(s)
```

The roadmap sits at line 141 of the merge order. Its suppliers are earlier:
GeometryOfNumbersAndQuadraticArithmetic (line 55), ArakelovGeometryAndAbelianHeights (line 140) and
LFunctions (line 27). LFunctions and ThetaSeries are on main.

**Elaborated signatures.** I compared the elaborated type of all 18 declarations
(the worker's elaborated-signature list, with six re-elaborated by `#check @` in my probe file, identical) with the
README.

- The only binder that does not appear is `[InnerProductSpace ℝ E]` on `h0θ`. This is harmless: its
  body uses only the norm.
- The README and the Lean statements have the same generality for all 16 theorems; R08 notes the one
  unneeded pair of hypotheses.

**Headline theorems.** The README Summary lists 1.2–1.7, 2.1–2.4, 3.1–3.3 and 4.2–4.5, with the
definitions of 1.1 and 4.1.

- Lean states every one of them from Layers 1–3.
- Layer 4 is absent although statable (R02).

**Padding.** Decided by reading, with one probe:

- Every theorem other than `h0θ_nonneg` needs Poisson summation, a summability argument or a
  counting argument, so none closes in one tactic.
- `h0θ_nonneg` needs a case split on summability (R08).
- Even the boundary fact `h0θ ⊥ = 0` does not close with `simp [h0θ, tsum_fintype]`.
- No declaration restates a definition or mirrors a Check.

**Seeded sample of locators.** All 15 checked against the text.

| target | locator in README | found in the source | verdict |
|---|---|---|---|
| 1.2 | Bost (2.1.6), (2.2.3), p. 13; Groenewegen Th. 3.2, p. 146 | Bos15 lines 1066–1071, 1102 (p. 13); Gro01 p. 146, multiplicative form with `vol L^† = (vol L)⁻¹` | matches |
| 1.3 | Bost Prop. 2.3.1, p. 14; (2.3.2) | Bos15 lines 1136–1137 (nonnegative; positive in positive rank), line 1142 (p. 14) | matches |
| 1.4 | Bost Prop. 2.3.2 (1) and equality, p. 14 | Bos15 lines 1143–1170; equality in (2.3.5)/(2.3.6) is exactly "norm-preserving on `L`" and "`φ(L) = M`" | matches |
| 1.5 | Bost Cor. 2.3.4, p. 16 | Bos15 lines 1213–1218 | matches |
| 1.6 | Bost Prop. 2.5.1, p. 18 | Bos15 lines 1331–1332 | matches |
| 2.2 | Bost Lemma 2.8.2, p. 25 | Bos15 lines 1712–1725; proof lines 1737–1754 uses (2.1.7) as the route says | matches |
| 2.3 | Bost Prop. 2.8.1, p. 25; Groenewegen Lemma 5.3, p. 149 | Bos15 lines 1692–1702, equality iff split; Gro01 p. 149, hypothesis "`πL` discrete", which for a full `L` is the README's `hK` | matches |
| 2.4 | Bost (2.8.3), p. 25 | Bos15 line 1705 | matches |
| 3.1 | Bost Prop. 2.6.2, (2.6.4), (2.6.6), p. 21; Groenewegen Prop. 4.4 | Bos15 lines 1477–1488, at `λ = λ₁ > (n/2π)^(1/2)`; the README's `r ≤ λ₁` form follows because the right side decreases in `r` | Bost matches; Groenewegen does not (R04) |
| 3.2 | Bost Cor. 3.2.3, (3.2.6), p. 34 | Bos15 lines 2111–2126 (pp. 33–34); `t > 1` in the README is the correct strict hypothesis (see Source issues) | matches |
| 3.3 | Bost Prop. 3.2.2, (3.2.4), p. 33; Lemma 3.2.1 | Bos15 lines 2096–2107 (p. 33), line 2051 (p. 32) | matches |
| 4.1 | vdG–S §2 (metric), §3 (`h⁰`); Bost (2.2.4), p. 13 | GS98 lines 108–114 (`e^(−2x)` real, `2e^(−x)` complex), lines 237–247; Bos15 line 1108 | matches |
| 4.2 | vdG–S §3 | GS98 lines 248–250; principal divisors lines 89–91 (`−log|σf|` or `−2 log|σf|`) | matches |
| 4.3 | vdG–S Prop. 1; Bost (2.2.6), p. 14; Groenewegen Prop. 6.4, p. 154 | GS98 lines 258–260 (p. 7); Bos15 line 1131; Gro01 p. 154 | matches |
| 4.5 | vdG–S Prop. 3 | GS98 lines 659–660 (p. 15) | matches; route normalisation see R06 |

Outside the sample, these also match:

- 1.1: Bos15 (2.2.1)–(2.2.2), p. 13.
- 1.7: GS98 Prop. 4, line 699, p. 16.
- 2.1: Bos15 (2.1.7), lines 1073–1079; Gro01 Lemma 5.2, p. 148.
- 4.4: GS98 Cor. 1 of Prop. 2, lines 549–551, p. 13.
- The Quillen attribution: Bos15 lines 1707–1708.
- Francini's quadratic case: GS98 lines 655–656.
- The regulator of ℚ(√41): GS98 line 317.
- The Check of 3.2 that Groenewegen's bound is better for large `λ₁`: Bos15 lines 2148–2155.
- CKM+19 Theorem 1.4 (universal optimality with uniqueness among periodic configurations): lines
  290–295.

**Adversarial pass.** Every value below was recomputed in floating point (sums truncated at
`|n| ≤ 60`).

| statement | instances | computed values | result |
|---|---|---|---|
| 1.1 `h0θ` | `⊥`; `ℤ`; sum over `L ∖ 0` | `0`; `0.0829015`; `log 0.0864348 = −2.44836` | sound; Check digit slip (R09) |
| 1.1 `h1θ` | `2ℤ` | `h1θ 2ℤ = 0.6931542`, `h0θ 2ℤ = 0.0000070` | sound |
| Gaussian convention | weight `e^(−‖v‖²)` vs `e^(−π‖v‖²)` at `2ℤ`, `½ℤ` | `−1.2295356` vs `−0.6931472 = −log 2` | witness correct |
| 1.2 | `ℤ`; `2ℤ`; rank 0 | `0 = 0`; `0.0000070 − 0.6931542 = −0.6931472 = −log 2`; `0 = −log 1` | holds |
| 1.3 `h0θ_nonneg` | `ℤ + √2ℤ` (not discrete) | `tsum = 0`, `h0θ = 0 ≥ 0` | holds without its hypotheses (R08) |
| 1.3 `h0θ_eq_zero_iff` | `⊥`; `2ℤ`; `ℤ + √2ℤ`; `ℤ`-span of an orthonormal sequence in `ℓ²` | `0`; `0.0000070 > 0`; `0` but `≠ ⊥`; `0` but `≠ ⊥` | holds; both hypotheses needed |
| 1.4 | `½·id: ℤ → ½ℤ`; projection `ℤ² → ℤ`; `2ℤ ⊆ ℤ`; `φ = 0` | `0.0829015 ≤ 0.6931542`; `0.1658030 > 0.0829015` (not injective); `0.0000070 < 0.0829015` (strict, not onto); forces `L = ⊥`, `0 ≤ h0θ M` | holds; iff checked both ways |
| 1.5 | `2ℤ ⊆ ℤ`; `⊥ ≤ ℤ` | `0.0829015 − 0.6931472 = −0.6102457 ≤ 0.0000070`; `relIndex = 0` excluded (`0.0829 ≤ 0` would fail) | holds |
| 1.6 | `ℤ × ℤ` in `WithLp 2`; sup norm | `0.1658030 = 2 · 0.0829015`; `log 1.3457671 = 0.2969642` | holds; `ℓ²` needed |
| 1.7 | `θ(i)`; `Γ(1/4)` in place of `Γ(3/4)` | `1.0864348112 = π^(1/4)/Γ(3/4)`; `0.3672031 < 1` | true; route unowned (R01) |
| 2.1 | `ℤ`, `x = ½`; `x = 1`; `ℤ²`, `x = (½, 0)`; rank 0 | `0.9135791 < 1.0864348`; equal; `0.9925442 < 1.1803406`; `1 = 1` | holds; Check digit slip (R09) |
| 2.2 | `ℤ²`, `K = ℝ(1,1)`, `g = (½,−½)`; `K = ℝe₁`, `g = e₂`; `K = ⊥`, `⊤` | `0.0864281 = e^(−π/2)·0.4157606 ≤ e^(−π/2)·1.0037349`; equality `e^(−π)·1.0864348`; one point; equality | holds |
| 2.3 | `ℤ²`, `K = ℝ(1,1)`; `K = ℝe₁`; `K = ℝ(1,√2)` without `hK` | `0.1658030 < 0.0037279 + 0.3503015 = 0.3540294`; `0.1658030 = 2·0.0829015`; `0.1658 ≤ 0` false | holds; `hK` needed |
| 2.3 iff | `K = ℝ(1,1)`; `K = ⊥`, `⊤` | `π_(K^⊥)(1,0) = (½,−½) ∉ ℤ²` and strict; condition true and equality | holds both ways |
| 2.4 | `ℤ²`, `K = ℝ(1,1)`; `K = ⊥` | duals `ℤ(½,½)`, `ℤ(1,−1)`: `0.1658030 < 0.3540294`, defect `0.1882264` = 2.3's; equality | holds |
| 3.1 | `2ℤ`, `r = 2`; `r = −10`; `r = 0.3`; rank 0 | `0.0000070 ≤ 0.0000109`; `0.0864 ≤ 1.1·10⁻¹³⁶` false (so `r > 0` needed); `1 − 1/(2π·0.09) = −0.768`; `0 ≤ e^(−πr²)` | holds; hypotheses needed |
| 3.2 | `2ℤ`, `t = 5.0132566`; `t = 1` | `q = 0.0000288`, `0.0000070 ≤ 0.0000288`; `q/(1−q) = 1/0 = 0` junk | holds; `t > 1` needed |
| 3.3 | `ℤ`, `x = ½`, `t = 1`; `ℤ`, `x = 0`, `t = 2.6`; rank 0 | `0.9135791 ≤ 1.0864348`; `0.0000070 ≤ 0.1585656`; `1 ≤ 1` | holds; `x = 0` case owned elsewhere (R03) |
| 4.1 | ℚ, `x = 0, 1`; ℚ(i), `x = 0`, weight `2` vs `1` | `0.0829015`, `1.0000000`; `2·0.0037279` vs `2·0.0829015` | sound |
| 4.2 | ℚ, `f = 2`: `(½ℤ, −log 2)` vs `(½ℤ, +log 2)`; `f = −1` | `0.0829015` vs `1.3862944`; unchanged | holds; sign pinned |
| 4.3 | ℚ, `x = 1`; ℚ(i), `x = 0`; weight `mult·e^(−2x)` at ℚ(i), `x = 1`; `I = 0` | `1.0000000 − 0.0000000 = 1`; `−0.6931472 = −½ log 4`; `2 − log 2 = 1.3068528 ≠ 0.3068528`; `log 0` junk, excluded by `I ≠ 0` | holds |
| 4.4 | ℚ, `x = −½`, `−1` | `0.0003910` vs `e^(−πe) = 0.0001955`; `1.658·10⁻¹⁰` vs `8.290·10⁻¹¹`; ratio → `2` | holds with `β ≥ 2`; route normalisation (R06) |
| 4.5 | ℚ, `x = 1`; ℚ(i), `D = (ℤ[i], 2)` | `1.0000000 ≤ 1.0829015`; degree after the route's shift is `1 ≠ 0` | statement holds; route fixed by R06 |
| Conventions: degree and principal divisors | ℚ, `(2)` | `(ℤ, x) ↦ (½ℤ, x − log 2)`, degree `x − log 2 + log 2 = x`; agrees with ArakelovGeometryAndAbelianHeights §1.7 Check "`O((2)) = ½ℤ` with norm `2|·|`" | sound |
| Conventions: `κ − D` | ℚ(i) | trace dual of `ℤ[i]` is `½ℤ[i]`; `deg κ = log 4` | sound |
| Conventions: admissible extension | `ℤ²`, `K = ℝ(1,1)`; `K = ℝ(1,√2)` | `L ∩ K = ℤ(1,1)`, `π = ℤ(½,−½)`; `L ∩ K = 0` | sound |
| Non-target after 1.3 | hexagonal, `ℤ²`; fcc, bcc, `ℤ³` (covolume 1) | `0.1480710 < 0.1658030`; `0.2082624 = 0.2082624 < 0.2487046` | sound |

**Library declarations opened at the pins.**

Tau Ceti `2fd255d` (paths under `TauCeti/`):

- `ZLattice.dual`: `Algebra/Module/ZLattice/Dual.lean:78`.
- `ZLattice.mem_dual`: `Dual.lean:89`.
- The `DiscreteTopology` and `IsZLattice` instances on the dual: `Dual.lean:160` and `:165`.
- `ZLattice.dual_dual`: `Dual.lean:173`, under `[FiniteDimensional] [DiscreteTopology] [IsZLattice]`
  (line 158).
- `ZLattice.covolume_dual`: `Algebra/Module/ZLattice/Covolume.lean:273`.
- `ZLattice.summable_exp_neg_mul_norm_add_sq`: `Algebra/Module/ZLattice/Summable.lean:42`. It needs
  only `[DiscreteTopology L]` in a finite-dimensional normed space, which supports the claim in 1.1
  for non-full `L`.
- `ZLattice.summable_poisson_left`: `Analysis/Distribution/SchwartzSpace/ZLattice.lean:76`.
- `SchwartzMap.gaussian`: `Analysis/Distribution/SchwartzSpace/Gaussian.lean:56`.
- `TauCeti.fourier_gaussian_of_im_pos`: `Analysis/SpecialFunctions/Gaussian/FourierTransform.lean:46`.
- `SchwartzMap.tsum_eq_tsum_dual_fourier`: `Analysis/Fourier/PoissonSummation.lean`.
- `ZLattice.thetaSeries`: `NumberTheory/ModularForms/ThetaSeries/Basic.lean:102`. Its exponent is
  `π i ‖v‖² τ`, which confirms the witness in Conventions.
- `thetaSeries_S_smul`: `ThetaSeries/Inversion.lean:104`. It holds in even dimension `2k` only, so
  1.2 is not already at the pin.
- `legendreK_one_div_sqrt_two` and `lemniscateConstant_eq_Gamma`:
  `Analysis/SpecialFunctions/EllipticIntegral/Lemniscate.lean:148` and `:98`.

Mathlib (paths under `Mathlib/`):

- `Real.tsum_exp_neg_mul_int_sq`: `Analysis/SpecialFunctions/Gaussian/PoissonSummation.lean:120`.
- `Submodule.HasOrthogonalProjection`: `Analysis/InnerProductSpace/Projection/Basic.lean:48`.
- `Submodule.orthogonalProjectionOnto`: `Projection/Basic.lean:120`.
- `Submodule.starProjection`: `Projection/Basic.lean:131`.
- `WithLp.linearEquiv`: `Analysis/Normed/Lp/WithLp.lean:236`.
- `FractionalIdeal.absNorm`: `RingTheory/FractionalIdeal/Norm.lean:60`.
- `FractionalIdeal.dual`: `RingTheory/DedekindDomain/Different.lean:230`.
- `NumberField.RingOfIntegers.instFintypeClassGroup`: `NumberTheory/NumberField/ClassNumber.lean:59`.
- `NumberField.Units.unitLattice_rank`: `NumberTheory/NumberField/Units/DirichletTheorem.lean:385`.
- `MeasureTheory.Measure.addHaar_ball`: `MeasureTheory/Measure/Lebesgue/EqHaar.lean:456`.
- All 15 files named in the Mathlib contract exist.

**Cross-roadmap citations resolved.**

- GeometryOfNumbersAndQuadraticArithmetic, at the head of its pull request (README line numbers):
  - §4.4.4 `latticeGaussianSum`: line 1749.
  - §4.4.6, the Poisson identity: line 1765.
  - §4.4.7 `gaussian_shift_le`: line 1769.
  - §4.4.8 `gaussian_scale_le`: line 1778.
  - §0.3.1 `covolume_projection`: line 356.

  Each states what this roadmap consumes.
- ArakelovGeometryAndAbelianHeights, at its head: §1.7 (line 349) has the pairs `(𝔞, λ)`, the
  degree, `(f) = (f𝓞_K, −mult v · log|f|_v)`, `O(D) = (𝔞⁻¹, e^(−λ_v/mult v)|·|_v)` and the exact
  sequence, as the Conventions say.
- LFunctions, on main: Layer 1 has `latticeTheta` and `latticeTheta_inv` (README lines 510–513),
  with weight `y_w|x_w|²` per place, which matches the parameter of 4.1. `coe_dualIdealLattice` is
  declared in its Suggested.lean at line 613.
- ThetaSeries, on main: Layers 1–3 and Layer 8 (`A₂`, `D₄`) exist.

**Ownership and overlaps.**

- `roadmaps grep` for `h⁰_θ`, theta invariants, size function, van der Geer and Groenewegen finds no
  other owner of the logarithmic invariants or of Layer 4.
- I read the closest open roadmaps: ThetaSeries, GeometryOfNumbersAndQuadraticArithmetic (and its
  Part II), LatticePackingsAndPerfectForms and ArakelovGeometryAndAbelianHeightsPartII. Only the
  overlaps of R03, R05 and R07 appear.
- The overlap report: no open pull request changes this roadmap, no cited id is dropped, and no
  cited id is defined only by an open revision.
- Nothing in the pull request lies outside the roadmap folder; the folder holds only README.md,
  Suggested.lean and metadata.toml.

## Not verifiable

- Montgomery, "Minimal theta functions" (1988), cited in the non-target paragraph after 1.3 for "at
  `α = 1` for the forms of discriminant `−1`". It is outside the sample and I did not fetch it. The
  hexagonal value itself was recomputed (`0.1480710 < 0.1658030`), so only the stated normalisation
  rests on the paper.
- Banaszczyk (1993), Francini (2001, 2004), Tran (2017) and Tran–Tian (2018), cited in Research
  context without targets. I did not open them. Their attributions were checked only through GS98
  lines 655–656 and TTF23 lines 21–26.

## Source issues

- **Misprint** in Bos15 at Corollary 3.2.3, p. 33: the source says the first minimum may equal `(n/2π)^(1/2)`, where the bracket in (3.2.5)–(3.2.6) is `1` and both bounds divide by zero; it should be the strict inequality `λ₁ > (n/2π)^(1/2)`, as p. 34 then assumes; affects nothing.
- **Misprint** in Gro01 at Proposition 4.4, proof, p. 148: the source says the final bound ends with the factor `e^(+πλ²)`; it should be `e^(−πλ²)`, as in the statement; affects nothing.
- **Misprint** in Gro01 at Lemma 5.3, proof, p. 149: the source says the squared norm of `x + y` for orthogonal `x`, `y` is the product of the squared norms; it should be their sum; affects nothing.
- **Misprint** in GS98 at §6, the definition of `η` and the next display, p. 16: the source says `k⁰(O_F)` is a sum over the inverse different and that `h⁰(κ)` equals `exp(η(F)√|Δ|)`; it should be a sum over `O_F` and `log(η(F)√|Δ|)`; affects nothing.
- **Gap** in TTF23 at the abstract, p. 1: the source says the conjecture was proved for all number fields of unit rank 0 and 1; it should name only the families its introduction cites (quadratic, some pure cubic, quadratic extensions of imaginary quadratic fields); affects nothing.
