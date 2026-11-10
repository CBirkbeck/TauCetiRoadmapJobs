# Review of AlgebraicCurves (pull request #1807 at 62d686c)

**Verdict:** needs changes

Against main, this head changes two things in the folder: the module-system header of `Suggested.lean`, and
one consumer sentence in the README's contract table (line 1803). Both are correct (see Verified sound).
The findings below are about the folder as it stands at this head. R01 and R03 are already repaired in the
AlgebraicCurves text at the head of #1854, which that pull request's description orders after this one.

## R01 (P2) — The acceptance file and the README say the pins lack headline theorems that the Tau Ceti pin proves

**Location.** `TauCetiRoadmap/AlgebraicCurves/Suggested.lean` lines 27–35, module docstring: "the pins have no
residue of a differential at a place of a function field"; "the pins have no regular projective model attached
to a function field and no category of regular projective curves over a field". README lines 397–399:
"`Suggested.lean` states the headline theorems the pinned libraries do not prove (Layer 8's tensor-domain
criterion and genus non-increase, Layer 11's finiteness theorem)". README line 347: "proves the headline
theorems of Layers 0–7 and 10".

**Claim.** Every headline that the README and docstring call missing or unstatable is proved at the Tau Ceti
pin `2fd255d9`, the same pin as main. Layers 8, 9, 11 and 12 then plan this proved material as new work and
cite none of it:

- Layer 8: the tensor-domain criterion, smooth-model genus conservation, genus non-increase and the δ-formula
  for the drop.
- Layer 9: the residue theorem.
- Layer 11: rigidity, the Weierstrass-point counts and finiteness.
- Layer 12: 12B (the model and its projectivity), 12C (the anti-equivalence) and 12E(ii) (the genus
  comparison).

The Route decision (lines 36–42) also rests on a premise that is false at the Tau Ceti pin: "no coherent
cohomology, … no divisors on schemes".

**Witness.** Elaborated at the pins:

- `TauCeti.finsum_traceResidue_kaehlerBasisOfSeparating_coord_eq_zero` (`TauCeti/FieldTheory/FunctionField/Differential/Independence.lean:386`);
- `TauCeti.AlgebraicGeometry.RegularProjectiveCurveCat.equivFunctionFieldCat : RegularProjectiveCurveCat k ≌ (FunctionFieldCat k)ᵒᵖ` (`TauCeti/AlgebraicGeometry/Curves/TwoChartModel/AntiEquivalence.lean:397`).

**Repair.**

- **Docstring.** Replace the "not statable" list with the pinned names:
  - residue theorem: `TauCeti.finsum_traceResidue_kaehlerBasisOfSeparating_coord_eq_zero`;
  - 12B: `TauCeti.AlgebraicGeometry.twoChartModel` and `AlgebraicGeometry.Scheme.isProjectiveOver_of_isCurveOver`;
  - 12C: `TauCeti.AlgebraicGeometry.RegularProjectiveCurveCat.equivFunctionFieldCat`;
  - 12E(ii): `TauCeti.AlgebraicGeometry.twoChartModel.genus_eq_genus`;
  - the three theorems of R03.
- **README lines 347 and 397–399.** Say that every headline is proved at the pin, except R02's.
- **README targets.** Cite each pinned name at its target:
  - Layer 8 item 2: `TauCeti.isDomain_tensorProduct_of_separating`.
  - Layer 8 item 3: `TauCeti.AlgebraicGeometry.genus_functionField_eq_of_isPullback` and
    `TauCeti.AlgebraicGeometry.genus_eq_genus_functionField_of_constantCompositum_eq_top`.
  - Layer 8 drop: `TauCeti.genus_le_genus_of_constantCompositum_eq_top` and
    `TauCeti.genus_eq_genus_add_finsum_singularityDegree`.
  - Layer 9: the residue theorem above.
  - Layer 11: `TauCeti.eq_one_of_two_mul_genus_add_three_le_card`,
    `TauCeti.two_mul_genus_add_three_le_ncard_setOf_weierstrassWeight_ne_zero` and
    `TauCeti.finite_algEquiv_of_two_le_genus`.
  - Layer 12: the 12B, 12C and 12E(ii) names above, plus
    `TauCeti.AlgebraicGeometry.SchemeWeilDivisor.genus_eq_genus_functionField`
    (`TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/SerreDuality.lean:245`).
- **Restated targets.** Delete each target whose statement the pin proves, and keep what it does not.
- **Route decision.** Restate its premise against the pinned `TauCeti/AlgebraicGeometry/Curves/Cohomology.lean`
  and `SchemeWeilDivisor` (`TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Basic.lean:45`).
- **Where the text already exists.** #1854's head carries this text: its README lines 347–360,
  1505–1528 and 1707–1773, and its `Suggested.lean` docstring. Either copy it here, or move this pull
  request's AlgebraicCurves changes into #1854, which already has this PR's consumer sentence (its README
  line 1924).

## R02 (P2) — Layer 11's finiteness headline is narrowed to characteristic zero

**Location.** README line 1432: "the headline theorem over algebraically closed characteristic-zero `k`
(`finite_algEquiv_of_two_le_genus`…)". Lines 1447–1449 and 1663–1664 exclude "general perfect-field
positive-characteristic automorphism finiteness". `Suggested.lean` line 93 has `[IsAlgClosed k] [CharZero k]`.

**Claim.** For g ≥ 2, `Aut(F/k)` is finite over every algebraically closed field. The characteristic-zero
restriction comes from the chosen route (classical Weierstrass points), not from the mathematics. The
roadmap's own Layer 11 reference, `Stichtenoth1973a`, bounds `|Aut|` in characteristic p. The pinned
`TauCeti.finite_algEquiv_of_two_le_genus` needs the gaps at every place to be pairwise distinct in `k`,
which fails for non-classical curves. This is the "general library" principle: the general statement is
wanted even though it costs more work.

**Witness.** The Hermitian curve `y³ + y = x⁴` over `k = 𝔽̄₃`:

- genus 3, with gaps `{1, 2, 5}` at `P_∞` (semigroup `⟨3, 4⟩`);
- `(2 : k) = 5`, so the pinned `hgaps` fails, and `[CharZero k]` excludes it here;
- yet `Aut ≅ PGU₃(3)` has order `27·28·8 = 6048`.

**Repair.**

1. State the following in `Suggested.lean`. It elaborates at the pins with only the `sorry` warning.

   ```lean
   theorem finite_algEquiv_of_two_le_genus {k : Type u} {F : Type v} [Field k] [Field F]
       [Algebra k F] [IsAlgClosed k] (hF : TauCeti.IsFunctionField k F)
       (hg : 2 ≤ TauCeti.genus k F) :
       Finite (F ≃ₐ[k] F) :=
     sorry
   ```

2. Make it Layer 11's headline, with locator `Stichtenoth1973a` (main theorem). The pinned distinct-gap
   theorem is the characteristic-zero case.
3. Remove positive-characteristic finiteness over algebraically closed `k` from the scope exclusions. The
   quantitative Stichtenoth/Henn bounds may stay excluded.

**Tested on the refuting instance.** The 𝔽̄₃ Hermitian curve meets the new hypotheses. The pinned theorem
does not close the new statement there, so it is not padding. #1854's head keeps the same exclusion (its
lines 1544 and 1785), so this finding applies there too.

## R03 (P3) — All three declarations of `Suggested.lean` close from pinned theorems

**Location.** `Suggested.lean` lines 59, 77 and 92: `isDomain_tensorProduct_of_isSeparable`,
`genus_le_genus_of_constantCompositum_eq_top` and `finite_algEquiv_of_two_le_genus`.

**Claim.** Each declaration restates a pinned theorem, in a weaker form. Two carry an unused hypothesis
(`hF` at line 59, `hex` at line 77).

**Witness.** In a scratch copy, elaborated with 0 errors:

- line 77 closes by `TauCeti.genus_le_genus_of_constantCompositum_eq_top hF h`
  (`ConstantExtension/Genus/Basic.lean:243`, no exactness hypothesis);
- line 92 closes by `TauCeti.finite_algEquiv_of_two_le_genus hF TauCeti.isIntegrallyClosedIn_of_isAlgClosed
  (fun _ ↦ Nat.cast_injective.injOn) hg`;
- line 59 closes by `TauCeti.isDomain_tensorProduct_of_separating hex hx K` composed with
  `Algebra.TensorProduct.comm`.

**Repair.** Delete all three from `Suggested.lean`. The README keeps the statements and cites the pinned names
(R01). After R02, the file states only the all-characteristic finiteness theorem.

## R04 (P3) — Names and file locators that do not resolve at the pins

**Location and repair.**

- **Line 51.** `WeierstrassCurve.FunctionField` does not exist at the Mathlib pin. Write
  `WeierstrassCurve.Affine.FunctionField` (`Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean:94`).
- **Line 1257.** Item (iv) writes `Cl⁰(W.FunctionField) ≅ ClassGroup W.CoordinateRing` for `[W.IsElliptic]`,
  but `W` is a `WeierstrassCurve`. Write `W.toAffine.FunctionField` and `W.toAffine.CoordinateRing`, as
  item (i) at line 1245 does.
- **Line 346.** `TauCeti/FieldTheory/FunctionField/Elliptic/WeierstrassEquation.lean` does not exist. The
  cited theorem is in `TauCeti/FieldTheory/FunctionField/Elliptic/Weierstrass/Equation.lean:343`.
- **Line 61.** The suggested home `TauCeti/AlgebraicGeometry/Curve/` does not match the pin. Layer 12's
  material lives in `TauCeti/AlgebraicGeometry/Curves/`; use that directory.
- **Lines 708, 780, 1804 and 1936.** "Local Fields and Ramification roadmap, ramification-filtration layer"
  has no link and no layer number. Line 1064 also uses the bare name `LocalFieldsRamification`. Cite
  `[LocalFieldsRamification](../../Completed/LocalFieldsRamification/README.md)` Layer 3; its Herbrand and
  upper-numbering targets are at its lines 878–894.

**Witness.** A `#check` file of the README's 47 Mathlib-prefixed names: `WeierstrassCurve.FunctionField` is
an unknown constant. `TauCeti/FieldTheory/FunctionField/Elliptic/WeierstrassEquation.lean` is absent from the
Tau Ceti tree at `2fd255d9`.

## R05 (P3) — README shape and timeless wording

**Location.** The headings are `## Scope boundaries`, `## Standing hypotheses`, `## Pinned conventions`,
`## What Mathlib already has`, `## The build, in layers` (`### Layer k` bullets), `## Coordination`.

**Claim.** The README is not in the TauCetiRoadmap form:

- There is no `**Summary.**` paragraph.
- These sections are missing: `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`,
  `## How to read the build` and `## Downstream consumers`.
- No layer has `### k.n` subsections, `*Needs:*` lines, `**Checks.**` lists, or `### Examples` and
  `### Dependencies`.

The prose also carries process and time words, and one source quotation:

- `*(Library list.)*` seven times (lines 1836–1864);
- "has no further current consumer" (line 1798);
- "the Mathlib scheme-side vocabulary of the day" (line 1636);
- "being upstreamed to Mathlib as open pull requests" (lines 323 and 1873);
- the maintainer-review instructions at lines 1789 and 1904;
- "a future CurvesOverFiniteFields / HyperellipticCurves roadmap" (lines 67, 81, 102, 1074, 1334, 1822 and
  1853), although both are roadmaps now; CurvesOverFiniteFields is merge-order line 355;
- a direct quotation of Stichtenoth §3.6 at line 873.

**Witness.** `grep -n "^#"` lists the headings above. `grep -n "Library list\|of the day\|current consumer"`
returns lines 1636, 1798 and 1836–1864.

**Repair.** Restructure into the house headings. Move the "Portfolio ownership" and "Scope boundaries" text
into `## Scope and ownership`. Fold the conventions table into `## Conventions`. Turn the Mathlib list and the
contract table into `## Exact supplier contracts` (`From Mathlib`, `From Tau Ceti` with R01's names,
`From TauCetiRoadmap.<X>`). Give each layer `*Needs:*` lines and closing `### Examples` and `### Dependencies`
subsections. Delete the process and time phrases. Paraphrase the §3.6 quotation.

## Verified sound

**Gate and build.**

- The worker's gate at `62d686c`: every check 0, `build=0`, `OK`.
- My gate run (`--base origin/main`): every check 0 except `outside-folder=20`. All 20 paths are in 13 folders
  this brief names as the pull request's own (AlgebraicTopology through TopologicalKTheory), so none is a
  finding.
- Depcheck: `depcheck: 239 roadmaps, 2349 edges, 0 problem(s)`. There is no UPWARD and no CYCLE line.
- `lake env lean` on `Suggested.lean`: three `declaration uses sorry` warnings only (lines 59, 77, 92).

**This pull request's changes.**

- The README line 1803 row now reads "EllipticCurves consumes this milestone in Layer 0's … and in Layer
  1's …". This matches EllipticCurves on main, lines 118, 357–372 and 1614–1616, where both of its layers
  consume AlgebraicCurves' early Layer-10 milestone.
- The `module` / `public import` / `@[expose] public section` header matches 37 of 152 `Suggested.lean`
  files on main and elaborates.

**Signatures.** I compared `scratch/signatures.md` and my own elaboration with the README statements. The
generality matches: char 0 in both at line 93 (R02); `IsAlgebraic k k'` with no separability in both. No
section binder is lost. `hF` (line 59) and `hex` (line 77) are unused, which feeds R03.

**Library declarations.**

- All 110 backticked `TauCeti.*` names in the README `#check` at the pin, 0 errors.
- 44 of the 47 Mathlib-prefixed names `#check`. Of the other three, `Polynomial.Bivariate` is a namespace
  (`Mathlib/RingTheory/Adjoin/Polynomial/Bivariate.lean:26`) and `Valuation.lean` is a file name; the third
  is `WeierstrassCurve.FunctionField` (R04).
- 14 unprefixed Mathlib lemmas cited in prose exist at the pin, including:
  - `pow_sub_one_dvd_differentIdeal`, `conductor_mul_differentIdeal` and `dvd_differentIdeal_iff`
    (`Different.lean`);
  - `KaehlerDifferential.tensorKaehlerEquivOfFormallyEtale` (`RingTheory/Etale/Kaehler.lean`);
  - `RatFunc.valuation_isEquiv_infty_or_adic`;
  - `finite_appTop_of_universallyClosed`.
- Every Mathlib file path in the README exists. Of the 4 Tau Ceti paths, 3 exist (R04).
- Pinned definitions read at the pin:
  - `TauCeti.IsFunctionField` (`Basic.lean:51`);
  - `TauCeti.genus`, `sSup` of `(deg D + 1 − ℓ D).toNat` (`RiemannRoch/Genus.lean:193`), matching the
    conventions table;
  - `TauCeti.constantCompositum` (`GeometricDegree.lean:115`).
- `TauCeti.hurwitz_genus_formula` (`Different/Hurwitz.lean:72`) has the README's cross-multiplied form, with
  exact constants on both sides. Its extra instances `[FiniteDimensional k k'] [Algebra.IsSeparable k k']`
  follow from the README's hypotheses. For `a ∈ k'`, its minimal polynomial over `k` stays irreducible over
  `F` by exactness, and it is separable because `F'/F` is.

**Cross-roadmap citations, resolved on main or at the cited head.**

- JacobianChallenge Layers A–C: lines 111, 135 and 143, and `χ(L) = deg L + 1 − g`, `g := dim H¹` at line 139.
- EllipticCurves: Layer 0 consumes AlgebraicCurves Layers 0, 6 and 10 (lines 357, 367 and 377); Layer 1
  (lines 597–619).
- FormalLaurentPuiseux L1–L3 (lines 70, 112 and 140). Its lines 41 and 157 are scope statements, not supplier
  edges.
- BelyiMaps 9.1 (line 2847) and 10.6 (line 3476).
- SchemeAndStackFoundations at this head, lines 122–125, defers places, divisors, RR, Hurwitz, the regular
  model and the anti-equivalence to AlgebraicCurves Layers 0–12.
- LocalFieldsRamification (Completed), Layer 3, Herbrand at lines 878–894.
- ModularForms: no interface is claimed.

**Ownership.** A `roadmaps grep` for the anti-equivalence and the regular projective model across main and
the open heads finds only consumers: ArithmeticDynamics #1335, ModularCurvesPartII #913, ComplexComparisonPartII
#848 and FunctionFieldArithmetic #1474. Nobody else owns these objects. BelyiMaps' table on main (line 544,
and line 561 at #767) still names `AlgebraicCurves.IsFunctionField`, `AlgebraicCurves.Place` and
`AlgebraicCurves.Divisor`. That drift is on BelyiMaps' side; the Portfolio-ownership sentence here names the
right pinned carriers.

**Overlaps.**

- #1808 and #1854 conflict with this head in `Suggested.lean`. #1854's description orders #1101 → #1807 → #1854,
  and this description puts #1808 after this pull request, so both orders are stated. #1854 is a superset of
  this pull request's AlgebraicCurves hunks.
- No cited id is dropped by an open pull request, and this pull request drops none.

**Sources.** `Fulton2008`, the only certified text, was checked at every README locator:

| Locator | Fulton2008 line |
|---|---|
| "from Chapter 3 on, k algebraically closed" | 80 |
| Brill–Noether route to RR | 73 |
| §8.3 Prop. 5, ordinary multiple points | 3937 |
| §8.4 Prop. 6(2), char 0 | 4066–4068 |
| §8.5 Prop. 8 | 4122 |
| §8.6 RR | 4160 |
| Appendix A, nonzero characteristic | 4325 |
| Problem 8.36(c), Hurwitz in char 0 | 4266–4280 |

"repartition" occurs 0 times in the Fulton text.

**Seeded sample.**

- **Riemann–Hurwitz** (README 842–868): agrees with the pinned formula and rows 6–7 below.
- **Portfolio ownership**: agrees, as above.
- **Route decision**: the JacobianChallenge and EllipticCurves claims agree. The pin premise and one name
  fail (R01, R04).

**Headline theorems** (README and docstring):

| Layer | Headline | Pinned name |
|---|---|---|
| L0 | trdeg characterization | `isFunctionField_iff_trdeg_eq_one` |
| L3 | product formula | `Divisor.degree_principal` |
| L3 | Riemann's theorem | pinned |
| L4 | Riemann–Roch | `isRiemannRochDivisor_weilDifferentialDivisor` |
| L5/L8 | Clifford | `Divisor.two_mul_dim_le_degree_add_two` |
| L7 | Hurwitz | `hurwitz_genus_formula` |
| L8 | separable genus invariance | pinned |
| L8 | tensor-domain criterion | pinned |
| L8 | genus non-increase | pinned |
| L9 | `dim Ω = 1` | pinned |
| L9 | residue theorem | pinned |
| L10 | hyperelliptic genus | `genus_eq_of_sq_eq` |
| L11 | Hurwitz bound | `natCard_le_eighty_four_mul_genus_sub_one` |
| L11 | finiteness, distinct gaps | pinned |
| L11 | finiteness, any characteristic | not pinned, statable (R02) |
| L12 | model, projectivity, anti-equivalence, genus comparison | pinned |

**Adversarial table.**

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | `isDomain_tensorProduct_of_isSeparable` (l.59) | `K = k`; `ℝ ⊂ ℂ(x)`, `K = ℂ`; `k = 𝔽_p(a,b)`, `y^p = a + b x^p`, `K = k(a^{1/p}, b^{1/p})` | `k ⊗ F ≅ F`, a domain. `ℂ ⊗_ℝ ℂ(x) ≅ ℂ(x) × ℂ(x)`; `hex` fails (`i ∉ ℝ`). `z = y − a^{1/p} − b^{1/p}x`: `z^p = 0`, `z ≠ 0`; `hsep` fails. Exactness: a constant `c` with `c^p ∈ k ∖ k^p` would give `a, b ∈ k^p(c)`, of degree `≤ p < p²` over `k^p` | true; both negative controls correct | R03 |
| 2 | `genus_le_genus_of_constantCompositum_eq_top` (l.77) | `k' = k`; `k'/k` separable; `y² = x³ − t` over `𝔽₃(t)`, `k' = k(t^{1/3})`; `y^p = a + b x^p`, `k' = k(b^{1/p})`; `ℝ ⊂ ℂ(x)` | `g' = g`; `g' = g` (pinned equality). `1 → 0` (`u = y/(x − a)`, `u² = x − a`). New constant `w = y − b^{1/p}x`, `w^p = a`, `m = p`, `F'` rational, pin value `max(0, p·(−1) + 1) = 0 ≤ g`. Junk `−1 ↦ 0` | true; `hex` unused | R03 |
| 3 | `finite_algEquiv_of_two_le_genus` (l.92) | g = 0 and g = 1 over ℂ; `y² = x⁵ − 1`; Klein quartic; `y³ + y = x⁴` over `𝔽̄₃` | `PGL₂(ℂ)` and `E(ℂ)` infinite, both excluded by `hg`. g = 2 finite. `|Aut| = 168 = 84·2`. g = 3, gaps `{1,2,5}`, `2 = 5` in `k`, `|PGU₃(3)| = 6048` | true but narrowed | R02, R03 |
| 4 | docstring: "residue theorem not statable" | pinned `finsum_traceResidue_kaehlerBasisOfSeparating_coord_eq_zero` | elaborates at the pin (proved) | false | R01 |
| 5 | docstring: "12B/12C not statable" | `equivFunctionFieldCat`, `twoChartModel.genus_eq_genus` | both elaborate (proved) | false | R01 |
| 6 | Riemann–Hurwitz, cross-multiplied | `y² = x³ − x` over ℚ; `y² = x⁵ − 1`; `F·k'` with `[k':k] = 2` separable; `y² + y = x³` over 𝔽₂ | `0 = 2(−2) + 4`; `2 = 2(−2) + 6`; `Diff = 0` gives `g' = g`; `d = 4`: `0 = 2(−2) + 4`, while a tame count gives `−3`, which is odd and impossible | holds | none |
| 7 | tame equality, Cor. 3.5.6 | the same two curves | `Σ(e−1)deg = 4 = deg Diff`, equality. Wild: `Σ(e−1) = 1 < d = 4`, so `0 > −3` strictly | holds | none |
| 8 | conorm degree, Layer 6 | `F = k(x)`, `k'/k` separable quadratic, `D = P_∞` | `[k':k]·deg Con D = 2·1 = [F':F]·deg D = 2·1` | holds | none |
| 9 | Layer 8 regressions | `k = 𝔽_p(a)`, `K = k(a^{1/p})`, places `(t^p − a)` and `(t)` | `Con P = pQ`, `deg_K = p = deg_k P`. `e = 1`, degree 1, `[κ(Q):κ(P)] = p`, purely inseparable | holds | none |
| 10 | fierce V₄ example | `y² + ty = s`, `z² + tz = u` over `𝔽₂(s,u)` | `σy = y + t`. `e = 1`, `f = 4`, `G₀ = V₄`, `G₁ = 1` (`v(σy − y) = 1 < 2`). `d = 2`, `Σ(|G_i| − 1) = 3`, `f·d = 8` | holds | none |
| 11 | genus one, no smooth model | `y² = x³ + a` over `𝔽₂(a)` | `2g − 2 = 3(−2) + 4 + 2 = 0`. `Δ = a₃⁴ = 0`. Over `k(√a)`: `x = u²`, `v = u³` | holds | none |
| 12 | inseparable drop | `y² = x³ − t`, p = 3 | `deg Diff = 4`, `g = 1`; after adjoining `t^{1/3}`, g = 0 | holds (`GenusDrop.genus_lt_genus`) | none |
| 13 | Hermitian translations | `y^q + y = x^{q+1}` | `(y + a^q x + b)^q + (y + a^q x + b) = (x + a)^{q+1}`; `q³` pairs. q = 41: `68921 > 68796`. q = 37: `50653 < 55860` | holds; "sufficiently large q" is needed | none |
| 14 | genus-2 gaps | `y² = x⁵ − 1`, point `(0, i)` over `ℚ(i)` | branch points: gaps `{1,3}`. `0⁵ − 1 = −1 = i²`, not a branch point: gaps `{1,2}` | holds | none |
| 15 | exactness guard and genus junk | `ℝ ⊂ ℂ(x)` | `ℓ(0) = 2`; true maximum `−1`, pinned genus 0 | holds | none |
| 16 | Clifford | g = 0; g = 2 with `D = W`, `D = 0` | g = 0: vacuous. `ℓ(W) = 2 ≤ 2`. `ℓ(0) = 1 ≤ 1` | holds | none |
| 17 | Route decision | JacobianChallenge l.139; EllipticCurves l.357/367/394; the pins | the RR form and the consumption claims agree. The name and the "pin is empty" premise fail | partly | R01, R04 |
| 18 | changed contract row (l.1803) | EllipticCurves l.118, 1614–1616; depcheck | Layers 0 and 1 consume the milestone; 0 problems | holds | none |

## Not verifiable

- **`Stichtenoth2009`** is uncertified (paywalled), so its locators were not read. The numbers used here agree
  with the pinned Tau Ceti docstrings that cite them:
  - Thm 3.4.13 and Cor. 3.4.14, 3.5.6–3.5.8 (`Different/Hurwitz.lean`);
  - Thm 3.6.3 (`ConstantExtension/Genus/Basic.lean`);
  - Cor. 4.3.3 and Rem. 4.3.7(d) (`Differential/Independence.lean`);
  - Def. 1.4.15 (`RiemannRoch/Genus.lean`).
- **The §3.6 quotation at line 873** cannot be checked against the text.
- **Uncertified, cited only by locator:** `Hartshorne1977`, `Goldschmidt2003`, `VillaSalvador2006`,
  `Deuring1973`, `Rosen2002`, `Serre1979`, `Roquette1970`, `Stichtenoth1973a` and `Stichtenoth1973b`. R02's
  finiteness rests on `Stichtenoth1973a`'s main theorem as cited by locator. The order 6048 is the classical
  `|PGU₃(q)| = q³(q³+1)(q²−1)`.
- **Not in the manifest; chapter-level citations outside the sample:** Liu 2002 and Henn 1978.

## Source issues

- none
