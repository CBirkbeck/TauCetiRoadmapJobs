<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/420#issuecomment-6367726453 -->
Review (claude) of accb0a0

Verdict: needs changes

1. **F01** (P1) FC.0/FC.3/FC.4/FC.5/FC.6 re-plan PrismaticCohomologyPartIII §6.0

   **Location.** `packages/SchemeAndStackFoundationsPartII/design/README.md` lines 669–745 (all of FC.4), 196–223 (`begueri-resolution`), 537–565 (`animated-flat-cohomology`), 621–631 (`cohomology-deformation`), 789–799 (`p-adic-continuity`), 843–853 (`principal-excision`). Line 673: “Import crystalline covariant Dieudonné theory, compare perfect pro-fppf and fppf sites, and compute flat cohomology as a derived V−1 fibre.”

   **Claim.** This roadmap owns the perfect-base Dieudonné formula (CS24 §4.1), the p-adic continuity formula (CS24 Thm 5.3.5), principal excision (CS24 Lemma 5.4.2), and the construction of animated fppf cohomology with its deformation triangle and Bégueri reduction (CS24 §5.2).

   **Witness.** PrismaticCohomologyPartIII §6.0 (merge order line 53) states `perfectDieudonneComparison` (classification and V−1 triangle, CS24 §4.1), `pContinuity` (Thm 5.3.5) and `excision` (Lemma 5.4.2). Its proof route builds animated fppf cohomology and the Bégueri deformation triangle.

   **Repair.** Delete `dieudonne-hom-ext`, `perfect-pro-fppf-comparison`, `dieudonne-artin-schreier`, `perfect-base-key-formula`, `p-adic-continuity` and `principal-excision`, and list them under Scope and ownership as owned by PrismaticCohomologyPartIII §6.0. Cite `perfectDieudonneComparison`, `pContinuity` and `excision` by name in the supplier contract and in every Inputs line that used the deleted targets (FC.5–FC.10). PCIII §6.0 builds animated fppf cohomology, the deformation triangle, the Bégueri resolution and the perfection of pro-fppf covers only inside proof routes. Declare a gap on PrismaticCohomologyPartIII §6.0 asking it to name these as targets, at the generality of FC.3 (smooth or finite locally free G over an ordinary R). Then keep only the parts PCIII does not state (`perfect-affine-vanishing` as a consequence, FC.2, the rest of FC.3) and say in one clause how each differs. Ownership cannot move the other way: this roadmap depends on PotentialModularityAndCompatibleSystems (merge order line 127), so it must sit after line 127, below PCIII. Tested on G=μ_p, A=Z_p (p odd): FC.5 `p-henselian-dimension` and FC.8 `henselian-h2` still compute H¹=Z/p on both sides, now citing `pContinuity`.

2. **F02** (P1) FC.1 re-plans HeightsRationalPointsAndObstructions §§2.6a–2.6c

   **Location.** README lines 231–296 (`twisted-sheaves`, `twisted-azumaya-criterion`, `affine-twisted-patching`, `gabber-affine-brauer`), the requests at lines 64 (`projective-rank-lemmas`) and 86 (`gabber-finite-free-etale`). Line 288: “For every commutative ring R, the parent’s natural class map Br_Az(Spec R)→Br′(Spec R)=H²_et(Spec R,G_m)_tors is an isomorphism, natural in R.”

   **Claim.** These targets and supplier asks are new obligations owned here or by SchemeKTheoryOperations S.2 and SchemeAndStackFoundations SF.0.

   **Witness.** HeightsRationalPointsAndObstructions (merge order line 104): §2.6a `TwistedModule` and `endomorphismAzumaya`; §2.6b the K₀ rank, cancellation and tensor-root lemmas (Lieblich 3.1.4.3–3.1.4.4); §2.6c `Brauer.affine_comparison` (every commutative R), `localEtale_finiteFree_domination`, `twistedBundle_affine_glue`.

   **Repair.** Delete the four targets and the two requests, and cite HRPO §§2.6a–2.6c by target name in a supplier contract and in the Inputs of `ample-twisted-generation`, `gabber-ample-brauer` and `henselian-h2`. Keep `ample-twisted-generation` and `gabber-ample-brauer` as the extension of HRPO §2.6d (quasi-projective over an infinite field) to every quasi-compact separated scheme with an ample invertible sheaf, through de Jong's Skolem argument, which HRPO §2.6d places outside its contract; say so in one clause. HRPO §2.6a is stated for Noetherian X. If the non-Noetherian twisted-sheaf calculus is needed, reduce it to HRPO through Noetherian approximation (SchemeAndStackFoundations §0.9), or declare a gap on HRPO §2.6a. Tested on `henselian-h2` step (3): it needs affine Gabber for R′=Γ(G*,O), an arbitrary ring, and `Brauer.affine_comparison` covers every commutative R.

3. **F03** (P1) The declared gap G1 has no supplier and asks for nothing that is missing

   **Location.** `design/plan.json` line 3759 (gap `SchemeAndStackFoundationsPartII/G1`, no `supplier`/`section`/`needs` keys); README line 1045: “The parent’s Popescu plan carries an inherited field-case gap; this dependency is explicitly recorded.”

   **Claim.** SchemeAndStackFoundations' Popescu target has an open field-case dependency, so FC.9 needs an unowned gap.

   **Witness.** SchemeAndStackFoundations §0.15 (main) states `popescu_desingularization` and `popescu_colimit_of_geometricallyRegular` without reservation; its README, STATUS.md and PROGRESS.md mention no field-case gap. A gap with supplier `none` is unowned.

   **Repair.** Remove G1 from plan.json and delete the README Check at line 1045. In the Inputs of `henselian-invariance`, `topological-algebraization`, `punctured-animated-comparison` and `noetherian-open-comparison`, cite SchemeAndStackFoundations §0.15 `popescu_colimit_of_geometricallyRegular` and §0.14 `henselian_smooth_lifting` as supplied. Tested on the route of `henselian-invariance`, which is the route of Bouthier–Česnavičius Lemma 2.1.3: write the completion of a Noetherian henselian pair as a filtered colimit of smooth algebras, then retract by smooth lifting. Both inputs are exactly those two parent targets.

4. **F04** (P1) Twenty supplier requests and all ArcTopologyAndDescent citations are undeclared gaps

   **Location.** README lines 54–94 (twenty “Supply …/Include …” contracts, for example line 60, `SchemeAndStackFoundations:SF.2 — finite-group-ext`); `design/plan.json` lines 3397–3756 (`requests`), but `gaps` (line 3757) holds only G1. ArcTopologyAndDescent is cited at line 45 and in the Dependencies/Inputs of FC.5–FC.10 (lines 751, 797, 821, 829, 851, 913, 923, 943, 989, 1099, 1109, 1121).

   **Claim.** These suppliers provide the stated results.

   **Witness.** (a) The asks are absent from the cited sections: SchemeAndStackFoundations has no Ext¹(X,G_m)-sheaf vanishing and no Cauchy-net algebraization; E5:animation has no Ani(H)∘Ani(F) comparison. (b) ArcTopologyAndDescent is neither on main nor in ORDER.txt; it is a board design (jobs issue 271).

   **Repair.** For each of the twenty requests and for each ArcTopologyAndDescent node used (AT.6 `torsion-arc-hyperdescent`, AT.8 `formal-glueing`, AT.11 `complete-etale-hyperdescent` and `complete-valuation-product-basis`, AT.12 `integral-perfectoid-hyperdescent`), do three things. Add a plan.json `gaps` entry with `slug`, `supplier`, `section` and a one-sentence `needs` that states its hypotheses. State it in the README under `## Exact supplier contracts` as “What <Supplier> must provide (gap:<slug>): <needs>”. Write `gap:<slug>` in each consuming target's prerequisites. Split the compound asks into independent slugs: `henselian-torsor-gerbe` into the stack-lifting theorem (BC22 Prop 2.1.4) and its H¹/H² consequences (BC22 Thm 2.1.6); `flat-cohomology-limits` into varying-base continuity and torsor descent; `gerbe-module-descent` into quasi-coherent, finite-pushforward and coherent-extension parts. Tested on `begueri-resolution`: its Ext¹ input becomes `gap:…/finite-group-ext`, supplier SchemeAndStackFoundations, section Layer 2, needs “for commutative finite locally free X over any scheme, the fppf sheafification of Ext¹(X_T,G_m) vanishes”.

5. **F05** (P1) Two proof inputs have no owner: injectivity of the Brauer class map, and the perfect-base Dieudonné classification

   **Location.** README line 292: “injectivity is the existing Azumaya-gerbe comparison”; line 316: “use the parent’s injectivity of the class map”. Line 44 and the Inputs at lines 695, 707, 719, 731: `PrismaticCohomologyPartII:PD.6/perfect-base-classification`.

   **Claim.** SchemeAndStackFoundations proves Br_Az(X)→H²(X,G_m) injective; PrismaticCohomologyPartII PD.6 supplies the covariant crystalline classification over perfect bases.

   **Witness.** `TauCetiRoadmap/SchemeAndStackFoundations/README.md` §2.22 (main) builds `SchemeBrauerGroup.toH2` and `toCohomologicalBrauer` and states no injectivity. PrismaticCohomologyPartII at its open head has Layers 3–4 and no §PD.6; PD.6 in DerivedDeRhamCohomology is divided-power envelopes.

   **Repair.** (a) Add a target `brauer-class-injective`: for every scheme X, an Azumaya algebra with zero class in H²_et(X,G_m) is End(E) for a finite locally free E of positive rank, so `toH2` is injective (Grothendieck, Brauer I, §2). Alternatively, declare it as a gap on SchemeAndStackFoundations §2.22. Cite it in the Inputs of `gabber-ample-brauer`, and note in the supplier contract that HRPO §2.6c lists the same injection among its needs. (b) Replace every PD.6 citation by PrismaticCohomologyPartIII §6.0 `perfectDieudonneComparison`, which includes the perfect-base classification (see R01). Tested on X=Spec ℝ: the algebra M₂(ℝ) has class 0 and is End(ℝ²); ℍ has a nonzero class (parent Check `test_class_quaternion_real`). Both are consistent with injectivity.

6. **F06** (P2) Several supplier asks request what the pins or an earlier roadmap already provide

   **Location.** README lines 84 (`syntomic-presentations`), 94 (`noetherian-completion-flat`), 82 (`koszul-geometric-support`, its exchange clause), 58 (`general-square-zero`), 80 (`complete-module-hyperdescent`), 72 (`adic-flat-module-limits`).

   **Claim.** Each ask is new work for its supplier.

   **Witness.** Tau Ceti `TauCeti.Algebra.IsStandardSyntomicOfRelativeDimension` (`TauCeti/RingTheory/Syntomic/StandardSyntomic.lean:81`, `baseChange` :168); Mathlib `AdicCompletion.flat_of_isNoetherian` (`Mathlib/RingTheory/AdicCompletion/AsTensorProduct.lean:378`); EnhancedDerivedSheaves E5:animation.3 `tot_filteredColimit_of_bounded`; DerivedModuleAlgebra §0.5, §1.7, §1.9 (main).

   **Repair.** Cite these and shrink each `needs` to the remainder. For syntomic maps, ask only for the global predicate (locally standard syntomic), composition and limit descent. For Noetherian completion, ask only for faithful flatness in the local case, or derive it from flatness and m·R̂≠R̂. For geometric supports, drop the totalization-exchange clause and cite E5:animation.3. For square-zero extensions, cite DerivedModuleAlgebra §0.5 and ask only for the animated Postnikov-layer classification. For complete-module descent, cite §1.9 (p-adic, Čech) and ask only for the finite-tuple hypercover generalization. Address adic flatness to DerivedModuleAlgebra §1.7, the owner of complete flatness. Tested on the syntomic ask: base change of the local model is `IsStandardSyntomicOfRelativeDimension.baseChange` at the pin, so that clause disappears from the ask.

7. **F07** (P3) `complete-principal-descent` is narrower than its source and its consumer

   **Location.** README line 983: “For any a∈R and commutative finite locally free G/R, RΓ(−,G) on derived a-complete animated R-algebras satisfies hyperdescent …”.

   **Claim.** The lemma is stated for a in the base ring R.

   **Witness.** CS24 Lemma 5.6.5 (p.74) takes a in the animated algebra A. `derived-complete-continuity` (line 999, step 2) applies the lemma to a generator a₁∈π₀A, for example t∈π₀(ℤ[[t]]) over R=ℤ.

   **Repair.** State it for a∈π₀A with A fixed and A^• a cosimplicial A-algebra, as in the source. The special case a∈R stays as a Check. Tested on R=ℤ, A=ℤ[[t]], a=t: the restated lemma applies directly. The old form needed the unstated base change of G to ℤ[x] with x↦t.

8. **F08** (P3) Supplier labels that do not exist where they are cited; the gate result is a false negative

   **Location.** README lines 39–49 and every Inputs line: `SchemeAndStackFoundations:SF.k/<slug>`, `key/henselization`, `key/scheme-brauer`, `DerivedDeRhamCohomology:DD.1/…`, `PotentialModularityAndCompatibleSystems:R23.1/…`, `SF.2/gerbe-h2-class` (line 258), `SF.2/brauer-kummer-sequence` (lines 294, 965, 1025).

   **Claim.** These labels name sections and targets of the suppliers.

   **Witness.** The parent has Layer k/§k.n, no “SF.k”, and assigns banded gerbes to AlgebraicModuliForArithmeticGeometry Layer 4. Its `brauer_kummer_sequence` (§2.22) is étale, n invertible; `fppf_kummer_sequence` is §2.11. DerivedDeRhamCohomology has no DD.1; PMCS has no R23.1.

   **Repair.** Repoint: SF.0/popescu… → §0.15 `popescu_desingularization`; SF.2/gabber-affine-proper-base-change → §2.15; SF.2/smooth-group-fppf-etale-comparison → §2.10 `smoothGroup_fppf_etale_comparison`; key/henselization → §0.12; SF.1/torsor-representability → §1.15 `torsorRepresentability`; gerbe-h2-class → AlgebraicModuliForArithmeticGeometry Layer 4; brauer-kummer-sequence → §2.11 `fppf_kummer_sequence`; DD.1 → DerivedModuleAlgebra §§0.K.1, 1.1–1.9 (with DerivedDeRhamCohomology §1.22 for exchanges); R23.1 → PotentialModularityAndCompatibleSystems Layer 2 §2.8. Write the citations in README prose form so the gate parses them. The gate placed this roadmap after EnhancedDerivedSheaves (line 14) although it cites PMCS (line 127); its true slot is after line 127. Tested on `henselian-noncomplete-counterexample`: in characteristic p it needs the fppf Kummer sequence for n=p, which `fppf_kummer_sequence` supplies and the étale `brauer_kummer_sequence` does not.

9. **F09** (P3) The stated library baseline is not the pinned one

   **Location.** README line 35: “The library baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.”

   **Claim.** These are the pins.

   **Witness.** The content repository's `lake-manifest.json` pins Mathlib 6b7abb3c and Tau Ceti a91d3aaf. At the pins, `cartierDual` is at `FiniteLocallyFree.lean:331`, not line 275 as plan.json records.

   **Repair.** Restate the baseline at 6b7abb3c/a91d3aaf with the file and line of each declaration, all re-verified below. Add the pinned objects the design uses but does not cite: `AdicCompletion.flat_of_isNoetherian`, `TauCeti.Algebra.IsStandardSyntomicOfRelativeDimension`, `TauCeti.HopfAlgebra.pointsPresheaf_isSheaf` (`TauCeti/Algebra/AlgebraicGroup/Fppf/Basic.lean:61`) and its group-valued `pointsFppfSheaf` (line 78), which FC.3 `classical` should compare with. Tested: every baseline name resolves at the pin (see Verified sound).

10. **F10** (P3) README shape and house style

   **Location.** Line 1 (`# Scheme, stack, …` instead of `# Roadmap: …`; no `**Summary.**`). Lines 108–135 are typical of all 61 targets: “Target `ind-fppf` (definition).”, then `**Source:**`, `**API.**`, `**Unit tests.**`, `**Uses.**`, `**Proof or construction.**`, `**Inputs:**`, `**Check.**`.

   **Claim.** The README is in TauCetiRoadmap form.

   **Witness.** The brief forbids `Hypotheses:/API:/Tests:/Sources:` field lists and target blocks. It requires the headings Scope and ownership, Conventions, Exact supplier contracts, How to read the build, `## Layer k`, per-layer Examples and Dependencies, and Downstream consumers. Unit tests carry Lean-like names (`polynomial`, `not_rationals`); API bullets assert `TauCeti.FlatCohomology.*` names that no Suggested.lean declares.

   **Repair.** Rewrite in the upstream shape. Each target becomes prose with hypotheses and a locator at the claim, followed by a `*Needs:*` line. API bullets go in prose, with no backticked own names unless the package's Suggested.lean declares them. Checks become a `**Checks.**` list with no Lean names. Each layer ends with `### Examples` and `### Dependencies`. Remove the process vocabulary (“requested from SF.1”, “node”, “Proposed declaration names indicate …”, line 7). Move the citation-only theorem “Check.” lines (for example lines 607, 643, 841) into prose or into real computed Checks. Tested on `ind-fppf`: its four unit tests are already discriminating and carry over unchanged as Checks.

11. **F11** (P3) Two wordings admit the wrong object

   **Location.** Line 416: “It is faithfully flat when π₀M is faithfully flat.” Line 304: “The sum of r^n copies of each and their tensor product both have weight one, since nα=0.”

   **Claim.** (a) Faithful flatness of an animated module needs only π₀. (b) On a G_m-gerbe the (n+1)-fold tensor product has weight one.

   **Witness.** (a) A=k⊕k[1], M=k: π₀M=k is faithfully flat over k, but M is not flat (the README's own `higher_obstruction`). (b) The same paragraph, and line 1135, say the tensor has weight n+1 on a G_m-gerbe.

   **Repair.** (a) Write “faithfully flat when it is flat and π₀M is faithfully flat”, matching the API bullet `faithful`. (b) Delete “both have weight one, since nα=0” and keep the following correction: twist by an invertible weight −n sheaf, which exists because nα=0, or work on a μ_n-lift. Tested: (a) excludes M=k; (b) gives weight (n+1)+(−n)=1.

12. **F12** (P3) Locators

   **Location and witness.** (1) Line 859: “§5.4.3, pp.66–67”. In CS24 this is Lemma 5.4.3, p.67. (2) Line 571: CS24 “§1.4, p.9” contains no definition of supports (it fixes descent and cardinal conventions); the support fibre is used in §5.2.5 and in Cor 5.3.8. (3) Line 691: “§4.1.4” is Proposition 4.1.4. (4) Line 739: Cor 4.1.9 is stated on p.38. (5) Line 1117: the README writes “Tags 0952 (Lemma 47.9.1)”, but Tag 0952 is Section 47.9; Lemma 47.9.1 is Tag 0A6R. (6) Line 60: Bégueri's Prop 2.2.1 proof invokes his reference [20], Raynaud, *Spécialisation du foncteur de Picard*, Publ. IHÉS 38, (6.2.2), not SGA 3 XVII 6.2.2. (7) Line 1142: BG80 §2.1 begins on printed p.22. (8) Line 290: C19 Lemma 3.1 (p.6) is a henselian Laurent comparison that invokes Gabber's theorem; it is not a source for `gabber-affine-brauer`.

   **Repair.** Correct each locator as stated. For (8), cite Lieblich Cor 3.1.4.2 and Gabber (Lecture Notes in Math. 844, Chapter II, Theorem 1) as the primary sources, and keep C19 only for the PGL_n-boundary formulation. Tested on (5): Tag 0A6R is the lemma that identifies geometric supports with the extended Čech complex, which the step at line 1119 uses.

13. **F13** (P3) Proof routes omit inputs they use

   **Location and witness.** (1) `p-adic-continuity` (lines 795–797), step (4): it uses lifting of smooth points and of étale algebras along henselian pairs (CS24 p.60 cites Stacks 07M8 and 04D1), but its Inputs omit SchemeAndStackFoundations §0.14 `henselian_smooth_lifting` and `henselian_finiteEtale_equivalence`. (2) `henselian-invariance` (lines 1041–1043) needs the regularity of the formal fibres of henselized finite-type ℤ-algebras (Stacks 0AH2, 0AH3; CS24 p.76) and the comparison of BC22 Lemma 2.1.3; neither is listed. (3) `noetherian-open-comparison` (lines 1089–1091) uses excision for the supports on the complement but does not list `finite-ideal-excision`.

   **Repair.** Add these items to the Inputs. Cite parent §0.21 for formal-fibre regularity, or add it as a gap there, and add a target for the BC22 Lemma 2.1.3 comparison (or cite its owner). Tested on (1): with the inputs added, step (4) can lift Q(A/pⁿ) to Q(A) for smooth affine Q.

14. **F14** (P3) The package has no sources manifest

   **Location.** `packages/SchemeAndStackFoundationsPartII/` had no `sources.toml`; the eight works were recorded only in `design/plan.json` `sources`.

   **Repair.** The service has now recorded the eight works (CS24, BC22, L08, Y18, C19, DJ, BG80, SP) with url, sha256 and licence class. The author should complete `locator` and `cited_for` for every target that cites each work (the entries the service created carry one locator each), and should add Raynaud (Publ. IHÉS 38) and Gabber (LNM 844) if they are cited after R12. Tested: all eight hashes match those in plan.json.

Scope of this review: `packages/SchemeAndStackFoundationsPartII/design/README.md` (1148 lines, 11 layers FC.0–FC.10, 61 targets), `design/plan.json` (61 nodes, 20 `requests`, 1 `gap`) and the sources manifest. The package had no `sources.toml`; the sources service created one while I fetched the eight cited works (all legal, all read; nothing is missing). The mathematics of the 61 targets is largely faithful to its sources, and the adversarial table below found no false statement. The blocking problems concern ownership and supply: two earlier roadmaps already plan about a fifth of the targets, the supplier obligations are not declared where the intake reads them, the one declared gap has no supplier, and two inputs have no owner at all.

Findings: 14 (P1: 5, P2: 1, P3: 8).

## Adversarial pass

One row per statement. “✓” means the computed values agree with the statement as written.

| # | Statement | Instance(s) | Values computed | Result | Change |
|---|---|---|---|---|---|
| C1 | Indexing π_i ↔ H^(−i) | A=k⊕k[1], G=G_a | H^(−1)(A,G_a)=π₁A=k; H⁰=k | ✓ | — |
| C2 | Derived fixed points fib(V−1) | G=ℤ/p over 𝔽_p | M=𝔽_p, V=σ⁻¹=id; fib(0)=𝔽_p⊕𝔽_p[−1], so H⁰=H¹=ℤ/p=Hom(Ẑ,ℤ/p) | ✓ | — |
| C3 | Support = fibre of restriction | I=(1); I=(0) | Z=∅ gives 0; U=∅ gives RΓ(U_A)=RΓ(0,G)=0, so RΓ_(0)=RΓ | ✓ | — |
| C4 | HenselianRing convention | (ℤ,2ℤ); (ℤ₂,2) | 2ℤ⊄Jac ℤ=0, so not henselian; ℤ₂ complete, so henselian | ✓ | — |
| C5 | Dorroh product (m,x)(n,y)=(mn,my+nx+xy) | unit (1,0) | (1,0)(n,y)=(n,y); product associative (it expands to mnk + all mixed terms) | ✓ | — |
| C6 | M(ℤ/pⁿ): F=pσ, V=σ⁻¹; M(μ_pⁿ): F=σ, V=pσ⁻¹ | FV, VF | pσσ⁻¹=p and σ·pσ⁻¹=p; agrees with CS24 Ex 4.1.2 and the PCIII §6.0 Checks | ✓ | — |
| C7 | A/^La is the cone of a | A=ℤ/p², a=p | π₀=𝔽_p, π₁=pℤ/p²≅𝔽_p | ✓ | — |
| C8 | fppf Kummer for every n | μ_p on 𝔽_p[t^±] | H¹_fppf=Γ^×/p≅ℤ/p, while H¹_et=0 | ✓ | cite §2.11 (R08) |
| 1 | `ind-fppf` | ℤ/4→ℤ/4[X]; ℤ→ℚ; 0→0; R≠0→0 | ff fp, so yes; ℤ[1/2]→S with S ff fp forces S/2S=0, contradicting faithfulness; 0 is ff over 0; 0 not ff over R≠0 | ✓ | — |
| 2 | `ind-syntomic` | ℤ→ℤ[x]/(2x−1); 𝔽_p→𝔽_p[x]/x^p; ℤ→ℤ/4 | one regular equation, flat, not ff: ind-syntomic, not ind-fppf; x^p regular, ff: both; ℤ/4 not flat | ✓ | — |
| 3 | `pro-fppf-site` | Spec k⊔Spec k→Spec(k×k) | two open immersions, jointly surjective, quasi-compact condition holds: a cover; one component misses a point | ✓ | — |
| 4 | `begueri-resolution` | G=1; μ_n; α_p | X=S, H=Q=G_m, δ(s)=s²/s=s iso; H=G_m^n, ker δ=Hom(ℤ/n,G_m)=μ_n via ζ↦(ζ^k); H(T)=(T[t]/t^p)^× open in A^p | ✓ | — |
| 5 | `twisted-sheaves` | BG_m/k; Bμ_p/𝔽_p | standard character weight 1, trivial weight 0; weights in ℤ/p, so p≡0 | ✓ | delete (R02) |
| 6 | `twisted-azumaya-criterion` | rank-r weight-one E | det E is an invertible weight-r sheaf, so rα=0; rank 0 excluded | ✓ | delete (R02) |
| 7 | `affine-twisted-patching` | X=Spec k, n=p=char k | twisted bundle exists over a field; Lieblich Thm 3.1.4.1 has no invertibility hypothesis | ✓ | delete (R02) |
| 8 | `gabber-affine-brauer` | R=ℤ; R=K a field | Br(ℤ)=0=Br′(ℤ); Br(K)=H²(K,G_m) | ✓ (injectivity unowned) | R02, R05 |
| 9 | `ample-twisted-generation` | G_m-gerbe, nα=0 | the (n+1)-fold tensor has weight n+1; twisting by weight −n (exists iff nα=0) gives 1 | ✓ after the wording fix | R11 |
| 10 | `gabber-ample-brauer` | X=ℙ¹_k; X affine | Br(ℙ¹_k)=Br(k)=Br′(ℙ¹_k); affine case is row 8 | ✓ | — |
| 11 | `animated-group-points` | G_a, A=k⊕k[1]; G_m, discrete A | π₁G_a(A)=k; π₀=A^×, π_{>0}=0 | ✓ | — |
| 12 | `group-linearized-cotangent` | μ_p/𝔽_p | L=[B·(x^p−1) → B dx] with d(x^p−1)=0, so e*L=[𝔽_p →0 𝔽_p] in degrees −1,0 | ✓ | — |
| 13 | `group-cotangent-amplitude` | μ_p/ℤ | e*L=[ℤ →p ℤ], amplitude [−1,0]; C[1/p]=0; p·id=0 since End_D(ℤ/p)=ℤ/p, so k=1 | ✓ | — |
| 14 | `points-deformation` | G_m and μ_p across 𝔽_p[ε]→𝔽_p | G_m: fibre 1+ε𝔽_p≅M=π₁Map(C,M[1]); μ_p: μ_p(𝔽_p[ε])=1+ε𝔽_p and μ_p(𝔽_p)=1, so the map to π₀Map(C,M[1])=𝔽_p is not surjective (Remark 5.1.14) | ✓ | — |
| 15 | `animated-flatness` | A=k⊕k[1], M=k | π₁A⊗π₀M=k≠0=π₁M: not flat | ✓ (wording) | R11 |
| 16 | `flat-tensor-base-change` | A=ℤ, M=ℤ_p, N=ℤ/p | π_*(N⊗M)=𝔽_p=π₀N⊗ℤ_p | ✓ | — |
| 17 | `nilpotent-flatness-test` | ℤ/4→𝔽₂; M=𝔽₂, M=ℤ/4 | 𝔽₂⊗^L_{ℤ/4}𝔽₂ has π₁=𝔽₂, not flat, matching M=𝔽₂ not flat; ℤ/4 flat and reduces to 𝔽₂ | ✓ | — |
| 18 | `animated-sites` | A=k⊕k[1]→k; k×k | étale π₀ but not flat, so not a cover; the two projections are jointly ff | ✓ | — |
| 19 | `animated-etale-equivalence` | A=𝔽_p⊕𝔽_p[1], 𝔽_{p²} | the unique lift A⊗_{𝔽_p}𝔽_{p²} has π₀=𝔽_{p²} | ✓ | — |
| 20 | `animated-henselization` | I=0; π₀A already I-henselian | (π₀A)^h_0=π₀A, so A^h=A; equivalence | ✓ | — |
| 21 | `animated-flat-cohomology` | α_p over 𝔽_p[t]; G_m, ordinary A | H¹=A/A^p∋t≠0; H⁰=A^×, H¹=Pic A | ✓ | — |
| 22 | `animated-supports` | G_a on k[t], I=(t) | H⁰_(t)=ker(k[t]→k[t^±])=0; H¹_(t)=k[t^±]/k[t] | ✓ | locator (R12) |
| 23 | `fppf-postnikov-hyperdescent` | G_a, A=k⊕k[1] | RΓ=A=τ≤1A, so Rlim is constant; G_m: étale H¹=fppf H¹=Pic | ✓ | — |
| 24 | `approximation-tower` | A_n=τ≤nA; A_n=A | recovers row 23; constant tower | ✓ | — |
| 25 | `cohomology-deformation` | μ_p, 𝔽_p[ε]→𝔽_p, M=𝔽_p | RHom(C,M[1]) has H^(−1)=H⁰=𝔽_p; LES gives H⁰(A′)=𝔽_p=H^(−1)(third) and H¹(A′)=A′^×/p=𝔽_p=H⁰(third), consistent | ✓ | — |
| 26 | `pi-zero-comparison` | μ_p, A=𝔽_p⊕𝔽_p[1] | third term in degrees [−2,−1]; H⁰(A,μ_p)=𝔽_p≠H⁰(𝔽_p,μ_p)=1 (directly: π₀ of the fibre of Frobenius is coker(φ on π₁)=𝔽_p); bijective for i≥1 | ✓ | — |
| 27 | `nil-invariance` | 𝔽_p[ε]/ε²→𝔽_p, μ_p | H¹: (𝔽_p[ε])^×/p≅𝔽_p→𝔽_p^×/p=0, surjective, not injective | ✓ | — |
| 28 | `classical-neighborhood-excision` | J=(1); J=(0) | both sides 0; V(0)≅V(0·D) forces D≅C | ✓ | — |
| 29 | `perfection-covers` | 𝔽_p[t]→𝔽_p[t^{1/p}] | perfects to the identity of 𝔽_p[t^{1/p^∞}]; perfection of ff is ff (filtered colimit of flat base changes; universal homeomorphism) | ✓ | delete or cite (R01) |
| 30 | `dieudonne-hom-ext` | ℤ/p, μ_p over 𝔽_p | ker(V−1)=𝔽_p=Hom(ℤ/p,ℤ/p); V=0 on M(μ_p), so ker=0=Hom(ℤ/p,μ_p) on reduced S; the étale stalk of coker is 0 by Artin–Schreier | ✓ | delete (R01) |
| 31 | `perfect-pro-fppf-comparison` | α_p over a perfect field | V=0, so V−1 is invertible and Rε_*α_p=0; H¹=S/S^p=0 | ✓ | delete (R01) |
| 32 | `dieudonne-artin-schreier` | G=ℤ/p | V−1=σ⁻¹−1, Artin–Schreier up to σ | ✓ | delete (R01) |
| 33 | `perfect-base-key-formula` | S=𝔽_p, ℤ/p and μ_p | ℤ/p: H⁰=H¹=ℤ/p; μ_p: V−1=−1 iso, so RΓ=0=(μ_p(𝔽_p), 𝔽_p^×/p) | ✓ | delete (R01) |
| 34 | `perfect-affine-vanishing` | perfect S; S=𝔽_p(s) | fibre of a module map sits in [0,1]; H²(𝔽_p(s),μ_p)=Br[p]≠0 shows perfection is needed | ✓ | keep as consequence |
| 35 | `split-cover-refinement` | R=𝔽_p | every monic f has a root in R̃ (R̃[x]/f is ff fp); global sections are exact, so H^{>0}=0; R̃≠0 | ✓ | — |
| 36 | `derived-beauville-laszlo` | ℤ→ℤ_p, a=p; ℤ→0, a=1 | ℤ=ℤ_p×_{ℚ_p}ℤ[1/p]; for a=1 both derived quotients are 0 and 0×_0ℤ=ℤ | ✓ | — |
| 37 | `pi-zero-derived-completion` | a a unit; a=0 | both sides 0; tower A←0−A has zero lim¹ (Mittag–Leffler); a product of two lim¹ classes lands in lim²=0 | ✓ | — |
| 38 | `p-adic-continuity` | ℤ_p and ℤ_(p)^h, μ_p (p odd); p=2 | H¹=Z/p for both rings and for the limit over (ℤ/pⁿ)^×/p; p=2: ℤ₂^×/□ has order 4, as does (ℤ/2ⁿ)^×/□ for n≥3 | ✓ | delete (R01) |
| 39 | `p-henselian-dimension` | A=𝔽_p(s) | H²=Br(𝔽_p(s))[p]≠0 (invariants 1/p at two places), so perfection is needed for i≥2; H³=0 | ✓ | — |
| 40 | `p-complete-comparison` | ℤ_(p)^h→ℤ_p | A/^Lp=𝔽_p on both sides; on D(p): H² is Br[p]=ℤ/p for both | ✓ | — |
| 41 | `semiperfect-perfection-excision` | A=A′ perfect; a=1 | kernel 0; A/^L1=0, statement vacuous-true | ✓ | — |
| 42 | `principal-excision` | ℤ_(p)→ℤ_p, a=p, μ_p | H¹_(p)=0 on both sides (units injective mod p); H²_(p)=ℚ^×/(ℤ_(p)^×ℚ^{×p})=ℤ/p=ℚ_p^×/(ℤ_p^×ℚ_p^{×p}) | ✓ | delete (R01) |
| 43 | `derived-excision-condition` | ℤ→ℤ_p,(p); ℤ/p²→𝔽_p,(p); I=(1) | 𝔽_p⊗^Lℤ_p=𝔽_p ✓; 𝔽_p⊗^L_{ℤ/p²}𝔽_p has Tor₁=𝔽_p ✗; 0→0 ✓ | ✓ | locator (R12) |
| 44 | `finite-ideal-excision` | I=(1); I=(0) | both 0; π₀A≃π₀A⊗^L_AA′ forces equality | ✓ | — |
| 45 | `noetherian-local-completion` | R=𝔽_p[t]_(t), μ_p | H¹_m=0 for R and R̂ (normality); H²_m=K^×/(R^×K^{×p})=ℤ/p=K̂^×/(R̂^×K̂^{×p}) | ✓ | — |
| 46 | `fpqc-hyperdescent` | ℤ→ℤ₂×ℤ[1/2], μ₂ | H⁰: ±1 equals the equalizer of (±1)² | ✓ | — |
| 47 | `p-completely-flat-descent` | Čech nerve of ℤ→ℤ_p | every reduction mod p is 𝔽_p: constant | ✓ | — |
| 48 | `complete-implies-henselian` | ℤ_p,(p); ℤ,(p) | henselian; ℤ is not derived p-complete and (ℤ,p) is not henselian | ✓ | — |
| 49 | `henselian-h2` | (ℤ_p,p), μ_p; (k[[t]],t), μ_p, k perfect | Br(ℤ_p)[p]=0=Br(𝔽_p)[p]; Br(k[[t]])[p]=Br(k)[p]=0 | ✓ | — |
| 50 | `restricted-complete-continuity` | A=ℤ_p, a=p, μ_p | hypotheses hold (CS24 Cor 5.3.7 for A; 𝔽_p perfect); conclusion is row 38 | ✓ | — |
| 51 | `complete-principal-descent` | R=ℤ, A=ℤ[[t]], a=t | t∉R: the stated lemma does not apply; the source's does | generality | R07 |
| 52 | `derived-complete-continuity` | empty tuple; ℤ_p,(p) | constant system; row 38 | ✓ | — |
| 53 | `ordinary-complete-comparison` | ℤ_p, μ_p, p odd | μ_p(ℤ/pⁿ)=1+p^{n−1}ℤ/pⁿ with zero transitions, so lim¹=0; H¹=ℤ/p=lim(ℤ/pⁿ)^×/p | ✓ | — |
| 54 | `henselian-noncomplete-counterexample` | 𝔽_p{t} vs 𝔽_p[[t]], μ_p | Pic=0, so H¹=units/p; countable vs uncountable (p-th powers are series in t^p) | ✓ | — |
| 55 | `henselian-invariance` | (ℤ_(p)^h,p), μ_p | H¹: ℤ/p→0, surjective, not injective | ✓ | R03, R13 |
| 56 | `topological-algebraization` | B=A, B′=I coarse | B̂=A/I recovers row 55 for i≥2 (CS24 Ex 5.6.11) | ✓ | — |
| 57 | `laurent-algebraization` | R=𝔽_p, μ_p | H²=Br[p]=ℤ/p for 𝔽_p{t}[1/t] and 𝔽_p((t)); H¹ differs (row 54), so i≥2 is needed | ✓ | — |
| 58 | `punctured-animated-comparison` | ℤ_(p)^h→ℤ_p, I=(p) | H² on the generic point: Br[p]=ℤ/p on both sides | ✓ | — |
| 59 | `noetherian-open-comparison` | same, U=D(p) | as row 58; H² injectivity from BC22 Cor 2.3.5(c), read (G over U) | ✓ | R13 |
| 60 | `perfectoid-flat-discreteness` | M=A; M=A[1] | discrete; M/^Lp=(A/p)[1] has π₁≠π₁(A/p)⊗π₀, so the hypothesis excludes it | ✓ | — |
| 61 | `adic-support-hyperdescent` | I=(1); empty tuple | supports vanish; the statement reduces to row 46 | ✓ | locator (R12) |
| Q1 | ask `henselian-torsor-gerbe` | vs BC22 Thm 2.1.6 | affine implies quasi-affine; H¹ bijective for smooth Q; H² kernel trivial; flf H¹ surjective | ✓ | split (R04) |
| Q2 | ask `cauchy-algebraization` | vs BC22 Thm 2.1.15(b) | the source needs only S-indexed colimits; the ask assumes all filtered colimits (narrower, fine) | ✓ | — |
| Q3 | ask `punctured-h2-injectivity` | vs BC22 Cor 2.3.5(c) | the source allows G over U; the ask has G over R (narrower, fine) | ✓ | — |
| Q4 | ask `adic-flat-module-limits` | vs Y18 v3 Thms 1.8, 4.3, 5.9 | numbering and content match (pp.5, 14, 16) | ✓ | supplier (R06) |
| Q5 | ask `koszul-geometric-support` | vs Stacks 0A6R | extended Čech complex = colim of dual Koszul complexes, cohomological degrees [0,s] | ✓ | R06, R12 |
| Q6 | ask `noetherian-completion-flat` | vs Mathlib pin | `AdicCompletion.flat_of_isNoetherian` exists | provided | R06 |

## Verified sound

- **Sources (8 works, all read).** Every target's Source line was checked at the cited statement: 52 CS24 targets, plus BG80 Prop 2.2.1 (printed pp.25–27), DJ Thm 1.1, §2.14, §§3.1–3.9 and Claim 3.22, L08 3.1.3.5–3.1.3.6 and 3.1.4.1–3.1.4.5, C19 §1.5 and Lemma 3.1, SP Tags 0954, 0952, 0A6R and 0955. 55 of the 61 target locators are exact. Six target locators, one ask and one reference entry need correction (R12). CS24's printed page equals the PDF page; I checked 30 statement pages individually. The 20 asks were checked against BC22 (2.1.3, 2.1.4, 2.1.6, 2.1.15, 2.3.5), Y18 (1.8, 4.3, 5.9), L08 and BG80.
- **Seeded sample.** The sample named field labels (“Inputs:”, “Proof or construction”, “Uses”, “Unit tests”, “Source:”, “Check”), an artefact of the field-list shape (R10). I therefore checked every Source line, and checked the Inputs, Proof, Uses, Unit-test and Check blocks of every fourth target in README order: begueri-resolution, gabber-affine-brauer, group-linearized-cotangent, flat-tensor-base-change, animated-henselization, approximation-tower, classical-neighborhood-excision, dieudonne-artin-schreier, derived-beauville-laszlo, p-complete-comparison, finite-ideal-excision, complete-implies-henselian, derived-complete-continuity, topological-algebraization and perfectoid-flat-discreteness. Defects found are in R05, R08 and R13.
- **Definitions.** All 13 definitions and constructions have an API list and at least three discriminating unit tests (counts 4,3,4,3,4,3,3,4,4,3,4,3,4). Each was checked against one positive and one negative instance (table rows 1–4, 5, 11, 12, 15, 18, 20–22, 43).
- **Author's source issues.** The plan's sourceIssues E1–E10 were each confirmed against the text (listed below in my own words).
- **Library at the pins (Mathlib 6b7abb3c, Tau Ceti a91d3aaf).**
  - `Algebra.FinitePresentation`: Mathlib/RingTheory/FinitePresentation.lean:43.
  - `Module.FaithfullyFlat`: Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean:63.
  - `AlgebraicGeometry.Scheme.fppfTopology` and `fpqcTopology` (both abbrevs): Mathlib/AlgebraicGeometry/Sites/Fpqc.lean:53 and :75.
  - `HenselianRing`: Mathlib/RingTheory/Henselian.lean:94.
  - `IsAzumaya`: Mathlib/Algebra/Azumaya/Defs.lean:60. It includes FaithfulSMul and Module.Finite.
  - `AdicCompletion.flat_of_isNoetherian`: Mathlib/RingTheory/AdicCompletion/AsTensorProduct.lean:378.
  - `TauCeti.CommAlgCat.fppfTopology`: TauCeti/Algebra/Category/CommAlgCat/Fppf.lean:51.
  - `cartierDualBaseChangeNatIso`: TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/BaseChange.lean:174.
  - `cartierDual`: TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean:331.
  - `TauCeti.Algebra.IsStandardSyntomicOfRelativeDimension`: TauCeti/RingTheory/Syntomic/StandardSyntomic.lean:81.
  - `TauCeti.HopfAlgebra.pointsPresheaf_isSheaf`: TauCeti/Algebra/AlgebraicGroup/Fppf/Basic.lean:61.
  - At the pin there is no Bégueri resolution, no animated ring, no gerbe and no scheme Brauer group, so those owner claims stand.
- **Cross-roadmap citations resolved.**
  - SchemeAndStackFoundations (main), 15 resolved: §0.9; §0.12; §0.14 (`henselian_pair_characterisations`, `_permanence`, `henselian_smooth_lifting`); §0.15; §0.26; §1.15 `torsorRepresentability`; §2.1; §2.2; §2.5; §2.10 `smoothGroup_fppf_etale_comparison`; §2.11; §2.15 `gabber_affine_proper_base_change`; §2.22 (`SchemeBrauerGroup`, `CohomologicalBrauer`, `Azumaya.trivializationGerbeClass`, `brauer_henselian_local`).
  - EnhancedDerivedSheaves (main): E1.3, E2.3, E2.6, E2.7, E2:towers.1, E3.2, E5:animation.1–.4, E5:cotangent-export.1.
  - Other roadmaps: ReductiveGroupsPartII RG2.0a; PerfectoidQuotients Layer 0 (`compatible_root_annihilator`); AlgebraicVectorBundles L0A–L0C (main); PotentialModularityAndCompatibleSystems §2.8 (under a wrong label); the ArcTopologyAndDescent board plan node ids AT.6, AT.8, AT.11 and AT.12 (all exist).
  - Unresolved: PrismaticCohomologyPartII PD.6, DerivedDeRhamCohomology DD.1, PMCS R23.1, SF.2/gerbe-h2-class, parent injectivity of `toH2`, SchemeKTheoryOperations S.2 lemmas (R04, R05, R08). The worker's resolver lead (R23.1) is confirmed.
  - The consumer mention PurityForFlatCohomology PF.1/PF.3–PF.5 exists as a board package job (TauCetiRoadmapJobs issue 470).
- **Ownership against open work.** Checked by object with `roadmaps grep` over main and all 330 open roadmap pull requests (index 2026-10-23T13:51Z), and over the board checkout. Searches covered CS24 and Bégueri citations, ind-fppf/ind-syntomic/pro-fppf, twisted sheaves, Gabber/Br′, Dieudonné over perfect bases, and CS24 theorem numbers. Duplicates found: PCIII §6.0 (R01) and HRPO §§2.6a–2.6c (R02); HRPO §2.6b also covers the S.2 ask. No other roadmap plans ind-fppf/ind-syntomic maps, the pro-fppf site, complete continuity, henselian invariance or adic descent with supports; PerfectoidQuotients §1.2 uses “ind-syntomic” without defining it. No roadmap cites SchemeAndStackFoundationsPartII, so no cycle arises.
- **Dependency gate** (run as the brief gives it):

      candidate: SchemeAndStackFoundationsPartII is not in the merge order yet; checked as if placed after EnhancedDerivedSheaves (the intake inserts it when its design is accepted)
      depcheck: 27 roadmaps, 225 edges, 0 problem(s)

  No UPWARD or CYCLE line appears. The placement is a false negative of the parser on the `Roadmap:Label` citation form (R08). The cited suppliers reach merge order line 127, and no supplier is later than this roadmap's own true slot, so nothing is upward.
- **Elaboration.** Not available: this lane does not elaborate. In any case the design stage has no Suggested.lean. For the package stage, note that fppf cohomology of a ring with coefficients in a commutative Hopf algebra looks statable at the pins via `CommAlgCat.fppfTopology`, `pointsFppfSheaf` and Mathlib `Sheaf.H`. Animated rings, Br_Az of a scheme and twisted sheaves are not statable there.

## Not verifiable

- Raynaud, *Spécialisation du foncteur de Picard*, Publ. IHÉS 38, (6.2.2), the reference Bégueri actually invokes for the Ext¹-sheaf vanishing: not fetched in this round. The attribution error (R12) is established from Bégueri's own bibliography.
- Illusie, *Complexe cotangent et déformations* I, VII (3.1.1.3), cited for the group cotangent amplitude: a paywalled volume; I relied on CS24 §5.1.11's restatement.
- Gabber, LNM 844, Chapter II, Theorem 1, and Gabber–Ramero: not opened. They are used only through CS24, C19 and L08 restatements.
- HTT/SAG, used by CS24 §§5.1.1–5.1.10 for animation: not opened. CS24 Prop 5.1.5 and Ex 5.1.6 were read.
- de Jong §§3.10–3.16 were skimmed, not checked line by line; BC22 §§2.1.12–2.1.13 were read only at their statements.
- The PurityForFlatCohomology and ArcTopologyAndDescent packages live on other board pull requests. I read only ArcTopologyAndDescent's plan node ids and section list in the board checkout.

## Source issues

- **Misprint** in CS24 at §5.2.1, printed p.53: the displayed tensor formula has the full graded homotopy on the left but a single degree on the right; it should be graded on both sides, π_*(N)⊗π₀(M); affects nothing.
- **Misprint** in CS24 at proof of Lemma 5.4.2, step (3), printed p.65: the torsion comparison names the unprimed ring's π₀; it should name π₀ of the primed (semiperfect) algebra; affects nothing.
- **Misprint** in CS24 at Example 5.6.7, printed p.75: an opening “for i at least 2” contradicts the displayed degree-one surjectivity; it should carry no restriction (surjective for i≥1, bijective for i≥2); affects a stated result.
- **Misprint** in CS24 at proof of Theorem 5.7.2, printed p.79: the list of three descent assertions repeats the second equation label; the third should be (5.7.2.3); affects nothing.
- **Misprint** in CS24 at proof of Theorem 5.7.2, printed p.80: the truncation used in a base change is written without its ring argument; it should read τ≤n(A); affects nothing.
- **Misprint** in CS24 at proof of Theorem 5.7.2, printed p.81: faithful flatness is taken modulo (a₁,…,a_n), using the power index; it should be modulo (a₁,…,a_r); affects nothing.
- **Gap** in CS24 at proof of Theorem 5.7.2, printed p.81: geometric support cohomology over the non-Noetherian Witt ring is computed by Stacks 0954, which concerns the derived torsion functor; it should use the extended Čech/dual-Koszul model (Stacks 0A6R) or prove weak proregularity; affects the proof.
- **Error** in L08 at proof of Lemma 3.1.3.5, printed p.10: it asserts that a quasi-compact scheme has finitely many connected components, which fails for Spec of an infinite product of fields; it should use the finitely many values of the locally constant rank; affects the proof.
- **Error** in L08 at proof of Lemma 3.1.4.3(i), printed p.12: it uses d trivializing complexes and nilpotence exponent d in Krull dimension d, which fails for d=0; it should use d+1 of each; affects the proof.
- **Gap** in L08 at proof of Lemma 3.1.4.3(iv), printed p.12: it deduces that n kills η from nilpotence and (r+η)ⁿ∈ℤ, which nilpotence alone does not give (ℤ[η]/(η²+2η,η³): (1+η)²=1, 2η≠0); it should argue in K₀⊗ℚ and clear denominators; affects the proof.
- **Misprint** in DJ at §§2.2, 2.8 and 2.12, printed pp.1–2: three cross-references print as unresolved placeholders; they should cite limits of étale cohomology, the weight decomposition for a diagonalizable group, and quasi-coherent limits on Noetherian stacks; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "accb0a0", "job": "REV-DESIGN-SchemeAndStackFoundationsPartII", "model": "opus", "worker": "fable-rev14"} -->
