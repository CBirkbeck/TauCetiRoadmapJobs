# Review of ErdosProgressionPowers (pull request #1336 at 3e1048c)

**Verdict:** accepted

This is an incremental re-review of the 49 lines changed since aaab8ad, all in `README.md`; `Suggested.lean` is byte-identical to the head the previous two reviews read. The single previous finding, the supplier drift of ComputationalNumberTheory §4.22, is repaired: every one of its seven occurrences now cites ExplicitZetaBounds §§0.2–0.4, the new contract restates what that roadmap states at its head, including the correction that the modulus 1 is not part of Platt's record, and nothing cites ComputationalNumberTheory any more. The repair introduced no new problem. The gate passes on this head with the build, the dependency check reports 0 problems, elaboration gives only the eight `sorry` warnings, and nothing changed outside the folder. No finding remains.

## Previous findings

- R01 — repaired: `README.md:84` "ExplicitZetaBounds §§0.2–0.4 own the bounded-height Riemann hypotheses RH(H) and GRH(q, H), Platt's finite-conductor theorem in that form and the recorded verifications for the Riemann zeta function"; l.623, 627, 674–692, 907, 937 and 2385 cite the same sections; "ComputationalNumberTheory" occurs nowhere in the folder.

## Verified sound

**The repaired contract against the owner's head.** ExplicitZetaBounds is on no branch of main; it is the open pull request #1954, a new roadmap, named in this pull request's `Depends on` list, at merge-order line 264, before this roadmap at line 272. I read its README and `Suggested.lean` at that head (`roadmaps show ExplicitZetaBounds --pr 1954`) and checked each sentence of `README.md:674`–692 against it:

- "RH(H) says that every zero of `riemannZeta` with 0<Re s<1 and |Im s|≤H has Re s=1/2": owner `README.md:439`–441 and `Suggested.lean:107`–108, `def RiemannHypothesisUpTo (H : ℝ) : Prop := ∀ ρ : ℂ, riemannZeta ρ = 0 → 0 < ρ.re → ρ.re < 1 → |ρ.im| ≤ H → ρ.re = 1 / 2`. Agrees.
- "GRH(q, H) says the same for the native `DirichletCharacter.LFunction` of every primitive character modulo q": owner `README.md:441`–444 and `Suggested.lean:113`–115, quantified over `χ : DirichletCharacter ℂ q` with `χ.IsPrimitive`. Agrees. Both names, `RiemannHypothesisUpTo` and `DirichletGRHUpTo`, are declarations of the owner's `Suggested.lean`, so the backticks at l.676–677 are earned.
- "antitonicity in H, the identity of RH(H) with GRH(1, H)": owner's first two bullets of §0.2 (`README.md:446`–448). Agrees.
- "passage to imprimitive characters … as soon as GRH(f, H) holds for every divisor f of q, because its L-function is that of its primitive character times Euler factors at the primes dividing q whose zeros lie on Re s=0": owner `README.md:455`–463, stated there as an "if and only if"; this roadmap consumes the direction it needs. Agrees.
- "§0.3's corollaries GRH(8, 10000) and GRH(4, 10000) of the record `PlattRecord`, which is GRH(q, H(q)) for 2≤q≤400000 with H(q)≥10⁸/q": owner `README.md:499`–504 (`H(q) = max(10⁸/q, …)`, so `H(q) ≥ 10⁸/q`; the corollaries `GRH(q, 10 000)` for `2 ≤ q ≤ 13`, which contains q = 4, and `GRH(8, 10 000)`), `Suggested.lean:119`–127 (`plattHeight`, `PlattRecord` over `2 ≤ q → q ≤ 400000`). Agrees. The record itself is listed by the owner under 0.4b (`README.md:641`–642) and introduced by name in §0.3; citing §0.3 for its corollaries, as the contract does, is right.
- "GRH(2, H) holds for every H because no character modulo 2 is primitive": owner's second Check of §0.2 (`README.md:489`–490). Agrees.
- "The modulus 1 is not part of that record: consume §0.4's record RH(10⁹), hence RH(10000) by antitonicity": owner `README.md:513`–515 ("not part of Platt's record; `RH(H)` at the heights used here is a record of 0.4"), the fourth Check of §0.3 (l.531–536) and the second record of §0.4 (l.546, `RiemannHypothesisUpTo (10 ^ 9)`). Agrees.
- "At the divisors 1, 2, 4 and 8 of the modulus 8 with H=10000 these give the zero-line clause of AnalyticNumberTheoryPartI §0.16's `ModEightFiniteInput`": AnalyticNumberTheoryPartI `README.md:561` (its head, `roadmaps show AnalyticNumberTheoryPartI`) states the clause as "every zero of `L(s,χ)` with `0<Re s<1` and `|Im s|≤10000`, for every Dirichlet character `χ` modulo 8, has `Re s=1/2`", over all characters modulo 8, primitive or not, which is exactly what the imprimitive passage at the four divisors delivers.

**The other changed lines.** `README.md:84`–86 (scope) names the owner's three section titles (§0.2 "Bounded-height Riemann hypotheses", §0.3 "Platt's finite-conductor theorem in bounded-height form", §0.4 "Recorded verifications of the Riemann hypothesis", owner l.437, 499, 539). The table row at l.623 and the sentence at l.626–628 say the same as the contract, with "the divisors 1, 2, 4 and 8 of the modulus" replacing the earlier "primitive conductors 1, 4 and 8". §0.9 (l.907) and its *Needs:* line (l.937) cite "ExplicitZetaBounds §§0.2–0.4 for the zero-line clause of ModEightFiniteInput", consistent with the contract and the row. The reference entry at l.2385 now cites Platt2013v1 Theorem 7.1, p. 14 only, dropping Theorem 7.2, which this roadmap never used. The pull request's `Depends on` block lists #1954 ExplicitZetaBounds and no longer lists ComputationalNumberTheory.

**Source locator in the diff.** Platt2013v1 (arXiv 1305.3087v1, cache): Theorem 7.1 is at line 955, between the page-14 marker (line 906) and the page-15 marker (line 967), so "Theorem 7.1, p. 14" is right. It states GRH for the L-functions of primitive characters of modulus q ≤ 400 000 to height max(10⁸/q, 7.5·10⁷/q + 200) for even q and max(10⁸/q, 3.75·10⁷/q + 200) for odd q (lines 955–963), which is the owner's `plattHeight`, and `H(q) ≥ 10⁸/q` as the contract says. The owner cites the same theorem number in the published version (`platt2016grh` Theorem 7.1, its l.642), so the preprint and published numberings agree for this theorem.

**Seeded sample.** None of the fifteen seeded targets (§§0.1, 0.4, 0.7, 1.3, 1.4, 1.10, 1.12, 2.5, 3.2, 4.6, 5.1, 5.2, 5.7, 6.3, 7.3) falls in the diff, which touches the scope paragraph, the AnalyticNumberTheoryPartI table, the ExplicitZetaBounds contract, §0.9 and the Platt reference; none of them cites the zero-line clause (grep for "zero-line", "ModEightFiniteInput", "mod-eight": l.623–627, 645, 691–692, 906–910, 934–939, 2350 only). They were verified in r4 and r5 and are untouched; the one locator the diff touches is checked above.

**Gate, build, dependencies, elaboration.** The gate re-run on this head with the job's merge order:

```text
gate ErdosProgressionPowers: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

(The same command without `--order` uses the configured order, which still places ErdosProgressionPowers at position 54, before its suppliers, and prints twelve UPWARD lines for the suppliers this pull request has always named, ExplicitZetaBounds among them at l.623, 674, 936; with the job's order, where this roadmap is line 272 after EllipticCurveModularityPartII at 271, every edge is downward. The worker's own gate reported `depcheck=0 OK`.) The dependency check printed:

```text
depcheck: 238 roadmaps, 2349 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. `git diff --stat origin/main...HEAD` outside the folder is empty; since aaab8ad only `README.md` changed (29 insertions, 20 deletions). `lake env lean` on `Suggested.lean` took 3 s and gave exactly the eight `declaration uses sorry` warnings (l.94, 105, 130, 143, 149, 155, 164, 172), nothing else; the 16 elaborated signatures of `scratch/signatures.md` are those of the previous report, none with a dropped binder.

**Computed adversarial pass.** The first five rows are new, for the changed passages; the rest carry forward the computations of r4, r5 and r7 for statements the diff leaves untouched.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| Imprimitive passage at q = 8 (l.679–684) | the four characters modulo 8: trivial, the lift of χ₄, the two primitive characters of conductor 8 | conductors 1, 4, 8, 8; divisors of 8 are {1, 2, 4, 8}; the lifted trivial character has L-function (1 − 2^{−s})ζ(s), extra zeros 2πik/log 2 with Re s = 0, outside 0 < Re s < 1 | GRH(f, 10000) for f ∈ {1, 2, 4, 8} covers all four characters |
| Platt heights at the two conductors (l.686–687) | q = 4 (even), q = 8 (even) | H(4) = max(2.5·10⁷, 1.875·10⁷ + 200) = 2.5·10⁷ ≥ 10⁴; H(8) = max(1.25·10⁷, 9.375·10⁶ + 200) = 1.25·10⁷ ≥ 10⁴; 4 ∈ [2, 13] | GRH(4, 10000) and GRH(8, 10000) follow by antitonicity, as the owner states |
| GRH(2, H) (l.688–689) | the characters modulo 2 | one character, conductor 1 ≠ 2, so not primitive; the universal statement over primitive characters is vacuous | holds for every H |
| RH(10000) from RH(10⁹) (l.689–690) | H = 10⁴ ≤ H' = 10⁹ | antitonicity: every zero with |Im| ≤ 10⁴ has |Im| ≤ 10⁹ | holds; GRH(1, 10000) = RH(10000) by the owner's second bullet |
| Platt2013v1 Theorem 7.1 locator (l.2385) | page markers | line 955 lies between line 906 (page 14) and line 967 (page 15) | p. 14 correct |
| Uniform Gram-row form (l.698–699) (r7) | x = y₁ = y₂ = e; orthonormal pair; empty family, C = 0 | 2 ≤ 2; 1 ≤ 1; 0 ≤ 0 | holds with equality on repeated vectors |
| Maximum-row form (l.700) (r7) | x = 1, y = (1, 2) in ℝ | rows 3, 6; 5 ≤ 6 | holds |
| Diagonal/off-diagonal form (l.701–703) (r7) | D = O = 1 equal unit pair; D = 1, O = 0 orthonormal; empty family D = −1 | 2 ≤ 2; 1 ≤ 1; D + O < 0 excluded | D + O ≥ 0 needed for the empty family |
| §3.3 application (r7) | Λ(m), χ_a on (k/2, k], |B| > 17 log k | (k log k/2)(k/(34 log k)) = k²/68; 1/68 = 0.014706 < 0.1239² = 0.015351 | matches |
| Frey curve sentence (l.57–62, 365–368) (r7) | A = 1, B = 3; A = 1, B = 2 | (a₂, a₄) = (2, −3); (1, −2) | one curve at the pin and in EllipticCurves |
| §1.2 `progressionFreyCurve` (r5) | (1,1,0,1,2); (2,1,0,1,2); (−3,2,0,1,2) | (a₂,a₄) = (2,−3); (1,−2); (4,3) | Checks hold |
| §1.2 degenerate (r5) | n = d = 0 | g = 0, y² = x³ singular; excluded by gcd = 1 | matches |
| §1.12 `HasFullRationalTwoTorsion` (r5) | X(X−1)(X+3); X³−2; X(X²+1) | 4, 1, 2 | Check correct |
| §1.12 singular Frey curves (r5) | `freyCurve 0 1`, `freyCurve 1 (−1)` | 2-torsion count 2, 2 | no junk positive |
| §1.12 `comparison_curve` (r5) | σ = id; ℓ = 0, 1; F := E_a | ℓ = 0, 1 outside H; F := E_a fails N_{E_a} = M_a when a prime is deleted | not vacuous |
| §0.1 `primitive_solution`, `H` (r4) | (1,24,3,35,2); (−3,2,4,3,2); (4,2,1,2,2); k = 0; k = 2 | 1225 = 35²; 9 = 3²; gcd 2; `0<0` false; `10⁸ ≤ 2` false | keep |
| §0.4 `smallPart` (r4) | (3,64), (2,27), (5,−12), (5,60), (5,0) | 64; 1; 12; 12; 1 | keep |
| §0.5 `A(k)` (r4) | k = 0,1,2,3,5 | ∅, ∅, ∅, {(0,1,2)}, 4 elements | keep |
| §0.6 `κ` (r4) | (0,1,1,2), (0,1,2,3), (1,2,2,3); (0,1,1,3) | −1, −2, −1; 2 ≠ 3 | keep |
| §0.8 (r4) | n=1, d=2, k=6, r=3; r=1000, n=1000, k=3 | I₃ = {1,4}, 2 ≤ 3; +1 needed | keep |
| §1.3 invariants (r4) | n = d = 1, (0,1,2) | 16(abc)² = 2304; c₄ = 208 | source's 64(abc)² is the misprint |
| §1.7 `deletionLevel` (r4) | 11a1 at ℓ = 5, 3; M = 33, 99 at ℓ = 3; ℓ = 0 | 1, 11; 11; 9; no deletion | keep |
| §1.9 headline (r4) | p = k prime; k = 10⁸ | p = k admitted; log(2⁷e^{1.000081k}) ≪ 10^k | keep |
| §1.11 (r4) | N = 1, 11 | μ(11) = 12, μ(44) = 72, F_K(11) = 9, G_K(11) = 169 | keep |
| §2.3 (r4) | ε = 0.002811 | (1−3ε)/8 = 0.123945875 > 0.1239 | keep |
| §2.4 (r4) | 𝔽₅, λ = 4 | #F_λ = 8, #F′_λ = 4 | keep |
| §2.7 `oddPart`, headline (r4) | N = 12, 16, 24, 48, 0; k = 5 | 3, 1, 3, 3, 0; `Ioc 2 5` = {3,4,5} | keep |
| §3.1 conductor comparison (r4) | N = 8, 24, 16 | 8 = 4·e^{θ(2)}; 24 = 4·e^{θ(3)}; 16 > 8 | keep |
| §4.1 (r4) | δ = 10⁻⁵ | 9 149 543 ∈ (10⁶, 10⁷) | keep |
| §5.7 (r4) | x = 64 | 8·64^{7/2} = 64⁴ = 16 777 216 | keep |
| §5.8 (r4) | N = 120; 3, 5, 1 | 15 = 120/8; 5 ≥ 2.47 | keep |
| §6.2 headline (r4) | d = 0; n = 0 | y·d = 0; y = 0 | keep |
| §6.3 range (r4) | (3,4),(4,3),(5,2),(4,2),(3,3),(3,2) | 2g−2 = 4, 18, 8, 0, 0, −2 | keep |
| §6.3 signed boundary (r4) | (−3,2), k = 4 | product 9 = 3² | keep |
| §7.1 headline (r4) | n = 1, k = 2; n = 4, k = 1 | 2 not a power; k = 1 excluded | keep |
| §7.3 (r4) | b = 2, n = d = y = 1, k = ℓ = 2; b = 0 | 2 = 2·1²; b = 0 excluded | keep |

**Headlines and padding.** Unchanged since r5: the eight headline theorems of README l.722–726 (§1.9, §1.12, §2.7, §6.2, §6.3 twice, §6.5, §7.1) are stated in `Suggested.lean`, and the docstring names §1.10 (the residual Artin conductor) as not statable at the pins. The Lean file is byte-identical to the head of r5 and r7, so the one-tactic probes of r4 and r5 stand (seven probes on `comparison_curve`, none closing).

**Library declarations opened at the pins.** None newly needed by the diff; the diff names only Mathlib's `riemannZeta` and `DirichletCharacter.LFunction`, both used by the owner's `Suggested.lean:108` and 114 which elaborates at the same Mathlib pin.

**Cross-roadmap citations resolved this round.** ExplicitZetaBounds #1954 §§0.2, 0.3, 0.4 and 0.4b and its `Suggested.lean:107`, 113, 119, 126 as above; AnalyticNumberTheoryPartI §0.16 (`README.md:557`–561 at its head). The resolver's leads are unchanged from r7: "ErdosSelfridge1975, §2.1" is a source locator, the five `Conductor.*`, `IntegralModel.residualSS` and `ContinuousRep.exists_stable_lattice_iff` names are supplier README API names (ArithmeticGaloisRepresentations, EtaleCohomologyFoundations) and the three `SieveGram.*` names are SieveMethodsAndPrimePatterns `Suggested.lean:57`, 62, 69 at #1495. ComputationalNumberTheory is no longer cited, so its dropped §4.22 no longer matters to this roadmap.

**Ownership and overlap.** `scratch/overlaps.md` lists no other pull request changing this roadmap, no cited id an open revision drops, and no id this pull request drops. The bounded-height hypotheses and the Platt record have one owner, ExplicitZetaBounds, which ComputationalNumberTheory's scope paragraph defers to (r7 witness); this roadmap restates none of them.

**Remarks on untouched text (no change requested).** The pull request description's hand-written list of "direct suppliers" still names ComputationalNumberTheory and does not name ExplicitZetaBounds or SieveMethodsAndPrimePatterns, while its `Depends on` block is right; the description is regenerated by the worker and is not part of the folder. The reference entry `Bombieri1987` (l.2384) is cited by no target, as noted in r7.

## Not verifiable

- **Green2026**: no legal source is known; consumed only through AnalyticNumberTheoryPartI §0.34c, untouched by the diff.
- **Waived and uncertified texts.** IwaniecKowalski2004, RosserSchoenfeld1962, Tenenbaum1995 and RahmanRoth are waived and cited by locator; Mazur1978 is uncertified; Faltings1983 is in the cache as an unreadable scan (listed in `needs-references.toml` by the worker). None is touched by the diff.
- **Gap registration.** The board package has no `design/plan.json`, so whether the four `gap:` slugs of the AnalyticNumberTheoryPartI contract are announced on the supplier's job could not be checked; they are unchanged by the diff.

## Source issues

- none
