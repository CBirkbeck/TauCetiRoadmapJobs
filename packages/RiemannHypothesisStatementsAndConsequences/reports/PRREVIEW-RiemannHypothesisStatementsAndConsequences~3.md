# Review of RiemannHypothesisStatementsAndConsequences (pull request #2885 at 3361ea7)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/RiemannHypothesisStatementsAndConsequences/`
**Verdict:** needs changes

**Summary.** Changes are needed for one finding. Repairing the previous review cost the global form of 9.2's converse product clause its meromorphy hypothesis. As written it is false for functions that are not meromorphic, which Mathlib gives order `0` everywhere, and adding one phrase repairs it. Everything else holds up: the previous ownership finding is repaired, every Check and worked value in the sample recomputes correctly, and each `Suggested.lean` statement is true at the pins as written. There are three small corrections and no format notes; for the human reviewers, the family and one sentence of 9.9 rest on unrefereed announcements, and none of the cited books could be read from a legal copy.

## R01 (P2) — The global form of 9.2's converse product clause has lost its meromorphy hypothesis, and without it the statement is false

Mathlib gives a function that is not meromorphic at a point the junk order `0` there, so such a function is zero-free right of every `σ` and has no poles. The sentence in the converse product bullet of 9.2 (lines 527–529) reads: "So if `g` has no pole right of `σ` and every pole of `f` there is a point of order `0` of `g`, then `f · g` is zero-free right of `σ` exactly when `f` and `g` both are." Read literally, it fails. Take `Re s₀ > σ`, `f(s) = (s − s₀) e^{conj s}` and `g(s) = e^{−conj s}`. Neither function is meromorphic at any point: `e^{±conj s}` is nowhere complex-differentiable, and `f/(s − s₀)` is `e^{conj s}`. So both have order `0` everywhere: neither has a pole, the condition holds, and both are zero-free right of `σ`. But `f · g = s − s₀` has order `1` at `s₀`, so it is not zero-free right of `σ`.

The pointwise sentence just before carries the hypothesis ("at a point `s` where `f` and `g` are meromorphic"). At the previous head, the bullet opened with "if `f` and `g` are meromorphic at every point of `Re s > σ`", and this sentence inherited it. The repair that moved the forward product rules to QuasiRiemannHypothesis §1.1 removed that opening. The one use of the clause, the `ℚ(i)` Check of 9.5 (lines 840–844), applies it to meromorphic functions and is unaffected. Smallest change: "So if `f` and `g` are meromorphic at every point right of `σ`, `g` has no pole there and every pole of `f` there is a point of order `0` of `g`, then …".

## C01 — The cited books are still located at chapter level, and 3.2a and 8.4b carry no locator at the claim

This is the previous review's C06, unchanged. "Titchmarsh, Chapter XIV" (lines 938, 1043, 1113), Iwaniec–Kowalski "Chapter 5" and Ingham "Chapter IV" (References, lines 1681–1686) do not say which theorem supports 9.7, 9.8 and 9.9. Selberg's formula 8.4b cites no source in its own section; Titchmarsh is credited for it only in the References. The three-circles theorem 3.2a cites nothing. Giving the theorem or section number at each claim would let a reader check the statements.

## C02 — GeneralizedRiemannHypothesisFromWindowBounds still cites `generalizedRiemannHypothesis_modOne_iff` of 9.4, which this head no longer declares

The theorem was dropped from `Suggested.lean` after the previous review, and its statement survives only in prose in 9.4 (lines 698–701). That roadmap's §5.2 route still reads "RiemannHypothesisStatementsAndConsequences §9.4's `generalizedRiemannHypothesis_modOne_iff`", and its contract list for §9.4 names it as well, so a reader who follows the pointer finds nothing. The fix belongs in that roadmap: cite `generalizedRiemannHypothesis_one_iff` at `N = 1` instead, or the modulus-one bullet of 9.4.

## C03 — The description says that sub-roadmaps of the family merge first, but none of them is a supplier

The dependencies paragraph says "Sub-roadmaps of the family and other roadmaps that are still in open pull requests merge first". No *Needs:* line and no supplier contract in the README names a roadmap of the family. The four family roadmaps the README names (GeneralizedRiemannHypothesisFromWindowBounds, FrobeniusRestrictedRieszSums, QuadraticTwistSelectionOverPrimes, RieszSumsOverPrimesAndExceptionalZeros) are consumers. Text that would be right: "The only supplier still in an open pull request is QuasiRiemannHypothesis (§1.1); ExplicitNumberFields §§0.5 and 7.2 is cited for comparison only."

## Earlier findings

- R01 (ownership of `ZeroFreeRightOf`): repaired. 9.2 now opens "is the predicate of QuasiRiemannHypothesis §1.1". There is a `From TauCetiRoadmap.QuasiRiemannHypothesis` contract and a scope paragraph (lines 1472–1477), and one clause each distinguishes 9.7 (i) from §5.3 (lines 915–918) and the strip forms from §11.1 (lines 684–686).
- C01 (bridges unnamed): repaired. 9.4 has a "Bridge" bullet to `DirichletGRH`, 9.5 names ERH(`K`), `DedekindERH` and `HeckeGRH`, and 9.3 names Layer 9's *GRH*.
- C02 (instance already on main): repaired. The instance cites CharacterSumsOverFiniteFields §7.1 (Conventions, 9.2, 10.3).
- C03 (ClassicalArithmeticCompletion §5.16a omitted, name clash): repaired. 9.9 cites §5.16a (i), and the theorem is now `psi_sub_self_isBigO_sqrt_mul_log_sq_of_riemannHypothesis`.
- C04 (8.8 against ZerosOfLFunctions §8.8): repaired. 8.8 "states as a theorem of its own the step that ZerosOfLFunctions §8.8 uses".
- C05 (`modOne_iff` a case of `one_iff`): repaired by deleting the declaration; the consumer citation it leaves is C02 above.
- C06 (chapter-level locators): not repaired (C01 above).
- C07 (Grossencharacter predicate called statable): repaired (module docstring, lines 38–41).
- C08 (description reported a failing check): repaired.
- N01–N03: repaired (proposed names in italics, namespaces added, the numbering sentence of lines 65–67 rewritten).

## Verified sound

| Statement | Instances tried | Values computed (both sides) | Result |
|---|---|---|---|
| 3.2a three circles | `z − z₀` at 1, 2, 4; `(z − z₀)⁻¹`; θ linear in r; f = 0 on annulus, 1 at z₀ | θ = 1/2, 2 = 1·2; both sides 1/r₂; 2 ≤ 4^{1/3} = 1.587 false; M = 0 on [r₁, r₃] | true; Checks hold |
| 8.4a (a) `rieszSum`, Mellin, inversion | a = δ₁; ExplicitZetaBounds §6.1a at j = 1, s = w + 1 | y − 1; 1/(s−1) − 1/s = 1/(s(s−1)); Σ b(n)(y − n) = Σ a(n)(y/n − 1) | true |
| 8.4a (b) remainder at ℚ, y = 1 | ψ = 1 | LHS 1 + γ = 1.5772157; zeros 0.0461914 + E(1) 1.5310242 = 1.5772157 | agrees |
| 8.4a (b) value Φ(1) | ζ; χ₋₄ | Φ₁(1) = 1 + γ + γ² + 2γ₁ = 1.7647619; D(1) = 0.2456096, D(1) − D′(1) = 0.5021930 | matches Checks |
| 8.4a size bound | termwise | ‖a_ψ(m)‖ ≤ [K:ℚ]Λ(m) ≤ [K:ℚ]m; ≤ y terms, each ≤ [K:ℚ]y | true |
| 8.4b Selberg's formula | residues re-derived; ζ, s = 2, x = 2 | kernel 1/w + (3/2)log x; prime 0.2239496 + pole 0.3606738 vs 0.5699610; trivial −0.0060; nontrivial ≤ 0.05 | signs correct; consistent |
| 8.8 dictionary independence | (4)∞ against (8)∞ for ℚ(i) | both give {1, χ₋₄}; induced characters agree on primes ∤ 𝔐, then `RayClassGroup.hom_ext` | true |
| 8.8a identity and bound | 𝔪 = (4)∞, f = 1_τ; ℚ, 𝔪 = (2), y = 3 | f̂(1) = 1/2, f̂(χ₋₄) = −1/2; D_f ≤ (y log 2)/2 ≤ y log 2; sums 0 and (log 2)/2 | identity re-derived |
| 9.2 clauses (R01) | translate a = 1; f = 1/(s−1), g = s−1; f = (s−s₀)e^{conj s}, g = e^{−conj s} | thresholds 2 → 1 as stated; pole condition needed; junk orders 0, 0, product order 1 | pointwise true; global form false |
| 9.3 record GRH | zero record; quartic χ mod 5 | order ⊤: GRH false, half-plane false, divisor reading true; ρ ↦ 1 − conj ρ | consistent |
| 9.4 Dirichlet | principal mod 2; even χ₅; strip form at σ < 1/2 and σ ≥ 1 | Re 0 zeros excluded; L(0, χ₅) = 0 excluded; both sides "no strip zero" / both true | true |
| 9.5 | ℚ(i); N^m over ℚ; trivial at `ratModulus 4` | L(1, χ₋₄) = π/4 = 0.7854 ≠ 0; `idealShift` m, threshold 1/2 + m; zeros of 1 − 2^{−s} on Re 0 | true |
| 9.6 (a) | χ₋₄; [K:ℚ] ≥ 2; ζ | region from 0.80188; 3^{r₁}12^{r₂} ≥ 9; (log 3/2)/log 9 = 1/4 | true |
| 9.6 (c) | level 1 and level > 1 | zero terms ≤ y^σ Σ m/‖ρ(1−ρ)‖; E = O(log y) ≤ O(y^σ) | true |
| 9.7 (i) route radii | s₀ = 2 + it, σ₀ = 1/2, δ = 1/2 | r₁ 0.5 < r₂ 1 < r₃ 1.25 < r₀ 1.375; distance to pole ≥ √5 > 1.5 | true |
| 9.7 (ii) steps 2–5 | factors; χ₋₃; log log 5q | 2/e = 0.736; 1/(4 log 2) = 0.3607; 𝔮₁ = 15, 𝔮(1/2) = 13.5; 0.9962 ≤ 1.0345 | true |
| 9.8 argument bound | arctan lemma; case b > a | g′ = r(π − 2r)/(1 + r²)², g(0) = g(∞) = 0; a(a + 2b)/(2b) ≤ 3a/2 ≤ πV | true |
| 9.9 prime counts | uniformity in σ; prime powers | zero sum ≤ x^σ C_K log² x; ∫₂ˣ t^{σ−1} ≤ 2x^σ; ψ_K − θ_K = O(n√x) | true |
| 10.2 gamma factor | even, odd χ at s = 0 | junk 0 at the pole (even); Γℝ(1) = 1 | true |
| 10.3 bundle | principal mod 6; mod 12 from χ₋₃ | bundle of level 1; factor 1 + 2^{−s}, and 1 at 3 | true |
| 11.1 equivalence, cards | χ₋₄; even χ₅; conductor one | `ratModulus 4`; `ratFiniteModulus 5`; `completedRiemannZeta 1` = −0.97690 against 0 | true |
| `riemannHypothesis_iff_zeroFreeRightOf` | s = 1; 0 < Re s < 1/2 | order −1 at 1; reflection by `riemannZeta_one_sub` | true |
| `riemannHypothesis_iff_riemannZeta_ne_zero` | s = 1 | `riemannZeta 1` = (γ − log 4π)/2 = −0.9769 ≠ 0 | true |
| `generalizedRiemannHypothesis_iff_LFunction_ne_zero` | χ = 1, s = 1 | order −1, excluded by the disjunct; analytic elsewhere | true |
| `generalizedRiemannHypothesis_iff_re_eq_half` | principal mod 2; Re ≥ 1 | Re 0 zeros outside; `LFunction_ne_zero_of_one_le_re` | true |
| `generalizedRiemannHypothesis_one_iff` | N = 1, 2, 6 | ζ·∏(1 − p^{−s}), factors vanish only on Re 0 | true |
| `forall_…_isPrimitive`, `…_primitiveCharacter_iff` | level change | `LFunction_changeLevel` germs; instance gives `NeZero χ.conductor` | true |
| `norm_rieszRemainder_le_of_zeroFreeRightOf` | level 1, level > 1 | as 9.6 (c); `if χ.level = 1` branch matches 8.4a (b) | true |
| `log_norm_riemannZeta_le_of_riemannHypothesis` | zero ordinate; t = 16 | `Real.log 0 = 0`; log log 16 = 1.0198 > 0 | true |
| `LFunction_one_bounds_of_generalizedRiemannHypothesis` | q = 3; C ≤ 0 | log log 3 = 0.094 > 0; C ≤ 0 falsifies the upper bound | true, nontrivial |
| `primePsi_primeCount_of_zeroFreeRightOf` | σ-uniformity; `primePsi`, `primeCount`, `logIntegral` bodies | ∃ C x₀ before ∀ σ; Li = ∫₂ˣ; weights log N𝔭 | true |
| `psi_sub_self…`, `primeCounting_sub_logIntegral…` | von Koch; ClassicalArithmeticCompletion §5.16a (i) at K = ℚ | √x log² x; √x log x; Schoenfeld forms need computational hypotheses | true; not duplicates |

- Source locators checked against the text: 0 of 9, because none of the cited books or Littlewood 1928 has a legal copy.
- Library declarations: 122 cited names resolved by `#check` at the pins (Mathlib 1b1ccf4b0, Tau Ceti 2fd255d997). The rest were placeholders, this roadmap's own names, roadmap-level names found in their supplier roadmaps, or names found in the source. Opened: Mathlib `Analysis/Meromorphic/Order.lean` 466, 952, 964 and `NumberTheory/Harmonic/ZetaAsymp.lean` 420, 428; Tau Ceti `NumberTheory/LFunctions/Data/Basic.lean` 194, 269, `Analysis/Contour/Residue/Cycle.lean` 226, `Analysis/Meromorphic/Conj.lean` 75, `NumberTheory/DirichletCharacter/LFunction/Conjugate.lean` 70, and `NumberTheory/NumberField/Global/RayClass/Integral.lean` 244.
- Cross-roadmap citations resolved:
  - on main: ZerosOfLFunctions §§1.4–8.8 and Layers 0, 2, 9; LFunctions names in its README and `Suggested.lean` (`heckeLFunctionC_eq` 1587, `completedHeckeLFunction_one_sub` 1661, `heckeLFunction_ne_zero_of_one_le_re` 2680, `dedekindZetaC` 965); AnalyticNumberTheoryPartI §§0.1, 0.30, 0.34, 1.6, 1.9, 2.39b, 2.42, 2.49; ClassicalArithmeticCompletion §§5.0, 5.16a; CharacterSumsOverFiniteFields §7.1; ExplicitZetaBounds §§0.2, 2.9, 6.1a; ExplicitPrimeCounting §§2.2, 6.5; ArithmeticDirichletSeries 2.3, 5.2, 6.1–6.2, 10.1–10.2; ClassFieldTheory Layer 13;
  - at their open heads: QuasiRiemannHypothesis §§1.1, 5.3, 10.7, 11.1; ExplicitNumberFields §§0.5, 7.2; RieszSumsOverPrimesAndExceptionalZeros §2.41a.
- Automatic checks: every check passed at this head. Dependency check: `depcheck: 171 roadmaps, 1994 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: 13 `sorry` warnings and nothing else. The `#check @` signatures of all 19 declarations were compared with their README statements: no binder was lost and no difference in generality was found.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `decide`, `norm_num`, `trivial`, `exact?`): all 13 theorems survive.
- Numerics recomputed with an accelerated alternating series: `L(1, χ₋₄)` = 0.7853982, `D(1)` = 0.2456096, `D′(1)` = −0.2565834, and the `1 + γ` balance at `y = 1`.

Overlap check: read QuasiRiemannHypothesis, GeneralizedRiemannHypothesisFromWindowBounds, LFunctions, RieszSumsOverPrimesAndExceptionalZeros, ExplicitNumberFields, ZerosOfLFunctions, ExplicitZetaBounds, AnalyticNumberTheoryPartI, ClassicalArithmeticCompletion, CharacterSumsOverFiniteFields. Shared:
- `ZeroFreeRightOf` and its first properties: owner QuasiRiemannHypothesis §1.1, cited.
- The Riemann-hypothesis predicates: variants of ZerosOfLFunctions Layer 9, AnalyticNumberTheoryPartI §§1.6 and 2.42, ClassicalArithmeticCompletion §5.0 and ExplicitNumberFields §0.5, each cited with a bridge.
- `NeZero χ.conductor`: owner CharacterSumsOverFiniteFields §7.1, cited.
- Riesz sums and remainders, the Euler–Kronecker constant, three circles, Selberg's formula and `PrimitiveDirichletCharacter`: owner this roadmap. Its consumers in the family re-declare these locally under their own namespaces; no two `Suggested.lean` files share a fully qualified name.

Source independence: 0 passages compared, with 0 sources (no legal copy of Titchmarsh–Heath-Brown, Davenport, Iwaniec–Kowalski, Ingham or Littlewood 1928). The largest share is Titchmarsh–Heath-Brown, 4 of 9 locators, all at chapter level. Contents were not compared, as no table of contents was read. The layers are numbered by the roadmap itself, and their order follows the dependency lines: 3.2a and 8.4b feed 9.7–9.8, and 10.3 and 11.1 feed 8.4a and 9.6.

Research link: 9.7–9.9 are the classical consequences of the Riemann hypothesis: Littlewood 1928 for `L(1, χ)`; Selberg's formula and the `log ζ` and `S(T)` bounds of Titchmarsh Chapter XIV; von Koch. 9.2–9.6 with 8.4a are the interface through which GeneralizedRiemannHypothesisFromWindowBounds states its windowed-Landau route. This rests on the README's References and Downstream consumers.

## Not verifiable

- Titchmarsh–Heath-Brown, *The Theory of the Riemann Zeta-Function*, Chapter XIV: the sources service found no legal copy (retried this round).
- Littlewood 1928, *Proc. London Math. Soc.*: the DOI resolves only to the publisher's page, which refused access; the service found no open copy.
- Davenport, *Multiplicative Number Theory*, §§18 and 20: settled as uncertified (paywalled) and cited by its locator.
- Iwaniec–Kowalski, *Analytic Number Theory*, Chapter 5, and Ingham, *The Distribution of Prime Numbers*, Chapter IV: publisher copies only; no open copy is known.
- The sample targets 3.2a, 8.4a, 8.8, 8.8a, 9.2–9.5, 10.2, 10.3 and 11.1 carry no source locator. They were checked by computation, against the pinned libraries and against the supplier roadmaps only.
- I did not open the announcement on which the family index relies.

Automatic checks set aside as false positives: the citation resolver listed three Lean names as found nowhere (the Dirichlet predicate, the conductor instance and the remainder bound), but all three are declared in this roadmap's own `Suggested.lean`. Re-running the automatic checks by hand also flagged the three family-index files as changes outside the folder, which belong to this pull request, and reported the roadmap as missing from the merge order, which is not a defect before the intake places it.

## Source issues

- none

## For the human reviewers

- Scope: the family index carried here (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, lines 9–17) follows an announced formal proof of the Riemann hypothesis for Dirichlet L-functions (Alpöge, 20 November 2026). README lines 1509–1511 say a sibling "proves it". No refereed source exists; I did not open the announcement.
- Scope: 9.9 (README lines 1161–1164) draws unconditional bounds such as `ψ(x) − x = O(x^{11/12} log² x)` from QuasiRiemannHypothesis §10.7. That roadmap's own overview says its half-plane rests on the unrefereed preprint `openai2026quasiRH`.
- Not tested: Titchmarsh–Heath-Brown, the source with the largest share of locators (4 of 9), has no legal copy. Wording and arrangement were not compared against it or against the other four sources.
