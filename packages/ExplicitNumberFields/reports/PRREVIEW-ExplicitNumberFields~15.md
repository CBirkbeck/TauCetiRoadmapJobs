# Review of ExplicitNumberFields (pull request #3027 at 8d0b573)

**Verdict:** accepted

**Summary.** Accepted. The change adds §0.7, Serre's bound for the relative discriminant of a finite Galois extension of number fields. It is stated at the generality of Serre's Proposition 5 (IHÉS 1981), with correct locators. Its four Checks and its route recompute correctly, and the two supplier sections it cites exist on main and say what it uses. The fifteen sampled targets in the rest of the roadmap agree with their sources wherever those sources can be read. There are three small corrections and one format note, none blocking: an overview sentence that misplaces §0.7, a rounded threshold in a Check of 3.5, and a description that does not mention this roadmap's new section and supplier. The one question left for a human is that the source cited most often could not be read.

## C01 — The guide to the layers counts Serre's bound among what "every later statement mentions", but no later statement of this roadmap uses §0.7.

A reader who looks for the use of 0.7 in Layers 1–7 finds none. The section is cited only in Layer 0's Dependencies and in the supplier contract, and its one consumer is ThetaChainsOnDefiniteUnitaryGroups 2.6, through its *Corollary of:* line. In "How to read the build" (lines 59–62), the sentence "Layer 0 fixes the invariants and predicates every later statement mentions: … the least primitive roots, and Serre's bound for relative discriminants" would be accurate as "… and the least primitive roots; it also proves Serre's bound for relative discriminants, which no later layer uses and which other roadmaps consume". Downstream consumers (line 2978) could also name ThetaChainsOnDefiniteUnitaryGroups 2.6 for 0.7.

## C02 — In the Checks of Garcia–Lee's Mertens lemma (3.5, line 1354), the threshold for the constant of `5/x²` is `4.9498`, not `4.95`.

At `x = 7` the left side is `0.2489635` and Schoenfeld's term is `0.1479470`. The bound therefore holds exactly when the constant `c` satisfies `c/49 ≥ 0.1010165`, that is `c ≥ 4.9498`. A constant in `[4.9498, 4.95)` does not fail, although the sentence says it does. Write "below `4.9498`".

## C03 — The description does not say that this pull request adds a section and a supplier to ExplicitNumberFields.

Part 1 says that 50 existing roadmaps receive sections, and "For reviewers" counts 13 new supplier relations, but neither names this roadmap. It gains §0.7, the general theorem behind ThetaChainsOnDefiniteUnitaryGroups 2.6, and a new supplier, Completed/NumberFieldArithmetic §§4.2 and 6.4. One line in part 1 would cover it: "ExplicitNumberFields gains §0.7, Serre's bound for relative discriminants (Serre 1981, Proposition 5), with Completed/NumberFieldArithmetic §§4.2 and 6.4 as a new supplier."

## N01 — The *Needs:* line of 0.7 (line 755) cites Completed/NumberFieldArithmetic by section, although the pinned Tau Ceti has the declarations.

`relDiscr` is `TauCeti.relDiscr`. The tower law and the comparison with `NumberField.discr` are `TauCeti.NumberField.relDiscr_tower` and `TauCeti.NumberField.relDiscr_int_ringOfIntegers`. The different bound of §6.4 is `IsDedekindDomain.HeightOneSpectrum.multiplicity_differentIdeal_le_ramificationIdx_sub_one_add_multiplicity_span`. Naming them there, or under From Tau Ceti, would give an implementer a starting point.

## Verified sound

### Adversarial table

| Statement | Instances | Values (left vs right) | Result |
|---|---|---|---|
| 0.7, (6), line 732 | `E = ℚ(i), ℚ(√5), ℚ(ζ₈)` over `ℚ`; `E = K` | `1.386 ≤ 2.079`; `log 5 ≤ log 5 + 1.386`; `8 log 2 ≤ 11 log 2`; `0 ≤ 0` | true; first term attained at `ℚ(√5)` |
| 0.7, root form, line 735 | `ℚ(i)/ℚ`; general | `0.693 ≤ 0.347 + 0.693`; `n([E:K]−1)/[E:ℚ] = 1 − 1/[E:K]` | equivalent to (6) given `serre1981` (3), line 221 |
| 0.7, non-Galois Check, line 751 | `ℚ(p^{1/N})`, `N = p^m`, Eisenstein `x^N − p` | `d_E = N^N p^{N−1}`; Prop. 4 bound `(N−1) log p + N log N` | equality, as `serre1981` lines 284–288 |
| 0.7, route, lines 737–742 | Galois `g` primes, `efg = [E:K]`; `Σ_{𝔭∣p} f ≤ n`, `Σ ef = n` | `v_𝔭(𝔡) ≤ [E:K] − 1 + [E:K] e(𝔭/p) v_p(e)` | gives `(n([E:K]−1) + [E:ℚ] v_p([E:K])) log p` |
| 0.7, consumer use | ThetaChainsOnDefiniteUnitaryGroups 2.6, `M/F` unramified outside `n` | `(1 − 1/[M:F]) Σ_{p∣n} log p ≤ log n` | `log rd(M) ≤ log rd(F) + log(n[M:F])` follows |
| 0.3, class-number lemma | `ℚ(√−14)`, `b = 2.9`, `b_K = 4.764`; `ℚ(i)` | `3 < 4` at `b = 2.9`; `8 ≥ 4`; `1 = h` | true; admissibility needed |
| 0.3, Nicolas–Tenenbaum | `n = 2, x = 10`; `x = 1, n = 1, 2, 3`; `x = 7.483` | `27 ≤ 33.03`; `1 ≤ 1, 1, 2`; `16 ≤ 22.54` | true; integral `(x/n!)(n y^{n−1} + yⁿ − (n−1)ⁿ)` rederived |
| 0.4, `h⁻` formula | `ℚ(i)`, `ℚ(√−3)`, `ℚ(√−5)`, `ℚ(ζ₈)` | `1, 1, 2, 1.000`; wrong regulator power gives `1/2` | true |
| 0.4a, continued Euler product | `ℚ(√5)` and `ℚ(i)` at `0`; `s = 1` | `(−1/2)·0 = 0`; `−1/4 = −h/w`; `ζ(1)κ ≠ 0 = dedekindZetaC 1` | true; pointwise exclusion at `1` needed |
| 1.1, Rademacher | `ℚ`, `η = 1/2`, `s = 1/2, −1/2`; `ℚ(i)`, `s = 1/2 + 10i` | `1.460 ≤ 11.49`; `0.20789 = 0.20789`; bound `66.5` | true; equality at corner |
| 1.1a, remainders | `z = 3, N = 1`; `z = 1 + i`; trigamma `z = 0.999, N = 50` | `5/6 ≤ 2`; `0.6017 ≤ 1`; `0.01980 ≤ 0.02000` | true; `min(1, Re z)` needed (`2/3 < 5/6`) |
| 3.5, Mertens lemma | `x = 1.048, 2, 7, 13.5` | `2.7986 < 4.7134`; `0.6050 < 1.4210`; `0.248963 < 0.249988`; `0.125980 < 0.155306` | true; threshold `4.9498` (C02) |
| 3.6, two-sided bounds | `ℚ(√−5)`, `ℚ(√−14)`, cubic `−23` | `0.0845 ≤ 1.405 ≤ 19.48`; `0.00362 ≤ 1.679 ≤ 454.9`; `0.00349 ≤ 0.3684 ≤ 1402` | true; `10595` and `24.1` at `5.4·10⁶` recomputed |
| 4.1, Trudgian's count | constants against HSW Table 1; `ℚ, T = 15`; `ℚ(i), T = 100` | `0.021(…) + 2.362n − 0.487 > 0`; `2.62 ≤ 10.67`; `[150, 166] ⊂ 156.64 ± 19.51` | true |
| 4.3, Louboutin's Thm. 3 and 6, Cor. 4 | `m = 1, 2`; `ℚ(√5)`; `ℚ(ζ₇)⁺` | `c₁ = 0.3431`, `c'₁ = 0.6207`, `e^{1.2416} = 3.46`; `1.609 > 1.464`; `σ₂ = 0.7246` | true; odd-multiplicity form is what the proof gives |
| 4.10, repulsion | `ν ≤ 1/2`, `d_K ≥ 3`; constants | `β₁ ≥ 1 − 1/(2 log 3) = 0.545 > 1/2`; `14.144/2 = 7.072` | consistent; sources not readable |
| 5.1, `h_K R_K` bounds | `ℚ(√5)`, `ℚ(i)`, `ℚ(√−3)` | `0.4812 ≤ 2.446`; `1 ≤ 2.40`; `1 ≤ 2.47` | true; third bound equals `louboutin2005` Thm. 10 (13) |
| 5.3, Bordellès | `ℚ(√−14)`; `ℚ`; `ℚ(√5)`, `a = 1.243`; cubic `−23` | `4 ≤ 11.2, 21.50, 60.2`; `1 = 1`; `1 ≤ 4.03`; `1 ≤ 94.3` | true; ratio `0.90` (`n = 26`), `2.20` (`n = 27`) |
| 5.7, Banks | imaginary quadratic; conversion | `h ≥ C√d/(4π² log d)`; `2^{r₁}(2π)^{r₂} ≤ (2π)ⁿ`, `w ≥ 1` | derivation consistent; sources not readable |
| 6.5, `p`-th powers count | `p = 3, ε = 1/2, z = 4, X = 1000`; `X < 3` | `111 > 54.77`; `≤ 1 < √3 X^{1/2}` | `X < p` needed; source misprinted |
| 6.5, constant `A(10¹²)` | Lapkova's odd bound at `q = 10¹²` | `0.188846·√q log q = 5.21801·10⁶` both sides; `0.16` is `15%` below | correct |
| 6.5, small `p` and `ω` | `p = 2, 3`; first `105`, `106` primes | `3 > 1.986`; `2 < 2.067, 2.080, 2.967`; `10^{233.42}`, `10^{236.18}` | odd `p` needed; `ω(p−1) ≤ 105` below `10²³⁴` |
| 7.5, Debaene | `L = ℚ`, `x = 3, 10⁶, 2, 2.6, e`; cubic `−23` as `K` | `15.05 ≥ 2`; `7.09·10⁵ ≥ 78498`; `−56.8 < 1`; `0.13 < 1`; `5.44`; factor `1.4·10⁻⁷` | `x > e` and `log⁺` both needed |
| Headline: Debaene's count | `ℚ(i)`, `x = 10` | `9` ideals vs `7.854`, error `1.146`; bound `2^{40}√10` | true, as the Summary says |
| Headline: Friedman | `ℚ(√5)`, `ℚ(√−3)` | `0.1620 ≤ 0.4304`; `0.2092 ≤ 0.6046` | true |
| Headline: Stark | `ℚ(ζ₇)⁺` (`α = 4`); cubic `−23` (`α = 24`) | `0.001488 < 0.3003`; `0.000308 < 0.3684` | true |
| Headline: Bordellès | rows of 5.3 | `1 ≤ 94.3` at cubic `−23`, `n = 1` gives `1 = 1` | true |
| Headline: Ahn–Kwon | `ℚ(i)/ℚ`, `C` complex conjugation | least prime `3` (inert) `≤ 4^{12577}` | true |
| C01 overview sentence | citations of 0.7 in this README and at this head | none in Layers 1–7; ThetaChainsOnDefiniteUnitaryGroups 2.6 only | commentary inaccurate |

### Counts

- **Previous review.** No findings, so nothing needed repair. This head changes only the README: §0.7, its supplier contract and reference, and three rewritten sentences (the guide, the Layer 0 Dependencies, the Scope).
- **Source locators checked against the text (45).** `serre1981` lines 146–288 (Propositions 1–5, (1), (3), (6), the Exemple of §1.4); `bordelles2002` lines 72–91, 185–204, 344–359; `bordelles2006` lines 61, 153–161; `lee2023ideals` 173–179; `sunley1973` 148–158; `dlmf` line 256 (5.7.6); `pntplus` line 355; `garcialee2022artin` 24–29, 62–74, 121–147, 886; `trudgian2015` 17, 25–27; `hasanalizadeshenwong2022` 27, 37–77; `louboutin2015ijnt` 27–91; `louboutin2017` 25–35; `louboutin2005` p. 560 and Theorem 10 (the formulas, which are images in the scan, read by OCR); `kerrmcgowntrudgian2020` 25–297; `debaene2019` 69–87, 1251–1280; `garcialee2022mertens` 1215–1262.
- **Library declarations opened at the pins.** Mathlib: `differentIdeal` (`RingTheory/DedekindDomain/Different.lean:481`), `Ideal.ramificationIdx` (`RingTheory/RamificationInertia/Ramification.lean:54`), `NumberField.discr` (`NumberTheory/NumberField/Discriminant/Defs.lean:36`), and `Analysis/SpecialFunctions/Gamma/Digamma.lean`, which has no series for `ψ`. Tau Ceti: `TauCeti.relDiscr` (`RingTheory/DedekindDomain/Discriminant/Basic.lean:33`), `TauCeti.NumberField.relDiscr_int_ringOfIntegers` and `relDiscr_tower` (`NumberTheory/NumberField/Discriminant/Relative.lean:37, 43`), and the wild different bound (`NumberTheory/NumberField/LocalGlobal/Different/Wild.lean:47`).
- **Cross-roadmap citations resolved.** Completed/NumberFieldArithmetic §4.2 (on main) has `relDiscr`, its tower law and its value over `ℤ`. Its §6.4 has `v_P(𝔇) = e − 1` in the tame case and `≤ e − 1 + v_P(e)` in the wild case. At this head ZerosOfLFunctions and AnalyticNumberTheoryPartI only add headings, so no id cited here is dropped. Every supplier is on main. ConsequencesOfTheRiemannHypothesisForDirichletLFunctions cites §§0.5, 4.7 and 6.4, and all three exist.
- **Dependency check.** `depcheck: 132 roadmaps, 1472 edges, 0 problem(s)`, exit code 0; no UPWARD, CYCLE or `moved:` line.
- **Automatic checks.** The automatic checks all passed at this head. My rerun of the full gate, without the pull request's list of folders, flagged only files outside this folder. All of them are in folders the pull request owns: every changed path was checked against that list.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with 16 warnings, all "declaration uses `sorry`". The file is unchanged from main. The elaborated types of all 21 declarations were compared with the README statements; no binder was lost and nothing changed. In the one-tactic probe (`rfl`, `infer_instance`, `simp`, `norm_num`), 16 of 16 theorems still need `sorry`.
- **Record.** Comparing the merge base with this head: 8 layers in each, none removed or retitled; one section added (0.7), no item removed.

Overlap check: read ZerosOfLFunctions, LFunctions, SpecialFunctionsGamma, LiCoefficientsArithmeticFormula and ArtinRepresentations (open by vocabulary); ExplicitMultiplicativeFunctions, ExplicitPrimeCounting and GeneralizedRiemannHypothesisFromWindowBounds (main); and Completed/NumberFieldArithmetic. Nothing is shared. Serre's bound has no other owner, and ThetaChainsOnDefiniteUnitaryGroups 2.6 cites §0.7. `relDiscr` and the different bound belong to Completed/NumberFieldArithmetic and are cited. SpecialFunctionsGamma consumes the digamma series of 1.1a and cites it. `GRHMod` is cited from §0.5, not restated.

Source independence: 24 passages compared with 16 sources. None is shared: the longest common run is 5 words, in the statement of the class-number lemma against `bordelles2006` line 61, which the mathematics forces. Route of 0.7 against `serre1981` §1.3: same idea, organised by rational prime rather than by place, English against French, no clause-by-clause rendering. Largest share: `dglsw2025`, 18 of 302 source citations, not read (manifest: uncertified). It is cited only in 4.8, 4.10 and *Computational hypotheses*, so no run of the eight layers can follow its contents. The next readable source is `garcialee2022mertens` (11), whose §2 (Mertens' theorems) and §3 (residue lower bounds) correspond only to 7.1 and to 3.3 and 4.7: independent.

Research link: The roadmap states the explicit residue, zero-region, class-number and Chebotarev bounds of Stark (1974), Louboutin (2000–2017), Kadiri–Ng–Wong (2019), Ahn–Kwon (2019) and Debaene (2019). These are used for class-number determinations and least-prime problems. §0.7 is Serre's (1981) discriminant bound from his effective Chebotarev paper. Rests on the README (Summary, §§4.7, 7.4–7.5) and `serre1981` §1.

## Not verifiable

- `rademacher1959` (uncertified): 1.1 was checked against its restatements in `lee2023ideals` (lines 173–179) and `sunley1973` (lines 148–158).
- `washington1997` Theorem 4.10 (uncertified): the divisibility in 0.4 was checked through its route only.
- `louboutin2001` Theorem 1 (uncertified): checked as quoted in `louboutin2005` on p. 560.
- `dglsw2025`, `kadiringwong2019`, `kadiring2012` (uncertified): 4.10 was checked for internal consistency only.
- `banks2026brauersiegel`, `stark1974` (uncertified): 5.7 was checked through its derivation only.
- `gglm2026`, `palojarvisimonic2026` (uncertified): the bounds of 3.6 were checked numerically only.
- `chen2022`, `mcgownsorenson2024` (uncertified): Chen's criterion and McGown–Sorenson's bound in 6.5 were not compared with a text.
- `dlmf` 5.15.1: the cached DLMF text is §5.7 only; the trigamma series of 1.1a is the standard one.

## Source issues

- **Misprint** in louboutin2015ijnt at Corollary 4, proof, p. 2: the source says the argument starts from the sign of `ζ_K` at `1 − 2/log d_K`; it should be `1 − c₂/log d_K`, the corollary's abscissa; affects nothing.
- **Gap** in louboutin2015ijnt at Corollary 4, p. 2: the source says that for Galois `K` of odd degree, `ζ_K` has no real zero in `σ ≥ 1 − c₂/log d_K`; the proof excludes only zeros of odd multiplicity, and Theorem 3 at `m = 2` allows a double zero. It should claim only that there is no real zero of odd multiplicity there; affects a stated result.
- **Misprint** in louboutin2017 at Theorem 2, p. 1: the source says `S₀ = 0.45433…` is the only root of `S⁴ + 2S³ − 2S² − 4S + 2` in `[0, √2]`; a second root `1.22133` lies there, so it should be `[0, 1]`; affects nothing.
- **Error** in kerrmcgowntrudgian2020 at Lemma 3, p. 3: the source says the middle term of `A(q₀)` is `0.8204/q₀^{1/2}`; dividing Lapkova's bound by `√q log q` gives `0.8204/log q₀`, so `A(10¹²) ≈ 0.1888` and not `≤ 0.16`; affects the proof.
- **Error** in kerrmcgowntrudgian2020 at Theorem 2, p. 2: the source says `N₂(X) ≤ p^{1/2} X^ε` for every `X`; its Lemma 6 needs the set in `[1, p)`, and at `p = 3`, `ε = 1/2`, `X = 1000` the count is `111 > 54.8`. It should assume `X < p`; affects a stated result.
- **Misprint** in kerrmcgowntrudgian2020 at Theorem 1, p. 2: the source says `h(p) < p^{0.99}` for all primes; `h(2) = 3 > 2^{0.99}`, so it should say all odd primes, as its introduction assumes; affects nothing.
- **Error** in debaene2019 at Theorem 1, p. 2: the source says the bound holds whenever `x (log x)^{−5n²} ≥ c_K`; for `L = ℚ` (`c_K = 1`) this admits `x = 2`, where the bound is `−56.8 < π(2) = 1`. It should also require `x > e`; affects a stated result.

## For the human reviewers

- **Not tested.** The source cited most often in the README, `dglsw2025` (18 of 302 citations, in 4.8, 4.10 and *Computational hypotheses*), is recorded as uncertified and was not read. Wording and arrangement were not compared with it.
