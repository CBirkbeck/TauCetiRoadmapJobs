# Review of RefinedTraceMethodsPartII (pull request #2410 at e827f77)

**Verdict:** needs changes

## R01 (P3) — Syntomic form of §7.2 narrower than its sources

**Location:** `TauCetiRoadmap/RefinedTraceMethodsPartII/README.md` line 666: "Prove also the syntomic form: for every perfect 𝔽_p-algebra k and i ≥ 1, the reduced syntomic complex … is `(W_{ei}(k)/V_eW_i(k))[−1]` (sulyma-slopes Theorem 1.1, line 43)."

**Claim:** The layer works over perfectoid rings, and the sources give the syntomic form for every perfectoid ring. Stating it only for perfect 𝔽_p-algebras narrows it below what the sources support.

**Witness:** sulyma-slopes Remark 1.3 (line 52): Theorem 1.1 holds for every perfectoid k, with Riggenbach's independent proof. riggenbach-trunc's proof of Corollary 6.5 (lines 1284–1320) computes these graded pieces for perfectoid R.

**Repair:** Replace the opening with "Prove also the syntomic form: for every perfectoid ring R and i ≥ 1, `ℤ̃_p(i)(R[x]/x^e) = fib(ℤ_p(i)(R[x]/x^e) → ℤ_p(i)(R))` is `(W_{ei}(R)/V_eW_i(R))[−1]` (sulyma-slopes Theorem 1.1 and Remark 1.3, lines 43 and 52; riggenbach-trunc Theorem 6.4, line 1226)." Keep the crystalline route as the route when p = 0 in R. For general R, add the route through the graded pieces of §7.1 (riggenbach-trunc lines 1284–1320). Add §§3.4 and 7.1 to *Needs*. Test at R = O_C, e = 2, i = 1: both sides are `O_C[−1]`, matching the O_C Check of §7.2.

## R02 (P3) — Tate-grading witness cites a supplier section that does not contain it

**Location:** `TauCetiRoadmap/RefinedTraceMethodsPartII/README.md` line 55: "*Tate grading.* For trivial C_p acting on Hℤ, `π_{2r}((Hℤ)^{tC_p}) = ℤ/p` and the odd groups vanish (RefinedTraceMethods §2.13 Examples)."

**Claim:** RefinedTraceMethods §2.13 (finite-family circle spectra, genuine cyclotomic objects and TR) has no Examples block and does not compute `Hℤ^{tC_p}`.

**Witness:** RefinedTraceMethods README at its open head: §2.13 runs from line 1044 to line 1227 and does not contain the computation. It is under the Layer 2 "### Examples" heading, lines 1256–1258.

**Repair:** Replace "(RefinedTraceMethods §2.13 Examples)" with "(RefinedTraceMethods, Layer 2 Examples)".

## R03 (P3) — The §2.5 Frobenius bullet has no locator that contains it

**Location:** `TauCetiRoadmap/RefinedTraceMethodsPartII/README.md` line 330, "(speirs-axes Lemmas 6, 9 and 11 and Proposition 12, lines 334–464)", which covers line 336: "*Frobenius.* ψ_p restricts to homeomorphisms `B(ω) → B(ω^{⋆p})^{C_p}` …"

**Claim:** The Frobenius statement is not in the cited range and has no locator of its own.

**Witness:** speirs-axes lines 527–531 (p. 14, the paragraph before Proposition 16) state that ψ_p restricts to a homeomorphism `B(ω) → B(ω^{⋆p})^{C_p}`, with `ω^{⋆p}` of length pm and period s.

**Repair:** End the bullet on line 336 with "(speirs-axes line 527)".

## R04 (P3) — Undefined symbols in §7.2 and a §9.3 Check

**Location:** `TauCetiRoadmap/RefinedTraceMethodsPartII/README.md` line 662: "`W_{re}(R)/V_eW_r(R)`, with big Witt vectors on {1,…,n}"; line 856: "`|K_5;ℤ_2| = 4·16 = 64`".

**Claim:** n is not a variable of the §7.2 statement, whose lengths are re and r. In the Check on line 856 the ring is missing from the group.

**Witness:** The Conventions (line 45) define `W_N(R) = W_{{1,…,N}}(R)`, and n occurs nowhere else in §7.2. Line 856 concerns `𝔽_2[z]/z³`, whose K₅ has 2-part `(ℤ/2)² ⊕ ℤ/16` (akn24 line 149).

**Repair:** On line 662, write "with `W_N(R) = W_{{1,…,N}}(R)` as in the Conventions". On line 856, write "`|K_5(𝔽_2[z]/z³;ℤ_2)| = 4·16 = 64`".

## Verified sound

| Target | Instances | Values computed (roadmap side / check side) | Result |
|---|---|---|---|
| §1.1 `ncard_cuspTruncationSet`, `ncard_cuspCoprimeSet` | coprime a,b ≤ 7, r ≤ 2 (enumerated) | S(2,3,0)={1,2,3,4,6}: 5 = ½·12−1; T(2,3,1)={1,5,7}: 2·3 = 3·1·2; #(S/a)=(r+1)b, #(S/ab)=r+1 | holds |
| §1.3 h = s_T and Σh | 34,796 cases, a,b < 10, r < 4, p ≤ 7 | (2,3,0,2): s(1)=3, h=min(3,1)=1 = s_{{1}}(1); Σh = ½(2r+1)(a−1)(b−1) in all cases | holds |
| §1.4 `card_noCyclicRepetition` | d ≤ 4, m ≤ 6; m=1; d=0 | count = (d−1)^m+(−1)^m(d−1); m=1: 0=0; d=0: 0=0; cyc₃(2..6)=3,2,3,6,9; c₂(2)=3 | holds |
| §1.5 exponents | ℤ/4; ℤ₂[√2]/(√2)³; 𝔽₂[z]/z³ | B(2,1,2)=12; j=2, exponent 4 (j=n reading gives 8); B=4 for e=3; Σε, i=n=2: {1,3}→2 | holds |
| Witt-sign witness | W_{{1,2}}(ℤ) | ghosts (2,2) give (2,−1); γ₂ = (1−2t)⁻¹(1+t²)⁻¹ = 1+2t+3t² = (1−t)⁻² mod t³ | holds |
| Tate-grading witness (R02) | Hℤ, trivial C_p | ℤ/p in even degrees, 0 in odd: true; found at RefinedTraceMethods Layer 2 Examples | locator only |
| §2.3 splitting | Π₀; 𝔽_p, Π₂ weight 1; ℚ[β^{±1}] | identity; one dimension in each degree n ≥ 0; ⊕_jℚ → ∏_jℚ misses (1,1,…) without bounded below | holds |
| §2.5 cell types (R03) | d=3, x₁x₂x₃; x₁x₁; d=2 | S^{λ₁}∧T₊, homology in degrees 2,3; (T/C₂)₊ not contractible (period 1); Σ⁻¹S^{λ_i}∧(T/C_i)₊ = haxes Prop 1.2 | holds |
| §3.4 coefficient tower | R=𝔽_p, n=0,1,2 | n=0: A_inf[u]/(d)=R[u]; n=1: π₀tC_p=ℤ/p, π₋₂hC_p=ℤ/p; n=2: π₀hC_{p²}=ℤ/p³=W₃; transfer ×p | holds |
| §3.5 staircase | proof by recursion; s=0,2; zero maps | kernel ≅ A_{s−1} (A₀ if s=0); s=2 example gives W₂(k); zero maps give kernel ∏ℤ/p | holds |
| §4.1 birelative terms | f=id; ℤ→ℤ/p, I=pℤ; axes over a field | 0; B/f(I)=B so the term is K(ℤ,pℤ); K₂=k (Dennis–Krusemeyer, haxes line 31) | holds |
| §4.2 normalization squares | cusp (2,3); axes d=2 over ℤ | conductor t²k[t] since (a−1)(b−1)=2; A/c=k, B/c=k[t]/t²; ab−a−b=1 would put t in A | holds |
| §5.1 birelative TC | q ≤ 1; q = 2 | every factor 0 since 2d > q; only d=r=1: TR¹_{2−λ₁}=π₀THH(k)=k; R iso for q<2p^{r−1}d | holds |
| §5.2 Hesselholt | 𝔽₃, q=1..6; 𝔽₂, q=4 | 0,𝔽₃,0,𝔽₃²,0,ℤ/9⊕𝔽₃; W₂(𝔽₂)=ℤ/4 (haxes line 108) | holds |
| §5.3 Speirs, p>0 | d=3, q=3,5, p=2,3,5,7; d=2 | q=3: k² for each p; q=5: k⁸ for each p; printed 0≤v≤t_ev gives k²⊕k²⊕… (infinite); d=2 gives §5.2 | correction verified |
| §5.4 Speirs, char 0 | d=2, k=ℚ; d=3 | K₄=ℚ; HC₁=ℚ, HC₂=0; K₃=k² (c₂(3)=2), K₅=k⁶ (c₂(5)=6); Thm 31 = Thm 30 at degree q−1 | holds |
| §6.1–6.2 cusps | (2,3,1) over 𝔽₅, 𝔽₃; (2,5,0) over 𝔽₃, 𝔽₃×𝔽₃ | ℤ/25⊕𝔽₅ and 𝔽₃³ (length 3); ℤ/9, not 𝔽₃²; length 4 over ℤ₃×ℤ₃; (2,3,0): Pic=k | holds |
| §7.1 TC⁻ of R[x]/x^e | e=1; e=p, k=1, R=𝔽_p | both sides 0; V=×p: ℤ/p→ℤ/p², cofibre π₀=ℤ/p | holds |
| §7.2 Riggenbach (R01, R04) | 𝔽₃, e=2, r=2; 𝔽₂, e=2, r=1; O_C, e=2, r=1 | T={1,3}: W₂=ℤ/9; ℤ/2, the order-2 group 1+x𝔽₂[x]/x²; O_C; s_T(u)=s or min(s,v_p(e)) derived | holds; generality R01 |
| §8.2 finite-stage formula | absolute 𝔽₂ package, i=1, j=1 and j=3 | j=1 (printed bound): 𝔽₂⊕𝔽₂[−1] ≠ 0 = 𝔽₂(1)(𝔽₂); strict bound (p−1)j>pi excludes j=1 | README right, source wrong |
| §8.3 relative prismatic | Thm 1.2 (1)–(8); (ℤ_p,(p)), 𝔽_p | (2) needs R over A/I (akn-delta line 54); Δ = ℤ_p; uniqueness by ($),(4),(6) = Prop 9.15 | holds |
| §9.1 reduction | ℤ/4; degree −1 | K₁=ℤ/2, K₁(𝔽₂)=0, prime-to-2 parts equal; TC₋₁(𝔽_q)=ℤ_p ≠ 0 = K₋₁ | holds |
| §9.3 Angeltveit | ℤ/4 (i=2), ℤ/8 (i=2,3), 𝔽₂[z]/z³ (i=3) | 8/2=4; 32/2=16; 128/2=64; 64/1=2⁶ (akn24 table, lines 144–153) | holds |
| §9.5 even vanishing | ℤ/4; j=1 | B=12, so i ≥ 13; Remark 5.4 bound p²/(p−1) ≥ 4 never reaches i=2 | holds |
| §9.6 v₁-nilpotence | n=1; ℤ/4; e=2, n=3 | [1]_p=1, 𝔽_p(p−1)(𝔽_q)=0; [2]₂=3, equality since e∣n; bound p+1, upper bound only | holds |

- Source locators checked against the text: about 80 locators in 10 sources (hn-cusp, hesselholt-cusp-polytopes, hesselholt-axes, speirs-axes, speirs-trunc, riggenbach-double, riggenbach-trunc, sulyma-slopes, akn-delta, akn24), covering all 15 sampled sections. Only R03's locator range misses its statement. The README flags no locator as unverified.
- Library declarations opened at the pins: Mathlib `frobeniusNumber_pair` (NumberTheory/FrobeniusNumber.lean:59), `ArithmeticFunction.moebius_mul_coe_zeta` (NumberTheory/ArithmeticFunction/Moebius.lean:177), and SimpleGraph/Coloring/Constructions.lean, which has the cycle-graph chromatic number only, not the count of `card_noCyclicRepetition`. Tau Ceti `TauCeti.NodeAlgebra` (RingTheory/Node/Basic.lean:37, `coord` 65, `coord_zero_mul_coord_one` 75, `lift` 97) and `IsIntegralPerfectoid` (RingTheory/Perfectoid/Integral.lean:76). Tau Ceti's WittVector/ and Syntomic/ give p-typical Witt vectors and syntomic ring maps. Neither pin has δ-rings, prisms, big Witt vectors, higher K-groups or THH, so the docstring's list of headlines that are not statable holds.
- Cross-roadmap citations resolved against the heads (main d1f3b7d and the open heads): every cited section of RefinedTraceMethods (18), KTheoryFiniteLocalFields (12), QWittVectors (6), AInfCohomology (AI.0, §AI.7.2), PrismaticCohomology (§§0.56, 0.75–0.76, 1.3–1.4 are bold sub-blocks), PrismaticCohomologyPartII (§§4.4–4.8 likewise), PrismaticCohomologyPartIII, CrystallineCohomology, DerivedDeRhamCohomology, GeneralAlgebraicKTheory, SchemeKTheoryOperations, StableHomotopyKTheory, EnhancedDerivedSheaves, BordismFormalGroups §F6.5, GeneralAlgebraicKTheoryPartII §5.5 and StableHomotopyKTheoryPartII §2.7. The citation tool's lead `BigWitt.TruncationSet` is QWittVectors README line 140 and Suggested.lean line 70.
- Declared gaps: `bigwitt-ptypical-decomposition` and `perfect-homotopy-invariance` carry the same slugs in plan.json and the README. Neither is provided upstream: QWittVectors §1.5 covers Div(p^a) only, and SchemeKTheoryOperations §5.2 covers regular rings only.
- Gate: every check passes. Dependency check output: `depcheck: 242 roadmaps, 2246 edges, 0 problem(s)`. No change outside the folder.
- Elaboration: `lake env lean` on Suggested.lean gives three `sorry` warnings and nothing else. `#check @` of all six declarations matches the README statements. The file has no section variables.
- Padding probe: none of the three theorems closes with `simp`, `omega`, `decide`, `rfl`, `norm_num` or `aesop`. None restates a definition or mirrors a Check.
- Ownership against open pull requests: checked with `roadmaps grep` for δ-pairs, relative and filtered prismatic cohomology, coordinate axes, cusps, ℤ/p^n and finite chain rings. No second owner found.

Overlap check: read RefinedTraceMethods, PrismaticCohomologyPartII, PrismaticCohomologyPartIII, PrismaticCohomology, PrismaticCohomologyPartIV and EnhancedDerivedSheaves (the third list is empty). Objects shared, with their owners:
- Pointed-monoid THH splitting: genuine model owned by KTheoryFiniteLocalFields §5.16; the Nikolaus–Scholze variant for E₁-rings is owned here (§2.3).
- Truncated-polynomial K-groups over perfect fields: owned by KTheoryFiniteLocalFields §5.17; a Check here.
- Prismatic cohomology over prisms and absolute prismatic cohomology: owned by PrismaticCohomology §§1–2 and PrismaticCohomologyPartII §4.18; here only agreement properties §8.3 (2)–(3).
- Syntomic complexes: owned by PrismaticCohomologyPartIII §6.8; the relative extension is owned here (§8.4).

Source independence: 22 passages compared with 10 sources. None reproduces source wording beyond forced definitions and formulas; the closest is the §8.5 filtered-prism hypothesis list against akn-delta line 2116. Largest share: akn-delta, about 47 of 197 locators (akn24 has 46). Contents compared with akn-delta: independent. Layer 8 runs 8.1 ↔ §2, 8.2 ↔ §8, 8.3 ↔ §§3–6, 8.4 ↔ §§7–8, 8.5 ↔ §10. Layer 9 follows akn24 §§2.1–6 in order, which the *Needs* lines force (9.3←9.2, 9.4←9.2, 9.5←9.3–9.4, 9.6←9.4–9.5).

## Not verifiable

- larsen-mixed and bach-hypersurfaces: settled as uncertified (paywalled, no legal copy in the cache); cited only through hn-cusp Theorem 1 (line 131), which was checked.

## Source issues

- **Error** in speirs-axes at Theorems 1–2 (p = 2, odd degrees), p. 1 line 64, and the end of §5 at p. 28 line 1114: the source takes the product over 0 ≤ v ≤ t_ev of copies of `k^{cyc_d(s′)}`; it should be one copy for each odd m′ ≤ 2r+1 and none otherwise. Otherwise the product is infinite, against its own line 69; affects a stated result.
- **Error** in akn-delta at Proposition 8.6, p. 43 line 1770: the source assumes only (p−1)j ≥ i, yet the proof uses Lemma 8.5, which needs (p−1)j > pi; it should assume (p−1)j > pi. It fails for 𝔽₂ with i = 1, j = 1; affects a stated result.
- **Misprint** in akn24 at Remark 5.3, p. 46 line 2077: the source calls j = ⌈n/e⌉ the exponent of the additive group of O_K/ϖ^n; it should say p^j is the exponent; affects nothing.
- **Error** in hesselholt-cusp-polytopes at Corollary 1.7, p. 8 line 395: the source asserts W(k)-length ½(2r+1)(a−1)(b−1) for every commutative ring k; it should require k a perfect field (or a field of characteristic 0). The length doubles for 𝔽₃×𝔽₃ and is infinite for 𝔽_p[t]; affects a stated result.
- **Gap** in hn-cusp at the introduction after Theorem A, p. 1 lines 36–37: the source states that this length holds for every perfect 𝔽_p-algebra k; it holds for perfect fields, and k = 𝔽_p × 𝔽_p doubles it; affects nothing.

## For the human reviewers

- none
