# Review of AlgebraicModularFormsAndSerreWeightsPartII (pull request #1822 at c6dbce7)

**Verdict:** needs changes

Three findings, all P3. The gate passes, the dependency check shows no UPWARD or CYCLE line, the mathematics of every sampled target and of the one Lean statement checks out by computation, and every cross-roadmap citation resolves. The findings are a declaration-form defect in the eight supplier gaps, a two-owner state with an open sibling pull request, and one locator that silently corrects its source.

## R01 (P3) — Gap contracts are not written in the form the intake reads

Location: `TauCetiRoadmap/AlgebraicModularFormsAndSerreWeightsPartII/README.md` lines 91, 99, 101, 103, 109, 115, 117, 119 ("What ShimuraCompactifications must provide (the Siegel parahoric models contract): …" and the seven analogous sentences), and the `*Needs:*` lines that cite them as "ShimuraCompactifications Layer 7 (the Siegel parahoric models contract)" (for example lines 271, 289, 307, 444, 920, 938, 965, 1010, 1347).

Claim: the eight gaps are declared in `design/plan.json` under the slugs `siegel-parahoric-models`, `siegel-rank-one-deformations`, `siegel-isogeny-trace-ideals`, `siegel-logarithmic-de-rham`, `open-formal-milnor`, `lci-fundamental-class`, `reduced-section-propagation`, `siegel-igusa-full-frames`, but none of these slugs occurs anywhere in the README; the contracts are labelled by prose titles instead.

Witness: `grep -c "gap:" README.md` gives 0; `plan.json` lists the eight slugs above. On main the convention is the slug, for example `TauCetiRoadmap/FlagVarieties/README.md` line 57 "What ReductiveGroups must provide (gap:borel-conjugacy-connected): …" and line 199 citing `gap:borel-conjugacy-connected` in a dependency line.

Repair: in each of the eight contract sentences replace "(the … contract)" by "(gap:<slug>)" with the matching slug from `plan.json`, and in every `*Needs:*` and `### Dependencies` line replace the parenthetical title by the same `gap:<slug>` reference (for example "ShimuraCompactifications Layer 7 (gap:siegel-parahoric-models)"). The needs sentences themselves are unchanged; I compared the parahoric-models sentence with the plan entry and they agree verbatim.

## R02 (P3) — The same objects are built by an open sibling pull request that does not cite this roadmap

Location: README line 1359 (Downstream consumers: "GSp4NonregularModularityLifting consumes the secondary Hasse geometry of Layer 3, the theta operators and injectivity theorems of Layer 8 and the oriented neighbor reciprocity of §6.3, by section") and the Scope and ownership section, lines 7–15, which does not record this ownership.

Claim: GSp4NonregularModularityLifting at the head of its open pull request builds these objects itself and names this roadmap nowhere.

Witness: `TauCetiRoadmap/GSp4NonregularModularityLifting/README.md` at the head of pull request #1817, §3.2 "Secondary Hasse geometry" (line 630: the same height-four BT₁ recipe, v^(p−1), Cartier-dual determinant, (p+1)-st power of the multiplicative Hasse section, normal-base extension, and "The section and extension theorem … are the new targets here"), §4.1 "Formal operators" (U, Z, Z₂, X₂), §4.2 "Theta operators with corrected weights" (line 752: scalar Θ with multiplier det Q, injectivity for 2≤k≤p+1, p∤k(2k−1), k≠p−1; vector theta), §4.4 (Q₂=Z₂ for j>2 and Z₂+X₂ at j=2) and §4.7 (line 874: forward neighbor multiset F_Δ([Q]) and the reverse Δ∨={pM⁻¹}). `roadmaps grep --fixed 'AlgebraicModularFormsAndSerreWeightsPartII'` finds no match in any open pull request or on main. Merge order: this roadmap is line 240, GSp4NonregularModularityLifting line 268.

Why this roadmap is the owner: it is the general library roadmap for genus-two forms in characteristic p and p-adically, it is earlier in the merge order, and the consumer's own statements are specialisations (weight (j,2), its tame level) of the general targets here. The duplication is repaired in GSp4NonregularModularityLifting by importing Layers 3, 5, 6 and 8 by section.

Repair in this folder: add one sentence to Scope and ownership stating that this roadmap owns the genus-two secondary Hasse section and its extension (Layer 3), the formal coefficient operators and corrected Q₂ (Layer 5), the neighbor multisets and oriented reciprocity (Layer 6) and the theta operators with their nonvanishing and injectivity theorems (Layer 8), and that GSp4NonregularModularityLifting §§3.2, 4.1–4.2, 4.4 and 4.7 import them, so that the two-owner state is resolved when that roadmap is reviewed.

## R03 (P3) — §8.2 cites a source whose printed formula carries a factor the target rejects, without saying so

Location: README line 1098 (§8.2): "whose coefficient is con_d(a(F,Q)⊗Q) … The vector formula has no extra det(Q). … (Y16, Propositions 3.9, 3.11, 3.12, pp. 21–24; CG20, Proposition 8.9, internal p. 61 (861))".

Claim: CG20 Proposition 8.9(2) prints the vector theta coefficient as det(Q)·con(a_Q⊗Q) (CG20 line 2417), whereas Y16 Proposition 3.12 computes the coefficient as (1/N)Σ A_{F_n}(T)δ_n⊗T with no determinant factor (Y16 lines 1323–1327). The README adopts the Y16 formula (correctly: the Gauss–Manin computation at the Mumford cusp has all c_ij=0 and no determinant arises) but cites CG20 Prop 8.9 for the same formula as if it agreed.

Witness: CG20 line 2417 versus Y16 line 1327; the README's own Check "At p=7,d=2 and Q=x², the vector coefficient y² gives 1/3=5 … while scalar det Q=0" (line 1118) is false for the CG20 printed formula, which would give 0.

Repair: in §8.2 state that the det(Q) factor printed in CG20 Proposition 8.9(2) is a misprint and that the coefficient is Y16's, exactly as §5.4 does for the determinant versus discriminant Legendre symbol of CG20 Lemma 8.4 and §8.4 does for Yamauchi's (4.5). (§8.6 already explains the missing k≠p−1 exclusion of CG20 Theorem 8.10.)

## Verified sound

**Gate and dependency direction.** The worker's gate at c6dbce7 passes every check (build=0, depcheck=0, outside-folder=0, stray-files=0). I re-ran the dependency check with `--movable`:

    depcheck: 240 roadmaps, 2309 edges, 0 problem(s)

No UPWARD or CYCLE line. No `*Needs:*` line cites OverconvergentAutomorphicForms (merge order 242), AutomorphicBundlesPartII (245) or GSp4NonregularModularityLifting (268); OverconvergentAutomorphicForms appears only as a deferral in Scope. The outside-folder diff is empty.

**Suggested.lean.** One theorem, `relIndex_conj_diag_eq_tameIndex_mul`. Elaborated on a scratch copy with `#check @…`: the type is the README §5.2 statement verbatim (p prime, p coprime to N, Γ(N)≤Γ≤SL₂(ℤ); left side the relative index of g Γ_ℚ g⁻¹ in Γ_ℚ with g=diag(p,1)∈GL₂(ℚ); right side (p+1) times the relative index of ḡHḡ⁻¹ in H⊂GL₂(ℤ/N)). One-tactic probe: `simp` reports "made no progress", so it is not padding. Proof of truth: Γ=red_N⁻¹(H) because Γ⊇Γ(N); g⁻¹γg=[[a,b/p],[pc,d]] lies in Γ iff p∣b and γ̄_N∈ḡHḡ⁻¹; SL₂(ℤ)→SL₂(ℤ/p)×SL₂(ℤ/N) is onto, so Γ→SL₂(ℤ/p)×H is onto and Γ∩gΓg⁻¹ is the preimage of B⁰(p)×(H∩ḡHḡ⁻¹), of index (p+1)·e. Hypotheses are all used: with p∣N (Γ=Γ₀(p), N=p) the left side is [Γ₀(p):Γ₀(p²)]=p, not a multiple of p+1. Tau Ceti has only the full-level and Γ₀/Γ₁ versions (`HeckeRing/GL2/DiagonalCosetDegree.lean` line 115, private, for SL₂(ℤ); `Degree.lean` line 54; `Gamma1/CoprimeCosets.lean` line 325; `Gamma0/Diagonal/PrimeCosets.lean` line 124), so the arbitrary-Γ statement is not a duplicate. Header form, single `import Mathlib`, one existing `TauCeti.*` module (`Diagonal/Basic.lean` line 100 `diagGL`), no `set_option`, no sorry'd data.

**Headline theorems.** From the README: the all-component integral expansion principle (§1.4); simple primary Hasse zeros (§2.3); secondary Hasse extension, duality and the spherical root (§§3.2, 3.4, 3.7); torsion Hasse shifts and the two-affine cover (§§4.3–4.4); the Hecke decompositions, corrected Q₂ and the degree identity (§§5.2, 5.6–5.7); oriented neighbor reciprocity (§6.3); integral T and Q₂ on torsion and K/O forms with Hartogs (§§7.4–7.6); theta nonvanishing, negative-weight vanishing and the two injectivity theorems (§§8.4–8.7); saturation, classical comparison and the marked Klingen operator (§§9.2–9.4). Only the degree identity is statable at the pins (Mathlib and Tau Ceti have no Siegel models, Hasse sections, BT₁ crystals, Igusa towers or Siegel coefficient sheaves); it is stated. Each other headline is named in the module docstring with the carrier it lacks. No stand-in is stated.

**Library declarations opened at the pin** (file and line as cited; all correct): Mathlib `Matrix.det` (Determinant/Basic.lean 63), `Matrix.det_mul` (141), `legendreSym` (LegendreSymbol/Basic.lean 109), `Matrix.SpecialLinearGroup.map` (SpecialLinearGroup.lean 225), `CongruenceSubgroup.Gamma` (CongruenceSubgroups.lean 41), `toGL` (GeneralLinearGroup/Defs.lean 273), `mapGL` (317), `ZMod.unitOfCoprime` (ZMod/Basic.lean 794), `Subgroup.pointwiseMulAction` (Subgroup/Pointwise.lean 425, smul a S = S.map (toMonoidEnd a), so ConjAct g acts by gKg⁻¹), `Subgroup.relIndex` (Index.lean 62, index of H⊓K in K, 0 at infinite index), `Ideal.iInf_pow_smul_eq_bot_of_isLocalRing` (Filtration.lean 425, I≠⊤ required), `dvd_sub_pow_of_dvd_sub` (NumberTheory/Basic.lean 32). Tau Ceti `Representation.symmetricPower` (SymmetricPower.lean 47), `Module.Basis.symmetricPower` (SymmetricPower/Basis.lean 162), `TauCeti.stdSLRep` (ClassicalGroups/Restriction.lean 44), `TauCeti.BinaryQuadraticForm` (BinaryQuadraticForm/Basic.lean 94), `.discrim` (146), the SL₂ action (194, γ•f=f∘γ⁻¹, `eval_smul` line 186) and `discrim_smul` (203), the three HeckeRing declarations above, `TauCeti.diagGL` (Diagonal/Basic.lean 100). The citation lead `Lang.lang_surjective` is not a library name: it is ReductiveGroupsPartII `Suggested.lean` line 212 on main and README §RG2.3.7 line 5201, cited correctly as a roadmap declaration.

**Cross-roadmap citations resolved** (on main: AlgebraicVectorBundles L0A–L0C lines 215–254; ModularForms "Layer 2: Hecke operators and the Hecke algebra" line 383; ClassicalArithmeticCompletion §1.17 line 856, p odd, count 1+(d/p) with d=r²−4mn; SchemeAndStackFoundations §§0.6, 2.5, 2.6 (`ample_serre_vanishing`), 2.7, 2.19, 2.20, 4.9 at lines 678–5448; ReductiveGroupsPartII §RG2.3.7. At open heads: AlgebraicModularFormsAndSerreWeights #928 Layers 1–7; AutomorphicBundles #1069 §§3.1, 5.2–5.4, 5.10, 11.19–11.20, 12.11–12.12, 12.15–12.16, 12.20; AdelicAlgebraicGroups #792 §4.5 (degree [U:U∩gUg⁻¹]); FiniteFlatGroupsAndIntegralPadicHodgeTheory #879 §§R07.2.2, R07.2.21, R07.2.22 (equal coranks, exact sequence of complexes), R07.2.23 (`farguesLF_quasiPolarisation`, stated for p>2 as the README says); ShimuraCompactifications #1053 §§4.9–4.10, 7.3–7.4, 7.10, 7.12, 7.16–7.17, 7.23, and its lines 162, 2806 and 2959 confirm that parahoric integral models are not constructed there, so the parahoric-models gap asks for something absent; AbelianSchemesAndArithmeticModuli #849 §§A4.3, A4.7, A4.9–A4.11, with no trace-ideal or rank-one-chart target, so those gaps are not redundant; HodgeTateAndCanonicalSubgroups #1084 §§0.12, 0.14–0.16, 5.1–5.2 (Hilbert (𝒪_F/p^m)^× torsors, no genus-two GL₂ tower, so that gap is not redundant); ArithmeticGaloisRepresentations #856 §7.8 ("Sym^a(F̄_p²) is absolutely irreducible for SL₂(F), 0≤a≤p−1 (not a=p)") and §1.7. SchemeAndStackFoundations on main has no Milnor sequence and no fundamental class, so those two gaps are not redundant.) Remark, not a finding: ShimuraCompactifications §6.16 constructs the characteristic-zero compactified Klingen correspondence on (A,H_n,L) over ℚ_p; §9.4 here plans the integral formal factorisation, a different object, and may cite §6.16 for its generic fibre.

**Declared gaps.** All eight have a named supplier and a section, each needs sentence names its hypotheses and is not already provided (checked above); none is unowned. The only defect is the declaration form (R01).

**Seeded source sample** (all read at the locator; every statement supported as written unless noted):
- 1.2: CG20 §8.2 lines 2213–2254 (index set, M·Q=(det M)⁻¹MQMᵀ, zero extension, tame denominator bound, ρ extended to M₂(ℤ)); Def 8.7 line 2359.
- 1.3: T06 §3.1 lines 1180–1210 (Mumford charts, Γ-covariance γ·Σa_Tq^T=Σρ_κ(γ)a_T q^{γTγᵗ}); CG20 §8.1–8.2.
- 1.4: T06 Prop 3.2 line 1214 (from irreducibility of the modular scheme, hence one cusp per component here); CG20 Thm 8.1 line 2208; Lemma 8.8 line 2366.
- 3.5: P20 Lemma 6.4.2 proof lines 1611–1649: R/(a,y,x+bc)≅F_p[b,c]; paramodular branches as quotients of R/(x,y+ac)≅F_p[a,b,c] by a=0, b=0; open stratum a≠0 or b≠0.
- 4.1: CG20 Def 6.1 lines 1435–1441 (lift A of h^r from Koecher and ampleness on the minimal compactification); Lemma 6.4 lines 1467–1479 (s divisible by p^{m−1}); T06 line 1309–1312.
- 4.4: P20 Lemma 14.8.2 proof lines 4609–4616 (lifts s₁,s₂ of Ha^{n(p+1)}, Ha′^n to (det ω)^{n(p²−1)} on X⋆ with D(s₁)∪D(s₂)=X⋆,≥1; Ha′ on X⋆ assumed without proof); B15 Thm 4.5.4 p. 122 line 3092, Thms 6.2.2–6.2.3 and Cor 6.2.4 pp. 188–190 lines 4724–4789; Stacks 0CNF line 5242 (p-power criterion with p nilpotent).
- 5.2: CG20 Lemma 8.3 lines 2273–2299, including the remark that the Γ̄ decomposition is "essentially the same" as full level; P20 §5.1.3 lines 902–910 and Lemma 5.1.5.1 line 933.
- 5.3: CG20 Lemmas 8.3–8.4 and display lines 2335–2346 (scalar Z, Z₂ formulas; Z₂=UZ).
- 6.2: CG20 Def 8.19 and Lemma 8.21 lines 2773–2816.
- 7.5: P20 §§4.1–4.3 lines 675–842; §7 lines 1656–1832 (T=T_{p,1}+(1+p+p²+p³)T_{p,0}, multiplicity ♯GSp₄(ℤ_p)/Kli(p); Lemma 7.1.1 orders p^r·p² and p^{k+2r}·1; Lemma 7.1.2 orders 1·p and p^r·1; normalisation p^{3−r}).
- 8.2: Y16 Prop 3.9 line 1166, Prop 3.11 line 1192 (Hasse matrix identity at the cusp), Prop 3.12 lines 1243–1327, Remark 3.13 lines 1282–1303 (r=p−2 covered); CG20 Prop 8.9 line 2402 (det(Q) misprint, R03).
- 8.3: CG20 proof of Thm 8.11 lines 2453–2461; Y16 Thm 4.9 line 2129.
- 8.7: CG20 Thm 8.11 lines 2448–2482 (p−1>j≥4; their route via Serre duality and Thm 5.1, replaced here by §8.5); Y16 Thm 4.9.
- 9.3: P12 §4.2.1 lines 788–797 (ω(g·ψ)=ω(ψ)∘ᵗg⁻¹, g·ψ=ψ∘g); Def 4.3 line 748 p. 352; T06 lines 1285–1308.
- 9.4: P20 §§10.1–10.2 lines 2618–2650 (L⊂G[p²] totally isotropic, L[p] of rank p³, L∩H_m=0; t₁, t₂), Lemmas 10.3.2–10.3.4 lines 2760–2841 (1/p³, 1/p², 1/p), §10.4 lines 2842–2907 (diag(p,1), normalisation 1/p^r, étale second factor), p. 57 line 2616 (U is p^{3−r}U_{Kli(p),1}), §13.3.1 lines 4095–4099 (integrality on q-expansions).
Also read for the adversarial pass: CG20 §5.5 and Remarks 5.10–5.12 lines 1317–1395; CG20 Thm 8.10 lines 2425–2446; Lemma 8.12 lines 2501–2522; Lemma 8.20 lines 2793–2803; P20 Lemma 6.4.1 lines 1544–1587; P20 Thm 11.2.1 line 3247; K75 Lemma 13 and corollary lines 1676–1700, §11 lines 1712–1728; Y16 (3.27) line 1013, (3.35) lines 1276–1279, Thm 4.7 lines 2055–2088.

**Adversarial table** (values computed on each side).

| Statement | Instances tried | Values | Result | Change |
|---|---|---|---|---|
| Lean degree identity (§5.2) | N=1, Γ=SL₂(ℤ) | H trivial, e=1; [SL₂(ℤ):Γ₀(p)]=p+1 | equal | none |
| same | Γ=Γ₀(N), Γ₁(N), Γ(N), p∤N | ḡHḡ⁻¹=H (p a unit mod N) so e=1; Γ∩gΓg⁻¹=Γ∩Γ⁰(p), index p+1 | equal | none |
| same | Γ=Γ(7)∩red₅⁻¹Stab⟨(1,1)⟩, p=3, N=35 | |Stab|=20, Stab∩Stab⟨(3,1)⟩ torus of order 4, e=5; degree 20 | matches README Check | none |
| same | Γ=Γ(5)∩red₇⁻¹⟨[[0,−1],[1,−1]]⟩, p=3 | A of order 3; conj by diag(3,1) is [[0,4],[5,6]]∉{1,A,A²}; e=3; degree 12 | matches | none |
| same, hypothesis p∤N | Γ=Γ₀(p), N=p | left side [Γ₀(p):Γ₀(p²)]=p; right side would be (p+1)·e | hypothesis necessary | none |
| §1.2 normalized action | T=[[1,1],[0,1]], Q=x² | T·Q: diag(1,0) conjugated gives x²; Tau Ceti T•x²=(x−y)²; (Tᵀ)⁻¹•x²=x² | matches | none |
| §1.2 | M=diag(2,1), diag(1,−1) on x²+y² | 2x²+½y² (Δ=−4); −x²−y² (Δ=−4, negative definite) | matches | none |
| §5.2 inverse transforms | M=diag(p,1), diag(1,p) on (m,r,n) | (m/p,r,pn), (pm,r,n/p); adj(M)ᵀ mod p images [1:0],[0:1]; x² integral only for diag(1,p) | matches | none |
| §5.2 integrality criterion | general M of det p | M⁻¹·Q=adj(M)Q adj(M)ᵀ/p; mod p the form is Q(v)·ℓ² for the image line [v] | integral iff Q(v)≡0 | none |
| §5.4 X₂, U₂ | p=3: x²+y², 3(x²+y²), x² | Δ=−4≡2, (2/3)=−1: (−1,−4); nonprimitive: (3,8); Δ=0: (0,−1) | matches | none |
| CG20 Lemma 8.4 symbol | Gauss sum over rank-one symmetric B mod p | Σ_{rank 1}ψ(tr TB)=Σ_{v∈ℙ¹}(p[Q(v)=0]−1)=−1+p(Δ/p) with Δ=r²−4mn; Q≡0 gives p²−1 | discriminant, not det Q, is right; (det Q/p)=(−1/p)(Δ/p) | README convention confirmed |
| §5.5 relations over k₀ | UX₂, X₂³, Z₂X₂ | ε(pQ)=p≡0; ε∈{0,±1}; Δ(M⁻¹·pQ)=p²Δ(Q) | 0, X₂, 0 | none |
| §5.7 Q₂ | (2,2), (3,3), p=3 | p^{j−3}(U₂+1)=p^{j−2}X₂; Q₂=X₂+Z₂+pV₂+p and pX₂+Z₂+p³V₂+p²; tuples (1,1,3,3),(3,1,27,9) | matches Lemma 8.12 | none |
| §5.6 central scalar | (2,2) | S=p^{2+2−6}=p⁻² | matches | none |
| §6.2 counts | p=3: x²+y², x², xy; zero form | (−4/3)=−1→0; 0→1; (1/3)=1→2; p+1=4 | matches | none |
| §6.3 worked example | Γ(5), p=3, M=[[3,5],[30,51]] | det 3; M=[[1,5],[10,51]]diag(3,1); M⁻¹·x²=3(17x−10y)², coefficients (867,−1020,300)≡(2,0,0) mod 5 | matches | none |
| §6.3 reverse coset | Γ̄ of level N | p g⁻¹=JgJ⁻¹; Γ̄JgJ⁻¹Γ̄=Γ̄gΓ̄ iff diag(1,p)≡diag(p,1) in the mod-N double coset, e.g. p≡1 mod N | oriented formulation needed | none |
| §2.3 pairing sign | F e₂=−p e₃, F e₃=e₂, ⟨e₂,e₃⟩=1 | ⟨Fe₂,Fe₃⟩=−p⟨e₃,e₂⟩=p=pσ⟨e₂,e₃⟩; P20's +p e₃ gives −p | README sign right | none |
| §2.3 Hasse term | Fil=⟨(1,0,X,W),(0,1,Y,Z)⟩ | Fē₃=e₂≡−Yē₃−Zē₄, Fē₄=ē₄: matrix [[−Y,0],[−Z,1]], det −Y | matches P20 line 1577 | none |
| §3.1 weight | p=3 | (p−1)(p+1)=8; v^{p−1}⊗LF lands in ω^{(p−1)+p(p−1)}=ω^{p²−1} | matches | none |
| §3.7 root and twist | p=5, Λ↦2Λ, 4Λ | b₀∝t^{(p−1)/2}: factor 2²=4≡−1=(2/5); 4²≡1=(4/5); h′ factor 2⁴≡1 | matches | none |
| §4.2 ramified congruence | ϖ²=3, m=2 | (1+ϖ)³−1=3ϖ+3ϖ²+ϖ³=ϖ³+ϖ⁴+ϖ³, order 3≥2; general term C(p,i)ϖ^{ai} has order ≥a+1 | holds | none |
| §4.4 weights | s₁ from h^{N(p+1)}, s₂ from h′^N | (p−1)N(p+1)=N(p²−1); N=0 gives the unit section with empty zero set | N>0 needed, stated | none |
| §7.2 orders | d=0,r=2; d=1,r=3; r=1 | (4,0),(2,1),(0,3) sums 4,3,3; (7,4,3); r=1 mixed 1+1=2<3 | r≥2 needed, stated | none |
| §7.5 C_r−Q₂ | general, p=3 | p^{3−k}S(1+p+p²+p³−1−p²)=(1+p²)p^{j−2}; 10 at (2,2), 30 at (3,3) | matches | none |
| P20 vs CG20 normalisation | Lemma 5.1.5.1 five-term e₂ | pΘ(T_{p,1})+(p+p³)Θ(T_{p,0})=e₂ with βγ omitted; equals CG20's X² coefficient | identification T₂=T_{p,1}, S=T_{p,0} consistent | none |
| §8.1 transvectant | d=2 | x²⊗y²: 4/12=1/3; highest-weight sum 2d(d−1)+4(d−1)+4=2d(d+1); d=p−1 makes 2d(d+1)≡0 | matches | none |
| §8.4 first-order coefficient | recomputed from Y16 (3.35), (3.27), B=I, A≡(t_ij) | x^{d−2} coefficient of h·con_d(∇F): t₂₂F₂: 2(1−k); t₁₂F₁: 2(d−1)(1−k); t₁₁F₀: d(d−1)(1−k), all over d(d+1) | equals README formula; differs from Y16 (4.5) | none |
| §8.4 values | p=11,(6,2); p=7,(6,2) | −12/20≡6, −6/20≡3, −2/20≡1 mod 11; −3/5≡5 mod 7 | matches | none |
| §8.4 scalar | p=7,k=2 | k(2k−1)=6; 6/9≡3 mod 7 | matches Y16 Thm 4.7 | none |
| §8.5 degrees | p=5,(−1,−1); p=7 | pa−b=−4; m₀=24, (p−1)m₀=144, (p−1)²=36; a≥b with pa−b<0 forces a,b<0 | consistent | none |
| §8.6 weight list | p=5 | k=2: 6; k=3: 15≡0 excluded; k=4: h with Θh=0; k=5 excluded; k=6: 66; degree 6·4=24<26 | {2,6} | none |
| §8.6 k=p+1 step | general | Θ(hG)=hΘG by expansions; h nonzerodivisor; weight-2 case needs p∤6 | holds for p>3 | none |
| §8.7 degrees | p=7: j=4,5; p=11: j=6 | 26,33<50; after h: (−4,−8), pa−b=−36; b₀ step: pj−2−(p−1)(p²−1)/2<0 for j<p−1, p≥5 | holds | none |
| §8.3 sharpness | p=3, d=3 | orbit of x³ is {a³x³+c³y³}; x²y-coefficient form vanishes on it | d=p fails, d≤p−1 sharp | none |
| §9.1 character | p=3, d=2, r=1 | |GL₂(F₃)|=48, torus 4; χ(diag(2,1))=2³=8; reversed 2 | matches | none |
| §9.4 trace degrees | p=3, p=5, p=2 | p choices of L_m line, branch degree p·p²; deg t₁=p⁴; U(1)=p; Z₂(1)=p+1 | 3 vs 4, 5 vs 6, 2 vs 3 | none |
| §3.6 gluing check | k[a,b,c]/(ab) | a²,b² agree (both 0) on a=b=0, glue to a²+b²; 1,0 do not | matches | none |

**Not a finding, recorded:** CG20's remark at Lemma 8.3 that the level-Γ̄ coset decomposition is "essentially the same" as full level holds only when diag(p,1) normalises the image of Γ̄ modulo N (e=1); the README's refinement by the tame index e is correct and is what the Lean theorem states.

## Not verifiable

None. Every cited text (CG20, P20, Y16, T06, P12, K75, B15, Stacks) was read from the sources cache at the locators above.

## Source issues

- **Misprint** in CG20 at Lemma 8.4, p. 59 (internal), lines 2317–2330: the U₂ multiplier on a p-primitive index is printed as both the Legendre symbol of det Q and of r²−4mn; it should be the symbol of the discriminant r²−4mn, since (det Q/p)=(−1/p)(r²−4mn/p) and the rank-one Gauss sum gives −1+p(r²−4mn/p); affects a stated result (the sign of U₂ and X₂ on primitive indices when p≡3 mod 4).
- **Misprint** in CG20 at Proposition 8.9(2), p. 61, line 2417: the vector theta coefficient is printed as det(Q)·con(a_Q⊗Q); it should be con(a_Q⊗Q) with no determinant factor, as in Y16 Proposition 3.12, p. 24; affects a stated result.
- **Error** in CG20 at Theorem 8.10, p. 61, lines 2425–2429: injectivity of Θ is asserted for all 2≤k≤p+1 with p∤k(2k−1); at k=p−1 (admitted, since (p−1)(2p−3)≡3) the nonzero Hasse invariant has Θh=0; it should exclude k=p−1; affects a stated result.
- **Gap** in CG20 at Lemma 8.20, p. 72, line 2803: the proof uses pM⁻¹∈S, which needs Γ̄diag(1,p)Γ̄=Γ̄diag(p,1)Γ̄; for Γ̄ of level N this fails unless the two double cosets agree modulo N; it should keep the reverse double coset; affects the proof.
- **Gap** in CG20 at the remark after Lemma 8.3, p. 58, lines 2290–2299: the degree of Γ̄diag(p,1)Γ̄ is (p+1)[H:H∩gHg⁻¹] for H the image of Γ̄ modulo its level; it equals p+1 only when diag(p,1) normalises H; affects nothing for the paper's own Γ̄.
- **Misprint** in P20 at Lemma 6.4.1, p. 35, lines 1553–1560: the Frobenius matrix has F e₂=p e₃, which gives ⟨Fe₂,Fe₃⟩=−p against the symplectic pairing with ⟨e₂,e₃⟩=1; it should be F e₂=−p e₃; affects nothing (the Hasse linear term −Y is unchanged).
- **Gap** in P20 at Lemma 14.8.2, proof, p. 101, lines 4612–4616: the second Hasse invariant is used as a section on the minimal compactification without proving its descent; it should descend a p-power of Ha′ by the universal-homeomorphism criterion; affects the proof.
- **Gap** in P20 at Remark 6.4.1, p. 37, lines 1652–1655: the square root of Ha′(G) and its order-one vanishing are asserted without proof; it should be constructed from the polarisation on the rank-one open and extended by normality; affects nothing.
- **Error** in Y16 at Theorem 4.9 and display (4.5), p. 39, lines 2123–2141: the displayed first-order coefficient −(k₁−3k₂)/2·t₁₁F₀−(k₁−3k₂)/2·t₁₂F₁−(k₁−3)t₂₂F₂ is not the coefficient of the equivariant projection; computing from (3.35) and (3.27) with the Koblitz normalisation gives (1−k₂)(d(d−1)t₁₁F₀+2(d−1)t₁₂F₁+2t₂₂F₂)/(d(d+1)) up to a unit, and the frame change by an upper unipotent used to reach F₀≠0 leaves that normalisation; it should assume k₂≢1 (mod p) and change frames inside the unitary group; affects a stated result.
