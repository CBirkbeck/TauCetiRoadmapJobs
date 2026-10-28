<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/971#issuecomment-6399461528 -->
Red team round 2 pass b (claude) of 0c4ae2f

Verdict: accepted

1. **F01** (P3) the totalization bound is cited from a module-category statement but applied to sheaves

   Location: `packages/ClassicalAdicEtaleCohomologyPartII/README.md:102` ("Section E5:animation.3 … for a cosimplicial diagram with terms in D≥0 and every i≥0, Hⁱ of its totalization is computed by `Tot_{i+1}`"), used at line 1186 (§7.4: "for a cosimplicial object in D≥0, Hⁱ of its totalization depends on the truncation through cosimplicial degree i+1") and line 1205 (§7.5).

   Claim: the supplier's target covers the cosimplicial object q↦Rf_{q,*}Λ in the derived category of étale sheaves on the rigid target Y.

   Witness: `TauCetiRoadmap/EnhancedDerivedSheaves/README.md` on main, §E5:animation.3 (line 1980): the bound is stated "for a cosimplicial diagram X in spectra or `D∞(R)`" with `π_i=H^{−i}` in `D∞(R)`; no sheaf category is named. The objects of §7.4 are sheaves on Y (BH line 781–782 use the bound in D(Y_ét)), not modules over a ring.

   Repair text (line 102, and one sentence in each of the two routes): "This bound is stated in `D∞(R)`; apply it after `RΓ(V,−)` for every étale affinoid `V→Y`: `RΓ(V,−)` commutes with the totalization limits, and `RΓ(V,Rf_{q,*}Λ)=RΓ(f_q^{-1}V,Λ)` lies in `D≥0(Λ)`, so `Hⁱ(V,Tot)=Hⁱ(V,Tot_{i+1})` for every V, and sheafification gives `Hⁱ(Tot)≅Hⁱ(Tot_{i+1})` on `Y_ét`, naturally in the hypercover." Tested on the refuting instance: for the nodal-curve hypercover of §7.4's Check, the terms are sheaves on the affinoid base; after `RΓ(V,−)` the normalized cochains of line 1197 (N⁰=Λ→N¹=Λ by id; N⁰=0, N¹→N² by id) give H⁰=0 and H¹=0 at stages 1 and 2 as before, and the sheaf statement follows by sheafifying over V. No change to any Check value.

Round 2, pass b. Scope: the whole of `packages/ClassicalAdicEtaleCohomologyPartII/README.md` (1283 lines, 54 numbered targets in Layers 0–5 and 7, 13 declared supplier gaps) and the whole of `packages/ClassicalAdicEtaleCohomologyPartII/Suggested.lean` (84 lines, 5 declarations). Every round-1 finding was re-checked at this head first; then the full pass was run again. One new finding (P3), none blocking.

## Round-1 findings at this head

| Finding | Status | Witness at 0c4ae2f |
|---|---|---|
| a.F01 (P3) identity Check needs n=1 | repaired | README line 203: "For n=0, f=id and A=B=O_Cᵃ/p … For n=1, over R=O_C/p² … both sides have H¹=O_Cᵃ/p". Recomputed: over O_C/p² the free resolution of O_C/p has differential p, Hom into O_C/p kills it, Ext¹=O_C/p. |
| a.F02 (P3) d=0 trace normalisation | repaired | README line 514: identity point map sends 1 to 1; split degree-r cover sends the unit to r, a component unit to 1; "at r=2 this is 2 integrally and 0 modulo 2". Agrees with Conventions line 31 and §§1.5, 2.8, 2.9, 5.1 Checks. |
| a.F03 (P3) Hom boundedness locator | repaired | README line 177 cites AC Corollary 4.9.6 and the proof of Lemma 4.9.7 (AC line 4834, AC line 4854) with first argument bounded above; `sources.toml` AC locator updated. Re-read: AC line 4836–4837 has F∈D⁻, G∈D⁺; AC line 4852 has them reversed. |
| a.F04 (P3) regular module needs finite G | repaired | README line 122 ("for a finite group G and an induced regular module, Shapiro…") and line 897 (finite G; the G=ℤ control with invariants 0, coinvariants M). Recomputed for G=ℤ, M≠0: a translation-invariant finitely supported sequence is 0; coinvariants of M[ℤ] are M. |
| a.F05 (P3) exact parent edges | repaired | README line 130 names 2.5 (`AdicSpace.henselianComparison_bijective_of_spec`) and 11.2 (`ordinary_etale_cohomological_dimension`); line 916 (§4.5 Needs: 11.2) and lines 1154, 1164 (§7.2 uses 2.5). Both names exist in ClassicalAdicEtaleCohomology at #875 (its README lines 962 and 5134). |
| a.F06 (P2) characteristic-p root duality | repaired | `Suggested.lean` lines 41–82: `monomialRootAlgebra`, `monomialRootAlgebraCharP`, `monomialClass`, `monomialRootModule`, `monomial_root_duality`; README §3.7 names all five. Statement checked against Z line 2825–2838 and by computation (table below); no sorry'd data. |
| a.F07 (P2) Layer 1 generality | repaired | README line 17 ("Layer 1 uses an arbitrary complete nontrivially rank-one valued field K and a chosen nonzero pseudouniformizer ϖ…"), §1.1 line 267 (O_K/ϖⁿ⁺¹), Check line 283 (K=𝔽₂((t))), §1.6 line 366 ("Let K be algebraically closed, in either characteristic"). Z line 811 and Z line 1121 carry exactly these hypotheses. No new error: §1.7 Check line 398 excludes the inseparable T↦Tᵖ in characteristic p. |
| b.F01 (P2) totalization gap | repaired, with a residue (S01) | Gap deleted from README and plan (13 slugs remain, identical in both); README line 102 and §§7.4–7.5 cite EnhancedDerivedSheaves §E5:animation.3 (`tot_filteredColimit_of_bounded`), which exists on main (its README line 1978–1980). The supplier states it in spectra or D∞(R); the use is on a sheaf category: S01. |
| b.F02 (P2) nearby-coherence gap wording | repaired | README line 114 now states hypotheses and five numbered conclusions in PerfectoidSpaces P0.10 vocabulary; identical `needs` in `design/plan.json`. AC line 7390–7426 (Theorems 6.13.5–6.13.6) make exactly these assertions: D⁺_qc,acoh, almost amplitude [0,d], affine associated-sheaf isomorphism, étale base change; p-completeness is AC line 7427–7428. |
| b.F03 (P2) §7.1 cited for p-power stalks | repaired | README line 130 (1.5(c), 3.2, 9.1), line 1186 (§7.4 route), line 1223 (§7.6 route), Needs lines 1199, 1234. Parent at #875: §1.5 clause (c) (its line 588: rank-one y, Y(ξ)=Spa(C_ξ,O_{C_ξ}), stalk = cohomology of the geometric fibre), §3.2 maximal-stalk detection (its line 1241), §9.1 overconvergent proper supports (its line 4075). |
| b.F04 (P3) indexing of 𝔛_n | repaired | README line 19 (𝔛₀=𝔛⊗O_K/ϖ), line 267 ("𝔛_n=𝔛×Spec(O_K/ϖⁿ⁺¹), n≥0 … Thus 𝔛₀ is the modulo-ϖ fibre"), line 272 (n≥0), line 195 (R=O_C/pⁿ⁺¹, n≥0), line 299 (n=0, n=1 Check). Z line 815 uses O_K/ϖ^{i+1}. Consistent with §2.6's use of ω•_{𝔛₀}. |
| b.F05 (P3) plan scopes PD.6 | settled: not actionable, reason correct | `design/plan.json` at this head still lists scope `…:PD.6` and nine PD.6 nodes; the brief allows only the top-level `gaps` to change after the design, so the repair worker could not edit them. The README consumes HodgeTateAndCanonicalSubgroups §7.6 (`proper_smooth_local_system`, at #1084 its README line 2721–2723), which exists with the ascribed statement. Not re-raised. |
| b.F06 (P3) v-cover attribution | repaired | README lines 104 and 126 attribute the criterion to DiamondsAndVStacks §D2.2 (`singleton_mem_vPrecoverage_iff_surjective`, at #820 its README lines 4051, 4071) and keep C0.1/C0.23/C2.10 for comparison, embedding and hyperdescent; D2.2 added to the Needs of §7.4 (line 1199) and §7.5 (line 1217). |

No repair introduced a new error: the retests in the table of the adversarial pass below cover every edited passage (Conventions, §§0.3, 1.1–1.7, 2.5, 3.6–3.7, 4.4–4.5, 7.1–7.6 and the twelve remaining contracts).

## Verified sound

Counts: declarations read 5 (all of `Suggested.lean`, with the module docstring); README targets read 54 (every numbered section of Layers 0–5 and 7) plus Conventions, the 13 gap contracts, the 18 supplier contract paragraphs, Examples, Downstream consumers, Worked examples and References; locators verified 38 distinct source anchors re-read in the cached extractions (Z 811, 815, 1121–1131, 1266, 2088–2094, 2825–2838, 2911–2990, 3066, 3106, 3176, 3188, 3219–3221, 3285–3297, 3640, 3831, 3968; AC 4834–4857, 4990, 5058, 7390–7428; BH 594, 647–662, 667–700, 764, 776–787, 872–881, 1102–1116; Han 134, 196–239, 801, 946–957; FQ 756, 1349; U 169; PS 766), each carrying the cited statement at the cited page; Checks tested by computation 62 (table below, including every Check on the five Lean definitions); sibling citations checked 97 section or name citations across 19 roadmaps, every one found where cited with the hypotheses the README ascribes to it.

Where each cited supplier was read. On main (content checkout at 16fe7a8d): EnhancedDerivedSheaves §§0.1–0.4, E1.1–E1.5, E2:towers.1, E5:animation.3; AdicSpacesPartIII F0.6–F0.8, R2.2–R2.8, R3.1–R3.8; AdicSpacesPartII R0.19–R0.20; PerfectoidSpaces P0.10, P0.29, P3.11, P3.22, P5.9, P5.13.4, P6.5, P6.7, P6.15, P6.16; SchemeAndStackFoundations 0.6, 0.8, 0.9, 0.21, 2.18–2.21; EtaleCohomologyFoundations G.1–G.3, F.0, F.3, 0.5, 0.11; RigidAnalyticGeometry 1.1–1.2; DerivedModuleAlgebra 0.2, 0.4, 0.8, 0.10–0.17, 1.T.1, 1.1–1.8, 1.E.1, S.1. At open heads through the roadmap service: ClassicalAdicEtaleCohomology (#875) 1.5(c), 2.5, 3.2, 7.1, 8.2, 8.4, 9.1, 9.5, 9.7 (`IntegralSmoothProperTrace`), 10.5, 11.1, 11.2; DiamondsAndVStacks (#820) D1.1–D1.6, D1.9–D1.11, D2.2; DiamondEtaleCohomology (#922) C0.1, C0.23, C1.7–C1.12, C2.10; HodgeTateAndCanonicalSubgroups (#1084) 7.5, 7.6; PadicHodgeTheory (#1062) 2.1, 2.4, 2.7 (including its singular proper extension), 7.2; AdicCoefficientsAndComparisons (#965) fp-compactification-limit, fp-strict-cofiltered; ResolutionOfSingularitiesCharacteristicZero (#1199) 7.5, 7.8 (`resolution_affinoid`); ArithmeticGaloisDuality (#858) D7.1–D7.3, R02.1.2, R02.2.3; AInfCohomology (#1044) AI.0:integral.1, AI.1.1–AI.1.7, AI.3.1–AI.3.2, AI.4.1, AI.6.1–AI.6.2; DerivedDeRhamCohomology (#868) 1.22. On the board's main branch as an accepted design: AdicSpacesPartIIPartII RZ.0–RZ.5 (`packages/AdicSpacesPartIIPartII/design/README.md`). No cited roadmap is absent from all three places. No roadmap on main or at any open head cites ClassicalAdicEtaleCohomologyPartII (service grep), so there is no cycle; the merge order places this roadmap at 282 after every supplier it names.

Dependency gate output (read-only run with `--movable`):

```text
depcheck: 52 roadmaps, 600 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

Library pins (Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a, Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, read from the raw files at those commits): `iterateFrobenius` is `def` at `Mathlib/Algebra/CharP/Lemmas.lean` line 327; `ModuleCat.restrictScalars` at `Mathlib/Algebra/Category/ModuleCat/ChangeOfRings.lean` line 85, whose object is `ModuleCat.of R M` with `Module.compHom M f` (lines 66–68), so the carrier of `monomialRootModule p n m` is the quotient itself and `a • x = a^(p^m) * x` as §3.7 says; `CategoryTheory.Abelian.Ext` at `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean` line 118; `CharP.quotient'` at `Mathlib/Algebra/CharP/Quotient.lean` line 45 with hypothesis "every natural number in the ideal is zero in R", which the instance proof discharges through the constant coefficient; `LinearMap.IsPerfPair` at `Mathlib/LinearAlgebra/PerfectPairing/Basic.lean` line 39 (a class with two bijectivity fields, no finiteness); `Representation.invariants` at `Mathlib/RepresentationTheory/Invariants.lean` line 73; `AlgebraicGeometry.Scheme.smallEtaleTopology` at `Mathlib/AlgebraicGeometry/Sites/Etale.lean` line 50; `Representation.exists_common_fixed_vector_of_isPGroup` and `Representation.invariants_ne_bot_of_isPGroup` at `TauCeti/RepresentationTheory/Unipotent/PowerOrder.lean` lines 151 and 158 with `[Nontrivial V]` and `IsPGroup p G`; `TauCeti.AdicSpace` at `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean` line 243. The pinned Tau Ceti tree has no étale or pro-étale site on adic spaces, no formal schemes, no almost-module category and no rigid local systems, so the sixteen "not statable" headlines in the module docstring are correctly so.

Lean signature check: the file has no `variable`, `section` or `include` line, so no binder can be lost; every declaration carries `(p n : ℕ)` or `(p n m : ℕ)` explicitly and the two that need primality carry `[Fact p.Prime]` in their own signature. The elaborated types were not produced here (not built: this worker has no Lake environment); the signatures were compared by reading them against §3.7, which states the same binders and the same prime hypothesis. `monomial_root_duality` elaborates per the round-1 repair report; nothing in it is a `True` placeholder, a sorry'd datum, a hypothesis containing the conclusion or a free `Prop` field. One `theorem`, no `lemma`, single `import Mathlib`, no `set_option`, namespace and layer comment in the prescribed form.

Truth of `monomial_root_duality` (computed, not only cited). Write q=p^m, A=𝔽_p[t_0,…,t_n]/(t_0⋯t_n), A_m=A with a·x=a^q x. Every monomial is t^e with e=qf+r, 0≤r_i<q, and t^e=(t^f)·t^r. Hence A_m=⊕_r A·t^r over residue vectors r whose support S≠{0,…,n}, and A·t^r≅A/(t_{S^c}) since a^q t^r=0 iff a∈(t_{S^c}) (the ideal is radical). For S^c≠∅ the periodic resolution …→A→(t_{S^c})A→(t_S)A→A/(t_{S^c}) gives Hom_A(A/(t_{S^c}),A)=(t_S)≅A/(t_{S^c}) and Ext^k=0 for k>0; for r=0 the summand is A. The adjoint pairs A·t^r with A·t^{r̄}, r̄_i=q−r_i on S and 0 off S, and adj(t^r)(a^q t^{r̄})=a·t^{1_S}, the generator of (t_S): bijective blockwise. So Hom and Ext are as stated, τ is well defined (a monomial with all exponents ≥1 is 0 and its divided monomial is 0 too) and unique (𝔽_p-linear on a monomial basis). This is Z Theorem 4.3.2 at Z line 2834, whose A_m (Z line 2826) is this A_m after renaming t_i^{1/p^m} to t_i.

Policy: the pull request changes only files under `packages/ClassicalAdicEtaleCohomologyPartII/` (`git diff --stat origin/main...HEAD`: README, Suggested.lean, design/plan.json, metadata.toml, sources.toml, four reports). In `design/plan.json` only the top-level `gaps` key differs from main (the design's five `G1`–`G5` entries are replaced by the thirteen slugged entries that the README states under `## Exact supplier contracts`; scope, nodes and every other key are byte-identical). No pull-request number, process word, `lemma`, `set_option`, computational algorithm or machine path in the README or the Lean file; every target has a locator. `sources.toml`: Z, AC, SW, BH, U, PS, Han, FQ certified with the sha256 of the cached text; H uncertified by DOI and page, as settled.

Ownership by object (service grep over main and all open heads, plus the brief's sibling folders): no second owner of the monomial root algebra or its duality, Faltings traces, polystable models, good quotients, almost coherent nearby cycles, or mod-p/p-power/integral/rational Poincaré duality for rigid spaces; the parent at #875 cites Zavyalov §5.4 only as an external source (its §9.7). The two board packages listed in the brief's index that could have overlapped (SchemeAndStackFoundationsPartII for valuation-base upper shriek, PadicHodgeTheoryPartII for nearby cycles) are not readable (below) and are not in the roadmap index, so they own nothing citable.

Declared gaps: thirteen, each with a named supplier, each with its own hypotheses and a single theorem-level interface, each with the same slug in `design/plan.json` and in the README's supplier subsection. None asks for what a pin or an earlier roadmap provides: the valuation-base trio is absent from SchemeAndStackFoundations §§0.6, 2.19–2.21 (Noetherian or `DQCoh` over qcqs bases, no `O_K/ϖⁿ⁺¹` upper shriek); the AdicSpacesPartIII five are absent from F0.6–F0.8 (Noetherian formal GAGA) and R2–R3; the quasi-excellent direct-image contract exceeds EtaleCohomologyFoundations §F.3 (its F.3.0 is for separably closed fields); the two PadicHodgeTheory contracts are the general-model and field-extension statements of AC Theorems 6.13.5–6.13.6 and BH Lemma 3.25's proof, which PadicHodgeTheory §2.7 (smooth toric charts, proper comparison) does not state.

Headlines: the README's headline theorems are §§1.4–1.7, 2.6–2.9, 3.7, 3.10, 4.7, 5.2, 5.4–5.9, 7.2–7.7. The only one with carriers at the pins is the characteristic-p part of §3.7, which is stated; each other one is named in the module docstring with the missing carrier. No padding: the four supporting declarations are the definitions the headline needs and an instance with a real proof, none restates a Check, computes a value or treats a boundary case.

### Adversarial pass (one row per statement; values computed on both sides)

| Statement | Instances tried | Values on the two sides | Result |
|---|---|---|---|
| `monomialRootAlgebra p n` | p=2,3; p=0; p=1; n=0 | ZMod 0=ℤ gives ℤ[t]/(∏t) of characteristic 0; ZMod 1 gives the zero ring; n=0 gives 𝔽_p[t_0]/(t_0)=𝔽_p | matches Checks lines 746–747 |
| `monomialRootAlgebraCharP p n` | p=2,3, n=1; evaluation at 0 | constant-coefficient map kills (uv), sends 1↦1; u+u=0 over 𝔽_2, 2u≠0 and 3u=0 over 𝔽_3; 1≠0 in the quotient | instance proof sound; Check line 751 |
| `monomialClass p n e` | n=1: e=(0,0),(1,0),(1,1),(2,2) | classes 1, u, 0, 0; additivity (1,0)+(0,1)=(1,1)↦u·v=0 | matches API line 741 |
| `monomialRootModule p n m` | m=0; p=2,m=1 node; p=3,m=1 | m=0: a•x=ax; m=1,p=2: u•1=u²=x² in root coordinates, x•… is not an A-action; p=3: u•1=u³ | restriction essential; Check line 750 |
| `monomial_root_duality` τ law | p=2,m=1,n=1: e=(1,0),(2,0),(2,2),(3,0); n=0 | τ(u)=0, τ(u²)=u, τ(u²v²)=τ(0)=0=uv, τ(u³)=0; n=0: τ(1)=1, τ(t_0)=τ(0)=0 | well defined and A-linear |
| `monomial_root_duality` adjoint | p=2,m=1,n=1 blocks 1,x,y; p=3,m=1 block x,x² | blocks: id on A; x↦(x↦u) onto (u)=Hom(A/(v),A); y↦(y↦v); p=3 block matrix [[0,u],[u,0]] | bijective; Check lines 749–750 |
| `monomial_root_duality` Ext | k=1,2 on A/(v), A/(u) at p=2; k>0 on A | ker(u)/im(v)=(v)/(v)=0, ker(v)/im(u)=0; A free | Ext^k=0 for k>0 |
| Conventions shifts, twist, signs | d=1 on ℙ¹; swap of two coordinates; p=2 | H²(Λ[−2])=Λ; dT₁∧dT₂↦−dT₁∧dT₂, −1=1 mod 2; two-point trace (1,1)↦0, (1,0)↦1 at p=2 | sound |
| Conventions almost zero, ramified point | O_C/p vs O_C/𝔪_C; π²=p | ε·1≠0 for 0<v(ε)<v(p); π≠0, π²=0 in O_K/p, π↦0 in k | sound |
| Conventions Layer-1 indexing | K=𝔽₂((t)), ϖ=t; K=C, ϖ=p | n=0: O_K/t resp. O_C/p; n=1: O_K/t² resp. O_C/p² | consistent with §§0.3, 1.1, 1.2 |
| 0.1 almost coherence | unit; O_C/𝔪_C; ⊕̂O_C with ε, 0<v(ε)<v(p) | one generator; almostification 0; εe_j independent mod p in infinitely many coordinates | Checks discriminate |
| 0.2 Hom order and proper mapping | F=O_C, G with O_C in negative degrees; formal ℙ¹ with O, O/p, O(−2); 𝔪_C | RHom(O,G)=G not bounded below; (H⁰,H¹)=(O,0),(O/p,0),(0,O·T⁻¹); p^{1/n} has valuation 1/n<δ | AC 4.9.6 order; contract needed |
| 0.3 almost proper duality | n=0 and n=1 with f=id, A=B=O_Cᵃ/p; smooth curve; two points | Ext¹_{O/p}(O/p,O/p)=0; Ext¹_{O/p²}(O/p,O/p)=O/p; f!O=Ω¹[1]; counit (1,0)↦1 | repaired Check correct |
| 0.4 nearby complexes | point; 2-torus; Spf O_C[ε]/ε² | (A,K)=(O_Cᵃ,O_Cᵃ/p) in degree 0; ranks 1,2,1; O⁺/p=O_C/p, Ô⁺ killed by ε | contract supplies amplitude |
| 0.5 generic fibre | O; O/pⁿ; lattice pO | C; 0; C | sound |
| 1.1 formal dualizing complex | Spf O_K; Spf O_K⟨T₁,T₂⟩; 𝔽₂[[t]]⟨T⟩; ℤ_p[pT,T²,T³]^ | degrees 0; −2 generator dT₁∧dT₂; dT in degree −1 with reductions mod t, t²; x=pT≠0 mod p, x²=xT²=xT³=0 mod p, non-CM | sound in both characteristics |
| 1.2 étale/algebraic comparison | U=2T, odd residue characteristic; n=0,1; id | Jacobian 2; mod ϖ, mod ϖ²; generator↦generator | sound |
| 1.3 gluing | 𝔘=𝔛; 𝔘=∅; Spf O_K | F; j_{K,*}F_K with sections K; compatible pairs (a,a) only, (1,0) excluded | sound |
| 1.4 Hartogs | smooth affine; empty open on Spf O_C; uv=ϖ | (s,s); C≠O_C so density needed; a dense open meets both branches | sound |
| 1.5 bottom traces | id; r copies; degree-p split, ϖ=p | 1; (1,0)↦1; Tr(1)=p, 0 mod p | sound |
| 1.6 generic canonical sheaf | point; one-torus; U=T⁻¹ | 1↦1; dlog T↦generator; dlog U=−dlog T | sound, K algebraically closed in either characteristic |
| 1.7 coherent trace | S=Tʳ, r≠0 in K; r=p in char 0; T↦Tᵖ in char p; ℚ_p(√p) | Tr(dlog T)=dlog S, Tr f^*dlog S=r dlog S; r=p gives 1 and p; inseparable map excluded; O_L/p=𝔽_p[t]/t² nonreduced, over C splits to O_C×O_C | sound |
| 2.1 torsion-free quotient | O_C⊕O_C/p²; p=2 square | O_C; 2x²=0 and 2-torsion-free gives x²=0 | sound |
| 2.2 BMS maps | Spf O_C; smooth model; torus | Ω¹=0; im Φⁿ=aⁿR̃ⁿ; Φ¹(dlog T) with twist {−1} | sound |
| 2.3 integral inverse | n=0; d=1 ranks; p=2 | Φ⁰=Ψ′⁰=id; ranks 1,1,0; a=ζ_2−1=−2 | sound |
| 2.4 nice models | polydisc; uv=ϖ; t²=ϖ | reduced; uv=0 reduced; t²=0 nonreduced | matches Z Definition 3.5.1 (Z line 2091) plus the qcqs convention of Z footnote 25 |
| 2.5 rational normalisation | Φ=Sch∘j; S=Tʳ; identity point; split degree r | jΦ⁻¹Sch(dlog T)=dlog T; r dlog T and dlog S; 1↦1; unit↦r, component↦1 | repaired Check correct |
| 2.6 Faltings traces | point; curve; singular fibre | identity; target Ω¹ᵃ(−1)[−1]; bottom inclusion (ω/p)[−d]→ω•₀[−2d] | shifts consistent with §§3.10, 4.1, 5.1 |
| 2.7 pseudo-finite | id; admissible blow-up; positive-dimensional generic fibre | amplitude [0,d]; generic degree 1 with exceptional ℙ¹; excluded | sound |
| 2.8 pro-étale trace | split p at p; id; r then s | Tr(1)=0 mod p, Tr(e₁)=1; 1; rs-sum | sound |
| 2.9 trace square | id; split 2; split p | 1; x+y both routes; p and 0 mod p, e₁↦1 | sound |
| 3.1 polystable charts | empty product; n_i=0; uv=ϖ; units; uv=0 | O_C, d=0; variable eliminated; d=1; tori; singular at origin | sound |
| 3.2 root towers | all n_i=0; one torus; p=2 node | Γ=1; Γ=ℤ_p(1); node fibre k[x,y]/(x²,y²,xy) of length 3 versus generic degree 2 | sound; Γ=ker(ℤ_p(1)^{n_i+1}→ℤ_p(1)) per block gives rank Σn_i |
| 3.3 characters | u·v; (1,0)+(0,1); unit ϖ | ϖ·1; minimum 1 removed; isomorphisms | sound |
| 3.4 Koszul cohomology | Γ=ℤ_p trivial; order pᵐ; Γ=1 | H⁰=H¹=O_C; H⁰=0, H¹=O_C/(ζ_{pᵐ}−1), killed by ζ_p−1 since (ζ_p−1)=(ζ_{pᵐ}−1)^{p^{m−1}}·unit | sound |
| 3.5 décalage | O_C; torsion summand | O_C/O_C[a]=O_C versus O_C/a | sound |
| 3.6 projection trace | m=0; torus m=1; n=0 | id; tr(T^{1/p})=0, tr(T)=T, tr(1)=1 versus algebra trace p=0; n=0 both traces 1↦1 | matches Z Definition 4.3.1 (Z line 2827) |
| 3.7 integral and characterwise duality | uv=ϖ, p=2, m=1 | nonintegral coset R⁺u^{1/2}+R⁺v^{1/2} with relation v·u^{1/2}=ϖ^{1/2}v^{1/2}, not free; its mod-p image A/(v)x⊕A/(u)y is self-dual | derived Hom formulation required; Z Proposition 4.3.6 (Z line 2932), Corollary 4.3.7 (Z line 2990) |
| 3.8 oriented trace | d=0; Γ=ℤ_p; swap; basis scaled by 2 at p=3 | id; degree-one generator↦1; −1; ×2 | sound |
| 3.9 cochain duality | d=0; opposite characters; far tails | b↦b; χ pairs with −χ, other cosets 0; v(ζ_{pᵐ}−1)=1/(p^{m−1}(p−1))→0 | sound |
| 3.10 polystable duality | point; curve; two-torus | id; ω(−1)[−1] and ω₀(−1)[−1]; degrees 0↔2, 1↔1 | sound |
| 4.1 pairing | point; smooth d=1; one-dimensional vector space | multiplication; degrees 0↔1; both adjoints 1, `IsPerfPair` | sound |
| 4.2 rig-isomorphism descent | id; blow-up; point | id; Rf_* used, no degree division | sound |
| 4.3 good quotient | G=1; G×𝔛; fixed generic point | id; torsor of degree |G| including p; fibre size 1≠|G| | matches Z Definition 4.4.2 (Z line 3219) |
| 4.4 invariants and orbits | C_p trivial on O_C/p; S₃ regular; ℤ regular; C₃ over 𝔽₂ | H¹=M; M and M; 0 and M; 3⁻¹=1 | repaired Check correct |
| 4.5 equivariant pushforward | G=1; C_p; S₃ | id; H¹=M survives; (gh)⁻¹=h⁻¹g⁻¹ | §11.2 bound cited, Z line 3297 |
| 4.6 quotient descent | split C_p; S₃ | diagonal M and M; Tr(1)=0, Tr(e₁)=1; six-term invariant sum | sound |
| 4.7 local duality | point; uv=ϖ; t²=ϖ | id; admitted; excluded | sound |
| 5.1 global trace | point; two points at p=2; curve | id; (1,1)↦0; H²→O_Cᵃ/p(−1) needs [−2] | sound |
| 5.2 global duality | point; ℙ¹; two points | O_Cᵃ/p; degrees 0,2 pair to 1; diag(1,1), unit trace 2 | sound |
| 5.3 detection and top trace | 0:𝔽_p→𝔽_p; id; two points | kernel and cokernel O_C/p not almost zero; 0; kernel of 𝔽_p²→𝔽_p rank 1 | sound |
| 5.4 mod-p duality | two points; ℙ¹; i=2d+1; char p ℙ¹ | diag(1,1); 1; both groups 0 (integer degree −1); H²(𝔽_p)=0, H⁰=𝔽_p | sound |
| 5.5 local systems | rank 0; rank r; C₂ Jordan block over 𝔽₂ | 0→0; I_r; fixed line e₁, degree-2 trace 0 | sound |
| 5.6 p-power duality | n=1; ℙ¹, ℤ/p²; Tor | mod-p pairing; 1 in degrees 0,2; Tor₁^{ℤ_p}(ℤ/pⁿ,𝔽_p)=𝔽_p versus 0 over Λ_n | sound |
| 5.7 traces | point; ℙ¹; ℤ_p/p | 1; c₁↦1; 0 after inverting p | sound |
| 5.8 integral duality | ℙ¹; [ℤ_p→pℤ_p]; point | 1 in degrees 0,2; H¹=ℤ/p, Ext¹=ℤ/p | sound |
| 5.9 rational duality | ℙ¹; torsion; two points | (1); 0; diag(1,1) | sound |
| 7.1 Zariski constructibility | skyscraper at a classical point of the disc; constant; ⊔ points with Λ[j] | strata point and complement (open, not qc); one stratum; locally bounded, unbounded | sound; overconvergence via §3.2 closure |
| 7.2 algebraization | Z=Spec A; skyscraper; Spec K with (ℤ/n)ʳ | equivalence (BH 3.7(2)); closed-point sheaf; (ℤ/n)ʳ | BH line 679–682 states (2) and the lisse identification (3) |
| 7.3 generators | point; point in disc; C₂ Jordan block | one generator; f_*Λ; extension of trivial lines | BH Proposition 3.6 uses f_*M with M constant constructible (BH line 654) |
| 7.4 proper pushforward | id; point in disc; nodal curve; {a},{a,b}; cochains | F; skyscraper, Rⁱ=0; dimensions 1,0; Y∖{a}, Y∖{a,b}; H⁰=0, H¹=0 at stages 1,2 | sound; category of the bound: S01 |
| 7.5 field extension | point; ℙ¹; ℤ/p²; split node | 1↦1; ranks 1,0,1; two generators; H⁰=Λ, H¹=Λ (cokernel of a−b on constants), H²=Λ(−1) | sound |
| 7.6 base change | g=id; ℙ¹ at p²; n=1; empty source | id; Λ, Λ(−1); 0→0; 0 | BH line 876–881 route |
| 7.7 constant sheaf | point; two points; point×ℙ¹ | Λ; Λ²; degree-2 sheaf 0 while H²=Λ(−1) | consistent with §7.6; H uncertified |
| Gaps (13) | each at its boundary instance | formal ℙ¹ with O, O/p, O(−2); split model O×O; O_K⟨T⟩ as completion of O_K[T]; permutation action of degree r; identity zigzag; Tᵖ=S off S=0; Y∖{a}; id!O=O and f!O=Ω¹[1]; degrees −d..0; rank-one free canonical module; point and 2-torus ranks 1,2,1; O_C⊗̂O_{C′}=O_{C′}; skyscraper direct image | each precise, minimal, same slug in plan and README |

Cross-checks within the roadmap: every Check and worked example was evaluated against the theorem of its section and against the other Checks on the same object (the two-point trace, the ℙ¹ pairing, the curve shifts ω•₀=ω₀[1], the node uv=ϖ at p=2 and p=3, the C_p computations); no Check refutes a statement of the same roadmap. The misprints re-verified while checking locators (AC Lemma 4.9.7(2) at AC line 4852; Z Definition 5.2.1 at Z line 3640) are already in the register from round 1 and are correctly handled in the README (lines 177, 972).

## Not verifiable

- H (Heuer, Proposition 2.18, p. 279): uncertified by the manifest; §7.7 was checked only for consistency with §7.6.
- Lean elaboration and the `#check @name` comparison: not built on this worker (no Lake environment in the content checkout); signatures compared by reading, see above.
- Board packages SchemeAndStackFoundationsPartII and PadicHodgeTheoryPartII (listed in the brief's board index): their branches no longer exist, the board's main branch keeps only their `reports/` folders, and neither is on main or in the roadmap index; ownership against them was not checked. Ownership against open pull requests whose files the brief did not give was checked only through the roadmap service grep.
- Gap `proper-generic-smoothness` (and `finite-branched-covers`): declared contracts, not raised. For the maintainer: the AdicSpacesPartIIPartII design on the board's main lists "generic smoothness and generic flatness (their §§2.2–2.5)" and Zariski-constructible sheaves among its non-goals (its design README line 13), so the intake announcement on that supplier may be refused; no earlier roadmap owns BH Theorem 2.29, so this roadmap would then have to state it as its own target.
- Z Lemmas 4.4.21–4.4.22 (§4.6 route): used through Lemma 4.4.23; not separately read this round.

## Source issues

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "0c4ae2f", "job": "RT-ClassicalAdicEtaleCohomologyPartII~2b", "model": "fable", "worker": "fable-rt43"} -->
