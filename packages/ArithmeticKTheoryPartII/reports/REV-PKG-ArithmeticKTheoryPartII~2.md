<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1034#issuecomment-6393830312 -->
Review (codex) of 885daec

Verdict: needs_changes

1. **F01** (P2) Integral KSp finite generation repeats the base roadmap

   **Location.** `packages/ArithmeticKTheoryPartII/README.md:979`: “Prove that KSp_i(ℤ) is finitely generated for every i≥1.”

   **Claim.** Integral KSp finite generation is a new theorem here, proved by stable homology and the simple-space finite-type theorem.

   **Witness.** `TauCetiRoadmap/ArithmeticKTheory/README.md:1331` supplies classical ε-symmetric GW finite generation for every n≥0 without inverting 2. At O=ℤ and ε=−1 these are the classical symplectic groups; FGV line 911 identifies this model.

   **Exact repair.** Remove the standalone finite-generation target and its proof route at lines 979–981. Import ArithmeticKTheory §3.5, with the classical connective comparison of GeometryOfNumbersAndQuadraticArithmetic §6.8a, in Scope and ownership, the contracts and the Hurewicz target's Needs. Keep this roadmap's block-stability, equivariant Hurewicz and Hodge-pairing targets. This is a specialization of existing work, not a new supplier gap.

   **Repair test.** Over ℤ, skew-symmetry implies alternation because 2x=0 implies x=0. Thus ε=−1 gives precisely unimodular alternating forms, including the rank-zero object and the rank-two hyperbolic plane. The supplied all-n≥0 theorem covers every i≥1 requested here, integrally.

2. **F02** (P1) The cited plus comparison supplies symmetric forms, not KSp

   **Location.** `packages/ArithmeticKTheoryPartII/README.md:63`: “Picard and skew-form group completion, the classical symplectic plus component”. The asserted supplier is StableHomotopyKTheory §§4.21–4.27; §8.4 cites §4.27 again at lines 981 and 985.

   **Claim.** This supplier provides the integral alternating-form group completion and its BSp∞(ℤ)⁺ component.

   **Witness.** `TauCetiRoadmap/StableHomotopyKTheory/README.md:1755` constructs symmetric unimodular ℤ-forms, signature components ℤ² and BO∞⁺. Its rank-one generators have signatures (1,0),(0,1); alternating forms have even rank and completed components ℤ.

   **Exact repair.** Declare a minimal supplier contract, for example `gap:classical-symplectic-plus`, assigned to StableHomotopyKTheory §4.27: the integral unimodular alternating-form group completion has component group ℤ by half-rank, identity component BSp∞(ℤ)⁺ at its stable perfect commutator, and comparisons natural for forgetful and hyperbolic maps. Put the same slug and needs in the plan's gaps and README contracts. Mark the uses in §§1.1, 4.3 and 8.4 as consuming that contract. Do not request the generic Γ-machine or the classical-to-derived GW comparison again; their owners already provide them. The existing odd-primary `skew-integer-splitting` gap does not assert this integral plus theorem.

   **Repair test.** The form diag(1,−1) has a vector of self-pairing 1; the alternating matrix [[0,1],[−1,0]] has self-pairing 0 on every vector. The new contract sends the latter to half-rank 1 and does not mistake the symmetric signature pair (1,1) for that coordinate.

3. **F03** (P2) The imported Bott class needs an explicit sign conversion

   **Location.** `packages/ArithmeticKTheoryPartII/README.md:175`: “Its image in connective complex K-theory under the tautological character is the Bott generator in degree two.” See also the supplier convention at line 79 and the coefficient formula at line 461.

   **Claim.** The cyclic class normalized by Bockstein 1, the imported Bott generator, and the tangent Chern-character coordinate +1 are the same normalization.

   **Witness.** `TauCetiRoadmap/TopologicalKTheory/README.md:143` fixes β=[O(−1)]−1 on complex-oriented ℂP¹, so ⟨ch₁,β⟩=−1. FGV line 383 normalizes the cyclic image by +1. These generators are negatives.

   **Exact repair.** Explicitly define the arithmetic/tangent coordinate as bott=−β_TopologicalKTheory. Record this adapter in Conventions, the two topological supplier contracts and §0.1. Use bott in §3.2 and the Hodge pairing, or insert (−1)^i wherever those formulas use the supplier's β^i. Explain this sign alongside `gap:topological-symplectic-hodge`, whose existing tangent-normalized scope already requests it. Keep the separate tangent-versus-dual-Hodge factor (−1)^m; it is not this coefficient conversion. Add the ℂP¹ computation as a Check.

   **Repair test.** On ℂP¹, ch₁(−β)=+1. For q=5, i=1, Φ={1,2}, the cyclic Hodge class is 3bott=−3β=2β. The current unqualified supplier coordinate 3β has character value −3=2, rather than the required 3. With the adapter the value is 3. BorelRegulators §2.1 independently uses (−1)^n times the supplier's Bott powers for this same positive Chern normalization.

4. **F04** (P3) Γ-machine and Postnikov references point to different constructions

   **Location.** `packages/ArithmeticKTheoryPartII/README.md:455`: “GeneralizedCohomology G2.6 (the Γ-machine and its adjunction)”; line 969: “GeneralizedCohomology G2.8 (Postnikov covers)”. The first reference also occurs at lines 207, 540, 564, 600, 622 and 645.

   **Claim.** Those numbered items supply the named constructions.

   **Witness.** `TauCetiRoadmap/GeneralizedCohomology/README.md:396` treats true versus naïve homotopy. Its Γ-machine is G2.8 at line 432, the suspension/infinite-loop adjunction G2.5 at line 302, and Postnikov covers G3.8 at line 785.

   **Exact repair.** Replace the explicit G2.6 Γ citations by G2.8, adding G2.5 where the adjunction is used. Replace the G2.8 Postnikov citation by G3.8 and add G3.8 to the exact contract and Layer 8 dependencies. These objects have an earlier owner, so no gap is needed.

   **Repair test.** G2.8 sends the genus monoid ℕ to ℤ; G3.8's τ≥1 sends π₀(Hℤ)=ℤ to 0 and retains positive homotopy. Neither calculation is the true-versus-naïve homotopy assertion of G2.6. This is locator drift, not an additional unowned prerequisite.

5. **F05** (P3) The mod-5 transfer Check has no nonzero arithmetic instance

   **Location.** `packages/ArithmeticKTheoryPartII/README.md:515`: “At q = 5 a transfer value 1 yields the four-class Betti value 2”.

   **Claim.** This is a discriminating arithmetic example of the four-class construction.

   **Witness.** For ℚ(ζ₅), the Minkowski bound is (4/π)²·(4!/4⁴)·√125<2, hence Pic(ℤ[ζ₅])=0. The reduced ideal transfer is therefore always 0. At k=1, K₂(ℤ;ℤ/5)=0 as well.

   **Exact repair.** Replace this conditional scalar illustration by an actual instance: at q=5,k=1 the four-class Betti value is 0, while the two stated CM types still give Hodge values 3 and 1. To test division by 2 on a nonzero arithmetic kernel, add p=691,k=6 and a nonzero order-691 kernel element x, supplied by the existing Bernoulli contract and transfer surjectivity: the four-class image is 2x and 346·2x=x. Do not add these Checks to Suggested.lean.

   **Repair test.** The mod-5 Betti computation becomes 2·0=0. In the irregular example, B₁₂=−691/2730 gives nonzero 691-primary kernel, and 692x=x for order-691 x. Thus the second test can distinguish multiplication by 2 from the zero map.

6. **F06** (P3) The cyclic Bott definition lacks its API list

   **Location.** `packages/ArithmeticKTheoryPartII/README.md:175`: “Let β_q correspond to 1.” The section proceeds through its proof route directly to Checks at line 179.

   **Claim.** This definition has the prescribed definition/API/Checks shape.

   **Witness.** Section 0.1 has no API bullet list; its Bockstein normalization, character functoriality and polynomial assertion occur only in its defining paragraph. The other definition sections have explicit interface lists.

   **Exact repair.** Add prose API bullets for Bockstein–Hurewicz normalization, character powers, the tangent/supplier Bott adapter from R03, and the split polynomial assertion only for q>4. Keep the three existing Checks and the q=3 exception. No Lean declarations are needed.

   **Repair test.** The laws give β₅↦1 under the Bockstein–Hurewicz map, character-square image 2β₅, and trivial-character positive-degree image 0. The polynomial law is unavailable at q=3. These distinguish β from 0, −β and an unjustified associative Moore product.

Six findings: one P1, two P2 and three P3. The package is repairable. The two Lean headlines elaborate, and the earlier repairs are substantially sound. The remaining blocking issues concern duplicated ownership, a missing symplectic plus comparison, and the comparison with the supplier's Bott convention. None re-raises the settled F11 finding.

## Verified sound

This review read all 42 numbered target subsections in the revised README, their API bullets, Checks, proof routes and Needs lines; all four Lean declarations; metadata; all three manifest entries; and the sixteen gap declarations. The adversarial table has 209 computed rows, including negative controls and the findings above. A finite collection of examples is evidence against false formulations, not a proof of the headline theorems.

### Earlier findings, checked first

The prior review's non-computed assertions about supplier contents were not inherited. In particular, the fresh supplier reads produced R01–R04. Repaired passages and their downstream uses were recomputed; the bar comparison was also tested on a nonabelian permutation representation rather than only a sign representation.

| Prior finding | Status and repaired passage | Verification |
| --- | --- | --- |
| F01 | Repaired. README:117: “What EtaleHomotopyTypes must provide (gap:graded-moore-realization)”. | All sixteen plan slugs occur under named suppliers in the README. Legacy G1 is subsumed; unused endpoint G2/G3 are absent. Theorems still stop at 2p−3 and require n_j<p. |
| F02 | Repaired. README:133 requests “relative chain quotients and long exact sequences”; :135 requests “completed relative bar homology”. | Neither requests this roadmap's own inverse-bar comparison or universal-cocycle theorem. The all-degree T_n formula is at :695; continuous universality at :802. The computed chain tests below verify the new formula. |
| F03 | Repaired. README:75 imports “the unitary deformation retract U(g)→Sp_(2g)(ℝ)”; :121 names the Hilbert-class-field comparisons. | CotangentLagrangian C2.0–C2.1 and ClassFieldTheory Layer 13 were reopened. The residual gaps request only the additional spectrum/Hodge and p-subfield/tower interfaces. |
| F04 | Repaired. README:53: “Consume `finiteFieldKGroups`”; :881 states the actual restriction and reduction isomorphisms. | GeneralAlgebraicKTheory §§13.8b–c supplies the groups; the gap at :153 now requests only sphere-unit surjectivity. Values for ℓ=2 and the negative control ℓ=19 are below. |
| F05 | Repaired. README:21 gives “pp. 6–7”; :189 gives “pp. 10–11”; :291 gives “pp. 11, 22”; :323 cites “Definitions 4.3–4.4”. | Also checked :492 pp.19–21, :757 §§7.2–7.3 pp.40–42 and :1000 FGV line 43. All seven old locator corrections match the author copy. New supplier-locator defects are R04. |
| F06 | Repaired. README:413: “[B₁][B₂]=[L][bar L]⁻¹”. | FGV Proposition 4.7 uses a product. The X,X⁻¹ twisting route, the actual Lean product equation and the four-class calculation agree. The unrelated mod-5 Check defect is R05. |
| F07 | Repaired. README:568: “Rigidify the ambient abelian scheme A”; the simplicial notation is 𝒵(T). | At T={*}, a genus-one discarded ambient factor is still embedded. At simplicial degree r there are r+1 embeddings. The old selected-factor-only rigidification does not recur. |
| F08 | Repaired. README:973, :979, :983, :987 separately name stability, finite type, equivariant Hurewicz and Hodge pairing. | Each has its own Needs line. The Check at :994 says “Odd m<p”; p=5,m=4 gives 8>7 and is excluded. The new duplication R01 is exposed by the separated finite-type target. |
| F09 | Repaired. Suggested.lean:72 defines `conjugateFractionalIdeal`; :82 defines `IsSkewCMLine`; :95 states `exists_cm_lines_with_ideal_product`. | The repair correctly found native semilinear fractional-ideal transport, which the earlier review had missed. All definitions have real bodies. The new headline uses no free surrogate predicate. |
| F10 | Repaired. README:714: “If H₀(H;M)=H₁(H;M)=0, forgetting the section is an equivalence”. | No Λ-projectivity restriction remains. At Λ=ℤ/9, M=ℤ/3 with sign C₂-action, H₀=H₁=0 and the section is unique although M is not projective. |
| F11 | Settled; not re-raised. README:49: “Extend §6.11’s top-degree corestriction descent to the full cover K_q/ℚ”. | The repair report's reason is correct: the base theorem uses F(μ_q^(⊗i)), which need not be K_q. At q=9,i=3 the character image has size 2, not 6. The precise new gap and route replace the incorrect proposed specialization. |
| F12 | Repaired. README:883 now gives the coefficient-sequence/invariant route as complete prose. | The garbled sentence and catalogue fragments are absent. `charney1987` has an authors array and locator Corollary 4.5. No process labels or local paths were found in the package prose. |

### Source sample

All fifteen seeded targets were opened at the following locators in the supplied 64-page FGV author copy. Its numbering is the version the README cites; this is not a collation against the longer published pagination. Source mistakes are separately recorded below. The sole inaccessible cited work is the settled, uncertified Charney article.

| Target | Source text read | Hypotheses, map and page check |
| --- | --- | --- |
| 0.3 Cyclotomic Picard classes | Corollary 2.12 and Remark 2.13, pp.14–15; FGV line 615 through FGV line 648 | Reduced [L]−1, exponent 2k−1, equivariance and the positive eigenspace agree. Ordinary k≥1 uses the separate arithmetic comparison; all integer k uses Bott inversion. Two source typographical mistakes are not copied. |
| 1.1 Betti and Hodge maps | Definitions 3.2–3.3, pp.18–19; FGV line 810 through FGV line 860 | Forgetful map has rank 2 on a plane; unitary Hodge map rank 1. Im h and the real symplectic convention were checked. Supplier plus and Bott adapters remain R02–R03. |
| 1.2 Bott-inverted symplectic K-theory | Remark 2.8 p.11; §3.6 p.22; FGV line 503 through FGV line 509 and FGV line 964 through FGV line 1006 | Period 2p^(n−1)(p−1), compatible iteration and no uniform p-adic period. The q=3 multiplication exception is retained. |
| 2.2 Trace polarization and CM realization | §4.3 and Remark 4.6, pp.25–27; FGV line 1127 through FGV line 1219 | Perfect skew coefficient line, negative trace and −2i Hermitian normalization, genus [E:ℚ]/2, isometries and positive-line tensor naturality agree. |
| 3.4 Betti–Hodge splitting | Theorem 3.5, Corollary 3.6 and proof, pp.19–21; FGV line 871 through FGV line 957 | All i≥0 at odd finite coefficients; stated positive p-adic residue classes. This is an abelian-group splitting, not a splitting of the arithmetic representation. Factor 2 was recomputed. |
| 3.5 CM generation | Proposition 5.1 p.29 and §5.3 pp.32–33; FGV line 1306 through FGV line 1324 and FGV line 1447 through FGV line 1483 | Common-type pairs, product of ideal classes, four classes, zero Hodge image and twice the arithmetic transfer. The proof order is noncircular. The theorem is supported; the Check at :515 is R05. |
| 4.1 Polarized abelian Γ-groupoid | Appendix A.4, (A.12), pp.59–60; FGV line 2744 through FGV line 2772 | Ambient ppav with selfadjoint factors, arrows on selected factors, product/Segal comparison and one-point contractibility. Rosati and unbounded-atlas source wording require the corrections below. |
| 4.4 Galois action on the spectrum | Proposition 6.2 p.34; Appendix A.5 pp.61–62; FGV line 1544 through FGV line 1572 and FGV line 2811 through FGV line 2868 | Aut(ℂ) action, all genera, coefficient compatibility and p-adic limit. The README includes Moore smashing before completion at 3 and maintains discrete grades, rather than silently completing the set of genera. |
| 5.3 Relative bar convention | §7.1, (7.5)–(7.8), p.38; FGV line 1735 through FGV line 1746 | Source gives low-degree left-coefficient relations. The all-degree inverse/reversal map is the roadmap's own comparison with the pin, verified below, not a theorem falsely attributed to FGV. |
| 5.4 Universal relative extension | Lemmas 7.4 and 7.6, pp.38–39; FGV line 1747 through FGV line 1774 | Arbitrary Λ-module M; chosen H-section; arbitrary kernel maps; low subgroup-homology vanishings for forgetting the section. No projectivity hypothesis is required. |
| 6.1 Finite arithmetic action | Lemma 7.7, pp.39–40; FGV line 1805 through FGV line 1871 | Action factors through G_q; trivial arithmetic kernel, odd-twist quotient, unique c-equivariant section. The Betti splitting is not asserted to be globally equivariant. |
| 7.5 Bott-inverted universality | Theorem 7.14 and Remark 7.15, pp.46–47; FGV line 2127 through FGV line 2151 | Every integer k, including nonpositive k; compatible finite periods before taking limits. Negative twists use dual powers. |
| 7.6 Trivial action in degree 4k−1 | §7.7, Remark 7.16 and footnote 13, pp.47–48; FGV line 2154 through FGV line 2194 | Odd p, k≥1, auxiliary topological generator, actual reduction map and factor-two sphere comparison. Correct twist is 2k. The README corrects the source's footnote exponent. |
| 8.3 Low-range integral Hurewicz | §8.1 and Theorem 8.4 proof, pp.49–50; FGV line 2272 through FGV line 2317 | The roadmap deliberately uses positive integral finite-type E and degrees 1…2p−3. Its supplier contract owns the precise safe-range Postnikov input. The source alone does not justify its wider endpoint or arbitrary discrete ℤ_p model. |
| 8.5 Rational stable Hodge generators | FGV §1.1 p.1, FGV line 43; §8 pp.48–49, FGV line 2241 through FGV line 2255; Borel §10.6, Theorem 11.1, §11.4, pp.265–267, borel1974 line 1148 through borel1974 line 1253 | Symplectic polynomial degrees 4k−2; compact-dual comparison; rational descent specified separately; untwisted cohomology has inverse cyclotomic weight. The SL regulator is not a supplier for symplectic stability. |

The repaired §2.4 was also read against Proposition 4.7 and Lemma 4.8, FGV line 1232 through FGV line 1293. Section 6.2 was checked through FGV line 1964, including the corrected Bott exponent and conjugation-paired cancellation. The stable Γ-atlas repair was read through FGV line 2789. These are additional to the seeded sample.

### Pins, ownership and exact supplier resolution

The supplied main snapshot is `7bd35ba3a6197cb1fadd5dac74e67499aa22b3b4`. The manifest pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The board package index was read before any absence conclusion. Main, the indexed open heads and the readable board packages were searched by object using the roadmap service and local `rg`; exact declaration-name searches alone were not used as the ownership test.

| Pinned declaration opened | Native content and its limit |
| --- | --- |
| `Mathlib/RepresentationTheory/Basic.lean:48`, `Representation` | A monoid homomorphism into linear endomorphisms; it contains no topology or continuity field. |
| `Mathlib/Algebra/Module/LinearMap/Defs.lean:84`, `LinearMap` | Semilinear map structure on the supplied scalar/module carriers. |
| `Mathlib/RingTheory/PicardGroup.lean:77`, `Module.Invertible`; :429, `CommRing.Pic` | Invertibility is bijectivity of the dual contraction; Pic is the group of invertible-module classes, not a groupoid retaining automorphism loops. |
| `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:125`, `inhomogeneousChains.d`; :154, `inhomogeneousChains`; :228, `groupHomology` | Absolute homology, natural-number degrees, inverse action on the first face. No relative pair quotient or completed continuous bar object is supplied by these definitions. |
| `Mathlib/CategoryTheory/Comma/Over/Basic.lean:631`, `CategoryTheory.Under` | Ordinary undercategory and commuting-triangle morphisms, suitable for the extension classification. |
| `Mathlib/NumberTheory/NumberField/CMField.lean:69`, `IsCMField`; :236, `ringOfIntegersComplexConj` | Totally complex and quadratic over the maximal real subfield; native conjugation on integers. It does not say that a CM field's Hilbert class field is itself CM. |
| `Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean:125`, `maximalRealSubfield` | Elements fixed by complex conjugation under every complex embedding. |
| `Mathlib/RingTheory/FractionalIdeal/Operations.lean:569`, `spanSingleton`; :953, `ringEquivOfRingEquiv` | Principal fractional ideals and semilinear transport along a base ring equivalence. The latter is the existing object needed by the new Lean definition. |
| `Mathlib/RingTheory/DedekindDomain/Different.lean:229`, `FractionalIdeal.dual` | Trace-dual construction, with an explicit zero-ideal branch. The unit ideal in the number-field headline is nonzero, so that branch is not used as an inverse different. |
| `Mathlib/LinearAlgebra/SymplecticGroup.lean:101`, `Matrix.symplecticGroup` | Matrix carrier defined by AJAᵀ=J; finite-rank symplectic groups exist. This does not itself construct a stable arithmetic KSp spectrum. |
| `TauCeti/Geometry/Symplectic/ExistsCompatible.lean:188`, `TauCeti.SymplecticForm.exists_compatible` | Finite-dimensional real symplectic existence, with ω(v,Jv)>0. Neither contractibility of choices nor the spectrum comparison is included. |
| `TauCeti/NumberTheory/NumberField/Ideal/ArtinMap.lean:181`, `artinHomAway`; :218, `artinHomAway_apply_prime` | Ideal Artin map with arithmetic Frobenius at unramified primes; not a replacement for global class-field constructions. |

The following table resolves the actual supplier contents. References are to `TauCetiRoadmap/<Name>/README.md`, except where a board design or sub-roadmap is explicitly indicated. Open-head reads used the indexed head, not a proposed edit of a pre-existing roadmap on main.

| Supplier and locations read | Resolution |
| --- | --- |
| ArithmeticKTheory §§3.1–3.5, 5.2, 6.11, 6.15–6.16, 7.1–7.5; §3.5 at :1213, classical finiteness :1331; §6.11 :2714; §6.15 :3094; §6.16 :3211 | Arithmetic finite generation, descent, sign tables, degree-one exception and Bernoulli conventions exist. Full cyclotomic cover at arbitrary twist remains a gap. Integral classical KSp finiteness is already owned here: R01. |
| GeneralAlgebraicKTheory §§7.1–7.7 at :1576–1687, §§13.8b–c at :3253, :3270 | Biexact products, stabilization, coherence, units, transfer, Brauer lift and `finiteFieldKGroups` exist. These are distinct from additive group completion. |
| SchemeKTheoryOperations §§6.1, 6.9–6.11 at :1627, :2078, :2108, :2152 | Products, finite coefficients, Bott and transfer/Gysin interfaces exist. Trace-dual dualization compatibility remains the declared additional contract. |
| StableHomotopyKTheory §§3.20, 3.34–3.37 at :1183, :1330–1360; §§4.21–4.27 at :1662–1755; §§5.1–5.19, §5.19 :2112; §§7.1–7.17 at :2215–2425; §7.28 :2584 | Generic group completion, Picard spectra, finite-type and coefficient/Milnor/product inputs exist. §4.27 is symmetric, causing R02. §7.28 explicitly excludes associative Moore multiplication at 3. |
| GeneralizedCohomology G2.1–G2.8; G2.5 :302, G2.6 :396, G2.8 :432; G3.8 :785; G5.4–G5.6, unitary models :1652 | Spectrum, adjunction, Γ-machine and ku/KU exist as roadmap targets. Explicit wrong section references are R04. Positive Chern normalization must be compared with the chosen TopK Bott class: R03. Quaternionic KSp=Σ⁴KO here is a different object from arithmetic KSp(ℤ). |
| SymplecticGeometry, `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/README.md:162`, C2.0–C2.1 | Polar factors stay symplectic and the positive factor contracts. This owns the U(g)→Sp₂g(ℝ) deformation retract. |
| TopologicalKTheory Conventions :143, T4 :816, T5 :886, T7 :1148 | New-roadmap open head, admissible as a supplier. Complex bundles and the Bott convention exist; β=[O(−1)]−1 has negative Chern coordinate. |
| `packages/ChromaticHomotopyTheory/design/README.md:313`, CH.2; :442, CH.3 | Board design supplies periodicity/localization direction. Compatible coefficient towers, common iteration and the p=3 map-only interface are explicitly requested by the gap. No absent completed package is treated as a theorem. |
| GeometryOfNumbersAndQuadraticArithmetic §§6.5–6.8a at :2986–3342, classical comparison inside §6.8a; §6.10a :3582, §6.11 :3643 | Higher GW, classical-to-genuine comparison, duality and integral L inputs exist. Odd-primary skew specialization with the specified unscaled H remains the gap. |
| HermitianKTheoryOfPoincareCategories Layers 4–6 | Poincaré/GW comparison and surgery interfaces exist; they do not replace the integral classical plus assertion missing in R02. |
| ComplexMultiplicationAndExplicitReciprocity §1.3 :417, §2.1 :472, §2.2 :512 | Polarized classification, Serre tensor and reciprocity exist. Arbitrary-automorphism isometries with paired lifts and possibly negative translating signatures remain the precise extension. |
| AbelianSchemesAndArithmeticModuli A5.5 :2588, A5.8 :2662 | Polarized Hodge comparison and Siegel family exist with the dimension and polarization inputs used here. |
| PELModuli M1.5 :1714, M1.12 :2007, M2.3 :2210, M2.4 :2224, M2.8 :2350, M2.9 :2400, M3.9 :3116, M6.2 :3765, M6.3 :3788, M6.9 :3978 | Moduli, isomorphism, atlas, polarization and characteristic-class interfaces resolve. Projective-embedding/Hilbert-polynomial refinements and coherent product/factor refinements remain the gap. |
| `packages/EtaleHomotopyTypes/design/README.md:1096`, EH.5; :1182, EH.6; G7 and their realization targets | Betti/étale and automorphism comparisons are present in the board design. The graded ppav/Moore/limit refinement is a declared supplier contract; the ppav-to-KSp specialization remains here. |
| ClassFieldTheory Layers 11–13, global Artin/norm target :1710, full/narrow Hilbert fields and class-group comparison :1827–1835 | Full versus narrow fields and principal-prime splitting resolve. The maximal unramified abelian p-subfield and its tower/local comparison remain the gap. |
| Chebotarev Layer 10 at :410 | Prescribed conjugacy class, positive density and exclusion of finitely many primes. Choosing a primitive residue class modulo p² produces the required odd-p topological generator. |
| ArithmeticGaloisDuality R02.1, R02.2.1 :1126, R02.2.2 :1230, R02.2.3 :1327, R02.4.3 :3324 | Continuous coefficients, cohomological Hochschild–Serre, transgression, norms and Poitou–Tate resolve. Relative homological edges and completed relative bars remain explicit gaps, not inferred from the cohomological version. |
| EtaleCohomologyFoundations F.0.2 :200, F.0.3 :231, F.4.0–F.4.6, F.4.5 :1040 | Finite fundamental groups, twists and adic categories resolve. The rational representation Check is not the required integral finite-type equivalence; the lisse-integral gap is justified. |
| IntegralIwasawaTheory §3.1 :438, §7.4 :900, §12.3 :1613 | Ramification/control, conditional Vandiver propagation and arithmetic-weight specialization resolve. The exact small-weight H²/Bernoulli nonvanishing iff is the declared extension. |
| KTheoryFiniteLocalFields §§1.1–1.2 at :197, :216 | Coefficients and Bott refinements; its own contract imports finite-field groups from GeneralAlgebraicKTheory. Sphere-unit surjectivity is separately requested. |
| ArithmeticLocallySymmetricSpaces ALS.0.8 :1369, ALS.1.5 :1895, ALS.1.6 :1949, ALS.2.3 :2211, ALS.2.4 :2246 | Arithmetic quotient comparisons and finite Borel–Serre models, including finite isotropy. These yield finite generation, not integral block stabilization. |
| AlgebraicTopology Stage 6 at :946, product/Bockstein material at :1048 | Products, Künneth, cap and fundamental classes. The exact integral/finite mixed-Tor interface remains the declared contract. |
| BorelRegulators §2.1 at :247 | Chern-normalized GL regulator construction, with an explicit (−1)^n Bott adapter. It is a scope boundary, not a symplectic stability supplier. |

Object searches covered invertible/Picard modules and automorphism groupoids; semilinear fractional ideals and inverse differents; skew and classical GW group completion; finite generation and stable Sp homology; polarized CM lattices, Serre tensor and reciprocal action; ppav Γ-atlases and realization; relative bar homology/universal extensions; integral indecomposables and Bockstein products. Generic objects stay with the suppliers above. The specific cyclotomic ideal-product realization, arithmetic CM Bott classes, their universal extensions and their Hodge consequences belong here. R01 is the remaining ownership overlap found. No duplicate fully qualified name of any of the four Lean declarations was found in another readable roadmap.

Two additional indexed board heads had no package-stage README at the advertised path; their design READMEs were then retrieved successfully at those same heads. `packages/PELModuliPartII/design/README.md:3` at d4bb48d concerns unitary integral/formal moduli, CM pairs and basic-locus comparisons. `packages/ArithmeticLocallySymmetricSpacesPartII/design/README.md:3` at 84a41ac concerns fixed-level SL₂ weight multiplicities, completed local homology bounds and Bianchi growth. Their object searches and scope reads do not assign either the arithmetic symplectic plus comparison or KSp/Sp stability to those continuations. They were not treated as missing roadmaps or added as suppliers.

### Gaps, order and internal supply

All sixteen existing slugs match between `packages/ArithmeticKTheoryPartII/design/plan.json` and the README's exact contracts. Each has a named earlier supplier and a specific interface. Their clauses concern one coherent comparison apiece; none asks for a fresh generic carrier that the checked pin or supplier already provides. They are conditional contracts, not findings about work that has yet to be implemented.

| Gap | Supplier | Minimal additional interface checked |
| --- | --- | --- |
| duality-transfer | SchemeKTheoryOperations §6.11 | Integral inverse-different dualization/transfer and its coefficient/Bott edges. |
| topological-symplectic-hodge | GeneralizedCohomology G5.4–G5.6 | Unitary realization, normalized primitive pairing and integral/Bockstein refinements; R03 specifies its coordinate adapter. |
| skew-integer-splitting | GeometryOfNumbersAndQuadraticArithmetic §§6.8a, 6.10a–6.11 | Skew integral specialization and the factor-two retraction. |
| compatible-v1-towers | ChromaticHomotopyTheory CH.2–CH.3 | Common iterations, reduction maps and telescope comparison including 3. |
| cyclotomic-p-class-fields | ClassFieldTheory Layers 11–13 | p-subfields, tower compatibility and local-p-split comparison. |
| ppav-embedding-atlases | PELModuli §§M2.4, M6.3 | Embedding pieces, smooth descent and product/selfadjoint refinements. |
| cm-arbitrary-automorphism | ComplexMultiplicationAndExplicitReciprocity §§1.3, 2.1–2.2 | Arbitrary automorphisms, conjugation-paired lifts, negative translating signatures and positive tensor naturality. |
| relative-homology-edges | ArithmeticGaloisDuality R02.2 | Relative chains/LES and the arithmetic relative homological edges. |
| low-postnikov-finite-type | StableHomotopyKTheory §§3.20, 3.34–3.37 | Positive integral finite-type safe-range splitting and free/cyclic calculations. |
| compact-relative-cocycles | ArithmeticGaloisDuality R02.1–R02.2 | Completed relative bar object, coefficient coinvariants and exact finite limits; universal cocycles remain local. |
| bernoulli-weight-nonvanishing | IntegralIwasawaTheory §12.3 | Odd 1≤m<p H² nonvanishing iff the Bernoulli numerator is divisible by p. |
| sphere-unit-finite-field | KTheoryFiniteLocalFields §§1.1–1.2 | Sphere-unit surjectivity at a topological generator, not another finite-field group calculation. |
| pontryagin-bockstein-cap | AlgebraicTopology Stage 6 | Finite-type ℤ_p/finite coefficients and the mixed Tor Bockstein representative. |
| graded-moore-realization | EtaleHomotopyTypes EH.5, EH.6, G7 | Graded ppav realization with products, automorphisms, Moore smashing at 3 and coefficient limits. |
| lisse-integral-extension | EtaleCohomologyFoundations F.4 | Integral finite-type representation/sheaf equivalence and local restriction. |
| full-cyclotomic-h2-descent | ArithmeticKTheory §6.11 | Top-degree corestriction along the full K_q/ℚ cover at every integer twist. |

The required dependency command returned exit 0 with exactly:

```text
depcheck: 48 roadmaps, 554 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Every Needs line was read, including the separate four statements in §8.4 and two in §7.6. The local route §3.2→§3.4→§3.5 is acyclic: type-sum surjectivity does not use generation. Layers 4→5→6 construct the action before identifying its cocycle. Section 8.3 is generic and uses no §8.4 application. The two locator repairs in R04 change no ownership direction. No new later-roadmap supplier is proposed.

### Lean acceptance test, signatures and shape

The required `lake env lean` elaboration of `packages/ArithmeticKTheoryPartII/Suggested.lean`, run from the pinned content checkout, exited 0. Its only warnings were “declaration uses 'sorry'” at lines 52 and 95. No TauCeti import required a build. A separate scratch copy with `#check @` for each of the four declarations also exited 0; every field, number-field, cyclotomic, CM, prime, positive-exponent, type and nonzero-ideal binder was retained. No signature differs from README §§2.3–2.4, and no binder repair was made.

On another scratch copy, each of `simp`, `rfl` and `infer_instance` was tried as a single complete tactic for each sorried theorem. All six attempts failed to close their target. The exact-object library searches and opened declarations provide neither existence theorem as one library lemma. Neither theorem restates its definition or a small Check; no padding was found. The two definitions are the few native constructions needed for the CM ideal-product headline.

| Headline inventory | Acceptance-file disposition |
| --- | --- |
| Cyclotomic split-prime/sign existence (§2.3); prescribed CM ideal-product realization (§2.4) | Both stated, at lines 52 and 95. Genuine native carriers; two real-body definitions at lines 72 and 82. |
| Picard–Bott and Artin–transfer (§§0.3–0.5) | Named in the module docstring; higher and Bott-localized K groups unavailable at the pins. |
| Betti–Hodge splitting, CM generation, height-one comparison (§§3.4–3.6) | Named; arithmetic KSp spectrum, comparison maps and stable sources unavailable. |
| Coherent arithmetic action and finite-genus detection (§§4.4–4.5) | Named; ppav realization and arithmetic spectrum unavailable. |
| Stable CM reciprocity (§5.1), relative extension classification (§5.4) | Named; CM groupoids/stable nerves and relative homology/extension category unavailable. Absolute group homology is not a substitute. |
| Finite, compact, locally split and all-twist universality (§§6.3, 7.2, 7.4–7.5) | Named; KSp, arithmetic action and completed relative homology unavailable. |
| Trivial odd-degree action (§7.6); conjugation-fixed prime criterion (§7.7) | Named; action and compatible p-Hilbert prime torsors unavailable. |
| Integral indecomposable product, low Hurewicz and stable equivariant/Hodge comparisons (§§8.2–8.5) | Named; spectral, Pontryagin/Bockstein, stable arithmetic and Hodge carriers unavailable. Finite-rank stability alone is explicitly identified as a supporting target on existing groups, not substituted for the missing stable headline. |
| Bernoulli divisibility for ppav families (§8.6) | Named; principally polarized families and their Hodge/cap-product realization unavailable. A numerical Bernoulli implication alone would be a stand-in and is correctly absent. |

The file has one `import Mathlib`, one namespace, the required module docstring and a Layer 2 comment, and a mathematical docstring for every declaration. It contains two theorem sorries, two real-body definitions, no sorry'd data, `set_option`, `lemma`, admitted example, free surrogate Prop, `#eval`, `#synth`, or `#print axioms`. README and Lean names agree. The README has all nine layer endings, Examples and Dependencies, the requested opening/ownership/conventions/contracts/build/consumers/references shape, and Unicode mathematics. Main-branch ClassFieldTheory, GeneralizedCohomology and SymplecticGeometry were read for house style. R06 is the remaining definition/API shape defect; no computational algorithm or copied source passage was found.

### Computed adversarial record

Rows below cover the conventions, definitions, API laws, theorems and worked Checks. A row's “retain” means the computed instance agrees, subject to the explicitly named supplier contracts; it does not claim that an unimplemented theorem has been proved. No package source file was changed during this review.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: coefficient domain | p=3,n=1; n=0; p=2 | q=3 and 2⁻¹=2; q=1 makes 1=0; in 𝔽₂, 2=0 | Positive n and odd p are necessary | Retain |
| Conventions: field and universe hypotheses | K=ℚ(ζ₃), K=𝔽₃, zero ring | [K:ℚ]=2 in first case; 3=0 in 𝔽₃ versus 3≠0 in any ℚ-algebra field; zero ring has 1=0 | Characteristic-p, inseparable and zero-ring inputs cannot satisfy the headline field hypotheses | Retain |
| Conventions: ordinary/periodic degree | k=0,1,2 | 4k−2=−2,2,6; twists −1,1,3 | Negative degrees belong only to the periodic theorem | Retain |
| Conventions: arithmetic Artin | Frobenius at 2 on μ₅, third twist | Arithmetic 2³=3; geometric 2⁻³=2 modulo 5 | Direction discriminated | Retain |
| Conventions: negative twist | χ=2 in 𝔽₅, j=−1 | Dual scalar 2⁻¹=3; 2·3=1, not 2²=4 | Dual, not another positive power without reduction | Retain |
| Conventions: unreduced suspension | Point | π₀Σ∞₊point=ℤ with unit 1; reduced suspension gives 0 | Unit retained | Retain |
| Conventions: two projectors | ψ=diag(1,−1), Λ=𝔽₅ | p₊=diag(1,0), p₋=diag(0,1); sum=id, product=0 | Splitting holds; at p=2 denominator is zero | Retain |
| Conventions: hyperbolic normalization | Rank-one unit, q=5 | c_BH=2; (1/2)c_BH=3·2=1 | Kernel inclusion must be half-H | Retain |
| Conventions: finite versus inverse-limit periods | q=3,5,25 | Periods 4,8,40; 40≠8 | No fixed period inferred for all n | Retain |
| Conventions: trace/Hermitian sign | Gaussian δ=i/2, vectors 1,i | b(1,i)=1/2; −Tr b=−1; h(1,1)=1; h(1,i)=−i | Im h=ω and ω(1,J_H1)=−1 | Retain |
| Conventions: native compatible J | Same plane, J_H=i | ω(1,i)=−1; ω(1,−i)=+1 | Tau Ceti's positive J is −J_H | Retain |
| Conventions: dual Hodge sign | m=1,2 | ch_m(V∨)=(−1)^m ch_m(V), scalars −1,+1 | Tangent adapter is correct | Retain |
| Conventions: imported Bott sign | Complex-oriented ℂP¹ | ch₁([O(−1)]−1)=−1; required cyclic coordinate +1 | Two chosen generators differ by −1 | R03 |
| Conventions: ordinary ℤ_p homology | E=ΣHℤ versus ΣHℤ_p with discrete coefficients | First H₁=ℤ_p; second H₁=ℤ_p⊗ℤℤ_p; for a∈ℤ_p∖ℚ, a⊗1−1⊗a≠0 maps to a−a=0 | Finite integral type cannot be omitted | Retain |
| Conventions: compactness | Γ=C₂ versus ℤ with discrete topology | C₂ compact; cover of discrete ℤ by singletons has no finite subcover | Completed category does not admit arbitrary discrete groups as profinite inputs | Retain |
| §0.1 cyclic class | q=5 | Bockstein–Hurewicz sends β₅ to 1; zero class gives 0 | Normalization determines nonzero class | R06 API list |
| §0.1 character law | q=5, characters 2 and trivial | Images 2β₅ and 0; Bockstein coordinates 2 and 0 | Distinguishes scalar and zero models | Retain with R03 |
| §0.1 ku comparison | q=5, tautological character | Positive character pairing 1; supplier β pairing −1=4 | Sign comparison required | R03 |
| §0.1 polynomial/retraction range | q=5 versus 3; β³ | Degree 6 in both; 5>4 whereas 3≤4 | Polynomial assertion applies only in first case | Retain |
| §0.2 Picard components | Field F=𝔽₂; zero ring | Pic(F)=1, F×=1; zero-ring Pic and units each have one element | No unwanted nonzero-rank condition introduced | Retain |
| §0.2 automorphism loops | F=𝔽₅ | Pic(F)=1 but Aut(F)=F× has four elements | Component set alone loses loops | Retain |
| §0.2 fractional arrows | 2ℤ→3ℤ | (3/2)·2ℤ=3ℤ; 3/2 is not in ℤ× | Fraction-field-unit arrow required | Retain |
| §0.2 multiplicative unit | Unit line over ℤ | K₀ value 1, not additive zero 0 | Zero map excluded | Retain |
| §0.2 tensor versus direct sum | Two rank-one lines | Tensor rank 1·1=1; sum rank 1+1=2 | Operations kept distinct | Retain |
| §0.2 scalar extension | ℤ→𝔽₅, unit line | Class 1 maps to 1; tensor square remains 1 on both routes | Naturality square agrees | Retain |
| §0.2 representative dependence | Chosen trivializations of a line differing by u=−1 | Component unchanged, loop multiplied by −1 | A chosen decomposition is not a canonical ring splitting | Retain |
| §0.3 Picard–Bott map | L=O_q, k=1 | [L]−1=0, image 0; exponent 1 and degree 2 | Reduced class and degree agree | Retain |
| §0.3 tensor/additive law | Ideal classes a,b, with unit b=1 | [a·1]=[a]; image sum f(a)+0=f(a) | Tensor unit is additive zero after reduction | Retain |
| §0.3 twists and ordinary range | k=−1,0,1 | Bott exponents −3,−1,1; degrees −6,−2,2 | First two require Bott inversion; last is ordinary | Retain |
| §0.4 coinvariant transfer | q=3,k=1 | Pic(O₃)/3=0; K₂(ℤ;ℤ/3)=0; map 0→0 | Correct regular small case | Retain |
| §0.4 full-cover gap | q=9,k=2, twist precursor 3 | (ℤ/9)× has 6 elements; χ³ image has 2; omitted kernel has order 3 | Base §6.11 does not directly supply this cover | Retain declared gap |
| §0.4 dualization/transfer normalization | Positive eigenvector x, q=5 | (1+ψ⁻¹)x=2x; half-composite 3·2x=x | Inverse different and half-H cannot be dropped | Retain contract |
| §0.5 Artin–Bott edge | q=3,k=1 | p-class group 0; G_q=C₂; H₁(C₂;𝔽₃(sign))=0; relative H₁(C₂,C₂)=0 | Both descriptions agree | Retain |
| §0.5 Artin convention | Prime 2 in K₅, twist 3 | ζ↦ζ², tensor scalar 3; inverse Frobenius gives 2 | Earlier arithmetic convention persists | Retain |
| §1.1 two comparison maps | Symplectic plane, zero space | c_B rank 2 and c_H rank 1; both rank 0 on zero | Maps are distinguished | Retain |
| §1.1 additivity | Two planes | Betti ranks 2+2=4; Hodge ranks 1+1=2 | Addition preserved | Retain |
| §1.1 polar comparison | A=diag(2,1/2) | Positive factor P=A, unitary factor U=I; det(P^t)=2^t2^(−t)=1 | Contraction stays symplectic | Retain |
| §1.1 rank-zero polar case | Empty matrix | Sp₀=U₀={1}; contraction endpoint 1 | No missing nonemptiness assumption | Retain |
| §1.1 ku conjugation | Bott degrees 2 and 4 | ψ⁻¹β=−β, ψ⁻¹β²=β² | Negative factor precisely odd powers | Retain |
| §1.1 classical plus identification | Symmetric rank-one lines versus alternating planes | Completed components ℤ² versus ℤ; rank-one alternating nondegenerate form absent | Cited supplier is wrong carrier | R02 |
| §1.2 telescope degree | (p,n)=(3,1),(5,1),(5,2) | v₁ degrees 4,8,40 | Finite periods match coefficient character periods | Retain |
| §1.2 coefficient refinement | q=25→5 | 40 is 5·8; common iterate exists arithmetically | No level-independent period asserted | Retain contract |
| §1.2 connective comparison | i=0,2 and negative −2 | ku→KU coefficients ℤ→ℤ in first two even degrees; 0→ℤ at −2 | Ordinary/periodic distinction real | Retain |
| §2.1 perfect coefficient line | Gaussian O, δ=i/2 | (δ)O·O=(i/2)=inverse different; δ=i gives O⊊(i/2) | Perfect, not merely integral | Retain |
| §2.1 isometry carrier | Multiplication by i versus 2 on O | i·bar i=1; 2·bar2=4 | First preserves form, second does not | Retain |
| §2.1 coefficient tensor | Two skew involutions −c | (−c)⊗(−c)=c⊗c | Tensor leaves the skew coefficient convention | Retain |
| §2.1 tensor unit/associativity | Three unit positive lines | (1·1)·1=1·(1·1)=1 | Unit and associativity coordinates agree | Retain |
| §2.1 automorphism group | ℚ(i); K₃ | Norm-one units μ₄ and μ₆; −1∉μ₃ | μ_q is a subgroup, not the full group | Retain |
| §2.1 positive versus negative action | Positive unit and (O,−1) | δ=i/2 maps to i/2 and −i/2; signs (+,−) and (−,+) | Only positive action preserves type | Retain |
| §2.2 realization dimension | E=ℚ(i) | Integral rank 2; genus 2/2=1 | No rank/genus factor error | Retain |
| §2.2 realization on arrows/composition | Unit isometries i,i | Composite −1; (−1)·bar(−1)=1 | Composition remains polarized | Retain |
| §2.2 Serre tensor | Positive unit line | O⊗_O O=O; genus remains 1; δ unchanged | Identity tensor gives identity realization | Retain |
| §2.2 faithfulness/Rosati | Multiplication by i | i acts nontrivially, adjoint is −i=bar i | Faithful O action and conjugate adjoint agree | Retain |
| §2.2 trace and complex sign | b=(i/2)x bar y | ω(1,i)=−1, Im h(1,i)=−1; ω(1,−i)=+1 | Native positive structure is −i | Retain |
| §2.2 exclusion of isogenies | Multiplication by 2 | Determinant 4; pullback form 4ω≠ω | Arbitrary isogeny is not an arrow | Retain |
| §2.3 split-prime headline | q=3, t=7 and −7 | N(3+ζ₃)=9−3+1=7; signs +1 and −1 | Both signatures and distinct split primes exist | Retain |
| §2.3 excluded inert/ramified/unit cases | t=2,3,1,0 in ℚ | 2 inert; 3 ramified with coincident conjugates; (1) not prime; t=0 violates nonzero | Exact Lean hypotheses reject each wrong witness | Retain |
| §2.3 narrow-field disjointness route | K₃/ℚ and K₅/K₅⁺ | Degrees 2 and 2; extension ramified at 3 or 5 while narrow class field is finite-unramified | Intersection cannot be the quadratic extension | Retain |
| §2.4 conjugate fractional ideal | 0,O,(1/2) in ℚ(i) | Images 0,O,(1/2); double images same | Total zero branch and fractional domain correct | Retain |
| §2.4 conjugation involution | P=(2+i) | bar P=(2−i), barbar P=P | Identity operation fails first equality | Retain |
| §2.4 product law | (2+i)(2−i) | Conjugate of product=(5); product of conjugates=(5) | Multiplicativity correct | Retain |
| §2.4 inverse law | P=(2+i)≠0 | bar(P⁻¹)=(2−i)⁻¹=(bar P)⁻¹ | Nonzero hypothesis avoids ideal-inverse junk | Retain |
| §2.4 principal law | a=2+i and a=0 | bar((a))=(2−i); bar((0))=(0) | Correct semilinear direction | Retain |
| §2.4 skew predicate positive example | B=O, δ=i/2 | barδ=−δ; ideal equality (i/2)=(i/2); type signs ±1/2 | All fields jointly determine the line | Retain |
| §2.4 perfection negative control | Same B, δ=i | Form determinant 4 rather than 1; O has index 4 in (i/2) | Inclusion would admit a wrong model | Retain |
| §2.4 zero scalar/ideal | δ=0 or B=0 | Left product ideal 0, right inverse different nonzero | Nonzero and perfection reject both | Retain |
| §2.4 type iff, both directions | δ=i/2, −i/2; Φ={id}, empty, all | Positive-imaginary sets {id},{conj}; empty/all differ on one embedding | Type is not arbitrary auxiliary data | Retain |
| §2.4 rescaling | B↦2B, δ=i/2↦i/8 | (i/8)·2·2=i/2; imaginary signs unchanged | Required scalar division preserves perfection | Retain |
| §2.4 CM-type quantification | q=5 | Two conjugate pairs give 2²=4 types; empty choice has 0 representatives per pair | Exactly-one predicate is nonvacuous | Retain |
| §2.4 ideal-product headline | Initial classes 1,d=l/bar l; twists x,x⁻¹ | x·d x⁻¹=d; equal twists give dx² | Correct source product form | Retain |
| §2.4 product versus ratio | Abstract class x of order 3, L=O | x·x⁻¹=1; x/(x⁻¹)=x²≠1 | Tests repaired product statement | Retain |
| §2.4 scalar equality in Lean | L=O, B₁=B₂=O in a principal instance | B₁B₂=O=(1)O; a=1≠0 | Equality modulo principal ideals represented correctly | Retain |
| §3.1 CM Bott degree | k=1,2 | β exponents 1,3; degrees 2,6 | β^k would give wrong degree 4 at k=2 | Retain |
| §3.1 isometry invariance | L,b and multiplication by norm-one i | Form unchanged since i bar i=1; class difference 0 | Correct quotient by isometry | Retain |
| §3.1 Betti API | Unit ideal | Reduced ideal value 0; Betti image 0 | Can coexist with nonzero Hodge image | Retain |
| §3.1 Hodge API | q=5, Φ={1,2},{4,2}, k=1 | Sums 3 and 6≡1 | Depends on type, not just ideal | R03 coordinate adapter |
| §3.1 same-type difference | Classes z₁,z₂ of type Φ | Hodge difference S_Φ−S_Φ=0; Betti difference tr β^odd([L₁]−[L₂]) | Distinct Betti classes allowed | Retain |
| §3.1 coefficient naturality | 25→5, character 2 | Scalar 2 mod25 reduces to 2 mod5; powers 8→3 at exponent 3 | Correct after compatible Bott maps | Retain contract |
| §3.2 type formula | q=5,i=1, Φ={1,2} | Sum 3; class is 3bott=2β_supplier | Formula correct in positive coordinate only | R03 |
| §3.2 odd surjectivity | Switch 1 to −1, q=5 | 3→1, difference −2=3, a unit; inverse of 2 is 3 | Spans Λ without splitting theorem | Retain |
| §3.2 even negative control | q=5,i=2, same switch | 1+4=0; 16+4=0; difference 0 | Odd hypothesis essential for switch argument | Retain |
| §3.3 reduced transfer | L=O_q | [O]−1=0, tr=0 | Hodge class need not vanish | Retain |
| §3.3 vanishing unit term | q=5, odd exponents 1,3 | Σa=10=0; Σa³=100=0 modulo5 | Pair a,−a cancels | Retain |
| §3.3 wrong parity | q=5, exponent 4 | Σa⁴=4 modulo5≠0 | Odd-power qualification matters | Retain |
| §3.4 finite splitting at degree 0 | q=5, symplectic-plane generator | Betti 2, Hodge-negative rank 0; multiplication2 invertible | Degree-zero isomorphism correctly unscaled | Retain |
| §3.4 p-adic splitting | p=3, i=1,2,3,4 | Groups 0,ℤ₃,ℤ/3,0 respectively; Hodge factors 0,ℤ₃,0,0 | Residue classes and rank agree | Retain |
| §3.4 not arithmetic equivariant | Irregular p=691,k=6 | Arithmetic kernel nonzero, quotient ℤ₆₉₁(11); universal unsectioned object cannot split | Abelian direct sum does not imply Galois direct sum | Retain |
| §3.5 four-class Hodge cancellation | Two pairs, all same type Φ | S+S−S−S=0 | Hodge cancellation correct | Retain |
| §3.5 four-class Betti coefficient | Transfer class x | x−bar x=2x in the selected minus input; half of 2x=x | Nonzero coefficient needs actual arithmetic x | Retain theorem |
| §3.5 advertised q=5 Check | q=5, all ideal classes | Pic(O₅)=0; 2·tr=0, not a witnessed 2∈𝔽₅ | Conditional value 1 is unrealizable | R05 |
| §3.5 replacement irregular Check | p=691,k=6, order-691 x | 2x≠0; 346·2x=692x=x | Discriminates zero versus doubled map | R05 |
| §3.5 generation route | q=5,k=1 | Arithmetic summand 0, Hodge summand 𝔽₅; type sums 3,1 span 𝔽₅ | Small actual case is onto | Retain |
| §3.6 periodic splitting | i=−2,−4 | KU involution signs −1,+1; negative factors ℤ/q,0 | Negative degrees use correct parity | Retain |
| §3.6 ordinary degree-one exception | Algebraic K₁(ℤ) versus periodic valuation term | K₁(ℤ) has only ±1; inverting p adds a valuation ℤ term | KSp comparison does not imply false algebraic-K₁ comparison | Retain |
| §3.6 height-one comparison | q=3 versus q=25 | Compatible telescope periods 4 and 40, not a common inverse-limit period | Uses declared map/telescope theorem | Retain contract |
| §4.1 selected-factor object | T={*,a,b}, grades 1,2 | e selects dimension3; discarded basepoint dimension contributes0 | Ambient and selected objects distinct | Retain |
| §4.1 pointed-map law | Fold a,b; then fold with grade3 | (1+2)+3=1+(2+3)=6 | Composition matches fiber sums | R04 locator only |
| §4.1 Segal comparison | T with two non-basepoints | Selected pair has grades (1,2); product A(S⁰)² has same pair | Equivalence preserves objects and arrows | Retain |
| §4.1 discard map | b↦*, a↦a | Grade (1,2) maps to1, not3 | Basepoint convention matters | Retain |
| §4.1 one-point object | T={*}, ambient genus0 and1 | Selected groups both0; one selected-factor isomorphism between any pair | Nerve contractible, not literally one object | Retain |
| §4.1 integral homology API | Genus1 and2 factors | Lattice ranks2,4; fold gives rank6=2(1+2) | Polarized homology respects Γ sums | Retain |
| §4.2 ambient rigidification | T={*}, A_* genus1 | Selected dimension0; ambient dimension1 | Embedding only eA omits genuine data | Retain repair |
| §4.2 nerve degree | r=0,1,2 | Embeddings1,2,3; adjacent isomorphisms0,1,2 | Correct Čech indexing | Retain |
| §4.2 faces and degeneracies | r=2, compose f and g | Remove middle embedding: 3→2 and arrows f,g→gf; degeneracy repeats1→2 | Standard simplicial law on actual data | Retain |
| §4.2 grading | Two embeddings of same genus2 object | Both grades2; every face grade2 | Faces preserve grade | Retain |
| §4.2 refinement independence | Embeddings e₁,e₂ | Common fiber/refinement has pair(e₁,e₂); both projections recover genus g | Different embeddings represent same selected groupoid object | Retain contract |
| §4.2 smooth realization | Genus0 piece | Object is point, automorphism group1; realization point | Unit retained | Retain |
| §4.2 unbounded atlas | Genera0,1,2,… | Dimension indices unbounded; no largest grade | Coproduct, not a single bounded finite-type parameter space | Retain |
| §4.3 analytic model | g=0,1 | H₀-space point; H₁(SL₂ℤ;ℤ)=ℤ/12 at g=1 | Isotropy must survive quotient | Retain |
| §4.3 level cover | Level N=4 versus N=1 | −I≢I mod4; −I≡I mod1 | Torsion-free level and stack quotient not interchangeable | Retain |
| §4.3 group completion | Genus monoid | ℕ→ℤ sends0→0,1→1; −1 absent before completion | Zeroth map is not an equivalence | R02 supplier |
| §4.3 tangent pairing | Degree-two normalized generator | ch₁(Lie)=+1; ch₁(Lie∨)=−1 | Correct after Bott adapter | R03 |
| §4.4 left action convention | σ,τ, identity | Spec(σ⁻¹)∘Spec(τ⁻¹)=Spec((στ)⁻¹); identity map unchanged | Left action order correct | Retain |
| §4.4 discrete versus analytic model | Genus1 | Discrete points have many isomorphism components; H₁-space analytic stack is connected | No false identification of π₀ | Retain |
| §4.4 reduction/limit API | q=25→5 | χ=2 gives2→2; χ³ gives8→3 | Reduction commutes with scalar action | Retain contract |
| §4.4 complex-conjugation Betti API | c on odd quotient and trivial kernel | c quotient −1, kernel+1; c_Bc=c_B on kernel | Does not assert arbitrary-σ Betti equivariance | Retain |
| §4.4 p=3 exception | g=1, p=3 and5 | ℤ/12⊗𝔽₃=𝔽₃; ℤ/12⊗𝔽₅=0 | H¹ vanishing fails at3 | Retain Moore route |
| §4.4 Moore connectivity | Connected component smashed with M(ℤ/3,2) | Moore cells in degrees2,3; resulting low π₁=0 | Simple-connectivity restored before comparison | Retain contract |
| §4.4 grading and choices | Coproduct of points indexed by ℕ | H₀ is direct sum of one 𝔽_p per grade; π₀ remains ℕ | No ungraded component completion | Retain |
| §4.5 finite genus | q=5 | CM genus φ(5)/2=2; add rational genus2 to reach4=φ(5) | Source's missing stabilization supplied | Retain |
| §4.5 uniqueness by surjectivity | q=5,k=1 Hodge generator1 | Two equivariant maps agree on preimage of1, hence on all a·1 | Surjective detection determines action | Retain |
| §5.1 reciprocity identity | σ=1, identical lifts | Every w_τ⁻¹w_τ=1; product1 | Identity transport fixed | Retain |
| §5.1 conjugation transport | σ=c, Gaussian line | Translating form −1 sends δ=i/2 to−i/2; type reverses | Positive-only translating line would be false | Retain |
| §5.1 conjugation-paired lifts | C₃⋊C₂, a³=c²=1, cac=a⁻¹ | aca⁻¹=a²c≠c | Pairing lifts does not impose central conjugation | Retain |
| §5.1 cyclotomic type action | q=5, χ=2, Φ={1,2} | 2Φ={2,4}; type sum3 becomes6=1 | Character scaling correct | Retain |
| §5.1 stable Bott-linearity | k=2, χ=2 mod5 | Exponent3 gives scalar8=3, not exponent2 scalar4 | Correct exponent in Galois calculation | Retain |
| §5.2 extension/section definition | G=H=1,M=T=Λ | πs(m)=m; sπ(m,t)=(m,0)≠(m,t) for t≠0 | Correct composition order | Retain |
| §5.2 kernel triviality law | C₂ sign quotient, trivial T=𝔽₅ | c(0,t)=(0,t); quotient c(m)=−m | Action condition applies to kernel only | Retain |
| §5.2 cocycle law | C₂, α(c,m)=m | α(c²,m)=0=α(c,−m)+α(c,m)=−m+m | Associativity witnessed | Retain |
| §5.2 kernel maps | Projection M⊕T→M | Kernel map T→0 is zero, not identity | Valid terminal morphism retained | Retain |
| §5.2 coordinate action | c(m,t)=(−m,t+m) | c²(m,t)=(m,t+m−m)=(m,t) | Formula gives representation | Retain |
| §5.2 H=G case | M sign, arbitrary T | Chosen G-section gives M⊕T; initial and terminal object has T=0 | Both universal arrows unique | Retain |
| §5.3 relative quotient/H₀ | H=G and H=1 | C₀=M/M=0 in both; H=G gives every C_n=0 | Correct pair, not absolute homology | Retain |
| §5.3 linear cocycle presentation | G=ℤ,H=1,M=ℤ trivial | [r]⊗m↦rm; (r+s)m=rm+sm | Universal kernel ℤ | Retain |
| §5.3 coefficient action | C₂ sign, M=𝔽₅,H=1 | [c²]m=[c](−m)+[c]m=0; relative H₁=𝔽₅ | Omitting action would impose2[c]m=0 and kill it | Retain |
| §5.3 degree-one inverse convention | C₃ acts on 𝔽₇ by2 | d_FGV[g]=2−1=1; d_native[g]=4−1=3; d_native[g⁻¹]=1 | T₁ inversion essential | Retain repair |
| §5.3 all-degree differential | S₃ permutation representation on 𝔽₅³, all basis tuples, n=1,2,3,4 | 18,108,648,3888 inputs; d_native T−T d_FGV=0 and d²=0 on every input | Nonabelian multiplication and non-scalar action tested | Retain repair |
| §5.3 T_n involution/pair descent | Tuple (s,r), s²=r³=1, H≤G | T₂(s,r)=(r⁻¹,s); second T₂=(s,r); H-tuples remain H-tuples | Inverse and quotient descent hold | Retain |
| §5.3 degree-three signs | Noncommuting g,h,k | Four faces have signs +,−,+,−; reversal sends product gh to h⁻¹g⁻¹ | Native adjacent-product order agrees | Retain |
| §5.3 nonabelian cocycle | S₃ sign action, s transposition,r 3-cycle | a(sr,1)=1=1+0; a(s²,1)=0=−1+1 | Product order survives noncommutativity | Retain |
| §5.3 coefficient/pair functoriality | u:M→M, u(m)=2m | [g]⊗u(m)=2([g]⊗m); α relations scale by2 on both sides | Natural generator map correct | Retain |
| §5.4 undercategory equivalence | C₂ sign,H=1,M=𝔽₅ | Kernel generator t=[c]1; α(c,m)=mt; universal endomorphism preserving section fixes t | Initial object has actual nonzero kernel | Retain |
| §5.4 pushout property | Kernel map t↦a t in 𝔽₅ | New action c(m,u)=(−m,u+a m) | Arbitrary a, including0, realized by pushout | Retain |
| §5.4 section-forgetting hypothesis | G=H=C₂, M=ℤ/3 over ℤ/9 | c−1=−2 invertible; H₀=H₁=0; M not Λ-projective | Original generality restored | Retain repair |
| §5.4 distinction from unsectioned initiality | C₂ sign over𝔽₅,H=1 | Equivariant section (m,2m); c sends it to(−m,3m)=s(−m); chosen section(m,0) differs | Split object can be initial with different chosen section | Retain |
| §5.4 unsectioned nonsplitting | Nonzero kernel T, hypothetical G-section | Identity on T gives t↦t; section∘projection gives t↦0 | Two endomorphisms contradict initiality | Retain |
| §6.1 finite arithmetic exactness | q=3,k=1 | Kernel K₂ mod3=0; KSp₂ mod3=𝔽₃(1); quotient map identity | Nontrivial twist with zero kernel | Retain |
| §6.1 conjugation section | q=5, kernel+1/quotient−1 | (1−c)/2 is0 on kernel,1 on quotient | Section uniquely selected | Retain |
| §6.1 arithmetic kernel action | Any c, kernel vector x | cx=x; quotient m maps−m | Not all of the middle module is trivial | Retain |
| §6.2 cocycle identification | σ=c in relative pair | [c]m=0; arithmetic α(c,m)=0 | Chosen section agrees | Retain |
| §6.2 type-sum cancellation | q=5,k=2, χ=2 | Type coefficient χ³=3, not4; paired lift terms cancel pairwise | Correct exponent/paired-lift rule | Retain |
| §6.3 normalized kernel inclusion | q=5,x in arithmetic kernel | c_B(3H(x))=6x=x | Inclusion has Betti coordinate identity | Retain |
| §6.3 finite initiality | Zero kernel at q=3,k=1 | Initial object M→M, H₁(G_q,⟨c⟩;M)=0 | Classification and arithmetic extension agree | Retain |
| §7.1 compact category | Γ=H=1,M=ℤ_p | Relative H₁=0; initial middle module ℤ_p | No extra free kernel | Retain |
| §7.1 continuous universal cocycle | Γ=C₂,H=1,M=ℤ_p sign | Relative H₁=ℤ_p; c(m,t)=(−m,t+m) and c²=id | Nonzero relative kernel retained in compact setting | Retain |
| §7.1 completed coefficient coinvariants | Γ=ℤ_p,H=1,M=ℤ_p trivial | Continuous abelianization/H₁=ℤ_p; finite levels ℤ/p^n | Completion has correct inverse system | Retain contract |
| §7.1 exact reductions | Finite-free quotient M; torsion negative control | Tor₁(M,ℤ/p^n)=0; reduction of ℤ_p --p→ℤ_p→𝔽_p makes first map0 | Freeness prevents failed injection | Retain |
| §7.1 inverse limit | ℤ/p^(n+1)→ℤ/p^n | Surjective transition; lim=ℤ_p, lim¹=0 | Exact compact limit under stated hypotheses | Retain |
| §7.1 continuous c-section | p=3, sign quotient | 1/2 is a3-adic unit; (1−c)/2 polynomial in continuous action | Section continuous and unique | Retain |
| §7.2 compact arithmetic extension | p=3,k=1 | K₂(ℤ;ℤ₃)=0; middle=ℤ₃(1) | Regular case matches finite tower | Retain |
| §7.2 irregular kernel | p=691,k=6 | B₁₂ numerator−691; kernel nonzero, quotient twist11 | All odd primes included, not a regular-prime shortcut | Retain contract |
| §7.2 group versus local group | Γ=Gal(H∞/ℚ), G=Gal(ℚ(p)/ℚ) | G maps onto Γ; representation inflated with same kernel and quotient | Groups not silently identified | Retain |
| §7.3 decomposition quotient | q=3 | H₃=K₃; D₃=C₂; class kernel0 | D_q is not the p-class subgroup | Retain |
| §7.3 pair comparison | q=3,M=𝔽₃(sign) | H₁(C₂,C₂;M)=0=H₁(C₂,⟨c⟩;M) | Direction through inverse of inclusion correct | Retain |
| §7.3 fixed prime existence | Odd torsor C₃ under c(x)=−x | Exactly one fixed point0; total cardinality3 | Fixed compatible primes can be chosen without a unique total prime | Retain |
| §7.3 local-section uniqueness | D contains c with χ(c)=−1 | Hom_D(M,T) satisfies f(m)=f(−m), hence2f(m)=0 and f=0 | Odd p makes unique section | Retain |
| §7.4 local universality | p=3,k=1 | Extension is ℤ₃(1)→ℤ₃(1), local section id | Local kernel0 case correct | Retain |
| §7.4 locally split versus globally split | p=691,k=6 | Local section exists; nonzero global universal kernel forbids global section | Distinction essential | Retain |
| §7.4 lisse sheaf realization | Trivial finite kernel and twist1 | Constant kernel monodromy1; quotient monodromyχ; restriction retains these values | Uses exact integral representation/sheaf gap | Retain contract |
| §7.5 all integer twists | q=5,k=0 and2 | Twists−1≡3 mod4; degrees−2 and6 differ8 | Finite transport matches character and degree | Retain |
| §7.5 wrong KU-only period | q=5, degree shift2 | Twist changes by1; χ=2 changes scalar by2≠1 | Ordinary KU period alone insufficient | Retain |
| §7.5 inverse-limit restriction | q=5,25 | Compatible periods8,40; 8 not divisible by40 | No asserted fixed ℤ_p period | Retain |
| §7.6 restriction/reduction | p=3,k=1,ℓ=2 | ℤ₃/(2²−1)=ℤ/3 on both sides; exponent1 would give0 | Actual map and twist checked | Retain repair |
| §7.6 zero primary group | p=5,k=1,ℓ=2 | 2²−1=3 a5-adic unit; both groups0 | Zero case included | Retain |
| §7.6 auxiliary-prime hypothesis | p=3,k=1,ℓ=19 | 19²−1=360, v₃=2; localℤ/9 versus globalℤ/3 | Nongenerator negative control rejects overclaim | Retain |
| §7.6 symplectic sphere unit | p=3,k=1 | Betti composite×2 onℤ/3; inverse×2 since4=1 | Unit is onto and nonzero | Retain contract |
| §7.6 trivial action | p=3 and5, k=1 | Groupsℤ/3 and0; rational source has action1 in both | Triviality includes nonzero and zero cases | Retain |
| §7.7 Vandiver iff | Minus, plus and zero C₃ torsors | Fixed-point counts1,3,1; total counts3,3,1 | Both directions distinguish plus vanishing from full vanishing | Retain |
| §8.1 indecomposable definition | Point | Positive idealI=0; Q=0, including degree0 | No spurious unit | Retain |
| §8.1 denominator product law | X=S¹×S¹ | H₁=ℤ_p²; degree2 generator x·y belongsI² and maps0 | Positive-degree product killed | Retain |
| §8.1 Bockstein term | RP∞,p=2 | OrdinaryI²=0; Q survives in degrees1,3,7, but not5,9 | Extra denominator is discriminating | Retain |
| §8.1 functoriality | Constant map and identity on S¹ | Q₁ maps0 andid onℤ_p | Correct positive-degree quotient maps | Retain |
| §8.1 primitive pairing | Primitive degree2 class on a mixed product | Δx=x⊗1+1⊗x; evaluation on positive-degree y⊗z is0+0=0 | Products killed | Retain |
| §8.1 Bockstein compatibility | Integral lift of primitive class | Evaluation on β_r(yz) is0 because lift has zero coefficient boundary | Requires declared natural Bockstein lift | Retain contract |
| §8.1 Hurewicz composite | Fundamental loop of S¹ | π₁=ℤ maps1→1 inH₁ and Q₁ | Nonzero map, not a free placeholder | Retain |
| §8.2 product isomorphism | S¹×S¹ | Q₁(X)⊕Q₁(Y)=ℤ_p²=Q₁(product); degree2 both0 | Product theorem passes free test | Retain |
| §8.2 mixed Tor | K(ℤ/p,1)² | Tor₁(ℤ/p,ℤ/p)=ℤ/p in degree3; β₁(xy) maps0 inQ | Enlarged denominator necessary | Retain |
| §8.3 Hurewicz, free factor | p=3,E=ΣHℤ | π₁⊗ℤ₃=ℤ₃=Q₁(S¹), generator1→1 | Safe-range theorem passes | Retain |
| §8.3 Hurewicz, cyclic factor | p=3,E=ΣH(ℤ/3) | π₁=ℤ/3=Q₁; π₃=0=Q₃ since2 is invertible in the Bockstein product | Free and torsion cases distinguished | Retain |
| §8.3 range negative control | Same E,p=3, degree5 | π₅(E)=0; first extra indecomposable in degree5 isℤ/3 | Cannot assert all degrees | Retain |
| §8.3 finite-type negative control | E=ΣHℤ₃ discrete | π₁=ℤ₃ not finitely generated overℤ; H₁=ℤ₃⊗ℤℤ₃ | Explicitly outside theorem | Retain |
| §8.3 Postnikov endpoint | p=3 | Safe upper bound2p−3=3; omitted endpoint4; P¹ links delooped degrees2 and6 | No endpoint splitting imported | Retain gap; R04 locator |
| §8.4 integral stability range | i=0,2 | g>5 andg>9 give minimum6 and10; H₀ map1→1 | Conservative strict inequality consistent | Charney uncertified |
| §8.4 arithmetic finite-type route | Finite quotient C₂ with trivialℤ | H₀=ℤ; odd positive homologyℤ/2; even positive0 | Finite-generation argument keeps finite torsion | Retain for stable homology |
| §8.4 KSp finite generation | ε=−1,O=ℤ,n≥1 | Skew b(x,x)=−b(x,x) gives2b(x,x)=0, hence0; classical groups coincide | Base supplier theorem already covers target | R01 |
| §8.4 equivariant Hurewicz | p=3,m=1 | Degree2≤3; KSp₂⊗ℤ₃=ℤ₃, Hodge coordinate1 | Safe application; plus supplier missing | R02 |
| §8.4 odd inequality | p=5,m=3 andp=3,m=1 | 6≤2p−4=6; 2≤2p−4=2 | Every positive odd m<p fits | Retain repair |
| §8.4 even negative control | p=5,m=4 | 2m=8>2p−3=7 | Old erroneous Check excluded | Retain repair |
| §8.4 Hodge pairing parity | m=1 andm=2 | Normalized/raw pairings+1/−1 in odd case; negative ku factor0 and pairings0 in even case | Correct after supplier Bott conversion | R03 |
| §8.4 degree-zero exclusion | i=0 | Stable H₀=ℤ butQ₀=0 | Hurewicz theorem correctly starts at1 | Retain |
| §8.5 polynomial generators | Degrees2,4,6 | Bases{x₂},{x₂²},{x₂³,x₆}; dimensions1,1,2 | Degrees4k−2, not all even primitive degrees | Retain |
| §8.5 cohomological weights | χ=2 overℚ₅ | Eigenvalues1/2,1/4; degree6 both1/8 | Inverse character and additive product weights | Retain |
| §8.5 sign-independent generation | x₂↦−x₂ | Square unchanged; span of degree2 unchanged; degree6 basis signs invertible | Raw/normalized generators same polynomial algebra | Retain |
| §8.6 characteristic divisibility | One-part11,p=691 | B₁₂=−691/2730; 22≤2p−4=1378; conclusion s∈691ℤ_(691) | Irregular application in safe range | Retain contract |
| §8.6 factorial boundary | n=p=3 | ch₃(L)=c₁³/6; v₃(6)=1 | n<p essential for integral cap route | Retain |
| §8.6 empty partition | d=0 | Empty product integral1; no Bernoulli factor, antecedentfalse | Does not imply p divides1 | Retain |
| §8.6 cap twist | d=n₁+…+n_r, cap all except n_i | d−Σ_(j≠i)n_j=n_i; resulting homology degree2n_i | Domain and Tate twist match quotient | Retain |
| §8.6 normalization in contradiction | Raw odd Hodge unit value u | Tangent value−u; u unit iff−u unit | Sign does not affect splitting contradiction | Retain with R03 |
| §8.6 nonsplitting contradiction | Nonzero universal kernelT, hypothetical global section | id_T versus0 yield two endomorphisms | Initiality rules out the unit splitting | Retain |

## Not verifiable

- `charney1987`, Corollary 4.5: settled as uncertified/paywalled in the manifest. Its exact original wording was not read, and no new source request was made. FGV's two quoted ranges differ at the endpoint; the README uses their common conservative strict range. The supporting stability theorem is therefore locator-supported, not independently certified from Charney's text.
- Published-versus-author-copy numbering of FGV was not collated. All FGV locators and source issues here refer to the explicitly cited 64-page author copy; the published article is identified only as the same work. The Borel text was readable.

## Source issues

- **Misprint** in FGV at Definition 2.6, p. 10, FGV line 446: the source says fractional-ideal arrows use units of the coefficient ring; it should be nonzero fraction-field scalars carrying one ideal to the other; affects nothing.
- **Misprint** in FGV at the proof of Corollary 2.12, p. 14, FGV line 629: the source says multiplying a twist-one H² class by the (2k−1)st Bott power lands in twist 2k−1; it should be twist 2k; affects the proof.
- **Misprint** in FGV at Remark 2.13, p. 15, FGV line 645: the source says finite-coefficient K₀ splits into an integral rank summand and the unreduced Picard group; it should be ℤ/q plus Pic/q; affects nothing.
- **Misprint** in FGV at §3.4, pp. 20–21, FGV line 909 and FGV line 932: the source says the unscaled hyperbolic inclusion is retracted by the forgetful projection on the positive factor; it should be retracted by half the forgetful projection, since their composite is multiplication by two; affects the proof.
- **Error** in FGV at §5.1.2, p. 30, FGV line 1353, and Theorem 6.6(ii), p. 36: the source says the full norm-one automorphism group of an odd cyclotomic coefficient line is μ_q; it should be μ_(2q), containing the specified μ_q subgroup; affects nothing.
- **Misprint** in FGV at Definition 7.3, p. 37, FGV line 1699: the source says the section followed in the wrong compositional order by projection is the identity of M; it should be π∘s=id_M; affects nothing.
- **Misprint** in FGV at Remark 7.9, p. 44, FGV line 2036: the source says Vandiver is equivalent to the entire prime set being a singleton; it should be the conjugation-fixed prime set being a singleton; affects nothing.
- **Misprint** in FGV at §7.7, footnote 13, p. 47, FGV line 2193: the source says the twist-2k coefficient action has exponent 2k−1; it should be exponent 2k, giving ℤ/3 rather than zero at p=3,k=1; affects nothing.
- **Misprint** in FGV at §7.7, p. 47, FGV line 2171: the source says Theorem 3.3 supplies injectivity of the Betti map; it should be Theorem 3.5; affects nothing.
- **Misprint** in FGV at §7.3, p. 41, FGV line 1903: the source says the ideal-line class in the cocycle calculation carries Bott exponent k−1; it should be exponent 2k−1, as in its adjacent diagram; affects nothing.
- **Misprint** in FGV at §6.3 and Theorem 6.6, pp. 35–36: the source says the lift differences land in Gal(H/K) abelianized; it should be Gal(H/E), where E is the named CM field and this group is already abelian; affects nothing.
- **Gap** in FGV at the proof of Proposition 6.1, p. 34, FGV line 1536: the source says the CM construction directly supplies the genus-φ(q) source; it should be stabilized from genus φ(q)/2 by a rational ppav of the complementary genus; affects the proof.
- **Misprint** in FGV at Appendix A.4, p. 59: the source says the endomorphism action defines the Rosati involution; it should be the polarization defining that involution; affects nothing.
- **Misprint** in FGV at Appendix A.4, p. 60, FGV line 2773: the source says the unrestricted embedding parameter space is quasi-projective; it should be a disjoint union of quasi-projective pieces indexed by genus and embedding data; affects nothing.
- **Gap** in FGV at Theorem 8.1 and its proof, p. 48, FGV line 2217: the source says p≥max n_j suffices for integral Chern-character factors; it should be p>max n_j for that argument, since n_j=p makes n_j! divisible by p; affects a stated result.
- **Misprint** in FGV at §8.1, p. 49, FGV line 2278: the source says the indecomposable object is the decomposable subgroup I²+Σβ_r(I_r²); it should be the quotient I/(I²+Σβ_r(I_r²)); affects nothing.
- **Error** in FGV at §8.1 and Theorem 8.4, pp. 49–50, FGV line 2274: the source says ordinary ℤ_p-homology gives the assertion for every positive p-complete spectrum; it should be restricted to finite-type integral input or an explicitly completed homology theory; affects a stated result.
- **Misprint** in FGV at the proof of Theorem 8.4, p. 50, FGV line 2304: the source says the cyclic model has differential ∂y=x and fundamental homology ℤ/p^k; it should be ∂y=p^k x, since the printed differential gives fundamental homology zero; affects the proof.
- **Gap** in FGV at the proof of Theorem 8.4, p. 50, FGV line 2312: the source says the truncation through degree 2p−2 splits as an H-space by the stated delooping argument; it should be restricted through 2p−3 unless the first P¹ extension is separately controlled; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "885daec9b58d0d65c3b0d10cdf20dbae1e97992f", "job": "REV-PKG-ArithmeticKTheoryPartII~2", "model": "gpt-6-astra", "worker": "chris-7"} -->
