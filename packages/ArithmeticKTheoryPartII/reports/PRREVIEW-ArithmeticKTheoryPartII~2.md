# Review of ArithmeticKTheoryPartII (pull request #2433 at ab2c76b)

**Verdict:** needs changes

## R01 (P2) — The split-at-p class-field statement is requested as a new gap although a roadmap on main owns it

**Location** `TauCetiRoadmap/ArithmeticKTheoryPartII/README.md` line 133 (gap:cyclotomic-p-class-fields): "for a number field F and a finite set S of its primes, identify the maximal abelian extension of F unramified at every place in which every prime of S splits completely"; used at line 856 (§7.3) and in §7.7's route.

**Claim** The only instance the roadmap uses (F=K_q, S={(1−ζ_q)}, p-parts) is already a target of CyclotomicClassGroupsAndStickelberger §0.5 on main, which this README never cites; the gap is not minimal and the object has two owners. H_q and H_∞ themselves are IntegralIwasawaTheory §2.3's fields.

**Witness** `TauCetiRoadmap/CyclotomicClassGroupsAndStickelberger/README.md` line 209 (main): targets are vanishing of the ideal and Artin class of `P_r=(1−ζ_(p^r))` and "the split-at-p unramified class equivalence". `TauCetiRoadmap/IntegralIwasawaTheory/README.md` line 334: `unramifiedModule_classGroupLimit` and its S-split analogue.

**Repair** (i) End the gap sentence, in the README and in `design/plan.json`, after "so that their maximal p-subextensions nest." (ii) Add the supplier subsection "### From TauCetiRoadmap.CyclotomicClassGroupsAndStickelberger — CyclotomicClassGroupsAndStickelberger §0.5. Consume, at conductor q=pⁿ, the prime P=(1−ζ_q), vanishing of its ideal class and of its Artin class, and the split-at-p unramified class equivalence: the maximal unramified abelian p-extension of K_q in which P splits is H_q, compatibly with norms across levels and with Gal(K_q/ℚ)." (iii) In §7.3 replace "Class field theory identifies the maximal abelian p-extension unramified everywhere and split at p with H_q." by "CyclotomicClassGroupsAndStickelberger §0.5 identifies the maximal abelian p-extension unramified everywhere and split at p with H_q." and add "CyclotomicClassGroupsAndStickelberger §0.5" to the *Needs:* lines of §7.3 and §7.7, to the Layer 7 Dependencies and to Scope and ownership. (iv) In the IntegralIwasawaTheory contract add "§2.3 supplies the maximal unramified abelian pro-p extensions of K_q and K_∞ with their class-group Artin identification; H_q and H_∞ of the Conventions are these fields." Tested on F=K_q, S={P}: §0.5 gives Galois group A_n/⟨[P]⟩=A_n, which is what §7.3 uses for D_q≅Gal(K_q/ℚ).

## Verified sound

| Statement | Instances | README / Lean side | Source / library side | Result |
|---|---|---|---|---|
| §0.4 cyclotomic transfer descent | q=9, k=2; degree 1 over ℤ | χ³ on (ℤ/9)× has kernel {1,4,7}: field degree 2, K₉ degree 6; K₁(ℤ;ℤ/q)=0, K₁^β=ℤ[1/p]×/q=ℤ/q | FGV lines 667–674: coinvariants, over O′_q and ℤ′, both signs | holds |
| §0.5 Artin–Bott square | (2.14) outer terms; regular p | c central, acts by −1, 2 invertible: H₁,H₂(Gal(K_q/ℚ);M_q)=0; class kernel 0 gives 0 | FGV lines 734–760, Proposition 2.17, all k∈ℤ | holds |
| §2.1 coefficient-line groupoids | ℚ(i); P⁻⊗P⁻ | norm-one units {±1,±i}; (−ι)⊗(−ι)=ι⊗ι, so product lands in P⁺ | FGV lines 1082–1092; line 1084 calls ι O-linear (misprint) | holds |
| §3.3 Betti transfer formula | q=5, i=1; odd i | 1+2+3+4=10≡0; a and −a cancel for odd i, so tr(β^(2k−1))=0 | FGV lines 1428–1446, Corollary 5.4 and Remark 5.5 | holds |
| §4.1 polarized Γ-groupoid | T={*}; T={*,a,b} | e=0, eA=0, one arrow between any two objects; grade (1,2) folds to 3 | FGV lines 2744–2772, (A.12) | holds |
| §4.3 Betti model | g=0; T=S⁰ | point; ∐_g BSp_(2g)(ℤ), π₀ ℕ before completion | FGV lines 2786–2789, Proposition A.13 | holds |
| §4.5 finite-genus detection | q=5 | CM genus φ(5)/2=2; bound g≥4 leaves a rational factor of genus 2≥0 | FGV line 1533: g≥φ(q); its proof says g=φ(q) (slip) | holds |
| §5.2 split extension category | H=G; G=1, M=T=Λ | (M,id,id) initial and terminal; πs=1 but sπ=diag(1,0) | FGV line 1699 writes s∘π=id_M (misprint) | holds |
| §5.3 bar comparison | C₃ on 𝔽₇, g↦2; n=3 | d_FGV=2−1=1, native 4−1=3; signs +,−,+,−; native face j ↔ FGV face n−j−1, sign (−1)^(j+1) | `groupHomology.inhomogeneousChains.d_single`, GroupHomology/Basic.lean:132, uses ρ(g₀)⁻¹ | holds |
| §5.4 universal relative extension | C₂, H=1, M=ℤ/5 sign | H₁(C₂;M)=H₀(C₂;M)=0, so H₁(G,1;M)=M=ℤ/5; c(m,2m)=(−m,3m)=s′(−m) | FGV lines 1747–1774, Lemmas 7.4, 7.6 | holds |
| §6.2 universal cocycle | σ=c; χ(σ)=2, k=2 | s is c-equivariant so α(c,m)=0=[c]⊗m; weight 2³≡3, not 2²≡4, mod 5 | FGV lines 1874–1899, 1964 | holds |
| §7.1 continuous extensions | Γ=C₂, H=1, M=ℤ_p sign | H₁(Γ,1;M)=H₀(1;M)=ℤ_p; c²(m,t)=(m,t+m−m) | FGV lines 1968–2008, (7.20) | holds |
| §7.2 p-adic universality | p=3, k=1 | K₂(ℤ)=ℤ/2, so kernel 0 and KSp₂(ℤ;ℤ₃)≅ℤ₃(1) | FGV lines 2009–2021, Theorem 7.8 | holds |
| §7.5 Bott-inverted universality | q=5, k=0 and 2 | −1≡3 mod 4; degrees −2 and 6 differ by 8=2·5⁰·4 | FGV line 2133, every k∈ℤ | holds |
| §7.6 degree 4k−1 | p=3, ℓ=2; ℓ=19; p=5 | 2 has order 6 mod 9; ℤ₃/(2²−1)=ℤ/3=K₃(ℤ)⊗ℤ₃; 19²−1=360 gives ℤ/9; 3 is a 5-adic unit | FGV lines 2154–2194; footnote 13 writes χ^(2k−1) (misprint) | holds |
| §3.4 Betti–Hodge splitting | i=0, 1, 2; i≡0,1 mod 4 | ×2 on ℤ/q; 0=0; ℤ/q=0⊕ℤ/q; twist 2k+1 is odd so the + part is 0 | HermitianKTheoryOfPoincareCategories §8.3: (K_*[1/2])^(C₂)⊕W_*[1/2] | holds |
| `exists_split_prime_with_signs` | q=3; sign classes | 7=(3+ζ₃)(3+ζ̄₃)=9−3+1, 2 inert; sign patterns are a coset of ker(Cl⁺→Cl); K/K⁺ ramified at p | Chebotarev in the compositum; `ringOfIntegersComplexConj` CMField.lean:237 | true |
| `IsSkewCMLine`, `exists_cm_lines_with_ideal_product` | δ₀=w(η−1), w²=η⁻¹; ℚ(i) | conj δ₀=−δ₀; (δ₀/t)(t)=(δ₀)=(δ₀t)(t)⁻¹; sgn τ(t)=sgn τ(1/t); a=1; (i/2)=(1/2)=𝔡⁻¹ | FGV Proposition 4.7; `FractionalIdeal.dual` Different.lean:230 | true |
| `pHilbertClassField` | C₆ at p=3, 2; p=0, 1 | orders prime to 3: {1,2}, index 3; index 2; p=0 gives H, p=1 gives K | `Nat.Coprime n 0 ↔ n=1`; `hilbertClassField` RayClassField.lean:241 | correct |
| `existsUnique_conj_fixed_prime_iff_not_dvd_classNumber` | q=37; plus and minus ℤ/3 | fixed primes form an A⁺-coset; N∘j=2, j∘N=1+c give #A⁺=#Cl(K⁺)_p; 37 primes, 1 fixed; plus torsor: 3 fixed | FGV line 2036 says ℘(q) singleton (error) | true |
| `groupHomology_map_symplecticBlockSucc_stable` | usr(ℤ); i=0; i=1 | S₁ fails, S₂ and T₃ hold: usr=2, ranges 2i+5, 2i+6; H₀ identity; H₁=ℤ/12, ℤ/2, 0 | mirzaiiVanDerKallen2002 lines 121–125, 254 (⌊(n−usr−4)/2⌋), 293–295 | true |
| §§8.1, 8.3 integral indecomposables | K(ℤ/p,1); RP∞; endpoint | yʲ/j! decomposable for j<p: Q=0 in degrees 3..2p−3, Q_(2p−1)=ℤ/p; RP∞: only β₁ contributes, degrees 2ᵃ−1 | FGV lines 2283–2317: P¹ k-invariant joins π₁ and π_(2p−2) | holds on 1≤i≤2p−3 |
| §8.6 Bernoulli divisibility | p=3, n=3; odd n<p; gap m | ch₃=c₁³/6 not 3-integral; n≤p−2 so 2n≤2p−4; p∤(m+1), so p-part of num B_(m+1)/2(m+1) is that of B_(m+1) | FGV line 2218 allows p≥max n_j | holds as restricted |
| R01: §7.3 and gap:cyclotomic-p-class-fields | F=K_q, S={(1−ζ_q)} | README asks ClassFieldTheory for every F, S; uses one instance | CyclotomicClassGroupsAndStickelberger §0.5: A_n/⟨[P]⟩=A_n | duplicate |

- Previous R01 (description overclaims): repaired. The description now reads "for the ordinary groups when k ≥ 1, and for the Bott-inverted groups for every integer k", "odd parts n_j < p" and "for 1 ≤ i ≤ 2p−3"; no other sentence of the title or description contradicts the head.
- Source locators checked against the text: FGV at the 15 sampled targets and at §§2.4, 5.2–5.4 (Lemma 7.6), 7.3, 7.7, 8.1–8.3, 8.6 (lines 667–760, 1078–1092, 1294–1312, 1420–1473, 1533–1560, 1695–1774, 1874–2050, 2128–2194, 2212–2333, 2722–2797); mirzaiiVanDerKallen2002 lines 40–50, 117–128, 254, 293–296.
- Library declarations opened at the pins: 34 named Mathlib and Tau Ceti declarations exist in the stated files; read `d_single` (GroupHomology/Basic.lean:132), `Matrix.J` and `symplecticGroup` (SymplecticGroup.lean:59, 102), `TauCeti.symplecticBlockSucc` (BlockSucc.lean:247), `exists_compatible` (ExistsCompatible.lean:186, ω(v,Jv)>0), the Künneth hypothesis (Kunneth/Sequence.lean:376), `pontryaginMul` (Pontryagin/Basic.lean:298, `MonObj` only).
- Cross-roadmap citations: every cited id of the 24 supplier roadmaps resolves on main or at the open head (AlgebraicTopology "Stage 6" through main's stage-to-section table; GeneralizedCohomology and CharacteristicClasses ids are numbered items); content read for ArithmeticKTheory §§3.4, 3.5, 6.11, HermitianKTheoryOfPoincareCategories §§8.1, 8.3, GeneralAlgebraicKTheoryPartII §4.20, IntegralIwasawaTheory §§2.1, 2.3, 3.1, 7.4, ClassFieldTheory Layer 13.
- Gate at ab2c76b: every check OK. Dependency check: `depcheck: 250 roadmaps, 2380 edges, 0 problem(s)`. Nothing changed outside the folder.
- Elaboration: `lake env lean` on `TauCetiRoadmap/ArithmeticKTheoryPartII/Suggested.lean` gives the 4 `sorry` warnings only; the 7 elaborated types match the README statements with no binder lost; `simp`, `rfl`, `infer_instance` and `trivial` close none of the 4 theorems.
- Declared gaps: 13 slugs, identical in `design/plan.json` and the README, each with a named supplier; 12 are precise and not already supplied (checked: ArithmeticKTheory §6.11 is stated only for E=F(μ_m^(⊗i)); ClassFieldTheory Layer 13 has no tower comparison; the low-Postnikov splitting holds because p-local operations of degree 2..2p−3 between Eilenberg–MacLane spectra of finitely generated groups vanish); the thirteenth is R01.
- Ownership: all open heads and main searched for KSp, symplectic homology stability, unitary stable rank, integral indecomposables, relative group homology, conjugation-fixed primes and the 7 Lean names: no second owner and no name clash other than R01.

Overlap check: read ArithmeticKTheory, KTheoryFiniteLocalFields, BorelRegulators, StableHomotopyKTheoryPartII, GeneralAlgebraicKTheoryPartII (open), StableHomotopyKTheory, TangentialBordism, CyclotomicClassGroupsAndStickelberger (main); third list empty. Shared: cyclotomic H² descent, Adams signs and Borel's comparison, owned by ArithmeticKTheory (cited); group completion and telescopes, owned by StableHomotopyKTheory and GeneralAlgebraicKTheoryPartII (cited); finite-field Bott classes, owned by KTheoryFiniteLocalFields (cited); the cyclotomic prime above p with its split-at-p class-field equivalence, owned by CyclotomicClassGroupsAndStickelberger §0.5 and not cited (R01). Rational indecomposables of BorelRegulators are a different object from the integral quotient of §8.1.

Source independence: 23 passages compared with 3 sources, and the whole README and Lean file scanned for six-word runs against all three, none shared beyond titles, URLs and formulas; largest share FGV, 96 of 108 locators; contents compared with FGV: independent (Layers 1 and 3 split its §3, Layer 4 joins Appendix A to §6.1–6.2, Layers 5–7 split §§6.3–7; the *Needs* chain §3.1→§§0.1, 1.1, 2.1–2.2, §4.5→§3.5, §5.1→§4.4, §6.1→§§3.4–3.5, 4.5, 5.1, §7.2→§6.3, §8.6→§§7.4, 8.4 forces the order).

## Not verifiable

- charney1987, §4 and Corollary 4.5 (§8.4): recorded as uncertified (paywalled) and not read; the range was checked against mirzaiiVanDerKallen2002 Theorem 4.1 instead.

## Source issues

- **Misprint** in FGV at Definition 4.3, p. 24: the source says the involution ι of ω is O-linear; it should be conjugate-linear, as conjugation and its negative are; affects nothing.
- **Misprint** in FGV at the proof of Proposition 6.1, p. 34: the source says it suffices to treat g=φ(q) using the CM functor; it should be g=φ(q)/2, the dimension of an abelian variety with CM by K_q; affects nothing.
- **Misprint** in FGV at Definition 7.3, p. 37: the source says the section satisfies s∘π=id_M; it should be π∘s=id_M; affects nothing.
- **Misprint** in FGV at §7.5, p. 44: the source says ℚ(p) is the largest extension "unramified p"; it should be unramified outside p; affects nothing.
- **Error** in FGV at Remark 7.9, p. 44: the source says Vandiver's conjecture is equivalent to ℘(q) being a singleton; it should be the conjugation-fixed subset ℘(q)^c, since ℘(q) is a singleton exactly when p∤h(K_q); affects a stated result.
- **Misprint** in FGV at §7.7, footnote 13, p. 47: the source says ℤ_p^× acts on ℚ_p/ℤ_p(2k) through χ^(2k−1); it should be χ^(2k); affects nothing.
- **Error** in FGV at Theorem 8.1, p. 48: the source says divisibility holds for primes p≥max n_j; it should be p>max n_j, since ch_n has denominator n! (ch₃ is not 3-integral); affects a stated result.
- **Misprint** in FGV at the proof of Theorem 8.4, p. 50: the source says the model for K(ℤ/p^k,n) has ∂y=x; it should be ∂y=p^k·x; affects nothing.
- **Gap** in FGV at Theorem 8.4 and its proof, p. 50: the source says τ≤2p−2 of Ω∞E splits as a loop space, giving degrees ≤2p−2; the P¹ k-invariant of the delooping joins π₁ and π_(2p−2), so splitting is justified only through degree 2p−3; affects a stated result.
- **Misprint** in FGV at Appendix A.4, p. 59: the source says the Rosati involution is defined by φ; it should be defined by the polarization; affects nothing.

## For the human reviewers

- none
