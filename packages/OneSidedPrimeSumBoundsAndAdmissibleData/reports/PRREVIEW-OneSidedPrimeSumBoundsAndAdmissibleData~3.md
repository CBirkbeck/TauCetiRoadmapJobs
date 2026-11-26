# Review of OneSidedPrimeSumBoundsAndAdmissibleData (pull request #3160 at f612a55)
Folder: `TauCetiRoadmap/ShortGRH/OneSidedPrimeSumBoundsAndAdmissibleData/`
**Verdict:** needs changes

**Summary.** The verdict is needs changes. The mathematics holds up: all fifteen sampled sections agree with the formal proof at the cited commit, and every identity I recomputed holds. That covers the transform and residues of `R_q`, the total remainder, the size bounds, the main inequality and the passage to every character. The five findings are about structure and ownership:
- this roadmap and six siblings cite each other, and Theorem C is stated twice;
- eight *Needs:* entries rest on unowned "background" results, including the zero-free twist selection that the criterion depends on;
- 6.3–6.4 take over end theorems that GeneralizedRiemannHypothesisFromWindowBounds §§5.1–5.3 on main already owns;
- the folder has no `Suggested.lean`, although 0.2, 6.2 (c) and 6.3 can be stated at the pin;
- the pull request also edits the GRH umbrella and the root roadmap list.

There are five small corrections and two format notes. The human reviewers decide on the scope and licence of the main source and on re-rooting the umbrella.

## R01 (P1) — This roadmap and six roadmaps of its own family cite each other, so the family has no single direction of supply, and Theorem C is stated in two places, each pointing at the other.

Neither roadmap of such a pair can come first in the merge order, and an implementer of Theorem C cannot tell which of the two statements is the target.

This roadmap consumes sections of six siblings:
- DivisibilityOfThetaDerivatives §§1.1, 1.4–1.7, 4.6 (lines 453, 461, 529, 578);
- ThetaLiftChainsAndTheSeesawIdentity §§1.1, 2.5–2.19, 3.20 (lines 760–764, 804–806);
- CompositeThetaLiftsAndShortForms §§2.1, 2.4, 2.11, 4.9, 5.4, 5.5, 5.7 (lines 807, 837);
- SecondMomentsOfPoincareSeries §§1.3, 5.3, 5.7 (lines 806, 861);
- DeterminantsOfThetaLiftChains §§4.3, 6.3 (lines 764, 889);
- NormsOfThetaLiftsAndExchangeIdentities §7.5 (line 891).

Each of those six cites this roadmap on its own *Needs:* lines, for example:
- `DivisibilityOfThetaDerivatives/README.md` line 131 (§§2.1–2.2);
- `ThetaLiftChainsAndTheSeesawIdentity/README.md` line 449 (§3.2);
- `CompositeThetaLiftsAndShortForms/README.md` line 552 (§1.1);
- `SecondMomentsOfPoincareSeries/README.md` line 1271 (§§3.2–3.3);
- `DeterminantsOfThetaLiftChains/README.md` line 181 (§3.2);
- `NormsOfThetaLiftsAndExchangeIdentities/README.md` line 209 (§1.3).

5.5 here (lines 883–887) says its statement is that of DeterminantsOfThetaLiftChains §6.3, which proves it. §6.3 there says its statement is that of 5.5 here.

The dependency check prints no problem only because the siblings are not in the merge order. The graph of sections is acyclic: for example 3.1 → DivisibilityOfThetaDerivatives §4.6 → its §§1.1, 1.4, 4.1–4.5 → §§2.1–2.2 here. So moving ownership is enough.

Smallest change:
- Keep Layers 0–4 here as the family's lowest supplier.
- Move Layers 5–6 to a roadmap placed after the members whose sections they consume, which cites DeterminantsOfThetaLiftChains §6.3 for Theorem C instead of restating it.
- 5.1, the target lattice, is needed by §6.3 there and itself needs §4.3 there, so it belongs in DeterminantsOfThetaLiftChains before its Layer 6.

## R02 (P1) — Eight *Needs:* entries rest on results that no layer, no cited roadmap section and no pinned declaration supplies, including the zero-free twist selection that the one-sided criterion depends on.

Lines 51–52 define a "ShortGRH background (…)" entry as a result that no roadmap section states. 0.2, 1.1, 1.2, 1.3, 3.3, 3.4, 3.7 and 5.1 therefore have unowned inputs and cannot be implemented as planned. The entries are:
- lines 160–162: a prime `d` of the class with no zero of any `L(s, ξ·(·/d))` in `β ≤ Re s`, `|Im s| ≤ H`, for every `β > 1/2`;
- lines 207–208: the Smith normal form over a valuation domain, and lengths over a DVR;
- lines 243–244: algebraicity from bounded images, and extension of embeddings;
- lines 295–296: Hadamard's and Fischer's inequalities, and the determinantal Cauchy–Schwarz inequality;
- lines 530–531: the class number bound `(2^n|D_E|)^{n+1}`;
- lines 579–581: automorphic characters of `U(1)` with given weight and tame part;
- lines 654–655: splitting of primes in `ℚ(√−d)`;
- lines 764–766: the rational Gram matrix and Petersson integrality of algebraic forms.

For the 0.2 entry, the nearest owner on main, QuadraticTwistSelectionOverPrimes §2.7c, gives zero-free boxes only in `Re s > 1 − δ₀` with `δ₀ < 1/12`. 0.2 needs every `β > 1/2`.

For the 1.3 entry, the pinned Tau Ceti already has the inequalities, applied to the inner product that `G` defines on `ℂ^C`:
- `Matrix.det_gram_le_prod_norm_sq` (`TauCeti/Analysis/InnerProductSpace/Gram/Hadamard.lean:115`);
- `Matrix.det_gram_mul_det_gram_sumElim_le` (`Gram/Fischer.lean:64`); Fischer's inequality is its case with an empty first family.

Smallest change: for each entry, either state it as a target with its hypotheses and a published locator (here, or in a roadmap that this one then cites by section), or cite an existing owner. For 1.3, cite the two Tau Ceti declarations.

## R03 (P2) — Sections 6.3 and 6.4 make this roadmap a second owner of the end theorems that GeneralizedRiemannHypothesisFromWindowBounds §§5.1–5.3 on main already states.

Two roadmaps would then list the same targets, and whichever is implemented first leaves the other's items with nothing to do.

What this roadmap claims:
- 6.4 (lines 984–999) lists four targets: the predicate form, the strip form, the statements on `riemannZeta`, and Mathlib's `RiemannHypothesis`.
- The paragraph after 6.3 (lines 960–965) states the unconditional value form.
- "Owned here" (lines 1040–1041) claims all of them.

What main already states:
- GeneralizedRiemannHypothesisFromWindowBounds §§5.1–5.3 has the same forms, with the same two Checks (its README lines 821–890).
- Its `Suggested.lean` (lines 180–216) states `meromorphicOrderAt_LFunction_nonpos_of_one_half_lt_re`, `riemannHypothesis`, `LFunction_ne_zero_of_one_half_lt_re`, `re_eq_half_of_LFunction_eq_zero` and `riemannZeta_ne_zero_of_one_half_lt_re`.

The family's own `TauCetiRoadmap/ShortGRH/Suggested.lean` (lines 10–18) says that restating these would plan them a second time.

Smallest change:
- Keep 6.3 as stated: the implication from the one-sided bounds at the moduli `18480N` is this roadmap's own.
- Replace the targets of 6.4 and the unconditional paragraph by one sentence: 6.2 (c) with 6.3 gives the value form of GeneralizedRiemannHypothesisFromWindowBounds §5.3, and §§5.1–5.3 there follow.
- Drop the end theorems from "Owned here".

## R04 (P2) — The folder has no `Suggested.lean`, although this roadmap's own headline theorems 0.2, 6.2 (c) and 6.3 can be stated at the pinned Mathlib.

Without it the roadmap has no acceptance test, and the targeted build of its module fails because the module does not exist (the folder holds `README.md` only).

I checked statability with a test file. With real bodies, it defines:
- `E_ψ` as `if ψ = 1 then DirichletCharacter.LFunctionTrivChar₁ N else ψ.LFunction`;
- `χ_K` through `quadraticChar (ZMod d)`, and `ψχ_K` through `DirichletCharacter.changeLevel`;
- `G_q` with `logDeriv`, and `R_q` with `ArithmeticFunction.vonMangoldt` and `jacobiSym`.

It states 0.2, 6.2 (c) and 6.3 as the README does, and elaborates with `lake env lean` at the pin with three `sorry` warnings only.

Smallest change: add `Suggested.lean` with these three theorems and their definitions. Its docstring should name the headlines that are not statable at the pins and say why: Theorems A–C need the target forms and lifts of ThetaLiftChainsAndTheSeesawIdentity. For 3.7 and 6.1, either state them on a structure for the data of 3.2, or name them there too.

## R05 (P2) — The pull request changes three files outside the ShortGRH family: the GRH umbrella and the repository's top-level roadmap list.

Merging this roadmap would also re-root the project's GRH umbrella, which is a separate decision:
- `umbrellas/GRH.toml` changes `root` from `RiemannHypothesisForDirichletLFunctions` to `ShortGRH` (line 23) and rewrites the generated list.
- `umbrellas/GRH-targets.md` is regenerated. Together with the next file, the three files gain 2,206 lines and lose 18,337.
- `README.md` gains line 499 in the roadmap list, which is regenerated after merge.

Smallest change: move these three changes to a pull request of their own.

## C01 — A sentence of the description is contradicted by the head.

The description says: "Where a section of an existing roadmap, or a theorem already in the library, gives what the route uses, it is cited and not restated." At this head:
- 6.4 restates main's end theorems (R03);
- 5.5 restates DeterminantsOfThetaLiftChains §6.3 (R01);
- 1.3 lists as "background" inequalities that Tau Ceti already has (R02).

Either say where the head still departs from that rule, or make the head match it.

## C02 — The citation of ArithmeticDirichletSeriesPartII §0.1b (0.2's Origin, line 142, and References, line 1065) points at a section that only the revision in pull request #3027 defines.

Main has §§0.1 and 0.1a but no §0.1b, so the pointer is dead until #3027 merges, and the description does not name that dependency. Either name #3027 as a merge dependency in the description, or drop §0.1b and rely on PositivityOfDirichletSeriesWithKernels §6.4, which the *Needs:* line of 0.2 already cites and which applies here: after the choice of `d`, real poles have nonnegative residue.

## C03 — The References entry for [ShortProof] (lines 1059–1062) names no repository, commit or licence, so none of the 28 pointer lines can be followed from this README alone.

The family index gives the details. Add the repository URL and the commit `72fead102f663d5c7a407964a13dc0cf9d977207` here, as the index does.

## C04 — Two objects that main's FrobeniusRestrictedRieszSums already owns in general form are planned here without a citation.

- 3.5 (lines 588–606) is a modular variant of the sets with no relation of length `L` of FrobeniusRestrictedRieszSums §0.8, which uses the same Behrend construction.
- 2.2–2.3 (lines 386–390, 413–421) restate for `E = K(ζ_{q₁})` the abelian CM host of §0.1 there: places as `Gal(E/K)`, and the CM type `ι₀ ∘ g`.

Cite both sections, and say in one clause how each kept form differs: here relations are taken modulo `o`, with positive coefficients and the explicit count `H^n/(nH²)` that 3.6 (b) uses.

## C05 — The overview calls `E` "a CM field `E = K(ζ_{q₁})` whose degree is a power of `x`" (lines 13–14), which is not so.

3.3 (c) gives `x^{11} ≤ f ≤ x^{12}`, so the degree `2f` lies between `2x^{11}` and `2x^{12}`. "Whose degree lies between `2x^{11}` and `2x^{12}`" would be exact.

## N01 — Each section ends with a pointer line of declarations of [ShortProof] in code font, about 200 names in all.

A reader cannot tell these from names that this roadmap's `Suggested.lean` would declare. The repository's porting guidance asks for such a file-by-file map in a secondary provenance section. Moving the pointers there, or keeping them but saying once that the names are [ShortProof]'s, would do.

## N02 — 3.1 writes `c_vac` for the constant `C` of DivisibilityOfThetaDerivatives §4.6 (b), whereas that section uses `c_vac` for a different scalar.

The text has to warn about the clash (lines 452–454); another letter would remove it.

## Verified sound

| Statement | Instances tried | Values computed (README side / source or check side) | Result |
|---|---|---|---|
| 0.1 `R_q`, (a)–(c) | q = 1; z ≤ A; y ≤ z | `c₁ = −1 − γ + L′/L(1,χ_K)`; `yR₁ = 𝒢_1 − 𝒢_{χ_K}` as in main §8.4a(b); `\|𝓔\| ≤ 13t` | holds; source PrimeError 49–70, 202–222 |
| 0.2 criterion | transform; residue; real poles | `∫R(e^v)e^{(1−s)v} = (G/s − c)/(s−1)` recomputed by Mellin; residue `Σ(ord E_ψ − ord E_ψχ)/(φ s(1−s))`; Positivity §6.4(b) applies | holds; Criterion 41–46, same hypotheses |
| 1.2 heights | constant family 1; q = 0 | (f): norm `q` of H gives `0 ≤ nc`; `−c ≤ c′` via `z·z⁻¹`, (c), (d); (e) at q = 0: `0 = 0` | holds; matches Heights lemmas |
| 1.4 a twist per prime | n′ = 0; basis y ∪ z | `Gram(1) = \|γ\|^{2n′}Gram(ξ_ι)·\|γ\|^{−2n′}·Z(1)/Z(ξ_ι)`; heights `2δ + n′b_d + b_v`; conjugates `≤ e^{c+n′b_s}` | holds; TwistedLattice 481–492 |
| 2.1 parameters | q₀ = 18480, d = 9239 | 9239 has no prime factor < 97, `97² > 9239`, `9239 ≡ 7 (8)`; `d² ≡ 1 (q₀)`; `(p/d) = 1` when `4p ∣ d+1` | holds; FieldsAndPlaces 62–170 |
| 2.3 arithmetic of E | s = 0; ν not prime to q₁ | `f = φ(q₁) = Tφ(q₀)`; T places of class 1; `Σa ≡ 0` gives `N(ζ) = 1`; `[ν] = 1` has class `≠ −1` | holds; FieldsAndPlaces 357–525 |
| 3.1 `C_P`, `N₋` | m = 2, L = 7 | lower: `(m−1)(20L−1.84) − 7.5L ≥ mL` iff `m ≥ 1.47`; upper: `mL + 23(m−1)L ≤ 24mL` | holds; same hypotheses as `logLevelMin_mem_Icc` |
| 3.2 admissible data | each field | scales; `m = 2^{e+1}`, `s = 22(e+1)`, `s ≤ 32 log x`; `q₁x₁ ∣ b`; primes ≡ 1 mod `q₂²`; `log N` window | all match `New.Data` fields |
| 3.4 row parameter, twists | i = k−1; Q = ∅ | `Δ/2 − κ₁ = −(κ+Δ) = −shiftedWeight(1)`; m-fold condition `ψ_w^n ≠ 1`, `1 ≤ n ≤ m`; trivial twist vacuous | holds; LevelAndTwists 164–176, 264–394 |
| 3.6 sparse sets | (b) with `H^n ≤ 2^s/W < (2H)^n` | `#S > 2^s/(n2^nW³)`, so `3l₀2^s ≤ #S·W⁶` iff `3l₀n2^n ≤ W³`; order of `ℓ²` mod `2^{s+v}` exceeds `l₀` | holds; Existence 167–254 |
| 3.7 existence | ε → 1/100; W = `x^{ε/6}` | `(log b)^{100} ≈ x^{100ε} ≤ x`; `(log x₁)⁶ ≤ x^ε ≤ log b`; `W ≤ √log b`; `log b ≤ x^ε + 1` | holds; Existence 902–910 |
| 4.2 total remainder, sizes | ν ≡ 1 / ≢ 1 mod q₀ | recomputed `Σs_fin(a,τ) − #Φ_a s_main = a#Φ_aR₁(x₁) + a#Φ_b(R_{q₀}(x) − R_{q₀}(x₁))`; `h_dir ≥ b#Φ_b log b ≥ b#Φ_a` | holds; PrimeSums 181–299 |
| 5.1 target lattice | trivial twist; ℓ ∣ Nm Q | allowed iff `ℓ ∤ Nm Q`; Q = ∅ allowed at every ℓ; G rational positive definite; `Z(ξ)` = chain determinant | holds; IntegralTargetForms 68–117 |
| 5.2 normalised Poincaré maps | ℓ outside S ∪ {N}; ℓ = N | `g = 0` off S ∪ {N}; `\|c_B\|_ℓ = ℓ^{g}`; log bound via `g ≥ gain − err − 1`, `gain_N = 0` | holds; ShortAndEnough 93–170 |
| 5.3 Theorem A | (a), (b) | `x^{99} + 4u_E + 2b ≤ fa(log b)⁴` (log b ≥ 8); index `≤ #t·dim𝒮_ram·2u_E` from `dim𝒮 ≤ 2dim𝒮_ram` | holds; ShortAndEnough 258–379 |
| 5.4 Theorem B | ε = `(8b²)⁻¹` | `(5/2)(1 + log(b²/2)) ≤ 5log(1+2b²)`; loss `#t·b⁻⁸dim𝒮 ≤ 2d_T/b²`; total `(1 − 4/b²)d_T` | holds; ShortAndEnough 452–457 |
| 5.5 Theorem C | n′ ≤ `4d_T/b²` | `n′(2x₁²b² + b) ≤ d_T b`; gives `d_T(h − F − 2b) ≤ c + 2δ`, `2b ≤ 2F` | holds; same as DeterminantsOfThetaLiftChains §6.3 (R01) |
| 6.1 main inequality | n ≥ d_T/2 | `n·m·rem ≤ d_T(4F + 20log(1+2b²)u_E)`; `2·err ≤ 88F ≤ F log b`, F = `fa(log b)⁴` | holds; MainInequality 91 |
| 6.2 (a)–(c) | 3.7 data; y ≥ 2 | `(log b)⁶/m ≤ 64x^{6ε−1/2}`; `x⁻² + 2x^{ε−2} ≤ 3x^{−1/2+6ε}`; `R(y) − R(⌊y⌋) ≤ 26/y`; `⌊y⌋^u ≤ 2y^u` | holds; OneSidedBound 37–239 |
| 6.3 half-plane | q₀ = 18480N, d₀ = 9240N − 1 | `8 ∣ q₀`; `d₀ ≡ 7 (8)`; `gcd(d₀, q₀) = 1`; `q₀ = 2(d₀+1)`; `changeLevel` needs `χ ≠ 1 ∨ s ≠ 1` | holds; OneSidedBound 243–271 |
| 6.4 (a)–(d) | principal mod 2; ζ(−2) | `L(0) = (1−1)ζ(0) = 0` excluded by `0 < Re s`; `ζ(−2) = 0` excluded; same as main §§5.1–5.3 | true; duplicate (R03) |
| 0.2 background | main §2.7c range | §2.7c boxes `Re s > 1 − δ₀`, `δ₀ < 1/12`; 0.2 needs every `β > 1/2`, e.g. β = 0.6 | unowned (R02) |
| 1.3 background | Hadamard, Fischer | Tau Ceti `det_gram_le_prod_norm_sq` (Hadamard.lean:115); `det_gram_mul_det_gram_sumElim_le` (Fischer.lean:64), empty first family = Fischer | owner exists (R02) |
| 3.5 Behrend-type sets | L = 1; L ≥ 2 | L = 1 vacuous; digits `≤ L(H−1) < LH`; both sides `< (LH)^n ≤ o`; count `H^n/(n(H−1)²+1) ≥ H^n/(nH²)` | holds; uncited main §0.8 (C04) |
| Overview "degree a power of x" | 3.3 (c) | `x^{11} ≤ f ≤ x^{12}`, degree `2f` | inexact (C05) |

- Source locators checked: the 15 sampled sections against [ShortProof] at commit `72fead1`, 13 files read through the sources service (author's page) and `Heights`, `AdmissibleData` read directly on the same page; also 0.1, 0.2, 2.3, 6.2–6.4; about 70 declaration names matched; line numbers in the table are those of the cached text of each [ShortProof] file (`ShortProof line N`).
- Mathlib declarations opened at the pin: `Chebyshev.psi_le_const_mul_self` (Chebyshev.lean:485, constant `log 4 + 4 < 6`), `DirichletCharacter.LFunction_changeLevel` (DirichletContinuation.lean:149), `LFunction_modOne_eq` (:66), `LFunctionTrivChar₁` (:345), `LFunction_ne_zero_of_one_le_re` (Nonvanishing.lean:404), `riemannZeta_one_ne_zero` (ZetaAsymp.lean:443), `RiemannHypothesis` (RiemannZeta.lean:185), `Behrend.sphere`, `map`, `map_injOn`, `exists_large_sphere` (Behrend.lean:111, 134, 163, 246), `Nat.Prime.sq_add_sq`, `NumberField.classNumber`, `jacobiSym`, `legendreSym`, `padicNorm`, `Algebra.norm_eq_prod_embeddings`.
- Tau Ceti opened at the pin: `TauCeti/Analysis/InnerProductSpace/Gram/Hadamard.lean:115`, `Gram/Fischer.lean:64`; `ZeroFreeRightOf` and `GeneralizedRiemannHypothesis` are in neither library.
- Cross-roadmap citations resolved: 30 sibling sections (all present at this head); on main RiemannHypothesisStatementsAndConsequences §§8.4a, 9.3, 9.4, PositivityOfDirichletSeriesWithKernels §6.4, AnalyticNumberTheoryPartI §0.32, RieszSumsOverPrimesAndExceptionalZeros §1.4i, FrobeniusRestrictedRieszSums §1.1, GeneralizedRiemannHypothesisFromWindowBounds §§5.1–5.3; ArithmeticDirichletSeriesPartII §0.1b only at #3027 (C02).
- Automatic checks: the missing `Suggested.lean` is real (R04). The dependency check printed `depcheck: 122 roadmaps, 1386 edges, 0 problem(s)`; the cycle of R01 lies with siblings that are not in the merge order.
- Elaboration: no `Suggested.lean` to elaborate or `#check`; the test file of R04 elaborated at the pin with three `sorry` warnings.
- Overlap check: read GeneralizedRiemannHypothesisFromWindowBounds, RiemannHypothesisStatementsAndConsequences, RieszSumsOverPrimesAndExceptionalZeros, FrobeniusRestrictedRieszSums, QuadraticTwistSelectionOverPrimes, PositivityOfDirichletSeriesWithKernels (main) and the six citing siblings. Shared: the end theorems (owner GeneralizedRiemannHypothesisFromWindowBounds §§5.1–5.3, R03); Behrend-type sets and the CM host (owner FrobeniusRestrictedRieszSums §§0.8, 0.1, C04); the Frobenius-restricted sum and main term (FrobeniusRestrictedRieszSums §1.1, identified in 4.1); Theorem C (DeterminantsOfThetaLiftChains §6.3, R01).
- Source independence: 20 passages compared with 1 source (the 15 sampled statements and the proof sketches of 0.2, 3.6, 4.2, 5.3, 6.1). The only shared runs are formulas and statements that the mathematics forces, the longest an 8-word clause (3.7 against the docstring of `eventually_exists_data`). Largest share: [ShortProof], 28 of 31 locators. Contents compared with [ShortProof]: Layers 0–6 follow the modules of its `New/Reduction` folder (Zeros, Lattices, Data, PrimeSums, IntegralTargetForms and ShortAndEnough, MainInequality and OneSidedBound), an order that the *Needs:* lines force for Layers 2–6; this is reported to the human reviewers.
- Research link: the README and the family index say that Layers 0–6 state the route of the shorter formal Lean proof [ShortProof] (2026), a rewriting of Alpöge's formal proof of the generalized Riemann hypothesis announced in November 2026. 0.2 is adapted from Landau (1905) and 3.5 from Behrend (1946) and Ruzsa (1993).

## Not verifiable

- Landau 1905, Behrend 1946 and Ruzsa 1993 are cited without theorem or page locators and were not opened; 0.2 and 3.5 were checked against [ShortProof] instead.
- The `Heights` and `AdmissibleData` files of [ShortProof]: the sources service rejected their format, so they were read directly on the same author's page.
- Sections outside the sample (1.1, 1.3, 2.2, 3.3, 3.5, 4.1, 5.4, 5.5) were checked against the source only where the fetched files contain them.

Automatic checks set aside as false positives: the citation resolver's 198 "Lean names found nowhere" are declarations of the cited external formalization used as locators; they exist there at the cited commit (for example `New.Data.totalRemainder_eq` in `New/Reduction/PrimeSums`).

## Source issues

- none

## For the human reviewers

- Scope: the main source [ShortProof] is an unrefereed Lean development of about 300,000 lines, with no named human author. It is in the repository `lsernau/grh-lean`, and its README is written in the first person. Thirteen of 27 sections are "particular to this proof".
- Licence: [ShortProof] states "Apache 2.0, Copyright 2026 Anthropic, PBC". The README's layers follow its module structure and its statements paraphrase its docstrings. The References entry gives no licence or attribution notice.
- I fetched [ShortProof] as the page of one of the work's authors, under the account handle; no personal name is given there.
- Umbrella: this pull request re-roots the GRH umbrella from RiemannHypothesisForDirichletLFunctions to ShortGRH (`umbrellas/GRH.toml` line 23), which changes what the workers build towards.
