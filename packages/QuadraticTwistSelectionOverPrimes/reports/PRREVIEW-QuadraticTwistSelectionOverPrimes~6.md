# Review of QuadraticTwistSelectionOverPrimes (pull request #2878 at 8e342bd)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/QuadraticTwistSelectionOverPrimes/`
**Verdict:** accepted

**Summary.** Accepted: no false or unsupported mathematical statement was found. The general statements of 2.7a–2.7d, the deductions of the forms with box width `1/400` from them, the instance of 2.7d (ii′), every Check and the five Lean headlines were recomputed and agree with the supplier sections they cite. There are three small corrections (two on how results are attributed, one on the description) and one format note, none blocking. What the formal proof itself contains could not be read, so every sentence of the form "[FormalProof] proves …" is unverified and is left to the human reviewers, with the scope and licence of that source.

## C01 — The general statements are said to be proved "from the published theorems" their routes cite, but two of the cited inputs are a sibling roadmap's own statements

A reader takes the sentence to mean that every input of the general 2.7c and 2.7d is in the published literature. The sentence stands in the Summary (line 7: "proved from the published theorems that their routes cite") and again at lines 114, 244, 348 and 423. The route of 2.7c cites RieszSumsOverPrimesAndExceptionalZeros §1.4e and §1.4f; at the head of that roadmap §1.4e says of its (a), the general width `δ₀`, that it "is this roadmap's, by the route below", and §1.4f says "(a) is this roadmap's". Likewise §1.7b (ii), the input of 2.7a (iii), is described there as a form for one modulus that "the route below proves … directly, not from (29)" of Gallagher. Only AnalyticNumberTheoryPartI §§0.12, 0.17, 1.7 are stated with published locators.

The smallest change: write "proved by the route below from the roadmap sections it cites" in the five places, or name which inputs are published (the zero-density estimate, Page's theorem, the effective gap) and which are statements of RieszSumsOverPrimesAndExceptionalZeros.

## C02 — Three places say the formal proof proves 2.7d (ii′); 2.7d itself says it proves only one instance of it

A reader cannot tell whether `twistSelection_two_of_conductorBound_fixedWidth`, stated for arbitrary progressions and two exponents `ε₁, ε₂`, is a statement of the formal proof or wider than it. The Conventions (lines 38–39) list 2.7d (ii′) among "the forms that [FormalProof] proves"; the module docstring of `Suggested.lean` (lines 18–20) says "the two theorems with box width `1/400` are the forms that the formal proof proves", and the theorem's docstring (line 206) calls it "the form of the formal proof". But 2.7d (line 424) says "[FormalProof] proves 2.7c (a′)–(c′) and (ii′) at this instance", the Summary's (3′) says "for one pair of progressions", and the References say "2.7d (ii′) at its instance". Under the README's own convention (lines 45–47) a statement wider than the proof's "would need its own proof"; 2.7d supplies one (two applications of 2.7c (a′)–(c′)), so nothing is unsupported, only mislabelled.

The smallest change: in the Conventions and the two docstrings say that the formal proof proves (ii′) at one pair of progressions and that the stated form follows from 2.7c (a′)–(c′) by the route of 2.7d.

## C03 — The description counts three headlines and four definitions and omits two suppliers; the head has five and five

The description says "`Suggested.lean` states 3 headline theorems … and 4 definitions with real bodies (`primesInClass`, `rieszRemainder`, `SelectionHypotheses`, `TwistBounds`) … its docstring says that all three headlines are statable". At this head the file states five theorems (the three named, with `twistSelection_fixedWidth` and `twistSelection_two_of_conductorBound_fixedWidth`) and five definitions (also `FixedWidthSelectionHypotheses`), and its docstring says "All five". The description also does not say that the README now states, beside each general target, the form with box width `1/400` attributed to the formal proof (2.7a (i′), (iii′), 2.7b (ii′), (iv′), 2.7c (a′)–(c′), 2.7d (ii′)).

Its paragraph on dependencies lists AnalyticNumberTheoryPartI §§0.2, 0.11, 0.12, 0.17, 0.34, 0.34a, 1.7 only; the README's supplier contracts also take ClassicalArithmeticCompletion §§1.5–1.6, ExplicitPrimeCounting §0.3a and AnalyticNumberTheoryPartI §0.11a, and its consumers include FrobeniusRestrictedRieszSums. Text that would be right: "states 5 headline theorems (… and the forms with box width `1/400` of the last two) and 5 definitions"; add the two suppliers and the second consumer.

## N01 — The convention "A target whose status or route names [FormalProof]" (line 45) also matches the general targets, whose status lines name it to say they are not its statements

2.7a (iv) and 2.7b (iii) say "not a statement of [FormalProof]", and each general statement says "[FormalProof] proves (…′)". Read literally the convention applies to them. "A target headed *The form of the formal proof* (the primed items)" would say what is meant.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 2.7a (i) reciprocity on a class | 300 random `(m₀, a₀, n)`, `8 ∣ m₀`, primes `q < 6000`; `m₀ = 4` | `(n/q)(q/s)` constant in all 300; at `m₀ = 4`, `n = 2`: `(2/5) = −1`, `(2/17) = 1` | holds; `8 ∣ m₀` needed | none |
| 2.7a (i) Checks | `q = 11, 19`; `n = 2, 3` | `(2/11) = (2/19) = −1`; `(3/11) = 1`, `−(11/3) = 1` | agree | none |
| 2.7a (ii) | `s₁ = 1 < s₂`; prime dividing one of `s₁, s₂` | CRT unit `≡ 1 (m₀)`, nonresidue at that prime: symbols `1` and `−1` | holds | none |
| 2.7a (iii) (β), route | coset sums of `(b/s)` and `(b/s)χ₁(b)` over classes above `a₀` | `0` unless `χ₁ = (·/s)` on the class of 1, then `φ(s)`; term `Li(U^β₁)/φ(m₀)` | consistent with §1.7b (ii) | none |
| 2.7a (iii) Page step | conductors `≤ m₀Y^A` | `3c_star/log(N₁N₂) ≥ 3c_star/(2 log(m₀Y^A)) ≥ c₀/log(m₀Y^A)` for `c₀ ≤ 3c_star/2` | matches §0.17 | none |
| 2.7a (iii′) from (iii) | `log m₀ ≤ 4 log U/(log Y)²` | `C₁ log Y log m₀ ≤ log U/2` iff `log Y ≥ 8C₁`; `m₀² ≤ U^(8/(log Y)²)`, so `|P| ≥ U^(9/10)` | follows | none |
| `Li(U^β) ≤ 3U^(β−1) Li U` | `U = 10⁴, 10⁶, 10⁹`; `β = 1/2 … 1` | ratio left/right at `β = 1/2`: `0.779, 0.749, 0.712`; at `β = 1`: `0.333` | holds; limit `2/3` | none |
| 2.7a (iv), `abs_sum_jacobiSym_primes_le` | `m₀ = 8, a₀ = 3, s = 3`; `m₀ = 0` | `U = 10⁶`: `|P| = 19609 ≥ 6031.9`, sum `31`; `m₀ = 0` forces `s = 1`, excluded | consistent with §1.7b (iv) | none |
| 2.7b (i) mean-square inequality | 147 random `(m₀, P, c, κ, s*)`, `N ≤ 30` | largest left/right ratio `0.556`; `c = 1_p`: both sides `|P|` | holds; case analysis rechecked | none |
| 2.7b (ii), (ii′) | five terms; `L₁ = 400K`, `a = 1/5` | `sP(p) ≤ 3 log y`; `RR² ≪ y + y^(2a) log² y`; `η`-term `≤ y·C²L₁² log² Y/Y`; count `≤ Y^(ε/5) ≤ Y^(1/5)` | `C = C(a)`; (ii′) follows | none |
| 2.7b (iii) window lemma | one block `[Y′, 2Y′]`; bump family | block sum `≤ (2 + 2 log 2) M Y′ log 2Y′ ≤ 4M…`; Markov `16M log(2Y′) Y′^(−2τ)`; bumps need `n ≥ 2^(1+2τ)Y^(2τ)/(M log Y)` | holds; Check true | none |
| 2.7b (iv) | derivative of `min(1, v/n)` | `v·g_q(v) = S_Z(v; q, κ·1_(v,∞))`, so `Σ|g_q|² ≤ C log v/v · |P|` | hypotheses of (iii) met | none |
| Identity for `G_χ` in 2.7c | `0 < x ≤ Z` | `−S_Z − xT_Z = Σ_{n≤x}Λχ(x/n − 1) + x L′/L(1)` term by term | equal | none |
| 2.7c, `twistSelection` | `δ₀ → 1/12`; `R = 0`; `m₀` odd; `τ = 1/10` | `(3/2)(8 + 2ε′)δ₀ < 1` iff `δ₀ < 1/(12 + 3ε′)`; `lcm(m₀, 8)`: at most 4 classes; room `0.002` at `b = 0.299` | holds; Lean order `C₂(ε)` outside, `C₁, Y₀` before `ε` | none |
| 2.7c (a′)–(c′), `twistSelection_fixedWidth` | `δ₀ = 1/400`, `a = b = 1/5`, `ε = 1/2`; `U < 0` | `(2.5)(400) = 1000`; `(3/2)Y^(1/20)(log Y)² ≤ Y^(1/5)`; `200ε₀ log Y`, `200/52 = 3.85 < 4`; `1 ≤ F ≤ √U` forces `U ≥ 1` | follows from the general statement | none |
| Primitive `χ` in the Lean statements | `χ` primitive agreeing with `ξ(n)(n/q)` off `N_i q` | `q > √U ≥ F ≥ N_i`, `q` odd; product primitive of level `N_i q`; agreement forces `M = N_i q` | determined, exists | none |
| 2.7d (ii), two-step theorems | second step with `2R` characters | conductors `≤ N₀q ≤ F₂(q)`; heights `F₁U₁`, `F₂(q)U₂`; `k ∈ {0,1}` gives `(0,1), (1,1)` | matches README | none |
| 2.7d (ii′) instance | `ε₂ = 6ε/5`, `z = Y^(ε/5)` | `Y^(ε₂/6) = z`; `K²z ≤ Y^(6ε/25)` iff `K² ≤ Y^(ε/25)`; `log m₂ ≤ log 16 + 2.386z ≤ 4z` for `z ≥ 1.72`; `6ε/5 < 1/4` | hypotheses hold | C02 (attribution only) |
| 2.7d example (`b = 1/5`, `a = 1/4`) | `z ≥ 8C₁`, `log Y ≥ 8C₁` | `C₁(4z + log Y) ≤ z log Y`; `2z ≤ z(log Y)²/2`; count `≤ z ≤ Y^(1/10)` | holds | none |
| Remarks on §0.28, §5.29 | `D = s*`; moduli `q ∈ P` | `(q/s) = (s*/q)`; square-pair diagonal `≪ y log y`, factor `U^(1+ε)` against `|P|` | as stated | none |
| C01 inputs | RieszSums §1.4e, §1.4f, §1.7b (ii) at its head | each says the general form is "this roadmap's" | not published theorems | reword |
| C03 counts | `Suggested.lean` at the head | 5 theorems, 5 definitions; description says 3 and 4 | description stale | reword |

- Source locators checked against a text: 1 (the announcement, read in full, 4 pages; its footnote 1 is the archive the References name, and it states no target). Gallagher 1970 and the formal proof were not readable.
- Cross-roadmap citations resolved at main or at the open head: 22 (AnalyticNumberTheoryPartI §§0.2, 0.11, 0.11a, 0.12, 0.17, 0.28, 0.32, 0.34, 0.34a, 1.7; AnalyticNumberTheoryPartII §5.29; ClassicalArithmeticCompletion §§1.5, 1.6, 1.70; ExplicitPrimeCounting §0.3a; SieveMethodsAndPrimePatterns §2.7 and Layer 3; QuasiRiemannHypothesis §10.7; RiemannHypothesisStatementsAndConsequences §8.4a (b); RieszSumsOverPrimesAndExceptionalZeros §§1.4e, 1.4f, 1.7b).
- Library declarations opened at the pins: 10 (`jacobiSym.quadratic_reciprocity` JacobiSymbol.lean:423, `jacobiSym.at_two` :321, `ZMod.χ₈` ZModChar.lean:118, `ZMod.chineseRemainder` ZMod/Basic.lean:889, `legendreSym.eq_neg_one_iff` LegendreSymbol/Basic.lean:190, `Chebyshev.psi_le_const_mul_self` Chebyshev.lean:485, `MeasureTheory.integral_mul_le_Lp_mul_Lq_of_nonneg` Bochner/Basic.lean:1232, `DirichletCharacter.LFunction_apply_one_ne_zero` LSeries/Nonvanishing.lean:412, `DirichletCharacter.IsPrimitive` DirichletCharacter/Basic.lean:291, `TauCeti.Real.logIntegral` LogIntegral.lean:141).
- Elaboration: `Suggested.lean` elaborates with five `sorry` warnings and nothing else; single `import Mathlib`, no `set_option`. `#check @name` on all 10 declarations: every type matches its README statement, no binder lost, nothing changed.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `decide`) on a copy: none of the five theorems closes. No padding found; the five definitions have real bodies and each is used by a headline.
- Automatic checks: all passed. Dependency check output: `depcheck: 171 roadmaps, 1990 edges, 0 problem(s)`. Changes outside the folder: the three files of the family index only.
- Duplication: no declaration of the pinned Mathlib or Tau Ceti states any of the ten; `rieszRemainder` restates RiemannHypothesisStatementsAndConsequences §8.4a (b) on Mathlib's carriers and the README cites that owner. "Twist selection" in SelmerLengthBoundsAndLocalLifting §3.26 is a different object (Selmer groups over a CM field).
- Overlap check: read RieszSumsOverPrimesAndExceptionalZeros, FrobeniusRestrictedRieszSums, ThetaChainsAndFrobeniusPrimeSums, QuasiRiemannHypothesis, SieveMethodsAndPrimePatterns, AnalyticNumberTheoryPartI, QuadraticCharactersAndReduction; the Riesz remainder is shared and owned by RiemannHypothesisStatementsAndConsequences §8.4a (b), cited here; nothing else shared.

Source independence: 9 passages compared with 1 source (the announcement), none shared; no source holds a share of the locators (Gallagher1970 one page range, Announcement one footnote, FormalProof none); contents compared with no source: the formal proof and Gallagher 1970 could not be read, so wording and arrangement were not tested against them.

Research link: 2.7a rests on Gallagher's 1970 prime number theorem in Linnik's range and on the log-free zero density of Jutila (1977) and Montgomery (1969); 2.7c–2.7d select the auxiliary primes used in the family that follows Alpöge's formal proof (announced 2026). README overview and References, and the supplier sections read.

## Not verifiable

- Every attribution to [FormalProof]: that it proves 2.7a (i′), (iii′), 2.7b (ii′), (iv′), 2.7c (a′)–(c′) and the instance of 2.7d (ii′), with the constants `1/400`, `Y^(400K)`, `ε/5`, `ε/6`, `U^(9/10)`, `1000`, `ε < 1/52`. The archive parts are not documents and the repository's host is in no licence class of the sources service; neither was read.
- Gallagher 1970, pp. 329–339: paywalled, cited by its locator without the text.

## Source issues

- none

## For the human reviewers

- **Scope.** The roadmap's main source is [FormalProof], a Lean archive announced on 20 November 2026 and not refereed; the announcement (Announcement lines 5–53) states none of the targets. The general statements are the roadmap's own, with routes through roadmap sections.
- **Scope.** 2.7a (iv), stated as `abs_sum_jacobiSym_primes_le`, rests on AnalyticNumberTheoryPartI §0.34 (uniform exclusion of Landau–Siegel zeros); 2.7b–2.7d do not use it. QuasiRiemannHypothesis §10.7 is cited in remarks only.
- **Licence.** The formal proof's repository and archive carry no licence class in the sources service; whether `Suggested.lean` resembles declarations of that formalisation could not be compared.
- **Not tested.** Wording and arrangement were not compared with [FormalProof] or with Gallagher 1970, neither being readable; no other source carries a locator.
