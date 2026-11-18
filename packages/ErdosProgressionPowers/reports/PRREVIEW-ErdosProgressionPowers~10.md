# Review of ErdosProgressionPowers (pull request #1336 at a10fa87)

**Verdict:** needs changes

**Summary.** Changes are needed, for one reason: the four numerical inputs that the README declares as gaps against AnalyticNumberTheoryPartI (the Schoenfeld θ bound, the Rosser–Schoenfeld π pair, the mod-eight θ bound and the prime-product bound, all below exp(10000)) are already owned by ExplicitPrimeCounting, which is on main and earlier in the merge order, so the gaps ask for what a supplier provides and the sentence saying no supplier proves them is false. The mathematics of the layers, the worked examples and the eight Lean statements were recomputed and stand. There are four small corrections and one format note, none blocking. Two points are left for the human reviewers (the unrefereed sources behind the Landau–Siegel input).

## R01 (P2) — The four declared gaps ask AnalyticNumberTheoryPartI for proofs that ExplicitPrimeCounting, on main, already owns

An implementer reading the supplier contracts is told that the literal constants are unproved anywhere and waits on a supplier that will never state these proofs, while the roadmap that does state them is not cited; the headline theorems are then described as conditional on inputs that have an owner. The README says (line 2022) "The clauses no supplier proves are declared as the following gaps, one per input", and declares `gap:schoenfeld-theta-finite-range`, `gap:rosser-schoenfeld-prime-count-finite-range`, `gap:mod-eight-theta-finite-range` and `gap:prime-product-finite-range` with supplier AnalyticNumberTheoryPartI (lines 2027–2033; cited at lines 302–304, 321–322, 1297, 1384, 1438, 1489–1492 and in the table rows at 2008–2011; the Summary, line 9, says the theorems are "conditional on those inputs until it proves them").

On main, `TauCetiRoadmap/ExplicitPrimeCounting/README.md` states (lines 1143–1145) that the four finite-range inputs of AnalyticNumberTheoryPartI are proved in its §3.2 (`SchoenfeldFiniteRangeInput`, lines 2544–2549: θ(x) = 0 below 1, θ(x) < x up to 10¹⁹ from its recorded Büthe range, and the Dusart row b = 30 above e³⁰), §3.5 (`RosserSchoenfeldFiniteRangeInput`, lines 3046–3049), §4.3 (`PrimeProductFiniteInput`, lines 3526–3529: 0.2615 + 1/(2 log² 10⁸) < 0.27) and §6.1 (the theta clause of `ModEightFiniteInput`, lines 3995–3998, from the Ramaré–Rumely row (8, 0.002811, 10¹⁰) under GRH(8, 10000)); its ownership paragraph (lines 204–210) says it "adds only the theorems that prove those inputs from its own hypotheses". ExplicitPrimeCounting precedes this roadmap in the merge order, and AnalyticNumberTheoryPartI keeps the four inputs as hypotheses and proves none of them.

The smallest change: replace the four "What AnalyticNumberTheoryPartI must provide (gap:…)" paragraphs and the sentence at line 2022 by a contract `### From TauCetiRoadmap.ExplicitPrimeCounting` citing §§3.2, 3.5, 4.3 and 6.1 for the four inputs, with the hypotheses those sections carry (its recorded finite-range and table propositions and its own gaps, which are cited, not redeclared; the GRH(8, 10000) hypothesis of §6.1 is the ExplicitZetaBounds §0.3 record this README already consumes). Then replace the four slugs by those citations in the `*Needs:*` lines of §0.9 and §7.1, in the table of the AnalyticNumberTheoryPartI contract and in "Worked examples and integration requirements", and reword the Summary sentence so that it names the hypotheses that actually remain.

## C01 — The EC.6 row and two citations send the geometric-torsion carrier to EllipticCurveModularityPartII §5.1, which defers it to §2.0

A reader who follows "§5.1 (EC.6) for the geometric-torsion carrier" (§1.12, lines 583 and 597; the EC.6 row, line 2048; Scope, line 1532) finds a section whose first sentence says the carriers `GeometricTorsion`, `torsionModule` and `torsionRepresentation` "are defined in §2.0", and the Checks at n = 1 and n = 0 that the second Check of §1.12 (line 592) attributes to §5.1 are the Checks of §2.0. At the head of that roadmap's open pull request, §5.1 holds only the predicates `FullRationalTwo` and `RationalTwo`; its own consumer paragraph lists "§2.0's `GeometricTorsion` and `torsionRepresentation` and §5.1's `FullRationalTwo` (EC.6)". Cite §2.0 for the torsion carrier, its representation and those Checks, and keep §5.1 for the full-two-torsion predicate.

## C02 — Nothing in this head consumes SieveMethodsAndPrimePatterns, but the layer numbers still leave room for the layer that did

The layers are numbered 0, 1, 2, 4, 5, 6, 7 and Layer 4 begins at §4.3, with no sentence saying that no Layer 3 and no §§4.1–4.2 exist. On main, `TauCetiRoadmap/SieveMethodsAndPrimePatterns/README.md` line 4131 names "ErdosProgressionPowers (Layer 3)" as the consumer of its §0.4 Gram inequalities, and the pull request's `depends-on` block lists SieveMethodsAndPrimePatterns; the README cites that roadmap nowhere. A reader arriving from either place looks for a layer that is not there. Either renumber, or say in one clause of "How to read the build" that the numbers 3, 4.1 and 4.2 are not used; the block would be regenerated, and the consumer note on main is a separate revision of that roadmap.

## C03 — In §5.1 the bare "§1.7", "§1.4" and "§§1.4a–1.4d" are sections of AnalyticNumberTheoryPartI, not of this README

"Consume §1.7's effective density estimate" (line 890) and "Consume §1.4 and §§1.4a–1.4d's truncated half-interval formula" (line 895) read, in a README whose own §1.7 is the first-family reduced-level bound and whose §1.4 is the generalized Fermat identity, as internal references. The supplier's §1.7 is its Selberg zero-density input and its §1.4 the half-interval explicit formula (checked on main: the statement at Q, T ≥ 2, 1/2 ≤ σ ≤ 1 and the formula for k ≥ 4, 2 ≤ T ≤ k are as restated here). Prefix the roadmap name, as the `*Needs:*` line of the same section already does.

## C04 — The Layer 7 introduction still speaks of two proof routes

"neither is a shortcut in either unconditional proof route" (line 1181) describes a text with two routes to the exponent bound; this head proves it once, by Layer 5. "neither is used in the proof of the exponent bound" would be true of the head. The same paragraph's "Specify the two assertions" is fine.

## N01 — The locator for the first-family discriminant points at a display with a different constant

§1.3 states Δ(E) = 16(abc)² = 64 t_i² t_j² t_h²/g⁶ and cites "Lemma 3.2 discriminant display, p. 361; native normalization". The source's display has 64(abc)² (see Source issues); the README's value is the correct one for Y² = X(X−a)(X+c) (at a = 1, c = 3: 16·9·16 = 2304 = 16·12²). A clause saying that the printed constant differs by 4 would save a reader the recomputation.

## Verified sound

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| §0.2 gcd of terms | (n,d)=(2,1), i=0, j=2; (4,3), i=0, j=2 | gcd(2,4)=2 ∣ 2; gcd(4,10)=2 ∣ 2; BS20 line 250–251 (Lemma 3.1(i), p. 360) | holds; README drops the source's unused nontriviality hypothesis |
| §0.5 triples A(k) | k=0..3, 5; (i,i,i) | A(3)={(0,1,2)}; A(5) has (0,1,2),(1,2,3),(2,3,4),(0,2,4) = 4; BS20 line 268 | agrees |
| §0.6 quadruples I(k) | I(3); (0,1,2,3); (1,2,2,3); (0,1,1,3) | κ = −1, −2, −1; sums 2 ≠ 3 excluded; BS20 lines 310–320 | agrees, κ < 0 |
| §0.9 divisor bound, prime estimates | n=4; x=2, 4; ε → ε/2 | τ(4)=3; θ(2)=log 2, ψ(4)=2 log 2+log 3; C n^(ε/2) ≤ n^ε iff n ≥ C^(2/ε); BS20 lines 988, 1478 | holds; supplier sections exist on main |
| §1.5 second family | n=d=1 and n=−3, d=2 at (0,1,1,2) | A=3, B=4, κ=−1, A−B=−1=κd²; A=−3, B=1, A−B=−4; Δ=16a₄²(a₂²−4a₄)=−64κ³A²B; BS20 lines 312–325 | agrees |
| §1.9 `half_primes_divide_d` | quadruple (i,i+1,i+p−1,i+p); k=0,1,2 | κ = i(i+p)−(i+1)(i+p−1) = −(p−1), p ∤ κ; H false for k < 10⁸; BS20 lines 395–415 | matches Lemma 4.1, k ≥ 10⁸, ℓ > exp(10^k) |
| §2.2 case partition | u = 3, −1, 2, 0 | 3 in neither branch; −1=−1²; 2=2·1²; 0 in both; BS20 lines 517–521 | agrees |
| §2.4 Case II square test | p ≡ 5 mod 8; 𝔽₅, λ=4; t=v=1/2 | 8 ∥ p+1−a ⇒ a ≡ 6 mod 8, 4 ∥ p+1+a; counts 8 and 4; point (1+i,−1+i), both sides −2i; BS20 lines 684–696 | agrees |
| §2.5 CM exclusion | j from c₄³/Δ; a=b; a=c | 16³(a²−bc)³/(16(abc)²)=2⁸(a²−bc)³/(abc)²; 3n=−(2j+i)d ⇒ d ∣ 3; d=0; BS20 lines 776–788 | agrees |
| §2.7 `character_family` | constants; N=12, 16, 24, 48 | (1−3·0.002811)/8=0.123945875, margin 0.000045875; oddPart 3, 1, 3, 3; 12≤24, 16>8, 24≤24, 48>24; BS20 lines 499–507 | agrees; extra clauses follow from (9) |
| §4.3 deletion | n=d=1, k=5, A=(1,2,3,4,1); k=4, A=(1,2,1,2) | removes 3 (p=2), 2 (p=3): J₁={0,1,4}, product 2 ∣ 24; least maximiser index 1; BS20 lines 1293–1299 | agrees |
| §5.1 analytic inputs | width c ≤ c₀/2; ρ=0 kernel; density at Q=k⁴ | closed strip ⊂ strict strip; ∫_{k/2}^k dx/x = log 2; (k⁴)^((5+ε)·3 log log k/log k)=(log k)^(60+12ε) | holds; supplier §§0.6, 1.4, 1.7 read on main |
| §5.2 exceptional moduli | k=16, c=0; k=0, 1; χ₅ | 1−3 log(log 16)/log 16 = −0.103; T=1; exponent 0/0=0; L(0,χ₅)=−χ₅(0)/2=0; BS20 lines 1408–1416 | agrees |
| §5.5 bad indices | Q={1000}, n=1000; Q={8}, n=d=1 | 1000 ≥ 10/2; 8^(1/3)/2=1 so r=1 admissible; BS20 lines 1468–1471 | agrees |
| §§5.6–5.8 | divisor sum; blocks; three gcds | τ(q)(2k q^(−1/3)+1) ≤ C(k q^(−1/4)+k^(1/3)); k/3−o(k) > 2k/7; k^(k/m) < k^(7/2); 8x^(7/2) ≤ x⁴ iff x ≥ 64; ∏gcd ≥ N/8 | holds |
| §6.2 `effective_prime_bound` | d=0; y=0; (1,24,3); (−3,2,4) | (±1)^k; 0; 1225=35², ℓ=2; 9=3², ℓ=2; BS20 lines 107–109 | agrees with Theorem 2; k₀ ≥ 5 harmless |
| §6.3 `fixed_exponent_finiteness` | (k,ℓ)=(5,2),(3,4),(4,3),(4,2),(3,3) | 2g−2=ℓ^(k−2)(kℓ−2ℓ−k): 8, 4, 18, 0, 0; g=5, 3, 10, 1, 1 | hyperbolic iff 2ℓ+k < kℓ |
| §6.3 `positive_fixed_exponent_finiteness` | k+ℓ ≥ 6 non-hyperbolic pairs; n,d < 1500 coprime | only (4,2), (3,3); no four-term square, no three-term cube found; DG95 lines 325–337 | agrees with Corollary 2.1 and Euler |
| §6.5 `fixed_length_finiteness` | y=±1; Y fixed, y^r=Y | three distinct nonzero terms not all ±1; r ≤ a valuation of Y | holds given §§6.2–6.4 |
| §7.1 `consecutiveProduct_not_perfectPower` | (17) for 4 ≤ k < 1000; (19) for primes 5 ≤ ℓ ≤ 2000; (18) for 1000 ≤ k < 30000 | 0 failures each with the README's lower bounds; F ≥ 255 and 4853; 64770 > 45927; 23546756 > 19545219 | agrees; ErdosSelfridge1975 lines 32–34, 356–359, 374 |
| §7.2 ErdosThreshold | K=0, 3; signed (−3,2,4,3,2) | 1·25·49=35² refutes both; n < 0 excluded; BS20 lines 45–48 | agrees with the conjecture |
| §1.7 `deletionLevel` | 11a1 at ℓ=5, 3; M=33, v₃=6, v₁₁=2, ℓ=3 | 1, 11; 11; same body as EllipticCurveModularityPartII `Suggested.lean` line 173 and SerreWeightAndLevelOptimisation §6.1 | one convention |
| §1.1 majorants | N=1, 11 | F_K=1, G_K=4; μ(11)=12, μ(44)=72, F_K=9, G_K=H_K=169; BS20 lines 221–233 | agrees |
| R01: gap ownership | the four inputs | AnalyticNumberTheoryPartI keeps them as hypotheses; ExplicitPrimeCounting §§3.2, 3.5, 4.3, 6.1 state their proofs | second owner on main |
| C01: EC.6 | `GeometricTorsion` | defined in §2.0 at the open head; §5.1 holds `FullRationalTwo` only | pointer off by one hop |

- Source locators checked against the text: 31 (BS20 22, ErdosSelfridge1975 5, DG95 1, Faltings1983 1, Platt2013v1 1, OpenAI2026 1), all at the stated page.
- Library declarations opened at the pins: 38 (16 Mathlib, 22 Tau Ceti), all present with the stated content, including `Stirling.log_stirlingSeq_sdiff_le` (bound 1/(12 n (n+1)), `Stirling.lean` line 103) and `TauCeti.freyCurve` (`FreyCurve/Basic.lean` line 115).
- Cross-roadmap citations resolved: 19 roadmaps, every cited section or label found on main or at the open head; one pointer off (C01); one owner not cited (R01).
- Dependency check: `depcheck: 203 roadmaps, 2212 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. No change outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives exactly eight `declaration uses sorry` warnings (lines 94, 105, 130, 143, 149, 155, 164, 172). One-tactic probe (`simp`, `rfl`) on a probe copy: none of the eight closes. The 16 elaborated types were compared with the README statements; no binder is lost.
- Headlines: the eight listed in "How to read the build" are all stated; the residual-conductor identification (§1.10) is named in the module docstring as having no pinned carrier.
- Previous review: it raised no finding. The automatic checks all passed at this head.
- Pull-request text: every sentence of the summary block and the prose read against the head; none contradicted.

Overlap check: read the scope of EllipticCurveModularityPartII, EllipticCurveModularity, EllipticLegendreCharacterInterfaces, AnalyticNumberTheoryPartI and ExplicitPrimeCounting, and searched EffectiveClassNumbers, ComputationalNumberTheory and RankOneConverse for the objects; proofs of the four finite-range inputs — ExplicitPrimeCounting (R01); deletion level — SerreWeightAndLevelOptimisation §6.1; torsion carrier and full-two-torsion predicate — EllipticCurveModularityPartII (restated locally for the Lean file only); Legendre models — EllipticLegendreCharacterInterfaces.

Source independence: 20 passages compared with 3 sources (BS20, DG95, ErdosSelfridge1975), none shared; largest share BS20, 71 of 120 source mentions; contents compared with BS20: independent (Layer 1 gathers its §§2–5, Layer 0 draws on §§3, 9 and 12, its §§7–10 are not used, and the order is the one the `*Needs:*` lines force).

Research link: Layers 0–6 prove Bennett–Siksek (2020), Theorem 2, by Granville's addendum, with Darmon–Granville (1995), Corollary 2.1 and Faltings (1983) for fixed-length finiteness; Layer 7 proves Erdős–Selfridge (1975). Rests on BS20, DG95 and ErdosSelfridge1975 as read, and on the README's references.

## Not verifiable

- Green2026: no legal copy known; consumed only through AnalyticNumberTheoryPartI §0.34c.
- IwaniecKowalski2004, RosserSchoenfeld1962, Tenenbaum1995: waived, cited by locator. Kraus1997, Lemos2017v2, Schoenfeld1976, RamareRumely1996: not in the cache, not opened.
- Registration of the four gap slugs: the package has no readable plan, so where the gaps are announced could not be checked (R01 would remove them).
- The finite counts of ErdosSelfridge1975 §3.2 for ℓ = 2 and 5 ≤ k < 71 were read in the source (lines 486–502) but not recomputed.

## Source issues

- **Misprint** in BS20 at Lemma 3.2, printed p. 361: the source says the discriminant of Y² = X(X−a)(X+c) is 64(abc)², equivalently 2⁸ times the squared terms over g⁶; it should be 16(abc)², that is 2⁶ times that quotient; affects nothing.
- **Misprint** in DG95 at equation (2.2), printed p. 520: the source says the eliminated relation has coefficients j and j−1; it should be j−1 and j−2 for terms a+id with 1 ≤ i ≤ k; affects nothing.

## For the human reviewers

- **Scope.** `TauCetiRoadmap/ErdosProgressionPowers/README.md` lines 2099–2100 cite two 2026 preprints, OpenAI2026 and Green2026, for the exclusion of Landau–Siegel zeros; Layer 5 and `effective_prime_bound` rest on it through AnalyticNumberTheoryPartI §§0.6 and 0.34.
- **Scope.** BS20 §12 (lines 1401–1439) proves the same step from the classical Landau–Page theorem with one possible exception and a real-zero bound; the README's Layer 5 uses the exception-free form instead.
