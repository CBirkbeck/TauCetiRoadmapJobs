# Review of PELModuliPartII (pull request #2453 at 8ec1479)

**Verdict:** accepted

**Summary.** Accepted: the full re-read found no false statement, no missing hypothesis and no unsupported locator among the sampled targets, and the new passages (the opening overview, the definition of O-frames and windows in §0.1, Landherr's theorem taken from HermitianFormsAndLattices in §§8.3 and 9.3) agree with the layers, the sources and the suppliers on main. There are two small corrections and one format note, none blocking. Three points are left for the human reviewers: the licence of the RZ96 scan, the board's obsolete hermitian gap, and the fact that §9.9 states a comparison no cited text states.

## C01 — The definitions of O-frame and window in §0.1 are located in Mih19 §11.1, which does not state them

A reader who opens Mih19 at the locator of §0.1 (line 167, "§11.1, Definition 11.1, (11.2), Lemma 11.2 and Definition 11.6, pp. 41–42") finds the dual window, the u-morphisms and polarizations, but not the definition of an O-frame or of a window over it: Mih19 §11.1 opens by saying that it works with the definitions of Ahsendorf–Cheng–Zink, Section 3 (Mih19 line 1837), and Definition 11.7 again refers there for O-displays (Mih19 line 1926). That paper is used a second time in the route ("the Ahsendorf–Cheng–Zink construction recalled in Mih19 §10 and §11.2") and is not in the References.

The definitions as written are the standard ones, so nothing stated changes. The smallest repair would be a References entry for the Ahsendorf–Cheng–Zink paper and, in the locator of §0.1, the words "O-frames and windows as in Ahsendorf–Cheng–Zink, recalled in Mih19 §11.1, p. 41".

## C02 — The description's summary gives the relative polarizations as the reason for the multichain generality, which is not what §0.2 says

The summary block of the description reads: "Representability of framed functors is proved once for arbitrary self-dual periodic multichains, since the non-principal spaces carry relative, not Cartier, polarizations." At this head §0.2 says the opposite of the "since": the relative unitary functors "are not PEL functors of RZ96 for their underlying groups" and are cut out of the EL functor for a single lattice (line 199), and the Scope section gives the relative polarizations as the reason for including EL data without polarization, not for the multichains (lines 1850–1852).

Text that would be right: "Representability is proved once, for EL data and for polarized PEL data with an arbitrary self-dual periodic multichain; the relative unitary spaces are cut out of the EL functor, because their polarizations are relative, not Cartier."

## N01 — The window of §0.1 is defined without a normal decomposition, which the dual window then uses

In §0.1 (line 167) a window asks only that P/Q be projective over S/I, and the next sentence defines the dual's operators "through a normal decomposition". For the three frames used (Witt, Lubin–Tate, `A_{O′/O}`) the decomposition exists because the ring is complete for the ideal (Mih19 line 2008), so no statement is affected; adding "admitting a normal decomposition P=L⊕T, Q=L⊕IT" to the definition would make the general definition self-contained.

## Previous findings

- The previous review, of 8a49f22, raised no finding; there is nothing to repair. Its four earlier repairs (§6.5 Mihatsch type, §5.4 normalization of δ, the stabilizer contract at p=2, §3.4 at n=2) are unchanged at this head.

## Deferred findings

- D01 — resolved: SelmerIwasawaCohomologyPartII at its open head 980d7b8 names PELModuliPartII §§8.1–8.5, 8.7 as owner of the models; its native-shimura contract keeps only specialization isomorphisms and auxiliary models.

## Verified sound

| Statement | Instances tried | Values computed (both sides) | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 Witt O-frame, Checks | O=W(𝔽_{p²}), R=𝔽_q; K=ℚ_p(√p), π→−π | F=id, V=p, σ̇(px)=x, θ=p. Sign change: x_i↦(−1)^i x_i fixes ghosts (q odd); new V=(0,−x₀,−x₁,…)=−V | holds | none |
| §0.1 Lubin–Tate and f-O-display clauses | Mih19 Def. 12.7, Prop. 12.3, Def. 13.1, Prop. 13.2 | σ̇(ξ)=V⁻¹(ξ)σ̇(V(1)), value κ at π′⊗1−1⊗[π′]; frame (W_O,I_O,F^f,F^{f−1}V⁻¹); γ, δ equivalences for noetherian R | holds | C01, N01 |
| §0.2 representability (sample) | K=ℚ_p(√p), n=1; K/ℚ_p ramified of degree 2 | unstructured: 1·(4−1)=3 parameters, N₁ has 0; Cartier dual dim 4−1=3, relative dual dim 2−1=1. RZ96 Thm 3.25 on p. 88 | holds | none |
| §0.4 μ-ordinary Check; Layer 0 examples | L=ℚ_{p²}, (r,s)=(1,0),(1,1); K=ℚ_p(√p), n=3 | slopes 1/2,1/2; 0,0,1,1 (not formal). Heights 6 relative, 12 absolute; C⁻¹ gives dimension 6 | holds | none |
| §0.6 clause (ii) not implied by (i) | K₀=ℚ_p, K=ℚ_p(√p), n=2, (2,0), over k | P(2,0)=(T−a₀)²(T−ā₀)² for both F; quotient k[π]/π²: π nonzero nilpotent, fails (ii) | holds | none |
| §1.3 canonical rank-one source (sample) | n=1; LZ22 line 411–418 | signature (1,0) for 𝔈, (0,1) after conjugation; N₁=Spf O_L̆; height 2, dimension 1 | holds | none |
| §1.5 special Hom space (sample) | n=2; LZ22 line 419–426 | h=λ_𝔈̄⁻¹y^∨λx, linear in x; V_n nonsplit of L-dimension 2, relative height of framing 4 | holds | none |
| §1.6 diagonal graph (sample) | n=2,3,4 | relative (0,1), (1,3), (2,5); arithmetic (1,2), (2,4), (3,6): half only in the second count. Zhang21 (3.3)–(3.6) | holds | none |
| §§2.3–2.5 mixed space | q=3, n=2 | (deg α)²=9·9, deg α=9≠27; π₁ degree q+1=4; W₂ even valuation, W₂⊥⟨ϖ⟩ odd, nonsplit. LZ22 line 2854–2883 | holds | none |
| §3.3 exotic framed space (sample) | LL22 Def. 2.1, 2.3, Lemma 2.4 | (T−u)^{n−1}(T+u), wedge, spin, ker λ=X[i(u)] of order q^n; height-zero exact framing; separated, formally smooth of dimension n−1 | holds | none |
| §3.7 two components | n=2, ⟨1,−ε⟩; n=4 | Λ₀^∨=u⁻¹Λ₀, t=2, unique vertex lattice; dim V_Λ^ε=0; n=4: t=4 gives ℙ¹ per component. LL22 line 518–524, 1102–1122 | holds | none |
| §4.1 absolute exotic category (sample) | f=1, f=2 with n=2 | height 2nf=8, dimension nf=4; one distinguished ψ₀, f−1 banal summands. LL22 Def. 2.59 | holds | none |
| §4.2 banal contraction (sample) | f=1; LL22 Lemma 2.60 | Q_i=(u⊗1−1⊗[φ_i(u)])P_i+I(R)P_i; Vε_i=[ψ_i(u²)]−ψ̂_i(u²) (LL22 line 1985); no banal component at f=1 | holds | none |
| §5.1 Krämer filtration (sample) | n=2,3 | rank n−1 conjugate sub, rank 1 structural quotient: (1,1), (2,1). HLSY23 line 442–445 | holds | none |
| §5.2 ramified rank-one source (sample) | e, u·e | VM=uM so τ bijective; slope 1/2−1/2=0; (ue,ue)=uū(e,e)=−u²(e,e), valuation 1. HLSY23 line 483–496; Howard19 line 216 | holds | none |
| §6.1 RSZ group (sample) | (z,g)↦(z,z⁻¹g) | inverse (z,u)↦(z,zu); c(g)=Nm(z); reflex field E_ΦE_r. Zhang21 line 1569–1584 | holds | none |
| §6.6 integral CM moduli (sample) | F=ℚ(ζ₁₂), both kinds of CM type; c=1+√2; k[ε] | 𝔇=(2√3); θ=±iη/(2√3), N(η)=+1: Im opposite for {1,s}, equal for {1,cs}. c²=3+2√2, c⁴=17+12√2. (x+εc) only | holds | none |
| §7.7 exotic smoothness (sample) | F⁺=ℚ, n=4; F⁺≠ℚ | trace form (6,2) in 8≥5 variables: isotropic; definite at a real place: anisotropic. LL22 line 147, 3345; RSZ21 Thm 5.4(e), 5.7 | holds | none |
| §7.9 self-dual and almost self-dual (sample) | split, inert self-dual, inert almost self-dual | RSZ21 case (2) needs w unramified over F⁺ only; type (c) smooth by RZ17 Lemma 8.6; regularity only with E_ν/ℚ_p unramified | holds | none |
| §8.2 almost self-dual moduli (sample) | N=1; LTXZZ22 Def. 5.2.1 | ker λ[p^∞]⊂A[𝔭] of rank p²; V° definite with self-dual lattices; ground and link strata empty at N=1 | holds | none |
| §8.4 local equations (sample) | N=1,2,3 | N=2: det valuation 1, −det not a norm, anisotropic at 𝔭; N=3, F⁺=ℚ: 6 variables, isotropic. LTXZZ22 Thm 5.2.5(1) | holds | none |
| §§8.3, 9.3 Landherr from the supplier | V°→V′; V→V′ | real sign (−1)^q flips at one real place and the determinant class at 𝔭 (resp. v₀): two changes, product stays 1 | holds | none |
| §9.1 Tate–Dieudonné | ordinary CM curve with conjugated action | Hom_K=0, conjugate-semilinear maps of V_ℓ of dimension 2: common slope needed | holds | none |
| §9.2 quotients | Gram (0,1,0),(1,0,0),(0,0,3); g=diag(3,1/3,1) | det −3; dual lengths 3,3,1; g*Hg=H, gΛ₋=Λ₊; LZ22 line 471–474 | holds | none |
| Conventions, transposed form | L=ℚ₃(√3), h(x,y)=xȳ | h(u,1)=u, H(u,1)=−u; H(x,x)=h(x,x) | holds | none |
| Pull request summary sentence | §0.2, Scope | relative functors are cut out of the EL functor; multichains serve the PEL statement | misleads | C02 |

- Source locators checked against the cached texts: 70, in RZ96 (6), LZ22 (9), Zhang21 (7), LL22 (13), HLSY23 (6), Howard19 (1), RSZ21 (7), RZ17 (2), Mih19 (9, in Part III), LTXZZ22 (4), and the six Stacks tags (0B3G, 0B3H, 0C4M, 0C4N, 0BCL, 01WN), each read at its lemma.
- Library declarations opened at the pins: 15. Mathlib `LinearMap.charpoly`, `charpoly_monic`, `charpoly_natDegree` (`LinearAlgebra/Charpoly/Basic.lean` lines 44, 72, 76), `Matrix.charpoly` (line 140), `IsRegularLocalRing` (line 52), `SmoothOfRelativeDimension` (line 127), `Module.Grassmannian`, the five Witt-vector files; Tau Ceti `Module.Grassmannian.scheme`, `toSpec`, `schemeHomEquiv`, `isSeparated_toSpec`, `isProper_toSpec`, `AbelianVariety`, `Spf.carrier`, `Spf.structureSheaf`. No Grassmannian smoothness at the pin, as the README says.
- Cross-roadmap citations resolved on main: 17 roadmaps, every cited section heading found; HermitianFormsAndLattices §§1.0, 3.1, 3.2, 4.6, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §§0.3, 0.11, 0.13, PELModuli §§M2.15, M4.7, HilbertModularVarietiesAndShimuraCurves §R18.5.4, VectorBundlesAndIsocrystals Layer 0 and GeometryOfNumbersAndQuadraticArithmetic §2.7 were read and say what the contracts assume. The sections of this roadmap that the scope paragraph of GrossZagierAndArithmeticHeightsPartII cites all exist at this head.
- Declared gaps: the three in the README (Zink display equivalence, unitary multichain stabilizer, bad-prime projectivity) are precise and ask for nothing a supplier has: PELModuli §M2.15 is in characteristic p only, ReductiveGroupsPartII §RG2.3.5 treats GL and GSp, HermitianFormsAndLattices §4.6 only unimodular lattices at unramified places.
- Automatic checks: all passed. Dependency check: `depcheck: 121 roadmaps, 1385 edges, 0 problem(s)`. Nothing changed outside the folder; no machine path or process word in the files.
- Elaboration: `lake env lean` on `TauCetiRoadmap/PELModuliPartII/Suggested.lean` ends with no message. The file declares nothing, so there is no `#check` comparison and no padding; its docstring names every headline of the overview (§§1.2, 2.2, 3.4, 3.7, 5.7, 6.6, 7.6–7.9, 8.4, 8.7, 9.1, 9.5–9.10) with the missing carrier, and the pins have no formal schemes, no abelian schemes over a base and no isocrystals of abelian varieties.
- Overlap check: read GrossZagierAndArithmeticHeightsPartII, ShimuraVarietiesPartII, SelmerIwasawaCohomologyPartII, PELModuli, EndoscopicTransferAndUnitaryTraceComparison, IgusaVarietiesAndTorsionConcentration, HilbertModularVarietiesAndShimuraCurves, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII, and HermitianFormsAndLattices and ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties on main; the unitary Rapoport–Zink spaces, the RSZ data and models and the divisor Z(x₀): owner PELModuliPartII, cited by GrossZagierAndArithmeticHeightsPartII, which owns the special cycles; the LTXZZ22 models: owner PELModuliPartII §§8.1–8.5, 8.7, their strata SelmerIwasawaCohomologyPartII §2.3; Landherr's theorems and the flip of sesquilinear conventions: owner HermitianFormsAndLattices; nothing else shared.
- Source independence: 21 passages compared with 11 sources, none shared beyond formulas and lists of hypotheses; largest share LL22, 43 of 284 locators; contents compared with LL22: independent (its §2.1, §2.8 and §4.5 feed Layers 3, 4 and §§7.3, 7.7, 9.6, which also rest on Wu16, RSZ17, PaRa09 and RSZ21, and no run of layers follows its sections).
- Research link: The local spaces and uniformizations are the geometric inputs of the Kudla–Rapoport identities of Li–Zhang (2019) and He–Li–Shi–Yang (2022) and of Zhang's arithmetic fundamental lemma (2019); Layers 7–8 are the models of Rapoport–Smithling–Zhang (2019), Li–Liu (2020, 2021) and Liu–Tian–Xiao–Zhang–Zhu (2019). README overview and the sources read.

## Not verifiable

- Published page numbers of Zhang21 (Annals 193) and LTXZZ22 (Inventiones 228): the cached texts are the arXiv versions with arXiv pagination; section, equation, definition and theorem numbers were checked, the published pages were not.
- The Ahsendorf–Cheng–Zink definitions of O-frames and windows (C01): the paper is not among the recorded sources and was not read; §0.1 was compared with what Mih19 recalls of it.

## Source issues

- none

## For the human reviewers

- Licence: RZ96 (Annals of Mathematics Studies 141) is read from a scan on an author's Bonn page (References of `TauCetiRoadmap/PELModuliPartII/README.md`). Whether that copy may be used is for a human to decide.
- The board's plan still declares a hermitian local-global gap on AdelicAlgebraicGroups §4.1; the README no longer states it and cites HermitianFormsAndLattices §§3.1–3.2 on main instead. Whether to withdraw that announcement is an operator's decision.
- §9.9 says of itself that no cited text states the comparison of Krämer completions with the filtration (`TauCetiRoadmap/PELModuliPartII/README.md`, line 1740); its ingredients are cited to HLSY23, RSZ21 and RZ96.
