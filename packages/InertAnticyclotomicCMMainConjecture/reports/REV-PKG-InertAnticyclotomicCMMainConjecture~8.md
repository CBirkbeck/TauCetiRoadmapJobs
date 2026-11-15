<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13122#issuecomment-6902128732 -->
Review (claude) of c11dec5

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §3.1 states a fact that needs §3.3, and §3.3 needs §3.1

   **Location:** `packages/InertAnticyclotomicCMMainConjecture/README.md:437` “The localisation of C lies in H^ε”; line 439 “Localisation of each c_a lies in H^ε because its derivatives at χ∈Ξ^(−ε) are multiples of the forced central zeros”; line 444 “localises to the corresponding local elliptic-unit class under §§0.2 and 3.3”; line 447.

   **Claim:** H^ε is defined in §1.5 as a limit of annihilators. The derivatives δ_χ live on V_R, so “its derivatives at χ” and the conclusion from them use H≃V_R with H^ε↦V_R^ε (§3.3) and the kernel criterion (§0.5). The *Needs:* line of §3.1 lists neither, and §3.3 is downstream of §3.1.

   **Witness:** line 456 (§3.1 *Needs:* “§0.4; §1.5; §2.1; §2.3; …”, no §3.3, no §0.5); line 475 (§3.2 *Needs:* “… §3.1 …”); line 489 (§3.3 *Needs:* “§1.5; §3.2; §0.5; …”). Loop: 3.1 → 3.3 → 3.2 → 3.1.

   **Exact repair:** move the membership statement to §3.3, where its inputs are.

   - §3.1, statement: delete “The localisation of C lies in H^ε” and end the paragraph with “(AHII05 §3, p.614, before Proposition 3.1)”.
   - §3.1, route: delete the last sentence (“Localisation of each c_a lies in H^ε because …”).
   - §3.1, API: replace the second bullet by “Every c_a belongs to C.” and delete the fifth bullet.
   - §3.1, *Needs:*: delete “§2.3” and “NCM.1/elliptic-reciprocity, NCM.3/forced-central-zero”.
   - §3.3, statement: after “and the localisation of each c_a onto its local elliptic-unit projection” add “Consequently the localisation of C lies in H^ε (AHII05 Proposition 3.1, p.614).”
   - §3.3, route: add “The image of loc(c_a) in V_R has derivatives at χ∈Ξ^(−ε) that are multiples of the forced central zeros of §2.3 (AnticyclotomicLocalUnits §4.3; NonordinaryCMSpecialValues NCM.1/elliptic-reciprocity, NCM.3/forced-central-zero), so it lies in V_R^ε by §0.5.”
   - §3.3, *Needs:*: “§1.5; §3.1; §3.2; §2.3; §0.5; AnticyclotomicLocalUnits §§2.4, 3.6, 4.3; NonordinaryCMSpecialValues NCM.1/elliptic-reciprocity, NCM.3/forced-central-zero; ArithmeticGaloisDuality §R02.4.2”.
   - §4.2, route (line 555): “C⊂S_ε is nonzero (§§2.3, 3.3)” and “contradicting §3.3”.
   - Layer 3 Dependencies: add “AnticyclotomicLocalUnits §4.3” to the external inputs.

   Tested on the refuting instance: after the change the lines give 3.1 → {0.4, 1.5, 2.1}, 3.2 → 3.1, 3.3 → {3.1, 3.2, 2.3, 0.5}; no loop, and every input of the membership statement is listed where it is stated.

2. **F02** (P3) an API bullet of §2.1 asserts a Layer 3–4 fact

   **Location:** `README.md:343`: “ξ is the localisation, under §§0.2 and 3.3, of a specified element of the global module C of §3.1.” Also line 338 (“the comparison diagram of §3.1”) and line 351.

   **Claim:** C is spanned by the smoothed classes c_a, and ξ comes from the unsmoothed normalised family. That ξ is the image of an element of C holds only because one smoothing factor is a unit of Λ_R, which is the computation of the §4.5 route. The bullet therefore needs §§3.1, 3.3 and 4.5, none of which §2.1 lists, while §3.1 lists §2.1.

   **Witness:** line 354 (§2.1 *Needs:* “§0.1; §0.2; §0.5; AnticyclotomicLocalUnits §4.2; …”); line 456 (§3.1 *Needs:* “… §2.1 …”); line 606 (§4.5: “N(a)−φ(a)=α(ᾱ−1)≡2·(2−1)=2 modulo p, a unit”).

   **Exact repair:**

   - §2.1, API bullet 2: “ξ is the image of a specified norm-compatible global family, the normalised classes of moduli f p^(n+1); its relation to the global module C is §4.5.”
   - §2.1, route, last sentence: “Keep the global family together with its local projection; §4.5 compares it with the module C of §3.1.”
   - §2.1, third Check: replace “the localisation of an element of C” by “the localisation of a global class”.
   - §4.5, statement: add “In particular ξ is, up to the period and trace units of §§0.1 and 0.4, the image under §3.3 of the localisation of an element of C: for the ideal a of the route, (N(a)−φ(a)γ_a)⁻¹·c_a.” Add “§2.1” to the *Needs:* line of §4.5.
   - §3.1, *Needs:*: delete “§2.1”, which §3.1 then no longer uses, and in the Layer 3 introduction (line 433) replace “and the primitive class of §2.1” by “and the supplied elliptic units”.

   Tested: with a=(α), α≡1 modulo 6f and α≡2 modulo p, the factor has residue 2 at p=5 and p=7, so the inverse exists in Λ_R; the lines then give 2.1 → {0.1, 0.2, 0.5}, 3.1 → {0.4, 1.5}, 4.5 → {3.3, 3.1, 2.1, …}, with no backward edge.

3. **F03** (P3) §1.5 cites p.615 for modules the source defines on p.614

   **Location:** `README.md:303`: “Let H=lim_cor H¹((K_n)_𝔭,T′) and H^s=lim_cor L_n^(s,⊥) (AHII05 §2, pp.612–613, and §3, p.615, before Proposition 3.3).”

   **Claim:** The cited place on p.615 defines the duals X only. The limit of the local cohomology and its signed submodules are defined a page earlier.

   **Witness:** AHII05 line 146 (p.614, before Proposition 3.1) defines the two local limits; AHII05 line 175 (p.615) defines the duals.

   **Exact repair:** replace the parenthesis by “(AHII05 §2, pp.612–613, for the Selmer groups and their limits; §3, p.614, before Proposition 3.1, for H and H^s; §3, p.615, before Proposition 3.3, for X_a)”. Checked against AHII05 lines 91–97, 123–126, 146 and 175.

Three findings, all P3, none blocking. All five findings of round 7 are repaired. Two of the new findings are loops in the README's own dependency lines (a target states a fact whose inputs are later targets that depend on it); the third is a locator. No statement was found false. None of the four authored files was modified.

## Verified sound

### Previous findings (round 7), finding by finding

| Finding | Status | Repaired passage | Verification |
|---|---|---|---|
| F01, gap not minimal | **repaired** | Line 73: “Use §2.1 for Kato's CM theta function … §2.2 for the standard elliptic unit … §2.3 … §2.6 … §2.9”; line 75: “the norm from K(g𝔮pⁿ) to K(gpⁿ) sends _az_(g𝔮pⁿ) to (_az_(gpⁿ))^(1−Frob_𝔮⁻¹) when 𝔮∤g” | Supplier §§2.1–2.3, 2.6, 2.9 read at its head (lines 336–431, 447–463); it states the p-tower norm only. Relation recomputed below. `design/plan.json` carries the same slug, supplier and sentence |
| F02, §3.2 indeterminate | **repaired** | Line 462: “restriction is an isomorphism of H¹(K_n,W) onto the G-invariants of H¹(FK_n,W)” | #G ∈ {3, 72} at ℚ(√−23), p=5; surjectivity onto invariants of the Selmer groups checked through local injectivity |
| F03, §4.5 route open | **repaired** | Line 606: “These distribution factors generate the unit ideal of Λ_R.” | α(ᾱ−1)≡2 modulo p; agrees with the supplier's §2.6 API and §2.7 Check |
| F04, rational Selmer groups undefined | **repaired** | Line 278: “let Sel_a(K_n,V_T) … be the Selmer group of the instance … on the rational module V_T”; line 290 | Corank and lifting argument recomputed below; every later use points to §1.4 |
| F05, “change of the place” | **repaired** | Line 243: “unchanged when ι_p is replaced by ι_p∘g with g∈G_K, which keeps the embedding of K and the unique place” | Stability of A_n^s under Gal(Ψ_n/Φ) from λ_χ(hy)=χ(h)λ_χ(y); ζ₅∉ℤ_25 |

Nothing in the repair report was marked “not actionable”; nothing is re-raised. No maintainer note was given. The repaired patterns were searched in the rest of the package: no other gap asks for what a supplier states; no other target is stated by reference to a source's sections; no other route leaves its statement open; no other object is used before it is defined. The search for mis-ordered dependency lines, prompted by the new *Needs:* entries of the repair, gave R01 and R02.

### Adversarial table (values computed this round)

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| Gap norm relation, 𝔮∤g | E′=ℂ/m𝔮, point 1, m=gpⁿ | Conjugates over K(m): the N𝔮−1 points x≡1 mod m with x≢0 mod 𝔮; product over all N𝔮 points is θ_(ℂ/m)(1) by the isogeny law; the missing point gives σ_𝔮⁻¹θ(1); norm = θ(1)^(1−Frob⁻¹) | Holds |
| Gap norm relation, 𝔮∣g | same, 𝔮∣m | Degree N𝔮, orbit the full coset, no missing point, norm = θ(1) | Holds |
| Injective units modulo gpⁿ | roots of unity u≠1 of K | N(u−1)∈{1,2,3,4}; p²≥25 | Holds |
| §3.1 Euler system is well defined | F⊂𝒦_a of conductor c·p^k | Least modulus lcm(f,c)·p^max(1,k), prime-to-fp part prime to 6pa; primes of m_F′/m_F not dividing m_F are exactly Σ(F′/F) of the supplier's §2.2; primes dividing m_F give no factor | Holds |
| §3.1 Euler factor of T′ | K=ℚ(i), p=7, α=−1+2i | T′* has Frobenius φ(𝔮), so P=1−φ(𝔮)⁻¹x; α−1=i(2+2i); 1−ᾱ/5=(6+2i)/5≠0; untwisted 1−1=0 | Holds |
| §0.4 dual lattice | R=O; R=O[√π] | Tr_(O/ℤ_p)(1)=2; different (2√π)=(√π), quotient of order p² | Holds |
| §1.2 independence | n=2, p=5; β³=aπ | 20 characters of order 25; u=χ(γ)=ζ₅∉ℤ_25; a⁴ of order 6, cubes of μ_24 are μ_8, 6∤8 | Holds |
| §1.3 away from p | good v, q=4 | \|α\|=\|q/α\|=2≠1, so H⁰=H²=0 and H¹=0; integrally W(−1)^Frob≠0 iff α≡q | Holds, rationally only |
| §1.4 definitions | n=0; model L/R⊕R/ϖ_R; v∤p for T′ | Sel_+=Sel_str, Sel_−=Sel; corank 1 = dimension 1; H¹(K_v,T′) is unramified at good v, so Sel_rel(K_n,T′)=H¹(G_(K_n,S),T′) | Holds |
| §1.4 lifting step | divisible class of Sel_a(W) | Image in the finite H²(T)_tors is 0; defect lands in a finitely generated R-module, so it is 0 on a divisible group | Holds |
| §1.5 contragredient action | L=Φ(ζ₅), x=(ζ₅−ζ₅²)/25 | f(x)=0; f(γ⁻¹x)=Tr(1−ζ₅)/25=10/25=2/5; dual of γ−χ(γ) is −χ(γ)γ⁻¹(γ−χ(γ)⁻¹) | Holds |
| §2.2 special values | χ=1; χ ramified | 1−(−p)/p²=6/5 at p=5; factors at primes of f and at p are 1; BKO21 (3.6) deletes p, (3.7) does not | Holds |
| §2.4 coordinate | ξ=Tv, v′=(1+T)v; ξ=πv | T/(1+T), ideal (T); π, ideal (ϖ_R)^e | Holds |
| §2.5 interpolation | a=γ, χ(γ)=ζ₅ | δ_(χ⁻¹)(γv)=ζδ_(χ⁻¹)(v); ζ⁴≠ζ; φ̄χ⁻¹=conjugate(φχ) | Holds |
| §3.2 descent | ℚ(√−23), p=5 | #G=3, 72; local degrees 1, 24; cor∘res=#G∈ℤ₅× | Holds |
| §3.3 local module | W[π]; n=0 | (u−1) is a unit for u∈μ_(p²−1), u≠1, so no fixed vector; rank H¹(Φ,T′)=2 | Holds |
| §3.5 strict comparison | K₀=H(E[5]) | [K₀:K]=72, prime to 5; Lubin–Tate character of order 24 nontrivial on the decomposition group; RUB91 Theorem 4.1(ii) hypotheses met | Holds |
| §4.1 sequences | pairs (signed, relaxed), (strict, signed) on T′ | Duals on W: (signed, strict), (relaxed, signed); ranks s=ε: 1,1,1,1,0 and 0,1,1,1,1; s=−ε: 0,1,1,0,0 and 0,0,1,1,0 | Holds |
| §4.2 opposite torsion | rank count | rk X_s = rk S_s − 1 + 1 − 0; S_+∩S_−⊂S_str | Holds |
| §4.3 symmetry | K=ℚ(i), p=7, α=−1+2i; T↦(1+T)⁻¹−1 | Character of W^τ at Frob_(α): ᾱ=5/α=φ_p⁻¹χ_cyc; (T) fixed, (T−a) moved | Holds |
| §4.4 (headline) | C=(T²), S_ε=(T), char X_str=(T) | (T)(T)=(T²)=char(Λ_R/(T²)); torsion sequence right exact because the kernel is torsion | Holds |
| §4.5 lattice | α≡1 mod 6f, α≡2 mod p; α≡1 mod p | Residue 2 (unit for p≥5); residue 0 | Holds; see R02 |
| §4.6 (headline) | L_p=T, d=2; L_p=π | Norm (T²); (π)=(ϖ_R)^e, μ=e | Holds |
| §5.1 control elements | n=0; p=5, n=2 | ω_0⁺=1, ω_0⁻=γ−1; degrees 20+5=25; zero sets Ξ⁻ and Ξ⁺; ω_n^s·A_n^s=0 because A_n^s carries only Ξ^(−s) | Holds |
| §5.2 local control | p=5, n=2; n=1, s=+ | Coranks 20 and 5 on both sides; 0=0; Φ_(p^k)(γ⁻¹)=γ^(−φ(p^k))Φ_(p^k)(γ) | Holds |
| §5.3 signed control | v∣f; χ(ω_n^s)=0 | W^(I_v) proper, hence finite; χ∈Ξ^(−s) iff χ⁻¹∈Ξ^(−s) | Holds |
| §5.4 decomposition | χ=1, ε=+; order 25 | A_n⁻ retains Ξ⁺: Sel_−^1=Sel^1; not asserted for Ξ⁻ | Holds |
| §5.5 length | A/𝔪^k; κ²; f=T−(ζ₅−1) | (1,k); (2,2); ord_ζ f=1, ord_(ζ⁻¹) f=0 | Holds |
| §5.6, §6.1 | X_str=Λ_R/(g²); char=(fg) against (f) | Dimension 1, order 2; (fg)⊆(f), orders 1≤3 | Holds |
| §6.2 local correction | n=0; ℚ_p-coefficients | Φ[G] has each χ once: 1; 2pⁿ over ℚ_p would give 2 | Holds |
| §6.3–6.4 (headline) | χ=1, ε=±; orders 5, 25, ε=+ | ≤ord₁; ≤ord₁+1; ≤ord_χ; ≤ord_χ+1; conductor pⁿ in BKO21 means order p^(n−1), covered by n≥r | Holds |
| §3.1/§3.3 dependency lines | lines 456, 475, 489 | 3.1 → 3.3 → 3.2 → 3.1 | Loop: R01 |
| §2.1 API bullet 2 | lines 343, 354, 456, 606 | Needs 3.1, 3.3, 4.5; 3.1 needs 2.1 | Loop: R02 |
| §1.5 locator | AHII05 lines 146, 175 | p.614 against p.615 | R03 |

Standing hypotheses in scope: p≥5, p inert, p∤h_K, R finite over O; “E defined over K” is displayed at §§5.2–5.4, 5.6, 6.2–6.4.

### Source sample (the 15 seeded targets)

| Target | Locator read | Result |
|---|---|---|
| 0.4 | BKO21 lines 852–860 (pp.961–962); AHII05 lines 99–102 (p.613), 190–211 (p.615) | Local module, Lubin–Tate parameter −p, (3.2): supported |
| 1.3 | AHI06 lines 236–243 (p.1006); BKO21 lines 870–872 | Lemma 1.1.4 and its consequence: supported |
| 1.4 | BKO21 lines 866–872 (p.962); AHII05 lines 78–97, 114–126 (pp.612–613) | Signed, strict, relaxed, ordinary conditions: supported |
| 2.2 | BKO21 lines 467–478 (p.953), 823–830 (p.961) | (3.6)–(3.7), Proposition 3.3, values of ξ: supported |
| 2.4 | BKO21 lines 833–839 (p.961) | C_∞, the generator and the coordinate: supported |
| 3.1 | AHII05 lines 132–144 (p.614) | Auxiliary ideals prime to 6pf, the twist, the module C: supported |
| 3.2 | BKO21 lines 875–886 (p.962) | Transfer under (6.1): supported |
| 3.5 | AHII05 lines 182–189 (p.615); RUB91 lines 484–507, 545–551, 565–571 (pp.36–37); AHI06 lines 1081, 1124, 1234, 1290 | Proposition 3.3(ii); Theorem 4.1(ii) and Remark (2); the twisting lemmas on pp.1028–1029, 1032–1033: supported |
| 4.1 | AHII05 lines 219–220 (p.616), 266–268 (p.617) | (3.3) and (4.3): supported |
| 4.6 | BKO21 lines 880–886 (p.962) | Theorem 6.1: supported |
| 5.3 | AHII05 lines 343–391 (pp.619–620) | Theorem 5.2 and the places above f: supported |
| 5.5 | BKO21 lines 894–905 (pp.962–963) | “Standard arguments” step: supported; the algebra is checked above |
| 6.2 | BKO21 line 904 (p.963) | The loss of at most one dimension: supported |
| 6.3 | BKO21 lines 906–908 (p.963); AHII05 lines 343–346, 392–394 | Matching-parity case: supported |
| 6.4 | BKO21 lines 888–893 (p.962) | Theorem 6.2, E over K, conductor pⁿ: supported |

Also read: BKO21 lines 245–252 (p.948, the conductor convention), 285–309 (p.949), 366–413 (pp.950–951); AHII05 in full; RUB91 lines 162–206 (pp.28–29); BIL86 lines 284–295 (p.350, standing hypotheses), 319–322 (p.351), 342–345 (p.352), 366–381 (p.353, the Leopoldt hypothesis), 610–640 (pp.364–365). No locator was flagged by the author as unverified. Every cited work has one manifest key; nothing was fetched and the manifest was not changed.

### Pins (opened this round, paths relative to the libraries)

Mathlib: `Module.length` (`Mathlib/RingTheory/Length.lean:31`), `Module.length_le_of_surjective` (:202), `Module.length_eq_finrank` (:293), `IsLocalRing.length_restrictScalars` (`Mathlib/RingTheory/LocalRing/Length.lean`), `Polynomial.cyclotomic` (`Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean:227`), `cyclotomic_prime_pow_mul_X_pow_sub_one` (:525), `Module.Basis` (`Mathlib/LinearAlgebra/Basis/Defs.lean:89`), `Ideal.span_singleton_mul_left_unit` (`Mathlib/RingTheory/Ideal/Span.lean:100`), `IsGalois.normalBasis` (`Mathlib/FieldTheory/Galois/NormalBasis.lean:119`), `IsDedekindDomain.selmerGroup` (`Mathlib/RingTheory/DedekindDomain/SelmerGroup.lean:161`), `IsRegularLocalRing` (`Mathlib/RingTheory/RegularLocalRing/Defs.lean`).

Tau Ceti: `completedGroupAlgebra` (`TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean`), `IsCompactModule.completedGroupAlgebraModule` (`Module.lean` there), `Iwasawa.charDivisor` (`TauCeti/RingTheory/Iwasawa/Char/Divisor.lean:87`), `Iwasawa.charIdeal` (`Char/Ideal.lean:85`), `IsPseudoIsomorphism.charIdeal_eq` (:125), `charIdeal_eq_mul_of_exact` (:132), `LinearEquiv.charIdeal_eq_comap` (:152), `charIdeal_quotient_span_singleton` (:198), `PowerSeries.isRegularLocalRing` (`TauCeti/RingTheory/RegularLocalRing/PowerSeries.lean:157`), `ringKrullDim_of_isDiscreteValuationRing` (same file), `IsRegularLocalRing.uniqueFactorizationMonoid` (`UniqueFactorization.lean:59`), `ContCohomology.SelmerStructure`, `localization`, `selmerGroup`, `mem_selmerGroup_iff` (`TauCeti/RepresentationTheory/Homological/ContCohomology/SelmerStructure.lean:69`, 86, 97, 103), `H1` (`LowDegree.lean:829`), `WeierstrassCurve.selmerStructure`, `selmerGroup`, `kummerSelmerMap`, `kummerSelmerMap_injective` (`TauCeti/AlgebraicGeometry/EllipticCurve/GaloisCohomology/Selmer/Basic.lean:147`, 176, 223, 238), `fg_point_of_numberField` (`MordellWeil/FinitelyGenerated.lean`), `selmerGroup₂` (`MordellWeil/SelmerGroup.lean`), `selmerGroupA` (`MordellWeil/SelmerGroupA.lean`).

Every backticked name of the README resolves at the pins or at its supplier (`IsCanonicalGrossCharacter`, `canonicalGrossExistence`: ComplexMultiplicationAndExplicitReciprocity §4.3). The README gives no backticked name of its own, and `Suggested.lean` declares none.

### Suppliers at their current heads, and the dependency check

Resolved every cited section by heading at the head of each supplier's open pull request, or on main: NonordinaryCMSpecialValues §§2.1–2.3, 2.6, 2.9 and the table of the former `NCM.k` numbering (its lines 128–137), with §§0.4, 1.4, 1.5, 2.7, 2.8, 2.10, 3.3–3.5, 6.4 as the places the `NCM.k/…` citations name; AnticyclotomicLocalUnits Conventions and §§0.1, 0.5, 1.2–1.5, 2.4, 3.1, 3.2, 3.6, 4.2–4.4, 8.2, 8.4, 8.5; SelmerIwasawaCohomology §§2.1–2.6, 2.10, 2.13, 2.18 (finite generation, as cited), 2.19, 3.0, 3.1, 3.3, 3.10–3.12, 3.16; ArithmeticGaloisDuality §§R02.2.2, R02.2.3, R02.4.2–R02.4.4, D7.7.1–D7.7.2; EulerSystemsAndKolyvaginSystems §§2.2 (definition read in full and used in the table), 8.1, 8.11, 8.25; IntegralIwasawaTheory §§2.2, 4.1e, 4.2, 4.3, 4.4; ComplexMultiplicationAndExplicitReciprocity §§4.1, 4.3; LubinTateFormalModulesAndQuasiCanonicalLifts Layers 0–2, 8 and §§2.4, 2.5, 8.2, 8.3; NoncommutativeAndEquivariantIwasawa §4.3 (CM over ℚ, good ordinary p, as the Scope says); on main: PadicMeasuresIwasawaAlgebras §§1.7, 4.3, 4.5, 4.6 (restriction of scalars to ℤ_p only), EllipticCurves Layers 1, 3, 4, 7, ClassFieldTheory Layers 6, 11–13.

Declared gaps: all five have the same slug in `design/plan.json` and in the README and a named earlier supplier. `elliptic-unit-euler-system` is now precise and minimal (the relation is true, computed above; the supplier states the p-tower norm only). `inert-two-variable-main-conjecture` restates RUB91 Theorem 4.1(ii) with its hypotheses. `restriction-of-scalars-finite-extension` is not derivable from the ℤ_p form, since the norm is not injective on ideals. `character-prime-multiplicity` and `leopoldt-abelian-over-imaginary-quadratic` are stated by no supplier.

Dependency check, complete output:

```text
depcheck: 240 roadmaps, 2264 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. No forbidden supplier is cited. `roadmaps resolve` reports no citation and no Lean name found nowhere.

### Duplication and ownership

Searched by object at the pins, on main and at the open heads: signed anticyclotomic Selmer groups, Rubin's p-adic L-function, the all-auxiliary elliptic-unit module, the elliptic-unit norm relations, Rubin's Theorem 4.1(ii), the Ax–Brumer theorem. No roadmap this one may consume states a target of it. The overlap listing has no other pull request changing this roadmap, no dropped id, no id defined by a revision only and no second copy; main has no folder of this name.

Overlap check: read ModularIwasawaMainConjecturesPartII, AnticyclotomicLocalUnits, NonordinaryCMSpecialValues, EulerSystemsAndKolyvaginSystems, EulerSystemsCyclotomicMainConjecture and PadicMeasuresIwasawaAlgebras; nothing this roadmap owns is shared. Signed local units and points: AnticyclotomicLocalUnits. Elliptic units of every modulus and the twist of Kummer towers: NonordinaryCMSpecialValues. Euler-system formalism: EulerSystemsAndKolyvaginSystems. Characteristic ideals: Tau Ceti and PadicMeasuresIwasawaAlgebras. All cited. ModularIwasawaMainConjecturesPartII names this roadmap as owner of the inert main conjecture and restates none of it (its line 33).

### Shape, headlines, Lean

All 36 targets read: 36 *Needs:* lines, 36 Check lists, each with at least three Checks; every definition (§§0.1, 0.4, 1.1, 1.4, 1.5, 2.1, 2.4, 3.1, 5.1) has an API list; every theorem has a locator; every layer ends with Examples and Dependencies. No LaTeX delimiters, HTML anchors, pull-request numbers, dates, machine paths or process wording (searched). No layer is named after a source's chapter and the README does not say it follows a source.

Headline theorems of the Summary: §4.6 (BKO21 Theorem 6.1) and §6.4 (BKO21 Theorem 6.2); the module docstring names these and §§4.2, 4.4 with the carriers each lacks. None is statable at the pins with a few simple definitions. None that is statable is absent, and none is forced through a stand-in.

`lake env lean` on `packages/InertAnticyclotomicCMMainConjecture/Suggested.lean`, run from the content checkout: exit 0, no output, no warning. The file is `import Mathlib`, one module docstring and an empty namespace: no declaration, no `sorry`, no `set_option`. The one-tactic probe and the `#check @name` comparison therefore have zero cases, and nothing is padding. No Lean process was left running.

### Copyright and arrangement

Wording: beside the 15 sampled locators, eight further passages were compared: the route of §4.2 with AHII05 lines 222–231, the route of §5.2 with lines 322–338, the route of §5.4 with lines 395–408, the definition of §3.1 with lines 132–144, the definition of §2.4 with BKO21 lines 833–839, the gap sentence on Rubin's theorem with RUB91 lines 545–551, the route of §4.3 with BIL86 lines 618–640, and the module docstring of `Suggested.lean`. The routes pass through the steps the arguments force, in other words; no run of more than four consecutive words is shared. No table, figure or list of a source is taken over.

Arrangement: BKO21 has 31 of the 81 locators, AHII05 29. BKO21's contents (§2 the conjecture, §3 Hecke L-values, §6 with L-function, main conjecture, rank bounds in that order) do not match the layers: here the Selmer groups precede the L-function, and Layers 3–5 have no counterpart there. Against AHII05 (§2 Selmer groups, §3 ranks, §4 characteristic ideals, §5 control) the layers are not one to one with equal scope: Layer 2 is interposed, Theorem 3.6 of its §3 sits in Layer 4, and Layers 4 and 5 add §§4.5–4.6 and 5.5–5.6 from elsewhere. The order 1 → 3 → 4 is forced by the lines §3.1 needs §1.5 and §4.1 needs §§3.3, 3.4.

Source independence: 23 passages compared with 5 sources (BKO21, AHII05, AHI06, RUB91, BIL86), none shared; largest share BKO21, 31 of 81 locators; contents compared with BKO21 and AHII05: independent.

## Not verifiable

- BRU67 is waived in the manifest; its text was not read. The gap that cites it names its supplier and its exact statement.
- The extraction of BKO21 loses overbars (lines 825–827, 841); conjugates were checked through BKO21 (3.2), the covariance at line 293 and the internal consistency of §§2.2 and 2.5.
- Supplier sections and gaps are contracts in open pull requests, not proved statements; the heads read are those of the index of 2026-11-15.

## Source issues

- **Misprint** in AHII05 at proof of Proposition 5.3, p.620: the source says the product of the two control elements is γ to the power p^k minus one; it should be the power pⁿ for the fixed level n; affects nothing.
- **Misprint** in AHII05 at proof of Theorem 4.1, p.616: the source says the symmetry input is Lemma 2.1.2 of AHI06, where that number is a remark; it should be Lemma 1.2.1; affects nothing.
- **Misprint** in BIL86 at the introduction, p.342: the source says the pseudo-isomorphism and the equality of characteristic series are Theorems 3.24 and 3.25; it should be Theorems 3.23 and 3.24; affects nothing.

## For the human reviewers

- **Scope (ownership across the merge order).** The two gaps asked of NonordinaryCMSpecialValues are also stated by ModularIwasawaMainConjecturesPartII (its Scope lines 6 and 8, §§2.2, 4.1, 4.7–4.8), a roadmap later in the merge order.
- **Licence.** The cached text of BKO21, fetched from the institutional record in `sources.toml`, carries on each page a JSTOR download stamp and terms-of-use line (BKO21 lines 242–244).
- **Licence.** The cached text of AHI06 names the journal's open archive as its origin (AHI06 line 2), while `sources.toml` records the author's page as `fetched_from`.
- **Not tested.** BRU67 is waived and was not read; it is cited only for the Ax–Brumer theorem requested as a gap.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "c11dec56b59b008359f50b28fdfe494a50029019", "job": "REV-PKG-InertAnticyclotomicCMMainConjecture~8", "model": "fable", "worker": "chris-x83"} -->
