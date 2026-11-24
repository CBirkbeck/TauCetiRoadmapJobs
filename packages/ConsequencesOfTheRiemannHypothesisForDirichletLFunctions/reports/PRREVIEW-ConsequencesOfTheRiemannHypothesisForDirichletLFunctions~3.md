# Review of ConsequencesOfTheRiemannHypothesisForDirichletLFunctions (pull request #3027 at 477bb48)

**Verdict:** needs changes

**Summary.** The mathematics holds up. Every sampled discharge matches the conditional theorem it cites, and the computed values I recomputed are right: the Checks, the nine central values, the prime-gap record (by a sieve) and the Johnston initial ranges. One finding blocks: `Suggested.lean` leaves out headline consequences that can be stated at the pins (Lindelöf's bound, Littlewood's bounds and class-number bound, von Koch's bound for `π(x) − Li x`, the least quadratic nonresidue), and its docstring says the remaining targets cannot be stated. There are four small corrections and one format note. The human reviewers have three facts to weigh, on scope, licence and one source that could not be read.

## R01 (P2) — `Suggested.lean` omits headline consequences that can be stated at the pins, and its docstring says they cannot be

The file is the roadmap's acceptance test. Its docstring (lines 38–39) says: "The other targets of Layers 0 to 4 are statements of other roadmaps in the predicates and records that those roadmaps define; they are stated when those definitions are in the library." For several headline targets this is false. They need no other roadmap's predicate and no record, only Mathlib and Tau Ceti carriers:

- Lindelöf's bound and Littlewood's bounds for `L(1, χ)` (1.1(ii), lines 532–538);
- von Koch's `π(x) − Li x = O(√x log x)` (2.1, line 785);
- the least quadratic nonresidue `≪ (log p)²` (3.4, lines 1499–1501);
- Littlewood's class-number bound `h(D) ≥ c √|D|/log log |D|` (4.1, lines 1561–1563).

The supplier RiemannHypothesisStatementsAndConsequences already states the conditional forms of 1.1(ii) and 2.1 against these pins in its `Suggested.lean`:

- `log_norm_riemannZeta_le_of_riemannHypothesis`;
- `LFunction_one_bounds_of_generalizedRiemannHypothesis`;
- `primeCounting_sub_logIntegral_isBigO_of_riemannHypothesis`;
- `primePsi_primeCount_of_zeroFreeRightOf`.

This roadmap's forms are those statements with the hypothesis removed. These targets are headlines on the same footing as 3.1, which the file does state. The following statements elaborate at the pins with `sorry` as the only warning and no new definition.

```lean
theorem norm_riemannZeta_le_rpow : ∀ ε > 0, ∃ C : ℝ, ∀ s : ℂ, 1 / 2 ≤ s.re → 2 ≤ |s.im| →
    ‖riemannZeta s‖ ≤ C * |s.im| ^ ε := by sorry
theorem LFunction_one_bounds : ∃ C : ℝ, ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q),
    3 ≤ q → χ.IsPrimitive → (C * Real.log (Real.log q))⁻¹ ≤ ‖χ.LFunction 1‖ ∧
      ‖χ.LFunction 1‖ ≤ C * Real.log (Real.log q) := by sorry
theorem primeCounting_sub_logIntegral_isBigO :
    (fun x : ℝ ↦ (Nat.primeCounting ⌊x⌋₊ : ℝ) - TauCeti.Real.logIntegral x) =O[Filter.atTop]
      fun x ↦ √x * Real.log x := by sorry
theorem exists_not_isSquare_le_log_sq : ∃ C : ℝ, ∀ p : ℕ, p.Prime → p ≠ 2 →
    ∃ n : ℕ, 0 < n ∧ (n : ℝ) ≤ C * Real.log p ^ 2 ∧ ¬ IsSquare (n : ZMod p) := by sorry
theorem classNumber_ge_mul_sqrt_div_log_log : ∃ c > 0, ∀ (K : Type) [Field K] [NumberField K],
    Module.finrank ℚ K = 2 → NumberField.IsTotallyComplex K → 4 < |NumberField.discr K| →
    c * √(|NumberField.discr K| : ℝ) / Real.log (Real.log |NumberField.discr K|) ≤
      NumberField.classNumber K := by sorry
```

The third needs `import TauCeti.Analysis.SpecialFunctions.LogIntegral`. The smallest repair is to state these, with the names in the README items. If the author does not count some of them as headline theorems, the docstring sentence should be corrected to say which targets can be stated but are not, and why.

## C01 — The tabulated rows of 3.2 follow from their own hypothesis by modus ponens

*RamareRumelyRows* (lines 1375–1383) is the implication "`GRH*(k, H)` for every `H` ⇒ the row's bound". The main theorems give its premise through 0.6, as the route says (lines 1414–1415). So "Given *RamareRumelyRows*, every row holds" asks an implementer for nothing. The rows are taken as a record, which is a sound choice, since the general shape cannot give them (the Check at `q = 8`: `0.11219` against `0.00070275`). I would say so directly: 3.2 carries the rows as the record *RamareRumelyRows* and 0.6 discharges its premise. As written, the item reads like a derived target.

## C02 — Three Origin labels say "published" for results their suppliers mark as this roadmap's own formulation or as preprints

The Summary says each Origin label "names the published source of the conditional theorem". Three labels do not:

- 0.5 (lines 385–389) calls RiemannHypothesisStatementsAndConsequences §9.6 published. That section's own label is "this roadmap's own formulation".
- 2.3 (lines 840–843) covers the general theorem of ExplicitPrimeCounting §2.6. Its source is Chirre–Helfgott 2025, marked *(preprint)* there.
- 2.4 (lines 903–908) names Fiori–Jaskari, also marked *(preprint)* in ExplicitPrimeCounting §3.6.

Each label could say "adapted" or "preprint" for these parts.

## C03 — The scope section both owns and disowns the six numerical records

"Not owned here" (lines 1892–1900) lists "every numerical record". "Owned here" (lines 1846–1857) lists six records stated in this roadmap: *JohnstonInitialRanges*, *SmallQuadraticCentralValues* (itself a central-value nonvanishing record), *ZetaZeroReciprocalLowRange*, *RamareSaouterGapRange*, *SchoenfeldMertensSmallRange* and *RamareRumelyRows*. "Every numerical record other than those stated above, none of which is proved here" would remove the contradiction.

## C04 — The Summary gives the direction of supply backwards

Lines 43–46 say the roadmap "feeds" AnalyticNumberTheoryPartI, ExplicitZetaBounds and ExplicitPrimeCounting. Those roadmaps are this roadmap's suppliers: it discharges their conditional theorems, and none of them cites it. Wording such as "takes its conditional theorems from AnalyticNumberTheoryPartI, … and states them unconditionally" would match the plan.

## N01 — The derivation of Johnston–Yang's two-sided bound from the three reciprocal-zero records sits in the Conventions

That derivation (lines 166–188) is a result this roadmap owns. It has no section number and no `*Needs:*` line, so it cannot be tracked like the other targets. A numbered item in Layer 0 would fix this.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 0.1 (ZerosOfLFunctions §9.1) | `N = 1`; `χ₋₄`; Lean type | §9.1 (iii)⇒(i) at head; poles of `completedRiemannZeta` have order −1; `Λ(0, χ₋₄) = 1/2 ≠ 0` | holds |
| 0.2 (AnalyticNumberTheoryPartI §2.42) | `K = ℚ`, `ℚ(i)` | §2.42 abelian equivalence present; `ζ_{ℚ(i)} = ζ·L(χ₋₄)`; junk continuation `0` would give order `⊤`, so not vacuous | holds |
| 0.3 (QuasiRiemannHypothesis §§5.4, 5.4a) | `K = L = ℚ`; `ℚ(i) ⊂ ℚ(ζ₁₂)` | 5.4a(a),(b) at head; `(·/3)∘N` is the quadratic character of `𝔽₉ˣ`, conductor `(3)`; Milne Ex. 3.2, Prop. 3.3, p. 157 confirmed | holds |
| 0.4 (QuasiRiemannHypothesis §5.4) | `K = ℚ`, `X(K) = {1}` | factors `1 − χψ(p)p^{−s}` nonzero on `Re s > 0`; product over `X(K)` of Dirichlet L-functions | holds |
| 0.6 (ExplicitZetaBounds §§0.2, 0.4; ExplicitPrimeCounting §1.2) | `q = 6`, `q = 8` | §0.2 laws `(∀H) RH(H) ⇔ RH`, `(∀H) GRH(q,H) ⇔ DirichletGRH`; `GRH*(6,H)` = `GRH(3,H) ∧ RH(H)` | holds |
| 0.7 | `q = 3`, `q > 10⁶` | `1 − 1/(5 log 3) = 0.8180`; Hoffstein (LZZ26 lines 369–371) `1.507/11.657 = 0.12928 > 1/8` | holds |
| 0.8 (AnalyticNumberTheoryPartI §0.16; ErdosProgressionPowers §0.9) | four characters mod 8 | zero clause is `0 < Re s < 1`, `|Im s| ≤ 10000`; strip form of §5.3 covers every height | holds |
| 1.2 (RiemannHypothesisStatementsAndConsequences §9.8) | `σ₀ = 1/2` | (i) `T ≥ 16` off ordinates; (ii) `𝔮 ≥ 16`, `L(1/2 + it) ≠ 0` | matches |
| 1.4 Checks | `R = 0.7`, `t₀ = −20`; `C₂` | `0.7 log 20 = 2.097`; boundary `0.4606`; `e^{2/0.7} = 17.41`; `C₂ = 6.686` at `σ = 0.9`, `0` at `1.2768`, `−12.83` at `2` | holds |
| 1.6 / Conventions | 8th ordinate; `T = 4πe` | `0.296694 − 0.295657 = 0.001037`; `0.221532 ≤ 0.228129`; lower error `−0.1753 ≥ −0.1754` | holds |
| 2.1 (RiemannHypothesisStatementsAndConsequences §9.9) | `σ = 1/2` | (i)–(iii) give `√x log² x`, `√x log x`; Frobenius case via §8.8 independence | matches |
| 2.3 (ExplicitPrimeCounting §§2.3, 2.6) | `x = 3`; initial ranges | `|ψ(3) − 3| = 1.2082 < 2.0905`; sup ratios ψ, θ 0.58; π, π* 0.611 (at `3⁻`) | holds |
| 2.4 thresholds | `23⁻`, `149⁻`, `10¹⁹` | `3.7343 > 3.7016`; `22.3564 > 22.3395`; crossings `35.072`, `359.29`; quotients `22 293`, `1.92·10⁶`, `97.6` | holds |
| 2.5 | `L = 3914` | `li 2 − P₄(2) = −369.9942`; `120(1 + 768/3914) = 143.55 < 1426` | holds |
| 2.6 (ExplicitPrimeCounting §4.7) | hypothesis list | identical list; LN23 Cor. 1.3 thresholds `43.1`, `24.4` (lines 82–88) | matches |
| 2.9 (ExplicitPrimeCounting §§7.1–7.3, 7.5) | rows; gap record | KL `2.72682·10⁻⁸ < 2.77140·10⁻⁸` (KL14 line 690); CHL `0.73684`; sieve: 226 229 823 primes, max gap 354 | holds |
| 3.2 (ExplicitPrimeCounting §§6.1, 6.3, 6.6) | `q = 8`, `q = 2, 3` | `q|γ|/C ≥ 9.947 > e^{2/R} = 1.230`; `ε(X) = 0.11219` vs `0.00070275`; `0.8504`, `0.85996 > 1/2` | holds |
| 3.3 (ExplicitPrimeCounting §6.5) | all `q ≤ 1000` | least prime ≤ `0.0533` × cyclotomic bound (`q = 2`), ≤ `0.6504 (φ log q)²` (`q = 4`); disc inequality holds, equality `q = 2, 6` | holds |
| 4.2 (ExplicitNumberFields §0.5) | nine fields | `L(1/2)` lower bounds `0.4565 … 0.4221` recomputed; `(π/6)√13 = 1.888 < 2`; `2/√15 = 0.5164 < π/6` | holds |
| 4.4 (ClassicalArithmeticCompletion §5.16a) | (i), (ii) | `x ≥ 100`, `T ≥ 100` under DedekindERH ∧ RH; GM17 Thm 1.1 same right side, `x ≥ 1` (4.7) | matches |
| 4.6 | `13.5, 17, 19, 23` | `0.125980 < 0.127871` … `0.094672 < 0.111227`; `24.4⁻`: `0.076002` | holds |
| Lean 0.1 / 0.2 / 0.3 / 3.1 | `#check @`, one-tactic probe | types match the README; `(1 : PrimitiveRayClassCharacter K).character` trivial at `Modulus.one`; `q = 1` gives `ψ(x)`; `simp_all` fails | no padding |
| R01 | five probes | Lindelöf, Littlewood, von Koch, least nonresidue, class number elaborate at pins; `sorry` only warning | finding |
| C01 | premise of *RamareRumelyRows* | `GRH*(k, H)` for every `H` is 0.6; conclusion follows by modus ponens | correction |

- Sample: all 15 seeded targets were checked against the cited sections at the head (or on main where the pull request does not change the supplier). None is flagged unverified.
- Source locators checked against the text: 12, in LZZ26 (Thm 1.1, Cor. 1.3, Hoffstein quote), KL14 (Thm 1.1, Table 2), GM17 (Thm 1.1, Cor. 1.2), LN23 (Thms 1.1–1.2, Cor. 1.3) and Milne CFT v4.03 (Ex. 3.2, Prop. 3.3, p. 157).
- Library declarations opened at the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`): `heckeLFunctionC` (`LFunctions/Hecke/Basic.lean:74`), `meromorphicContinuation` (`Analysis/Meromorphic/Continuation.lean:72`), the `One` instance and `of_induced` of `PrimitiveRayClassCharacter` (`Hecke/Primitive.lean:175`, `:169`), `classNumber_eq_LFunction_one_of_discr_ne` (`NumberField/Quadratic/DedekindZeta.lean:288`), `Modulus.eq_one_of_dvd_one` (`RayClass/Modulus.lean:281`), `RayClassGroup.hom_ext` (`RayClass/Integral.lean:244`), `logIntegral` (`Analysis/SpecialFunctions/LogIntegral.lean:141`); 40 cited names checked by `#check`, all present except `dedekindZetaC`, a target of LFunctions §3.5.
- Cross-roadmap citations resolved: 69 sections and layers, at the head for the suppliers this pull request changes (GeneralizedRiemannHypothesisFromWindowBounds, RiemannHypothesisStatementsAndConsequences, ZerosOfLFunctions, AnalyticNumberTheoryPartI, QuasiRiemannHypothesis, ExplicitNumberFields) and on main for the rest (ExplicitZetaBounds, ExplicitPrimeCounting, ClassicalArithmeticCompletion, ExplicitMultiplicativeFunctions, WeilPositivityAndLiCriterion, ErdosProgressionPowers, SieveMethodsAndPrimePatterns, LFunctions Layers 3–5, 8).
- Dependency check: `depcheck: 132 roadmaps, 1474 edges, 0 problem(s)`. No UPWARD or CYCLE line.
- Elaboration: `lake env lean` of `Suggested.lean` gives four `sorry` warnings and nothing else. `#check @` on all four declarations shows no section binder lost. The worker's automatic checks all passed.
- Ownership: the six records and the unconditional forms appear only here at the head. On main they were in GeneralizedRiemannHypothesisFromWindowBounds, and no README on main or at the head cites the moved sections. The four Lean statements are unchanged from main except for their docstrings.

Overlap check: read GeneralizedRiemannHypothesisFromWindowBounds, ExplicitPrimeCounting, ExplicitZetaBounds, ExplicitNumberFields, ZerosOfLFunctions, AnalyticNumberTheoryPartI, ErdosProgressionPowers and LiCoefficientsArithmeticFormula. Shared objects and their owners:
- the conditional theorems: owned by the roadmaps named in each heading and cited here, not restated as owned;
- the main theorems: GeneralizedRiemannHypothesisFromWindowBounds;
- `weilForm`: WeilPositivityAndLiCriterion; LiCoefficientsArithmeticFormula states only Yoshida's local positivity;
- the unconditional forms and the six records: this roadmap.

Source independence: 7 passages compared with 5 sources (LZZ26, LN23, KL14, GM17, Milne CFT); no wording is shared beyond forced formulas and numbers. The largest share of locators is Schoenfeld 1976, with 4 of 43 reference locators. Its text could not be read. The layers (hypotheses, zeros, prime counts, progressions, number fields) follow the subjects of the cited conditional theorems, not a source's contents.

Research link: The targets are the unconditional forms of published GRH-conditional theorems: von Koch, Littlewood (1928), Schoenfeld (1976), Bach–Sorenson (1996), Lamzouri–Li–Soundararajan (2015), Lee–Nosal (2026) and Grenié–Molteni (2019). GRH itself is supplied by GeneralizedRiemannHypothesisFromWindowBounds §§5.1–5.3. This line rests on the README and on LZZ26, LN23, KL14 and GM17.

## Not verifiable

- Davenport (2000), chapters 9 and 12: a paywalled book, not fetched; the locator matches ZerosOfLFunctions §9.1.
- Heilbronn (1967), Cassels–Fröhlich chapter VIII: paywalled.
- Schoenfeld (1976): the sources service does not classify the AMS host; not read.
- Hoffstein (1980/81), Lemma 1: checked only as quoted in LZZ26 lines 369–371.
- *ZetaZeroReciprocalLowRange* at all 74 ordinates in `(4πe, 200]`: no zero table available. I checked `T = 4πe` and the 8th ordinate only.
- `m₇ = 0.0171594248`: it depends on the value recorded in `ZetaZeroReciprocalSum`, which I did not have.

## Source issues

- **Misprint** in milne-cft-2020 at Example 3.2, printed p. 157: the source says the Artin symbol of `p` is `[p]` for `p` not dividing `n`, written `(p, L/K)`; it should be `p` not dividing `m`, and `(p, L/ℚ)`, since the example is over `ℚ`; affects nothing.

## For the human reviewers

- Scope: every target rests on GeneralizedRiemannHypothesisFromWindowBounds §§5.1–5.3. Their source is a formal Lean proof announced on 20 November 2026 (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, lines 13–24), not a refereed publication. The conditional theorems discharged here are published.
- Licence: the family index says that formal proof "was published without a license" (same file, lines 20–22). This roadmap cites it only through GeneralizedRiemannHypothesisFromWindowBounds.
- Not tested: Schoenfeld 1976, the source with the largest share of reference locators, could not be read through the sources service. Wording and arrangement were not checked against it.
