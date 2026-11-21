# Review of RiemannHypothesisStatementsAndConsequences (pull request #2885 at 36e4c71)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/RiemannHypothesisStatementsAndConsequences/`
**Verdict:** accepted

**Summary.** Accepted: no finding. The previous finding is repaired (the global converse product clause of 9.2 carries its meromorphy hypothesis again, with a correct negative control), every Check and worked value of the sample recomputes, and each of the 13 `Suggested.lean` theorems is true as written at the pins and survives the one-tactic probe. There is one small correction and one format note, neither blocking. For the human reviewers: the family and one sentence of 9.9 rest on unrefereed announcements, and none of the cited books or Littlewood's paper could be read from a legal copy, so no locator, wording or arrangement was compared with a source.

## C01 — In the Lean form of Littlewood's bounds the hypothesis `χ ≠ 1` follows from the other two

`LFunction_one_bounds_of_generalizedRiemannHypothesis` (`Suggested.lean`, line 173) assumes `3 ≤ q`, `χ.IsPrimitive` and `χ ≠ 1`. The third is implied by the first two: Mathlib's `DirichletCharacter.conductor_one` gives the trivial character conductor `1`, and `IsPrimitive` says the conductor is `q`, so a primitive trivial character has `q = 1`. I checked this in Lean at the pin (`rintro rfl`, `conductor_one`, `isPrimitive_def`, `omega`). An implementer loses nothing and a caller must supply a redundant proof. Either drop `χ ≠ 1` from the signature, or keep it and say in the docstring that it is there to match the prose of 9.7 ("a primitive `χ ≠ 1` modulo `q ≥ 3`").

## N01 — The book citations are at chapter level, and 3.2a has none

The locators now stand at the claims (8.4b line 322, 9.7 lines 941 and 1046–1047, 9.8 lines 1116–1117, 9.9 lines 1157–1158), but each is a chapter ("Titchmarsh, Chapter XIV", "Iwaniec–Kowalski, Chapter 5", "Ingham, Chapter IV"), and the three-circles theorem 3.2a cites no source. A theorem or section number at each would let a reader check the statement without searching a chapter.

## Earlier findings

- R01 — repaired. 9.2 (lines 527–529) now reads "So if `f` and `g` are meromorphic at every point right of `σ`, `g` has no pole there and every pole of `f` there is a point of order `0` of `g`, then …", and a Check (lines 558–561) gives the control `f(s) = (s − 2) e^{conj s}`, `g(s) = e^{−conj s}`: orders `0`, `0`, product `s − 2` of order `1` at `2`. Recomputed; correct.
- C01 — partly repaired: locators are now placed at the claims of 8.4b, 9.7, 9.8 and 9.9; they remain chapter-level and 3.2a has none (N01 above).
- C02 — not repaired: deferred (D01).
- C03 — repaired. The description now says "Every supplier is on main except QuasiRiemannHypothesis … ExplicitNumberFields … is cited at §§0.5 and 7.2 for comparison only", and names the four family roadmaps as consumers.

## Deferred findings

- D01 — resolved: GeneralizedRiemannHypothesisFromWindowBounds at its open head no longer names `generalizedRiemannHypothesis_modOne_iff`; the name occurs in no roadmap on main or in an open pull request.

## Verified sound

| Statement | Instances tried | Values computed (both sides) | Result |
|---|---|---|---|
| 3.2a three circles | `z − z₀` at 1, 2, 4; `(z − z₀)⁻¹`; `M(r₁) = 0`; linear exponent | θ = 1/2, 2 = 1·2; 1/r₂ both sides; `0^{1−θ}` forces f ≡ 0, `0^0 = 1` at θ = 1; 2 ≤ 1.587 false | true |
| 8.4a (a) Riesz sum, Mellin, inversion | a = δ₁; y < 1; term at y = n | y − 1; 1/(s−1) − 1/s = 1/(s(s−1)); empty sum 0; a(n)(n/n − 1) = 0, continuous | true |
| 8.4a (b) transform `Q_ψ`, value at 1 | ψ ≠ 1; ψ = 1, K = ℚ; χ₋₄ | D(1) − D′(1); 1 + γ − c₁, c₁ = −(γ² + 2γ₁): 1.7647619; D(1) = 0.2456096, D′(1) = −0.2565834, 0.5021931 | true |
| 8.4a (b) explicit formula at ℚ, y = 1 | ψ = 1 | LHS 1 + γ = 1.5772157; RHS 0.0461914 + log 2π − (1 − log 2) = 1.5772157 | agrees |
| 8.4a size bounds | termwise; explicit formula | ≤ y terms, each ≤ [K:ℚ]y; ‖y^ρ‖ ≤ y, E = O(log y) | true |
| 8.4b Selberg's formula | residues re-derived; ζ, s = 2, x = 2 | kernel 1/w + (3/2)log x; 0.2239496 + 0.3606738 = 0.5846234 vs 0.5699610; trivial −0.0060045; nontrivial needed −0.0086579, bound 0.051 | signs correct |
| 8.8 independence of the dictionary | ZerosOfLFunctions §8.8 read | there a reason inside a sentence, not a target; here a theorem; route through `RayClassGroup.hom_ext` | true, not a duplicate |
| 8.8a identity and bound | 𝔪 = 1, G trivial; ℚ(i), f = 1_τ; ℚ, 𝔪 = (2), y = 3 | definition of the remainder; f̂ = 1/2, −1/2, D_f ≤ (y log 2)/2 ≤ y log 2; 0 against (log 2)/2 | true |
| 9.2 added clauses | product: orders (≥0, ≥0), (<0, 0), ⊤; translate a = 1; junk-order pair | sum ≤ 0 iff both 0; pole case both sides true; thresholds 2 → 1, 3/2 → 1/2; orders 0, 0, product 1 | true |
| 9.3 record hypothesis | zero record; ζ at 1; `HasFunctionalEquation` at the pin | order ⊤: hypothesis and half-plane both false; order −1; `completed_eq` off poles, `dual_completed` by `rfl` | true |
| 9.4 Dirichlet forms | σ < 1/2, σ ≥ 1 in the σ-strip; principal mod 2; even χ₅ | both sides "no strip zero"; both true; zeros on Re 0 unseen; L(0, χ₅) = 0 has Re 0 | true |
| 9.5 Dedekind, ray class, Grossencharacter | ℚ(i); N^m over ℚ; real quadratic at 0 | L(1, χ₋₄) = 0.7853982 ≠ 0; zeros of ζ(s − m) in (m, m+1), threshold m + 1/2; order 1 at Re 0 | true |
| 9.6 first consequences | χ₋₄; ζ; n ≥ 2 | 4·4 = 16, 1 − (log 3/2)/log 16 = 0.80188; (log 3/2)/log 3 = 1/2; (log 3/2)/log 9 = 1/4 | true |
| 9.7 growth | step 2 at s₁; x = (log 𝔮)^{1/(2(1−σ₀))}; step 5 at σ₀ = 1/2, x = 16; q = 3 | 2/e = 0.7358 < 1 (wrong σ₁: 2.426); log log 16 = 1.0198 ≥ 1; 0.3607 ≤ 1/2; log log 15/log log 3 = 10.59 ≤ 11 | true |
| 9.8 argument, `S(T)` | arctan inequality; case b > a | g′ = r(π − 2r)/(1 + r²)², g(0) = g(∞) = 0; a(a + 2b)/(2b) ≤ 3a/2 ≤ πV | true |
| 9.9 prime counts | uniformity in σ; σ < 1/2 | zero sum ≤ x^σ ∑ 1/‖ρ‖; ∫₂ˣ t^{σ−1} dt ≤ 2x^σ; pair ρ, 1 − conj ρ puts a zero at Re ≥ 1/2 | true |
| 10.2 gamma factor | even and odd χ at s = 0 | Γℝ(0) junk 0 at the pole; Γℝ(1) = 1 | true |
| 10.3 bundle | principal mod 6; mod 12 from χ* mod 3 | level 1; factors 1 + 2^{−s} at 2 and 1 at 3 | true |
| `riemannHypothesis_iff_zeroFreeRightOf`, `…_iff_riemannZeta_ne_zero` | s = 1; 0 < Re s < 1/2 | order −1; `riemannZeta 1` = −0.9769043 ≠ 0; 1 − s has Re > 1/2 | true |
| `generalizedRiemannHypothesis_iff_LFunction_ne_zero`, `…_iff_re_eq_half`, `…_one_iff` | χ = 1 at s = 1; principal mod 2; Re ≥ 1 | pole excluded by the disjunct; Euler factor zeros on Re 0; no zero on Re ≥ 1 | true |
| `forall_…_isPrimitive`, `…_primitiveCharacter_iff` | change of level M ∣ N | ∏(1 − ψ(p)p^{−s}) vanishes only on Re 0; instance gives `NeZero χ.conductor` | true |
| `norm_rieszRemainder_le_of_zeroFreeRightOf` | level 1 and level > 1 branches | match 8.4a (b); zero terms ≤ y^σ, E = O(log y) ≤ O(y^σ) for y ≥ 2 | true |
| `log_norm_riemannZeta_le_of_riemannHypothesis` | zero ordinate; t = 16 | `Real.log 0 = 0` ≤ bound; log log 16 = 1.0198 > 0; 𝔮 = ‖1/2 + it‖ + 3 ≥ 16 | true |
| `LFunction_one_bounds_of_generalizedRiemannHypothesis` (C01) | q = 3; χ = 1 primitive | log log 3 = 0.0940 > 0; 𝔮₁ = 15, L(1, χ₋₃) = 0.6046 absorbed; conductor 1 ≠ q | true; `χ ≠ 1` redundant |
| `primePsi_primeCount_of_zeroFreeRightOf` | quantifier order; pinned bodies | ∃ C x₀ before ∀ σ; `primePsi` over prime powers, `primeCount` over primes, Li = ∫₂ˣ | true |
| `psi_sub_self…`, `primeCounting_sub_logIntegral…` | σ = 1/2 at ℚ | √x log² x; √x log x | true |

- Source locators checked against the text: 0 of 9 (no legal copy of any cited text).
- Library declarations opened at the pins: Mathlib `NumberTheory/LSeries/RiemannZeta.lean` 185, `NumberTheory/Harmonic/ZetaAsymp.lean` 420, `Analysis/Meromorphic/Order.lean` 56 and 964, `Analysis/Complex/Hadamard.lean` 611, `Analysis/Complex/BorelCaratheodory.lean` 109, `NumberTheory/Chebyshev.lean` 485, `NumberTheory/LSeries/DirichletContinuation.lean` 149, `NumberTheory/DirichletCharacter/Basic.lean` 258; Tau Ceti `NumberTheory/LFunctions/Data/Basic.lean` 147, 183, 193, `NumberTheory/ArithmeticDirichletSeries/Prime/Psi.lean` 148, `…/Counting.lean` 630, `Analysis/SpecialFunctions/LogIntegral.lean` 141, `Analysis/Meromorphic/Continuation.lean` 72, `NumberTheory/ClassFieldTheory/Global/AdmissibleModulus/Ramification.lean` 147. No complex three-circles theorem, Riesz sum or zero-free half-plane predicate exists at either pin (Tau Ceti's three-circles inequality is for Gauss valuations of Witt vectors).
- Cross-roadmap citations resolved: on main, ZerosOfLFunctions (29 sections and Layers 0, 2, 9; §8.8 read), AnalyticNumberTheoryPartI (8 sections; `DirichletGRH` read at line 961), ClassicalArithmeticCompletion (4), ExplicitZetaBounds (5), ExplicitPrimeCounting (2), ArithmeticDirichletSeries (items 2.3, 5.2, 6.1, 6.2, 10.1, 10.2), CharacterSumsOverFiniteFields §7.1, ClassFieldTheory Layer 13; at open heads, QuasiRiemannHypothesis §§1.1, 5.3, 10.7, 11.1 (read) and ExplicitNumberFields §§0.5, 7.2.
- Automatic checks: all passed at this head. Dependency check: `depcheck: 171 roadmaps, 1994 edges, 0 problem(s)`. The pull request changes nothing outside the folder except the three family-index files.
- Elaboration of `Suggested.lean`: 13 `sorry` warnings and nothing else. The elaborated types of all 19 declarations were compared with the README statements: no binder lost, no difference in generality.
- One-tactic probe (`rfl`, `simp` with the definitions unfolded, `infer_instance`, `trivial`, `norm_num`, `exact?`): all 13 theorems survive.
- Numerics recomputed in floating point (Hurwitz zeta by Euler–Maclaurin): the values in the table.

Overlap check: read QuasiRiemannHypothesis, GeneralizedRiemannHypothesisFromWindowBounds, RieszSumsOverPrimesAndExceptionalZeros, ZerosOfLFunctions, and by section LFunctions, ExplicitNumberFields, ExplicitZetaBounds. Shared: `ZeroFreeRightOf` and its first properties, owner QuasiRiemannHypothesis §1.1, cited; the instance `NeZero χ.conductor`, owner CharacterSumsOverFiniteFields §7.1, cited (its Lean name there is in that roadmap's namespace, no clash); the Riemann-hypothesis predicates of ZerosOfLFunctions Layer 9, AnalyticNumberTheoryPartI §§1.6 and 2.42 and ClassicalArithmeticCompletion §5.0, each bridged; Riesz sums and remainders, the three-circles theorem, Selberg's formula and `PrimitiveDirichletCharacter`, owner this roadmap, as the two family consumers read say in their scope sections (their local Lean copies are in their own namespaces).

Source independence: 0 passages compared with 0 sources (no legal copy of Titchmarsh–Heath-Brown, Iwaniec–Kowalski, Ingham, Davenport or Littlewood 1928); largest share Titchmarsh–Heath-Brown, 4 of 9 locators, all to one chapter; contents not compared, no table of contents having been read. The five layers cite a single chapter of that book, and their order is forced by the dependency lines (3.2a and 8.4b into 9.7–9.8; 10.3 and 11.1 into 8.4a and 9.6).

Research link: 9.7–9.9 are the classical consequences of the Riemann hypothesis (Littlewood 1928 for `L(1, χ)`; Selberg's formula, `log ζ` and `S(T)` as in Titchmarsh–Heath-Brown, Chapter XIV; von Koch), stated under a zero-free half-plane; 9.2–9.6 and 8.4a are the interface of GeneralizedRiemannHypothesisFromWindowBounds. Rests on the README's References and Downstream consumers.

## Not verifiable

- Titchmarsh–Heath-Brown, Chapter XIV (8.4b, 9.7, 9.8): the sources service found no legal copy.
- Iwaniec–Kowalski, Chapter 5 (9.7, 9.8): the publisher's page only; no open copy.
- Ingham, Chapter IV (9.9): no legal copy found.
- Littlewood 1928 (9.7 (ii) (d)): the DOI's page refused access; no open copy.
- Davenport, §§18 and 20 (9.9): settled as uncertified, cited by its locator.
- The sample targets 3.2a, 8.4a, 8.8, 8.8a, 9.2–9.6, 10.2, 10.3 carry no source locator; they were checked by computation, against the pinned libraries and against the supplier roadmaps.
- The announcement of the formal proof that the family index relies on was not opened.

Automatic checks set aside as false positives: the citation resolver listed three Lean names as found nowhere (the Dirichlet predicate, the conductor instance and the remainder bound), all declared in this roadmap's own `Suggested.lean`; and the listing of Lean declarations read the words "theorem 3.2a," in the module docstring as a declaration named `3.2a,`.

## Source issues

- none

## For the human reviewers

- Scope: the family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`) and the description follow an announced formal proof of the Riemann hypothesis for Dirichlet L-functions (Alpöge, 20 November 2026); README lines 1514–1516 say a sibling roadmap proves it. No refereed source; the announcement was not opened.
- Scope: 9.9 (README lines 1166–1169) states `ψ(x) − x = O(x^{11/12} log² x)` unconditionally from QuasiRiemannHypothesis §10.7, which cites the preprints `openai2026quasiRH` and `liu2026improved` for its half-plane.
- Not tested: Titchmarsh–Heath-Brown, the source with the largest share of locators (4 of 9), has no legal copy; wording and arrangement were compared with none of the five cited texts.
