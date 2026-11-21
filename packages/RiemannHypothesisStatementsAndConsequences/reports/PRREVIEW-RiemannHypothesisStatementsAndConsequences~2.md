# Review of RiemannHypothesisStatementsAndConsequences (pull request #2885 at 885d46b)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/RiemannHypothesisStatementsAndConsequences/`
**Verdict:** needs changes

**Summary.** Changes are needed for one ownership defect. The zero-free half-plane predicate `ZeroFreeRightOf` of 9.2 already belongs, with the same definition, the same API and nearly the same Checks, to QuasiRiemannHypothesis, which comes earlier in the merge order, and this roadmap never cites it. Its §§5.3 and 11.1 also cover part of 9.7 (i) and of the strip forms. The mathematics holds up under recomputation: every Check and worked value was recomputed and agrees, and each `Suggested.lean` statement is true at the pins as written. There are eight small corrections and three format notes, none blocking. For the human reviewers: the family rests on an unrefereed announcement, and none of the five cited books could be read from a legal copy.

## R01 (P2) — The zero-free half-plane predicate of 9.2 already belongs to QuasiRiemannHypothesis, which is earlier in the merge order, and this roadmap does not cite it

As written, two roadmaps would each build `ZeroFreeRightOf` and its lemmas. The ownership sentence of the Scope (line 1371) also claims the predicate, although the merge order gives it to the other roadmap.

QuasiRiemannHypothesis is a new roadmap in pull request #2468. Its §1.1 (`TauCetiRoadmap/QuasiRiemannHypothesis/README.md`, lines 130–176) defines `ZeroFreeRightOf σ f` as order at most `0` at every `s` with `σ < Re s`. Its `Suggested.lean` line 68 has the body `∀ s : ℂ, σ < s.re → meromorphicOrderAt f s ≤ 0`, character for character the body at line 60 here. Six of its API bullets are 9.2's bullets: monotonicity, germs, products, values, Dirichlet L-functions and the reduction of a ray-class character to its primitive source. Five of its Checks reappear in 9.2 almost word for word: `s ↦ s − 2`, the zero function, `1/(s − 1)`, complex conjugation, and the function changed at `2`. The merge order lists QuasiRiemannHypothesis well before this roadmap. The same roadmap's §5.3 bounds `L`, `1/L` and `L′/L` for the finite-order Hecke L-functions of any number field in a zero-free disc, by Borel–Carathéodory and three circles. Its §11.1 proves the zero strip `1 − θ ≤ Re ρ ≤ θ` under a zero-free half-plane. These overlap 9.7 (i) and the σ-strip forms of 9.4–9.5, and neither section is mentioned.

Smallest change:
- In 9.2, keep the id (the sibling roadmaps cite §9.2) and cite QuasiRiemannHypothesis §1.1 for the predicate and the bullets it already states. Keep here only what it lacks: the converse product clause, the conjugation and translation symmetries, and the change of level.
- Add a `### From TauCetiRoadmap.QuasiRiemannHypothesis` contract, and take `ZeroFreeRightOf` out of the ownership sentence.
- Give 9.7 (i) one clause on how it differs from §5.3 (a constant depending only on the degree, for both families), and give the strip forms of 9.4 one clause on how they differ from §11.1 (per character and an equivalence, not per family).
- The local definition in `Suggested.lean` can stay, because an open roadmap's module cannot be imported.

## C01 — The equivalences with the Riemann-hypothesis predicates already on main never name those predicates

A consumer cannot tell from the bullets which statement on main each form matches:
- The second strip form of 9.4 (lines 683–684) is AnalyticNumberTheoryPartI §1.6's `DirichletGRH`; that roadmap's `Suggested.lean` line 480 has the same body.
- The strip form of 9.5 (line 753) is §2.42's ERH(`K`).
- The ζ bridge of 9.3 (lines 597–612) and its first two Checks (lines 627–629) repeat the bridge and Checks of ZerosOfLFunctions Layer 9.

The paragraph on forms on main (lines 1397–1409) calls these equivalent forms, but the bridges are never stated as targets by name. Name `DirichletGRH`, ERH(`K`) and Layer 9's *GRH* as the right-hand sides of those bullets. Cite Layer 9 for the ζ route, and cite §§1.6 and 2.42 for the conductor-one, primitive-reduction and `ℚ(i)` statements they already make.

## C02 — The instance of 10.1 is already a target on main

CharacterSumsOverFiniteFields §7.1 records `instNeZeroConductor : NeZero χ.conductor`, with the same body (its README lines 1482–1483, `Suggested.lean` line 449). So 10.1 and its entry in the Scope (line 1378) create a second owner. Cite §7.1 there, and keep the local instance in `Suggested.lean`, which the headline statements need.

## C03 — The comparison of the prime counts with main omits ClassicalArithmeticCompletion §5.16a (i)

Under DedekindERH `K`, that target gives `|ψ_K(x) − x| ≤ √x ((log x/(2π) + 2) log Δ_K + (log² x/(8π) + 2) n)` for `x ≥ 100`. This contains the `ψ_K` bound of 9.9 (i) at `σ = 1/2` and `psi_sub_self_isBigO_of_riemannHypothesis`. The sentence at lines 1405–1406, which says 9.9 sharpens AnalyticNumberTheoryPartI §1.9 (i), reads as if no sharper form were planned on main. One clause naming §5.16a (i) as the explicit form at `σ = 1/2` would fix it. There is also a name clash: AnalyticNumberTheoryPartI's `Suggested.lean` line 484 declares a `psi_sub_self_isBigO_of_riemannHypothesis` with the exponent `1/2 + ε`. Two different statements under one short name could be avoided by a distinct name here.

## C04 — 8.8 presents as its own a step that ZerosOfLFunctions §8.8 already gives

ZerosOfLFunctions §8.8 says that the exceptional term "does not depend on the dictionary, since two dictionaries induce the same primitive characters". 8.8 here (lines 351–363) makes that step its own target and says that the theorem on main follows "by the first theorem". Read that way, a theorem of a roadmap on main is proved from a target of a later one. Say instead that 8.8 states as a separate target the step that ZerosOfLFunctions §8.8 uses.

## C05 — `generalizedRiemannHypothesis_modOne_iff` is the case `N = 1` of `generalizedRiemannHypothesis_one_iff`

Every character modulo `1` is trivial (Mathlib `DirichletCharacter.level_one`). On a copy of the file, `rw [DirichletCharacter.level_one χ]; exact generalizedRiemannHypothesis_one_iff 1` closes it. As a target it therefore asks nothing beyond `one_iff`. Mark it as a sanity check in its docstring, or keep it as a README bullet only.

## C06 — The sources are cited by chapter only, and most targets carry no locator

Titchmarsh "Chapter XIV" (lines 896, 1000, 1069), Iwaniec–Kowalski "Chapter 5", Ingham "Chapter IV" and Davenport "§§18 and 20" do not say which theorem supports 8.4b, 9.7 (i), 9.7 (ii), 9.8 and 9.9. The three-circles theorem 3.2a cites nothing. Give the theorem or section number at each claim.

## C07 — The module docstring of `Suggested.lean` calls the Grossencharacter predicate statable

Lines 33–36 group it with the predicates that are statable with `AnalyticLFunctionData` and `heckeLFunctionC`. 9.5 defines it through `grossencharacterData`, and the pinned Tau Ceti has neither `Grossencharacter` nor `grossencharacterData`; it has only the idele-class `HeckeCharacter`. Move it to the list of what is not statable, naming the missing carrier.

## C08 — The description reports a failed validation check that passes at this head

The validation paragraph says that every automatic check passes except the one confirming that the pull request changes nothing outside its roadmap folder, and that this check flags the three files of the family index. Those three files belong to this pull request, and at this head that check passes as well, so a reader is told about a failure that does not occur. Writing "every automatic check passes at this head" would make the sentence accurate.

## N01 — Some proposed names in code font are declared nowhere

These are `toPrimitiveRayClassCharacter` (lines 207, 260, 845, 992, 1260, 1309), `PrimitiveDirichletCharacter.of` (lines 992, 1260, 1316) and `of χ` (lines 1195–1202). Italics, as used for the other proposed names, would mark them as proposals.

## N02 — Some library names lack their namespace

`LSeries_vonMangoldt_eq_deriv_riemannZeta_div` is `ArithmeticFunction.LSeries_vonMangoldt_eq_deriv_riemannZeta_div` (lines 269, 1516). `conductor_finitePart_eq_span` and `conductor_infinitePart_eq_empty_iff_even` are in `TauCeti.GlobalNumberFields.RayClassCharacter`, and `ratDirichletEquiv_induced` and `ratModulus_dvd_ratModulus_iff` are in `TauCeti.GlobalNumberFields`.

## N03 — The sentence on layer numbering (lines 64–65) is unclear

"Layers 10 and 11 the Layers 4 and 8 of LFunctions" does not say what is meant, and the scheme gives this roadmap a §8.8 beside the ZerosOfLFunctions §8.8 that it extends. One sentence saying that the ids are this roadmap's own would remove the ambiguity.

## Verified sound

| Statement | Instances tried | Values computed (both sides) | Result |
|---|---|---|---|
| 3.2a three circles | `f = z − z₀` at radii 1, 2, 4; `f = (z − z₀)⁻¹`; θ linear in r | θ = 1/2, 2 = 1^{1/2}4^{1/2}; both sides 1/r₂; linear θ needs 2 ≤ 4^{1/3} = 1.587, false | true; Checks correct |
| 8.4a (a) `rieszSum` | a = δ₁; y < 1; kernel at u ≷ 1 | y − 1; Mellin 1/(s−1) − 1/s = 1/(s(s−1)); empty `Icc 1 0`; residues u, −1 give max(u−1, 0) | true |
| 8.4a (b) remainder, ℚ, ψ = 1, y = 1 | explicit formula at y = 1 | LHS 1 + γ = 1.577216; RHS 0.046191 + log 2π − (1 − log 2) = 1.577216 | agrees |
| 8.4a value Φ(1) | ζ; χ₋₄ | 1 + γ + γ² + 2γ₁ = 1.7647618977; D(1) = 0.2456096, D(1) − D′(1) = 0.5021930 | matches README |
| 8.4a Q_ψ, Q₁ | expansions at s = 1 | limits D(1) − D′(1) and 1 + EK − c₁; c₁ = −(γ² + 2γ₁) at ℚ | matches |
| 8.4b Selberg's formula | ζ, s = 2, x = 2 | prime 0.2239496, pole 0.3606738, sum 0.5846234 vs 0.5699610; gap −0.0146624; trivial −0.0060045; nontrivial ≤ 0.0509 | consistent |
| 8.4b kernel | Laurent series at w = 0 | 1/w + (3/2) log x; double-pole residue F + F′/log x | matches Check |
| 8.8 independence | (4)∞ against (8)∞ for ℚ(i) | both give {1, χ₋₄}; route via common 𝔐 and `RayClassGroup.hom_ext` | true |
| 8.8a identity | 𝔪 = (4)∞, f = 1_τ; K = L = ℚ, 𝔪 = (2), y = 3 | f̂(1) = 1/2, f̂(χ₋₄) = −1/2; D_f ≤ (y log 2)/2 ≤ y log 2; sums 0 and (log 2)/2 | identity re-derived |
| 9.2 `ZeroFreeRightOf` | s − 2; 0; 1/(s−1); conj; f·g = 1 | orders 1, ⊤, −1, junk 0; g = s − 1 not zero-free at 1 | Checks true; R01 |
| 9.3 record GRH | zero record (ε = 1, no shifts, polar 0) | both structures' fields hold at the pin; GRH false, half-plane false, divisor reading true | consistent |
| 9.4 Dirichlet | principal mod 2; even χ₅; level 1 | zeros at 2πik/log 2 (Re 0) excluded; L(0, χ₅) = 0 excluded; reduces to RH | true |
| 9.5 | ℚ(i); N^m over ℚ | L(1, χ₋₄) = π/4 = 0.7854 ≠ 0, product clause applies; zeros of ζ(s−m) have Re > m ≥ 1 | true |
| 9.5 Grossencharacter predicate (C07) | carriers at the Tau Ceti pin | `Grossencharacter`, `grossencharacterData`: no match in the TauCeti sources; only the idele-class `HeckeCharacter` exists | not statable; C07 |
| 9.6 (a) | χ₋₄; nontrivial characters; ζ | 𝔮(0) = 16, region ≥ 0.8019; (log 3/2)/log 9 = 1/4 → β ≥ 3/4; ζ: 1/2 | true |
| 9.7 (i) route radii (R01) | s₀ = 2 + it; σ₀ = 1/2, δ = 1/2 | leftmost Re: r₀ gives 0.625 = σ₀ + δ/4, r₂ gives 1 = σ₀ + δ; r₁ = 0.5 < r₂ = 1 < r₃ = 1.25; log ζ(3/2) = 0.960 | true |
| 9.7 (ii), Littlewood | χ₋₃; q = 3…10⁶ | 𝔮₁ = 15; L(1) = 0.6046; log log 15 = 0.996 ≤ 11 log log 3 = 1.035; ratio ≤ 10.6 | true |
| 9.7 (ii), step factors | σ₁ choices; x₀ = 16 | 2/e = 0.736; 4/√e = 2.43; 1/(4 log 2) = 0.361; 4·16^{−1/2} = 1 ≤ 1.386 | true |
| 9.8 argument bound | arctan lemma; case b > a | g(0) = g(∞) = 0, g′ = r(π − 2r)/(1+r²)²; V > 2a gives 3a/2 ≤ πV | true |
| 9.9 / `primePsi_primeCount_of_zeroFreeRightOf` | uniformity in σ | zero sum ≤ x^σ·O_K(log² x); ∫₂ˣ t^{σ−1} ≤ 2x^σ; `primePsi` has prime powers, `logIntegral` = ∫₂ˣ | true; C03 |
| 10.1 instance (C02) | level 1; primitive χ mod 5; N = 0 excluded | conductor 1 and 5; Mathlib `conductor_ne_zero` (Basic.lean 254) needs `[NeZero n]`, as the instance does | true; C02 |
| 10.2 gamma factor | even and odd χ at s = 0 | `gammaFactor_eq_zero_iff_of_even` gives 0 at n = 0; Γℝ(1) = 1 | true |
| 10.3 bundle | principal mod 6; mod 12 from χ* mod 3 | level 1; factor 1 + 2^{−s} (χ*(2) = −1), 1 at 3 | true |
| 11.1 cards | χ₋₄; even χ₅; conductor one | `ratModulus 4` with real place; `ratFiniteModulus 5`; completedRiemannZeta 1 = −0.97690 against 0 in normal form | true |
| `riemannHypothesis_iff_zeroFreeRightOf` | s = 1; 0 < Re s < 1/2 | order −1 at 1; reflected through `riemannZeta_one_sub` | true |
| `riemannHypothesis_iff_riemannZeta_ne_zero` | s = 1 | ζ(1) = (γ − log 4π)/2 = −0.977 ≠ 0, so no s ≠ 1 needed | true |
| `generalizedRiemannHypothesis_iff_LFunction_ne_zero` | χ = 1, s = 1 | order −1, excluded by the disjunct; analytic elsewhere | true |
| `generalizedRiemannHypothesis_iff_re_eq_half` | principal mod 2; Re ≥ 1 | Re 0 zeros excluded; `LFunction_ne_zero_of_one_le_re` | true |
| `generalizedRiemannHypothesis_modOne_iff` / `_one_iff` | N = 1; ζ·∏(1 − p^{−s}) | the first follows from `level_one` (elaborated); factors vanish only on Re 0 | true; C05 |
| `forall_…_isPrimitive`, `_primitiveCharacter_iff` | level change | `LFunction_changeLevel` gives germs equal; instance from 10.1 | true |
| `norm_rieszRemainder_le_of_zeroFreeRightOf` | level 1 and level > 1 | zero terms ≤ y^σ Σ m/‖ρ(1−ρ)‖; E = O(log y) ≤ O(y^{1/2}) | true |
| `log_norm_riemannZeta_le_of_riemannHypothesis` | t at a zero; t = 16 | Real.log 0 = 0; log log 16 = 1.0198 > 0 | true |
| `LFunction_one_bounds_of_generalizedRiemannHypothesis` | q = 3; C ≤ 0 | log log 3 = 0.094 > 0; C ≤ 0 makes the second bound false, so nontrivial | true |
| `psi_sub_self`, `primeCounting_sub_logIntegral` | von Koch | √x log² x and √x log x | true; C03 |
| R01 witness | the two `ZeroFreeRightOf` bodies | line 60 here and QuasiRiemannHypothesis `Suggested.lean` line 68 identical | duplicate |

- Source locators checked against the text: 0 of 8; none of the five cited works has a legal copy.
- Library declarations opened at the pins: 106 declarations checked with `#check` at the pins, all resolved (7 under their full namespace).
- Cross-roadmap citations resolved on main: every ZerosOfLFunctions § and Layer cited; LFunctions Layers 0–8 and their names; ArithmeticDirichletSeries 2.3, 5.2, 6.1, 6.2, 10.1, 10.2; AnalyticNumberTheoryPartI, ExplicitZetaBounds, ExplicitPrimeCounting, ClassicalArithmeticCompletion and ClassFieldTheory sections.
- Automatic checks: every one passes; dependency check `depcheck: 171 roadmaps, 1990 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: 14 `sorry` warnings and nothing else. The elaborated signatures were compared with the README statements, and no binder was dropped.
- One-tactic probe (`rfl | simp | infer_instance | decide | norm_num`): all 14 theorems survive.
Overlap check: read QuasiRiemannHypothesis, GeneralizedRiemannHypothesisFromWindowBounds, RieszSumsOverPrimesAndExceptionalZeros, ExplicitNumberFields, ZerosOfLFunctions, LFunctions, ExplicitZetaBounds, AnalyticNumberTheoryPartI, ClassicalArithmeticCompletion, CharacterSumsOverFiniteFields; shared: `ZeroFreeRightOf` (owner QuasiRiemannHypothesis §1.1, R01), the Dirichlet and Dedekind GRH predicates (variants of AnalyticNumberTheoryPartI §§1.6, 2.42 and ZerosOfLFunctions Layer 9, C01), `NeZero χ.conductor` (owner CharacterSumsOverFiniteFields §7.1, C02), Riesz sums and remainders (owner this roadmap; RieszSumsOverPrimesAndExceptionalZeros cites 8.4a), `PrimitiveDirichletCharacter` (owner this roadmap; the later ThetaChainsAndFrobeniusPrimeSums declares its own structure and should cite 10.3).

Source independence: 0 passages compared with 0 sources (no legal copy of Titchmarsh, Davenport, Iwaniec–Kowalski, Ingham or Littlewood 1928); largest share Titchmarsh–Heath-Brown, 4 of 8 locators, all at chapter level; contents not compared (no table of contents read); the layers are numbered after ZerosOfLFunctions and LFunctions, and their order follows the dependency lines (3.2a and 8.4b feed 9.7–9.8; 10.3 and 11.1 feed 8.4a).

Research link: 9.7–9.9 are the classical consequences of the Riemann hypothesis (Littlewood 1928 for `L(1, χ)`; Selberg's formula and the `S(T)` and `log ζ` bounds of Titchmarsh Chapter XIV; von Koch), and 9.2–9.6 are the interface through which GeneralizedRiemannHypothesisFromWindowBounds states its theorem; rests on the README's references and overview.

## Not verifiable

- Titchmarsh–Heath-Brown, *The Theory of the Riemann Zeta-Function*, Ch. XIV: the sources service found no legal copy.
- Davenport, *Multiplicative Number Theory*, §§18 and 20: the DOI resolves only to the Springer paywall.
- Iwaniec–Kowalski, *Analytic Number Theory*, Ch. 5: only the AMS landing page; no open copy.
- Ingham, *The Distribution of Prime Numbers*, Ch. IV: no legal copy found.
- Littlewood 1928, *Proc. London Math. Soc.*: publisher paywall; the service's open-repository search failed.
- Targets 3.2a, 8.4a, 8.8, 8.8a, 9.2–9.6, 10.2, 10.3 and 11.1 of the sample carry no source locator; they were checked by computation and against the pinned libraries only.
- The announcement on which the family index relies was not opened.

Automatic checks set aside as false positives: the citation resolver read the sentence on line 65, which numbers this roadmap's Layers 10 and 11, as a citation of a "Layer 10" of ZerosOfLFunctions. The two Lean names it reports as found nowhere are declared in this roadmap's own `Suggested.lean`.

## Source issues

- none

## For the human reviewers

- Scope: the family index carried by this pull request (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, lines 9–14) follows a formal proof of the Riemann hypothesis for Dirichlet L-functions, announced 20 November 2026 in an author's PDF and a GitHub repository. Lines 1422–1424 of this README say a sibling roadmap "proves it". I found no refereed source and did not open the announcement.
- Not tested: Titchmarsh–Heath-Brown, the source with the largest share of locators (4 of 8), has no legal copy, so wording and arrangement were not compared against it or against the other four sources.
