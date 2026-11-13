# Review of LubinTateFormalModulesAndQuasiCanonicalLifts (pull request #2284 at 41b2972)

**Verdict:** needs changes

Previous findings at this head: R01 (Layer 2 narrowed to characteristic zero) repaired: "Throughout this layer `K` is a nonarchimedean local field of either characteristic", `[CharZero K]` is gone from the three Layer 2 theorems, the `𝔽_q((t))` Check is in §2.3. R02 (Layer 3 narrowed to `K/ℚ_p`) repaired: "Fix a nonarchimedean local field `K` of either characteristic", rigidity is stated from finite `O_K`-height with VZ07, Lemma 2.6, and the equal-characteristic Check is in §3.6. R03 (page of H70 Lemma 2.4) repaired: "Lemma 2.4, p.222, and Theorem 3, p.225".

## R01 (P3) — §6.4 cites Yu's Proposition 4 for statements it does not make

**Location:** `TauCetiRoadmap/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md` line 1810, "`O_s^× = O₀^×(1 + ϖ₀^s O_F)` (G86, §5, Proposition 5.3, p.325; Y95, §5, Proposition 4, p.300)".

**Claim:** Y95, Proposition 4 supports the classification of quadratic orders as the `O_s`, their conductor and their unit groups.

**Witness:** Y95 lines 305–310: Proposition 4 is an equivalence of four conditions on an order (every proper lattice free, simple transitivity, freeness of the dual, a symmetry of the invariants `a_i`); orders `O₀ + ϖ₀^s O_F`, conductors and units do not occur. The dichotomy is G86 lines 198–201.

**Repair:** In §6.4 write "(G86, §5, p.325, the two cases for the endomorphism order before Proposition 5.3, and Proposition 5.3(2) for the unit quotient)" and drop the Y95 locator there; §6.5 keeps Y95, Proposition 4 for lattice freeness, where it applies.

## R02 (P3) — The description's summary block still restricts Layer 2 to finite extensions of `ℚ_p`

**Location:** pull request description, `<!-- roadmap-summary -->` block, first sentence: "develops one-dimensional formal modules, Lubin–Tate existence and uniqueness, division-field degrees and explicit reciprocity over finite extensions of ℚ_p."

**Claim:** Division-field degrees and explicit reciprocity are developed over finite extensions of `ℚ_p`.

**Witness:** `README.md` lines 26–28 and 806: Layer 2 holds "for every nonarchimedean local field `K`"; `Suggested.lean` lines 137–138 carry no characteristic hypothesis; the description's own third paragraph says "hold in either characteristic".

**Repair:** "The roadmap develops one-dimensional formal modules, Lubin–Tate existence and uniqueness over discrete valuation rings with finite residue field, and division-field degrees and explicit reciprocity over every nonarchimedean local field, of either characteristic."

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §0.1 `FormalModule` | `𝔽_p[t] → 𝔽_p`, `t^k b ↦ b(0)X^(p^k)`; `[0]`; `O_F/O_(F₀)` degree `n` | `1+t ↦ X` vs `X + X^p`; `φ = F(φ,φ)` forces `φ(1+φ·g) = 0`, so `[0]=0`; `q_F^(he) = q₀^(nh)`. | additivity axiom independent; `act_zero` derivable | none |
| §1.2; `existsUnique_lubinTate_intertwiner` | `p` odd, `f=(1+X)^p−1`, `g=pX+X^p`; `W(𝔽_(p²))`, `q=p` | `X²`: `pc + p(p−1)/2 = p²c`, `c = 1/2`. `X^p` coefficients `ā^p ≠ ā`. | holds; cardinality hypothesis needed | none |
| §1.3; `exists_formalModule_of_isLubinTateSeries` | `𝔽_q[[t]]`, `tX+X^q`; `tX+X^q+X^(q+1)` | Additive law. Second series: reduction `X^q+X^(q+1)`, derivative `t+X^q` not `t`·unit, correctly excluded by the predicate. | holds, incomplete `O` included (error divisible by `π`, `π^r−1` a unit) | none |
| §1.4 | `g = f+πX²`, `q=2` and `q>2` | `q>2`: `πc = π+cπ²`; `q=2`: `πc+1 = π+1+cπ²`; both `c=(1−π)⁻¹`. | holds | none |
| §2.1 torsion | `R = K = 𝔽_q((t))` (non-local structure map) | `[π]` has unit linear term, `A_m = K`, rank `1 = q^(0·m)`. | consistent at `h=0` | none |
| §2.2 Tate module | `[π]′` from `g([π]X)[π]′(X) = π g(X)`; `𝔽_q((t))` | `[π]′ = π`·unit, nonzero on `𝔪`; rank one over `𝔽_q[[t]]`, killed by `p`. Y95 line 120: free of rank `n`. | holds in both characteristics | none |
| §2.3; `finrank_adjoin_primitive_lubinTate_root` | `ℚ₂`, `2X+X²`, `m=1,2`; `𝔽_q((t))`, `m=1` | Root `−2`, degree `1`; `X²+2X+2`, degree `2`; `X^(q−1)+t` Eisenstein, degree `q−1`. | holds | none |
| §2.5; `artinMap_apply_lubinTate_root`, `artinMap_fixes_lubinTate_roots_iff` | `m=0`; `ℚ₂`, `u=3`, `m=1`; `π′=uπ` | `m=0`: root `0`, `P(0)=0`, right side `Kˣ`. `P=X` gives `−2`, truncation gives `−2/3`. `π=u⁻¹π′` acts by `[u]`. | holds; norm of `−t₁` is `π` | none |
| §2.6 | `Art(π′)=Art(u)Art(π)` | `χ_π = u⁻¹`, `η_u = u`, product `1`; with `η_u⁻¹`: `u⁻²`. | holds | none |
| §3.2 logarithm in characteristic `p` | `tX+X^q` over `𝔽_q((t))`; strict automorphisms of `𝔾_a` | `c_i t^(q^i)+c_(i−1) = t c_i`; `c_n(a^n−a)=0` with `a=t`. VZ07 Lemma 1.3 (p.58) is for infinite fields. | holds | none |
| §3.4 rigidity | small extension, `α ≡ 0`; additive module over `k[ε]` | `[π](α(X)) = πα = 0`; `Σ a_i [π̄](X)^i = 0` forces `a_i=0` when `[π̄] ≠ 0`. `ε(āX)^q = āεX^q`. | holds; fails at infinite height | none |
| §3.6 | `𝔽_q[[t]]`, height one; VZ07 lines 3017–3022 | `h−1 = 0` parameters. Source: separably closed residue field only; the README's descent route covers general `k`. | holds | none |
| §4.3 sign pairing | `a_(p²) = 2sp`; BKO21 lines 573–578, 554–557 | `(Frob−sp)²=0`; `sp·ℓ ≡ ℓ(X^q)`, type `p − sT²`. Source pairs `±2p` with parameter `∓p`, yet uses `−p` for `a_p=0`. | README right, source lemma reversed | none |
| §4.4; `isLubinTateSeries_zsmulSeries_formalGroup` | `p=2`, `s=±1`; `y²+y=x³` | `5−4s ∈ {1, 9}`, both occur; `#E(𝔽₄)=9`, `s=−1`. `z=−x/y ↦ z^q`. | holds | none |
| §5.3 | `L₂ = ϖ₀⁻¹L₁`; Y95 lines 141–146 | `a=ϖ₀⁻¹`, `aL₁=L₂`. Source: `Hom` is the set of `a` with `aL₁ ⊂ L₂`, p.296. | supported | none |
| §5.4 | unramified quadratic, level one | Stabilizer `k_(F₀)^×`; `(q₀²−1)/(q₀−1) = q₀+1`; index of `O₀^×(1+ϖ₀O_F)` is `q₀+1`. Y95 line 175. | holds | none |
| §6.2, §6.3 | `L₂=uL₁`; cubic `O₀+ϖ₀O_F`; Y95 lines 186–211 | Reduction `[ab]`, identity iff `ab=1`. Lengths `3 ≠ 2·1`. | supported | none |
| §6.4 | `x = a+ϖ₀^s b` unit | `a` unit, `x = a(1+ϖ₀^s b/a)`. | statement holds; locator wrong | R01 |
| §6.5 | `q₀=2`, `s=1`; G86 lines 204–213 | `L_s = ϖ₀^(−s)O_s t`; `3` classes unramified, `2` ramified. | holds | none |
| §7.1, §7.2 | `s=1,2`; `ℚ₃(π)`, `π²=3` | `(q₀²−1)q₀²/((q₀−1)q₀) = q₀(q₀+1)`; `(q₀−1)q₀^(2s−1)/((q₀−1)q₀^(s−1)) = q₀^s`. `X³`: `π+π³=4π`. | holds | none |
| §7.3 | `p=5`; BKO21 lines 722–728 | Degrees `6, 30`; source: `(O/p^sO)^×/(ℤ/p^s)^×`, degree `p^(s−1)(p+1)`. | supported | none |
| §7.6 | level `s≥1`; BKO21 lines 754–767 | One neighbour `p^(−s)ℤ_p t + p⁻¹T`, `p` outward; `p+1` at level zero. | supported | none |
| §8.3, §8.4 | subgroups `A_s = ℤ_p^×(1+p^sO)`, `B_s = μ_(p²−1)(1+pℤ_p)(1+p^(s+1)O)` | `A_s ∩ B_s = A_(s+1)`; `A_sB_s = B_(s−1)`; index of `B_n` is `p^(2n)/p^n`. `j⁴=1` forces `j²=1`. | holds | none |
| §8.5 | `[p]w_(n+1)`; BKO21 lines 272–281 | `[(−1)^n][−p]v_(n+1) = w_n`. Source: generators differ by `(−1)^n`, footnote 2, p.948. | holds | none |
| §9.1, §9.3 | `ℚ_p(√p)`, `𝔾_m`; `p=5`, `s=0` | `N(1+√p) = 1−p ≠ 1`. `[30]x`, logarithm `750`; `−750` on both corrected sides; `[Φ₁:Φ]=600`. | holds | none |

- Source locators checked against the text: 47 (VZ07 10, Y95 13, G86 4, BKO21 7, H70 8, H68 2, LT66 5), among them every non-LT65 locator of the fifteen sampled sections; one wrong (R01).
- Library declarations opened at the pin: 22, among them `TauCeti/NumberTheory/ClassFieldTheory/Local/ArtinMap.lean:106,114,132,205,345,397` (`K : Type`, no characteristic hypothesis), `…/ExplicitCyclotomicSymbol/ArtinMap.lean:294,344,414`, `TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean:104`, `TauCeti/RingTheory/FormalGroup/Rigidity.lean:186,229`, `…/FormalGroup/Logarithm/Basic.lean:178` (`invariantDifferential`, any commutative ring), `…/Logarithm/Naturality.lean:62,88`, `…/ZSMul.lean:147`. No Lubin–Tate series, module or `FormalModule` at either pin.
- Cross-roadmap citations resolved: RelativeFarguesFontaine §2.5 (both characteristics, its Conventions), RamificationOfCompleteDiscretelyValuedFields §4a.3 ("holds in both characteristics"), ClassFieldTheory Layers 6–8 and C.6 (Artin map in every characteristic, existence in characteristic zero), GrossZagierAndArithmeticHeights §7.2, EndoscopicTransferAndUnitaryTraceComparison §§10.2, 12.3, FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.1, R07.1.8, R07.1.12–13, R07.1.20a, R07.2.8, BordismFormalGroups §F5; the citation resolver reports none missing. The five names it lists are planned names of FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.
- Gate: every check passed. Dependency check: `depcheck: 239 roadmaps, 2174 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: six `sorry` warnings, nothing else. Elaborated signatures compared with the README for all ten declarations: no binder lost; `K : Type` in Layer 2 is the universe of the pinned `artinMap`.
- Padding: decided by reading; each of the six theorems is an existence, degree or reciprocity statement that no single library lemma closes. Headlines not stated (Tate module, `Gal(K_π/K)`, universal deformation, Honda integrality, quasi-canonical classification, BKO squares) are named in the module docstring with the missing carrier.
- Overlap check: read AnticyclotomicLocalUnits, FiniteFlatGroupsAndIntegralPadicHodgeTheory, BordismFormalGroups, FunctionFieldArithmetic; Lubin–Tate torsion, division fields and Artin action in equal characteristic: owner this roadmap (earlier in the merge order), FunctionFieldArithmetic §4.1 at its head still proves them and is to cite §§2.1–2.5, as the description states; formal Lie groups and `p`-divisible groups: FiniteFlatGroupsAndIntegralPadicHodgeTheory, cited; `W(k)[[u]]`: BordismFormalGroups §F5, cited.

Source independence: 18 passages compared with 7 sources, none shared; largest share Y95, 23 of 93 locators; contents compared with Y95: independent (Layer 5 ↔ §3 and Layer 6 ↔ §4 only, in the order that the *Needs:* §5.2 of §6.2 forces; both layers also carry G86 and BKO21 material); the text of LT65 could not be read.

## Not verifiable

- §1.2 (LT65, Lemma 1, pp.381–382), §2.2, §2.3 (LT65, Theorem 2, pp.383–384) and §2.5 (LT65, §2, Theorem 3, pp.385–387): LT65 is recorded as uncertified and its text is not in the sources cache; the statements were tested by computation only.
- The remaining LT65 locators (§§0.2, 0.3, 1.1, 1.3, 1.4, 2.4, 2.6, 8.1, 8.2, 9.1): same reason.

## Source issues

- **Error** in BKO21 at Lemma 5.1(ii), printed p.956: the source says trace `±2p` gives Honda type `±x² + p` and Lubin–Tate parameter `∓p`; it should be type `∓x² + p` and parameter `±p`, as its own proof (Frobenius equals `±p`) shows; affects a stated result.

## For the human reviewers

- **Licence.** 15 of the 93 source locators cite LT65 (Annals of Mathematics 81, 1965), recorded as uncertified: the wording of `README.md` §§1.1–2.6 was not compared with that text.
