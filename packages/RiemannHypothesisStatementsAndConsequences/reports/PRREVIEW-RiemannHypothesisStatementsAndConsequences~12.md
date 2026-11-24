# Review of RiemannHypothesisStatementsAndConsequences (pull request #3027 at 3bddf73)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/RiemannHypothesisStatementsAndConsequences/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 439 changed lines since `b8f3652`. I checked every added `*Origin:*`, `*Method of the formal proof:*` and `*Corollary of:*` line. I also checked the passages of 3.2a, 8.4a (b), 8.4b, 8.8, 9.5 and 9.9 that now point to other roadmaps against the sections they cite (AnalyticNumberTheoryPartIII §8.2a; ZerosOfLFunctions §§8.4a–8.7a and 9.1; AnalyticNumberTheoryPartI §§1.6a and 2.42a), and the downstream bullets against the consumer roadmaps at this head. Beyond that I read the open sources of the sample, ran the dependency check and elaborated `Suggested.lean`. There is no finding, so the folder is accepted. Two small corrections remain: the description does not state this roadmap's new supplier or the ownership it hands over, and 9.2 is labelled as definitions although it states four theorems. There is also one format note. The human reviewers' decision on sections handed to general roadmaps was applied to the route, Checks and definition that moved.

## C01 — The description does not say that this roadmap gains a supplier and hands three of its items to general roadmaps

The description names this roadmap only once: ZerosOfLFunctions gains §§8.4a–8.7a and 9.1, "which RiemannHypothesisStatementsAndConsequences cites". So a reader of this folder's change is not told several things:

- It gains AnalyticNumberTheoryPartIII as a supplier: there is a new `### From TauCetiRoadmap.AnalyticNumberTheoryPartIII` contract (README line 1815), and the description mentions §8.2a only as a docstring change.
- 9.4 and 9.5 now cite the new AnalyticNumberTheoryPartI §§1.6a and 2.42a.
- 3.2a, 8.4a (b) and 8.8 keep their statements. Their route and Checks, the Euler–Kronecker constant and the dictionary theorem are now owned by AnalyticNumberTheoryPartIII §8.2a and ZerosOfLFunctions §§8.6a and 8.7a (Scope and ownership, lines 1688–1695).

Text that would be right, added to part 1: "RiemannHypothesisStatementsAndConsequences gains AnalyticNumberTheoryPartIII (§8.2a) as a supplier and cites the new AnalyticNumberTheoryPartI §§1.6a and 2.42a. Its 3.2a, 8.4a (b) and 8.8 keep their statements; the proof and Checks of the three-circles theorem, the Euler–Kronecker constant and the independence of the dictionary are now AnalyticNumberTheoryPartIII §8.2a and ZerosOfLFunctions §§8.6a and 8.7a. No section of it is removed or renumbered."

## C02 — 9.2 is labelled "definitions and conventions", but it defines nothing and states four theorems

The `*Origin:*` of 9.2 (line 581) reads "definitions and conventions", and the Labels paragraph (line 107) groups 9.2 with 10.3 as definitions that carry the first label only. But 9.2 takes its predicate from QuasiRiemannHypothesis §1.1, and the section says it "adds four clauses" (lines 599–615): the limit form of monotonicity, the converse product rule, the two symmetries and the change of level. Each comes with a proof and Checks, and the Scope section (line 1673) lists them as this roadmap's own. A reader of the labels therefore takes four theorems for conventions, with no origin given and no statement about the formal proof.

A smaller repair would be an `*Origin:*` such as "this roadmap's own formulation: four elementary properties of meromorphic orders (`meromorphicOrderAt_mul`, `TauCeti.meromorphicOrderAt_conj_conj`, `DirichletCharacter.LFunction_changeLevel`)". It needs a `*Method of the formal proof:*` line as well: "none", or the form the proof has. Line 107 would then read "The definitions of 10.3 carry the first label only."

## N01 — `Deduction.ch_balance` is cited without its file

In the method line of 8.8a (line 450), `Deduction.ch_balance` is the only [FormalProof] citation without a file path. It is in `Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChBalance.lean`.

## Questions for the author

- 9.5's origin and the reference to Belabas, Diaz y Diaz and Friedman (2008), §2, pp. 1187–1188, say the hypotheses are "read as the absence of zeros right of `1/2`". On those pages that paper assumes the Riemann hypothesis for the L-functions of nontrivial class-group characters and speaks of zeros in the critical strip; it does not use that reading. Is the reading Bach's (1990, §3, p. 360)? I could not read Bach's paper from a legal source.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| 3.2a three circles (route now AnalyticNumberTheoryPartIII §8.2a) | `z − z₀`, `(z − z₀)⁻¹`, radii 1, 2, 4 | θ = 1/2; `M(2) = 2 = 1^{1/2}·4^{1/2}`; for the inverse `(1/4)^{1/2} = 1/2 = M(2)`; §8.2a has the same `DiffContOnCl` hypotheses and all four Checks | holds |
| 3.2a disc clause | `z − z₀` on `closedBall z₀ 2`; `(z − z₀)⁻¹` | `‖f‖ ≤ 2 = M(2)`; the inverse fails holomorphy at `z₀`, so the hypothesis excludes it; Mathlib AbsMax.lean:404 | holds |
| 8.4a method kernel | `n = 1`, `s = 2` | `∫_1^∞ (y − 1) y^{−3} dy = 1 − 1/2 = 1/2 = 1/(s(s − 1))` | holds |
| 8.4a corollary of ZerosOfLFunctions §8.6a | §8.6a times `(y − 1)`, at `y = 1` and as `y → ∞` | Remainder is `Σ m_ρ y^ρ/(ρ(1−ρ)) + L′/L(1) − Σ m_ρ/(ρ(1−ρ)) + O(log y)`; both sides equal `L′/L(1, ψ)` at `y = 1`; bound `C_ψ y` | holds |
| 8.4a (b): `EK` now from §8.6a | `K = ℚ` | `EK(ℚ) = γ`; `Φ₁(1) = 1 + 0.57722 + 0.33318 − 0.14563 = 1.76476`, matching the Check | holds |
| 8.4b equals ZerosOfLFunctions §8.4a at `ℚ` | weight at `x = 2`, `m = 3`; trivial zeros at `s = 2` | `log(4/3)/log 2 = 0.4150` in both definitions; `q = 1, 2` give `−0.00528 − 0.00062 ≈ −0.0059`, matching the Check (≈ −0.0060) | holds |
| 8.8 equals ZerosOfLFunctions §8.7a | `ℚ(i)/ℚ` at `(4)∞` and `(8)∞` | Values `1, −1, 1, −1` at `1, 3, 5, 7` reduce to `χ₋₄`; the non-dictionary kernel `{1, 3}` gives `χ₋₈`; same name in §8.7a | holds |
| 8.8 origin (Milne) | Milne v4.03, Ch. V §3, before Thm 3.27 | Characters agreeing off a larger set are equivalent and each class has a unique primitive member (milne2020cft lines 7417–7421) | supported |
| 8.8a method (`Deduction.ch_balance`) | ChBalance.lean at commit 40e56ba | Identity `ASK − MAIN = De`, with a free function `ell` on characters and the sum outside the CM type (`askExp`) | consistent |
| 9.2 origin label | the four clauses | Limit monotonicity, converse product, symmetries and change of level are theorems with proofs, not definitions | C02 |
| 9.3 method (functional equation) | zeros of `cos(π(1−s)/2)`, `Re s < 1/2` | Zeros are `s ∈ 2ℤ`: `s = 0` (`ζ(0) = −1/2`) or trivial `−2k`; poles of `Γ(1−s)` at `s = 1, 2, …` lie outside the range | holds |
| 9.3 corollary of ZerosOfLFunctions §9.1 | `q = 1` | (iii) is `ZeroFreeRightOf (1/2) riemannZeta` (`LFunction_modOne_eq`); (i) is `RiemannHypothesis` by the `ζ` bridge | holds |
| 9.4 method (Euler factors, reflection) | principal character mod 2; `χ` of mod 5 with `χ(2) = i` | `|χ*(p)p^{−s}| = p^{−Re s} < 1`; the zeros `2πik/log 2` lie on `Re s = 0`; `1 − ρ` is a zero of `L(·, χ⁻¹)` | holds |
| 9.4 corollary of AnalyticNumberTheoryPartI §§1.6, 1.6a | σ-strip at `σ = 0.6` | §1.6a gives orders under conjugation and reflection; a zero at `Re 0.3` reflects to `0.7 > 0.6`; the bridge follows from the half-plane form | holds |
| 9.5 new paragraph vs §2.42a | each clause | Every modulus, trivial character, inverse, half-plane form, rationals and type `A₀` all present; LFunctions Layer 6 characters are type `A₀` | holds |
| 9.6 origin | the cap `c ≤ log 3/2`, `log 9` | `(log 3/2)/log 9 = 0.25`, so the exceptional window is `[3/4, 1)`, as (a) states | holds |
| 9.7 origin | `χ₋₃`, `σ₀ = 1/2` | `𝔮₁ = 3·5 = 15 < 16`, handled through `L(1, χ₋₃) = π/(3√3) ≈ 0.605`; Littlewood 1928 is in the References | consistent |
| 9.8 origin (CCM 2015) | arXiv v1, abstract and §4 | Argument bound for a class including `GL(m)` cuspidal forms over number fields under RH; Theorem 1 constant `1/4` | supported |
| 9.9 new sentence vs ZerosOfLFunctions §8.5a | `σ = 1/2`, `x = 10⁶` | Same hypothesis (orders of `ζ`); `π − Li ≈ −128.5 ≤ x^{1/2} log x ≈ 13815`; uniform: `∫_2^x t^{σ−1} dt ≤ 2x^σ` | holds |
| 10.2 origin and method | even and odd `χ` at `s = 0` | Mathlib Deligne.lean:69 `Gammaℝ_ne_zero_of_re_pos`; even: junk `0` at the pole; odd: `Γℝ(1) = 1` | holds |
| 10.3 | principal character mod 6; mod 12 from `χ*` mod 3 | Bundle `1` of level 1; extra factor `1 + 2^{−s}` since `χ*(2) = −1` | holds |
| 11.1 origin (Milne) | Introduction, lines 675–684 | Cyclotomic characters are characters of `(ℤ/m)ˣ` and the Artin L-series is Dirichlet's; the conductor is in Ch. V §3 | supported |
| Downstream bullets | GeneralizedRiemannHypothesisFromWindowBounds, Consequences… at head | The first cites §9.9 at `ℚ` (lines 539, 548, 568) and not §8.8; Consequences §§0.5, 1.1, 1.2, 2.1, 3.1, 4.1 cite 9.6–9.9 | holds |
| Headline (1): Dirichlet RH forms | principal character mod 2 | Stated (`generalizedRiemannHypothesis_iff_re_eq_half`, `_one_iff`, `_primitiveCharacter_iff`); zeros on `Re s = 0` not read | stated |
| Headline (2): remainder bound | conductor one, `y = 1` | `norm_rieszRemainder_le_of_zeroFreeRightOf`; `rieszRemainder 1 1 = 1 + γ` | stated |
| Headline (3): growth | `ℚ` instances | General form not statable (docstring says why); `log_norm_riemannZeta_le_of_riemannHypothesis`, `LFunction_one_bounds_…` stated | stated |
| Headline (4): prime counts | von Koch | `primePsi_primeCount_of_zeroFreeRightOf`, `primeCounting_sub_logIntegral_isBigO_of_riemannHypothesis` | stated |

- **Source locators checked against the text:** 5, in 3 sources: milne2020cft (Introduction, lines 674–719; Ch. V §3, lines 7416–7423), ccm2015 (lines 8–13 and 44), and Belabas–Diaz y Diaz–Friedman §2 (pp. 1187–1188).
- **Library declarations opened at the pin:** `Complex.Gammaℝ_ne_zero_of_re_pos` (Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean:69), `Complex.norm_le_of_forall_mem_frontier_norm_le` (Mathlib/Analysis/Complex/AbsMax.lean:404), `RiemannHypothesis` (Mathlib/NumberTheory/LSeries/RiemannZeta.lean:185); every Suggested.lean name cited in the README is declared there.
- **Cross-roadmap citations resolved at this head:** AnalyticNumberTheoryPartIII §8.2a; ZerosOfLFunctions §§8.4a, 8.5a, 8.6a, 8.7a and 9.1; AnalyticNumberTheoryPartI §§1.6, 1.6a, 2.42 and 2.42a; LFunctions Layer 6 (on main); and the consumers' citations of 8.4a, 8.8, 9.2–9.9, 10.3 and 11.1. Formal proof files read at commit 40e56ba: ChBalance.lean, CharFamily.lean and SplitInertia.lean.
- **Record and decision:** README at `b8f3652` against the head: no layer or section removed or renumbered. The route and four Checks of 3.2a are in AnalyticNumberTheoryPartIII §8.2a, the route of 8.8 is in ZerosOfLFunctions §8.7a, and `NumberField.eulerKroneckerConstant` is in §8.6a; each states the item in full.
- **Automatic checks:** all passed. Dependency check: `depcheck: 130 roadmaps, 1457 edges, 0 problem(s)`. AnalyticNumberTheoryPartIII is on main and earlier in the merge order, and it cites this roadmap nowhere.
- **Elaboration:** `lake env lean` on Suggested.lean gives 13 `sorry` warnings and nothing else; the file is unchanged by this pull request.
- **Overlap check:** read ZerosOfLFunctions (main, and its open revision, which has no §§8.4a–8.7a or 9.1), LiCoefficientsArithmeticFormula, ArtinRepresentations, HilbertModularForms, SpecialFunctionsGamma, GeneralizedRiemannHypothesisFromWindowBounds and LFunctions. Shared objects: the `ζ` case of 8.4b and the fixed-`σ` case of 9.9 at `ℚ` (owner ZerosOfLFunctions §§8.4a, 8.5a, cited); the Euler–Kronecker constant and the dictionary theorem (owner ZerosOfLFunctions §§8.6a, 8.7a); the three-circles theorem (owner AnalyticNumberTheoryPartIII §8.2a). Nothing else is shared.
- **Source independence:** changed passages only. 7 passages compared with 3 sources (Milne, CCM, Belabas–Diaz y Diaz–Friedman). Nothing is shared beyond the standard phrase "cuspidal automorphic representations of GL(m) over a number field". The largest share is [FormalProof], 37 of about 93 source mentions. Arrangement not compared: no layer added, removed or reordered.
- **Research link:** 9.2–9.5 and the Riesz remainders of 8.4a are the statements through which the formal proof of GRH for Dirichlet L-functions (Alpöge, announced 20 November 2026) is stated. 9.7–9.9 are the classical conditional consequences: Littlewood 1928, von Koch, Selberg (Titchmarsh 1986, Ch. XIV), Lagarias–Odlyzko 1977, Carneiro–Chandee–Milinovich 2015. This rests on the README Summary and References.

## Not verifiable

- Robinson 1944 (3.2a): the DOI resolves only to pubs.ams.org, a host in no licence class.
- Ihara–Murty–Shimura 2009, Theorem 1, (2.2.1), p. 257 (8.4a, 8.8a): journals.impan.pl returned HTTP 502 on three attempts.
- Ihara 2006 (8.4a, 8.8a): no legal copy located.
- Bach 1990, §3, p. 360 (9.5): pubs.ams.org, a host in no licence class.
- Lagarias–Odlyzko 1977 (9.9): no copy found on the authors' pages tried.
- Titchmarsh 1986 (Ch. II, XIV), Iwaniec–Kowalski 2004 (Ch. 5), Ingham 1932 (Ch. IV), Littlewood 1928, Davenport (settled as uncertified): books or paywalled; cited by locator.
- The formal-proof method lines of 8.4a, 9.3, 9.4 and 10.2: not re-read in the repository; only `Deduction.ch_balance` (8.8a) was opened.

## Source issues

- none

## For the human reviewers

- Decision applied (sections stated in full in a general roadmap may leave the family). Here only part of three items moves, and the statements stay. The route and Checks of 3.2a are now in AnalyticNumberTheoryPartIII §8.2a, the route of 8.8 is in ZerosOfLFunctions §8.7a, and the Euler–Kronecker definition is in §8.6a. Each was checked to state the item in full.
