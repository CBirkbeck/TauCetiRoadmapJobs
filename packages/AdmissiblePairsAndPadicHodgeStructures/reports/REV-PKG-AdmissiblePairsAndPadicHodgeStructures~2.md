<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1092#issuecomment-6393554647 -->
Review (claude) of 57fb70a

Verdict: accepted
Conditional on the announced gaps: `tannakian-canonical-reduction`, `strict-field-serre-openness`, `adjoint-kernel-and-orbit-differential`, `observable-subgroup-embedding`, `basic-hodge-type-uniformization`, `rational-rigidified-bkf-modifications`, `arbitrary-field-full-rank-de-rham`, `ordinary-katz-igusa-monodromy`, `localized-period-module-descent`

1. **F01** (P3) §5.1 defines the Grassmannian only for G/Q_p, while the repaired §5.3 states its geometry for G over a p-adic L

   - **Location.** `packages/AdmissiblePairsAndPadicHodgeStructures/README.md` line 940 (§5.1): "For connected linear G/Q_p, Gr_G is the étale sheaf quotient G(B_dR)/G(B_dR+)…". Line 979 (§5.3, rewritten for F05): "For connected linear G/L, with L a p-adic field, Gr_G is separated and partially proper over Spd L…".
   - **Claim.** The carriers used in §5.3 are the ones defined in §5.1.
   - **Witness.** HKII Definition 5.0.1 (HKII line 1347) and Theorem 5.0.4 (HKII line 1419) take G over a p-adic L. For G = GL_1(D_L), D_L the quaternion division algebra over L = Q_p(√p) (no Q_p-model), §5.1 defines no Gr_G.
   - **Repair.** In §5.1, replace "For connected linear G/Q_p" by "For a connected linear group G over a p-adic field L (L = Q_p from Layer 6 on)", with Gr_G over Spd L and Gr_[mu] over Spd L([mu]), as in HKII Definition 5.0.1. Leave §5.3 as it is. Tested: for G = GL_1(D_L), Gr_G is now defined over Spd L, and §5.3 applies to it as stated.

2. **F02** (P3) The "in particular" clause of §0.5 drops the condition that C is the completed algebraic closure of K0

   - **Location.** README line 289 (§0.5): "In particular this applies to B_dR and the Galois action of a discretely valued p-adic K0⊂C with infinite cyclotomic extension."
   - **Claim.** Proposition 3.1.7(2) applies to any p-adic K0 inside an arbitrary C.
   - **Witness.** HKI Example 3.1.10 (HKI line 1083) requires C to be the completed algebraic closure of K, with Γ = Gal(K̄/K). For K0 = Q_p and C the completed algebraic closure of Q̆_p(T)^∧, Gal(Q̄_p/Q_p) does not act on C.
   - **Repair.** Replace the sentence by "In particular this applies to B_dR(C) with C the completed algebraic closure of a p-adic field K0 and Γ = Gal(K̄0/K0) (HKI Example 3.1.10)". Drop "with infinite cyclotomic extension", which is automatic. Tested on K0 = Q_p and C = C_p: C_p^Γ = Q_p lies in the coefficient field Q̄_p, and Γ acts on t through the cyclotomic character, which has infinite order.

3. **F03** (P3) Four consumer pointers name source sections where the README's own sections are meant (the F07 pattern)

   - **Location.** Line 223 (§0.1): "HK II §3.1: Defines both Bialynicki–Birula filtrations…". Line 250 (§0.2): "HK I Theorem 3.2.6: … HK II §§5–7: Defines fixed-type cells and family types." Line 503 (§2.1): "HK II §6: …". Line 530 (§2.2): "HK II §7: …".
   - **Claim.** The consumers of these interfaces are named.
   - **Witness.** The consuming README sections are §4.4 (relative BB filtrations), §0.4 (exactness), §§5.1 and 6.4 (cells, family type), §7.1 and §6.1 (neutral families). Line 223's following bare "§5.1" then reads as HK II §5.1.
   - **Repair.** Replace "HK II §3.1" by "§4.4", "HK I Theorem 3.2.6" by "§0.4", "HK II §§5–7" by "§§5.1 and 6.4", "HK II §6" by "§7.1" and "HK II §7" by "§6.1". Tested: each replacement heading exists, and each consumes the interface it is attached to.

4. **F04** (P3) Duplicate Needs and Dependencies entries, and Dependencies lists split by blank lines

   - **Location.** Line 706 (§3.2) and line 718 (§3.3) each list "PadicHodgeTheory §5.5" twice, and so do the Layer 3 Dependencies (lines 742–743). Line 1184 (§6.7) and lines 1230–1231 list "DiamondSixOperations §S2.4" twice. Line 2058 (§12.4) and lines 2091–2092 list "PerfectoidShimuraVarieties §§3.1 and 3.5" twice. A blank line splits the Dependencies list after the inserted Tau Ceti items at lines 641, 1040, 1384, 1538 and 1797.
   - **Claim.** Each Needs line lists what the target uses, item by item.
   - **Witness.** Each pair is the same string twice. The blank lines came with the F03/F04 insertions; the round-1 head had none.
   - **Repair.** Delete the second copy of each duplicate and the five blank lines. Tested: the dependency check still reports 0 problems, because the set of cited sections does not change.

Independent round-2 review of `packages/AdmissiblePairsAndPadicHodgeStructures/README.md`, `Suggested.lean`, `metadata.toml` and `sources.toml` at board head 57fb70a. All eight round-1 findings (F01–F08) are repaired. The repairs introduced one small inconsistency (R01). Three more P3 notes come from the pattern search and the sampled locators (R02–R04). There is no P1 or P2 finding. Acceptance is conditional on the nine declared supplier gaps.

## Verified sound

### Round-1 findings, one by one

| Id | Repaired passage (quoted) | Status |
| --- | --- | --- |
| F01 | Line 3: "identifies the opposite analytic closure of an irreducible analytic set with an opposite-special subvariety (Hodge–Tate special for a Hodge analytic set, and Hodge special for a Hodge–Tate analytic set)". Matches HKII Theorem 9.1.3(2), HKII line 2486. | repaired |
| F02 | Line 237: "Let R be a complete DVR of characteristic zero with algebraically closed residue field k and a coefficient section k→R". The same hypothesis is at line 277 (§0.4). HKI §3 sets up an algebraically closed coefficient field and residue field (HKI line 890), and HKI line 1151 uses it. | repaired |
| F03 | Lines 63–64 cite `TauCeti.Subcomodule.exists_finite_subcomodule_mem`, `iUnion_finiteSubcomodules_eq_univ` and `TauCeti.HopfIdeal.exists_finite_subcomodule_exteriorPower_line_stabilizer`. The countable-Chevalley gap is gone from the README and from `design/plan.json`. The observable gap is narrowed (line 82). The Needs of §§2.5, 5.2, 5.3, 7.6, 8.3, 10.1 and 10.2 cite the pinned declarations. | repaired |
| F04 | Line 1761: "DiamondsAndVStacks D5.10 identifies the product topology and makes each parameter projection universally closed". It is in the §10.2 Needs, the Layer 10 Dependencies and the contract (line 112). | repaired |
| F05 | Line 979: "a locally closed locally spatial subdiamond of Gr_G ×_(Spd L) Spd L([mu]), partially proper over Spd L([mu])". Line 1904: "For an algebraic Z′⊂Fl_[mu],L([mu]) defined over L([mu])". Both match HKII lines 1425–1428 and line 274. | repaired (it introduced R01) |
| F06 | Line 1499: "a quadratic extension F/Q_p embedded in the quaternion division algebra D gives the special period points P^1(F)". Matches HKII Remark 7.5.8 (HKII lines 2210–2215). | repaired |
| F07 | None of the six snake_case labels remains: a grep for `lattice_recovery`, `special_loci`, `bi_analytic` and "Layer 10 exceptional/generic locus" or "Layer 11 closures" returns nothing. Lines 596, 768, 1111, 1419 and 1653 now give § numbers. | repaired (pattern instances remain: R03) |
| F08 | All 211 "`<source>` line N" citations (157 distinct lines) point at statement lines and none at a page marker. I checked this with a script over the five cached texts. References line 2108 dates Scholze arXiv v2 to 2012, and that text is dated 3 Nov 2012. BhattHansen is cited in §10.3 (line 1777, lines 310/314/346). Daniels–van Hoften–Kim–Zhang and Chambert-Loir–Loeser are cited through HKII lines 2920/3010 and 2919/3003. | repaired |

### Elaboration and the form of Suggested.lean

- I ran `lake env lean` on `packages/AdmissiblePairsAndPadicHodgeStructures/Suggested.lean` from the content checkout at the pins: exit 0, no output, 3.7 s. The pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. There are no `TauCeti.*` imports, hence nothing to build. No Lean process was left running.
- The file has one `import Mathlib`, no `set_option`, the namespace `TauCetiRoadmap.AdmissiblePairsAndPadicHodgeStructures`, one module docstring of the required form, and zero declarations.
- The `#check @name` binder comparison has an empty domain. The one-tactic padding probe has nothing to probe, so there is no padding.
- Headline theorems: HKII Theorem 9.1.3 (§11.5), Theorem A (§11.6), Theorem B (§11.7) and HKI Theorem B (§3.4). The docstring names all four with their missing carriers, and none is statable at the pins: there is no Fargues–Fontaine curve with bundles, no diamonds and no modification categories.
- The docstring's library claims hold at the pins. `TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Quotient.lean` is only the topological Frobenius orbit space; its docstring says the sheaf of rings is still missing. `TauCeti/Geometry/Hodge/` holds classical complex Hodge structures.

### Library declarations opened at the pins

- Mathlib `RingTheory/WittVector/Isocrystal.lean`, lines 113, 132, 138, 157, 172, 180. `isocrystal_classification` needs `[IsAlgClosed k] [CharP k p]`.
- Mathlib `Topology/Baire/Lemmas.lean` lines 141 and 256 (`[Countable ι]`), `Topology/Baire/CompleteMetrizable.lean` line 25, and `RingTheory/Perfectoid/BDeRham.lean` lines 75 and 88.
- Tau Ceti `Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean` line 138.
- Tau Ceti `Algebra/AlgebraicGroup/Representation/ExteriorStabilizer/Character.lean` line 101. Context: `[Field k]`, `H : CommHopfAlgCat k`, `hI : I.toIdeal.FG`. Its conclusion is a finite subcomodule, a line in an exterior power, a unique character, and the stabilizer equality over every `A : CommAlgCat k`, as the README states.
- Tau Ceti `Algebra/Coalgebra/Subcomodule/Finite.lean` lines 144 and 292. Context: `[CommSemiring R]`, `[Module.Free R C]`, as the README states.
- No pinned declaration supplies a gap. Tau Ceti's `Tangent/Representation.lean` builds the adjoint representation but no theorem identifying its kernel with the center (`Center/Basic.lean` builds the center scheme). No Tau Ceti or Mathlib file has quotients of algebraic groups or observable subgroups; Mathlib's `AlgebraicGeometry/QuasiAffine.lean` is about schemes only.

### Dependency check (verbatim)

The command, with repository-relative paths: `gate --depcheck packages/AdmissiblePairsAndPadicHodgeStructures/README.md --name AdmissiblePairsAndPadicHodgeStructures --order merge-order/ORDER.txt --movable`.

```
depcheck: 48 roadmaps, 553 edges, 0 problem(s)
```

It printed no UPWARD, CYCLE or `moved:` line. The roadmap is at line 245 of the merge order, and every named supplier comes earlier: AdicSpacesPartV 10, PerfectoidSpaces 13, DiamondsAndVStacks 16, ReductiveGroupsPartII 25, AInfCohomology 66, MotivesAndAlgebraicCycles 86, DiamondSixOperations 94, PadicHodgeTheory 141, VectorBundlesAndIsocrystals 144, RelativeFarguesFontaine 148, GeometricSatakeAndFusion 151, EndoscopicTransferAndUnitaryTraceComparison 166, HilbertModularVarietiesAndShimuraCurves 177, PerfectoidShimuraVarieties 235, IgusaVarietiesAndTorsionConcentration 239, BunGAndNewtonStrata 241, HeckeStacksAndLocalShtukas 244. ReductiveGroups, AdicSpaces, AlgebraicVectorBundles and PerfectoidSpaces are on main. No roadmap on main or in an open pull request cites this roadmap, so there is no reverse edge.

### Cross-roadmap citations resolved

- `roadmaps resolve` on the current README, against main b41e47b and 352 open heads: no citation or Lean name found nowhere.
- DiamondsAndVStacks D5.10 (*profinite-products-of-locally-spatial-diamonds*), read at the head of its pull request (7c7453f): for profinite P in the chart universe, the product is locally spatial, its underlying space is the product P × |S|, and the projection is qc, separated and universally closed. Contract line 112 restates this correctly.
- AdicSpacesPartV: all 16 RZ anchors are present in `packages/AdicSpacesPartV/design/README.md`.
- BunGAndNewtonStrata: all 10 anchors are present. VectorBundlesAndIsocrystals: all 9. ReductiveGroupsPartII: all 5.
- GeometricSatakeAndFusion: the `grassmannian`, `schubert-bounds-and-properness`, `open-cell-stabilizer-and-smoothness`, `truncated-positive-loops` and `truncation-of-the-loop-action` anchors exist as ids.
- Gap target sections exist at their heads: MotivesAndAlgebraicCycles §§6.1–6.3, 6.8; PadicHodgeTheory §§5.5, 7.1, 7.4; AInfCohomology §§AI.2.2–AI.2.3; PerfectoidShimuraVarieties §§2.2, 3.1, 3.5; IgusaVarietiesAndTorsionConcentration Layer IG.1; RelativeFarguesFontaine §§4.10–4.12, 6.6–6.9, 7.6. The heading of §7.6 has a stray backtick.
- On main: ReductiveGroups Layer 2 only defines Ad and gives no kernel theorem. ReductiveGroups Layers 3 and 3A give fppf quotients with representability "as a theorem with hypotheses" and orbit local closedness, but not quasi-affineness of a vector-stabilizer quotient.

### Declared gaps

- The 9 slugs are identical, with the same supplier and the same `needs` sentence, in the README and in the top-level `gaps` of `design/plan.json`. I checked this with a script.
- No node in `plan.json` still refers to the withdrawn `countable-chevalley-lines` gap.
- Every gap names a supplier that is earlier in the order or on main, and none asks for something already provided.
  - PadicHodgeTheory §5.5 has no Serre openness, and §7.1 has the associated-lattice functor but no full-rank criterion.
  - MotivesAndAlgebraicCycles has no canonical reduction.
  - AInfCohomology AI.2.2 has the crystalline-rigidified variant, not rational rigidified modifications.
  - IgusaVarietiesAndTorsionConcentration has no Katz–Igusa ordinary tower.
  - PerfectoidShimuraVarieties has no basic uniformization.
  - RelativeFarguesFontaine §7.6 descends B⁺ torsors, not B_D-modules.
- Two wording judgments. The observable gap ends with a clause asking to "distinguish" the conclusion from the affine hypothesis. This asks for a non-example, not a theorem, but the theorem requested is precise and HKII line 1490 uses exactly that implication. The adjoint gap's "image and kernel formulas" are the standard ones consumed in §11.4 (surjective differential with parabolic kernel). I judged both precise enough.

### Ownership and duplication

- I ran `roadmaps grep` on main and on the 352 open heads for Ax–Lindemann, "admissible pair", "p-adic Hodge structure", non-reductive or connected-linear Grassmannians, and two-lattice/CM.
  - Ax–Lindemann elsewhere is complex, abelian or Ax–Lindemann–Weierstrass: DiophantineApproximationAndTranscendence, ShimuraVarieties, AbelianSchemesAndArithmeticModuliPartII.
  - "Admissible pair" elsewhere has unrelated meanings: Coleman pairs, Dennis–Stein pairs, Morse–Novikov.
  - Howe–Klevdal is cited elsewhere only as a source.
- No Grassmannian match exists anywhere. This roadmap is the owner of its objects. Reductive constructions are imported, not restated.

### Sampled locators (15, all read in the cached texts)

| Target | Source checked | Outcome |
| --- | --- | --- |
| 0.4 | HKI Theorem 3.2.6, p. 25 (HKI line 1176); setup HKI line 890 | matches; residue-field hypothesis now present |
| 0.5 | HKI Proposition 3.1.7 (HKI line 1043), Example 3.1.10 (HKI line 1083) | matches, except the "in particular" clause (R02) |
| 1.1 | HKII §4.1 (HKII line 1173), Remark 4.1.1 (line 1191); HKI §2.2.3 (HKI line 636) | matches |
| 1.3 | HKII lines 1199–1205, equation (4.1.1.1); HKI line 686 | matches |
| 1.5 | HKII Theorem 4.2.2, (4.2.2.1)–(4.2.2.2) (HKII line 1249) | matches |
| 3.3 | HKI Corollary 5.5.3 (HKI line 2167); HKII lines 2577–2581 | matches; the step to F′ is the README's expansion of the source's open-inertia step |
| 4.4 | HKII (3.1.0.1), Example 3.1.1, (3.1.1.1), Lemma 3.1.2 (HKII lines 948–1005) | matches |
| 5.1 | HKII Definition 5.0.1, Proposition 5.0.3 (HKII lines 1347–1413) | matches, except that the source's G/L is narrowed to G/Q_p (R01) |
| 6.7 | HKII Lemma 7.3.5 (HKII line 2028); separatedness is part of compactifiability in DiamondSixOperations S0.1 | matches |
| 7.6 | HKII Proposition 6.4.1, Definition 6.4.2 (HKII lines 1765–1788) | matches; the weight ≥ −1 condition is on μ_H |
| 8.2 | HKII (7.5.0.1) (HKII line 2104) | matches: g f(b_H) σ(g)^{−1} = b_G and L ↦ g·(L ×^H G) |
| 9.5 | HKII Lemma 8.4.2, Remark 8.4.3, Example 8.4.4 (HKII lines 2366–2397) | matches |
| 11.1 | HKII Definition 9.1.1, Remark 9.1.2, footnote 5 (HKII lines 2458–2496) | matches |
| 11.8 | HKII Remark 9.1.4 (HKII line 2499) | matches |
| 12.4 | HKII §10.1 (HKII lines 2892–2914), footnote 7 (line 2920) | matches; the README's quotient by Γ corrects the source's product (Source issues) |

The author flagged no locator as unverified. I also read the passages at the F01, F05 and F06 locators (HKII lines 2481–2490, 1419–1442, 218–292 and 2186–2215), HKII Lemma 5.1.1 (HKII line 1495), Proposition 9.3.4 (HKII line 2663), Theorem B (HKII line 501), HKI Definition 4.2.1 (HKI line 1544), HKI §4.4 (HKI lines 1663–1743) and BhattHansen lines 310–348.

### Adversarial pass

These rows cover every passage the repairs changed or added, the 15 sampled targets, and the round-1 rows that carried no computed value. For the untouched text I rely on the round-1 table rows that carry computed values (0.1, 0.3, 1.2, 1.4, 1.6, 2.1–2.7, 3.1–3.4, 4.1–4.3, 4.5–4.7, 5.4–5.6, 6.1–6.3, 6.5, 6.6, 6.8, 7.1–7.5, 8.1, 8.3, 8.4, 8.6, 9.2, 9.4, 9.6, 9.7, 10.1, 10.3, 11.4, 11.7, 12.1–12.3, 12.5).

| Statement | Instances | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| Summary (F01) | inverse mirabolic in Res_{E/Q_p}GL_2, μ=(−1,−1,2), b=1; GL_2 (1,0) | Lie weights 0,−1,2: lower bound true, upper false, so HT-special but not special; GL_2 weights −1,0,1 give both bounds | holds | — |
| Conventions, Tate table | Q_p(1) | Frobenius p^{−1}σ, slope −1; E(W)=O(1); modifying by Fil^1 gives O(1−1)=O; L_dR=Fil^{−1} (HKI line 1584); weight −2=2·(−1) | holds | — |
| §2.6 HS type convention | Q_p(1) | L_dR=Fil^{−1} ∈ Gr_[μ^{−1}], so μ=1; B(G_m,[μ^{−1}]) means κ=−1, b=p^{−1}, slope −1 = the isocrystal of Q_p(1); Newton −1 = half the weight −2 | holds | — |
| Tau Ceti exhaustion (F03) | G_m; zero comodule | V_i = span{x^j : −i≤j≤i}, dim 2i+1, union Q_p[x,x^{−1}]; zero comodule lies in V_0 | holds | — |
| Tau Ceti Chevalley line (F03) | μ_m ⊂ G_m, line Q_p(1+x^m) ⊂ V_m; H=G | translation gives 1+a^m x^m, which spans the same line iff a^m=1; H=G gives degree n=0, line ⋀^0=k, stabilizer G | holds | — |
| Gap: observable quotient | U ⊂ SL_2 (vector stabilizer of e1) | SL_2/U ≅ A²∖{0}, quasi-affine; its global functions are k[x,y], so it is not affine | the gap is precise and not provided | — |
| D5.10 contract (F04) | P=∅; P two points; P=ℕ | product ∅, S⊔S; images ∅, Z1∪Z2 are closed; for ℕ the points p^n → 0 and the image misses 0 | holds | — |
| §0.2 (F02) | split torus; G_a ⊂ GL_2; PGL_2 over Q_p[[t]] | torus: T(K)/T(R)=X_*(T), all good; G_a: only μ=0, so t^{−1} is not good; PGL_2: H¹(Q_p[[t]],PGL_2)=H¹(Q_p,PGL_2)=Z/2 (Hensel), invariant 1/2 → 0 over Q̄_p[[t]], type 0 | holds | — |
| §0.4 (F02) | GL_2 μ=(1,0); G_a extension | good: BB1 type (−1,0), BB2 type (1,0); G_a: quotient trace image 0 against k, so inexact and not good | holds | — |
| §0.5 (sampled) | GL_2 (1,0); GL_2 (2,0) | weights −1,0,1: the stabilizer is the preimage of the parabolic, so BB is bijective onto P¹; weights −2,0,2: the fibre is tB⁺/t²B⁺ ≅ C ≠ point | holds; R02 | R02 |
| §1.1 (sampled) | Borel, b=diag(p,1); b=1 | Ad on e12 is multiplication by p, slope 1 ≠ 0: not Borel-basic, but basic in T; b=1 has slope 0 | holds | — |
| §1.3 (sampled) | GL_2, b=diag(p,1); simple slope ½ | σ-centralizer: diagonal entries in Q_p^×, off-diagonal b′=pσ(b′) and pc=σ(c) force 0, so T(Q_p), dim 2 ≠ 4; slope ½ gives D^×, an inner form | holds | — |
| §1.5 (sampled) | G_a, b=1 | H¹(FF,O)=0 and Aut=H⁰(O)=Q_p, so the stratum is [*/Q_p] | holds | — |
| §3.3 (sampled) | Q_p(k), k≠0, K=Q̆_p, p=2,3 | image χ^k(G_K) = (Z_p^×)^k, finite index, open in Q_p^× = MG(Q_p) | holds | — |
| §4.4 (sampled) | L2=Fil^a in L1=B⁺; disc ⟨e1,e2+(z/ξ)e1⟩ | jumps at i=−a and i=a; z≠0: minimum valuation −1, det 0, type (1,−1); z=0: (0,0) | holds | — |
| §5.1 (sampled) | G_m; G_a | Gr_{G_m}(C)=Z, each cell a point; Gr_{G_a} ∋ ξ^{−1}, good cell {0} | holds; R01 | R01 |
| §5.2 (F03) | H=G_m acting on v by χ(h)=h, h=2 | (2,½)·v = ½·2v = v; (2,2)·v = 4v ≠ v; stabilizer is the graph of χ^{−1} | holds | — |
| §5.3 (F05) | G_m; GL_2 (1,0); GL_2 (2,0) | point Spd L, closed; P¹, closed and proper; (1,1) ≤ (2,0) lies in the closure, so the cell is not closed | holds | R01 (definition side) |
| §6.4 (thin row) | G_m family on connected S; S=Spa L′ with L′/L finite | type a is constant and Galois-fixed, so defined over L; for Spa L′ the statement is taken over the constant field L′ | holds (conditional on the gap) | — |
| §6.7 (sampled) | X=Y=Spd C; X = two points | F_ℓ⊗F_ℓ = F_ℓ, one component; outside the hypothesis 2·1 = 2 components | holds | — |
| §7.6 (sampled) | μ_H weights (0,−1,2) and (0,1,−2); Q_p(−n) | first passes ≥−1, second fails; rank-one pure weight 2n is even, and the central weight cocharacter lies in H, so the line lies in one weight | holds | — |
| §8.2 (sampled, thin row) | T ⊂ GL_2, b_H=diag(p,1), b_G=diag(1,p), g=w; g=diag(u,1) with σ(u)≠u | w b_H w^{−1} = diag(1,p) with σ(w)=w; σ-conjugate diag(up/σ(u),1) differs from the conjugate diag(p,1) | holds | — |
| §8.5 (F06) | F/Q_p quadratic, ramified or unramified, p=2 | D^× acts transitively on D∖0 with D a right F-space of dimension 2, so D^×/F^× ≅ P_F(D) ≅ P¹(F); Q_p-dimension 4−2 = 2 = 2·1 | holds | — |
| §9.1 (thin row) | G_m, b=p^n | étale frames Q_p^×, isocrystal frames G_b(Q_p)=Q_p^×; the actions act on separate factors and commute | holds | — |
| §9.3 (thin row) | H→G→G′ with g1, g2 | (g2 f2(g1))(f2f1)(b_H)σ(g2 f2(g1))^{−1} = g2 f2(b_G)σ(g2)^{−1} = b_{G′} | holds | — |
| §9.5 (sampled) | mirabolic (1,1,−2), b=1; GL_4 diag(t,t,1,1) | weights {0,1,−2}: Hodge-special yes, HT no, special no; GL_4 weights {−1,0,1} on all of Lie G, so every subgroup qualifies | holds | — |
| §10.2 (F03, F04) | trivial group; G_m; P¹(Q_p); discrete ℕ | exceptional set ∅; lines detect μ_m; P¹(Q_p) compact with countable clopen basis; images of p^n accumulate at 0 | holds | — |
| §11.1 (sampled) | {a,b}, A={a}; empty family | intersection {a}, unchanged by the container {a,b}; empty family gives M_C | holds | — |
| §11.2 (thin row) | torus special point; mirabolic (1,1,−2) | the point is closed in both structures; weights ≤1 give only Hodge-closedness | holds | — |
| §11.3 (thin row) | M_C = M1 ⊔ M2, Z̃ ⊂ M1 | nonempty family selects M1; empty family gives M1∪M2 | holds | — |
| §11.5 Checks (F01) | inverse mirabolic; GL_2 (1,0); empty family | 0,−1,2: HT-special, 2>1 so not special; GL_2 weights −1,0,1; empty family gives M_C | holds | — |
| §11.6 (F05) | [1:c], c ∈ L([μ])∖E; torus | X1−cX0 has the unique zero [1:c], with no E-model; torus flag of dimension 0 agrees with HKI Corollary C | holds | — |
| §11.8 (sampled) | Borel, b=diag(p,1)σ, μ=diag(z^{−1},1) | HT image a point (HKII line 2504), so it cannot cut out the torus lift | holds | — |
| §12.4 (sampled, thin row) | Γ=1; Γ≅Z acting freely | S ≅ M/K_p; S ≅ Γ∖(M/K_p), étale-locally M/K_p; the product (M/K_p)×Γ would be infinitely many copies | holds | — |

## Not verifiable

- The published versions (Algebra Number Theory 20 (2026); Inventiones, DOI 10.1007/s00222-025-01400-6) were not opened. All locators use arXiv v2, as the manifest's `version_note` says.
- The secondary results HK rely on were not opened: Serre's openness theorem, Daniels–van Hoften–Kim–Zhang, Chambert-Loir–Loeser and Rapoport–Viehmann. They enter only through declared gaps or supplier contracts.
- Whether the arbitrary-field full-rank de Rham criterion has a published proof was not determined. It stays a declared contract.
- Ownership against open pull requests was checked through the `roadmaps grep`/`show` index for all 352 heads. Only the suppliers named above were opened in full.

## Source issues

- **Misprint** in HKI at §4.4, printed p. 36: the source says the isocrystal of a weight-w Hodge structure is built from Hom out of O(w/2) tensored with the slope −w/2 isocrystal, with weight equal to −2 times slope; it should be Hom out of O(−w/2) tensored with the slope w/2 isocrystal, so weight is twice slope, as Definition 4.2.1 and Remark 4.2.2 require; affects nothing.
- **Misprint** in HKII at §10.1, printed p. 64: the source says each component of the basic locus is the product of the finite-level local Shimura variety with the discrete group Γ; it should be the quotient of that space by Γ ≤ G_b(Q_p); affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "57fb70a", "job": "REV-PKG-AdmissiblePairsAndPadicHodgeStructures~2", "model": "opus", "worker": "fable-rev88"} -->
