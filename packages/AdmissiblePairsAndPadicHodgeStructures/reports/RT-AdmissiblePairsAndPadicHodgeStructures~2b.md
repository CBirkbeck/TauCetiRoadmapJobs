<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1092#issuecomment-6394761420 -->
Red team round 2 pass b (claude) of 85772b7

Verdict: accepted

1. **F01** (P3) §9.2 applies D3.10 over diamond bases without citing the v-local step

   Location: `packages/AdmissiblePairsAndPadicHodgeStructures/README.md:1651`, "Apply the imported level-space and inverse-limit theorem after perfectoid pullback; its separated étale quotients descend to the lattice targets by v-descent." Also the *Needs* at README:1663, the Layer 9 Dependencies (README:1765) and the DiamondsAndVStacks "Consumed sections" (README:138).

   Claim: the quotients M_C/K are separated étale over the lattice targets Gr_[mu],L^(b-adm) and X_[mu],L, and M_C is their inverse limit, by D3.10 alone.

   Witness: DiamondsAndVStacks (head #820) D3.10 proves its level-space conclusions only over a base X in `Geometry.Perf p`; Spd Q_p-breve is not perfectoid. Descent to diamond targets is D3.9 (`v-local-nature-of-morphism-classes`), with D3.6; neither is cited.

   Repair: replace the sentence at README:1651 by "Apply the imported level-space and inverse-limit theorem to the pullback of the torsor to each perfectoid space over the lattice target. The quotient v-sheaves M_C/K are then separated étale over the target, because these classes are v-local on the target (DiamondsAndVStacks D3.6 and D3.9), and the inverse-limit identification is checked after the same pullback." Append "DiamondsAndVStacks D3 / etale-and-quasi-pro-etale-morphisms-of-stacks; DiamondsAndVStacks D3 / v-local-nature-of-morphism-classes" to the §9.2 *Needs*, to the Layer 9 Dependencies and to the DiamondsAndVStacks "Consumed sections" line. Tested on G=G_m, b=1, mu=0, L=Q_p-breve: the target Spd L is not perfectoid, so D3.10 gives nothing there directly. On the perfectoid cover Spd C the level space for K=Z_p××I is ⊔_Z Spd C, which is separated étale. D3.9 then descends this to M_C/K=Z×Spd L→Spd L. DiamondsAndVStacks is at merge-order line 16, so the dependency direction is unchanged.

One new finding (S01, P3, a missing locator introduced by the repair of r1b F03). All 18 round-1 findings (r1a F01–F07, r1b F01–F11) are repaired at this head; the verification of each is below. The last repair report marks no finding "not actionable", so nothing is re-raised.

## Round-1 findings at 85772b7

Paths are `packages/AdmissiblePairsAndPadicHodgeStructures/README.md` (README) unless stated.

- **r1a F01 (§0.5 fixed lattices) — repaired.** README:319: "For every nonzero integer m assume C(chi^m)^Gamma=0 … Then the Gamma-fixed good type-[mu] lattices are exactly the canonical lattices of kGamma-rational flags in Fl_[mu^-1]." Witness (recomputed): in the u/t Check (README:330), gamma(u t^-1)=u t^-1; the lattice equals (1+(t/u)E21)·⟨t^-1e1,te2⟩, whose parameter 1/u is a nonzero element of C(chi)^Gamma (and u of C(chi^-1)^Gamma), so the new hypothesis excludes it. Conversely t^mR/t^(m+1)R≅C(chi^m) as Gamma-modules (the error of a non-equivariant section lies in t^(m+1)R), so successive congruence lifts of a fixed lattice are unique. PadicPeriodRings §2 (head #940) states `tateSen_H0` for every complete discretely valued K with perfect residue field, and §4.3 the G_K-fixed embedding K→B_dR+, as README:98 says.
- **r1a F02 (§11.8 Serre–Tate data) — repaired.** README:1990: "use b=diag(1,p) and mu(z)=diag(1,z^-1) … Its admissible Hodge cell is A¹ … and its Hodge–Tate flag variety is a point." Witness: Ad(mu) on E12 has weight +1; with Lie P_nu = weights ≥0 of nu (HKI line 1057; HodgeTateAndCanonicalSubgroups §2.14), Fl_[mu]=B/B is a point and Fl_[mu^-1]=B/T=A¹. E_b=O⊕O(−1) modified by ⟨e1,ξ^-1(e2+xe1)⟩ has sub O and quotient O(−1+1)=O, hence is O² for every x; x=0 and x=1 have Hodge flags [0:1] and [1:1]. §8.6 (README:1571) uses the same datum.
- **r1a F03 (exact structures) — repaired.** README:234: "A morphism f is strict when f(Li)=f(V)∩Li′ for i=1,2. A complex is exact when its underlying K-vector-space complex and both R-lattice complexes are exact"; filtered strictness at README:263, sheaf version at README:871. Witness: t on (K,R,R) has f(R)=tR≠K∩R=R (Check README:255); for the G_a lattice the step-0 sequence is 0→ke1→ke1→k→0 with zero last map, not exact. For short sequences, lattice exactness ⇔ K-exactness plus strictness (kernel on L_B is L_B∩V_A).
- **r1a F04 (BunG layer and ownership) — repaired.** README:9: "VStackSheavesAndLisseCategories §VS4.0 owns the reductive bundle-stack, Newton-geometry and full-automorphism constructions"; README:112: "BunGAndNewtonStrata BG1 §1.13 / sigma-centralizer-J-b". Witness: VStackSheavesAndLisseCategories (head #1230) heading "VS4.0. Bundle stacks, Newton strata and contracting charts" constructs BunGeometry, BunNewtonGeometry, BunAutomorphisms; BunGAndNewtonStrata (head #1241) anchor `sigma-centralizer-J-b` is §1.13 in Layer 1. Merge order 149 and 241 precede 245.
- **r1a F05 (§11.1 Checks) — repaired.** README:1896–1898 (G=G_m, b=1, mu=0, K_n=(1+p^nZ_p)×I). Witness: ∩_n(1+p^nZ_p)={1}; ∩_n((1+p^nZ_p)∪p(1+p^nZ_p))={1,p}; 1+p^mZ_p is one level-m coset; C^(K_n)=C^I=L by Ax–Sen–Tate (PadicPeriodRings §2).
- **r1a F06 (Corollary C page) — repaired.** README:768 and README:7: "Theorem B, p. 5, and Corollary C, p. 8"; `sources.toml` line 13 likewise. Witness: HKI line 191 is the page-5 marker before Theorem B (HKI line 204); HKI line 332 is the page-8 marker before Corollary C (HKI line 347).
- **r1a F07 (rank-zero Check) — repaired.** README:253: "For L1=L2 of positive rank, the only filtration jump is zero … At rank zero both the jump set and the elementary-divisor list are empty." Witness: V=0 gives all trFil^i=0, empty jump set.
- **r1b F01 (splitting and flag owner) — repaired.** README:86: "Use §2.14's fpqc-local splitting of exact tensor filtrations of fibre functors on Rep_k G for finite-type affine G"; *Needs* at README:289, 313, 335, 906, 1014; Dependencies README:347, 955, 1092. Witness: HodgeTateAndCanonicalSubgroups (head #1084) §2.14 covers Rep_k(G) for finite-type affine G, Spl(φ) a U(φ)-torsor, P/U≅L and G/P_µ; merge order 234<245. Check README:285 (G_m⋉G_a, weight −1): P_mu=G_m, G/P_mu=A¹.
- **r1b F02 (§3.4 converse) — repaired.** README:770: "The Galois image preserves the K-rational de Rham lattice (HKI Lemma 5.5.4 …). Its elements are tensor automorphisms of the fully faithful realization Rep MG→HS(C), hence are central". Witness: HKI line 2174 (Lemma 5.5.4), HKI line 586 (Lemma 2.1.5), HKI lines 2424–2430 (same route). Each ρ_W(γ) is an HS-endomorphism of ω(W), hence MG-equivariant, so central; G_a is excluded only at the last step (the lattice ⟨e1,e2+t^-1e1⟩ contains no t^-1v with v rational, so it is not canonical).
- **r1b F03 (§§9.1–9.2 level spaces) — repaired, with a new locator gap (S01).** README:1640: "Apply DiamondsAndVStacks D3.10 (locally-profinite-torsors) to the G(Q_p)×I-torsor M_C over the L-admissible cell". Witness: DiamondsAndVStacks (head #820) D3.10 gives separated étale level spaces X̃_K and X̃=lim X̃_K. The contract, §§9.1–9.2 *Needs* and Layer 9 Dependencies cite it.
- **r1b F04 (§12.5 quaternion algebra) — repaired.** README:2124: "let B be the quaternion algebra over Q ramified at infinity, split at p, and ramified at exactly the same finite places as D away from p"; also README:2144. Witness: HKII lines 2931–2932; Ram(D)={p,ℓ} gives Ram(B)={∞,ℓ} (Check README:2132), of even size.
- **r1b F05 (Grassmannian base) — repaired.** README:991: "Let L be a p-adic field and G/L a connected linear group; for G/Q_p use G_L. The Grassmannian Gr_G/Spd L is the étale sheaf quotient G(B_dR)/G(B_dR+) on Perfd_L"; README:1060: "For a seminormal rigid S over L([mu])". Witness: HKII lines 1353, 1362, 1430.
- **r1b F06 (completed closure in §0.5) — repaired.** README:321: "C the completed algebraic closure of K0, R=B_dR+(C), and Gamma=Gal(K0bar/K0) … No action of this Galois group on a larger arbitrary C is presumed." Witness: HKI line 1083 (Example 3.1.10 takes C the completion of the algebraic closure).
- **r1b F07 (consumer pointers) — repaired.** README:248 "§4.4: Defines both Bialynicki–Birula filtrations"; README:276 "§0.4 … §§5.1 and 6.4"; README:547 "§7.1"; README:574 "§6.1"; README:2142 "requested from IgusaVarietiesAndTorsionConcentration (gap:ordinary-katz-igusa-monodromy)". Witness: each named heading exists in this README.
- **r1b F08 (duplicate entries) — repaired.** A scan of all 78 *Needs* lines and 13 Dependencies blocks finds no repeated entry.
- **r1b F09 (canonical-reduction ownership) — repaired.** README:13: "canonical reduction to the reconstructed subgroup is requested from MotivesAndAlgebraicCycles (gap:tannakian-canonical-reduction)"; README:627: "Import its canonical reduction of structure group (gap:tannakian-canonical-reduction)"; §6.3 README:1153 likewise.
- **r1b F10 (gaps at consumers) — repaired.** README:369 "using ker(Ad)=Z(G) (gap:adjoint-kernel-and-orbit-differential)"; README:758 "(gap:strict-field-serre-openness)"; README:1934 "submersive by gap:adjoint-kernel-and-orbit-differential"; also §11.7 README:1982.
- **r1b F11 (§9.4 cubic) — repaired.** README:1712: "For any cubic extension E/Q_p and the mirabolic subgroup of Res_E/Qp GL_2". Witness: HKII line 2386 ("degree 3 field extension"); for any cubic E, Ad weights {0,1,−2} and coinvariant 1+1−2=0 give b_H=b=1.

No repair introduced a false statement: every Check added or changed by the repairs (§0.1 C2 and C4, §0.2 C5, §0.5 C1–C3, §3.4 C1–C3, §5.1 C2, §8.6 second datum, §9.1 C2, §9.4 C2, §11.1 C1–C3, §11.8 C1–C3, §12.5 C1–C3) was recomputed with the values in the table below. The repair of r1b F03 left one uncited step (S01).

## Verified sound

Read in full: README (2177 lines), `Suggested.lean` (43 lines), `sources.toml`, `metadata.toml`, the `gaps` list and node kinds of `design/plan.json`, the three round-1 files and the repair diff 57fb70a..85772b7.

- **Declarations read: 0.** `Suggested.lean` has `import Mathlib`, one module docstring and an empty namespace `TauCetiRoadmap.AdmissiblePairsAndPadicHodgeStructures`. It has no `def`, `theorem`, `instance`, `example`, `lemma`, `set_option` or sorry. The `#check @name` comparison has an empty domain; no Lean was run (no Lake environment in the board or content checkout). The headline theorems are HKII Theorem 9.1.3 (§11.5), Theorem A (§11.6), Theorem B (§11.7) and HKI Theorem B (§3.4). Each needs relative B_dR+ period sheaves, modifications on the Fargues–Fontaine curve or infinite-level diamonds. None of these exists at Mathlib `6b7abb3` or Tau Ceti `a91d3aa` (only `WittVector.Isocrystal`, `BDeRhamPlus`/`BDeRham`, a topological Frobenius quotient and complex Hodge structures). The docstring names each with its missing carrier. Nothing is padding, and no statable headline is missing.
- **Targets read: 78**: 37 theorems, 24 definitions, 10 constructions, 6 applications and 1 comparison. There are 43 Checks blocks and 134 bullets; every definition and construction has at least three Checks. Every target carries a source locator. All 191 internal *Needs* edges point to earlier sections.
- **Locators verified this round: 24 cited source lines read**: HKI lines 204, 347, 586, 1043, 1047, 1057, 1065, 1083, 2167, 2174, 2424; HKII lines 501, 1347, 1353, 1362, 1430, 1488, 1985, 2005, 2386, 2499, 2503, 2511, 2931. The page attribution of 20 cited HKI lines was also checked against the page markers (HKI lines 191, 332, 578, 964, 1007, 1055, 1101, 1141, 1389, 1527, 1897, 2083, 2124, 2168, 2264, 2396, 2488). Each read line carries the cited statement. The README already corrects the two source errors listed below, and the misprint listed there affects nothing it uses.
- **Checks tested: about 50 of 134 bullets recomputed** (values in the table). The rest were checked for consistency with those computations and with the target they test; none is false, vacuous or a restatement.
- **Sibling citations checked: about 99 anchors in 21 roadmaps**, each found at the copy named: PadicPeriodRings §§2, 4.1, 4.3 (#940); HodgeTateAndCanonicalSubgroups §2.14 (#1084); AdicSpacesPartII R1.3 `analytification-functor` (main), including the field base change `analytification.baseFieldIso` at its line 9033; DiamondsAndVStacks D3.5, D3.6, D3.9, D3.10 (#820); VStackSheavesAndLisseCategories §VS4.0 (#1230); BunGAndNewtonStrata §1.13 and its 9 cited anchors (#1241); RelativeFarguesFontaine §§4.10–4.12, 6.6–6.9, 7.0, 7.2, 7.4, 7.6 (#1209); PadicHodgeTheory §§2.2, 2.3, 5.5, 7.1, 7.4 (#1062); MotivesAndAlgebraicCycles §§6.1–6.3, 6.8 (#1313); HeckeStacksAndLocalShtukas §§HS2.12, HS2.15 (#1252; HS2.15 has connectedness for arbitrary b, as §6.8 uses); AInfCohomology §§AI.2.2, AI.2.3 and "Operations in valid BKF subcategories" (#1044); GeometricSatakeAndFusion 5 GS0 anchors (#1235); DiamondSixOperations §§S2.4, S3.2, S4.2, S4.3 (#927); EndoscopicTransferAndUnitaryTraceComparison §§12.5, 12.11 (#999); PerfectoidShimuraVarieties §§2.2, 3.1, 3.5 (#1085); HilbertModularVarietiesAndShimuraCurves §§R18.5.20–R18.5.21 (#1005); VectorBundlesAndIsocrystals 9 anchors (#1205); ReductiveGroupsPartII 5 anchors (#785); ReductiveGroups Layers 1, 2, 3, 5, 6A, 7 (main); AdicSpacesPartV 16 RZ anchors (board design package). The `roadmaps resolve` lead list is empty (main 4aeb1cc, 353 heads).
- **Pinned declarations read with `git show` at the pins**: Mathlib `Isocrystal.lean` lines 113, 132, 138, 157, 172, 180; `Baire/Lemmas.lean` 141, 256; `Baire/CompleteMetrizable.lean` 25; `BDeRham.lean` 51 (requires `IsAdicComplete (span {p})`, `¬IsUnit p`, p prime), 75, 88. Tau Ceti `GroupFunctor.lean` near 138, `Subcomodule/Finite.lean` 144, 292 (`Module.Free R C`), `ExteriorStabilizer/Character.lean` 101 (field, `HopfIdeal`, `I.toIdeal.FG`). All agree with README:54–64.
- **Declared gaps (9)**: the slug, supplier, section and *needs* text are identical in the README contracts and in `design/plan.json` `gaps`. None is now provided: PadicHodgeTheory (#1062) still has no arbitrary-field full-rank de Rham criterion and no Serre openness (its Sen results take K finite over Q_p). Every supplier is earlier in the order.
- **Ownership**: `roadmaps grep` for bilattice, bi-analytic, Ax–Lindemann and "p-adic Hodge structure" over main and 353 open heads finds only reference-list citations of HK (DiamondsAndVStacks, PadicHodgeTheory, RelativeFarguesFontaine, BunGAndNewtonStrata, HeckeStacksAndLocalShtukas) and unrelated complex or abelian Ax–Lindemann results (DiophantineApproximationAndTranscendence, AbelianSchemesAndArithmeticModuliPartII, ShimuraVarieties). No roadmap cites this one. The two-lattice categories, the non-reductive Grassmannian and bi-analytic Ax–Lindemann remain owned here. There is no Lean name to collide.
- **Policy**: `git diff --stat origin/main...HEAD` touches only the package folder (8 files). There is no pull-request number, process word, `lemma`, `set_option` or machine path in README or Lean.
- **Dependency check** (`gate --depcheck … --movable`), complete output:

```text
depcheck: 49 roadmaps, 576 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The owners added by the repairs (HodgeTateAndCanonicalSubgroups 234, VStackSheavesAndLisseCategories 149, PadicPeriodRings 21, DiamondsAndVStacks 16, AdicSpacesPartII 8) all precede line 245.

Pass record (one row per statement; values computed this round):

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Tate table | Q_p(1) | Frobenius p^-1σ, slope −1, E(W)=O(1); L_et=Fil^1 lowers degree to 0; L_dR=Fil^-1 raises O to O(1), slope 1=−w/2 so w=−2 | agrees | none |
| Admissibility convention | G_m, Tate n | b=p^-n, type of L_et=n, κ(b)=−n=mu^-1 | [b]∈B(G,[mu^-1]) consistent | none |
| Parabolic convention | G_m⋉G_a, weight −1 | Lie P_nu=weights ≥0 (HKI line 1057, HodgeTateAndCanonicalSubgroups §2.14): P_mu=G_m | consistent | none |
| 0.1 | a=1; rank 0; t on (K,R,R) | t^(i+1)R∩R→k nonzero iff i≤−1; jumps ∅; f(R)=tR≠R=K∩R | true | none |
| 0.2 | G_a t^-1; G_m⋉G_a; quaternion | step 0: 0→ke1→ke1→k→0 not exact; G/P_mu=A¹, G/P_(mu^-1)=pt; inv 1/2→0 over Q_p-bar[[t]] | true | none |
| 0.3 | G_a extension | Levi (0,0), actual (1,−1): 1≥0, sums 0=0 | dominance correct | none |
| 0.4 | torus; G_a | torus split exact; G_a fails exactness, not good | true | none |
| 0.5 | GL_2 (2,0); u/t | ⟨t²e1,e2+cte1⟩: trFil^-2=k², trFil^-1=trFil^0=ke2 for all c, lattices distinct; u/t lattice=(1+(t/u)E21)⟨t^-1e1,te2⟩, 1/u∈C(chi)^Γ | repaired statement true | none |
| 1.1 | Borel diag(p,1); torus | Frobenius on E12 is p·σ, slope 1, not basic; torus basic | true | none |
| 1.2 | Borel vs T | same class; basic in T only | true | none |
| 1.3 | GL_2 diag(p,1); slope 1/2 | J_b=T, dim 2≠4; D×, dim 4 | true | none |
| 1.4 | G=1; Borel | one object; Ext¹(O(1),O(−1))=H¹(O(−2))≠0 | true | none |
| 1.5 | G_a, b=1 | Aut=H⁰(O)=Q_p, H¹(O)=0 | true | none |
| 1.6 | b=[[1,1],[0,1]], x=diag(2,1); G_m | σ_b(x)=[[2,−1],[0,1]]; b^-1σ_b(x)=σ(x)b^-1=[[2,−2],[0,1]]; b^-1xb=[[2,1],[0,1]]; slope m↦m−n | true | none |
| 2.1 | Q_p(1); O(1)⊕O(−1) | weight −2; slopes ±1, not pure | true | none |
| 2.2 | Tate n | L_dR=Fil^-n | true | none |
| 2.3 | unit; Tate | End=Q_p; G_m connected | true | none |
| 2.4 | slopes (0,−1) | weights (0,−2) | true | none |
| 2.5 | [[1,u],[0,1]] | fixes e1 ∀u; fixes e2 iff u=0 | true | none |
| 2.6 | G_m, Q_p(n) | Hodge type n, b=p^-n, κ=−n=mu^-1; ν=−n=w/2 | true | none |
| 2.7 | unit | (O,O,id,id) | true | none |
| 3.1 | unit extension t^-1 | lattice contains no t^-1v, v rational: not canonical | true | none |
| 3.2 | Tate n=1, p=2 | D_cris rank 1, φ=2^-1σ | true | none |
| 3.3 | χ_cyc | image open in Z_p×, closure G_m | true | none |
| 3.4 | G_a extension; unit, Tate | ρ(γ)∈End_HS ⇒ MG-equivariant ⇒ central; MG=T×G_a^r, r>0, gives a nonzero analytic self-extension, contradiction; G_a cocharacter 0 central, not torus | true | none |
| 4.1 | cusp | u∉L⟨u²,u³⟩, same diamond | true | none |
| 4.2 | O(1) on Spa L | H⁰(G_L′,C(1))=0 for every finite L′ | not analytic | none |
| 4.3 | x=0, ξ^-1 | integral locus whole, empty | closed | none |
| 4.4 | ⟨e1,e2+(z/ξ)e1⟩ | z≠0: det val 0, min entry −1, type (−1,1); z=0: (0,0) | true | none |
| 4.5 | same | G_a type 0 only at z=0 | no constant type | none |
| 4.6 | filtration in degree a | PadicHodgeTheory §7.1 graded formula: nonzero iff i≥−a, M=t^-aM0 | Check 3 true | none |
| 4.7 | F¹=F²=⟨e1+ze2⟩ | ∇(e1+ze2)=e2dz∉F¹ | transversality fails | none |
| 5.1 | G_m/L; G_a | cell Spd L; ξ^-1≠0 in B_dR/B_dR+, good cell {0} | true | none |
| 5.2 | χ(h)=2 | (2,1/2)v=v; (2,2)v=4v | graph correct | none |
| 5.3 | GL_2 (2,0) | (1,1)≤(2,0): 1≤2, 2=2 | cell not closed | none |
| 5.4 | G_a t^-1 | (1,−1) not ≤ (0,0) | excluded | none |
| 5.5 | Gr_Ga rigid points | (B_dR/B_dR+)^(G_L′) has graded pieces C(−m)^G=0 | only 0 | none |
| 5.6 | {0,1,−2}; {0,−1,2} | max 1: iso; max 2: fibre parameter | true | none |
| 6.1 | two points | fixed map (a,a) | true | none |
| 6.2 | unit | End=Q_p | true | none |
| 6.3 | norm-one torus ⊂ SL_2 | H¹(Q_p,T)=Q_p×/N(E×)≅Z/2, H¹(Q_p,SL_2)=1 | kernel Z/2 | none |
| 6.4 | constant Tate family | single type n | conditional on gap | none |
| 6.5 | G_m, b=p^-1, type 1 / 0 | modified slopes 0 / 1 | in / out | none |
| 6.6 | same | nonempty iff κ(b)=mu^-1 | true | none |
| 6.7 | pt×pt; ∅×pt | H⁰=F_ℓ; ∅ | true | none |
| 6.8 | U-action | trivial on U(Fil^m) once m exceeds the weights (HKII line 2005); torus one point | true | none |
| 7.1 | monodromy −1, p=2 | −1≠1 in Q_2 | excluded | none |
| 7.2 | Tate | MT=G_m | true | none |
| 7.3 | Borel, mu^-1=(1,0) | ν=diag(1,0), weight 1 on E12 | no G-basic class | none |
| 7.4 | Fil^n⊂Fil^a | (−1,0) false; (−1,−1) true | true | none |
| 7.5 | P¹, line e1 | incidence c=0 | closed | none |
| 7.6 | {0,1,−2}; {0,−1,2} | min −2 fails ≥−1; min −1 passes | true | none |
| 8.1 | Tate n=−1 | Fil^-1⊂Fil^0 false; B_dR+⊂Fil^0 true | false positive shown | none |
| 8.2 | composition | g2f2(g1)·f2f1(b1)·σ(g2f2(g1))^-1=b3 | true | none |
| 8.3 | Borel diag(p,1), [1:1] | ambient a≠0 admissible; e1-subpair Re1 gives O(−1) | not H-admissible | none |
| 8.4 | torus; weight 2 | bounds vacuous; excluded | true | none |
| 8.5 | quadratic F/Q_2 | dim D×/F×=4−2=2=dim_Qp P¹(F) | true | none |
| 8.6 | b=diag(1,p); GL_3 | ⟨e1,ξ^-1(e2+xe1)⟩=L_[x:1], E=O² ∀x; GL_3: min entry −1, min 2-minor −1, det 0 → (−1,0,1); Levi (−1,1;0) vs (0,0;0) | true | none |
| 9.1 | G_m, K=Z_p××I | Q_p×/Z_p×=Z | true | none |
| 9.2 | Tate n=1; Spd Q_p-breve | exponents 1, −1; base not perfectoid | true; locator gap | S01 |
| 9.3 | identity; torus | identity; frames Q_p× | true | none |
| 9.4 | cubic E, any ramification | weights {0,1,−2}; κ=1+1−2=0; ν=0≤(2/3,−2/3) | true | none |
| 9.5 | GL_4 (1,1,0,0) | weights {−1,0,1} | agree | none |
| 9.6 | G_m b=p^n, mu=−n | dual b=p^-n, mu=n: κ=−n=(mu^-1)^-1 | true | none |
| 9.7 | torus | singleton domains | true | none |
| 10.1 | two tori, not in one Borel | generate GL_2 (2+2>3) | converse fails | none |
| 10.2 | Q_p[x,x^-1]; {p^n} | span dim 2i+1; closure contains 0 | true | none |
| 10.3 | residue F_q | ‖x^q−x‖≤‖π‖ on O_L, Gauss value 1, ‖π‖≤‖f‖² disjoint | infinite residue needed | none |
| 11.1 | G_m, K_n | {1}; {1,p}; 1+p^mZ_p; C^(K_n)=L | true | none |
| 11.2 | torus; mirabolic | point closed; one-sided | true | none |
| 11.3 | A={1}; empty index | {1}; Q_p× | true | none |
| 11.4 | GL_2 line flag; torus | rank 1=dim P¹; 0=0 | true | none |
| 11.5 | inverse mirabolic | {0,−1,2}: HT special, not special; b_H=1 | true | none |
| 11.6 | [1:c], c∉E | X1−cX0 over L([mu]) | true | none |
| 11.7 | torus | flag dim 0=image dim 0 | true | none |
| 11.8 | b=diag(1,p), mu=(0,−1); reversed | weight +1: Fl_[mu]=pt, Fl_[mu^-1]=A¹, flags [0:1],[1:1]; reversed: Hodge cell pt, HT image a U(Q_p)-orbit | true | none |
| 12.1 | order-2 character | monodromy −1, weight 0 | true | none |
| 12.2 | G_m frames | Q_p× vs Z_p×; valuations Z vs {0} | true | none |
| 12.3 | p=2 | Z_2× infinite profinite vs discrete rigid fibre | true | none |
| 12.4 | Γ=1 | quotient M/K_p | conditional | none |
| 12.5 | Ram(D)={p,ℓ}; B′ | Ram(B)={∞,ℓ}; B′ fails at q,r | true | none |

## Not verifiable

- Lean: neither the board nor the content checkout has a Lake environment, so `Suggested.lean` was not built. It has no declarations; only `import Mathlib` would elaborate.
- Published-version numbering (HKI in Algebra & Number Theory, HKII in Inventiones) was not collated; every locator uses arXiv v2, as the manifest records.
- The residue-field hypothesis of Serre's openness theorem (HKI reference [33], cited at HKI line 2170) is not in the source cache, so gap `strict-field-serre-openness` was checked for minimality only against the suppliers.
- Whether the arbitrary-field full-rank de Rham criterion is known: LiuZhu line 86 restricts to finite extensions of Q_p, and the cache holds no other source.
- AdicSpacesPartV exists only as a board design package; its 16 RZ anchors were checked there.
- Ownership against open work was checked through `roadmaps grep` over main and the 353 open heads (which include the sibling heads the brief lists), not by reading each sibling checkout separately.
- No suspicious instruction was found in any text read.

## Source issues

- **Error** in HKI at Proposition 3.1.7(2), printed p. 22: the source says an infinite-order scaling character on K·t makes the invariant lattices exactly the canonical lifts of K-rational flags; it should also require that the nonzero twists of the residue field have no invariants (counterexample in README §0.5); affects a stated result.
- **Error** in HKII at Remark 9.1.4, printed p. 56: the source says upper-triangular data b=diag(p,1), mu=diag(z^-1,1) give the Serre–Tate family with one-point Hodge–Tate image (those data give a one-point Hodge cell and flag B/T); it should be b=diag(1,p), mu=diag(1,z^-1); affects nothing.
- **Misprint** in HKII at §5.1, printed p. 33: the source says the embedding G into reductive G′ makes G/G′ quasi-affine; it should be G′/G; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "85772b7", "job": "RT-AdmissiblePairsAndPadicHodgeStructures~2b", "model": "opus", "worker": "fable-rt25"} -->
