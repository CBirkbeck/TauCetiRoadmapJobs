# Review of ArithmeticKTheoryPartII (pull request #2433 at ab2c76b)

**Verdict:** needs changes

## R01 (P3) — Description states three end theorems more broadly than the head

**Location** Pull-request description, second paragraph: "and for every integer k"; "divisible by p whenever p divides the matching Bernoulli number; and there is an integral Hurewicz comparison with the integral indecomposables of BSp∞(ℤ)⁺".

**Claim** The head proves the ordinary universality only for k≥1 (§§6.3, 7.2, 7.4; all k only Bott-inverted, §7.5), divisibility only for odd parts n_j<p over smooth projective X/ℚ (§8.6), and the Hurewicz isomorphism only for 1≤i≤2p−3 (§8.4).

**Witness** README §8.6: "with n_j<p for every j … at p = max n_j a Chern-character factorial can fail to be a p-unit"; at p=3, n=3, ch₃=c₁³/6 is not 3-integral. At k=0, KSp₋₂(ℤ;ℤ/q)=0 cannot surject onto μ_q^(⊗−1).

**Repair** Replace "and for every integer k" by "and, for the Bott-inverted groups, for every integer k", and replace the "Three consequences follow" sentence by: "Three further results are proved: Aut(ℂ) acts trivially on KSp_(4k−1)(ℤ;ℤ_p) for k≥1; for a principally polarized abelian scheme over a smooth projective ℚ-variety of dimension d and a partition of d into odd parts n_j<p, the Hodge characteristic number ∫∏ch_(n_j)(ω) lies in pℤ_(p) whenever p divides the numerator of some B_(n_i+1); and KSp_i(ℤ)⊗ℤ_p is Aut(ℂ)-equivariantly isomorphic to the integral indecomposables of BSp∞(ℤ)⁺ for 1≤i≤2p−3."

## Verified sound

| Statement | Instances | README / Lean side | Source / library side | Result |
|---|---|---|---|---|
| §0.2 Picard-to-K (FGV Def 2.6, line 443) | R=ℤ: 2ℤ→3ℤ; R=ℤ[√−5], L=(2,1+√−5) | arrow ×3/2 kept; 2[L]−2 ↦ [L⊕L]−[R²]=0 although [L]≠1 | FGV lines 451–452: π₀=Pic, π₁=R×; line 455 restricts arrows to R× (misprint) | holds |
| §0.3 cyclotomic Picard classes (Cor 2.12, line 615) | L=O_q; k=1; ordinary vs Bott-inverted | [O_q]−1↦0; k=1 uses β¹ in K₂; ordinary case via ArithmeticKTheory §6.16, degree 4k−2≥2 | Cor 2.12 Bott-inverted (lines 616–624); ordinary k≥1 at line 752 | holds |
| §2.1 coefficient-line groupoids (Defs 4.3–4.4, line 1078) | ℚ(i); O_q, q odd; P⁻⊗P⁻ | Aut={±1,±i}; norm-one units of O_q are μ_(2q); (−ι)⊗(−ι)=ι⊗ι | FGV calls ι O-linear (line 1084) and Aut=μ_q (line 1353); both corrected here | holds |
| §2.2 trace polarization (§4.3, line 1127) | ℚ(i), b(x,y)=(i/2)xȳ, Φ={id} | h(1,1)=1, h(1,i)=−i, ω(1,i)=−1; positive compatible J is −i | (4.7), (4.9): Im⟨,⟩_b=−Tr b (lines 1139–1171) | holds |
| §2.3, `exists_split_prime_with_signs` (Lemma 4.8, line 1263) | q=3, K⁺=ℚ, ε=±1 | t=±7; 3∉(7); 7=(3+ζ₃)(3+ζ̄₃), norm 9−3+1; 2 inert | proof lines 1275–1293 via (4.14)–(4.15); "real embeddings of O_q" misprint, line 1265 | true; binders present |
| §2.4, `exists_cm_lines_with_ideal_product` (Prop 4.7, line 1232) | B₁=x, δ₁=δ₀t⁻¹; B₂=L·L̄⁻¹·x⁻¹, δ₂=δ₀t | both products equal (δ₀)=𝔡⁻¹; both types flip by sgn τ(t); B₁B₂=L·L̄⁻¹, a=1 | same construction, lines 1247–1274 | true |
| `IsSkewCMLine` | ℚ(i), B=ℤ[i]: δ=i/2, i, 0, −i/2; (2B, i/8) | (i/2)=𝔡⁻¹ holds; (i) has index 4, fails; 0 fails; type reverses; (i/8)(4)=(i/2) holds | type rule (4.10), line 1174 | discriminating |
| `conjugateFractionalIdeal` | ℚ(i): (2+i), (1/2), 0, 1 | (2+i)↦(2−i), product (5); (1/2), 0, 1 fixed | `FractionalIdeal.ringEquivOfRingEquiv` maps by the fraction-field lift (FractionalIdeal/Operations.lean:972) | correct |
| §3.2 Hodge character (Prop 5.2, line 1378) | q=5; i=1, 2; Φ={1,2}, {4,2} | i=1: 3 and 1, difference 2; i=2: 0 and 0 | line 1399: switching ±1 changes the sum by (−1)^i−1 | holds |
| §3.5 CM generation (Prop 5.1, §5.3, line 1447) | q=5, k=1; q=691, k=6 | Minkowski 1.621·0.0938·11.18≈1.70<2, h=1; B₁₂=−691/2730, 346·2≡1 mod 691 | four-class Betti value 2·tr(β^(2k−1)([L]−1)), lines 1465–1473 | holds |
| §3.6 periodic comparison (Cor 3.10, Rem 3.11, line 989) | i=1, −2, −4 | K^(β)₁(ℤ;ℤ/q)=ℤ/q lies in ψ⁻¹=−1 part, so KSp^(β)₁=0=KSp₁; KU part ℤ/q at −2, 0 at −4 | line 990: all i∈ℤ | holds |
| §4.1 Γ-groupoid (App. A.4, (A.12), line 2729) | T={*}; T={*,a,b} | A({*}) has one arrow between any two objects, contractible; grade (1,2) folds to 3 | lines 2744–2770; "Rosati defined by φ" misprint, line 2747 | holds |
| §6.1 finite action (Lemma 7.7, line 1805) | q=5; σ=c; χ(σ)=2, k=2 | c is +1 on T_q, −1 on M_q; quotient weight 2³=3 mod 5 | equivariance computation, lines 1839–1853 | holds |
| §7.1 continuous extensions (§7.4, line 1968) | Γ=C₂, H=1, M=ℤ_p sign; Γ=H=1 | H_*(C₂;M)=0 and H₀=M/2M=0, so H₁(C₂,1;M)=ℤ_p; zero kernel | (7.20), line 1995 | holds |
| §8.2 product formula (Lemma 8.5, line 2318) | K(ℤ/p²,1)×K(ℤ/p,1); S¹×S¹ | Tor₁(ℤ/p²,ℤ/p)=ℤ/p in degree 3, d=1, β₁(x)=pu; degree-2 product dies | d=min(k,l), generator β_d(xy), lines 2330–2333 | holds |
| §8.4, `groupHomology_map_symplecticBlockSucc_stable` (MvdK Thm 4.1) | usr(ℤ)=2; i=0; i=1, L=ℤ | ranges 2i+5, 2i+6; H₀ identity; H₁=ℤ/12, ℤ/2, 0 for g=1, 2, ≥3; only g=2→3 fails, below 8 | mirzaiiVanDerKallen2002 lines 294–295: n≥2i+usr+3, +4; Thm 3.4, line 254 | holds |
| §8.5 Hodge generators (FGV line 43; borel1974 §11.4) | degrees 2, 4; χ=2 over ℚ₅; q=2 at g=8, 9 | cohomology eigenvalues 1/2, 1/4, homology 2, 4; 8<9 holds, 8<8 fails | borel1974 line 1249: P({x_(4i−2)}) for Sp_2n; FGV χ^(2k−1) on homology | holds |
| §6.3 finite universality (Thm 7.1, line 1668) | q=5 | (1/2)H=3H and c_B(3H(x))=6x=x | Lemma 7.4, line 1747; Lemma 7.6 | holds |
| §7.2 p-adic universality (Thm 7.8, line 2009) | p=3, k=1 | K₂(ℤ;ℤ₃)=0, so c_H gives KSp₂(ℤ;ℤ₃)≅ℤ₃(1) | lines 2009–2021 | holds |
| §7.4 local universality (Thm 7.10, line 2044; §7.3) | q=3 | D₃=C₂; H₁(C₂,C₂;ℤ/3(1))=0=H₁(C₂,⟨c⟩;ℤ/3(1)) | Lemmas 7.12–7.13, line 2067 | holds |
| §7.5 Bott-inverted universality (Thm 7.14, line 2133) | q=5; k=0 and 2 | exponents −1≡3 mod 4; degrees −2 and 6 differ by the period 8 | line 2133: every k∈ℤ | holds |
| §7.6 degree 4k−1 (§7.7, line 2154) | p=3, k=1, ℓ=2; ℓ=19; p=5 | H¹=ℤ₃/(2²−1)=ℤ/3; 19²−1=360 gives ℤ/9; 5∤48 | footnote 13, line 2193, writes χ^(2k−1) (misprint for χ^(2k)) | holds |
| §7.7, `existsUnique_conj_fixed_prime_iff_not_dvd_classNumber` (Rem 7.9) | q=3; q=37; plus and minus torsor ℤ/3 | q=37: 37 primes, one σ-fixed, h(K⁺)=1, both sides true; plus torsor fixes all 3 | line 2036 says ℘(q) singleton (error; ℘(q)^c meant) | true as stated |
| `pHilbertClassField` | ℚ(√−26), h=6; ℚ(ζ₂₃), h=3; p=0, 1 | degree 3 at p=3, 2 at p=2; H at p=3, K at p=23; K at p=1, H at p=0 | `Nat.Coprime n 0 ↔ n = 1` | correct |
| §8.6 Bernoulli divisibility (Thm 8.1, line 2217); R01 | p=3, n=3; d=0; n=11, p=691 | ch₃=c₁³/6 not 3-integral, excluded; s=#X(ℂ) a unit, antecedent false; s∈691ℤ_(691) | line 2218 allows p≥max n_j (error at p=n_j) | README correct; PR text not |

- Locators checked against the text: FGV at all 15 sampled targets plus 17 more (Conventions, §§0.1, 0.4–0.5, 1.1–1.2, 3.1, 3.4, 4.3–4.5, 5.1–5.4, 6.2–6.3, 7.2–7.6, 8.6); mirzaiiVanDerKallen2002 lines 46, 117–125, 238–240, 254, 293–296; borel1974 lines 1154, 1194, 1246–1249.
- Library declarations at the pins: 28 of 28 named Mathlib and Tau Ceti declarations exist at the stated files; read `FractionalIdeal.ringEquivOfRingEquiv` (Operations.lean:972), `groupHomology.inhomogeneousChains.d_single` (GroupHomology/Basic.lean:132, inverse action), `Matrix.J` (SymplecticGroup.lean:59), `TauCeti.SymplecticForm.exists_compatible` (ExistsCompatible.lean:186, ω(v,Jv)>0), the Künneth projective-dimension hypothesis (Kunneth/Sequence.lean:376), `TauCeti.symplecticBlockSucc` (BlockSucc.lean:243).
- Cross-roadmap citations: every cited id of the 27 supplier roadmaps exists on main or at its open head; content read for ArithmeticKTheory §§3.4 (4q<rk_ℚ), 3.5, 6.11, 6.16; HermitianKTheoryOfPoincareCategories §§0.5, 4.11, 6.6, 8.1, 8.3; StableHomotopyKTheory §§3.20, 3.34–3.37, 4.6, 4.9, 4.18, 4.27; GeneralAlgebraicKTheoryPartII §4.20; EtaleHomotopyTypes §§5.2–6.9; GeneralizedCohomology G5.4–G5.5; CharacteristicClasses C6.2–C6.3.
- Gate at ab2c76b: every check OK; dependency check: `depcheck: 249 roadmaps, 2363 edges, 0 problem(s)`; no change outside the folder.
- Elaboration: `lake env lean` on `TauCetiRoadmap/ArithmeticKTheoryPartII/Suggested.lean` gives the 4 `sorry` warnings and nothing else; `#check @` of all 7 declarations matches the README statements with no binder lost; one-tactic probe (simp, rfl, infer_instance, decide) closes none of the 4 theorems.
- Declared gaps: 13, each with the same slug in `design/plan.json` and in the README contracts, each with a named supplier; EtaleHomotopyTypes §6.9 and IntegralIwasawaTheory §12.3 read: neither already states what its gap asks.
- Ownership: all 462 open heads and main searched for symplectic homology stability, KSp, FGV, integral indecomposables, the p-Hilbert class field and the 7 Lean names: no second owner, no name clash; EtaleHomotopyTypes and ArithmeticKTheory scope sections hand the KSp action to this roadmap.

Overlap check: read ArithmeticKTheory, KTheoryFiniteLocalFields, BorelRegulators, StableHomotopyKTheoryPartII, GeneralAlgebraicKTheoryPartII (open), StableHomotopyKTheory, CyclotomicClassGroupsAndStickelberger, TangentialBordism (main); third list empty. Shared objects: cyclotomic Bott/Picard descent, Adams signs and Borel's comparison, owned by ArithmeticKTheory; group completion and Moore/telescope interfaces, owned by StableHomotopyKTheory and GeneralAlgebraicKTheoryPartII; finite-field Bott classes, owned by KTheoryFiniteLocalFields; cyclotomic unramified p-towers, owned by IntegralIwasawaTheory and CyclotomicClassGroupsAndStickelberger (this roadmap only asks ClassFieldTheory for the Tau Ceti carrier); all cited, none restated. Symplectic stability, the KSp action and integral indecomposables are owned here.

Source independence: 24 passages compared with 3 sources (whole README also scanned for 6-word runs against all three), none shared beyond titles and URLs; largest share FGV, 157 of 176 source citations; contents compared with FGV: independent. L0↔§2, L1+L3↔§§3, 5, L4↔§6.1–6.2+App. A, L5↔§6.3+§7.1, L6–L7↔§7, L8↔§8+§1.1; FGV §§3, 6, 7 are split across layers, and the Needs chain (§3.1→§§0.1, 1.1, 2.1–2.2; §4.5→§3.5; §5.1→§4.4; §6.1→§§3.4–3.5, 4.5, 5.1; §7.2→§6.3; §8.6→§§7.4, 8.4) forces the order.

## Not verifiable

- charney1987, §4 and Corollary 4.5 (§8.4): the manifest records it as uncertified (paywalled), so I did not read it; the stability range was checked against mirzaiiVanDerKallen2002 Theorem 4.1 instead.

## Source issues

- **Misprint** in FGV at Definition 2.6, p. 10: the source says arrows between fractional ideals are multiplications by x∈R× with xI=I′; it should be x∈Frac(R)×; affects nothing.
- **Misprint** in FGV at Definition 4.3, p. 24: the source says the involution ι of ω is O-linear; it should be conjugate-linear, as its examples (conjugation and its negative) are; affects nothing.
- **Misprint** in FGV at Lemma 4.8, p. 28: the source says S=Hom(O_q⁺,ℝ) is the set of real embeddings of O_q; it should be those of O_q⁺; affects nothing.
- **Misprint** in FGV at the proof of Lemma 4.8, p. 28: the source says K_q/K_q⁺ is totally ramified at the prime above q; it should be the prime above p; affects nothing.
- **Error** in FGV at §5.1.2, p. 30: the source says Aut(L,b)=μ_q; it should be the norm-one units μ_(2q), with μ_q a subgroup; affects nothing.
- **Misprint** in FGV at §7.2 point (a), p. 39: the source says generation was shown in the proof of Proposition 5.2; it should be Proposition 5.1; affects nothing.
- **Misprint** in FGV at §7.5, p. 44: the source says G is the Galois group of the largest extension "unramified p"; it should be unramified outside p; affects nothing.
- **Error** in FGV at Remark 7.9, p. 44: the source says Vandiver's conjecture is equivalent to ℘(q) being a singleton; it should be the conjugation-fixed subset ℘(q)^c, since ℘(q) is a singleton exactly when p∤h(K_q); affects a stated result.
- **Misprint** in FGV at §7.7, p. 47: the source says injectivity of c_B is Theorem 3.3; it should be Theorem 3.5; affects nothing.
- **Misprint** in FGV at §7.7, footnote 13, p. 47: the source says ℤ_p^× acts on ℚ_p/ℤ_p(2k) through χ^(2k−1); it should be χ^(2k); affects nothing.
- **Misprint** in FGV at §1.1, p. 1, against §8, p. 48: the source quotes Charney's isomorphism range as g≥2i+5 in one place and i<(g−5)/2, i.e. g≥2i+6, in the other; it should be one range (mirzaiiVanDerKallen2002 Theorem 4.1 at usr(ℤ)=2 gives g≥2i+6); affects nothing.
- **Error** in FGV at Theorem 8.1, p. 48: the source says divisibility holds for primes p≥max n_j; it should be p>max n_j, since ch_n has denominator n! (ch₃ is not 3-integral); affects a stated result.
- **Gap** in FGV at Theorem 8.4 and its proof, pp. 49–50: the source says τ≤2p−2Ω∞E splits as an H-space, giving degrees ≤2p−2; the delooping's possible P¹ k-invariant permits splitting only through degree 2p−3; affects a stated result.
- **Misprint** in FGV at Appendix A.4, p. 59: the source says the Rosati involution is defined by φ; it should be defined by the polarization L; affects nothing.

## For the human reviewers

- none
