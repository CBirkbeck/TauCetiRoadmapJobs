# Review of RiemannHypothesisStatementsAndConsequences (pull request #3027 at 7b5fe43)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/RiemannHypothesisStatementsAndConsequences/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 439 changed lines since `b8f3652`. I checked every added `*Origin:*`, `*Method of the formal proof:*` and `*Corollary of:*` line, the passages of 3.2a, 8.4a (b), 8.4b, 8.8, 9.5 and 9.9 that now point to general roadmaps against the sections they cite, the downstream bullets against the consumers at this head, the open sources of the sample, the dependency check and the elaboration of `Suggested.lean`. There is no finding, so the folder is accepted. The folder's text is the same as at the head the previous review read, so its two small corrections and one format note are unrepaired and are repeated here; none blocks. The human reviewers' decision on sections stated in full in a general roadmap was applied to the three items that hand part of their content over.

## C01 — The description does not say that this roadmap gains a supplier and hands part of three items to general roadmaps

The description names this roadmap in one sentence only: ZerosOfLFunctions gains §§8.4a–8.7a and 9.1, "which RiemannHypothesisStatementsAndConsequences cites". It states new suppliers for other roadmaps of the family (PositivityOfDirichletSeriesWithKernels, SingularHermitianMetricsAndL2Methods), but for this one a reader is not told that:

- it gains AnalyticNumberTheoryPartIII as a supplier (the new `### From TauCetiRoadmap.AnalyticNumberTheoryPartIII` contract, README line 1815; the description mentions §8.2a only as a docstring change of that roadmap);
- 9.4 and 9.5 now cite the new AnalyticNumberTheoryPartI §§1.6a and 2.42a;
- 3.2a, 8.4a (b) and 8.8 keep their statements, while the route and four Checks of the three-circles theorem, the definition of the Euler–Kronecker constant and the route of the independence of the dictionary are now AnalyticNumberTheoryPartIII §8.2a and ZerosOfLFunctions §§8.6a and 8.7a (Scope and ownership, lines 1688–1695).

Text that would be right, in part 1: "RiemannHypothesisStatementsAndConsequences gains AnalyticNumberTheoryPartIII (§8.2a) as a supplier and cites the new AnalyticNumberTheoryPartI §§1.6a and 2.42a. Its 3.2a, 8.4a (b) and 8.8 keep their statements; the proof and Checks of the three-circles theorem, the Euler–Kronecker constant and the proof of the independence of the dictionary are now AnalyticNumberTheoryPartIII §8.2a and ZerosOfLFunctions §§8.6a and 8.7a. No section of it is removed or renumbered."

## C02 — 9.2 is labelled "definitions and conventions", but it defines nothing of its own and states four theorems

The `*Origin:*` of 9.2 (line 581) reads "definitions and conventions", and the Labels paragraph (line 107) groups 9.2 with 10.3 as definitions carrying the first label only. But 9.2 takes its predicate from QuasiRiemannHypothesis §1.1 and then "adds four clauses" (lines 599–615): the limit form of monotonicity, the converse product rule, the two symmetries and the change of level, each a theorem with hypotheses and Checks, and each listed in Scope and ownership (line 1673) as this roadmap's own. A reader of the labels takes four theorems for conventions and is told neither where they come from nor whether the formal proof has them.

The smallest repair is an `*Origin:*` such as "this roadmap's own formulation: four elementary properties of meromorphic orders (`meromorphicOrderAt_mul`, `TauCeti.meromorphicOrderAt_conj_conj`, `DirichletCharacter.LFunction_changeLevel`)", with a `*Method of the formal proof:*` line ("none", or the form the proof has), and line 107 reading "The definitions of 10.3 carry the first label only."

## N01 — `Deduction.ch_balance` is cited without its file

In the method line of 8.8a (line 450) `Deduction.ch_balance` is the only [FormalProof] declaration cited without a path. At the cited commit it is in `Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChBalance.lean` (line 200).

## Questions for the author

- 9.5's origin and the reference entry for Belabas, Diaz y Diaz and Friedman (2008), §2, pp. 1187–1188, say that the hypotheses are there "read as the absence of zeros right of `1/2`". Is that reading on those pages, or only in Bach (1990), §3, p. 360? I could read neither paper from a legal place (both resolve to a publisher host that is in no licence class), so the attribution of the reading is unchecked.

## Previous findings

- The previous review (at `3bddf73`) had no finding. Its C01, C02 and N01 are not repaired: the folder's two files are identical at `3bddf73` and at this head, and the description's sentence on this roadmap is the same. They are repeated above. Its question on 9.5 is unanswered and is asked again.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| 3.2a three circles (route now AnalyticNumberTheoryPartIII §8.2a) | `z − z₀` and `(z − z₀)⁻¹` at radii 1, 2, 4 | `θ = log 2/log 4 = 1/2`; `2 = 1^{1/2}·4^{1/2}`; inverse: `1^{1/2}(1/4)^{1/2} = 1/2 = M(2)`. §8.2a has the same hypotheses, route and four Checks | holds |
| 3.2a disc clause (stays here) | `(z − z₀)⁻¹` on `closedBall z₀ 2` | Not holomorphic at `z₀`, so excluded by the hypothesis; for `z − z₀`, `‖f‖ ≤ 2 = M(2)`; Mathlib AbsMax.lean:404 | holds |
| 8.4a method: kernel | `n = 1`, `s = 2` | `∫_n^∞ (y/n − 1) y^{−s−1} dy = n^{−s}/(s − 1) − n^{−s}/s`; at `1, 2`: `1 − 1/2 = 1/2 = 1/(s(s−1))` | holds |
| 8.4a (b) explicit formula as corollary of ZerosOfLFunctions §8.6a | §8.6a times `(y − 1)`; `K = ℚ`, `ψ = 1`, `y = 1`; `y → ∞` | Left `1 + γ`; right `(2 + γ − log 4π) + (log 4π − 1) = 1 + γ`. Log coefficient `a + r₂` (`ψ ≠ 1`), `r₁ + r₂ − 1` (`ψ = 1`): the order at `0` | holds |
| 8.4a (b): `EK` taken from §8.6a | `K = ℚ` | §8.6a defines `EK(K)` by the same expansion, `EK(ℚ) = γ`; `1 + 0.577216 + 0.333178 − 0.145632 = 1.764762`, the Check's `Φ₁(1)` | holds |
| 8.4b at `ℚ` is ZerosOfLFunctions §8.4a | `x = 2`, `m = 3`; trivial zero `ρ = −2q` | Weight `log(4/3)/log 2 = 0.4150` in both; with `m_ρ = 1` the term is `(x^{−2(2q+s)} − x^{−(2q+s)})/(2q+s)²`, §8.4a's; `κ = 1` | holds |
| 8.8 is ZerosOfLFunctions §8.7a | `ℚ(i)/ℚ` at `(4)∞` and `(8)∞`, kernel `{1, 5}`; kernel `{1, 3}` | Values `1, −1, 1, −1` at `1, 3, 5, 7` are `χ₋₄` mod 8; `{1, 3}` gives `1, 1, −1, −1 = χ₋₈`, not a dictionary. Same name and hypotheses in §8.7a | holds |
| 8.8 origin (Milne) | milne2020cft lines 7417–7421 | Characters agreeing off a larger set are equivalent; each class has a unique primitive member; placed before Theorem 3.27 | supported |
| 8.8a method (`Deduction.ch_balance`) | ChBalance.lean:200 at the cited commit | Conclusion `ASK D N a t w − MAIN ell a w = De D ell a t w`, `ell` a free function on characters: no `D_f`, no bound | consistent |
| 9.2 origin label | the four added clauses | Each is an equivalence with hypotheses (`σ ≥ 0`, meromorphy, pole condition) and a Check that fails without them: theorems, not conventions | C02 |
| 9.3 method (functional equation) | `Re s < 1/2`, `s ≠ 1` | `2(2π)^{s−1} = 2^s π^{s−1}`, `cos(π(1−s)/2) = sin(πs/2)`: zeros at even integers, so `s = 0` (`ζ(0) = −1/2`), trivial zeros, or `Re s ≥ 2` | holds |
| 9.3 corollary of ZerosOfLFunctions §9.1 | `q = 1` | §9.1 (iii) at `q = 1` is `ZeroFreeRightOf (1/2) riemannZeta` and (i) is the `ζ` bridge hypothesis; order `−1` at `s = 1` allowed | holds |
| 9.4 method (Euler factors, reflection) | principal character mod 2; `χ` mod 5 with `χ(2) = i` | `‖χ*(p) p^{−s}‖ = p^{−Re s} < 1` on `Re s > 0`; zeros `2πik/log 2` on `Re s = 0`; `ρ ↦ 1 − ρ` lands on `χ⁻¹ ≠ χ` | holds |
| 9.4 corollary of AnalyticNumberTheoryPartI §§1.6, 1.6a | zero at `Re ρ = 0.3` | §1.6a: conjugation, reflection, half-plane form; `1 − ρ̄` has real part `0.7 > 1/2`. §1.6: conductor one, primitive induction | holds |
| 9.5 new paragraph against §2.42a | clause by clause | §2.42a has every modulus (with the trivial character), inverse, half-plane form, the rationals at `(q)` and the real place, type `A₀` characters; thresholds `σ ≠ 1/2` stay here | holds |
| 9.6 origin | cap `(log 3)/2`, `log 9` | `0.5493/2.1972 = 0.25`, so exceptional zeros lie in `[3/4, 1)` and none exists for `σ < 3/4`, as (a) states | holds |
| 9.7 origin | `σ₀ = 1/2` against `σ₀ > 1/2` | Sources named are at `σ₀ = 1/2` only; the label says the half-plane form is the roadmap's own; Littlewood 1928 in References | consistent |
| 9.8 origin (CCM 2015) | ccm2015 lines 8–13, 44 | Bound for the argument under RH for a class including `GL(m)` cuspidal L-functions; Theorem 1 has constant `1/4 + o(1)` | supported |
| 9.9 new sentence against ZerosOfLFunctions §8.5a | `σ = 1/2`, `x = 10⁶` | Same hypothesis on orders of `ζ`; §8.5a's constants depend on `σ`; `√x log² x = 190868`, `√x log x = 13815.5` against `−413.4`, `−128.5` | holds |
| 10.2 origin and method | even and odd `χ`, `Re s > 0` | Odd: `Re(s + 1) > 1 > 0`; Mathlib Deligne.lean:69 `Gammaℝ_ne_zero_of_re_pos` applies to both | holds |
| 10.3 label | principal character mod 6 | A structure with three fields: a definition; its bundle for the principal character is level 1 | holds |
| 11.1 origin (Milne) | milne2020cft lines 675–684 | Characters of `Gal(ℚ[ζ_m]/ℚ)` are characters of `(ℤ/m)ˣ` and the L-series is Dirichlet's; conductor at lines 7420–7422 | supported |
| Downstream bullets | the two consumers at this head | GeneralizedRiemannHypothesisFromWindowBounds cites 8.4a, 9.2–9.6, 9.9, 10.3, 11.1 and not 8.8; Consequences… cites 8.8, 9.2–9.9, with §§0.5, 1.1, 1.2, 2.1, 4.1 headed by 9.6–9.9 | holds |
| Headline (1): equivalent forms of the hypothesis for `χ` | principal character mod 2 | Stated (`generalizedRiemannHypothesis_iff_re_eq_half`, `_one_iff`, `_primitiveCharacter_iff`); one-tactic probe fails on each | stated |
| Headline (2): remainder bound | level 1, `y = 1` | `norm_rieszRemainder_le_of_zeroFreeRightOf`; `rieszRemainder 1 1 = 1 + γ`; probe fails | stated |
| Headline (3): growth | `ℚ` instances | General form named in the docstring as not statable; `log_norm_riemannZeta_le_of_riemannHypothesis`, `LFunction_one_bounds_…` stated; probe fails | stated |
| Headline (4): prime counts | von Koch at `x = 10⁶` | `primePsi_primeCount_of_zeroFreeRightOf`, `primeCounting_sub_logIntegral_isBigO_of_riemannHypothesis`; probe fails | stated |

- **Source locators checked against the text:** 4, in 2 sources: milne2020cft (lines 674–716; lines 7416–7423), ccm2015 (lines 8–13; line 44).
- **Library declarations opened at the pin:** `Complex.norm_le_of_forall_mem_frontier_norm_le` (Mathlib/Analysis/Complex/AbsMax.lean:404), `Complex.Gammaℝ_ne_zero_of_re_pos` (Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean:69), `RiemannHypothesis` (Mathlib/NumberTheory/LSeries/RiemannZeta.lean:185). Formal proof at the cited commit: `ch_balance` (ChBalance.lean:200), `prim_zero` and `prim_reflect` (ClaimStrip.lean:23, 42), `mellin_ramp` (MellinRamp.lean:10), `LFunction_conj` (LFunctionConj.lean:88).
- **Cross-roadmap citations resolved at this head:** 11: AnalyticNumberTheoryPartIII §8.2a; ZerosOfLFunctions §§8.4a, 8.5a, 8.6a, 8.7a, 9.1; AnalyticNumberTheoryPartI §§0.30, 1.6, 1.6a, 2.42, 2.42a. None of these files, and neither consumer, changed since the head the previous review read.
- **Record and decision:** README at `b8f3652` against the head: no layer or section removed, renumbered or retitled; one heading added. What left the folder is the route and four Checks of 3.2a (all in AnalyticNumberTheoryPartIII §8.2a), the route of 8.8 (in ZerosOfLFunctions §8.7a, with Checks) and the definition of the Euler–Kronecker constant (in §8.6a); each section states the item in full and is named in Scope and ownership.
- **Automatic checks:** all passed. Dependency check output: `depcheck: 129 roadmaps, 1443 edges, 0 problem(s)`. No file outside the roadmap folders is changed.
- **Elaboration:** `lake env lean` on `Suggested.lean`: 13 `sorry` warnings, nothing else; no `set_option`, one `import Mathlib` and four `TauCeti.*` modules. The file is unchanged by this pull request. One-tactic probe (`rfl`, `simp`, `infer_instance`, unfolding the two predicates then `simp`) on a scratch copy: none of the 13 theorems closes.
- **Overlap check:** read ZerosOfLFunctions (this head; the open revision of it drops no id cited here), GeneralizedRiemannHypothesisFromWindowBounds, LFunctions (cited layers) and AnalyticNumberTheoryPartI and PartIII at the cited sections. Shared objects and owners: the three-circles theorem, AnalyticNumberTheoryPartIII §8.2a; Selberg's formula for `ζ` and the fixed-`σ` prime counts at `ℚ`, ZerosOfLFunctions §§8.4a and 8.5a; the Euler–Kronecker constant and the independence of the dictionary, ZerosOfLFunctions §§8.6a and 8.7a; all cited here, none restated. A search of every roadmap for these four objects finds no further owner.
- **Source independence:** changed passages only: 5 passages compared with 2 sources (Milne, Carneiro–Chandee–Milinovich), none shared beyond the standard phrase for cuspidal automorphic representations of `GL(m)` over a number field; largest share [FormalProof], 37 mentions, a code repository cited by file and declaration name; arrangement not compared, no layer being added, removed or reordered. Bach, Belabas–Diaz y Diaz–Friedman and the books could not be read.
- **Research link:** 9.2–9.5 and the Riesz remainders of 8.4a are the statements in which the formal proof of the Riemann hypothesis for Dirichlet L-functions (Alpöge, announced 20 November 2026) is stated; 9.7–9.9 are the classical conditional consequences (Littlewood 1928; Titchmarsh 1986, Ch. XIV; Lagarias–Odlyzko 1977; Carneiro–Chandee–Milinovich 2015). Rests on the README's Summary and References.

## Not verifiable

- Belabas–Diaz y Diaz–Friedman 2008, §2, pp. 1187–1188, and Bach 1990, §3, p. 360 (9.5): the DOI resolves to a publisher host in no licence class.
- Robinson 1944 (3.2a), Ihara 2006 and Ihara–Murty–Shimura 2009, Theorem 1, (2.2.1), p. 257 (8.4a, 8.8a), Lagarias–Odlyzko 1977 (9.9), Littlewood 1928 (9.7): no legal copy read; cited by locator.
- Titchmarsh 1986 (Ch. II, XIV), Iwaniec–Kowalski 2004 (Ch. 5), Ingham 1932 (Ch. IV), Davenport 2000 (settled as uncertified): books, cited by locator.
- The formal-proof method lines of 8.4a, 9.3, 9.4 and 10.2: the cited declarations were located at the cited commit, but only the statement of `ch_balance` was read.

## Source issues

- none

## For the human reviewers

- Decision applied (a section stated in full in a general roadmap may leave the family): here only the route and Checks of 3.2a, the route of 8.8 and one definition of 8.4a (b) moved; statements stay; AnalyticNumberTheoryPartIII §8.2a and ZerosOfLFunctions §§8.6a, 8.7a state them in full.
- Not tested: the source cited most is [FormalProof], a code repository; its wording was not compared beyond one declaration, and the paywalled sources of 9.5 (Bach 1990; Belabas–Diaz y Diaz–Friedman 2008) were not read.
