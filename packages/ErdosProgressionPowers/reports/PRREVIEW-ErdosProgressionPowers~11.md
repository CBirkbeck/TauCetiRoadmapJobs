# Review of ErdosProgressionPowers (pull request #1336 at e20c754)

**Verdict:** needs changes

**Summary.** Changes are needed, for one reason that the repair of the previous finding brought out: the README now says that the theorems using the explicit prime estimates hold only under recorded numerical verifications that are assumed and never established, yet six of the eight headline theorems that use those estimates are stated, in the layers and in `Suggested.lean`, with no such hypothesis. All six points of the previous review are repaired, and the new ExplicitPrimeCounting contract agrees with that roadmap on main. There is one small correction and one format note, neither blocking; two points remain for the human reviewers.

## R01 (P2) — Six headline theorems are stated unconditionally, while the README says the roadmap proves them only under recorded verifications that are never established

An implementer who finishes every layer cannot close the `sorry` of, say, `consecutiveProduct_not_perfectPower`: what the layers deliver is that statement under hypotheses the statement does not carry, so the acceptance test asserts more than the roadmap proves, and the README says two different things about the same theorem.

The opening Summary (line 9) says "The theorems that use these estimates are conditional on those recorded verifications"; "Worked examples and integration requirements" (lines 1490–1492) says the end theorems "remain conditional on the recorded numerical verifications those sections assume"; the new contract (lines 2078–2081) says each input holds "under the hypotheses its section states, and every application here carries them unchanged", these being propositions that ExplicitPrimeCounting "assumes and never establishes". On main, those are Lean propositions that enter statements as hypotheses: `ButheVerified` is declared at `TauCetiRoadmap/ExplicitPrimeCounting/Suggested.lean` line 174, and `TauCetiRoadmap/AnalyticNumberTheoryPartI/Suggested.lean` states `theta_lt_of_schoenfeld (h : SchoenfeldFiniteRangeInput)` (line 223; its docstring, lines 37–38, says published finite computations are named propositions that enter every theorem using them). Here, §7.1 (line 1187) and `Suggested.lean` line 172 state `consecutiveProduct_not_perfectPower` with only `0 < n`, `2 ≤ k`, `2 ≤ ell`, although its `*Needs:*` lines (1298–1300, 1385–1386) use AnalyticNumberTheoryPartI §§0.3 and 0.5 through ExplicitPrimeCounting §§3.2 and 3.5. The same holds for `half_primes_divide_d` (through §§1.7–1.8, which need §0.9's prime estimates), `comparison_curve` (through §1.11), `character_family` (§2.7, whose constant 0.1239 comes from the mod-eight bound with 0.002811), `effective_prime_bound` and `fixed_length_finiteness` (through Layers 2 and 5). `fixed_exponent_finiteness` and `positive_fixed_exponent_finiteness` use none of the estimates and are unaffected. While the inputs were declared gaps the unconditional statements were what the roadmap would prove once the gaps closed; with the gaps replaced by hypotheses that no roadmap discharges, they are not.

The smallest change that makes the two agree: give each of the six statements, in its README section and in `Suggested.lean`, the finite-range inputs its route uses as hypotheses. The four inputs of the AnalyticNumberTheoryPartI table (the θ bound, the prime-count pair, the prime-product bound, and the mod-eight input with its zero-line clause) are inequalities statable on Mathlib's carriers, so they can be restated locally with real bodies, as `HasFullRationalTwoTorsion` already is, and each theorem takes only those it needs; the sentence that ExplicitPrimeCounting proves them from its recorded verifications then stays true as written. If instead the unconditional forms are to stay, the README has to stop saying that the end theorems are conditional, and name a supplier that proves the inputs without assumed propositions; none on main does.

## C01 — The description's summary still speaks of declared gaps

The summary block that opens the description says "numerical estimates remain explicit hypotheses or declared gaps", and three paragraphs later the prose says "the README declares no gaps of its own". The head has no gap: the four inputs are consumed from ExplicitPrimeCounting §§3.2, 3.5, 4.3 and 6.1. The clause would read "numerical estimates remain explicit hypotheses, proved in ExplicitPrimeCounting from recorded verifications".

## N01 — The `depends-on` block lists a roadmap the README does not cite and omits one it does

The generated `depends-on` block lists SieveMethodsAndPrimePatterns, which the README cites nowhere, and does not list ExplicitPrimeCounting, a supplier since this head. Regenerating the block would fix both.

## Previous findings

- R01 — repaired: the four gap paragraphs are gone; "### From TauCetiRoadmap.ExplicitPrimeCounting" cites §§3.2, 3.5, 4.3 and 6.1 with their hypotheses, and every `*Needs:*` line names those sections. The repair leaves the statements unconditional (R01 of this report).
- C01 — repaired: "§2.0 (EC.6) for the geometric-torsion carrier and §5.1 (EC.6) for the full-two-torsion predicate"; the EC.6 row reads "§§2.0, 5.1"; the Check cites the Checks of §2.0.
- C02 — repaired: "The numbering skips Layer 3 and §§4.1–4.2: Layer 4 opens at §4.3." (line 33).
- C03 — repaired: "Consume AnalyticNumberTheoryPartI §1.7's effective density estimate" and "Consume AnalyticNumberTheoryPartI §1.4 and §§1.4a–1.4d's".
- C04 — repaired: "neither enters the proof of any headline theorem" (line 1183).
- N01 — repaired: the locator now says the source "prints 64(abc)², four times the native discriminant 16(abc)² of this equation (2304=16·12² at a=1, c=3)" (line 457).

## Verified sound

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| R01: `consecutiveProduct_not_perfectPower` and five others | hypotheses in Lean against the README's route | Lean: `0<n`, `2≤k`, `2≤ell` only; route: ExplicitPrimeCounting §§3.2, 3.5 under `ButheVerified` and others, never established | statement stronger than what is proved |
| §0.9, θ input from ExplicitPrimeCounting §3.2 | 0<x<1; x≤10¹⁹; x>e³⁰ | θ=0; θ(x)<x; e³⁰=1.07·10¹³<10¹⁹, 1+0.978·10⁻⁵<1.000081 | ranges cover (0, exp 10000); as cited |
| §0.9, prime-count input from §3.5 | x=59 | π(59)=17; lower 16.24, upper 19.79 | holds at the endpoint; as cited |
| §0.9, prime-product input from §4.3 | B enclosure; x=10⁸ | 0.2614972128+10⁻⁹=0.2614972138<0.2615; 0.2615+1/(2 log²10⁸)=0.26297<0.27 | as the new contract states |
| §0.9, mod-eight theta clause from §6.1 | row (8, 0.002811, 10¹⁰) | (1−3·0.002811)/8=0.123945875>0.1239; GRH*(8,10000)= GRH(f,10000), f∣8 | agrees with §2.7 and ExplicitZetaBounds clause |
| §1.3 locator note | a=1, c=3 | roots 0, 1, −3: 16·(1·3·4)²=2304=16·12²; 64·144=9216=4·2304 | the new clause is correct |
| §1.12 Check, torsion at ell=1, 0 | supplier §2.0 at its open head | n=1 zero group; n=0 all geometric points | as cited |

The rows for the untouched statements stand as in the previous review, of `a10fa87`.

- Cross-roadmap citations resolved in the changed passages: ExplicitPrimeCounting §§3.2, 3.5, 4.3, 6.1 on main (README lines 2511–2577, 3046–3049, 3526–3529, 3995–3998) with `ButheVerified`, *RosserSchoenfeld1962Range*, *DusartThesisTable*, RH(30 610 046 000), *MeisselMertensEnclosure*, *RamareRumelyTable1* and GRH*(8, 10 000) all found there; EllipticCurveModularityPartII §§2.0 and 5.1 at its open head; AnalyticNumberTheoryPartI §§0.3, 0.5, 0.16, 0.19, 0.25 on main.
- Library declarations opened: none changed; two supplier Lean files read for R01 (ExplicitPrimeCounting line 174, AnalyticNumberTheoryPartI lines 37–38, 183–248).
- Dependency check: `depcheck: 199 roadmaps, 2183 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. ExplicitPrimeCounting is on main and earlier in the merge order. No change outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives exactly eight `declaration uses sorry` warnings (lines 94, 105, 130, 143, 149, 155, 164, 172); the file did not change since the previous review, whose one-tactic probe and binder comparison stand.
- No "gap" slug remains in the README; the automatic checks all passed at this head.
- Pull-request text read against the head: one sentence contradicted (C01); the `depends-on` block is out of date (N01).

Overlap check: read the scope of ExplicitPrimeCounting, AnalyticNumberTheoryPartI and EllipticCurveModularityPartII; proofs of the four finite-range inputs — ExplicitPrimeCounting (now cited); the inputs' statements — AnalyticNumberTheoryPartI; torsion carrier — EllipticCurveModularityPartII §2.0, full-two-torsion predicate — its §5.1 (restated locally for the Lean file only). Nothing with two owners.

Source independence: changed passages only: 7 passages compared with 2 texts (the ExplicitPrimeCounting and AnalyticNumberTheoryPartI READMEs, which they cite), none shared beyond the inequalities themselves; the sources named in them (Schoenfeld1976, RosserSchoenfeld1962, RamareRumely1996) were not opened; largest share BS20, as in the previous review; no layer added, removed or reordered, so the contents comparison stands: independent.

Research link: Layers 0–6 prove Bennett–Siksek (2020), Theorem 2, by Granville's addendum, with Darmon–Granville (1995), Corollary 2.1 and Faltings (1983) for fixed-length finiteness; Layer 7 proves Erdős–Selfridge (1975). Rests on BS20, DG95 and ErdosSelfridge1975 as read, and on the README's references.

## Not verifiable

- Schoenfeld1976, RamareRumely1996: not in the cache, not opened; RosserSchoenfeld1962: waived, cited by locator. The new contract's locators into them were checked only against ExplicitPrimeCounting's own citations.
- Green2026: no legal copy known; consumed only through AnalyticNumberTheoryPartI §0.34c.
- The proofs of the four inputs inside ExplicitPrimeCounting were read for their hypotheses and the arithmetic above, not refereed.

## Source issues

- none

## For the human reviewers

- **Scope.** `TauCetiRoadmap/ErdosProgressionPowers/README.md` lines 2110–2111 cite two 2026 preprints, OpenAI2026 and Green2026, for the exclusion of Landau–Siegel zeros; Layer 5 and `effective_prime_bound` rest on it through AnalyticNumberTheoryPartI §§0.6 and 0.34.
- **Scope.** BS20 §12 proves the same step from the classical Landau–Page theorem with one possible exception and a real-zero bound; the README's Layer 5 uses the exception-free form instead.
