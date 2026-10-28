<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/971#issuecomment-6398144339 -->
Red team round 1 pass b (claude) of d2c2d15

Verdict: needs changes

1. **F01** (P2) gap `connective-totalization-truncation` asks for what EnhancedDerivedSheaves already provides

   Location: `packages/ClassicalAdicEtaleCohomologyPartII/README.md:104` ("What EnhancedDerivedSheaves must provide (gap:connective-totalization-truncation): For every i≥0 and every cosimplicial object … restriction to Δ_{≤i+1} induces an isomorphism on Hⁱ"), also lines 1189, 1207 and `design/plan.json` gaps.

   Claim: the statement is missing from EnhancedDerivedSheaves §§0.3–0.4 and must be supplied there.

   Witness: `TauCetiRoadmap/EnhancedDerivedSheaves/README.md` on main, §E5:animation.3 "Bounded totalizations" (`tot_filteredColimit_of_bounded`): for a cosimplicial diagram in `D∞(R)` with `π_i(X^q)=0` for `i>b`, `π_k` of the totalization stabilises at `Tot_r` once `r > b−k+1`; its third Check states the window `r ≥ max(0,1−k)` for the case `π_i(X^q)=0`, `i>0`. With `b=0` and `k=−i` this is exactly "Hⁱ of the totalization is computed by `Tot_{i+1}`", naturally in the diagram, for every `i≥0`. Tested on the README's own instance (line 1187): `N⁰=0`, `N¹→N²` the identity on Λ gives `H¹=0`, the window `r ≥ 2 = i+1`.

   Repair: delete the gap from the EnhancedDerivedSheaves contract (lines 104–106), from the `*Needs:*` lines of §7.4 (line 1189) and §7.5 (line 1207), and from `design/plan.json` `gaps`; in §7.4's route and in both `*Needs:*` lines write "EnhancedDerivedSheaves §E5:animation.3 (`tot_filteredColimit_of_bounded`: for terms in `D^{≥0}`, Hⁱ of the totalization is computed by `Tot_{i+1}`)". Keep EnhancedDerivedSheaves §§0.3–0.4 for the enhancement itself.

2. **F02** (P2) gap `general-nearby-coherence` is compound and stated in this roadmap's own category

   Location: `packages/ClassicalAdicEtaleCohomologyPartII/README.md:116` ("Supply the general admissible-model almost coherent nearby-cycle theorem, its derived p-completeness, reduction, amplitude [0,d] and étale base change … as in AC Theorems 6.13.5–6.13.6"), used at lines 213, 221, 233; `design/plan.json` gaps.

   Claim: PadicHodgeTheory §§2.1–2.7 can be asked for this sentence as written.

   Witness: the `needs` sentence lists five conclusions by name and refers to the source for their content; it is the only gap of the fourteen without hypotheses and quantifiers of its own. Its conclusion ("almost coherent nearby-cycle theorem") is phrased in `D_acoh(𝔛₀)ᵃ`, the category this roadmap defines in §0.1 (line 155) and which PadicHodgeTheory, 141 positions earlier in the merge order, does not have; PerfectoidSpaces P0.10/P0.29 (almost finite presentation, almost sheaves) is the vocabulary available to the supplier. The theorem itself is supplier-provable without this roadmap: AC Theorem 6.11.1 (AC line 7054) proves it for the constant coefficient `O⁺/p` on any admissible model by Noether normalisation to the polydisc and the `ℤ_p(1)^d`-torsor (AC Theorem 6.10.3, AC line 7035), with no Zariski-constructible devissage; so no cycle is hidden, only the wording is deficient.

   Repair: replace the `needs` sentence (README line 116 and the plan entry) by: "For an admissible formal O_C-scheme 𝔛 with generic fibre X of dimension d and ν:X_proét→𝔛_Zar: (1) Rν_*(O⁺_X/p) is in D⁺_qc(𝔛₀), each Hⁱ has almost finitely presented sections (PerfectoidSpaces P0.10) on every formal affine, and Hⁱ is almost zero for i∉[0,d]; (2) for 𝔛=Spf A the map Hⁱ(X_proét,O⁺_X/p)^Δ→Rⁱν_*(O⁺_X/p) is an isomorphism; (3) formation of Rⁱν_* commutes with étale base change of models; (4) the same three statements for Ô⁺_X, with Rν_*Ô⁺_X derived p-complete and Rν_*Ô⁺_X⊗ᴸO_C/p≅Rν_*(O⁺_X/p) (AC Theorems 6.13.5–6.13.6, AC line 7390)." §0.4 then states, as this roadmap's target, that the resulting complexes lie in the §0.1 category.

3. **F03** (P2) the p-power branch of §§7.4 and 7.6 cites ClassicalAdicEtaleCohomology §7.1 for a statement that section makes only for n a unit in C⁺

   Location: `packages/ClassicalAdicEtaleCohomologyPartII/README.md:132` ("7.1 supplies weak geometric field-pair comparison on its exact domain"), line 1176 ("use weak geometric base change"), line 1189 (§7.4 Needs: "7.1 (weak geometric comparison …)"), line 1213 ("use enough rank-one geometric points and weak geometric proper base change to reduce the map to field-valued proper cohomology"), line 1224 (§7.6 Needs: "7.1 (weak geometric field-pair comparison)").

   Claim: for p-power coefficients, the stalk of `Rf_*F` at a rank-one geometric point is the cohomology of the geometric fibre, and this is supplied by ClassicalAdicEtaleCohomology §7.1.

   Witness: `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md` at its open head, §7.1: the field-pair comparison there is stated for "n ≥ 1 an integer that is a unit in C⁺", so for a rank-one point of a rigid space over a mixed-characteristic field it excludes every p-power n; §7.1 otherwise defines geometric field pairs and their extensions. The statement the routes need (BH line 880: two applications of Huber Example 2.6.2 at rank-one points) is ClassicalAdicEtaleCohomology §1.5 "Limits with pseudo-adic supports", clause (c) of the strict-localisation stalk formula, stated for every coefficient ring and naming the Bhatt–Hansen use explicitly; the overconvergence inputs the same routes assert ("Zariski-constructible, hence overconvergent"; the inductive closed-complement step of §7.4) are ClassicalAdicEtaleCohomology §9.1 (proper direct images of overconvergent complexes are overconvergent, no coefficient restriction) and §3.2 (isomorphisms between overconvergent sheaves are detected at maximal geometric points). None of §§1.5, 3.2, 9.1 is cited anywhere in this README.

   Repair: in the ClassicalAdicEtaleCohomology contract (line 132) replace "7.1 supplies weak geometric field-pair comparison on its exact domain" by "1.5 supplies the strict-localisation stalk formula `(Rf_*K)_ξ ≅ RΓ(X×_Y Y(ξ),K)` for qcqs f and every coefficient ring, with Y(ξ)=Spa(C,O_C) at a rank-one point; 3.2 supplies detection of isomorphisms between overconvergent sheaves at maximal geometric points; 9.1 supplies overconvergence of proper direct images". In §7.4 (line 1176) and §7.6 (line 1213) replace "weak geometric (proper) base change" by "the rank-one stalk formula of ClassicalAdicEtaleCohomology §1.5(c), after checking overconvergence of both sides by §9.1 and §3.2", add to §7.1's API "a Zariski-constructible complex is overconvergent: lisse sheaves are, and extension by zero along Zariski locally closed immersions preserves it (ClassicalAdicEtaleCohomology §3.2)", and replace "7.1" by "1.5, 3.2, 9.1" in the two `*Needs:*` lines. Tested on the refuting instance: for n=p, Y=Spa(C,O_C), y the closed point, the formula needed is `(Rf_*𝔽_p)_y = RΓ(X,𝔽_p)`, which §1.5(c) states and §7.1 does not.

4. **F04** (P3) two incompatible indexings of the reductions 𝔛_n

   Location: `packages/ClassicalAdicEtaleCohomologyPartII/README.md:19` ("Write 𝔛₀=𝔛⊗O_C/p") against line 269 ("put 𝔛_n=𝔛×Spec(O_K/pⁿ), n≥1") and line 274 ("ω•_𝔛⊗ᴸO_K/pⁿ≅ω•_{𝔛_n} for n≥1").

   Claim: `ω•_{𝔛₀}` (used at lines 521, 537, 603, 787, 813, 953) is the n=0 member of the §1.1 family.

   Witness: under line 269 the index 0 is excluded and 𝔛₁ = 𝔛⊗O_K/p coincides with the 𝔛₀ of line 19, so `ω•_{𝔛₀}` is never defined by §1.1. Z Theorem 2.4.4 (Z line 831) indexes "for any n ≥ 0" with X₀ the mod-p fibre, and AdicSpacesPartIII R2.2 (the cited supplier) sets `X_m = X ⊗_{O_K} O_K/ϖ^{m+1}`; both start at 0.

   Repair: at line 269 write "put 𝔛_n=𝔛×Spec(O_K/pⁿ⁺¹), n≥0, so that 𝔛₀ is the mod-p fibre of the conventions"; at line 274 "for n≥0"; at line 197 "Let R=O_C/pⁿ⁺¹, n≥0". Instance: n=0 then gives ω•_{𝔛₀}=ω•_𝔛⊗ᴸO/p, which is what §2.6 (line 529) uses.

5. **F05** (P3) the design plan still scopes a Layer 6 the README does not plan

   Location: `packages/ClassicalAdicEtaleCohomologyPartII/design/plan.json`, `scope` entry `…:PD.6` and the nine nodes `PD.6/disconnected-coherent-reduction` … `PD.6/relative-integral-finiteness` (library module `TauCeti/AlgebraicGeometry/Adic/Duality/PD6`); README line 11 and 136 consume HodgeTateAndCanonicalSubgroups §7.6 instead, and the README's layer numbering jumps from 5 to 7 (lines 149, 1116).

   Claim: README and plan describe the same roadmap.

   Witness: the plan's PD.6 statements ("Proper smooth relative mod-p finiteness", "Relative finite p-power and integral local systems") are, word for word in content, HodgeTateAndCanonicalSubgroups §7.6 at its open head (`TauCeti.LogAdic.proper_smooth_local_system`: proper smooth f, 𝔽_p, ℤ/pⁿ and ℤ_p local systems, arbitrary rigid base change, geometric stalks), which the README rightly imports (HodgeTateAndCanonicalSubgroups is at position 232 < 282 and its §7.6 `*Needs:*` does not cite this roadmap).

   Repair: this is for the maintainer: the plan's `scope` and `nodes` cannot be edited at the package stage, so record in the package that PD.6 is consumed from HodgeTateAndCanonicalSubgroups §7.6 and not realised here, so that the intake does not expect `PD6` targets; no README change is needed (a renumbering of Layer 7 to Layer 6 would break the supplier citations "§7.6" elsewhere and is not asked).

6. **F06** (P3) "proper surjections induce v-covers" is attributed to sections that do not state it

   Location: `packages/ClassicalAdicEtaleCohomologyPartII/README.md:106` ("DiamondEtaleCohomology §§C0.1, C0.23 and C2.10 … proper surjections induce v-covers"), line 128 ("Proper surjections of rigid spaces induce v-covers of their diamonds"), used in §7.4 (line 1176) and §7.5 (line 1195).

   Claim: the v-cover property is among the three cited DiamondEtaleCohomology targets.

   Witness: `TauCetiRoadmap/DiamondEtaleCohomology/README.md` at its open head: C0.1 is the étale site of a locally spatial diamond, C0.23 the bounded-below full faithfulness `D⁺(Y_ét,Λ)→D⁺(Y_v,Λ)` for every ring Λ, C2.10 v-hyperdescent; none mentions surjections. The criterion is `TauCetiRoadmap/DiamondsAndVStacks/README.md` at its open head, §D2.2 (`singleton_mem_vPrecoverage_iff_surjective`: a map from a quasicompact to a quasiseparated perfectoid space is a v-cover exactly when it is surjective), which this README does not cite (it cites DiamondsAndVStacks D1 only).

   Repair: at lines 106 and 128 attribute the v-cover statement to DiamondsAndVStacks §D2.2 (transported to the diamond of a rigid space through a perfectoid pro-étale cover, DiamondEtaleCohomology C0.1), add "§D2.2 supplies the surjectivity criterion for v-covers" to the DiamondsAndVStacks contract paragraph, and add D2.2 to the `*Needs:*` lines of §7.4 and §7.5.

Scope of this pass: the whole of `packages/ClassicalAdicEtaleCohomologyPartII/README.md` (1273 lines, 54 numbered targets in Layers 0–5 and 7, 14 declared supplier gaps) and `packages/ClassicalAdicEtaleCohomologyPartII/Suggested.lean` (module docstring only, no declarations). Every section and declaration cited in a supplier was resolved against that roadmap's current text (main, or the head of its open pull request, or its board design plan); every library line was read at the pinned commits; every source locator was read in the cached extractions. Findings are ordered by severity; no P1 was found.

## Verified sound

Counts: declarations read 0 (Suggested.lean has none; the `#check @name` elaboration comparison therefore has nothing to compare and was not run); README targets read 54 (every numbered section of Layers 0–5 and 7) plus Conventions, the 14 gap contracts, Examples, Downstream consumers and Worked examples; locators verified 80 (Z 53 cited lines, AC 6, BH 10, Han 6, U 1, PS 1, FQ 2, SW 1), each read in its cached extraction at the cited line and found to carry the cited statement; Checks tested by computation 47 (table below); sibling citations checked 86 section or name citations across 20 roadmaps (AdicSpacesPartIII F0.6–F0.8, R2.2–R2.8, R3.1–R3.8; AdicSpacesPartII R0–R1, R0.19–R0.20; AdicSpacesPartIIPartII RZ.0–RZ.5 on the board design plan; PerfectoidSpaces P0.1–P0.13, P0.29, P3.11–P3.22, P5.9–P5.13.4, P6.5–P6.7, P6.15–P6.16; SchemeAndStackFoundations 0.6, 0.8–0.9, 0.21, 2.18–2.21; DerivedModuleAlgebra 0.2, 0.4, 0.8, 0.10–0.14, 1.T.1, 1.1–1.8, 1.E.1, S.1; EnhancedDerivedSheaves 0.1–0.4, E1.1–E1.5, E2:towers.1; EtaleCohomologyFoundations G.1–G.3, F.0, F.3, 0.5–0.11; RigidAnalyticGeometry 1.1–1.2 (excellence of affinoid algebras is in §1.2); ResolutionOfSingularitiesCharacteristicZero 7.5, 7.8 (`resolution_affinoid` over a reduced K-affinoid algebra, preserving the regular locus); DerivedDeRhamCohomology 1.22; ClassicalAdicEtaleCohomology 1.1–1.4, 7.1, 8.2, 8.4, 9.5, 9.7 and `IntegralSmoothProperTrace`, 10.5, 11.1; AInfCohomology AI.0:integral.1, AI.1.1–AI.1.7, AI.3.1–AI.3.2, AI.4.1, AI.6.1–AI.6.2; PadicHodgeTheory 2.1, 2.4, 2.7, 7.2; HodgeTateAndCanonicalSubgroups 7.5, 7.6; DiamondEtaleCohomology C0.1, C0.23, C1.7–C1.12, C2.10; ArithmeticGaloisDuality D7.1–D7.3, R02.1.2–R02.2.3; DiamondsAndVStacks D1.1–D1.6, D1.9–D1.11; AdicCoefficientsAndComparisons `fpCompactificationLimit`, `fpStrictCofiltered`), all present with the hypotheses the README ascribes to them except as reported in R01, R03, R06.

Library pins: `LinearMap.IsPerfPair` is at `Mathlib/LinearAlgebra/PerfectPairing/Basic.lean` line 39, `Representation.invariants` at `Mathlib/RepresentationTheory/Invariants.lean` line 73, `AlgebraicGeometry.Scheme.smallEtaleTopology` at `Mathlib/AlgebraicGeometry/Sites/Etale.lean` line 50 (Mathlib at the manifest pin); `Representation.exists_common_fixed_vector_of_isPGroup` and `Representation.invariants_ne_bot_of_isPGroup` at `TauCeti/RepresentationTheory/Unipotent/PowerOrder.lean` lines 151 and 158 with the stated hypotheses (field of exponential characteristic p, nontrivial finite-dimensional V, `IsPGroup p G`, G not assumed finite); `TauCeti.AdicSpace` at `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean` line 243 (Tau Ceti at the manifest pin). The pinned Tau Ceti tree has no étale or pro-étale site on adic spaces, no formal schemes, no perfectoid spaces and no almost-module category (listing of `TauCeti/AlgebraicGeometry/AdicSpace/*`), so the module docstring's "none statable" verdict is correct for every headline in it; the characteristic-p root-algebra duality of §3.7 (Z Theorem 4.3.2) would be statable on polynomial quotients but is an auxiliary lemma, not a headline, and the docstring says so. No padding (no declarations), no `set_option`, single `import Mathlib`, docstring in the prescribed form naming each missing carrier.

Merge order and policy: the dependency gate output is `depcheck: 51 roadmaps, 598 edges, 0 problem(s)` (no UPWARD, CYCLE or moved line); every cited supplier precedes position 282 (SchemeAndStackFoundations 2, ResolutionOfSingularitiesCharacteristicZero 6, DerivedModuleAlgebra 7, AdicSpacesPartII 8, AdicSpacesPartIIPartII 10, AdicSpacesPartIII 11, PerfectoidSpaces 13, DiamondsAndVStacks 16, EnhancedDerivedSheaves 19, EtaleCohomologyFoundations 20, DerivedDeRhamCohomology 22, ArithmeticGaloisDuality 53, ClassicalAdicEtaleCohomology 66, AInfCohomology 67, DiamondEtaleCohomology 93, AdicCoefficientsAndComparisons 121, PadicHodgeTheory 141, HodgeTateAndCanonicalSubgroups 232; RigidAnalyticGeometry is on main). No roadmap on main or at any open head cites ClassicalAdicEtaleCohomologyPartII (grep), so no cycle. The pull request changes only files under `packages/ClassicalAdicEtaleCohomologyPartII/`. No pull-request numbers, process words or `lemma` declarations in the README; every target carries a locator; the citation resolver reports no citation or Lean name found nowhere.

Ownership: greps of main and all open heads for Faltings traces, polystable models, almost coherent sheaves on formal models, mod-p Poincaré duality for rigid spaces and good quotients return no second owner; "Zariski-constructible" occurs elsewhere only as a contrast (ClassicalAdicEtaleCohomology §1.4, Huber-constructibility) or as a bibliography entry. The claimed divisions of ownership with AInfCohomology §AI.6.1 (one branch block, parameter p^q, torus coordinates separate), ClassicalAdicEtaleCohomology §9.7 ("the p-torsion duality of Zavyalov §5.4 is an external theorem on another roadmap") and HodgeTateAndCanonicalSubgroups §7.6 were confirmed in those texts.

Gaps: the remaining twelve contracts are precise, minimal and declared under the same slug in `design/plan.json` and the README: the valuation-base duality trio matches Z Theorem 2.2.3, Lemma 2.2.13 and Theorem 2.3.7 (Z lines 507, 635, 755) and is absent from SchemeAndStackFoundations §§2.19–2.21 (qcqs bases with `DQCoh`, Noetherian reflexivity in §0.6); the AdicSpacesPartIII quartet matches AC Theorem 5.1.5, Z Theorem 2.7.1, Z Lemma B.5, FQ Remark 3.3.3/Theorems 3.3.4, 4.4.1 and Z Theorem 4.4.1 (AC line 4990; Z lines 1125, 4217, 3188; FQ lines 756, 1349) and is absent from F0.8 (Noetherian formal GAGA) and R2; the two AdicSpacesPartIIPartII contracts match Han Theorem 1.6 and BH Theorem 2.29 (Han line 134, BH line 567) and are absent from its design nodes RZ.1, RZ.2, RZ.4; the integral toric field extension matches BH Lemma 3.25's proof (BH line 1113); the quasi-excellent direct-image contract matches Han Proposition 4.2 (Han line 801) and exceeds EtaleCohomologyFoundations F.3 (field and excellent-trait forms).

Adversarial table (statement; instances tried; values on each side; result):

| Statement | Instances | Values | Result |
|---|---|---|---|
| Conv. trace sign (l.27) | ℙ¹_C, Λ(1) | point class in H², trace 1; Λ[2] in degree −2 | sound |
| Conv. twist change (l.28), §2.5 Check 1 | Φ=Sch∘j | jΦ⁻¹=Sch⁻¹; source ×a gives a⁻¹dlog T | sound, matches Z Thm 3.4.12 diagram (Z line 1957) |
| Conv. p=2 sign (l.29) | swap coordinates | dT₁∧dT₂ ↦ −dT₁∧dT₂; −1=1 mod 2 | sound |
| Conv. almost zero (l.30) | O_C/p vs O_C/𝔪_C | ε·1≠0 for 0<v(ε)<v(p); 𝔪_C kills O_C/𝔪_C | sound |
| Conv. two-point trace (l.31) | p=2 | (1,1)↦0, (1,0)↦1 | sound |
| Conv. ramified point (l.32) | K=ℚ_p(π), π²=p | π≠0, π²=0 in O_K/p; π↦0 in k | sound |
| §0.1 Check 3 | ⊕̂O_C, ε with v(ε)<v(p) | εe_i nonzero in ⊕O_C/p in infinitely many coordinates, not in any f.g. N | sound |
| §0.2 Checks 4–6 | ℙ¹ over O_C: O, O/p, O(−2); 𝔪_C | H⁰=O_C, Hⁱ=0; H⁰=O_C/p; H¹(O(−2))=O_C·T⁻¹; p^{1/n} has valuation 1/n<δ | sound |
| §0.3 Checks | f=id; smooth curve; two points | counit 1↦1; f!O=Ω¹[1]; (1,0)↦1 | sound |
| §0.4 Check 4 | Spf O_C[ε]/ε² | O_X⁺=O_C⊕Cε, Cε p-divisible, O⁺/p=O_C/p, Ô⁺=O_C killed by ε | sound |
| §0.5 Checks | O_𝔛, O/pⁿ, lattices | O_X; 0 for n≥1; C-lines equal | sound |
| §1.1 Check 3 | R=ℤ_p[pT,T²,T³]^ | pT∉pR, (pT)²,pT·T²,pT·T³∈pR; R/p non-CM; H⁰(ω•_{𝔛₀})≠0 forces ω• not bottom-only | sound |
| §1.1 indexing | n=0 | 𝔛₀ undefined by line 269 | R04 |
| §1.2 Check 1 | U=2T, p odd | dU=2dT, determinant 2 a unit | sound |
| §1.3 Checks | 𝔘=𝔛, 𝔘=∅, Spf O_K | F; j_{K,*}F_K with sections K; pairs (a,a), (1,0) excluded | sound |
| §1.4 statement vs Z Thm 2.5.5/Lemma 2.5.4 (Z lines 1032, 987) | reflexive F, reduced k-fibre, dense 𝔘 | iso without smooth 𝔘 | sound |
| §1.5 Check 3 | degree-p disjoint union | Tr(1,…,1)=p, 0 mod p | sound |
| §1.7 Check 4 | ℚ_p(√p) | O_L/p=𝔽_p[t]/t², Z Lemma B.7 forces model O_L; over C: O_C×O_C | sound |
| §1.7 Example | S=Tʳ | Tr(dlog T)=dlog S, Tr f^*dlog S=r dlog S | sound (Z Lemma 2.7.9) |
| §2.1 Check 1 | O_C⊕O_C/p² | power-torsion quotient O_C | sound |
| §2.1 p=2 | x∪x | 2x²=0, 2-torsion-free ⇒ x²=0 | sound (Z line 1365) |
| §2.2 Check 2 / §2.3 API | smooth model | im Φⁿ=aⁿR̃ⁿ, aⁿΨ′(x)=ι_n(Φ⁻¹(aⁿx)) | sound (Z line 1653) |
| §2.3 Check 3 | d=1 | ranks 1,1,0 | sound |
| §2.4 Checks | polydisc; uv=ϖ; t²=ϖ | reduced; uv=0 reduced; t² =0 nonreduced, generic C×C smooth | sound |
| §2.6 shifts | smooth curve | target Ω¹ᵃ(−1)[−1]; bottom inclusion (ω/p)[−d]→ω•₀[−2d] | sound |
| §2.7 definition | rig-isomorphism, finite map | proper automatic (Z Lemma B.1); amplitude [0,d] imposed | sound |
| §3.1 Checks | ϖ nonunit; units; uv=0 | nice, polystable; torus after eliminating t₀; singular at 0 | sound (Z Def 4.2.1: ϖ_i∈O_C∖0) |
| §3.2 Check 3 | p=2, uv=ϖ, m=1 | fibre k[x,y]/(x²,y²,xy) length 3; generic rank 2 | sound |
| §3.3 Checks | u·v; (1,0)+(0,1); units | ϖ·1; min 1; isomorphisms | sound (Z Lemma 4.2.21) |
| §3.4 Checks | Γ=ℤ_p trivial; order pᵐ; Γ=1 | H⁰=H¹=O_C; H¹=O_C/(ζ_{pᵐ}−1) killed by ζ_p−1; degree 0 only | sound |
| §3.5 brackets | O_C | O_C/O_C[a]=O_C ≠ O_C/a | sound (Z line 2804) |
| §3.6 Checks | tr_m(1), tr_m(T^{1/pᵐ}), tr_m(T) | 1, 0, T | sound (Z Def 4.3.1) |
| §3.7 Check 2 | p=2 node | Ann(x)=(v), Hom(Ax,A)=(u); Hom(Ay,A)=(v) | sound |
| §3.7 Check 3 | p=2, m=1 torus | matrix diag(1,T), det T unit | sound |
| §3.8 Check 3 | swap basis | determinant −1 | sound |
| §3.10 Check 2 | curve | ω(−1)[−1]; ω•₀(−1)[−2]=ω₀(−1)[−1] | sound |
| §4.1 Check 3 | 1-dim space | both adjoints 1; IsPerfPair | sound |
| §4.3 Check 2 | G×𝔛 | trivial torsor, finite, nice | sound |
| §4.4 Checks | C_p trivial mod p; S₃ regular; C₃ over 𝔽₂ | H¹=M[p]=M; one invariant sum; 3⁻¹=1 | sound |
| §4.6 Check 2 | split C_p torsor | Tr(1)=p=0, component trace 1 | sound (Z Lemma 4.4.19) |
| §4.7 hypothesis | nonreduced t²=ϖ | excluded; Z Thm 4.1.2 states "nice" | sound (source misprint in 4.4.24 noted) |
| §5.1 Checks | point; two points; curve | identity; sum; H²→O_Cᵃ/p(−1) needs [−2d] | sound (Z Def 5.2.1 misprint noted) |
| §5.3 Check 1 | 0:𝔽_p→𝔽_p | kernel, cokernel O_C/p not almost zero | sound (Z Lemma 5.4.3) |
| §5.4 Check 4 | char p ℙ¹ | H²(𝔽_p)=0 by Artin–Schreier, H⁰=𝔽_p | sound |
| §5.5 Check 3 | C₂ Jordan block over 𝔽₂ | fixed line e₁; degree-2 trace 0 | sound |
| §5.6 Check 3 | ℤ/pⁿ⊗ᴸ_{ℤ_p}𝔽_p | Tor₁=𝔽_p; over Λ_n none | sound |
| §5.7 ℚ_p remark | qcqs X | RΓ(ℤ_p)[1/p] | sound (Z line 3972) |
| §5.8 Check 2 | [ℤ_p→pℤ_p] | H¹=ℤ/p, Ext¹=ℤ/p | sound |
| §5.9 Check 3 | two points | diag(1,1) | sound |
| §7.1 Check 1 | skyscraper in closed disc | complement = ∪{|T|≥|ϖ|ⁿ}, open, not qc (no point infinitesimally near 0 is continuous) | sound (BH Warning 3.2) |
| §7.1 Check 3 | ⊔ points, Λ[j] | locally bounded, not bounded | sound |
| §7.4 Check 4 | {a}→disc | S_f=Y∖{a}; for a,b: Y∖{a,b} | sound |
| §7.4 Check 5 | N⁰=Λ=N¹ id; N⁰=0,N¹→N² id | H⁰=0; H¹=0 | sound; shows R01's window |
| §7.5 Check 4 | nodal rational curve | H⁰=Λ, H¹=Λ (coker of 0), H²=Λ(−1) | sound |
| §7.6 Checks | g=id; n=1; empty source | identity; 0→0; 0 | sound |
| §7.7 Check 3 | Z=pt, Y=ℙ¹ | sheaf in degree 2 zero; H²(Z×Y)=Λ(−1) | sound |

Proof-route inputs: every other cited input of a route is a target here, a cited supplier section verified above, a declared gap, or a pinned declaration; the §7.5 route's use of hyperdescent before and after extension relies on DiamondEtaleCohomology C0.23 (every ring Λ) and C2.10 (every Λ), both confirmed.

## Not verifiable

- H (Heuer, Proposition 2.18, p. 279): uncertified by the manifest; the §7.7 statement was checked for consistency with §7.6 (proper base change applied to Z×Y→Y gives the constant pullback) but not against the text.
- Z equations (3.6)/(3.7) and Lemmas 3.4.5–3.4.8 (§2.5): the cited page region (Z lines 1880–1960) carries Corollary 3.4.9 and Theorem 3.4.12 with the three-object diagram; the displayed equation numbers were not individually located in the extraction.
- Z Lemmas 4.4.21–4.4.22 (§4.6 route): used by Lemma 4.4.23's proof (Z line 3551); their statements were not separately read.
- The AdicSpacesPartIIPartII sections RZ.0–RZ.5 exist only as the board design plan (no README yet); labels and statements were checked there.
- Lean: nothing to build (no declarations); "not built".

## Source issues

- **Misprint** in Z at Definition 5.2.1, p. 75: the displayed target of the global trace carries the shift [2d]; it should be [−2d], as in the composition displayed on the next line and in Theorem 5.2.4; affects nothing.
- **Misprint** in Z at Theorem 4.4.24, p. 74: the hypothesis asks only for a separated admissible model with smooth generic fibre, although Faltings' pairing is defined (Definition 4.1.1) only for nice models and Theorem 4.1.2 states the result for nice models; it should read "nice admissible formal O_C-scheme"; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d2c2d15", "job": "RT-ClassicalAdicEtaleCohomologyPartII~1b", "model": "fable", "worker": "fable-rt30"} -->
