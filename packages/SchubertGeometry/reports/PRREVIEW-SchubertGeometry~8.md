# Review of SchubertGeometry (pull request #1224 at 39437f2)

**Verdict:** needs changes

Full review of the folder at 39437f2 (187 changed lines since 0936394). One blocking finding, carried from the previous review, and one P3. This is a request for repairs before the next review, not an approval and not a merge.

## R01 (P2) — The branch still pins a Tau Ceti revision that has none of the Lakshmibai–Seshadri, crystal or Demazure files the README consumes, so the S4 headlines stay unstated

**Location:** `TauCetiRoadmap/SchubertGeometry/README.md:3`, “The finite-type Lakshmibai–Seshadri path engine is consumed from the pinned Tau Ceti, whose `TauCeti/RepresentationTheory/LSPath/` and `TauCeti/RepresentationTheory/Crystal/` files already prove…”; the From Tau Ceti contract (lines 73–336) and the *Needs:* lines of S2.3, S2.4, S3.3, S3.4, S3.6, S4.1–S4.5 and S9.5. `TauCetiRoadmap/SchubertGeometry/Suggested.lean:21–23`, “the Tau Ceti revision pinned by this folder's manifest has none of these files.”

**Claim:** The README cites these declarations as present at the pin; the Lean file says the pin lacks them. Both cannot hold at the pin this folder builds against.

**Witness:** `lake-manifest.json` on this head pins Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; main pins `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The merge base is still `fee8e0ea`. I swept all 163 backticked library names of the README (`names.txt` in my scratch): every one resolves at `2fd255d9` with the stated namespace and file (file and line for the key ones under Verified sound), and 127 of them have no declaration at `a91d3aafa`, including `RootPairing.demazureOperator`, `TauCeti.LSPath`, `TauCeti.PLPath.lower`, `TauCeti.NormalCrystal`, `TauCeti.weylDenominator`, `RootPairing.dotAlternatization` and `TauCeti.weylCoxeterSystem`. The change since 0936394 reworded the docstring (dropping “stated once the manifest pins a revision…”) and did not touch the manifest; no repair report marks the finding not actionable. This is the previous review's R01 and the one before it's R02, not repaired.

**Repair:**
1. Merge main into the branch (or rebase onto it), so that `lake-manifest.json` pins Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`. The README's names need no change: all 163 resolve there.
2. State the S4 headlines in `Suggested.lean`, each with `sorry` and no new definitions, in the hypothesis pattern of `TauCeti.LSPath.forall_raise_eq_none_iff` (`RepresentationTheory/LSPath/Highest.lean:73`): `[P.flip.IsReduced]`, `hlam : lam ∈ dominantChamber P b`, `f : M →+ V`, `F` with `F i (f m) = P.coroot' i m`.
   - Operator stability (S4.2): if `PLPath.lower (F i) (f (P.root i)) (π.toPLPath 𝕜 f) = some q` then `∃ π' : LSPath P b lam, π'.toPLPath 𝕜 f = q`, and the same for `raise`.
   - Generation (S4.3): every `π` is reached from `LSPath.straight lam` by a finite list of simple lowerings.
   - Character formula (S4.4): there is `wt : LSPath P b lam → M` with `f (wt π) = (π.toPLPath 𝕜 f).endpoint` and `weylDenominator P b * ∑ᶠ π, single (wt π) 1 = dotAlternatization P b (single lam 1)`, the ℤ[X] form the README now states.
3. Delete the sentence “the Tau Ceti revision pinned by this folder's manifest has none of these files” from the S3 and S4 docstring items; keep the unstatable list for S1–S3 (geometric part), S5–S9, which is right at both pins.

**Retest:** `grep -rn "def demazureOperator" .lake/packages/TauCeti/TauCeti` in the worktree hits `LinearAlgebra/RootSystem/Weyl/Demazure/Basic.lean:81`; `lake env lean` on the new `Suggested.lean` reports only `sorry` warnings.

## R02 (P3) — S4.7 defines the opposition dictionary with no API bullets and no Checks

**Location:** `TauCetiRoadmap/SchubertGeometry/README.md:1122–1126`, “Print the opposition/dual dictionary. Set κ=−w₀λ and θ(w)=w₀ww₀ … The point and longest-word tests must recover the single fibre λ and the full ∇λ.”

**Claim:** S4.7 introduces a definition (κ, θ, the transport of path indices from the positive-Borel X(θ(w)) to the chosen X(w), the weight rule −w₀π(1)) and names two tests in prose. Every other definition in the README carries API bullets and a **Checks.** list of at least three items; this one has neither, and the wall case, where the dictionary is most easily misapplied, is not tested.

**Witness:** Lines 1122–1126 contain no bullet. The sibling S3.2 Check (line 816) already computes the wall instance the dictionary must reproduce: GL₃, λ=ω₁, X(s₂) has a one-dimensional section space.

**Repair:** Add the bullets and a **Checks.** list to S4.7:
- API: the transport π↦(initial direction of π ≤ θ(w)) is computed in W/W_κ after projecting; the section weight on X(w) is −w₀π(1); the dictionary commutes with the minimal-coset projection W/W_P→W/W_λ.
- Checks: (i) w=e: θ(e)=e, only the straight encoding of B(κ) has initial direction ≤ e, of weight −w₀κ=λ, the fibre of S3.2. (ii) w=w₀: every π∈B(κ) survives, and {−w₀π(1)} is −w₀·wt V(κ)=wt ∇(λ). (iii) GL₃, λ=ω₁, w=s₂: κ=ω₂, θ(s₂)=s₁, W_κ=⟨s₁⟩, so of the three encodings of B(ω₂) (initial cosets e, s₂, s₁s₂, all minuscule) only the straight one has initial direction ≤ s₁ in W/W_κ: one section, as S3.2 computes; comparing the untransported index s₂ instead admits the cosets e and s₂ and gives two sections, which is wrong since L(ω₁) has degree 0 on X(s₂).

## Previous findings

| Previous finding | Status at 39437f2 | Evidence |
|---|---|---|
| r7 R01 (P2), pin lacks ~130 natives, S4 unstated | not repaired | manifest unchanged (Tau Ceti `a91d3aafa`); sweep 127/163 absent; `Suggested.lean` declares nothing. Now R01. |
| r7 R02 (P3), three locators | repaired | S4.7 (line 1124) cites LLM §3.1, Proposition 14, p. 312, line 809, and the §4.1 dual embedding, line 946: read, both state what is cited (page 20 of the copy = printed 312). S1.1 (line 504) cites BrionFlags §1.2 lines 256–258 (partial flags in the product of Grassmannians), 266–272 (forgetful fibration with fibre a product of complete flag varieties) and Example 1.2.3(5) lines 345–354 (x₁y₁+⋯+xₙyₙ=0): read, correct, pp. 7 and 9–10. S3.5 (line 885) states the every-characteristic target with Ramanathan1987 Theorem 3.11(i) line 950 (p. 86), Remark 2.4 line 490 (p. 73), Theorem 3.5(ii) line 803 (p. 82) and the simply-connected standing hypothesis at line 750: read, all as described. |
| r7 R03 (P3), Weyl formula with e^{wρ} | repaired | S4.4 (lines 1045–1060) now states Δ·char B(λ)=J(e^λ) in ℤ[X] and derives char B(λ)=D_{w₀}(e^λ); the three Checks recomputed below. Native `TauCeti.weylDenominator` (`Weyl/Denominator/Basic.lean:72`) is ∏_{α>0}(1−e^{−α}) and `RootPairing.dotAlternatization` (`Weyl/Denominator/Integral.lean:209`) is Σ_w sgn(w)e^{−(ρ−wρ)}w(f), with `dotAlternatization_one` at `:288` and `weylDenominator_mul_prod_map_demazureOperator` at `Demazure/LongestElement.lean:135`, exactly as lines 161–171 describe. |
| r7 R04 (P3), contracts, link, consumers | repaired | One `### From TauCetiRoadmap.<X>` subsection per supplier (lines 338–431), including AlgebraicTopology Stage 5 item 3, MorseTheory M2 and HamiltonianReduction R2a with what is assumed; link at lines 425 and 1638 is `../SymplecticGeometry/HamiltonianReduction/README.md` (R2a at its line 157 on main); Downstream consumers (lines 1824–1838) names KacMoody §§5.4, 6.4, 7.2–7.3 (main lines 920, 1016, 1072, 1092), QuantumEnvelopingAlgebras §8.2 (line 1173; its contract at 187–191 consumes S4 and S7), CharacteristicClasses C5a (line 1420; consumption at 1668 and 1722) and FlagVarieties §6.1 (line 263; consumption at 265 and 272). |
| r6 R01 (P2), IndexTheory upward | repaired, stands | `IndexTheory` occurs only in the scope paragraph (lines 46–47) as the placement of a Part II; depcheck 0 problems. |
| r5 R01 (P3), source manifest | repaired, stands | `packages/SchubertGeometry/sources.toml` lists 17 records; Steinberg1975, Pittie1972, Jantzen, MehtaRamanathan1985 uncertified. |

## Verified sound

**Scope and gate.** The diff against origin/main outside the folder is empty. The worker's gate at 39437f2 is zero on every check (build, stray-files, readme-ids, depcheck, dropped, round-labels). My run of the brief's dependency check printed:

    depcheck: 244 roadmaps, 2465 edges, 0 problem(s)

SchubertGeometry is on main, so it has no merge-order line; every supplier it cites is on main (ModularCurves, ReductiveGroups, GroebnerGeometry, SchemeAndStackFoundations, StableReduction, AlgebraicVectorBundles, TopologicalKTheory, RepresentationTheory/LieGroups, ComplexKahlerGeometry, RealAnalyticGeometry, AlgebraicTopology, MorseTheory, SymplecticGeometry/HamiltonianReduction, ReflectionInvariantTheory, CharacteristicClasses). `lake env lean TauCetiRoadmap/SchubertGeometry/Suggested.lean`, run from the worktree, exits 0 with no output in 6 s. The file has `import Mathlib`, one module docstring and an empty namespace: no declaration, no `set_option`, no sorry'd data, no fully qualified name that could collide, nothing to probe with one tactic. The README has no LaTeX delimiters, no process words, no pull-request numbers and no machine paths (grep for “so far”, “current”, “removed”, “round”, “pull request”, `#NNNN`: no hit).

**Headline theorems** (ten families, as in the previous review): S1 relative Par_t(G) and flag incidence; S2/S5.7 the all-word image X(δ(Q)) and O≃Rπ_*O; S3.4 Demazure's and Weyl's character formulas for ∇(λ) in every characteristic; S4 operator stability, generation, character formula and tensor rule; S5 compatible splitting, normality, vanishing with restriction surjectivity; S6 all-degree standard monomial bases; S7 Chevalley divisor formula and Chow comparison; S8 K₀(G/B−)≅R(T)⊗_{R(G)}ℤ and its equivariant form; S9.0 proper GAGA with nilpotents; S9.7 moment–Morse comparison. At the branch pin none is statable, and the docstring lists each with the missing carrier. At main's pin the S4 family is statable on native carriers (R01); the others still lack a flag, Bott–Samelson, splitting, K-ring or analytic-space carrier at `2fd255d9` (grep of that tree for `Schubert`, `BottSamelson`, `FrobeniusSplit`, `AnalyticSpace`: no carrier; the only “Frobenius split” hit is a docstring in `NumberField/Quadratic/Frobenius.lean`).

**Library declarations opened at main's pin `2fd255d9`** (file:line under `TauCeti/`):
- `RootPairing.demazureOperator` `LinearAlgebra/RootSystem/Weyl/Demazure/Basic.lean:81`; `prod_map_demazureOperator_eq_of_wordProd_eq` `Demazure/Braid.lean:707` (`[P.IsReduced]`); `weylDenominator_mul_prod_map_demazureOperator` `Demazure/LongestElement.lean:135`, hypotheses a reduced word ω with every simple reflection a left descent of its product, conclusion `weylDenominator P b * (ω.map (demazureOperator P)).prod f = dotAlternatization P b f`.
- `TauCeti.weylDenominator` `Weyl/Denominator/Basic.lean:72`, `∏ i ∈ posRootsFinset P b, (1 − single (−P.root i) 1)`, with the docstring noting that the symmetric form needs α/2. `RootPairing.dotAlternatization` `Weyl/Denominator/Integral.lean:209`, `∑ w, weylSign w • dotReindex w`, with the docstring's ρ−wρ=Σ_{β>0,w⁻¹β<0}β; `dotAlternatization_one` `:288`.
- `TauCeti.LSPath` `RepresentationTheory/LSPath/Basic.lean:101`: fields `dir` (minimal coset representatives of `wallIndices`), strictly increasing `time` from 0 to 1, `dir_succ_ne`, `exists_isAChain`; `LSPath.finite` `:390` (dominant λ); `toPLPath_injective` `Realization.lean:96`; `forall_raise_eq_none_iff` `Highest.lean:73`; `centralTransport` `Central/Transport.lean:113`; `stretch` `Stretch.lean:75`; `exists_uniform_subdivision` `Subdivision.lean:156`; `PLPath.lower_mul` `Concatenation.lean:116`; `PLPath.lower_straight` `RootOperator.lean:749`; `PLPath.evalTimed_mem_convexHull_orbit_weylGroup` `ConvexHull.lean:130`.
- `NormalCrystal.tensor` `Crystal/Tensor.lean:89`; `formalCharacter` `Crystal/Character.lean:38`.
- `RootPairing.wallIndices` `Weyl/ParabolicQuotient.lean:105` and `parabolic_wallIndices_eq_stabilizer` `:135` (both `_root_`); `reflectionBond_pos_of_minimalCosetRepCovBy` `Weyl/CoverBond.lean:152`; `bondGcd_eq_intervalBondGcd` `Weyl/IntervalBondGcd.lean:297`; `isAChain_iff_forall_coroot'` `Weyl/ChainBond.lean:339`; `IsAChain.exists_isAChain_simple_mul_last` `Weyl/ReflectedChain.lean:257` and `_head` `:308`; `CoxeterSystem.MinimalCosetRepChain.length_last_add_length` `GroupTheory/Coxeter/ChainProperty.lean:165`.
- Mathlib `1b1ccf4b`: `SymplecticGroup.mem_iff'` `LinearAlgebra/SymplecticGroup.lean:186` (`Aᵀ * J * A = J`), `Matrix.J`, `Module.Grassmannian`, `Module.Basis.flag`, `RootPairing`, `RootPairing.Base`, `RootPairing.weylGroup`.
The full sweep of 163 names is in my scratch `sweep.txt`: 0 missing at `2fd255d9`, 127 missing at `a91d3aafa` (R01).

**Cross-roadmap citations resolved on main (3b3f7ef):** ModularCurves §0G (line 427: relative Grassmannian, charts, gluing, universal property); ReductiveGroups Layers 7, 7b, 7C, 8, 9, 10 (lines 627, 732, 652, 1023, 1092, 1731); GroebnerGeometry G5 (394); SchemeAndStackFoundations §§2.2, 2.6, 4.12, 5.7 (3309, 3437, 5613, 6987); StableReduction Layer 2 (405; its bullet at 438–439 builds relative Proj of a finitely generated graded quasi-coherent algebra) and Layer 4 (529; Rees algebra and blowup at 531); AlgebraicVectorBundles L2A (306; graded quasi-coherent algebras at 308–317, “shared input interface for StableReduction Layer 2's relative Proj” at 323); TopologicalKTheory T1 item 5 (`finiteGrassmannian`, lines 66–72); LieGroups Layers 6 and 8 (383, 428); ComplexKahlerGeometry K3, K4 (296, 444); RealAnalyticGeometry R3.2 (728); AlgebraicTopology Stage 5 item 3 (849; transfer with `p_* transfer = d·id` at 871 and `transfer p_* = Σ g_*` with the invertibility caveat at 880–899); MorseTheory M2 (144); HamiltonianReduction R2a (157; items 1–4 give f_X, df_X=ι_{X_O}ω, Crit=Wμ for regular X, the root-plane J_α with ω_p(v,w)=B(J_αv,w)/α(p), the index 2ℓ(w) in the negative chamber and the finite even-cell model, as the contract at lines 423–431 says); ReflectionInvariantTheory §§1–3; CharacteristicClasses C5 and C5a. Consumers: KacMoody (contract at 172–177 names S4's bond, interval gcd, convexity and typed central translation and S7's coefficient), QuantumEnvelopingAlgebras (187–191), CharacteristicClasses (1668, 1722), FlagVarieties (37, 51, 265, 272).

**At open heads:** GeometricQuantization #1186 (contract at line 243 consumes S9.1/S9.7; §§3.3–3.4 at 689 and 745 own the ordinary holomorphic Picard group, matching lines 36–41 here); TensorProductCombinatorics #1107 (§8.3 at 2277 and Layer 6 at 1707 consume S4.1–2 and S9.5); SpringerResolutionAndCharacteristicCycles #1828 (contract at line 104 consumes S1 and S2.3 with the opposite-Borel transport); ReductiveGroups #1332 keeps the Layer 7–10 ids. `roadmaps overlaps` reports no other pull request changing this folder and no dropped id in either direction.

**Ownership.** `roadmaps grep` (fixed, case-insensitive, READMEs) over main and the 478 open heads: Demazure characters appear only here and on main; LS paths only here, on main (KacMoody, a consumer) and in ShimuraData #1038; standard monomials only here, on main, and as polynomial normal forms in GroebnerGeometry (which S6.2 consumes); flag K-rings nowhere else; Bott–Samelson in DGFloerPartII and TensorProductCombinatorics as consumers. Two open pull requests restate objects this roadmap owns: ShimuraData #1038 §3.8 constructs Par_t(G) for a reductive group scheme over S (`parabolicTypeVariety`) and §§3.14–3.16 the integral Bruhat stratification, Schubert loci and Bruhat closure criterion, without citing SchubertGeometry; ComplexComparisonPartII #848 C1.9 states proper coherent GAGA, as S9.0 does. Main's own SchubertGeometry cites ShimuraData §3.8 (its line 21), which is an upward citation from a main roadmap to an open pull request, and the move of Par_t(G) into S1.0 is the sanctioned repair recorded in earlier rounds; the same holds for S9.0 against ComplexComparisonPartII (tested in the previous review: adding the citation produces an UPWARD line). SchubertGeometry is the earlier owner in both cases, so the citation belongs on the other pull request's side; SpringerResolution's scope (its line 10) names ShimuraData for the same objects and will have to follow. Not a finding against this folder. ReductiveGroups at the brief's `rev/1808` path has no folder; I checked the #1332 head instead.

**Seeded sample, read at the locator.**

| Target | Locator read | What the source says / result |
|---|---|---|
| S1.0 Par_t(G) | ConradReductive lines 2993–2998 (Thm 2.3.6, p. 72), 6512–6518 (Cor 5.2.8, p. 155), 6551–6556 (Cor 5.2.9, p. 156), 6011–6016 (Thm 5.1.13, p. 143) | G/H represented by a smooth S-scheme, quasi-projective Zariski-locally, when H=N_G(H) with connected fibres; P=N_G(P); Par_{G/S} smooth proper with ample det(Lie P)*; ∏U_{a_i}→G onto U_{Φ+} for split (G,T). As stated. |
| S1.2 dictionary | same Conrad locators; quotient universal property | deduction; cells from 5.1.13 and field Bruhat. |
| S1.3 pivots | BrionFlags lines 157–185 (Def 1.1.2, p. 4; dimension |I|=Σ(i_j−j), p. 5) | matches Σ(p_i−i). |
| S1.4 determinantal | no source; Mathlib exterior powers | deduction. |
| S3.5 embeddings | BrionFlags lines 549–552, 562–568, 653–654; Ramanathan1987 lines 950–955, 490–493, 803, 750 | Thm 3.11(i): for L on G/Q with H⁰≠0, ⊕SᵐH⁰(X,L)→⊕H⁰(X,Lᵐ) surjective with quadratic kernel, in every characteristic (reduction to p>0 at 960); Remark 2.4: surjectivity for large m makes an ample M very ample; 3.5(ii) splits the diagonal; 3.1: G simply connected semisimple, k algebraically closed. The README's descent to a non-closed k and to a non-simply-connected G is stated as its own target. |
| S4.3 chains | CFL lines 188–196 (Def 2.1, p. 4), 955–962 (§7.1, p. 18); Littelmann1995 lines 502–526 (Prop 4.7, Cor 2–3, pp. 511–512) | bond b_λ(σ,σ')=⟨σλ,β∨⟩ for σ'=s_βσ covering σ, chain-independent gcd; README's b_λ(x,y)=⟨yλ,β∨⟩ with y the smaller element agrees; Cor 3: π_λ the only path killed by all e_α, every path f_{α₁}⋯f_{α_r}π_λ. |
| S5.1 trace | Ramanathan1987 lines 193–200 (Def 1.1, p. 65), 360–375 (§1.16, p. 70), 392–400 (Lemmas 1.18–1.19, p. 71) | (F_*L)*≅F_*(L*⊗K^{1−p}); order p−1 criterion in k[[t]]; compatibility via a^{p−1}σ. |
| S6.1 section algebras | StableReduction Layer 2 lines 438–439 on main | relative Proj of a finitely generated graded quasi-coherent algebra is a target there. |
| S6.4 standard products | LLM lines 263–267 (Thm 4, p. 299), 338–342 (Thm 6, p. 301) | standard monomial basis of V*_{i,m}; H⁰(Z_i,L_{i,m})≅V*_{i,m}, Hⁱ=0 for i≥1, projective normality. |
| S8.1 K₀/G₀ | BrionFlags line 1374 (§3.3, p. 38) | ϕ:K⁰→K₀ an isomorphism for nonsingular X. |
| S8.4 isogeny types | Steinberg1975, Pittie1972 | uncertified; cited by locator only. |
| S9.1 specializations | SGA1 lines 9399 (XII 1.1), 9738–9742 (4.2), 9801–9806 (4.3, 4.4) | representability of Xᵃⁿ; (R^pf_*F)ᵃⁿ→R^pfᵃⁿ_*(Fᵃⁿ) iso for proper f; equivalence of coherent categories for proper X. |
| S9.5 type A | natives only (`diagonalRootDatum`, `centralTransport`) | at `2fd255d9`. |
| S9.6 normalizer | KnutsonSymplectic lines 131–140 (§4, p. 4); AlgebraicTopology main lines 871–899 | K/N(T) has rational cohomology ℚ in degree 0 only, via the |W|-cover and even cells; transfer identities with invariants only when |G| is invertible. |
| S9.7 moment–Morse | KnutsonSymplectic lines 24–40 (§1), 53–56 (§2), 80–94 (§3); HamiltonianReduction R2a items 1–4 | KKS form; ι_Xω=−dΦ_X; Φ_X Morse with even indices; R2a's df_X=ι_{X_O}ω with the sign comparison ξ_source=−ξ_O recorded there. |

**Adversarial table.** Every value below was computed this round: by script (`py/a2.py` in my scratch) for S3.6, S3.4's longest word and the S4.4 rank-one identities, by hand for the rest.

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| S1.0 canonical line | GL₂ over ℤ, Borel scheme ℙ¹ | det(End E)=O; 0→Lie B→End E→Hom(L,E/L)→0 with L=O(−1), E/L=O(1): Hom=O(2); det(Lie B)*=O(2), degree 2; weight-one line degree 1 | pass |
| S1.0 Borel of ℍ | adjoint group of (−1,−1)/ℝ | conic x²+y²+z²=0, norm form of pure quaternions; no real point, ℙ¹ over ℂ | pass |
| S1.0 cells | GL₃/𝔽₂; ℙ² | lengths 0,1,1,2,2,3: 1+2+2+4+4+8=21=168/8; 1+2+4=7 | pass |
| S1.1 incidence | rank 3, ranks (1,2); k[ε] | ℙ²×ℙ²* dim 4, flag dim 3; F₁→E/F₂ sends e₁+εe₃ to ε·ē₃≠0 | pass |
| S1.3 pivots | Gr(2,4): (1,2),(1,3),(3,4); N=0 | Σ(p_i−i)=0,1,4; λ=(2,2),(2,1),(0,0), 4−|λ| agrees; rank 0 point, rank 1 empty | pass |
| S1.5 Gram | columns (u_{1..r}; u_{r+1..m}, f_{r+1..m}; f_{1..r}), Q(u_i,f_j)=H_{i,m+1−j}=δ_{ij} | blocks (1,3)=I_r, (3,1)=−I_r, (2,2)=J₀ | pass |
| S1.5 product/inverse | r=s=1, Y=(1,2), Y′=(3,4), Z=5, Z′=6 | YᵀJ₀Y′=4−6=−2; product ((4,6),9), reversed sign 13; Z+(−Zᵀ)−YᵀJ₀Y=0 | pass |
| S1.5 conjugation | l=diag(A,D,A^{−T}) | (1,2) block A·YᵀJ₀·D⁻¹=AYᵀDᵀJ₀ by DᵀJ₀D=J₀; (2,3) DYAᵀ; (1,3) AZAᵀ; l symplectic for J_{(r,s)} | pass |
| S1.5 dimension | m=2: r=1,2,3 | 3, 3, empty; Levi+radical: (1+3)+(2+1)=7, (4+0)+(0+3)=7, 10−7=3 | pass |
| S2.3 weights | Q=i; Q=ii | β=±α_i; fibres λ, s_iλ; δ(ii)=max(s_i,e)=s_i; sections ε↦e,s_i,s_i,e | pass |
| S2.5 kernel | SU₂×U₁→U₂ | {(I,1),(−I,−1)}, size 2 | pass |
| S3.1 sign | SL₂, λ=1; GL₂ det | degree ⟨λ,α∨⟩=1; det restricts to degree ⟨det,α∨⟩=0 | pass |
| S3.2 dual weight | B− acting on ev_e | (b·ev_e)(f)=f(b)=λ(b)⁻¹f(e): weight −λ; X(e) dual weight −1 for SL₂ λ=1 | pass |
| S3.3 D_i strings | m=0,−1,−2 | e^λ; 0; −e^{λ+α} (augmentations 1,0,−1) | pass |
| S3.3 Δ_i=ιD_iι | m≤0, m=1, m≥2 | Σ_{j=0}^{−m}e^{λ+jα}; 0; −Σ_{j=1}^{m−1}e^{λ−jα}; (1−e^α)Δ_i(p)=p−e^αs_ip; s_iN=−e^{−α}N | pass |
| S3.6 word 121 | χ₀=e^{(0,5,7)} | augmentations 1,6,33,81; χ₁,χ₂ multiplicity-free | pass |
| S3.6 coefficient formula | 46 weights | 1+min{2,a,b,c,7−a,7−b,7−c}=χ₃ coefficientwise; histogram 21/15/10; (4,4,4)↦3; (9,3,0): χ₃=0, formula −1 | pass |
| S3.6 word 212 | ψ₁..ψ₃ | 1,3,21,81; ψ₃=χ₃; Δ₁χ₃=Δ₂χ₃=χ₃; S₃-invariant | pass |
| S3.6 Gelfand–Tsetlin | 7≥u≥5≥v≥0, u≥w≥v | 81 patterns, multiplicities equal χ₃ coefficientwise | pass |
| S3.4 longest word | D₁D₂D₁e^{(7,5,0)} (native convention) | equals χ₃ | pass |
| S4.1 shift obstruction | φ(1/2)=1/4, χ=(1,1) | (1/4,0)+(1/2,1/2)=(3/4,1/2): x−2y=−1/4; canonical (1,1/2): 0 | pass |
| S4.2 lowering | SL₂ shape 2 | straight→(s₁,1;0,1/2,1), endpoint 0→(s₁;0,1), endpoint −2; cut times per Prop 4.7(a) | pass |
| S4.2 central path | GL₂ (t,t) | height ⟨(t,t),α∨⟩=0; strings 0 | pass |
| S4.3 connectedness route | τ₀≠e | τ₀λ not dominant ⇒ some ⟨τ₀λ,α_i∨⟩<0 ⇒ min H_i<0 ⇒ e_i defined; top of string has first direction s_iτ₀<τ₀ | pass |
| S4.3 bond 2 | a=1/2, 1/3 | 2·(1/2)=1; 2·(1/3)=2/3; three encodings; break 1/3 would add two: five | pass |
| S4.3 bond sign vs CFL | x>y=s_βx | README −⟨xλ,β∨⟩=⟨yλ,β∨⟩; CFL ⟨σλ,β∨⟩ with σ smaller: agree | pass |
| S4.3 transport laws | T(λ,χ;σ) | composite B(λ)^{σ+χ+ψ}→B(λ+χ+ψ)^σ types match T(λ,χ+ψ;σ); inverse T(λ+χ,−χ;σ+χ) | pass |
| S4.4 PGL₂ | X=ℤα, λ=α | Δ·char=(1−e^{−α})(e^α+1+e^{−α})=e^α−e^{−2α}; J(e^α)=e^α−e^{s(α+ρ)−ρ}=e^α−e^{−2α}; e^{α/2}∉ℤ[ℤα] | pass |
| S4.4 SL₂ | X=ℤω, λ=ω | (1−e^{−2ω})(e^ω+e^{−ω})=e^ω−e^{−3ω}=J(e^ω); ×e^ω: e^{2ω}−e^{−2ω} | pass |
| S4.4 λ=0 | nonempty W | J(1)=Δ ⇒ char B(0)=1; Σ sgn(w)=0 would give 0; PGL₂ unshifted at α: e^α−e^{−α}≠e^α−e^{−2α} | pass |
| S4.4 ρ−wρ | w=s_i | ρ−s_iρ=α_i=Σ_{β>0,s_iβ<0}β | pass |
| S4.4 domain step | ℤ[X], X free | Laurent polynomial ring, Δ≠0: Δ·char=Δ·D_{w₀}(e^λ) ⇒ char=D_{w₀}(e^λ) | pass |
| S4.4 adjoint | sl₃ matrix units | [E₁₂,E₂₁]=H₁; [E₁₃,E₃₁]=H₁+H₂; [E₁₂,H₁]=−2E₁₂, [E₁₂,H₂]=E₁₂; determinants of (H₁),(H₂),(H₁+H₂) in basis (H₁,H₂): 1,1,−1 | pass |
| S4.7 wall (R02 check) | GL₃, λ=ω₁, w=s₂ | κ=ω₂, θ(s₂)=s₁, W_κ=⟨s₁⟩; initial direction ≤ s₁ in W/W_κ: only e: 1 section = deg-0 line on X(s₂); untransported s₂: 2 | pass for the dictionary; motivates R02 |
| S5.1 trace | char 2, k[x] | Tr(1)=0, Tr(x)=1, Tr(x³)=x; σ=Tr(x·): σ(1)=1, σ(x²)=x vs x²; n=0: c^{1/p} | pass |
| S5.2 ideals | σ=Tr(x·) | σ(x·x^a)=x^{(a+1)/2}∈(x) for odd a, 0 otherwise; σ(x²)=x∉(x²) | pass |
| S5.3 kernel | SL₂→PGL₂, char 2 | μ₂=k[u]/(u²−1)=k[u]/((u−1)²), nonreduced | pass |
| S5.5 mixed union | ℙ¹, Y={0,∞}, λ=0 | H⁰(O_Y)=k², diagonal k→k², H¹(I_Y)=H¹(O(−2))=k | pass |
| S5.7 Q=ii | L=O(−2) | source ℙ¹-bundle over ℙ¹; H⁰=0, H¹=k both sides | pass |
| S6.4 SL₂ | degree 2 | three products x²,xy,y² vs 4; at [1:0] only x² survives | pass |
| S7.1 covers | GL₃, ω₁, w=s₁s₂ | v=s₁: β=α₂, ⟨ω₁,α₂∨⟩=0, both weights ε₂; v=s₂: s₁s₂s₁s₂s₁=s₂, β=α₁+α₂, coefficient 1, cover ε₂>ε₁ | pass |
| S7.1 non-cover | w=s₂s₁ | v=s₂: β=α₁, coefficient 1, ε₃>ε₁ through ε₂; v=s₁: β=α₁+α₂, wβ=−α₂, γ=α₂, bond −⟨ε₃,α₂∨⟩=1 | pass |
| S7.1 bond sign | v=ws_β<w | wβ<0, γ=−wβ>0, −⟨wλ,γ∨⟩=⟨λ,β∨⟩ | pass |
| S7.1 ρ | w=s₁s₂, λ=ρ | 1 on X(s₁), 2 on X(s₂) | pass |
| S7.2 cone | Gr(2,4), X_(1) | p₃₄=0 and p₁₃p₂₄=p₁₄p₂₃ in ℙ⁴, vertex p₁₂; p₂₄=0 ⇒ p₁₄p₂₃=0: X_(2) (p₂₃=p₂₄=p₃₄=0) ∪ X_(1,1) (p₁₄=p₂₄=p₃₄=0); λ=(1,0), dim 3; X_(2,1) pivots (1,3), λ=(2,1), dim 1 | pass |
| S8.1 classes | ℙ¹; Gr(2,4) | [O_e]=[O]−[O(−1)], rank 0, χ=1; six cells, rank 6 | pass |
| S8.2 | SL₂, t=[O(−1)] | (1−t)²=0 ⇒ t(2−t)=1, [O(1)]=2−t | pass |
| S8.3 | SL₂, z | 1⊗z: z at e, z⁻¹ at s; z⊗1: z,z; P=G: R(T) | pass |
| S8.4 | PGL₂, u=[O(1)]−1 | [O(2)]=(1+u)²=1+2u; image ℤ+2ℤu misses u; over ℚ u=([O(2)]−1)/2 | pass |
| S8.5 | ℙ¹ | χ(O)=1, χ(O(−1))=0, χ(O(−2))=−1 | pass |
| S9.0 base change | ℙ¹ over ℂ[t], class t | RΓ(E)=[A→A] by t; H⁰=0, H¹=A/t; at t=0 H⁰=ℂ | pass |
| S9.0 dual numbers | Spec ℂ[ε]/(ε²) | H⁰ basis 1,ε both sides; R¹π_*O(−2)=O over ℂ[s] | pass |
| S9.5 | GL₂ (t,0) | height t; f: s_α(t,0)=(0,t), endpoint (0,1); +(1,1): (2t,t), endpoint (2,1) | pass |
| S9.6 | SU₂; SU₃; torus | S²/antipodal=ℝP²: H⁰=ℤ, H¹=0, H²=ℤ/2; χ=2/2=1, 6/6=1; point | pass |
| S9.7 Kähler form | J_flag=sign(α(p))J_α | ω(v,J_flag w)=sign(α(p))B(J_αv,J_αw)/α(p)=B(v,w)/|α(p)|>0 | pass |
| S9.7 gradient | g=ω(·,J·) | g(JX_O,w)=ω(X_O,w)=df_X(w) ⇒ grad f_X=JX_O; indices 2ℓ(w) negative chamber, dim−2ℓ(w) positive (R2a item 3) | pass |
| S9.7 ℙ¹ | regular; central X | indices 0,2: 1+q², χ=2; constant height, critical set ℙ¹ | pass |
| S9.8 | SL₂/B−; torus | O(1), degree +1; characters 0,1 one ordinary line | pass |
| Worked: incidence flag | v=(a,b,c), ω | v∧ω=(ax+by+cz)e₁₂₃; trace of u↦v⊗(u∧ω) is v∧ω; dim sl₃⊗det=8, weights (2,1,0) and dual (0,−1,−2) | pass |
| Worked: blowup 121 | V=k³, P₀ | fibre over (L,P) with P≠P₀ is the point P∩P₀, over P=P₀ a ℙ¹; C=ℙ(P₀) codim 2; N=T_{P₀}B⊗O_C rank 2 trivial; E=ℙ¹×ℙ¹; charts v=ur, u=vs, rs=1 | pass |
| Worked: fixed plane | n=4, k₀=2 | d∈{0,1,2}: 3=min(2,2)+1; Z₀=Gr (no 3-minors) | pass |
| Contract: tie rule | native `lower_mul` | lowering on p iff ε(q)<φ(p), on q when φ(p)≤ε(q): as line 1045 | agree |
| Contract: Demazure longest | native `:135` | Δ·D_{w₀}f=Σ sgn(w)e^{−(ρ−wρ)}w(f): as lines 161–171 | agree |

**Overlap facts.** `scratch/overlaps.md`: no open pull request changes this roadmap, no cited id is dropped by an open pull request, no id this pull request drops is cited elsewhere; closest roadmaps by vocabulary (TensorProductCombinatorics, RootSystems, ReductiveGroups, SpringerResolution) checked above: consumers or disjoint owners.

**Checks and shape.** Every definition except S4.7 (R02) carries API bullets and at least three Checks; every layer ends with Examples and Dependencies; every target cites a locator or names its route as a deduction. The *Needs:* lines of S1.0–S9.8 cite only main roadmaps, native declarations (resolved above) and earlier layers; S1.4 and S2.3 cite S5.6 for the closure comparison only, which the How-to-read paragraph orders after S5 (not a cycle at the target level: S5.6 needs S1.0 and S2, not S1.4 or S2.3's closure clause).

## Not verifiable

- Steinberg1975, Pittie1972, Jantzen and MehtaRamanathan1985 are uncertified and cited by locator only; no text read.
- LLM Proposition 14 (line 809): the OCR reads the condition as “w>τ₁”; the README's “initial direction at most w” is the mathematically forced reading (the extremal chain (w;0<1) must index v_{wλ}∈V_λ(w)). I could not tell OCR loss from print.
- LLM printed pages: read in the author copy; the README's +292 page map (Theorem 4 p. 299, Theorem 6 p. 301, Proposition 14 p. 312, §4.1 pp. 314–315) is self-consistent; not compared with the journal typesetting.
- KnutsonDemazure §4.0.2: the diagram entries are unreadable in the OCR; S3.6 derives its formula from the signed strings, which I recomputed.
- KnutsonBorelWeil, KnutsonBottSamelson and the SerreGAGA locators were outside this round's sample and not re-read.
- Open pull requests without files in the brief (ShimuraData #1038, ComplexComparisonPartII #848): read only through `roadmaps show`.
- ReductiveGroups at the brief's `rev/1808` path: no folder there; the #1332 head was checked instead.

## Source issues

- **Misprint** in BrionFlags at Proposition 1.1.3, printed p. 5 (lines 188–191): the source counts the indices with i_k strictly less than j in both the cell and the closure conditions; it should be i_k ≤ j, since E_I itself meets ⟨e₁,…,e_j⟩ in #{k: i_k ≤ j} dimensions; affects a stated result (as read in the OCR copy; the previous review recorded the same).
