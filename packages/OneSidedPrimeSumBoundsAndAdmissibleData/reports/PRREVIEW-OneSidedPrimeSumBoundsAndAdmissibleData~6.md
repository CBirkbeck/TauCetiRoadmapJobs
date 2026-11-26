# Review of OneSidedPrimeSumBoundsAndAdmissibleData (pull request #3160 at 8e155d4)
Folder: `TauCetiRoadmap/ShortGRH/OneSidedPrimeSumBoundsAndAdmissibleData/`
**Verdict:** needs changes

**Summary.** Needs changes. The mathematics holds: the fifteen sampled sections agree with the formal proof at the cited commit, every identity and inequality I recomputed is correct, and `Suggested.lean` (new at this head, which repairs the earlier finding on it) elaborates with `sorry` as the only warning. Four findings remain, none about a stated result: six *Needs:* entries still rest on "background" results that nothing states as a target; this roadmap and five siblings still supply each other; the end theorems of 6.4 are claimed as owned here although a roadmap on main owns them; and five prose passages follow the docstrings of the formal proof nearly word for word. There are six small corrections and three format notes. Three points are left to the human reviewers, among them whether their recorded decision on the umbrella also covers the background entries and the two-way supply.

## R01 (P1) — Six *Needs:* entries rest on results that no layer, no cited roadmap section and no pinned declaration states, among them the choice of a prime `d` whose twists have no zero in a box, on which the one-sided criterion depends.

An implementer of 0.2, 1.1, 1.2, 1.3, 3.4 or 5.1 meets an input that is named in words and is a target nowhere, so these sections cannot be built from what the repository plans. This was raised in the previous review; three of the entries named there are now citations (Hadamard and Fischer in 1.3, the class number bound in 3.3, splitting in `ℚ(√−d)` in 3.7), and six remain:

- 0.2 (lines 164–167): for `β > 1/2` and real `H`, a prime `d` of the class with no zero of any `L(s, ξ·(·/d))` in `β ≤ Re s`, `|Im s| ≤ H`;
- 1.1 (lines 214–216): the Smith normal form of a square matrix over a valuation domain;
- 1.2 (lines 255–259): algebraicity of a complex number with bounded images, and extension of an embedding of a countable ring to an isomorphism `ℂ → ℚ̄_ℓ`;
- 1.3 (lines 314–317): the Cauchy–Schwarz inequality for the determinant of a pairing;
- 3.4 (lines 603–608): automorphic characters of `U(1)` with a weight and a tame part, and the weight of the restricted splitting character;
- 5.1 (lines 808–818): coordinates, the rational Gram matrix and Petersson integrality of algebraic forms on a definite unitary group.

I looked for owners at the pins. Tau Ceti's diagonalisation `Matrix.exists_mul_mul_eq_diagonal` (`TauCeti/LinearAlgebra/Matrix/SmithNormalForm/Diagonal.lean:44`) assumes a principal ideal domain, and `Matrix.exists_smith_normal_form_of_isDiscreteValuationRing` (`SmithNormalForm/Basic.lean:39`) a discrete valuation ring, so neither covers the rings `𝒪_ι`. The Gram folder of Tau Ceti (`Analysis/InnerProductSpace/Gram/`) has Hadamard, Fischer, factorisation, perturbation and rigidity, and no determinantal Cauchy–Schwarz. Mathlib has `IsAlgClosed.ringEquivOfCardinalEqOfCharEq` (`FieldTheory/IsAlgClosed/Classification.lean`) but not the extension of a given embedding.

Smallest change: for each of the six, state it as a numbered target with its hypotheses (here, in Layer 1 for the three general ones, or in a roadmap that this one then cites by section), or cite an existing section. The description says these results go to separate roadmap pull requests; until those sections exist to be cited, the entries are gaps at this head.

## R02 (P2) — This roadmap and five roadmaps of its family supply each other, so no order of the six has every supplier before its consumer.

A reader cannot place this roadmap before or after DivisibilityOfThetaDerivatives, ThetaLiftChainsAndTheSeesawIdentity, CompositeThetaLiftsAndShortForms, SecondMomentsOfPoincareSeries or DeterminantsOfThetaLiftChains. This was raised in the previous review. One part is repaired: Theorem C is now stated once, in DeterminantsOfThetaLiftChains §6.3, and 6.1 cites it. The two-way citations remain:

- this README cites DivisibilityOfThetaDerivatives on 10 lines (§§1.1, 4.6 in 3.1; §§1.1 (c), 1.7 (a) in 3.3; §§1.4–1.6 in 3.4; §2.1 in 4.1), and that roadmap cites this one 25 times (its 1.1, 1.2, 1.5–1.7, 2.1, 4.3a, 5.4–5.6 need §§2.1–3.4 here);
- 5.1 needs DeterminantsOfThetaLiftChains §4.3 and 6.1 needs its §6.3, whose own *Needs:* line lists §§1.3, 1.4, 5.1 here;
- 5.1–5.3 need ThetaLiftChainsAndTheSeesawIdentity §§1.1, 2.5–2.19, 3.20 and CompositeThetaLiftsAndShortForms §§2.1, 2.4, 2.11, 4.9, 5.4–5.7; 5.2 and 5.4 need SecondMomentsOfPoincareSeries §§1.3, 5.3, 5.7; each of the three cites Layers 1–4 here (19, 38 and 13 citations).

The sections themselves are acyclic as far as I followed them (for example 3.3 → DivisibilityOfThetaDerivatives §1.7 (a) → 3.1 here; its mention of 3.3 (c) is a pointer, not a need). The dependency check reports no problem only because the siblings are not in the merge order.

Smallest change: one direction for each pair. Layers 5–6 consume the siblings and nothing in Layers 0–4 needs them, so they can form the closing roadmap of the family. For DivisibilityOfThetaDerivatives the exchange is inside Layers 3–4: either its field arithmetic of `E` (§§1.1, 1.4–1.7 and the numbers `I_p`, `v(π_p)` of §2.1) and the constant of §4.6 (b) are stated before the data, or 3.1's `C_P`, 3.3, 3.4 and the local prime sums of 4.1 move after them.

## R03 (P2) — Section 6.4 and "Owned here" claim the end theorems as this roadmap's own, although GeneralizedRiemannHypothesisFromWindowBounds §§5.1–5.3 on main owns them, and this folder's `Suggested.lean` says so.

Two roadmaps then list the same four statements as targets, and this folder contradicts itself about which one owns them. Raised in the previous review; the text of 6.4 now says where the statements come from, but the ownership is unchanged:

- 6.4 (line 1012): "Each of the following is a target", for the predicate form, the strip form, the statements on `riemannZeta` and Mathlib's `RiemannHypothesis`;
- "Owned here" (lines 1070–1071) lists "the end theorems in their value, predicate and strip forms with Mathlib's `RiemannHypothesis`";
- the docstring of `Suggested.lean` (lines 13–18) says they are the theorems of that roadmap and that "stating them again here would plan them twice".

On main, §5.1 there is (a), §5.2 is (d), §5.3 has the value form, (b) and (c), with the declarations `meromorphicOrderAt_LFunction_nonpos_of_one_half_lt_re`, `riemannHypothesis`, `LFunction_ne_zero_of_one_half_lt_re`, `re_eq_half_of_LFunction_eq_zero` and `riemannZeta_ne_zero_of_one_half_lt_re` in its `Suggested.lean` (lines 180–216).

Smallest change: keep 6.4 as the place where this route reaches them, and say what is owned. In 6.4, replace "Each of the following is a target" by a sentence that the statements are those of GeneralizedRiemannHypothesisFromWindowBounds §§5.1–5.3 and that the target here is their derivation from 6.3; in "Owned here", replace the end theorems by "the derivation of the end theorems from 6.3", and list the statements under "Not owned here".

## R04 (P2) — Five prose passages follow docstrings of [ShortProof] nearly word for word.

The roadmap is published under the project's licence and its statements are to be in its own words; these sentences are the source's with a few words exchanged. I compared the README with the comments of every file under `New/` of [ShortProof] at the cited commit; formulas and hypothesis lists apart, the long shared runs are:

- 2.2, Method (lines 401–403), against the docstring of the group instance on the places, `New/Reduction/Data/FieldsAndPlaces.lean` line 262: 16 consecutive words;
- 1.4, Origin (lines 328–330), against the module docstring of `New/Reduction/Lattices/TwistedLattice.lean` lines 22–24: 12 consecutive words and the same three items in the same order;
- 3.5, Origin (lines 618–620), against the module docstring of `New/Reduction/Data/Existence.lean` lines 36–37: 12 consecutive words, clause by clause;
- 3.3, Method (lines 528–529), against the module docstring of `New/Reduction/Data/Magnitudes.lean` lines 18–19: the sentence with its list of six quantities;
- 6.4, Method (line 1008), against the comment at `Main.lean` line 54: 13 consecutive words.

Rewritten, each could read:

- 2.2: "`Φ` receives its multiplication from the Galois group: each `g ∈ Gal(E/K)` gives the embedding `ι₀∘g` and so a place, every place arises exactly once (2.3 (b)), and the product of two places is defined to match the product in the group; the remaining objects are built on this."
- 1.4: "particular to this proof: an inequality bounding the covolume of a family from below. It involves the index of the family, the heights of the ratios `Z(1)/Z(ξ_ι)`, and, for the vectors added to make a basis, bounds for their norms and for their denominators; norms are taken at the trivial twist and integrality at a twist allowed at the prime in question."
- 3.5: "…: here a single set avoids every relation `(α + α′)e₂ ≡ αe₁ + α′e₃` with `α, α′ > 0`, `α + α′ ≤ L`; the relations are read modulo `o`, the number `n` of digits in base `LH` is a parameter, and the size of the set is the stated `H^n/(nH²)`."
- 3.3: "`F ≤ G` then follows once an upper exponent of `F` is at most a lower exponent of `G`; both are linear in the logarithms of the three scales, in `log log b`, `log log x₁` and in `C_P`, so the comparison reduces to the five inequalities between the scales."
- 6.4: "For `ζ`: at a zero outside `{1, −2, −4, …}` the gamma factor is finite and nonzero, so the completed zeta function vanishes there as well, and its functional equation carries the zero to `1 − s`."

The definition of `[ν]` in 2.2 (line 412) also shares 17 words with the docstring of `placeOfInt`; as a one-line definition it can hardly be said otherwise, and I do not ask for a change.

## C01 — The citation of ArithmeticDirichletSeriesPartII §0.1b (0.2's Origin, line 146, and References, line 1095) points at a section that only pull request #3027 defines, and the description does not name that dependency.

Main has §§0.1 and 0.1a; §0.1b "Landau's theorem for functions of one sign" exists at the head of #3027 only. Raised before, unchanged. Either name #3027 in the description as a pull request that must merge first, or drop §0.1b and keep PositivityOfDirichletSeriesWithKernels §6.4, which the *Needs:* line of 0.2 already cites and whose part (b) is the form used.

## C02 — Two objects that FrobeniusRestrictedRieszSums on main owns in general form are planned here with no word on the relation.

3.5 is a modular variant of the sets with no relation of length `L` of §0.8 there (the same Behrend construction, with `Behrend.sphere`, `Behrend.map` and `Behrend.exists_large_sphere`), and 2.2–2.3 specialise the abelian CM hosts of §0.1 there to `E = K(ζ_{q₁})`. 4.1 already names §1.1 of that roadmap in this way. Raised before, unchanged. One clause each would do: here the relations are congruences modulo `o` with positive coefficients, and the count `H^n/(nH²)` is explicit because 3.6 (b) uses it.

## C03 — The overview calls `E` "a CM field `E = K(ζ_{q₁})` whose degree is a power of `x`" (lines 14–15), which 3.3 (c) does not say.

By 3.3 (c), `x^{11} ≤ f ≤ x^{12}`, so the degree `2f` lies between `2x^{11}` and `2x^{12}` and is not a power of `x`. Raised before, unchanged. "Whose degree lies between `2x^{11}` and `2x^{12}`" is exact.

## C04 — The docstring of `Suggested.lean` says that 6.2 (b) is a statement about admissible data (lines 23–26); it is not.

6.2 (b) reads: for parameters `(q₀, d)`, `0 < ε < 1/100` and every large integer `x`, `R_{q₀}(x) ≤ (64φ(q₀) + 3)x^{−1/2+6ε}`. It mentions `primeRemainder` only, exactly as 6.2 (c) does, and [ShortProof] states it so (`New.eventually_primeRemainder_natCast_le`). Either state it beside `eventually_primeRemainder_le_rpow`, or name only 6.2 (a) in that paragraph.

## C05 — Two sentences of the description no longer describe the head.

"They appear on `*Needs:*` lines as `ShortGRH background (…)`, 169 entries at this commit": the later paragraphs give 183, then 152, and the head has 180 occurrences in the eleven READMEs, six of them in this folder. And "Where a section of an existing roadmap, or a theorem already in the library, gives what the route uses, it is cited and not restated" does not hold for 6.4 (R03) or 3.5 (C02). Give the count at the head once, and say where the head departs from the rule.

## C06 — The sketch of 6.2 (c) applies (b) "with `ε/7` in place of `ε`", which (b) allows only when `ε/7 < 1/100`.

For `ε ≥ 7/100` the hypothesis of (b) fails as written. [ShortProof] takes `δ = min(1/200, ε/7)`. "With `δ = min(1/200, ε/7)` in place of `ε`" makes the sentence true; the statement of (c) is unaffected.

## N01 — Each section ends with a pointer line of declarations of [ShortProof] in code font, about 200 names in all, which a reader cannot tell from names that `Suggested.lean` declares.

Four of them (`primeRemainder`, `logDerivMean`, `LFunction_ne_zero_of_primeRemainder_le`, `eventually_primeRemainder_le_rpow`) now are declared there, under another namespace. A sentence in the Conventions that the names on these lines are [ShortProof]'s, or a provenance section that collects them, would do.

## N02 — 3.1 writes `c_vac` for the constant `C` of DivisibilityOfThetaDerivatives §4.6 (b), where `c_vac` is a different scalar, and has to warn about it (lines 473–475).

Another letter would remove the clash. 3.1 also takes `c_vac ≥ 0`, which §4.6 (b) does not say of `C`; "chosen `≥ 0`" there or here would close it.

## N03 — 2.1 takes "an integer `q₀` divisible by `18480`", the overview "a positive multiple".

`φ(q₀)` and the modulus of the characters need `q₀ ≥ 1`; "a positive integer" in 2.1 would match the overview and `Suggested.lean`.

## Verified sound

| Statement | Instances tried | Values computed (README side / source or check side) | Result |
|---|---|---|---|
| 0.1 `R_q`, (a)–(c) | `q = 1`; `z < 1`; `y ≤ z` | `G₁(1) = L′/L(1,χ_K) − γ − 1`; (b) at `z < 1`: `0 = 0`; `2(log 4 + 4) + 1 = 12.77 ≤ 13` | holds; PrimeError 45–66 |
| 0.2 criterion | pole at `s = 1`; real `s ∈ (β, 1)`; `s > 1` | numerator `G(1) − Re G(1) = 0`; residue `n(s)/(φ s(1−s)) > 0`; `n = 0` for `s ≥ 1` | holds; Criterion 37–42, same hypotheses |
| 1.2 heights | `q = 0` in (e); constant family 1 | `log 0 = 0` both sides; (f) `0 ≤ nc`; definition matches `HeightLe` field by field | holds; Heights 41–54, 191, 225 |
| 1.4 a twist per prime | `n′ = 0` | conclusion `0 ≤ c + 2δ + n′(b_short + b_denom) + b_vol`; hypotheses as `covolume_add_index_nonneg` | holds; TwistedLattice 477–488 |
| 2.1 parameters | `q₀ = 18480`, `d = 9239` | no prime factor below 97; `9239 mod 8 = 7`; `d² ≡ 1`; `(p/d) = 1` for `p ∣ q₀` by reciprocity | holds; FieldsAndPlaces 58–110 |
| 2.2 field and places | `ν` not prime to `q₁` | `[ν]` = identity; `Ω = exp(γ − Re L′/L)·2π/rd_E` as `bigOmega` | holds |
| 2.3 arithmetic of `E` | `s = 0` | `f = T·φ(q₀)`; `T` places of class 1 | holds; `numInfPlaces_E`, `card_placeClass_eq_one_eq_towerDeg` |
| 3.1 `C_P`, `N₋` | `m = 2`, `L = 7` | lower `85.66 ≥ 14`; upper `173.16 ≤ 336`; `C_P` five terms as `constantBound` | holds; AdmissibleData 50–66, 338 |
| 3.2 admissible data | each field | `m = 2^{e+1}`, `s = 22(e+1)`; weight `xb/x₁` off `Φ_b`; `p_i ∈ [b^{10}, b^{11}]`; window `√log b` | all match `New.Data` |
| 3.3 sizes | `T`, `x₁^{3l₀²}`, `m^{594}` | `T ≤ 3.3·10⁴ x^{11}(log b)^{1/6}`; `3l₀² log x₁ ≤ 2·10⁻⁵(log b)^{1/2}`; `594e = 27s < l₀` | holds |
| 3.4 row parameter, twists | `i = k − 1`; `Q = ∅` | `−shiftedWeight(2(i+1−k)+1) = −(κ + jΔ)`, `j = i+2−k`; weight of `μ_j⁰`: `−κ − Δ/2 − jΔ = −κ_j` | holds; LevelAndTwists 160–172, 308–374 |
| 3.5 sets with no relation | `H = 1`; digits | `{0}`: `1 ≥ 1/n`; digits `≤ L(H−1) < LH`; `n(H−1)² + 1 ≤ nH²` | holds; `exists_three_term_free` |
| 3.6 sparse sets | `ℓ = 2`; odd `ℓ`; (b) | order of 4 mod `3l₀` is `l₀`; relation `2j·e₂ ≡ (2j−2i)e₁ + 2i·e₃`, length `2j < 2l₀`; `H ≤ W`, `#S > 2^s/(n2^nW³)` | holds; Existence `exists_large_isSparse`, `exists_isSparse` |
| 3.7 existence | `W = x^{ε/6}` | `(x^ε + 1)^{100} ≤ x`; `10⁶W ≤ W⁶`; `W ≤ √log b`; pigeonhole on `h_K + 1` primes | holds; `eventually_exists_data` |
| 4.1 prime sums | `p` inert, `p = d`, split | `λ₁(p^e) = 2 log p` (odd `e`), `log d`, `0`; equals `2 log p·v(π_p)` on `I_p` | holds; AdmissibleData `primeSum`, `jetSize` |
| 4.2 total remainder | `ν ≡ 1` / `≢ 1 (mod q₀)` | recomputed `rem = a(#Φ_b(R_{q₀}(x) − R_{q₀}(x₁)) + #Φ_a R₁(x₁))`; `h_dir ≥ #Φ_b·b log b ≥ b#Φ_a` | holds; PrimeSums `totalRemainder_eq` |
| 5.1 target lattice | trivial twist | allowed iff `ℓ ∤ Nm Q`; `Q = ∅` allowed everywhere; stabilisers trivial gives `n = 1` | holds; IntegralTargetForms 50–83 |
| 5.2–5.4 | gains at `N`; `ε = (8b²)⁻¹` | `gain_N = 0`; `(5/2)(1 + log(b²/2)) = 35.3 ≤ 72.5` at `b = 10³`; loss `≤ 2d_T/b²` | holds |
| 6.1 main inequality | `n ≥ d_T/2`; `rem < 0` | `n·m·rem ≤ d_T(4F + 20 log(1+2b²)u_E)`; `2·err ≤ 89 f a (log b)⁴` | holds; `star_inequality`; Theorem C as §6.3 there |
| 6.2 (a)–(c) | data of 3.7; `y ≥ 2` | `(log b)⁶/m ≤ 64x^{6ε−1/2}`; `x⁻² + 2x^{ε−2} ≤ 3x^{−1/2+6ε}`; `13/⌊y⌋ ≤ 26/y` | holds; OneSidedBound; sketch of (c): C06 |
| 6.3 half-plane | `q₀ = 18480N`, `d₀ = 9240N − 1` | `8 ∣ q₀`; `d₀ ≡ 7 (8)`; `q₀ = 2(d₀+1)`, `d₀` odd, so coprime | holds; `New.grh` |
| 6.4 (a)–(d) | principal mod 2; `ζ(−2)` | zeros `2πik/log 2` excluded by `0 < Re s`; same statements as main §§5.1–5.3 | true; ownership R03 |
| `Suggested.lean`, three theorems | `simp_all`; one library lemma | none closes; goals left as stated | no padding |
| `primeRemainder` (Lean) | against 0.1 | sum over `Icc 1 ⌊y⌋₊` of `λ(1/n − 1/y)`, minus `log y/φ(q)`, minus `Re G_q(1)` | equals README |
| Background of 1.1 | Tau Ceti Smith forms | PID (`Diagonal.lean:44`), DVR (`Basic.lean:39`); `𝒪_ι` is neither | unowned (R01) |
| 3.3 class number | ExplicitNumberFields §5.3, third form | `(2^{n−1}/(n−1)!)√d·d^{n−1} ≤ (2^n d)^{n+1}` | citation sound |

- Earlier findings: on the background entries, partly repaired (R01); on two-way supply, partly repaired (R02); on the end theorems, not repaired (R03); on the missing `Suggested.lean`, repaired; on files outside the family, see the human reviewers. Earlier corrections: the one on References repaired; four stand (C01, C02, C03, C05).
- Source locators checked: the 15 sampled sections and 3.3, 3.5, 4.1, 6.1 against [ShortProof] at commit `72fead1`, in 17 files of `New/Reduction`, `Lib/General/NumberTheory/ImaginaryQuadraticField.lean` and `Lib/General/LinearAlgebra/IntegralLattices.lean`; about 50 declarations opened.
- Library declarations opened at the pins: 14 in Mathlib (among them `Ring.ord_eq_addVal`, Noetherian.lean:89; `Chebyshev.psi_le_const_mul_self`, Chebyshev.lean:485; `DirichletCharacter.LFunction_changeLevel`, DirichletContinuation.lean:149; `LFunction_ne_zero_of_one_le_re`, Nonvanishing.lean:404; `RiemannHypothesis`, RiemannZeta.lean:185; `Behrend.exists_large_sphere`, Behrend.lean:246) and 5 in Tau Ceti (Hadamard.lean:115, PosSemidef/Determinant.lean:85, Fischer.lean:64, SmithNormalForm/Basic.lean:39, Diagonal.lean:44).
- Cross-roadmap citations resolved: 29 sibling sections at this head, all present; on main ExplicitNumberFields §5.3, ImaginaryQuadraticClassNumber §2.1, AnalyticNumberTheoryPartI §0.32, RieszSumsOverPrimesAndExceptionalZeros §1.4i, RiemannHypothesisStatementsAndConsequences §§8.4a, 9.3, 9.4, PositivityOfDirichletSeriesWithKernels §6.4, FrobeniusRestrictedRieszSums §1.1, GeneralizedRiemannHypothesisFromWindowBounds §§5.1–5.3; ArithmeticDirichletSeriesPartII §0.1b only at #3027.
- Dependency check: `depcheck: 122 roadmaps, 1387 edges, 0 problem(s)`; no UPWARD or CYCLE line (the siblings are not in the merge order: R02).
- Elaboration: `Suggested.lean` elaborates at the pins, three `sorry` warnings and nothing else; `#check @name` on the five definitions gives the binders of the README (`d` prime, `q` with `NeZero q` where `φ(q)` occurs), nothing lost.
- Overlap check: read GeneralizedRiemannHypothesisFromWindowBounds, RiemannHypothesisStatementsAndConsequences, RieszSumsOverPrimesAndExceptionalZeros, FrobeniusRestrictedRieszSums, PositivityOfDirichletSeriesWithKernels (main, and the first and fourth at #3027); shared: the end theorems, owner GeneralizedRiemannHypothesisFromWindowBounds §§5.1–5.3 (R03); sets with no relation and CM hosts, owner FrobeniusRestrictedRieszSums §§0.8, 0.1 (C02). Ownership against the other open pull requests was checked by search of their READMEs for the family's names only.
- Source independence: every prose line compared with the comments of all files of `New/` of 1 source, and 21 statements read side by side; 5 passages shared (R04); largest share [ShortProof], 27 of 31 locators; contents compared with [ShortProof]: Layers 0–6 follow `New/Reduction` (Zeros, Lattices, Data, Data, PrimeSums, IntegralTargetForms with ShortAndEnough, MainInequality with OneSidedBound); the *Needs:* lines force 2 → 3 → 4 → 5 → 6, not the places of Layers 0 and 1; reported to the human reviewers.
- Research link: per the README and the family index, Layers 0–6 state the route of the shorter formal Lean proof [ShortProof] (2026) of the Riemann hypothesis for Dirichlet L-functions, a rewriting of the formal proof announced in 2026; 0.2 adapts Landau (1905), 3.5 Behrend (1946) and Ruzsa (1993).

## Not verifiable

- Landau 1905, Behrend 1946, Ruzsa 1993 and Washington 1997 (Chapter 2) are cited without theorem or page locators and were not opened; 0.2, 3.5 and 2.3 were checked against [ShortProof] and by recomputation.
- The six background results of R01 were not checked beyond their statements: no section states them.
- Sibling sections were read where this roadmap cites them (headings, the cited items, their *Needs:* lines), not in full.

Automatic checks set aside as false positives: the TeX-syntax hits in the sketch of 2.3 lie inside a code span that runs over a line break; the citation resolver's names "found nowhere" are declarations of the cited external formalization, used as locators, which exist there at the cited commit.

## Source issues

- none

## For the human reviewers

- Outside the family: the pull request changes `umbrellas/GRH.toml`, `umbrellas/GRH-targets.md` and one line of the top-level `README.md`. A maintainer's comment of 2026-11-26 records that the human reviewers decided these belong here; I did not raise them.
- The description says the background entries and the two-way supply are "as decided by the human reviewers". The only recorded decision I found concerns the umbrella. If it covers these too, R01 and R02 are settled by it.
- Two reviews conflict on 6.4: a maintainer's review asked that the end theorems be targets of this family so that the umbrella's goal is an item; main already owns them (R03). Who owns them is yours to settle.
- Licence and reuse: `Suggested.lean` has the names, binder names and statements of `New.LFunction_ne_zero_of_primeRemainder_le`, `New.eventually_primeRemainder_le_rpow`, `New.logDerivMean`, `New.primeRemainder` of `lsernau/grh-lean` (`grh/src/New/Reduction/`), Apache 2.0, "Copyright 2026 Anthropic, PBC".
- Scope: the main source is an unrefereed Lean development, 27 of 31 locators; the layers follow its folder `New/Reduction`, and 12 of 26 sections are "particular to this proof".
