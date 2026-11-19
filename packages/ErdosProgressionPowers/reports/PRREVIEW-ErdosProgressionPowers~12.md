# Review of ErdosProgressionPowers (pull request #1336 at 4449dab)

**Verdict:** accepted

**Summary.** Accepted: no finding. The one finding of the previous review is repaired: the six headline theorems whose routes use the explicit prime estimates now carry exactly the finite-range inputs those routes use, in the README and in `Suggested.lean`, with the statements of AnalyticNumberTheoryPartI. The statements, Checks and sampled locators were recomputed against Bennett–Siksek (published version), Darmon–Granville, Erdős–Selfridge and Lemos, and against the suppliers as they are now. There are four small corrections and one format note, none blocking; three points are left for the human reviewers (two on scope, one on a source's host).

## C01 — §1.7 defines `deletionLevel` as if it were this roadmap's own, although EllipticCurveModularityPartII §2.2 defines the same rendering and is its owner

A reader of §1.7 and of the EC.1 row cannot tell that the deletion level on the pinned carriers already has an owner, and an implementer may build it twice. In the open pull request of EllipticCurveModularityPartII (#1491), `TauCetiRoadmap/EllipticCurveModularityPartII/README.md` line 214 defines `deletionLevel E ℓ` from the norms of the algorithmic conductor and of the minimal discriminant ideal, "so that a roadmap stating the bound on an elliptic curve reads M₀ from here and does not define it again", and line 1014 says that this roadmap's §1.7 "restates it on the same carriers for its own statements, as its §1.12 restates the full-two-torsion predicate". The two Lean bodies agree (`padicValNat q M = 1` here, `M.factorization q = 1` there). Here §1.12 says of `HasFullRationalTwoTorsion` that it is the supplier's predicate "restated locally"; §1.7 (line 522), the EC.1 row (line 2054) and the scope paragraph say nothing of the kind for `deletionLevel`.

The smallest change: one clause in §1.7 and in the EC.1 row, that `deletionLevel` is the rendering of EllipticCurveModularityPartII §2.2, restated locally because the Lean file imports only the pinned libraries, as is already said for the two-torsion predicate.

## C02 — §0.9 and the AnalyticNumberTheoryPartI contract consume §§0.8 and 0.19–0.20, which no target of this roadmap uses

The `*Needs:*` line of §0.9 (line 334), the Layer 0 dependencies (line 347) and the supplier contract (lines 2013–2018) list the weighted prime sum `∑(log p)/p` with its constant E (§0.8), the reciprocal-prime estimate with B₁ (§0.19) and the interval form (§0.20). No layer applies them: the weighted sums belong to the sieve of Bennett–Siksek §9 (p. 384), which the Granville route replaces, and §5.7 uses only `(k−1)! ≤ k^k` and the prime count; §0.19 enters only inside the supplier, as the prerequisite of its own §0.25. An implementer of Layer 0 is therefore placed behind three supplier sections nothing here needs.

The smallest change: drop §§0.8 and 0.19–0.20 from the three lists and the two estimates from the contract paragraph (or name the target that uses them, if one is meant).

## C03 — The second API bullet of §1.7 can be read as an equality that fails when ell divides the level

"For ell≥5, `deletionLevel` is the prime-to-ell residual conductor of §1.1's wrapper whenever the local hypotheses of NeronModelsAndSemistableAbelianVarieties §5.3h hold" (line 525). For E/ℚ and ell≥5 that section has no further hypothesis, and what it gives is the prime-to-ell part: for 11a1 at ell=11 one has M=11, v₁₁(Δ_min)=5, so the deletion level is 11 while the prime-to-11 residual conductor is 1. The sentence is true only if "local hypotheses" is read as ell≠p at every bad prime p, that is ell∤M.

The smallest change: "the prime-to-ell part of `deletionLevel` is the prime-to-ell residual conductor; the two are equal exactly when ell does not divide `deletionLevel`, which §1.10 proves under H".

## C04 — Three elementary targets of §6.4 are located at a page of the source that does not state them

The exponent-divisor identity, the exclusion |y|>1 and the finiteness of root/exponent pairs each carry "(BS20, §1 …, p. 357)" (lines 1146, 1150, 1154). The source has there a single sentence, that finiteness for k≥k₀ follows from Faltings' theorem; none of the three statements appears. A reader who opens the page to find them finds nothing. They are this roadmap's own steps toward that consequence, as the closing locator of the section (line 1164) already says correctly; the three inner locators would read "own elementary step toward the consequence at BS20, §1, p. 357".

## N01 — The `depends-on` block of the description is still out of date

The generated `depends-on` block lists SieveMethodsAndPrimePatterns, which the README cites nowhere, and omits ExplicitPrimeCounting, a supplier of §0.9. Regenerating the block fixes both.

## Previous findings

- R01 — repaired. §0.9 now defines the four propositions "with the statements of AnalyticNumberTheoryPartI §§0.3, 0.5, 0.16 and 0.25 … so that the headline theorems can carry them", and each headline section names its inputs: §1.9 "Assume `SchoenfeldFiniteRangeInput`"; §1.12 the θ and reciprocal-prime inputs; §2.7 these and `ModEightFiniteInput`; §§6.2 and 6.5 all four; §7.1 the θ and π inputs. `Suggested.lean` carries the same hypotheses (lines 141, 155, 184, 201, 224, 237), and the four definitions agree term by term with those of AnalyticNumberTheoryPartI on main.
- C01 — repaired: the summary block now reads "under four finite-range prime estimates … proved by suppliers from recorded numerical verifications"; no gap is mentioned.
- N01 — not repaired (N01 above).

## Verified sound

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| §0.1 predicate S | (1,24,3,35,2); (−3,2,4,3,2); (4,2,1,2,2) | 1·25·49=1225=35²; (−3)(−1)(1)(3)=9; gcd(4,2)=2 | Checks true |
| §0.3 large-prime valuation | BS20 Lemma 3.1(ii), p. 360 | source: nontrivial solution, ℓ prime, q≥k; README: S, q≥k, i<k | locator and hypotheses agree |
| §0.4 `smallPart` | k=5, t=−12; t=60; t=0 | 12; 12 (primes ≤k would give 60); empty product 1 | as stated |
| §0.6 quadruples, κ | I(3); (0,1,2,3); (1,2,2,3); A−B | (0,1,1,2), κ=−1; −2; −1; expansion gives κd² | BS20 (11)–(13), p. 362 agree |
| §0.7–0.8 index sets | n=1,d=2,k=6,r=3; common prime of r,d | {1,4}; p∣n contradicts gcd=1 | BS20 p. 381 defines I_p; true |
| §1.2–1.3 first family | n=d=1; n=2,d=1; a=1,c=3 | (a,b,c)=(1,−4,3), a₂=2, a₄=−3; g=2; Δ=16·12²=2304, source prints 64(abc)² | README right; source off by 4 |
| §1.5–1.6 second family | n=d=1, q=(0,1,1,2); general Δ, c₄ | κ=−1, A=3, B=4, a₂=−2, a₄=−3; Δ=16κ²A²(4κ²d²−4κA)=−64κ³A²B | BS20 (11), Lemma 3.4, p. 362 agree |
| §1.7 level bounds | BS20 Lemma 3.3, pp. 361–362 | M_a∣2⁸A_iA_jA_h; ∣2⁷∏_{q≤k}q; ≤2⁷exp(1.000081k), ℓ≥7 | agree |
| §1.7 `deletionLevel` | 11a1 at ℓ=5, 3, 11; M=33 data at ℓ=3 | 1; 11; 11 (residual conductor 1); 11 | Checks true; bullet ambiguous (C03) |
| `half_primes_divide_d` (§1.9) | exponent comparison at k≥10⁸; κ of the two-term quadruple | (M+1)/6·log(√k+1): e^{1.0001k} and e^{2.0002k}k⁴ against e^{2.3026k}; κ=−(p−1) | BS20 Lemma 4.1, p. 364; input θ only |
| §1.10 bridge | ℓ against M_a under H | M_a≤2⁷e^{1.000081k}<exp(10^k)<ℓ, so ℓ∤M_a; ℓ∣v_ℓ(Δ) for ℓ≥k | Theorem 4 p. 360, Lemmas 3.2–3.3, 5.1 located |
| §1.11 Kraus threshold | N=1; N=11; x=10⁸ | F_K=1, G_K=4; μ(44)=72, G_K=13²=169; exp(0.27+5/18.42)=1.72<2 | BS20 (5) and proof of Lemma 5.1, p. 365 agree |
| `comparison_curve` (§1.12) | Y²=X(X−1)(X+3); Y²=X³−2; Y²=X(X²+1); torsionBy at 1, 0 | 4 points; 1; 2; trivial group, whole group | BS20 Lemma 5.1, p. 365; one-tactic probe fails |
| §2.1 Legendre interfaces | 𝔽₅, λ=4; 𝔽₇, λ=2; λ=1/2 witness | #F_λ=8, #F′_λ=4, traces −2, 2; 8; (1+i,−1+i): both sides −2i | true; source's y-coordinate is wrong, README's right |
| §2.3 Case I | p mod 8 = 1, 3, 5, 7; constants | μ₁−μ₂−μ₃+μ₄ = 0, 4(λ/p), 0, 0; (1−3·0.002811)/8=0.123945875 | BS20 Lemma 6.4, (19)–(21), pp. 368–369 agree |
| §2.4 Case II | p≡5 mod 8 | a_p(F₋₁)≡6 mod 8; p+1+a≡4 mod 8; 16 divides neither count | BS20 Lemma 6.6, p. 371 |
| §2.5 CM exclusion | j; a=c; a=b | 2⁸(a²−bc)³/(abc)²; d=0; d∣3; Bertrand gives p≥5 for k≥8 | BS20 p. 373 agrees |
| `character_family` (§2.7) | `oddPart` 12, 16, 24, 48, 0; margin | 3, 1, 3, 3, 0; 12≤24, 24≤24, 16>8, 48>24; 0.123945875−0.1239=0.000045875 | BS20 Prop. 6.1, pp. 366–367; probe fails |
| §4.3 deletion | n=d=1, k=5, A=(1,2,3,4,1); A=(1,2,1,2) | removes 3 and 2, J₁={0,1,4}, product 2∣24; removes index 1 | true |
| §5.2 Q(k,c) | T(0,c), T(1,c); q=5, k=16, c=0 | 1, 1; 1−3·1.0197/2.7726=−0.103<0, L(0,χ₅)=0 | true |
| §5.3 exceptional moduli | Q=k⁴, σ=1−3loglog k/log k, T=T(k,c) | (log k)^{12(5+ε)}·e^{c(3+ε)}, ε=1/12 gives 61; c/log T=3loglog k/log k | BS20 Prop. 12.1, pp. 386–387; stronger form rests on supplier §0.6 |
| §5.5–5.6 bad indices | {1000}, n=1000, k=3; {8}; divisor sum | r=1000≥5; threshold 1; τ(q)(2kq^{−1/3}+1)≤C(kq^{−1/4}+k^{1/3}) for q≤k⁴ | BS20 Prop. 12.3, pp. 387–388 |
| §5.7–5.9 endgame | x=64; block count; gcd product | 8·64^{3.5}=64⁴; k/3−π(k)−|Bad|>2k/7, one block ≤k^{7/2}; ∏gcd≥N/8, one ≥N^{1/3}/2 | BS20 p. 388 agrees |
| `effective_prime_bound` (§6.2) | d=0; ℓ=2 | gcd(n,0)=1 forces yd=0; 2≤exp(10^k) | BS20 Theorem 2, p. 357; probe fails |
| `fixed_exponent_finiteness`, `positive_fixed_exponent_finiteness` (§6.3) | (5,2), (3,4), (4,3), (4,2), (3,3) | 2g−2=ℓ^{k−2}(kℓ−2ℓ−k): 8, 4, 18, 0, 0; (k−2)(ℓ−1)>2 fails only at (4,2), (3,3) | DG95 Cor. 2.1, pp. 520–521; probes fail |
| §6.4 composite exponents | |y|=1 with three terms | terms in {±1}: (−1,0,1) or (−1,1,3), impossible | true; locators imprecise (C04) |
| `fixed_length_finiteness` (§6.5) | k≥5, any ℓ≥2 | every (k,ℓ) hyperbolic; primes p∣ℓ bounded by exp(10^k) | follows from §§6.2–6.4; probe fails |
| `consecutiveProduct_not_perfectPower` (§7.1) | m=28,k=3,ℓ=3; k=1000, r=4; k=29999; mod 36 | six distinct products; 255·254=64770>3⁷·21=45927; 4853·4852=23546756>3⁹·993=19545219; 12 and 24 classes | Erdős–Selfridge (13)–(23) agree; probe fails |
| §7.3 smooth multiplier | n=d=y=1, k=2, ℓ=2, b=2 | 1·2=2·1²; 2≤2τ iff τ≥1 | BS20 §11, pp. 385–386 |
| Four inputs of §0.9 | x=59; x=10⁸; imprimitive characters mod 8 | 16.24<17<19.79; 0.2615+1/(2·18.42²)<0.27; extra Euler factor 1−2^{−s} vanishes only on Re s=0 | true as stated, identical to the supplier's definitions |

- Source locators checked against the text: about 40 in BS20 (publisher's version, pp. 355–388), 3 in DG95, 13 in ErdosSelfridge1975, and one each in Faltings1983, Lemos2017v2, Platt2013v1 and OpenAI2026.
- Library declarations opened at the pins: 25 in Mathlib and 37 in Tau Ceti, all present in the files the README names (for example `Stirling.log_stirlingSeq_sdiff_le`, `Mathlib/Analysis/SpecialFunctions/Stirling.lean` line 103; `padicValInt.mul`, `Mathlib/NumberTheory/Padics/PadicVal/Basic.lean`).
- Cross-roadmap citations resolved: 19 suppliers, 15 on main and 4 at their open heads (EllipticCurveModularity R29.3, R29.4, R29.6; AutomorphicGaloisRepresentations §1.5; HeightsRationalPointsAndObstructions §6.4; EllipticCurveModularityPartII §§1.4–1.8, 2.0, 2.2, 4.7, 5.1, 5.4–5.5, 6.18). ModularCurves §4C resolves through that roadmap's table of former numbering (now Layer 3.5).
- Dependency check: `depcheck: 199 roadmaps, 2188 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. No change outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives exactly eight `declaration uses sorry` warnings (lines 141, 155, 184, 201, 209, 215, 224, 237). The elaborated types of the 20 declarations were compared with the README statements: no binder lost, generality equal.
- One-tactic probe on a scratch copy (`first | rfl | simp | omega | infer_instance` in place of each `sorry`): all eight theorems fail to close. No padding.
- Headline theorems of the README (§§1.9, 1.12, 2.7, 6.2, 6.3 twice, 6.5, 7.1): all eight stated; the residual-conductor identification of §1.10 is named in the module docstring as not statable.
- Automatic checks: all passed at this head. Pull-request text read against the head: no sentence contradicted; one generated block out of date (N01).

Overlap check: read EllipticCurveModularityPartII, EffectiveClassNumbers, EllipticCurveModularity, EllipticLegendreCharacterInterfaces, AnalyticNumberTheoryPartI, ExplicitPrimeCounting; the deletion level on pinned carriers — EllipticCurveModularityPartII §2.2 (restated here, C01); the full-two-torsion predicate and geometric torsion — its §§5.1, 2.0; Legendre models and the order-four witness — EllipticLegendreCharacterInterfaces; the four finite-range inputs — AnalyticNumberTheoryPartI (statements) and ExplicitPrimeCounting (proofs); nothing with two owners. Ownership against open pull requests was checked by object search over the open heads and main.

Source independence: 16 passages compared with 4 sources (BS20, DG95, ErdosSelfridge1975, Lemos2017v2), none shared beyond formulas; largest share BS20, 71 of 119 source mentions; contents compared with BS20 §§1–12: independent (its §§7–10 have no layer, Layer 5 is its §12 alone, Layers 6–7 rest on other sources; the order of Layers 0–2 is forced by their `*Needs:*` lines).

Research link: Layers 0–6 prove Bennett–Siksek (2020), Theorem 2, by Granville's addendum to that paper, and fixed-length finiteness through Darmon–Granville (1995), Corollary 2.1, and Faltings (1983); Layer 7 proves Erdős–Selfridge (1975) and records Erdős's conjecture. Rests on BS20, DG95 and ErdosSelfridge1975 as read.

## Not verifiable

- Kraus1997, §3.1, Théorème 4, p. 1144: the publisher's page is on a host the sources service does not classify; not read. Checked only against BS20, Theorem 4, p. 360, and EllipticCurveModularityPartII §4.7.
- IwaniecKowalski2004, RosserSchoenfeld1962, Tenenbaum1995: waived, cited by locator.
- Schoenfeld1976, RamareRumely1996, Martin2003v1, Green2026: not opened; their locators were compared only with the suppliers' own citations.
- DG95 is an image scan read through its extracted text; equation (2.2) is garbled there and its first coefficient alone is legible.
- The proofs inside the suppliers (ExplicitPrimeCounting §§3.2, 3.5, 4.3, 6.1; AnalyticNumberTheoryPartI §§0.6, 0.34, 1.4, 1.7) were read for their statements and hypotheses, not refereed.

## Source issues

- **Error** in BS20 at Lemma 3.2, p. 361: the source says the discriminant of Y²=X(X−a)(X+c) is 64(abc)², that is 2⁸g⁻⁶ times the squared terms; it should be 16(abc)², that is 2⁶g⁻⁶ times them; affects nothing.
- **Misprint** in BS20 at the proof of Lemma 6.6, p. 371: the source says the second coordinate of P is a polynomial in t, v that equals the cubic's value at x(P), so its square is not that value; it should be 8itv(t+iv); affects nothing.
- **Gap** in BS20 at §12, final paragraph, p. 388: the source says the odd part of N_a is the largest odd squarefree divisor of the product of the three A's; it should be an odd squarefree divisor of it, which is all Proposition 6.1 gives; affects nothing.
- **Misprint** in DG95 at equation (2.2), p. 520: the source says the coefficient of the second term's power is j, for terms a+id with 1≤i≤k; it should be j−1, with j−2 on the first term; affects nothing.

## For the human reviewers

- **Scope.** `TauCetiRoadmap/ErdosProgressionPowers/README.md` lines 2135–2136 cite two 2026 preprints, OpenAI2026 and Green2026, for the exclusion of Landau–Siegel zeros; Layer 5 and `effective_prime_bound` rest on it through AnalyticNumberTheoryPartI §§0.6 and 0.34.
- **Scope.** BS20 §12 argues from the classical Landau–Page theorem with one possible exception and a real-zero bound; Layer 5 (README §§5.1, 5.3) uses the exception-free form instead, so its Proposition 12.1 is stated more strongly than the source's.
- **Licence.** BS20 was read from the publisher's own page (the URL in README line 2118), a host the sources service does not classify; the arXiv version 1709.01022v1 lacks §12 and has other page numbers.
