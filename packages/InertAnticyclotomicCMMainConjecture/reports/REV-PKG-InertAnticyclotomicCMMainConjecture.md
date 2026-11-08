<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2421#issuecomment-6671629811 -->
Review (claude) of 9a38446

Verdict: needs_changes

1. **F01** (P3) Four backticked CMER declaration names do not exist at the supplier's head

   Location: `packages/InertAnticyclotomicCMMainConjecture/README.md` line 82 ("Use §4.1 (`cmHeckeCharacter`, `cmTateComponents`, `cmFrobeniusIdentities`) … Use §4.3 (…, `canonicalGrossGoodReduction`)") and line 234 (§1.3 route, "`cmFrobeniusIdentities`").

   Claim: these are declarations of ComplexMultiplicationAndExplicitReciprocity §§4.1 and 4.3.

   Witness: ComplexMultiplicationAndExplicitReciprocity at its open head, §4.1, titles its three targets in bold prose only ("The algebraic Hecke character of a CM abelian variety", "One-dimensional CM components of the Tate module", "Frobenius and infinity-type identities"); §4.3 names only `IsCanonicalGrossCharacter` and `canonicalGrossExistence`; its `Suggested.lean` declares exactly `IsCanonicalGrossCharacter`, `canonicalGrossExistence`, `primitiveReducedForms`, `classPolynomial`, `classPolynomialHeightBound`. The content cited is there; the four names are not.

   Repair: in the CMER supplier contract and in §1.3 replace the four names by the supplier's own titles: "§4.1 (the algebraic Hecke character of a CM abelian variety; one-dimensional CM components of the Tate module; Frobenius and infinity-type identities)" and "§4.3 (`IsCanonicalGrossCharacter`, `canonicalGrossExistence`, and canonical Gross good reduction away from the discriminant)". Tested: every remaining backticked name in the README then resolves at a pin or at a supplier head (the list in Verified sound).

2. **F02** (P3) §2.1 cites AnticyclotomicLocalUnits §4.2 for a trivial-character case it does not state

   Location: `README.md` line 318 ("the projected class at the trivial auxiliary character ν=1 … Instantiate §4.2 at ν=1 with its separately defined trivial case").

   Claim: AnticyclotomicLocalUnits §4.2 defines the projected class at ν=1.

   Witness: `packages/AnticyclotomicLocalUnits/README.md` §4.2 (line 648 onward) is stated "for a finite anticyclotomic l-power character ν of conductor l^m", built from z_(f l^m) and L_r with "for exact order l^r with r≥1 set m=r+1", and its *Needs:* line is §4.1's auxiliary field; no clause treats ν=1 (the only "trivial" near Layer 4 is §4.5 choosing a nontrivial ν). BKO21 line 398–399 says the trivial-ν case is Rubin's elliptic unit, and BKO21 line 823 introduces ξ(E,Ω) "as in [32] or Proposition 3.3".

   Repair: make §2.1 own the ν=1 instance. State: "Define ξ as the image in V_R of the class obtained from NonordinaryCMSpecialValues NCM.1/normalized-zeta-class at the moduli f pⁿ (no auxiliary prime) by the composite of arrows of AnticyclotomicLocalUnits §4.2 with the ring class field replaced by H: corestriction to H(E[p^(n+1)]), localisation above p, augmentation over Gal(H/K), projection to Δ-invariants and the Kummer comparison; this holds for every inert CM datum." Delete "with its separately defined trivial case"; cite ALU §4.2 for the arrows only. In §2.2 cite ALU §4.4 as the template and prove the ν=1 values from NCM.1/elliptic-reciprocity at modulus f pⁿ. Tested on the instance ν=1, p=5: the modulus f·5ⁿ is admissible for NCM.1/normalized-zeta-class ("supported on f, p and an auxiliary split l", l absent), and the Δ-average still divides by 24, which is prime to 5.

3. **F03** (P3) §2.2's locator supports the stated value only after a convention correction in the source

   Location: `README.md` line 330 ("δ_χ(ξ)=L(φ̄χ,1)/Ω … (BKO21 Proposition 3.3, p.953, and §6.0.1, p.961)").

   Claim: BKO21 states δ_χ(ξ)=L(φ̄χ,1)/Ω at the cited places.

   Witness: BKO21 line 478 and line 827 print L(ϕχ,1)/Ω without a bar. The README's form is the one forced by BKO21's own inverse covariance δ_χ(x^β)=χ(β)⁻¹δ_χ(x) (BKO21 line 293) together with its interpolation formula L_p(χ)=L(ϕχ,1)/(Ω·δ_(χ⁻¹)(v_ε)) (line 841): applying δ_(χ⁻¹) to ξ=L_p·v_ε gives δ_(χ⁻¹)(ξ)=L(ϕχ,1)/Ω, so δ_χ(ξ)=L(ϕχ⁻¹,1)/Ω=L(ϕ̄χ,1)/Ω, using L(ψ∘c,s)=L(ψ,s) with (ϕχ⁻¹)∘c=ϕ̄χ. It also agrees with NonordinaryCMSpecialValues NCM.1/elliptic-reciprocity (Ω⁻¹L_(pg)(φ̄χ,1)) and AnticyclotomicLocalUnits §4.4. The two readings differ: for χ of order 5, L(ϕχ,1)/Ω and L(ϕχ⁻¹,1)/Ω are Galois conjugate under ζ↦ζ⁴ and are not equal in general.

   Repair: add one sentence to §2.2 after the locator: "BKO21 prints the right-hand side as L(φχ,1)/Ω at both places; its inverse covariance of δ_χ (p.949) and its interpolation formula (p.961) force L(φ̄χ,1)=L(φχ⁻¹,1), the form used here and in NonordinaryCMSpecialValues NCM.1/elliptic-reciprocity." Tested: with that reading, §2.5's derivation L_p(χ)=L(φ̄χ⁻¹,1)/(Ωδ_(χ⁻¹)(v_ε))=L(φχ,1)/(Ωδ_(χ⁻¹)(v_ε)) reproduces BKO21 line 841 exactly.

4. **F04** (P3) "The only pinned Selmer group" is wrong at the pins

   Location: `packages/InertAnticyclotomicCMMainConjecture/Suggested.lean` line 19 ("the only pinned Selmer group is the 2-descent group `WeierstrassCurve.Affine.selmerGroup₂`") and `README.md` line 66 (the same claim in the Tau Ceti supplier contract, phrased as "The pinned 2-descent group … is not the p-primary … carrier").

   Claim: the pins contain exactly one Selmer group.

   Witness: the pinned Tau Ceti also has `WeierstrassCurve.Affine.selmerGroupA` (TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroupA.lean, line 129, the 2-Selmer group of the étale algebra), and the pinned Mathlib has the S-unit Selmer group `selmerGroup` (Mathlib/RingTheory/DedekindDomain/SelmerGroup.lean, line 161). None is a p-primary Galois-cohomological Selmer group, so the not-statable verdict is unaffected.

   Repair: in both places write "the pinned Selmer groups are the 2-descent groups `WeierstrassCurve.Affine.selmerGroup₂` and `WeierstrassCurve.Affine.selmerGroupA` and Mathlib's S-unit group `selmerGroup`; none is the p-primary Galois-cohomological Selmer carrier used here". Tested: the three names elaborate at the pins (files and lines above).

Four findings, all P3; none blocking. No principle is violated: the roadmap plans the general inert CM datum (E over H, p∤h_K, arbitrary ε and coefficient ring R), re-plans no existing roadmap, cites only suppliers on main or earlier in the merge order, copies no source passage, contains no algorithm, and `Suggested.lean` has no sorry'd data and no `set_option`. The four declared supplier gaps are precise, minimal and declared identically in `design/plan.json` and the README.

## Verified sound

**Elaboration.** `lake env lean` on `Suggested.lean` from the content checkout exits 0 with no output (no `sorry`, no warning). The file declares nothing (one module docstring, an empty namespace), so the `#check @name` comparison and the one-tactic padding probe are vacuous; no padding exists. Import header: `import Mathlib` only, no `TauCeti.*` module used, no `set_option`, no `lemma`, no `#eval`.

**Headline theorems.** The README's summary names BKO21 Theorem 6.1 (§4.6) and Theorem 6.2 (§6.4); the package adds §4.2 and §4.4 as deep intermediate results. All four are named in the module docstring with the missing carrier for each. Checked at the pins: no Lubin–Tate formal module and no `charIdeal` in Tau Ceti (recursive grep of the pinned library finds neither); the only Selmer groups are the three of R04, none p-primary Galois; Hecke characters, continuous cohomology and `TauCeti.completedGroupAlgebra` exist but do not make any of the four statable. No stand-in is used. Correct.

**Dependency check** (run on the package README):

```
depcheck: 241 roadmaps, 2428 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. Suppliers and positions in `merge-order/ORDER.txt`: ArithmeticGaloisDuality 48, LubinTateFormalModulesAndQuasiCanonicalLifts 53, SelmerIwasawaCohomology 59, EulerSystemsAndKolyvaginSystems 112, ComplexMultiplicationAndExplicitReciprocity 186, NonordinaryCMSpecialValues 216, AnticyclotomicLocalUnits 218, this roadmap 219; PadicMeasuresIwasawaAlgebras, EllipticCurves and ClassFieldTheory are on main. ModularIwasawaMainConjectures (263) and its Part II (264) appear only as consumers; the Part II design's plan imports this roadmap's nodes (IC.0/cm-datum onward), confirming the direction.

**Cross-roadmap citations resolved** (every section opened at the cited head or on main, or as a plan node for a design): AnticyclotomicLocalUnits §§0.1, 1.2–1.5, 2.4, 3.1, 3.2, 3.6, 4.2–4.4, 8.2, 8.4, 8.5 (board package; its Conventions carry the same conductor table, δ_1=(1+p⁻¹)δ and c u c⁻¹=u⁻¹); NonordinaryCMSpecialValues nodes NCM.0/cm-period, NCM.0/dual-tate-convention, NCM.1/normalized-zeta-class, elliptic-reciprocity, period-change, NCM.2/semilocal-splitting, inert-frobenius, cm-lubin-tate, NCM.3/twisted-root-sign, forced-central-zero, NCM.5/central-nonvanishing (design plan; twisted-root-sign states W(φνχ)=(−1)^c W(φ) with c=n+1 and treats χ=1 separately, as the README does); LubinTateFormalModulesAndQuasiCanonicalLifts LT.0, LT.1, LT.2 (lt-character, reciprocity-comparison with χ_π(Art(u))=u⁻¹), LT.8 (bko-fields with [Ψ_n:Φ]=pⁿ and the inversion action of c); SelmerIwasawaCohomology §§2.1–2.6, 2.10, 2.13 (with the inverse-different warning), 2.19, 3.0, 3.1, 3.3, 3.10, 3.11, 3.12, 3.16 at its open head; ArithmeticGaloisDuality §§R02.2.2, R02.2.3 (cor∘res=n), R02.4.2–R02.4.4, D7.7.1, D7.7.2 at its open head; EulerSystemsAndKolyvaginSystems §§2.2, 8.1 (records that the anticyclotomic tower is not admissible), 8.11, 8.25 at its open head; ComplexMultiplicationAndExplicitReciprocity §§4.1, 4.3 at its open head (content present; names, R01); PadicMeasuresIwasawaAlgebras §§1.7, 4.3, 4.5, 4.6 on main with `charIdeal`, `charDivisor`, `charIdeal_mul_of_exact`, `charIdeal_quotient_span`, `charIdeal_comap_of_semilinearEquiv` (Suggested.lean lines 476–508), its restriction of scalars stated only along ℤ_p⟦T⟧→O⟦T⟧ and no character-prime multiplicity statement (so both PMIA gaps ask for something absent); EllipticCurves Layers 1, 3, 4, 7 and ClassFieldTheory Layers 6, 11, 12, 13 on main. `roadmaps resolve` reports nothing; the worker's lead on ALU §1.5 is a board package at position 218.

**Declared gaps.** `elliptic-unit-euler-system` and `inert-two-variable-main-conjecture` (supplier NonordinaryCMSpecialValues NCM.1), `restriction-of-scalars-finite-extension` and `character-prime-multiplicity` (supplier PadicMeasuresIwasawaAlgebras §4.6): same four slugs in `design/plan.json` `gaps` and under `## Exact supplier contracts`; each `needs` sentence names its hypotheses (RUB91 §4 p.36 lines 486–489: p∤#μ(H), K₀ abelian over K containing H, p∤[K₀:K]; RUB91 Theorem 4.1(ii) lines 547–551 as restated); none asks for what PMIA §4.6, SIC §3.14 or EulerSystemsAndKolyvaginSystems §8.25 already provides (checked by reading them).

**Library declarations opened at the pins.** Mathlib: `Module.length` (RingTheory/Length.lean), `Module.length_le_of_surjective` (same file, line 201, surjectivity a section variable), `Module.length_eq_finrank` (line 292), `IsLocalRing.length_restrictScalars` (RingTheory/LocalRing/Length.lean line 54), `Polynomial.cyclotomic_prime_pow_mul_X_pow_sub_one` (RingTheory/Polynomial/Cyclotomic/Basic.lean line 527), `Module.Basis` (LinearAlgebra/Basis/Defs.lean line 89), `Ideal.span_singleton_mul_left_unit` (RingTheory/Ideal/Span.lean line 100), `IsGalois.normalBasis` (FieldTheory/Galois/NormalBasis.lean line 120). Tau Ceti: `TauCeti.completedGroupAlgebra` (Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean), `TauCeti.IsCompactModule.completedGroupAlgebraModule` (Module.lean there), `WeierstrassCurve.Affine.selmerGroup₂` (AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroup.lean). All 11 exist as cited.

**Sources: the seeded sample, checked at the locators.**

| Target | Source and lines read | Result |
|---|---|---|
| 0.1 | BKO21 lines 404–413 (p.952: model, Ω with lattice ΩO_K, R, T free rank one with G_H-restriction T_πE⊗R); lines 802–808 (p.960: Gross Q-curve over H, good reduction above p, p∤h_K) | supports the statement; no descent to K assumed |
| 0.2 | BKO21 lines 470–471 (Gal(Φ∞/Φ₀) identified with the ℤ_p²-Galois group since p∤h_K), 853–854 (K_(n,𝔭)=Ψ_n); LT.8/bko-fields and ALU Conventions for c-inversion | supports |
| 0.3 | AHII05 lines 102–109 (p.613: Ξ⁻ = trivial ∪ odd order, Ξ⁺ = even order ≥2, E^± kills Ξ^∓), 163–169 (Remark 3.2); BKO21 lines 810–812 (footnote 3) | dictionary Ξ^s_AH=Ξ^(−s) and same-label point spaces confirmed |
| 0.5 | BKO21 lines 298–309 (p.949: V*,± definitions, Theorem 2.1, Corollary 2.2 for generators and χ∈Ξ^ε) | supports; R-extension is this roadmap's |
| 1.1 | BKO21 lines 860–866 (p.962: H¹_± as Kummer image of F_±(Ψ_n)⊗R⊗ℚ_p/ℤ_p, independent of the isomorphism W≅F[π^∞]⊗R); AHII05 lines 110–113 (p.613: H¹_±(T) the orthogonal complement) | supports |
| 2.4 | BKO21 lines 833–839 (p.961: C∞=Λξ, ξ=L_p(ϕ,Ω,v_ε)·v_ε, L_p∈Λ) | supports |
| 3.4 | AHII05 lines 180–189 (p.615: Prop 3.3(i), proof via AHI06 Lemma 1.1.9 and Euler systems), 235–244 (p.616: two-variable rank one, γ₁−1 coprime); AHI06 lines 364–368 (p.1009) | supports |
| 3.5 | AHII05 lines 182–189 (Prop 3.3(ii) from RUB91 Theorem 4.1(ii) as in AHI06 Prop 2.4.16); RUB91 lines 507 (sequence (5)), 545–551 (Theorem 4.1(ii)), 565–571 (Remark (2)); AHI06 lines 1081–1091 (Lemma 2.4.5), 1124–1128 (Cor 2.4.6), 1234–1238 (Prop 2.4.15), 1290–1308 (Prop 2.4.16: the correction divisor D on both sides) | supports; page numbers 1028–1033 correct (page k of the scan is p.999+k) |
| 4.2 | AHII05 lines 216–231 (p.616: Theorem 3.6 and its proof, exactly the README's route) | supports |
| 4.3 | AHII05 lines 233–246 (Theorem 4.1, citing Billot Thm 3.24 and "AHI Lemma 2.1.2"); BIL86 lines 618–621 (Thm 3.24 p.364, hypothesis (γ−1) prime to the characteristic series, involution T↦(1+T)⁻¹−1), 319–322 (Cor 3.2, Rem 3.3 p.351), 366 (Prop 3.8 p.353), 380 (Leopoldt p.353); AHI06 lines 415–417 (Lemma 1.2.1 p.1010) | supports; AHI06 has no Lemma 2.1.2 (only Remark 2.1.2, line 657) |
| 5.1 | AHII05 lines 307–317 (p.618: ω_n^± definitions, χ(ω_n^±)=0 for χ∈Ξ^±_AH, (5.1)) | supports with the label dictionary |
| 5.2 | AHII05 lines 318–338 (Lemma 5.1 and proof: tame field of degree p²−1, H⁰=0, inflation–restriction, (5.2) normal basis, coranks rk(Λ/ω_n^±)) | supports |
| 5.3 | AHII05 lines 343–391 (Theorem 5.2 and proof: diagram, kernel at v|f a quotient of E(D_(∞,v))[p^∞], finite since W ramified at f) | supports |
| 5.6 | BKO21 lines 894–905 (p.962–963: char(X_(−ε))⊆char(X_str), strict control, ord_χ L_p ≥ dim Sel_str^χ ≥ dim Sel^χ−1) | supports |
| 6.1 | BKO21 lines 894–896 | supports |
| 6.2 | BKO21 line 904 | supports |
| headlines 4.6, 6.4 | BKO21 lines 881–886 (Theorem 6.1, over H with only (6.1)), 888–893 (Theorem 6.2, E over K, conductor pⁿ) | supports |
| 2.2, 2.5 | BKO21 lines 823–844 | R03 |

The author flagged no locator as unverified. Source manifest: five entries, all certified, with the works the README cites; nothing added.

**Ownership against open work.** `roadmaps grep -i --readme-only` for Rubin's p-adic L-function, the inert anticyclotomic CM main conjecture and anticyclotomic signed Selmer groups: no match on main or at any of the 457 open heads. ModularIwasawaMainConjectures (open) builds Kobayashi signed Selmer groups over the cyclotomic tower for modular forms, a different object; its Part II design imports this roadmap. Board packages (the index lists three, none related) and the sibling checkouts named in the brief were covered by that grep. No second owner.

**Adversarial pass** (values computed on each side).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions: (p) principal ⇒ p splits completely in H | K=ℚ(√−23), p=5 | Artin symbol of (5) trivial; H_𝔭=ℚ_25, [Φ:ℚ_p]=2 | holds | none |
| Conventions: E/K with End=O_K ⇒ h_K=1 | K=ℚ(√−23) | [K(j):K]=h_K=3 ≠1, so no such E over K; §6.4 vacuous there, §4.6 applies | holds | none |
| 0.1 class-number and inertness Check | K=ℚ(√−23), p=5 | reduced forms (1,1,6),(2,1,3),(2,−1,3): h=3; −23≡2 mod 5, squares mod 5 are {0,1,4}: inert; 5∤3 | holds | none |
| 0.1 Frobenius | p=5 inert | φ((p))=−p=−5, trace over ℚ 0, char poly (X+5)² | holds | none |
| 0.2 degrees | p=5 | [Ψ_1:Φ]=5, [Φ(F[π]):Φ]=p²−1=24; c γ c⁻¹ γ=1 vs γ²≠1 | holds | none |
| 0.3 dictionary | χ=1, order 5, order 25 | c=0,2,3 → +,+,−; order parity gives +,−,+ (wrong at order 5) | holds | none |
| 0.3 AH labels | AHII05 p.613 | Ξ⁻_AH={1}∪{k odd}={c even}=Ξ⁺; E^−_AH kills Ξ⁺_AH=Ξ⁻ — same label as A⁻ kills Ξ⁻ | holds | none |
| 0.4 inverse different | R=O; R=O[√π] | O: different O; O[√π]: f′(√π)=2√π, 2 a unit (p≥5), different (√π), (√π)⁻¹R/R≅R/(√π) of order p² | holds | none |
| 0.4 trace | O/ℤ_p | Tr(1)=2, pairing of unit vectors 2/p^k | holds | none |
| 0.5 decomposition | a_(−s)=T; a_(−s)=p | T vanishes only at χ=1, not at infinitely many χ∈Ξ^(−s); p(χ⁻¹)=p≠0 everywhere | holds | none |
| 0.5 δ_1 | p=5 | δ_1=(1−π⁻¹)δ=(1+1/5)δ=6δ/5 (ALU §1.4 agrees) | holds | none |
| 1.1 trace vs restriction | y∈F(Ψ_n), m>n | λ_1 independent of m; λ_1(Tr_(m/n) y)=p^(m−n)λ_1(y) | holds | none |
| 1.3 rational vanishing | good v, q=4; integral case | |α|=2≠1, |q/α|=2≠1 ⇒ H⁰=H²=0, Euler char ⇒ H¹=0; H¹(K_v,W)=ker(α−q) on L/R, nonzero iff α≡q mod 𝔪_R | holds | none |
| 1.5 compact condition away from p | v∤p | annihilator of 0 is all of H¹(K_v,T′); AH's H¹_f(T)=H¹(T)_tors=H¹(T) since H¹(V)=0 | agrees with AHII05 | none |
| 2.2 Euler factor | χ=1, p=5 | 1−φ̄((p))/N(p)=1−(−5)/25=6/5 | holds | none |
| 2.2 / 2.5 direction | χ of order 5, ζ=χ(γ) | δ_(χ⁻¹)(ξ)=L_p(χ)δ_(χ⁻¹)(v_ε) by inverse covariance; L(φ̄χ⁻¹,1)=L(φχ,1) via (φ̄χ⁻¹)∘c=φχ; reproduces BKO21 line 841; BKO21 line 827 would give L(φχ⁻¹,1), a ζ↦ζ⁴ conjugate | README consistent; source slip | R03 |
| 2.3 sign | ε=+, order 25; ε=−, χ=1 | W(φχ)=(−1)³=−1 ⇒ L=0 ⇒ ξ∈V⁺; L(φ̄,1)=conj L(φ,1)=0 | holds | none |
| 2.4 coordinate | ξ=πv; v′=(1+T)v, a=T | coordinate π, ideal (π); T/(1+T) generates (T) | holds | none |
| 3.3 H⁰(Ψ∞,W)=0 | p=5 | Gal(Φ(F[π])/Φ) cyclic of order 24, κ̄(g)−1∈𝔽_25× a unit of R/π, meets pro-5 group trivially | holds | none |
| 3.4 Euler characteristic | r₂(K)=1, rank-one T | rank H¹_Iw − rank H²_Iw = 1; (π,T) rank one not free | holds | none |
| 3.5 Rubin's hypotheses | K=ℚ(√−23), p=5 | K₀=H·K(φ̄_p mod 𝔪)=H(E[5]) abelian over K, [K₀:K]=3·24=72, 5∤72; ζ_5∉H since H/ℚ unramified at 5 ⇒ 5∤#μ(H) | holds | none |
| 3.5 split-prime form | p inert | RUB91 Remark (2): X∞, U∞/C̄∞ not torsion; only (ii) used | holds | none |
| 4.1 sequence | n=0, R=O, s=+ | L_0⁺=0: Sel_+=Sel_str, first and last terms agree | holds | none |
| 4.2 torsion | ε=± | S_+∩S_−⊆S_str (H⁺∩H⁻=0), torsion S_rel/S_str↪H free ⇒ contradiction with §3.1 | holds, matches AHII05 proof | none |
| 4.3 involution | T−a, a∈𝔪 | ι(T−a) has zero a′=(1+a)⁻¹−1; a′=a iff a∈{0,−2}, −2∉𝔪 | holds | none |
| 4.4 model | H^ε=Λ, S_ε=(T), C=(T²), char X_str=(T) | char(S_rel/C)=(T)=char X_str ✓; char X_(−ε)=(T)(T)=(T²)=char(Λ/(T²)); S_ε in place of C gives (T) | holds | none |
| 4.4 (π) retention | C=πS_ε | factor (π), μ=1 | holds | none |
| 4.5 label translation | order 5 | AH pairs χ with δ_χ(v_ε) (AHII05 line 287), here χ with δ_(χ⁻¹)(v_ε): ζ vs ζ⁴ | holds | none |
| 4.6 restriction of scalars | [R:O]=2, L_p=T | Λ_O-char of Λ_R/(T) is (T²) | holds; gap declared | none |
| 5.1 control elements | n=0; n=2, p=5 | ω_0⁺=1, ω_0⁻=γ−1; ω_2⁺=Φ_25(γ) deg 20, ω_2⁻=(γ−1)Φ_5(γ) deg 5, sum 25; zeros of ω⁺: orders p^k, k even ≥2 ⇒ c odd ⇒ Ξ⁻=Ξ^(−(+)) | holds | none |
| 5.1 comaximality | n=1; n=2 | n=1 unit ideal; n=2: Φ_25(1)=5, ideal ⊂(p,T) since Φ_(p^k)(1+T)≡T^(φ(p^k)) mod p | holds | none |
| 5.2 coranks | level n | corank L_n^s = #{χ through Gal(Ψ_n/Φ) in Ξ^(−s)} = deg ω_n^s = rank Λ/ω_n^s | holds | none |
| 5.3 base layer | n=0, s=± | ω_0⁺=1: both sides 0; ω_0⁻=γ−1: coinvariants vs dual of Sel(K,W) | holds | none |
| 5.5 length | A DVR, M=A/𝔪^k; M=κ²; Λ/(g²) | dim 1 ≤ k; 2=2; dim 1, order 2 | holds | none |
| 5.5 ord_ρ=ord_(ρ⁻¹) | R=O | Gal(Φ(μ_(p^r))/Φ)≅(ℤ/p^r)× ∋ −1 fixes O | holds only over O, as stated | none |
| 5.6 | X_str=Λ/(g²), χ=1 | 1 ≤ 2; χ⁻¹=χ | holds | none |
| 6.1 containment | char X_(−ε)=(fg), char X_str=(f) | (fg)⊆(f); ord 1≤3 at ord f=1, ord g=2 | holds | none |
| 6.2 local line | n=0, χ=1; over ℚ_p | E(Φ)⊗Φ≅Φ dim 1; over ℚ_p dim 2pⁿ, χ-part would count 2 | holds | none |
| 6.4 branches | ε=±, χ=1 | ε=+: χ=1∈Ξ^ε, no +1; ε=−: +1 | holds, matches BKO21 lines 890–893 | none |
| Unused hypotheses | 2 split; E/K in Layers 0–4 | neither assumed anywhere in Layers 0–4 | none | none |

Checked on every target: finiteness hypotheses (R complete DVR with finite residue field, finite S, finite level), the involution and contragredient conventions (AHII05 lines 176–178 agree with SIC §2.10), the inverse-different twist (SIC §2.13), degenerate cases n=0 and χ=1, the sign ε=±, and that no Check restates its definition. README shape: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Layers 0–6 each with Examples and Dependencies, Downstream consumers, Worked examples, References; every definition carries an API list and at least three Checks; every theorem its hypotheses and a locator; no LaTeX delimiters, no process words, no pull-request numbers, no machine paths; `metadata.toml` is `topic = "math.NT"`.

## Not verifiable

- BKO21 Theorem 2.1 and Corollary 2.2 (Rubin's conjecture) are consumed from AnticyclotomicLocalUnits §§8.2, 8.4 and were not re-derived here; the statements were read at BKO21 lines 306–309.
- RUB91 is an OCR'd scan; Theorem 4.1, Remark (2), sequence (5) and the §4 hypotheses were legible (lines 486–571); the §1 elliptic-unit construction (lines 179–206) is partly garbled but the ideal condition "g prime to 6f" and the definition of the unit group were legible.

## Source issues

- **Misprint** in AHII05 at proof of Proposition 5.3, p.620: the source says the product of the plus and minus control elements is γ^(p^k)−1; it should be γ^(pⁿ)−1 by the definitions on p.618; affects nothing.
- **Misprint** in AHII05 at proof of Theorem 4.1, p.616: the source says the symmetry step is Lemma 2.1.2 of the authors' 2006 paper; it should be Lemma 1.2.1 there (that paper has only a Remark 2.1.2); affects nothing.
- **Misprint** in BKO21 at §6.0.1, p.961 (and Proposition 3.3(2), p.953): the source says the twisted derivative of the elliptic unit is the value at ϕχ; it should be the value at ϕ̄χ, equivalently at ϕχ⁻¹, as the inverse covariance on p.949 and the interpolation formula on p.961 require; affects a stated result (the interpolation formula, read literally with p.953).
- **Misprint** in BIL86 at Introduction, p.342: the source says the pseudo-isomorphism and the characteristic-series equality are Theorems 3.24 and 3.25; it should be Theorems 3.23 and 3.24 (3.25 is a lemma); affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "9a38446ae0f3367997850e2f11c5709d76345e8e", "job": "REV-PKG-InertAnticyclotomicCMMainConjecture", "model": "fable", "worker": "chris-x18"} -->
