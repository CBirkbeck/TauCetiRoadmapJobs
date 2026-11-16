# Review of PELModuliPartII (pull request #2453 at d85737d)

**Verdict:** needs changes

## Previous findings

- none: the previous review read this same head and raised no finding.

## R01 (P2) — The Eisenstein condition at the fake-Drinfeld factor exists only for special local CM types

**Location.** `TauCetiRoadmap/PELModuliPartII/README.md:1335` (§6.5): "At the unique fake-Drinfeld factor for an unramified quadratic extension, impose Mihatsch’s P(r,s) structural-action condition"; also §7.9 (line 1596) "`F⁺_{v₀}/ℚ_p` may be ramified when the structural-action Eisenstein clause is retained" and §9.7 (line 1934).

**Claim.** P(r,s) with clause (ii) prescribes Lie ranks (r, ne−r) on the two distinguished unramified embeddings (Mih19 Lemma 2.10), so it matches the Kottwitz condition only when the embeddings of F_v₀ above ψ₀ other than φ₀ lie all in Φ or all outside Φ. RSZ21 case (2) admits every Φ. For the others no P(r,s) can be imposed, and §§0.4–0.6 do not apply.

**Witness.** F⁺_v₀=ℚ_p(∛p), F_v₀ unramified quadratic, embeddings (σ,j), (σ̄,j); Φ_v₀={(σ,1),(σ,2),(σ̄,3)}, φ₀=(σ,1), n=2: Lie ranks (3,3). Mih19 lines 379–382 give (r,6−r), r≤2. RSZ21 lines 1365–1376 still apply.

**Repair.** Replace the sentence of §6.5 by: "At the fake-Drinfeld factor impose the Eisenstein condition of RSZ21 §5.2, case (2), that is RZ17 (8.2) for the restriction of r to the embeddings above ψ₀ and its conjugate, with A_ψ₀ the embeddings φ≠φ₀ above ψ₀ with r_φ=n. When A_ψ₀ is empty or consists of every embedding above ψ₀ other than φ₀ (always when the ramification index of `F⁺_{v₀}/ℚ_p` is at most 2), this is Mihatsch’s P(r,s) with clause (ii), for the structural embedding φ₀, respectively φ̄₀, and only then do §§0.4–0.6 apply." In §§7.6 and 7.9 take smoothness at an inert v₀ from RZ17 Lemma 8.6 (RSZ21 Theorem 5.4(c) and Theorem 5.7) for every Φ; in §9.7 add this hypothesis on Φ_v₀ to the ramified principal case; add the instance as a Check of §6.5.

## R02 (P2) — The form of §5.4 is L-valued only when the uniformizer of K is u²

**Location.** `TauCetiRoadmap/PELModuliPartII/README.md:1150` (§5.4): "Choose δ in O_K̆× with σ(δ)=−δ. The formula (x,y)=δ(⟨Πx,y⟩+u⟨x,y⟩) on C is a nondegenerate L/K-Hermitian form"; Conventions (line 92): "u²=ϖ·(unit)".

**Claim.** For x,y in C, ⟨x,y⟩=⟨τx,τy⟩=−(u²/ϖ)·σ⟨x,y⟩, where ϖ is the uniformizer of §0.1 (FV=ϖ). So δ⟨x,y⟩ lies in K exactly when σ(δ)=−(u²/ϖ)δ. With σ(δ)=−δ this needs ϖ=u², which HLSY23 fixes and the README leaves free. §§5.2, 5.8 and 5.9 inherit it.

**Witness.** K=ℚ₃, ϖ=3, L=ℚ₃(√−3): every u is a√−3, so u²/3=−a². For n=1 and e generating `M(Y)^{τ=1}`: σ(δ⟨Πe,e⟩)=−a⁻²·δ⟨Πe,e⟩≠δ⟨Πe,e⟩, so (e,e)_Y∉K. HLSY23 line 68 sets π₀=π².

**Repair.** Add to the standing hypothesis of Layer 5 (§§5.1, 5.3, 5.7) and to §§5.2 and 5.4: "relative duals, polarizations and V are taken with respect to the uniformizer ϖ=u² of K (HLSY23 §1.2, p. 2)". Alternatively keep ϖ free and replace "σ(δ)=−δ" by "σ(δ)=−(u²/ϖ)δ", which has a solution in O_K̆^× by Lang's theorem. Add the instance as a Check of §5.4: with ϖ=u² the factor is 1 and δ⟨Πe,e⟩ is σ-fixed.

## R03 (P2) — Primes above 2 are admitted in Layer 7, but their local-model prerequisites are stated for p>2

**Location.** `TauCetiRoadmap/PELModuliPartII/README.md:1467` (§7.2): "Every place above 2 is unramified in F"; §7.5 (line 1532): "smooth by gap:unitary-multichain-stabilizer"; the contract (line 351): "For p>2, a quadratic extension of p-adic fields".

**Claim.** §§7.5, 7.9 and 7.10 assert the local-model diagram and smoothness at primes above 2 that are unramified in F. The contract covers p>2 only and Layer 0, including §0.6, assumes p>2. At p=2 the smoothness of the torsor group has no owner.

**Witness.** RSZ21 Theorem A.1, p. 37 (lines 1944–1951) proves smoothness of the isomorphism scheme of polarized multichains when O_F is étale over O_F₀, for every p; RSZ21 lines 1074–1076 use it at p=2. README line 351 asks for p>2 only.

**Repair.** Widen the contract to "For a quadratic extension of p-adic fields with p>2, or an unramified one with p=2, and a polarized periodic lattice multichain, prove …" with the locator RSZ21 Theorem A.1, p. 37, and state the local model of §0.6 without the hypothesis p>2 (Mih19 Proposition 2.12 is linear algebra on D). Otherwise add "p>2" to §§7.5, 7.9 and 7.10 and remove the clause on places above 2 from §7.2.

## R04 (P3) — The PaRa09 chart is cited for n=2, which PaRa09 excludes

**Location.** `TauCetiRoadmap/PELModuliPartII/README.md:864` (§3.4): "whose affine chart is PaRa09, §5.c, pp. 38–39, set up over any complete discretely valued K with perfect residue field of odd characteristic (PaRa09, §1.b.1, p. 10)".

**Claim.** PaRa09 §1.b.1 assumes n≥3. §3.4 is stated for every even n≥2, and at n=2 the chart is this roadmap's own computation, not the source's.

**Witness.** PaRa09 line 346: V has dimension n≥3. At n=2: Λ′=⟨f₁,πf₁⟩, Λ″=⟨f₂,πf₂⟩; isotropy forces X=diag(x,x); π-stability, the characteristic polynomial T²−π₀ and the wedge condition impose nothing; the chart is Spec O[x].

**Repair.** In the route of §3.4 write "(PaRa09, end of §5.c, p. 39, for n≥4; at n=2, which PaRa09 §1.b.1 excludes, the same equations give X=diag(x,x) and the chart is the affine line)", and add to References, PaRa09: "its §1.b.1 assumes n≥3".

## Deferred findings

- D01 — stands

## Verified sound

| Statement | Instances tried | Values computed (both sides) | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 Witt O-frame, dependence on π | K=ℚ_p(√p), R=𝔽_p; π↦−π | W_O(𝔽_p)=O_K, F=id, V=·√p; x_i↦(−1)^i x_i matches ghost maps (q odd); V↦−V | holds | none |
| §0.4 Mihatsch comparison (sample) | K₀=ℚ_p, K totally ramified of degree 2, n=1; μ-ordinary (r,s) | X: height 4, dim 2; C(X): relative height 2, dim 1. Slopes 1^min, ½^{\|r−s\|}, 0^min: supersingular iff rs=0 | holds | none |
| §0.6 clause (ii) | K=ℚ_p(√p), n=2, (r,s)=(2,0), fibre over k | F=√p·D: √p acts by 0; second-coordinate F: nilpotent ≠0; both have (t−a₀)²(t−ā₀)² | holds | none |
| §1.2 smoothness (headline) | n=1, 2; Mih19 lines 491–492 | rs=n−1: 0 and 1 parameters; N₁=Spf O_L̆ | holds | none |
| §2.2 (sample, headline) | Cho18 lines 136–139; LZ22 line 2814; uv=ϖ and uv=t² | uv=ϖ: 2 generators in dimension 2; uv=t²: 3 generators in dimension 2 | holds | none |
| §2.5 (sample) | q=3, n=2; LZ22 lines 2882–2883; LRZ26 lines 2622–2626 | deg π₁=4; (deg α)²=9·9 so deg α=9≠27; Ñ₂ and Z(x₀) both of relative dimension 1 | holds | none |
| §3.4 smoothness (headline) | n=2 chart; RSZ17 line 1038; PaRa09 lines 346, 1559–1562 | n=2: chart Spec O[x], dimension 1=n−1; PaRa09 assumes n≥3 | holds | R04 |
| §3.6 (sample) | Rosati conjugate of u⁻²λ₀⁻¹y^∨λx; LL22 lines 460–468 | two sign changes (λ^∨=−λ, λ₀) cancel, ū²=u²: equals u⁻²λ₀⁻¹x^∨λy=h(y,x) | holds | none |
| §3.7 components (headline) | n=2, Gram diag(1,−ε); LL22 lines 437–443, 1111–1122 | det −ε not a norm: nonsplit; Λ₀^∨=u⁻¹Λ₀, type 2, unique; stratum dimension 0; two points | holds | none |
| §5.4 Krämer hermitian form | K=ℚ₃, ϖ=3, L=ℚ₃(√−3); and ϖ=u² | u²/ϖ=−a²: σ(δA)=−a⁻²δA≠δA; ϖ=u²: σ(δA)=δA. Trace: Tr(u⁻¹)=0 gives 2δB | fails for ϖ≠u² | R02 |
| §5.7 Krämer regularity (headline) | n=2 chart y(1+x²)=2u | z=(1+x²)/2: yz=u, 2 generators in dimension 2; roots of 1+x² simple (p odd) | holds | none |
| §6.1 (sample) | (z,g)↦(z,z⁻¹g); Zhang21 lines 1569–1584 | c(z⁻¹g)=Nm(z)⁻¹c(g)=1; inverse (z,u)↦(z,zu), c(zu)=Nm z | holds | none |
| §6.5 Eisenstein conditions | e=3 mixed type, n=2; e≤2 | mixed: Lie ranks (3,3) vs Mihatsch (r,6−r), r≤2; e=2: both types match (r=1 or r=n−1) | fails for e≥3 | R01 |
| §6.6 CM moduli (headline) | k[ε][x]/(x²); F=ℚ(ζ₁₂); RSZ21 lines 962–968 | ideals (x+εc), Kottwitz fixes c; units with ε̄=−ε are ±iη (unit index 2 checked); θ never Φ-positive | holds | none |
| §7.3 (sample) | LL22 lines 3353–3359; RSZ21 lines 1361–1364, 1408, 1415 | LL22 prints A₀[v^∞]: height 2f, not 2nf; conditions belong to A; case (1) has no ramification hypothesis | holds | none |
| §7.5 local-model diagram | p=2, v₀ inert; contract line 351 | contract: p>2; RSZ21 Theorem A.1: every p when O_F/O_F₀ étale | unowned at p=2 | R03 |
| §7.6 (sample, headline) | Zhang21 lines 1710–1718; F⁺=ℚ(√3), p=3; Stacks lines 4242–4271 | DM stack, smooth of relative dimension n−1; 3 ramified in F⁺, inert in F (−1 nonresidue): bad prime | holds | R01 (route) |
| §7.7 (sample, headline) | RSZ21 lines 1415, 1484–1487; F⁺=ℚ, n=4 | type (e) smooth; trace form signature (6,2) in 8 variables: isotropic, so not proper | holds | none |
| §7.8 Krämer geometry (headline) | n=2: uv=t²·unit and yz=u | wedge: 3 generators in dimension 2; Krämer: 2 generators in dimension 2 | holds | none |
| §7.9 (headline) | LZ22 lines 3245–3313; e=3 mixed Φ_v₀; p=2 | smooth by RSZ21 5.4(c), 5.7 for every Φ; the §0.6 route needs R01's hypothesis and p>2 | route incomplete | R01, R03 |
| §8.2 (sample) | LTXZZ22 lines 2607–2617, 2652 | kernel in A[𝔭], rank p²; N=1: ground and link strata empty | holds | none |
| §8.3 (sample) | LTXZZ22 lines 2729–2739; N=2 | Λ′_𝔭^♯/Λ′_𝔭 of length 1; det valuation 1 at inert 𝔭: anisotropic | holds | none |
| §8.4 (headline) | LTXZZ22 lines 2700–2714; N=3, F⁺=ℚ | three chart types, crossing x₁x_N=p; 6 variables, indefinite: isotropic, not projective | holds | none |
| §8.6 (sample) | q=3; LZ22 line 3593 | source prints degree q; (deg α)²=q²·q², deg α=9; kernel O_F-stable so a power of q² | holds | none |
| §8.7 (sample, headline) | LTXZZ22 lines 1718–1726, 1777; N=3 | tangent rank 1·(N−1); ω of A₀^∨ at τ∞ is 0: printed condition leaves dimension 3, not 1 | holds | none |
| §9.1 (sample, headline) | RZ96 lines 8931–8964; supersingular curve; ordinary CM curve with conjugated action | 4=4; Hom_K=0 vs dimension 2, slopes 0 and 1 at 𝔭: common-slope hypothesis needed | holds | none |
| §9.2 quotients | Gram rows (0,1,0),(1,0,0),(0,0,3); g=diag(3,1/3,1) | det −3; dual-quotient lengths 3,3,1; g*Hg=H, gΛ₋=Λ₊ | holds | none |
| §9.3 (sample) | Zhang21 lines 1817–1824, 1846–1849 | V′ definite, differs at v₀ only: two invariants change, product formula kept | holds | none |
| §9.4 (sample) | LZ22 lines 3525–3527; RSZ20 lines 2858–2873 | three-factor product; banal factor ≅ G(L₀)/K | holds | none |
| §§9.5–9.10 (headline) | §9.6 at n=2; §9.10 at q=3 | val(u²/ϖ)=1−val_u(ϖ): unit iff val_u(ϖ)=1; deg π₁=4, deg α=9 | holds | R01 (§9.7) |

- Source locators checked against the cached texts: 88, in Mih19 (8), Cho18 (2), LZ22 (9), LRZ26 (1), LL22 (20), Zhang21 (5), RSZ21 (8), RSZ17 (2), PaRa09 (2), LTXZZ22 (13), RZ96 (5), RSZ20 (2), RZ17 (2), HLSY23 (3), Stacks (6). All 15 seeded targets are among them.
- Library declarations opened at the pins: Mathlib `LinearMap.charpoly` (`LinearAlgebra/Charpoly/Basic.lean:44`), `charpoly_monic` (:72), `charpoly_natDegree` (:76), `Matrix.charpoly` (`LinearAlgebra/Matrix/Charpoly/Basic.lean:140`), `IsRegularLocalRing` (`RingTheory/RegularLocalRing/Defs.lean:52`), `Smooth`, `SmoothOfRelativeDimension` (`AlgebraicGeometry/Morphisms/Smooth.lean:59`, :127), `Flat` (`Morphisms/Flat.lean:42`), `WittVector` (`RingTheory/WittVector/Defs.lean:52`); Tau Ceti `AbelianVariety` (`AlgebraicGeometry/AbelianVariety/Basic.lean:95`, over a field), `Spf.carrier` (`FormalScheme/Spf/Carrier.lean:73`), `Spf.structureSheaf` (`StructureSheaf.lean:262`), `Module.Grassmannian.scheme`, `toSpec` (`Grassmannian/Basic.lean:161`, :166), `schemeHomEquiv` (`Points.lean:405`), `isSeparated_toSpec`, `isProper_toSpec` (`Proper.lean:137`, :230).
- Cross-roadmap citations resolved: 84 section headings, on main (ReductiveGroupsPartII, AdelicAlgebraicGroups, AlgebraicModuliForArithmeticGeometry, AbelianSchemesAndArithmeticModuli, AdicSpacesPartIII, SchemeAndStackFoundations) or at the open heads (PELModuli, HilbertModularVarietiesAndShimuraCurves, VectorBundlesAndIsocrystals, IgusaVarietiesAndTorsionConcentration, ShimuraCompactifications, EndoscopicTransferAndUnitaryTraceComparison, GeometryOfNumbersAndQuadraticArithmetic, FiniteFlatGroupsAndIntegralPadicHodgeTheory, PadicHodgeTheory, ShimuraVarieties, SelmerIwasawaCohomologyPartII). The contents of HilbertModularVarietiesAndShimuraCurves §R18.5.4, IgusaVarietiesAndTorsionConcentration §§0.27 and 0.31 and PELModuli §§M0.10, M2.15 and M4.7 were read and agree with what is assumed of them.
- Gate: every check passes. Dependency check: `depcheck: 261 roadmaps, 2526 edges, 0 problem(s)`. Nothing changed outside the folder. The four gaps carry the same slug, supplier and section in the README and in the plan.
- Elaboration: `lake env lean` on `TauCetiRoadmap/PELModuliPartII/Suggested.lean` exits 0 with no message. The file declares nothing, so there is no `#check` comparison and no padding; no headline is statable at the pins (no category of formal schemes, no p-divisible groups or abelian schemes over a base).
- Pull request text: title and description agree with the head (a new roadmap, `Suggested.lean` declaring nothing, the listed headline sections equal the module docstring's).
- Overlap check: read GrossZagierAndArithmeticHeightsPartII, IgusaVarietiesAndTorsionConcentration, HilbertModularVarietiesAndShimuraCurves, PELModuli, SelmerIwasawaCohomologyPartII, AbelianSchemesAndArithmeticModuli, CrystallineCohomology. GrossZagierAndArithmeticHeightsPartII imports Layers 0–9 by section and owns the special cycles; IgusaVarietiesAndTorsionConcentration owns the unramified single-lattice Rapoport–Zink space (§0.27, cited); HilbertModularVarietiesAndShimuraCurves owns strict actions and relative heights (§R18.5.4, cited); PELModuli owns Zink displays in characteristic p (§M2.15, cited). The LTXZZ22 models remain D01. Nothing else shared.
- Source independence: 22 passages compared with 12 sources, none shared beyond forced phrases ("smooth of relative dimension n−1", "finite étale of degree q+1"); largest share LL22, 44 of 290 source mentions; contents compared with LL22 (§§2.1–2.8, 3, 4.1–4.7): independent, only Layers 3–4 and §§7.3, 9.6 draw on it.

## Not verifiable

- Zhang21 pp. 879–909 and LTXZZ22 pp. 147–193: the published versions (Annals 193; Inventiones 228) are paywalled. Numbering was checked on arXiv v3 of each.

## Source issues

- **Error** in RZ96 at Corollary 6.29, p. 293: the source says the K-linear Hom comparisons hold for two objects each satisfying Lemma 6.28 separately; it should require the two 𝔭-parts to have the same slope at every 𝔭; affects a stated result.
- **Misprint** in LL22 at §4.5, p. 66: the source says the exotic conditions at the ramified places above p hold for the CM factor A₀; it should be A, the only factor of height 2nf; affects nothing.
- **Misprint** in LZ22 at §13.4, p. 82: the source says the auxiliary isogeny α has degree q at v₀; it should be q², forced by the polarization identity printed beside it; affects nothing.
- **Error** in LTXZZ22 at Remark 4.2.5, p. 163 (arXiv v3 p. 38): the source says the period line is cut out by a condition on the Hodge subspace of A₀ at τ∞, which is zero; it should be the maps from H₁^dR(A₀) at τ∞ into ω of A^∨ at τ∞; affects nothing.
- **Misprint** in LTXZZ22 at Definition 4.2.2, p. 160 (arXiv v3 p. 37): the source says the Hecke parameter lies in the unitary group over the adeles of F; it should be the adeles of F⁺ away from p; affects nothing.
- **Gap** in HLSY23 at Definition 2.2(2), p. 10: the source says the framing is a height-zero O_F-linear quasi-isogeny, with no relation between the polarizations; it should require the framing polarization to pull back to an O_F₀-unit multiple; affects a stated result.
- **Gap** in Zhang21 at §7.3, footnote 3 (arXiv v3 p. 32): the source says the absolute and relative Rapoport–Zink spaces coincide by Mihatsch's theorem; it should restrict to local CM types that Mihatsch's signature condition describes, or use another comparison; affects a stated result.

## For the human reviewers

- Licence: RZ96 (Princeton Annals of Mathematics Studies 141) is read from a scan on the author's Bonn page (`TauCetiRoadmap/PELModuliPartII/README.md:2096`). Whether that copy is licensed for this use is for a human to decide.
