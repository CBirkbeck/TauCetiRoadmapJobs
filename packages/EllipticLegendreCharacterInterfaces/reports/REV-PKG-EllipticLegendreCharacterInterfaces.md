<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1373#issuecomment-6393123197 -->
Review (claude) of 8320d52

Verdict: needs changes

1. **F01** (P2) The squareclass-character gap asks for what ClassicalArithmeticCompletion §1.51 on main already states

   - **Location.** `packages/EllipticLegendreCharacterInterfaces/README.md` line 57: "What ClassicalArithmeticCompletion must provide (gap:rational-squareclass-character): Extend §1.7's fundamental-discriminant character to every nonzero rational squareclass …". Line 55 cites only §§1.7–1.8. §1.4 and §1.5 have *Needs:* lines that name this contract.
   - **Claim.** The README says the rational-squareclass character, with its prime values, odd-conductor parity, squarefree odd conductor and trivial class, is missing from ClassicalArithmeticCompletion.
   - **Witness.** `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md` on main (b41e47b), line 1789 (§1.51), states all of it: `squareclassCharacter_apply_prime` (line 1801), `squareclassDiscr_one` (1803) and `odd_prime_dvd_squareclassDiscr_iff` (1804). Uniqueness is §1.8 (line 545). Tau Ceti supplies `fundamentalDiscriminantChar` and `isPrimitive_fundamentalDiscriminantChar`.
   - **Repair.**
     - Delete the "What ClassicalArithmeticCompletion must provide" sentence.
     - Rewrite the "From TauCetiRoadmap.ClassicalArithmeticCompletion" contract to cite §1.51 (the five names above, plus `squareclassCharacter_isPrimitive`) and §1.8. Keep §1.7 only as the source of the underlying character.
     - Replace "its rational-squareclass-character contract" in the *Needs:* lines of §1.4 and §1.5 with "ClassicalArithmeticCompletion §§1.8, 1.51".
     - The `plan.json` entry then has no consumer; the maintainer retires it under the package-stage rules.
     - Tested on the instance a = 3: §1.51's Check gives conductor 12, which matches this README's §1.4 Check (conductors 12, 3, 24, 24 for 3, −3, 6, −6, which I recomputed).

2. **F02** (P2) The local-reduction gap bundles four obligations, each already available at the pins or on main

   - **Location.** README line 51: "What EllipticCurves must provide (gap:rational-local-unit-reduction): Transport rational equations and their j-invariants to ℚ_p, prove that good reduction … implies integral j, and compare rational valuation-zero parameters with ℤ_p units …".
   - **Claim.** The gap contains four separate items:
     1. transport of the equation and its j to ℚ_p;
     2. good reduction implies integral j;
     3. comparing valuations of rationals with ℤ_p units;
     4. minimality and nonsingular reduction of an integral equation with unit discriminant.
   - **Witness.** Each item is already available:
     1. Mathlib `WeierstrassCurve.map_j` (Weierstrass.lean:477).
     2. Mathlib `integralModel_c₄_eq` (Reduction.lean:139) together with the unit Δ of `HasGoodReduction` (Reduction.lean:323) gives it in a few lines. EllipticCurves Layer 4 on main (README line 827) also plans the j-integrality criterion for potential good reduction.
     3. `Padic.valuation_ratCast` (PadicNumbers.lean:1063).
     4. `IsMinimal` (Reduction.lean:274) holds once the discriminant valuation equals 1, its maximum; `hasGoodReduction_iff_isElliptic_reduction` (line 328) gives nonsingular reduction.
   - **Repair.**
     - Delete the gap sentence.
     - Under "From Mathlib", cite `WeierstrassCurve.map_j`, `WeierstrassCurve.integralModel_c₄_eq` and `Padic.valuation_ratCast`. Under "From TauCetiRoadmap.EllipticCurves", cite the Layer 4 j-integrality criterion.
     - In §1.2, state the remaining glue as this roadmap's own proof step: good reduction of the minimal model of E over ℚ_p gives v_p(j(E)) ≥ 0.
     - Tested on F = L(−1) at p = 3: j = 1728, v₃(j) = 3 ≥ 0, and both parameters are units, as §1.2 says.

3. **F03** (P2) Three headlines are narrower than their proofs, and a later consumer restates the general forms

   - **Location.**
     - Summary, line 3: "All coefficient fields allowed by each statement are included".
     - §0.9 (line 227) and `exists_scaledLegendre_of_full_two_torsion` (Suggested.lean line 28) work over ℚ only.
     - §3.1 (line 533) and `legendre_two_by_four_subgroup` (line 90) assume p ≡ 3 mod 4 and a prime field.
     - §5.2 (line 765) and `scaledLegendre_frobeniusTrace` (line 143) treat the Legendre family only.
   - **Claim.** These restrictions are part of the statements as written.
   - **Witness.**
     - p = 5, η = 2: L(4)/𝔽₅ has 8 points and (2,1) has order 4. For p = 5, 13, 17, 29, 37, 41, every η with η² ≠ 0, 1 gives a ℤ/2×ℤ/4 subgroup.
     - The twist trace formula held in 3360 of 3360 random normal-form curves (p ≤ 17).
     - ErdosProgressionPowers §2.1 (open roadmap pull request head, lines 1056 and 1082) restates the general-field form of §0.9 and the all-odd-finite-field form of §3.1 as its own extensions.
   - **Repair.**
     - State §0.9 over every field K with `DecidableEq K` and `(2 : K) ≠ 0`.
     - State §3.1 over every finite field F of odd characteristic, for η ≠ 0 with η² ≠ 1. When −1 is a square, (0,0) is halved by §2.8.
     - Replace §5.2 by the normal-form statement: `(W.quadraticTwistOf 0 (-d/4)).frobeniusTrace = quadraticChar F d * W.frobeniusTrace` for a₁ = a₃ = 0.
     - Keep ℚ, prime fields and the Legendre case as Checks. State the character-sum point count, which ComputationalNumberTheory §3.17 (later in the order) has, here as the route input of §5.1–5.2.
     - Delete the Summary sentence if anything stays narrowed.
     - The generalized signatures elaborate at the pins. A scratch file proves that `(legendre lam).quadraticTwistOf 0 (-d/4) = scaledLegendre d lam` over any field with 2 ≠ 0.

4. **F04** (P2) Four declarations in `Suggested.lean` are computations or input lemmas, not headlines

   - **Location.** Suggested.lean, the theorems at lines 50 (`legendre_good_reduction_of_units`), 98 (`minus_one_half_order_four`), 108 (`legendre_minus_one_no_order_eight`) and 122 (`twist_halving_point_order_four`).
   - **Claim.** The file states these as headline theorems.
   - **Witness.** None closes in one tactic. By content:
     - Line 50 holds by definition once the coefficients are integral with v(Δ) = 0 (`IsMinimal` plus `HasGoodReduction`, Reduction.lean:274 and 323). It is the R02 contract applied to one equation.
     - Line 98 is the explicit doubling at BS20 line 668, an input of §3.6 and §3.7.
     - Line 108 is a step inside the proof of Lemma 6.5 (BS20 lines 670–672). It also follows from §3.7 plus full two-torsion: a group of order 8 containing ℤ/2×ℤ/2 has exponent 4.
     - Line 122 is a polynomial identity (product r(r+s)·s(r+s)·rs, slope r+s), an input of the consumer's Lemma 6.6.
   - **Repair.** Delete the four declarations from `Suggested.lean`. The README keeps §§1.3, 3.2, 3.6 and 4.1 as targets. I checked this on a scratch copy with these four and R05's declaration deleted: it elaborates with 7 sorry warnings and nothing else.

5. **F05** (P2) `legendre_character_odd_support` stands in for the conductor theorem that cannot be stated

   - **Location.** Suggested.lean line 60, together with the docstring at lines 8–10, which says the conductor-divisibility theorem cannot be stated at these pins.
   - **Claim.** It is stated as a separate headline (§1.4).
   - **Witness.** README §1.5 (line 358) proves the conductor theorem from §1.4. §1.4 itself is §1.2 plus the parity law `odd_prime_dvd_squareclassDiscr_iff` (ClassicalArithmeticCompletion line 1804). It reads "p divides M" as "bad reduction at p", which is exactly the missing conductor carrier.
   - **Repair.** Delete it from `Suggested.lean`; keep §1.4 in the README. The docstring keeps naming §1.5 as not statable, with the actual elliptic conductor as the missing carrier.

6. **F06** (P3) Unused hypotheses, shown by instances

   - **Location.** Suggested.lean line 137, `hu : u ≠ 0`; line 145, `hd`, `hlam`, `hlam₁`. Also lines 42 and 63, `hd`, `hlam`, `hlam₁`.
   - **Claim.** These hypotheses are needed.
   - **Witness.**
     - u = 0 over 𝔽₃: y² = x³ has 3 affine solutions, so `pointCount` = 4 = p + 1. `pointCount` counts singular solutions.
     - p = 5, d = 2, λ = 0: the traces are −1 and 1, and −1 = χ(2)·1. Over p ≤ 13 the formula held in 373 of 373 tuples, including the degenerate ones.
     - At lines 42 and 63 the hypotheses follow from `hmodel` together with `[E.IsElliptic]`.
   - **Repair.** Drop the hypotheses, or keep them and say in the README that they are not needed. Re-checked on the instances above.

7. **F07** (P3) The §0.1 Checks do not detect the sign of a₂, although each says it does

   - **Location.** README lines 86–93. Each Check ends: "This tests the coefficient specialization rather than a short equation with the wrong a₂."
   - **Claim.** The Checks rule out a wrong a₂.
   - **Witness.** The wrong model a₂ = +(1+λ), that is y² = x(x+1)(x+λ), gives the same (c₄, Δ): (48, 64) at λ = 2, (12, 1) at λ = 1/2, and (48, 64) at λ = −1. At λ = −1, a₂ = 0 under both signs.
   - **Repair.**
     - Add the Check "(L(2)).a₂ = −3, and (2,0) lies on L(2) but (−2,0) does not". On the wrong model, (−2,0) lies on it.
     - Make each Check say what it actually tests.
     - Remove the repeated Checks: §0.1 Check 5 repeats Checks 2–3, and §3.2 Checks 1, 2 and 4 repeat each other.

8. **F08** (P3) BS20 does not state several statements cited to it

   - **Location.**
     - §0.4/§0.5 (lines 151 and 167), §0.10/§0.11 (line 267), §1.1 (line 291) and §§2.1–2.4: the locators lead to text that does not contain the statement.
     - §2.8 (line 509) cites BS20 line 547.
     - §5.1 (line 750).
     - All 37 locators carry the same appended sentence.
   - **Claim.** BS20 supports these targets as stated.
   - **Witness.**
     - BS20 line 513 and line 704 display only the curves.
     - Lines 547–557 and 666–667 use the points of order 2 without listing them.
     - The criterion appears at line 554, one direction only, over 𝔽_p; the kernel statement is at line 659.
     - Lines 464–465 call §5.1 well known and cite Koblitz [22] (BS20 line 1573).
   - **Repair.**
     - Add textbook locators for the Legendre invariants, the two-torsion enumeration, the general halving criterion and §5.1 (Koblitz, recorded as `uncertified`), and add them to `sources.toml`.
     - Point §2.8 to BS20 lines 554 and 659, and §§3.2–3.5 to lines 668–671.
     - Drop the boilerplate sentence.

9. **F09** (P3) The ownership statements misdescribe three neighbouring roadmaps

   - **Location.** README line 11: "ModularCurves §9E owns the Legendre line …" and "EllipticCurveModularityPartII §5.1 owns the general full-rational-two-torsion predicate". Line 13: "The coefficient model of §0.1 is an input for MordellLawrenceVenkatesh §6.4".
   - **Claim.** MordellLawrenceVenkatesh consumes §0.1; a later roadmap owns the full-two-torsion notion.
   - **Witness.**
     - MordellLawrenceVenkatesh (open roadmap pull request head) line 2094 defines the same coefficient model over every commutative ring, with Δ and j, and does not cite this roadmap.
     - ArithmeticDynamics line 13 and ErdosProgressionPowers line 490 take the model from MordellLawrenceVenkatesh.
     - ModularCurves §4C (main, lines 1104–1108) is not cited.
   - **Repair.**
     - Cite ModularCurves §4C (the universal Legendre curve) and say that §0.1 is its coefficient-level form.
     - State that §§0.1 and 0.4 are earlier in the merge order (108, against 174, 263 and 268) and own the model, Δ and j, which MordellLawrenceVenkatesh §6.4, ArithmeticDynamics §6.35 and ErdosProgressionPowers Layer 2 consume. Flag those three for repointing.
     - Say that §0.9 uses full rational two-torsion as cardinality four, which EllipticCurveModularityPartII §5.1 should cite.

10. **F10** (P3) Targets that repeat other targets' API, and boilerplate

   - **Location.** §2.2 (line 406) and §2.4 (line 445) repeat the first API bullets of §2.1 and §2.3 word for word. §§3.3–3.5, §§4.2–4.4 and §0.7 likewise repeat API bullets of §3.2, §4.1 and §0.2. "One proof proceeds as follows" appears 36 times.
   - **Claim.** These are separate targets.
   - **Witness.** For example, line 406 and line 388 carry the identical sentence on (h(0), h(d), h(dλ)).
   - **Repair.** Merge each repeated target into its parent's API list and vary the prose.

11. **F11** (P3) The title collides with the board identifier `EllipticCurvesPartII`

   - **Location.** README line 1: "# Roadmap: elliptic curves, part ii — legendre models, …".
   - **Claim.** This roadmap is "elliptic curves, part ii".
   - **Witness.** The board design `EllipticCurvesPartII` (merge order line 109) is an alias of this roadmap that owns no nodes.
   - **Repair.** Retitle to match the identifier, for example "legendre models, two-descent readings and character interfaces", or have the maintainer merge the alias.

The mathematics checks out. Every Lean statement and every computed Check I evaluated is true at the pins (tables below), the file elaborates with `sorry` as the only warning, and the dependency check is clean. The blocking problems are about structure, not truth:

- both declared supplier gaps ask for things the library or an earlier roadmap already provides;
- three headlines are stated more narrowly than their own proofs allow, and a later consumer restates the general forms;
- five `Suggested.lean` declarations are not headline theorems.

Padding is graded P2 (blocking) under the maintainer's rule for this review; the brief's default grade for padding is P3. I found 11 findings, 5 of them blocking.

## Verified sound

**Elaboration.** `lake env lean` on `packages/EllipticLegendreCharacterInterfaces/Suggested.lean` takes 3.7 s and gives exactly 12 warnings, all `declaration uses sorry`. Other checks on the file:

- A single `import Mathlib` plus `TauCeti.AlgebraicGeometry.EllipticCurve.PointCount`, which is used.
- No `set_option`, no sorry'd data, no `lemma`.
- Every declaration has a docstring.
- Every backticked Lean name of this roadmap in the README (14) is declared in the file.

**Binder check.** I ran `#check @` on all 14 declarations. No section variables are used, and every elaborated type matches its README statement in generality.

**One-tactic probe.** I tried `simp`, `rfl`, `infer_instance`, `norm_num` and `decide` on each of the 12 theorems in a scratch copy; none closed. Padding was decided by content (R04, R05).

**Library declarations.** All 64 Mathlib and Tau Ceti names in the supplier contracts elaborate at the pins (Mathlib 6b7abb3c, Tau Ceti a91d3aafa). I opened the following at the pin:

- Reduction.lean lines 139, 274, 299, 323, 328;
- Tau Ceti PointCount.lean line 73 (`pointCount` counts singular solutions);
- QuadraticTwist/Basic.lean lines 169, 239, 299;
- XSubT.lean lines 855, 961;
- TwoTorsion.lean line 57.

No Legendre curve, elliptic conductor, finite-field twist trace formula or split-cubic halving criterion exists at the pins.

**Dependency check.** Output: `depcheck: 48 roadmaps, 531 edges, 0 problem(s)` — no UPWARD or CYCLE line.

**Citations resolved.** Each cited section exists where cited:

- EllipticCurves Layers 4–5 (main);
- ModularCurves §9E (main, line 2008);
- ClassicalArithmeticCompletion §§1.7, 1.8 (main);
- NeronModelsAndSemistableAbelianVarieties §5.3a (line 3208) and §5.3g (line 3355), at the head of its open pull request, with the content claimed;
- ArithmeticGaloisRepresentations Layer 3;
- ArithmeticDynamics §§6.35, 6.111, 6.112;
- MordellLawrenceVenkatesh §6.4;
- EllipticCurveModularityPartII §5.1 (line 546) and Layers 4–5;
- ErdosProgressionPowers Layer 2.

Supply direction: the suppliers are on main or earlier in the order (NeronModels 56 < 108), and every consumer comes later. The `plan.json` request naming "RankZeroOneBSD:BSD.0" points to a roadmap that exists nowhere; the README does not use it, so it is not a finding.

**Source sample (BS20, 15 targets).** Page offset: PDF page n is printed page n + 354.

| Target | Locator checked | Result |
|---|---|---|
| 0.2 | line 704, p.371 | scale-2 curve displayed; general d is a definition — sound |
| 0.5 | line 704 | curve only; Δ and c₄ not in BS20 (R08); values recomputed |
| 0.11 | Lemmas 6.3 (p.368), 6.5 (p.370) | enumeration assumed, not stated (R08); verified on 1274 curves |
| 1.2 | Lemma 6.2(i), lines 526–546, pp.367–368 | correct; source assumes semistability, README drops it soundly via §1.1 |
| 2.1 | lines 655–662, p.370 | CRT not in BS20; a construction (R08) |
| 2.2 | same | definitional; recomputed (1,3,7), (0,4,36) |
| 2.4 | same | definitional |
| 2.6 | lines 666–667, 710, 715 | all nine source tuples reproduced by the README formulas |
| 2.7 | line 661 | product rule — sound |
| 2.8 | line 554 (one direction), line 659 | line number off; iff from kernel (R08) |
| 3.2 | line 668 | correct point; line given as 663 |
| 3.4 | lines 669–670 | sound |
| 3.5 | lines 670–671 | sound; χ(i) = −1 exactly for p ≡ 5 mod 8 |
| 3.7 | Lemma 6.5, lines 663–664 | sound |
| 4.2 | line 719 | sound for the corrected point |

**Adversarial pass.**

| § | Instances | Computed values | Result |
|---|---|---|---|
| 0.1 | λ = −1, 2, 1/2, 0; 𝔽₃ λ = 2; 𝔽₅[ε] λ = 2+ε; wrong sign of a₂ | Δ = 64, 64, 1, 0; 𝔽₃: Δ = 1, c₄ = 0; Δ = 4+2ε, inverse 4+3ε; wrong model gives the same (c₄, Δ) | def sound; Checks R07 |
| 0.2 | d = 2, λ = 1/2; d = 0; twist (0, −d/4) | a₂ = −3, a₄ = 2, Δ = 64; all coefficients 0; twisting discriminant = d | sound |
| 0.3 | λ = −1, 2, 1/2, 3, 0, 1 | all six tuples, including junk (0,0,1,1,0,0) and (1,1,0,0,0,0), as stated | sound |
| 0.4 | 200 random λ; λ = −1 | identities hold; (Δ, c₄, j) = (64, 48, 1728) | sound |
| 0.5 | 200 random (d, λ); (2, 3); (2, 1/2) | Δ = 36864, c₄ = 448; (64, 48, 1728) | sound |
| 0.6 | roots (3,5,9), (0,1,−1), (0,0,1) | (3, 1/3, −2, −1/2, 3/2, 2/3); exceptional tuple; first ratio 0 | sound |
| 0.7 | d = 2 | n = −1/2, discriminant 2 | sound; duplicate (R10) |
| 0.8 | roots (3,5,9), r = 3 | (−17, 87, −135) ↦ (−8, 12, 0) = L(2,3) | sound |
| 0.9 | y² = x³ − x | d = 1, λ = −1 | true; narrow (R03) |
| 0.10–0.11 | 1274 curves, p ≤ 23 | kernel of 2 = {O, (0,0), (d,0), (dλ,0)} in all | sound |
| 1.1 | about 8000 rationals, p = 3, 5, 7; λ = 3, 1/3, −1; λ = 2, p = 2 | 0 failures; (1,0,−2), (−1,−1,−2), (0,0,3); (1,0,6) | sound |
| 1.2 | y² = x³ − x, odd p | parameters −1, 2, 1/2 are units | true; extra hypotheses (R06) |
| 1.3 | λ = 3, p = 5 and p = 3 | Δ = 576 ≡ 1; v₃(576) = 2 | true; padding (R04) |
| 1.4 | 3, −3, 6, −6, ±1, ±2 | conductors 12, 3, 24, 24, 4, 1, 8, 8 | true; stand-in (R05) |
| 1.5 | L(−1); λ = 3, ω = 1 | odd part of M is 1 (Δ = 2⁶); N^odd = 3, and 3 is bad for L(3) | sound; not statable |
| 2.1–2.4 | (1, −1), (2, 1/2), (2, 3) | roots map to (0,1,−1), (0,2,1); X+1 ↦ (1,3,7) | sound |
| 2.5 | L(−1)/𝔽₅, (2,4) | representatives (2,1,3), product 1 = y² | sound |
| 2.6–2.7 | (2,3) over ℚ; (1,−1) over 𝔽₅ | products 144, 64, 576; tuples (4,4,1), (1,2,2), (4,3,2) | sound |
| 2.8 | 23502 points, p ≤ 23; (0,0) over ℚ and over 𝔽₅ | 0 failures; fails over ℚ, holds over 𝔽₅ | sound |
| 3.1 | p ≡ 3 mod 4 up to 47; p ≡ 1 mod 4 up to 41 | ℤ/2×ℤ/4 present in all; p = 7, η = 2: P = (3,1), 2P = (1,0) | true; narrow (R03) |
| 3.2–3.5 | 28 pairs (p, i), p ≤ 113 | on curve, 2P = (0,0), order 4 | true; padding (R04) |
| 3.6–3.7 | 13 primes p ≡ 5 mod 8, up to 197; p = 41 | no order 8, v₂ = 3; (6,13) of order 8, count 32 | sound |
| 4.1–4.4 | 480 tuples, p ≤ 61; 𝔽₉, t = v = 1 | corrected point always valid, printed point off the curve in 456; 2P = (1,0) | true; padding (R04) |
| 5.1 | p ≡ 3 mod 4 up to 43, all u | count p + 1, also at u = 0 | true; R06 |
| 5.2 | p ≤ 13, all d and λ | 373 of 373, including degenerate cases | true; R03, R06 |
| Conventions | twist (0,−d/4); λ = 3 over 𝔽₅ | discriminant d; counts 4, 8, traces 2, −2 | sound |

**Headline theorems.** The Summary lists eight end theorems. The one that cannot be stated (§1.5) is named in the docstring. After R04 and R05 the file keeps §§0.9, 1.2, 2.8, 3.1, 3.7, 5.1 and 5.2.

**Duplication by object.**

- The pins have no Legendre curve, so the two definitions are needed.
- ErdosProgressionPowers consumes this roadmap and does not restate it, apart from the R03 extensions.
- The `EllipticCurvesPartII` alias owns nothing (R11).
- The other objects are in R01, R02 and R09.

## Not verifiable

- Koblitz [22], p.41, was not read: it is a paywalled textbook.
- I verified no textbook locator for the general halving criterion.
- The full conductor of y² = x³ − x was not recomputed; only its odd part (1) was.
- No full `lake build` was run, and no proof was attempted beyond the one-tactic probe.

## Source issues

- **Misprint** in BS20 at the proof of Lemma 6.6, p.371 (BS20 line 718): the source says the displayed point P lies in E(𝔽_p) and doubles to (2λ,0); at p = 5, t = v = 2, i = 3 it is (4,4), which is not on the curve; it should be P = (2λ+4itv, 8itv(t+iv)) on F′_λ(𝔽_p), with the x-coordinate and θ′₃ unchanged; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "8320d52", "job": "REV-PKG-EllipticLegendreCharacterInterfaces", "model": "opus", "worker": "fable-rev85"} -->
