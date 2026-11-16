# Review of PELModuliPartII (pull request #2453 at 33e4234)

**Verdict:** needs changes

## R01 (P2) — The LTXZZ22 §§4.2/5.2 integral models have two plans

**Location:** `TauCetiRoadmap/PELModuliPartII/README.md:2001–2005`: "SelmerIwasawaCohomologyPartII uses the models of Layers 7 and 8 in its Layers 2 and 5. The native strictly semistable models of LTXZZ22 §5.2 … and the smooth models of LTXZZ22 §4.2 are §§8.1–8.4 and 8.7 here"

**Claim:** The named consumer does not use these targets. At its head it asks ShimuraVarieties for the same models, so the models have two plans and no single owner. The description's sentence that SelmerIwasawaCohomologyPartII "builds its special-fibre strata … on these models" is false at that head.

**Witness:** SelmerIwasawaCohomologyPartII README (#1403), line 160: "What ShimuraVarieties must provide (gap:native-shimura): Supply the native strictly semistable models of ltxzz §5.2 … the smooth hyperspecial models". `roadmaps grep --fixed PELModuliPartII` finds no roadmap that cites this one.

**Repair:** Settle one owner. SelmerIwasawaCohomologyPartII comes later in the merge order, so the default is: it cites §§8.1–8.4 and 8.7 here in the *Needs:* lines of its §§2.1–2.3, and drops the §5.2-model and smooth-hyperspecial-model clauses from gap:native-shimura. Failing that, cut §§8.1–8.4 and 8.7 here, together with the Downstream paragraph and table. Make the description's "Why Tau Ceti wants it" sentence match the owner that is kept.

## R02 (P2) — Polarization-kernel orders are stated with the hermitian dual

**Location:** `README.md:1390` (§6.7, API): "At each v|p the polarization kernel has order #Λ_v^♯/Λ_v and is contained in the ϖ_v-torsion". The same appears in §7.2 (line 1464), §7.7 (line 1566: "Λ_u^♯=π⁻¹Λ_u … matching ker λ[u^∞]=A[π]") and §8.4 (line 1715).

**Claim:** ker λ_v is measured by the dual of Λ_v for the alternating trace form. §6.7 itself says this dual differs from the hermitian dual Λ_v^♯ of the Conventions by the different and the trace scalar. Stated with Λ_v^♯, the kernel order is false.

**Witness:** RSZ21 line 1031 (Def. 4.1(i)): order #(Λ_v^∨/Λ_v), Λ_v^∨ the trace dual (line 1000: the duals differ by a scalar). F⁺_v=ℚ_p, F_v unramified, trace scalar pδ: Λ^∨=pΛ^♯, so principal λ_v gives #Λ^♯/Λ=p^{2n}≠1.

**Repair:** In §6.7 add "Λ_v^∨={x : Tr_{F_v/ℚ_p}(c⁻¹h(x,Λ_v))⊆ℤ_p}=c·𝔇_{F_v/ℚ_p}⁻¹·Λ_v^♯, c the chosen trace scalar", and use it wherever a kernel is meant: "#Λ_v^∨/Λ_v" in §6.7 and §7.2, "Λ_u^∨=π⁻¹Λ_u" in §7.7, and "Λ₀⊕Λ′_p⊂Λ₀⊕Λ′_p^∨" in §8.4. On the witness this gives kernel order 1.

## R03 (P3) — The §3.1 locator omits the definition of Exo(n,0)

**Location:** `README.md:806`: "Define Exo(n,0) by structural O_L-action on Lie and the same height, dimension and polarization-kernel condition. … (LL22, §2.1, Definition 2.1 and Remark 2.2, pp. 9–10.)"

**Claim:** Neither Definition 2.1 nor Remark 2.2 defines Exo(n,0), so that definition has no locator.

**Witness:** LL22 lines 492–497: Remark 2.9 (p. 11) defines Exo(n,0): ι(u)−u annihilates Lie X, and ker λ_X = X[ι(u)].

**Repair:** "(LL22, §2.1, Definition 2.1 and Remark 2.2, pp. 9–10; Remark 2.9, p. 11, for Exo(n,0).)"

## R04 (P3) — The description misstates what Suggested.lean contains

**Location:** Pull-request description: "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti; every target is in the README."

**Claim:** `Suggested.lean` states no definition and no theorem, but the sentence implies it does.

**Witness:** `TauCetiRoadmap/PELModuliPartII/Suggested.lean` line 10: "None of them is statable at the pins, so this file states nothing". Line 39 opens an empty namespace.

**Repair:** "`Suggested.lean` declares nothing: its module docstring lists each headline theorem (§§1.2, 2.2, 3.4, 3.7, 5.7, 6.6, 7.6–7.9, 8.4, 8.7, 9.1, 9.5–9.10) with the carrier it lacks at the pins; every target is in the README."

## Verified sound

| Statement | Instances tried | Values computed (both sides) | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 Witt O-frame, O-displays | O=ℤ_p; K=ℚ_p(√p), π=√p, R=𝔽_p; π→−√p | w₁=x₀^q+πx₁; W_O(𝔽_p)=O_K, V=·√p, I=(√p); p-normalized V has image (p)⊊(√p); −π gives −V | holds; Mih19 Def. 11.7, Rem. 11.11, Prop. 13.2 (noetherian R) match | none |
| §2.1 almost self-dual functor | q=3, n≥2; principal λ | kernel order 9 for every n; principal λ has order 1, rejected; LZ22 line 2807 "ker λ⊆Y[ι(ϖ)] of order q²" | holds | none |
| §3.3 exotic framed space | framing multiplier c≠1; height ≠0 | LL22 Def. 2.3 (p. 10): height-0 quasi-morphism over S⊗k with ρ*λ=λ; cλ, c≠1, rejected | holds | none |
| §3.6 u⁻²-normalized form | omit u⁻²; L-dimension | LL22 (2.1) is u⁻²λ_{X0}⁻¹y^∨λx (fn. 9); omitting u⁻² scales h by u²; dim_L V=n | holds | none |
| §3.7 two components, vertex lattices | n=2, V=diag(1,−ε); K/ℚ_p unramified of degree 2 | Λ₀^♯=Λ₀, Λ₀^∨=u⁻¹Λ₀, t=2, unique vertex lattice; each N^ε_red is one point; absolute height of ρ₁ = 2×relative, parity constant | holds; LL22 p. 10 and pp. 22–23, Wu16 pp. 12–13 and 30–31 match | none |
| §4.6 absolute/relative exotic | f=2, n=2 | 𝕏_Φ: height 8, dim 4; X₀,Φ: height 4, dim 2; V_Φ: L-dim 2, ℚ_p-dim 8; LL22 Def. 2.64, Cor. 2.65–2.66, p. 43 | holds | none |
| §5.1 Krämer filtration | n=3; HLSY23 introduction | F has rank 2, quotient rank 1; Def. 2.2(3): rank n−1, ī on F, i on the quotient; the introduction says rank 1 | holds | none |
| §5.2 rank-one source, integral line | VM(Y) versus i(u)M(Y); basis ue | both of colength 1, so equal and τ is bijective; (ue,ue)=−u²(e,e), K-valuation 1 | holds; HLSY23 (2.5)–(2.6), pp. 11–12 | none |
| §5.4 trace recovery | A=⟨Πx,y⟩, B=⟨x,y⟩ | Tr(u⁻¹δ(A+uB))=δ(0·A+2B)=2δB; (2δ)⁻¹ gives B, δ⁻¹ gives 2B | holds; HLSY23 (2.1)–(2.2), p. 11 | none |
| §5.6 Krämer charts | n=2; n≥3 | y(1+x²)=2u; roots ±i with derivative ±2i a unit for p odd; z=(1+x²)/2 gives yz=u; Krämer (4.11) p. 12 assumes n≥3 (line 95) | holds | none |
| §6.7 level data, kernel order | F⁺_v=ℚ_p, F_v unramified, trace scalar pδ | Λ^∨=pΛ^♯; principal λ_v: #Λ^∨/Λ=1 versus #Λ^♯/Λ=p^{2n} | fails | R02 |
| §7.3 exotic integral model | n=2, F⁺_v=ℚ_p; LL22 p. 66 | [[0,1],[0,0]]: char poly T², square 0, nonzero, so Kottwitz holds and Eisenstein fails; LL22 prints A₀ (height 2f) for A (height 2nf) | holds | none |
| §7.10 global gluing | LZ22 (G0)–(G5) | five lattice clauses match (G0)–(G4), p. 84; Drinfeld levels by normalization, p. 85; RSZ21 Thm. 6.2 p. 30, Thm. 6.7 p. 32 | holds | none |
| §8.3 generic comparison | N=2, almost self-dual Λ′ at the inert 𝔭 | Gram matrix diag(1,p), det valuation 1, so −det is not a norm and V′ is anisotropic; LTXZZ22 Def. 5.2.6 and (5.2) on arXiv p. 58 | holds | none |
| §8.6 mixed isogeny degree | q=3 | deg λ=9 and deg(u₀λ₀)=9 at v₀, target principal: (deg α)²=81, so deg α=9; LZ22 p. 82 prints q_{v₀}=3 | holds (source error) | none |
| §1.2 N_n smooth, dim n−1 | n=1, n=2 | N_1 has 0 parameters versus 2[K:ℚ_p]−1 unstructured; n=2: one parameter | holds | none |
| §2.2 semistable over O_L̆ | ramified base change ϖ=t² | uv=ϖ is regular; uv=t² needs 3 generators in dimension 2 | holds | none |
| §3.4 exotic smoothness | n=2, over O_K̆ versus O_L̆ | O_L̆[[t]]; fibre over O_K̆ is k[u]/(u²)[[t]], nonreduced | holds | none |
| §5.7 Krämer regularity | Krämer Thm. 4.5; n=2 | regular of dimension n, two smooth components; relative dimension n−1; n=2 through the §5.6 chart | holds | none |
| §6.6 CM moduli finite étale | F⁺=ℚ(√3), F=ℚ(ζ₁₂); R=k[ε] | disc 144=12², so F/F⁺ is unramified; Im φ(θ) have opposite signs, so M₀ is empty; submodules (x+εc), and Kottwitz fixes c | holds | none |
| §7.6 localized smoothness, quasi-projectivity | F⁺=ℚ(√3), p=3 | 3 ramified in F⁺, inert in F (−1 a nonsquare mod 3), 3∣144, so bad; uses gap:bad-prime-projectivity | holds | none |
| §7.7 exotic projectivity | F⁺=ℚ, n=4 | trace form of signature (6,2) in 8 variables is isotropic (Meyer), so a cusp label exists; F⁺≠ℚ: definite place, anisotropic | holds | none |
| §7.8 wedge versus Krämer | n=2 | wedge uv=ϖ with ϖ=t²·unit is not regular; Krämer yz=u stays regular after unramified E_ν/F_{v₀} | holds | none |
| §7.9 self-dual and almost self-dual | (r,s)=(1,n−1); inert almost self-dual | §0.6 relative dimension rs=n−1; x₁x_N=p semistable when E_ν/ℚ_p is unramified (LZ22 pp. 75–76) | holds | none |
| §8.4 local equations, projectivity | N=2; N=3, F⁺=ℚ | N=2 projective for every F⁺ (anisotropic at 𝔭); N=3: indefinite 6-variable form is isotropic, so not projective | holds | none |
| §8.7 tangent space, projectivity | N=2; F⁺=ℚ | Hom(rank 1, rank 1) has dimension 1; V is isotropic iff −det V is a norm from F | holds | none |
| §9.1 Tate–Dieudonné | supersingular E; ordinary E; A′=A conjugated, p split | ℓ-adic 4=4; 2≠4 without the hypothesis; Hom_K=0 versus dimension 2, so RZ96 Cor. 6.29 needs the same slope | holds | none |
| §§9.5–9.10 uniformization, quotients | g=diag(3,1/3,1); Γ={±1} | gᵀHg=H, det H=−3, gΛ₋=Λ₊, η₊∈U∩gU, so (ii) fails; −1 fixes N_n: one sheet | holds | none |
| §7.2 semi-global kernel | as in §6.7 | "order #Λ_v^♯/Λ_v" gives p^{2n} for principal λ_v | fails | R02 |
| §7.7 π-modular at u | trace scalar of π-valuation 3, F⁺_u/ℚ_p unramified | Λ^∨=π²Λ^♯; "Λ^♯=π⁻¹Λ" gives Λ^∨=πΛ, not a vertex lattice | fails | R02 |
| §3.1 Exo(n,0) | LL22 Remark 2.9 | defined at p. 11 (ι(u)−u kills Lie, ker X[ι(u)]); not in Def. 2.1 or Rem. 2.2 | locator gap | R03 |
| Downstream consumers | roadmaps grep; SelmerIwasawaCohomologyPartII line 160 | 0 roadmaps cite PELModuliPartII; the consumer contracts ShimuraVarieties for the LTXZZ22 §5.2 models | fails | R01 |

- Source locators checked against the cached texts: about 55, in 12 sources (Mih19, LZ22, Cho18, LL22, Wu16, HLSY23, Howard19, Kraemer03, RSZ21, RSZ20, LTXZZ22, RZ96). The 15 sampled targets all match apart from R02 and R03; the README flags no locator as unverified.
- Library declarations opened at the pins: 13 in Mathlib (`LinearMap.charpoly` Charpoly/Basic.lean:44, `charpoly_monic` :72, `charpoly_natDegree` :76 [StrongRankCondition], `Matrix.charpoly` :140, `Module.Grassmannian` Grassmannian.lean:66, `ghostComponent` :296, `frobenius` :218, `verschiebung` :109, `Isocrystal` :112, `IsRegularLocalRing` :52, `Smooth` :59, `SmoothOfRelativeDimension` :127, `Flat` :42) and 8 in Tau Ceti (`AbelianVariety` :95, `Grassmannian.scheme` :161, `toSpec` :166, `schemeHomEquiv` Points.lean:405, `isSeparated_toSpec`/`isProper_toSpec` Proper.lean, `Spf.carrier` :73, `Spf.structureSheaf` :262). All exist as described.
- Cross-roadmap citations resolved: 87 section ids in 17 roadmaps, on main or at their open heads; all exist with the content claimed.
- Gate: every check passes. Dependency check: `depcheck: 257 roadmaps, 2447 edges, 0 problem(s)`; the roadmap is listed at position 200, after all its suppliers.
- Elaboration: `lake env lean Suggested.lean` exits 0 with no messages. There are no declarations, so there is no `#check` comparison and no padding. The docstring names every headline as not statable, with the missing carrier, and that holds at the pin (no abelian schemes over a base, no category of formal schemes).
- Declared gaps: 4 slugs, identical in `design/plan.json` and the README. None is provided by Mathlib, Tau Ceti or another roadmap: "Landherr" has 0 hits, "multichain" has 0 hits outside this README, and the Zink equivalence appears only in PELModuli §M2.15, over characteristic p.
- Overlap check: read IgusaVarietiesAndTorsionConcentration, HilbertModularVarietiesAndShimuraCurves, PELModuli, SelmerIwasawaCohomologyPartII, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII, AbelianSchemesAndArithmeticModuli, CrystallineCohomology, GeometricSatakeAndFusionPartII; shared: PEL RZ spaces with one self-dual lattice (owner Igusa §0.27, cited), CM moduli at unramified primes (owner PELModuli §M4.7, cited and extended), relative heights (owner HilbertModular §R18.5.4, cited), LTXZZ22 §§4.2/5.2 models (no single owner, R01).
- Source independence: 22 passages compared with 13 sources; none shared beyond phrasing the definitions force. Largest share LL22, 43 of 262 source mentions. Contents compared with LL22: independent. Layers 3–4 touch only LL22 §§2.1, 2.3 and 2.8; LL22 §§2.2, 2.4–2.7, 3 and 4 have no layer.

## Not verifiable

- LTXZZ22, published pages 192–193 (§8.3): the Inventiones version is paywalled. Definition 5.2.6 and (5.2) were read on arXiv v3, p. 58.

## Source issues

- **Error** in LZ22 at §13.4, condition (3), p. 82: the source says the isogeny α: A×A₀→A♯ has degree q_{v₀}; it should have v₀-primary degree q_{v₀}², since α*λ♯=λ×u₀λ₀ with both source factors of degree q_{v₀}² and λ♯ principal; affects a stated result.
- **Misprint** in LL22 at §4.3, p. 58, and §4.5, p. 66: the source says the ramified-place Exo conditions apply to the triple of A₀; it should be the triple of A, the only factor of height 2nf; affects nothing.
- **Gap** in LL22 at §4.5, p. 66: the source calls the integral models smooth projective, citing RSZ20 Theorem 4.7; it should give a projectivity argument, since that theorem (RSZ20 p. 24) proves flatness, smoothness and semistability only; affects a stated result.
- **Error** in RZ96 at Corollary 6.29, p. 293: the source says the K-linear ℓ-adic and p-adic Hom comparisons hold when each object separately meets Lemma 6.28's isoclinic hypothesis; it should require the 𝔭-parts of both to be isoclinic of the same slope; affects a stated result.
- **Misprint** in HLSY23 at §1, p. 2: the source says the Krämer filtration F⊂Lie X has rank 1; it should be rank n−1, as in Definition 2.2(3), p. 10; affects nothing.
- **Gap** in HLSY23 at Definition 2.2(2), p. 10: the source says the framing is a height-0 quasi-isogeny with no condition on polarizations; it should require ρ*λ_𝕏 to be an O_{F₀}^×-multiple of λ, as Howard19 §2 does; affects a stated result.

## For the human reviewers

- Licence: RZ96 (Princeton Annals of Mathematics Studies 141) is read from a scan hosted on the author's Bonn page (`README.md:2095`). Whether that copy is licensed for this use is for a human to decide.
