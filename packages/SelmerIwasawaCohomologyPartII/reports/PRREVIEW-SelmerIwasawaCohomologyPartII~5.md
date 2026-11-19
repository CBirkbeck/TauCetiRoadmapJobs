# Review of SelmerIwasawaCohomologyPartII (pull request #1403 at 365ec42)

**Verdict:** needs changes

**Summary.** The mathematics that was checked is sound: the fifteen sampled targets agree with their sources at the locators given, the blowup and Chern-class computations of §2.6 and every numerical Check that was recomputed come out as stated, and the new opening overview states the layers' theorems correctly. Changes are needed for two ownership conflicts with open roadmaps that precede this one in the merge order: three declared gaps ask ShimuraVarieties and GlobalGaloisDeformations for objects that PELModuliPartII and PotentialAutomorphyInfrastructurePartII plan and claim as their own, and the two components of the semistable model are handed back and forth with no owner. There are four small corrections and two format notes, none blocking, and two facts are left for the human reviewers.

## R01 (P2) — The semistable and smooth unitary models are asked of ShimuraVarieties, while PELModuliPartII plans them and says they are not ShimuraVarieties'; the components M°, M• are owned by neither

An implementer of §2.3 cannot tell where the model comes from, and the gap as declared would have ShimuraVarieties build a second copy of an object an earlier roadmap already plans. Scope and ownership (line 794) says "ShimuraVarieties owns construction and strict semistability of the native special-level model, its link charts and generic-fibre/specialization comparison through gap native-shimura", and the contract (lines 904–906) asks ShimuraVarieties for "the native strictly semistable models of ltxzz §5.2 with link charts" and "the smooth hyperspecial models". PELModuliPartII, open as pull request #2453 and earlier than this roadmap in the merge order, states those models: its §§8.1–8.4 and 8.7 give the smooth model of ltxzz §4.2, the almost self-dual model, its generic fibre `Sh(V′, jK^pK′_p) × (T_p)_η` and the completed local ring `W(k)[[x₁,…,x_N]]/(x₁x_N − p)` (`TauCetiRoadmap/PELModuliPartII/README.md`, lines 1426–1508 at its head), and its Downstream consumers (lines 1780–1784) says they "are owned here and are not part of the canonical models of ShimuraVarieties §6.7".

The two texts also hand one object to each other. PELModuliPartII §8.4 (line 1495) leaves "the balloon, ground and link geometry … of Theorem 5.2.5(2)–(5)" to §2.3 of this roadmap; §2.3 here (line 167) takes "its reduced smooth components M°, M• and link M†=M°∩M• from gap native-shimura" and adds (line 175) that no construction of M is part of the target. So the decomposition of the special fibre into M° and M• is stated by nobody.

The smallest repair: in the *Needs:* lines of §§2.1–2.3, 2.6, 4.1, 5.1 and 7.3 and in the supplier contracts, cite PELModuliPartII §§8.1–8.4 and 8.7 for the models, their strict semistability, link charts and generic-fibre comparison; state the two components and the link (ltxzz Theorem 5.2.5(2)–(5), line 2653) as conclusions of §2.3; rewrite the Scope sentence accordingly; and keep in gap native-shimura only what PELModuliPartII does not state, namely the 𝔗-equivariant ordinary/compact specialization isomorphisms of ltxzz Lemmas 4.2.4 and 5.2.7 on the nonproper domain, their compatibility with the Hecke quotient and the extending graph cycle, and the proper smooth models of Remark 5.2.8.

## R02 (P2) — Gaps rigid-r-equals-t and eventual-rigidity ask GlobalGaloisDeformations for theorems that PotentialAutomorphyInfrastructurePartII proves

These two contracts would be announced on GlobalGaloisDeformations as new obligations although an open roadmap earlier in the merge order (pull request #2135) owns the same theorems, so the same result would have two owners. The contract at lines 940–942 requires "d0–D4 of ltxzz-deformation Theorem 3.6.3 … Runiv≃T_m, finite free middle cohomology"; PotentialAutomorphyInfrastructurePartII §10.2 states exactly that theorem with hypotheses (D0)–(D4) and conclusions `R^univ_𝒮 ≅ T_𝔪` and freeness, and says "This is LTXZZ, Theorem 3.6.3, p. 30" (`TauCetiRoadmap/PotentialAutomorphyInfrastructurePartII/README.md`, lines 1824–1840 at its head). The contract at lines 944–946 requires eventual rigidity and cyclotomic residual irreducibility "as used in ltxzz Lemmas 8.1.3–8.1.4"; §10.3 there (lines 1853–1859) proves Corollary 4.1.2, Proposition 4.2.3 and Theorem 4.2.6 of the same paper: rigidity for `(Σ⁺, ∅)` of the symmetric-power family, and residual absolute irreducibility over `F(ζ_ℓ)` and rigidity for almost all λ when Π has a supercuspidal component. Its Scope lists "rigid `R = T`" as owned (line 1959).

The smallest repair: in §§3.3, 3.6 and 7.4 and in the contract section cite PotentialAutomorphyInfrastructurePartII §10.2 for the rigid R=T and freeness theorem and §10.3 for eventual rigidity, drop gap eventual-rigidity, and reduce gap rigid-r-equals-t to what §10.2 does not state: the maps between the unramified, mixed and ramified deformation rings and the congruence quotient `R^unr ⊗_{R^mix} R^ram` used in the proof of ltxzz Theorem 6.3.5 (ltxzz line 5658–5668).

## C01 — "IgusaVarietiesAndTorsionConcentration §IG.7.2" names a section label that roadmap does not have

The section is "7.2 Cohomologically generic Hecke homomorphisms" at that roadmap's open head (pull request #1090), with no `IG.` prefix, and IgusaVarietiesAndTorsionConcentrationPartII §11.9 cites it as "§7.2". A reader searching for IG.7.2 finds nothing. Write §7.2 at lines 101, 118, 270, 342, 716, 724, 890 and 894. The content cited (the predicate, stability under enlarging the exceptional set, invariance under coefficient-field extension) is there as described.

## C02 — The overview's rank-one sentence carries no hypotheses

In the third paragraph of the Summary the rank-zero statement begins "assume all three hypotheses", but the next statement reads "If, at suitable levels, its Abel–Jacobi class AJλ(Δ) is nonzero, then dim H¹_f(F, Vλ) = 1" with nothing attached. §8.2 assumes admissible λ, H(n), H(n+1) and the rank-two span condition. Adding "under the same three hypotheses" makes the sentence the one §8.2 proves.

## C03 — PeriodsAndSpecialValues is described as a consumer, but at its open head it cites nothing from this roadmap

The Summary says "PeriodsAndSpecialValues uses the reciprocity laws and the rank theorems", and Downstream consumers (line 786) says it "consumes §§1.6, 4.1–4.6, 5.5–6.4 and 8.1–8.4"; the pull request's description repeats it. At the head of pull request #1496 its Rankin–Selberg sections PS.6.6–PS.6.7 list as needs SelmerIwasawaCohomology L2 and L4, AutomorphicLFunctionsAndLocalFactors AL.3 and AutomorphicGaloisRepresentationsPartII AG2.5–AG2.6, and PS.6.7 says of the level-raising constructions that they "are not inputs to the present comparison theorem". It also precedes this roadmap in the merge order. Either say that it states the Beilinson–Bloch–Kato prediction to which §§8.1–8.4 supply conditional witnesses, or drop the section list.

## C04 — The two "baseline" commits in the supplier contracts are not the pins of this head

Lines 804 and 816 give Mathlib `6b7abb3c…` and Tau Ceti `a91d3aaf…` as the baselines for "the exact pinned signatures". The manifest at this head pins Mathlib `1b1ccf4b…` and Tau Ceti `2fd255d9…`. Every declaration named in the two subsections is still present in the file named, so only the two hashes need updating (or removing).

## N01 — "follows Liu–Tian–Xiao–Zhang–Zhu" in the Summary

The layers are not arranged as that article is (see the comparison of contents in the report), so the sentence undersells the roadmap and reads as the claim the project asks roadmaps not to make. "proves the theorems of Liu–Tian–Xiao–Zhang–Zhu" would say what is meant.

## N02 — Layer 1 begins at §1.5 with no word on §§1.1–1.4

The earlier guide said that the coefficient algebra is imported and the layer's own targets are §§1.5–1.6; the new overview keeps only "on an imported coefficient algebra". One clause in the guide to the layers would stop a reader looking for the missing sections.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §2.1 level-raising datum, P1–P6 | ltxzz §6.1, lines 5136–5202 | Σ⁺⊇Σ⁺min∪Σ⁺lr; ℓ∤‖v‖(‖v‖²−1); P4 mod λᵐ even, mod λ odd; P6 even only | agrees | none |
| §2.4 link cohomology, excess | N−2j=2: ⌊N/2⌋−j=1 | count p+1; fibre ℙ⁰; last factor p^(2⌊N/2⌋−2j−1)+1 as Theorem 5.7.8; exceptions N−2, 2N−2 as Lemma 5.6.2 | agrees | none |
| §2.5 odd matrix and ∇₁ | column (p+1,−1,0), row (0,T•°,(p+1)²) | image (p+1,(p+1)²,−T•°); product T•°(p+1)²−(p+1)²T•°=0; p=3: −16 and 4 | agrees | none |
| §2.5 even matrix, singular sequence | N≥4, N=2 | both 3×3 matrices equal Lemma 5.9.3(7); cokernel H²ʳ⁻¹(M•,L(r−1))^F as (6) | agrees | none |
| §2.5 Checks | ℤ₃ with Frobenius 4; 𝔸¹ minus special origin | invariants 0, coinvariants ℤ₃/3; nearby H¹=H¹(𝔾m)=L(−1), generic H¹(𝔸¹)=0 | true | none |
| §2.6 exceptional bundle E=ℙ_lines(L₀⊕L₁) | charts xtv=p, usy=p; n=2, p=3 | η²+(a+b)η+ab=0; [D₀]=η+b; N(E/Q••)=O(−1)⊗(L₀L₁)∨; D₁²=−16; ρ!η²=−(a+b) | agrees; source's "trivial" bundle is wrong | none |
| §2.6 resolved components | centre P°° | strict transform of the centre is the blowup of P°° along itself: empty; closure definition gives Bl_Z(P°°) | README right | none |
| §§3.3–3.6 even theorem | ltxzz Theorem 6.3.5; published 6.3.4(a) | E₂ support {(−1,2r),(0,2r−1),(1,2r−2)}; eigenvalues {pαᵢ^±1}∖{1,p²}; ℓ≥2(N+1) in print | agrees | none |
| §4.2 graph cycle | n=2 | dims 1, 2, 3; codimension 2; class in H⁴ with twist 2, as Construction 4.6.1(3) | agrees | none |
| §4.5 multiplicities, conjugation | Hypothesis 3.2.10, Lemma 2.4.5 | antecedent: ρ irreducible; conclusion ρ^c; H¹_f(R)≃H¹_f(R^c) | agrees | none |
| §5.1 Checks | 𝔽₁₁ q=3; 𝔽₇ cyclic P | P₀′(3)=10, P₀(−1)=9, P₁′(1)=10, P₁(−3)=1; tensor roots {3,5,4,4,3,9}; ⟨(P−2)e₀,f⟩=2, Pᵗf=4f | true | none |
| §5.2 first geometric law | Theorem 5.11.5(1)–(3) | operators T•°, T•, then (I°⊗T°) with factor (p+1)² on inc•• | agrees | none |
| §5.5 first explicit law | p=3 | factor (p+1)φ(I°)φ(T°); one graph point gives 4a₀a₁ | agrees | none |
| §5.6 unit factors | even S(I)=q^(r²)∏(μ+2); odd S(T)=q^(r²+r)∏(μ−2) | I° unit iff P(−1) unit; T° unit iff P′(1) unit; hecke_rank2: 16 and 0; hecke_rank3: 9/2, 105/2 | agrees | none |
| §6.1 Check | 𝔽₁₉, q=3 | derivatives 11, 13; tensor root 3 once, derivative 4; P₀(−1)=0 | true | none |
| §6.2 second geometric law | Theorem 4.6.2 | T⋆·A(loc′[Δ])=A(inc⋆⋆!1) in H^(2r₀)(M_n₀×S_n₁,L(r₀)) | agrees | none |
| §7.1 image lifting | Lemma 2.7.1, F′=F⁺rflx, P=T²−1 | clauses (a)–(e) at level m; kernels free of rank 1 | agrees | none |
| §7.2–7.3 Checks | D=[[π,1],[0,π]] over A₅ | DC=π²I; D(−1,π)=(0,π²), exponent 3; det(e₁,t)=π; exponents 4,3 pair to 2 | true | none |
| §7.3 rigidity Checks | N=2 mod 11; N=4 mod 19 | {3⁻²,1}={5,1}; {3⁻⁴,3⁻²}={4,17} twice, P′(3)=0 | true | none |
| §7.4 L7 route (changed text) | Corollary D.1.4, both versions | F⁺≠ℚ; infinitely many split w decomposed generic; then Proposition D.1.3 | agrees with §11.9(2) of the supplier | none |
| §8.1 rank zero | Theorem 8.2.2, Lemma 8.2.1 | published hypotheses: admissible, H(n), H(n+1), witness; README adds transferable level and span premise | README weaker, by the supplier's correction | none |
| §8.2 rank one | Theorem 8.3.2 | transferable even level at Σ⁺min, (8.10); dim=1 | agrees, plus span premise | C02 |
| §8.4 rank (2,3) | n=2, F⁺=ℚ | N∈{2,3}≤3: Proposition 3.2.11 applies; L1: ℓ>8; tensor rank 6, twist 2, weight −1 | agrees | none |
| §8.5 Hilbert precursor | liu-tian Assumption 4.1, Definition 4.5, Theorem 4.7 | ℓ≥g+2; ℓ∤∏(p^(2gi)−1); T_p²≡(p^g+1)², S_p≡1; target H¹(𝔽_p^2g, H^g(…((g+1)/2))/m) | agrees | none |
| §1.5 quartic Checks | p=17, 103 | disc 2¹⁰·7; 6²≡2, 3 and 7 nonsquares mod 17; 38²≡2, 35 nonsquare, 25²≡7 mod 103 | true | none |
| §1.6 coefficient-linearity Check | 𝔽₄₉, weights 7, 6 | adjoint weights 0,0,1,−1; Frobenius twist 0,0,7,−7 meets {7,6} | true | none |
| Overview, level raising and reciprocity | §§3.5, 5.5 | H¹sing(ℚ_p², H^(2r−1)(RΨ)/nΠ)≃Oλ[Sh°]/nΠ; factor p+1 and two eigenvalues | agrees | none |
| Gap native-shimura | PELModuliPartII §§8.1–8.4, 8.7 | local ring W(k)[[x₁..x_N]]/(x₁x_N−p); generic fibre Sh(V′,jK^pK′_p)×T_η; "owned here" | conflict | R01 |
| Gaps rigid-r-equals-t, eventual-rigidity | PotentialAutomorphyInfrastructurePartII §§10.2–10.3 | Theorem 3.6.3 with (D0)–(D4); Corollary 4.1.2, Theorem 4.2.6 | conflict | R02 |

- Previous review (of 4f2c89a): no finding. Its two remarks are C01 (unchanged in the text) and R02 (now raised, the ownership statement having been read at the other roadmap's head).
- Source locators read against the text: 41 in ltxzz, 4 in ltxzz-published, 4 in liu-tian, 4 in stacks-blowup, 3 in stacks-projective. No locator is flagged unverified in the README.
- Library declarations opened at the pins: 16 in Mathlib (for example `Equiv.prod_comp` at `Mathlib/Algebra/BigOperators/Group/Finset/Defs.lean:743`, `Polynomial.coeff_reflect` at `Mathlib/Algebra/Polynomial/Reverse.lean:95`, `Module.free_iff_isTorsionFree` at `Mathlib/LinearAlgebra/FreeModule/PID.lean:373`) and 10 in Tau Ceti (`d0` and `d0_apply` at `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:177, 190`; the four blowup chart declarations in `TauCeti/AlgebraicGeometry/Blowup/AffineCharts.lean`); all present.
- Cross-roadmap citations resolved: section headings of 22 suppliers on main and 2 at open heads; all found except the label of C01. Suppliers' statements read: EulerSystemsAndKolyvaginSystems §§1.15, 4.4; SmoothRepresentationsOfLocalGroups §SR.4.4; AutomorphicGaloisRepresentationsPartII AG2.7; IgusaVarietiesAndTorsionConcentration §7.2; IgusaVarietiesAndTorsionConcentrationPartII §11.9.
- Dependency check: `depcheck: 199 roadmaps, 2184 edges, 0 problem(s)`; no UPWARD or CYCLE line. The automatic checks all passed on this head; no change outside the folder.
- Elaboration of `Suggested.lean` at the pins: exit 0, no output. The file has no declaration, so there is nothing for the `#check` comparison or the one-tactic probe. Headlines (§§2.2–2.6, 3.2–3.7, 4.3–4.6, 5.2–5.6, 6.2–6.4, 7.1–7.4, 8.1–8.5) are each named in the docstring with the carrier they lack; the pins have no Bloch–Kato condition, nearby cycles or unitary Shimura variety.
- Pull request text against the head: title and prose agree with the folder (a new roadmap, three files, no declaration), apart from the consumer sentence of C03.
- The other eighteen declared gaps: each names a supplier on main, and the object asked for was searched in that supplier and in the open roadmaps and not found.

Overlap check: read PELModuliPartII, IgusaVarietiesAndTorsionConcentrationPartII, PotentialAutomorphyInfrastructurePartII, IgusaVarietiesAndTorsionConcentration, ModularityAndLanglandsExtensionsPartII (open), AutomorphicGaloisRepresentationsPartII, EndoscopicTransferAndUnitaryTraceComparison, HilbertModularVarietiesAndShimuraCurves (main); the third list is empty. Shared: the semistable and smooth unitary models, owner PELModuliPartII (R01); the rigid R=T theorem and eventual rigidity, owner PotentialAutomorphyInfrastructurePartII (R02); cohomological genericity, owners IgusaVarietiesAndTorsionConcentration §7.2 and its Part II §11.9, cited. Nothing shared with the others.

Source independence: 24 passages compared with 5 sources, none shared beyond formulas and lists of hypotheses; largest share ltxzz, 156 of 188 line locators; contents compared with ltxzz §§1–8: independent. Layer 1 draws on §§3.3 and 8.1, Layer 2 on §§4.3, 5.2–5.9, 5.11 and 6.1, Layer 4 on §§4.6, 7.2 and 8.3, Layers 5–6 pair §5.11 with §7.2 and §4.6 with §7.3, Layer 7 on §§2.3, 2.6, 2.7 and the proofs in §8; only Layer 3 ↔ §6 is one to one. The order (geometry, level raising, cycles, reciprocity, ranks) is forced by the *Needs:* lines of §§3.5, 5.5, 6.4 and 7.3.

Research link: Layers 5–8 are the two explicit reciprocity laws and the rank-zero and rank-one theorems of Liu–Tian–Xiao–Zhang–Zhu (2022), Theorems 7.2.8, 7.3.4, 8.2.2 and 8.3.2, cases of the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives, with Liu–Tian (2017) as precursor; this rests on the README's references and the two texts read.

## Not verifiable

- Fulfilment of the declared gaps is a contract on the suppliers and is not certified here.
- The supplier's account that the published Lemma 2.6.4 fails when [F:F⁺]=2 (EulerSystemsAndKolyvaginSystems §1.15), on which the span premise of §§7.2, 8.1 and 8.2 rests, was read in the supplier and not re-derived from the source.
- The "AI assistance" sentence of the description describes the process, not the folder.

## Source issues

- **Error** in ltxzz at Lemma 5.11.3(2), printed p. 98: the source says the exceptional stratum over the double link is a trivial ℙ¹-bundle; it should be the projectivization of the sum of the two link normal lines, nontrivial in general (rank (2,3), p=3: a section of self-intersection −16); affects a stated result.
- **Error** in ltxzz at Notation 5.11.1(4), printed p. 97: the source defines every component of the blowup as a strict transform; it should be the closure of the preimage away from the double link, since the strict transform of the centre itself is empty; affects nothing.

## For the human reviewers

- The rank theorems of §§8.1–8.2 carry a uniform realised Frobenius span premise that the published Theorems 8.2.2 and 8.3.2 (ltxzz line 6568, 6773) do not; it comes from EulerSystemsAndKolyvaginSystems §1.15, which holds the published Lemma 2.6.4 to be incorrect for CM extensions.
- H(N) for N>3 and F⁺≠ℚ is cited in the source to a work announced as forthcoming (ltxzz Proposition 3.2.11, line 1273–1277); the roadmap keeps it as a supplier gap on AutomorphicGaloisRepresentationsPartII.
