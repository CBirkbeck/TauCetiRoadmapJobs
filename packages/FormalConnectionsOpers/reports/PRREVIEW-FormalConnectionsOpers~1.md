# Review of FormalConnectionsOpers (pull request #1056 at e2a605f)

**Verdict:** needs changes

Gate at this head: every check passed (`build=0`, `depcheck=0`, `stray-files=0`). The findings below are supplier-direction and ownership defects the gate does not see, plus style. The three stated headline theorems are true as written and their sources check out.

## R01 (P2) — Supplier cycle with AffineLieAlgebras

Location: `TauCetiRoadmap/FormalConnectionsOpers/README.md` line 56 (supplier row "AffineLieAlgebras A8, generic mode/completion phase"), lines 955–971 ("Apply AffineLieAlgebras A8's generic mode/completion phase … cofinality with the generic A8 completion"), line 1048.

Claim: FormalConnectionsOpers consumes AffineLieAlgebras A8.

Witness: AffineLieAlgebras on main, `TauCetiRoadmap/AffineLieAlgebras/README.md` line 59, lists "FormalConnectionsOpers F1–F8" as a supplier (opers, function algebras, Miura, screening comparison), and line 449 reads "Consume FormalConnectionsOpers F4.3's finite Chevalley restriction". Two roadmaps cite each other; the dependency check does not see the pull-request-link form of the AffineLieAlgebras citation.

Repair: delete the A8 supplier row and the two consuming sentences of F7.5. F7.5 already constructs its completion explicitly (`lim_N k[w_i[a]:a<N]` with the ideals `J_N`, lines 960–968); keep that construction as the owned target and drop "cofinality with the generic A8 completion". The comparison between this completion and A8's generic one is the consumer's (AffineLieAlgebras') target. F8.4 keeps AffineLieAlgebras as a downstream consumer only (the sentence "AffineLieAlgebras owns the completed UEA and Feigin–Frenkel isomorphism" is an ownership statement and stays).

## R02 (P2) — Supplier cycle with KacMoody

Location: README line 57 (supplier row "KacMoody KM8–KM8A") and line 472 ("Compare with KacMoody KM8's separately constructed untwisted minimal group only after …").

Claim: F3A.4 consumes KM8A's real-root/torus homomorphism, central kernel and rotation conventions.

Witness: KacMoody at the head of its pull request (#1124, the pull request that adds the folder) line 154: "Consume FormalConnectionsOpers F3A for the independently constructed polynomial/formal functors, Iwahori and positive subgroups, full-cocharacter normalizer quotients and positive-orbit comparison", and line 16 names F3A as owner. KacMoody is at position 2 of the merge order and this roadmap at 39, so KacMoody's citation is already upward; this roadmap's consumption of KM8A closes a cycle.

Repair: delete the KM8–KM8A row and the F3A.4 comparison sentence. KM8A already states the comparison of its minimal group with the polynomial loop group as its own target (KacMoody head lines 150–152), so nothing is lost; list KacMoody under downstream consumers.

## R03 (P2) — LieGroups contract cited from a revision pull request, not from main

Location: README lines 28–34 ("Layer 7's algebraic compact-form specialization", "generic pre-compact-form Layer 7 carrier, global-exponential and realification interfaces"), line 55, lines 500–503, 531–532 ("L7's comparison to the underlying real tangent Lie algebra and then the real `LeftInvariantDerivation` equivalence"), lines 569–576 ("discharge every input of current L7's algebraic compact specialization"), line 601 ("L7's holomorphic group exponential chart").

Claim: LieGroups Layer 7 supplies an algebraic compact-form specialization with specified inputs (native `WithConv` carrier, matrix dictionary, biholomorphic group isomorphism), a realification comparison and a holomorphic exponential chart.

Witness: LieGroups on main (`TauCetiRoadmap/RepresentationTheory/LieGroups/README.md` lines 407–426) has four bullets in Layer 7: universal complexification, real forms with compact-real-form existence as a milestone, and the unitary trick. None of the cited items exists there; they exist only at the head of pull request #1051 (lines 993–1013 realification and exponential compatibility, line 1104 "algebraic compact-form descent", line 1170 naming this roadmap). LieGroups is on main, so #1051 revises an existing roadmap and is never a dependency.

Repair: cite LieGroups as on main: Layer 0 (exponential map), Layer 6 (Weyl group, `lieExp` surjective for compact connected groups) and Layer 7 (existence of a compact real form). State the remaining inputs as F4.3 targets with hypotheses: the holomorphic exponential chart of `G(ℂ)` near 0 with derivative the identity, the comparison of the complex Lie algebra with its realification, and the identification of the compact form's maximal torus with an algebraic torus. With R04 applied, most of this lane is no longer on the route to any export and can be cut to what NilpotentOrbits consumes.

## R04 (P2) — Chevalley restriction re-planned instead of imported from LieHighestWeight

Location: README lines 612–621 ("identify the complexification of C5.1's real compact invariant polynomials with these complex coaction invariants … Export S(𝔤*)^G≃S(𝔥*)^W by this adapter, rather than prove a second compact restriction theorem") and the whole compact-form lane lines 576–616 that serves it.

Claim: the only owner of a Chevalley restriction theorem is CharacteristicClasses C5.1 (compact groups), so this roadmap derives the algebraic statement through a compact form.

Witness: LieHighestWeight on main, `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md` lines 980–1030, owns the Lie-algebra Chevalley restriction over every algebraically closed characteristic-zero field: `lieInvariantSymmetricAlgebra`, `lieCartanRestriction`, the `Int(L)·H` density argument and the restriction isomorphism; ReflectionInvariantTheory line 132 records "LieHighestWeight L7 owns Lie-algebra Chevalley restriction". This README never cites LieHighestWeight.

Repair: cite LieHighestWeight Layer 7 for `S(𝔤*)^𝔤 ≃ S(𝔥*)^W` (semisimple part; central directions are degree-zero summands). Keep in F4.3 only the adapter that `G`-invariants equal `𝔤`-invariants for connected `G` in characteristic zero (ReductiveGroups Layer 6 connectedness plus differentiation of the coaction), and the Kostant slice/exponent material that NilpotentOrbits and AffineLieAlgebras consume from F4.3. The route through `K` Zariski dense, `V^G=V^K` and complexified compact invariants is then not needed for any export; if NilpotentOrbits' consumed "matched algebraic/compact torus and pinning" is kept, keep it as a separate target that is not the proof of the restriction theorem.

## R05 (P2) — PadicDifferentialEquationsAndRigidCohomology is later in the merge order and the citation is invisible to the dependency check

Location: README line 58 (table row "PadicDifferentialEquationsAndRigidCohomology §§RD.1.2–RD.1.6 and §RD.6.52a") and lines 773–777.

Claim: F6 consumes the cyclic-vector theorem and the formal normal-form theorem from that roadmap.

Witness: `ORDER.txt` lists PadicDifferentialEquationsAndRigidCohomology at position 105 and FormalConnectionsOpers at 39. The check on this README prints `depcheck: 204 roadmaps, 1407 edges, 0 problem(s)` with no `moved:` line; the same check on a one-line file "PadicDifferentialEquationsAndRigidCohomology §RD.1.2 supplies …" prints `moved: FormalConnectionsOpers moved in the merge order from #38 to #104, right after its last supplier PadicDifferentialEquationsAndRigidCohomology`. The table-row form is not parsed, so the worker will not move this roadmap at submission. The supplier's head (pull request #1002, line 153) owns exactly these sections and states "There is no prerequisite from the oper development here", so the move creates no cycle.

Repair: write the citation in the link form the check parses, `[PadicDifferentialEquationsAndRigidCohomology §§RD.1.2–RD.1.6, §RD.6.52a](../PadicDifferentialEquationsAndRigidCohomology/README.md)`, in the table and in F6; the check then records the move after its last supplier.

## R06 (P3) — Backticked supplier names that do not exist at the cited heads

Location: README lines 48 and 164 (`Crystalline.Connection`); lines 260, 266, 273, 275, 278, 301, 332 (`.complexPoints`, `.openSubspace`, `.fibreProduct`, `.closedSubspace`, `.separatedHausdorff`, `.smooth`, `.etaleLocalIso`); line 350 (`regularAffinePointEquiv`).

Witness: CrystallineCohomology at the head of #857 states the CR.1.3 carrier in prose (lines 1266–1300) and its `Suggested.lean` declares only `Crystalline.exists_frobenius_block_basis`; no `Crystalline.Connection`. ComplexComparisonPartII at the head of #848 states the complex-point, open, closed, fibre-product, smooth-chart and étale comparisons in prose under C-1.1 (lines 724–800); none of the seven dotted names occurs in its README or Lean. AnalyticToricGeometry at the head of #1187 (Layer 2 item 2) and Tau Ceti at the pin (`TauCeti/Geometry/Toric/Analytic/RegularChart.lean`) name `regularAffinePointHomeomorph` and `coneChartEquiv`; `regularAffinePointEquiv` exists nowhere.

Repair: cite CR.1.3 and C-1.1 by section in prose ("C-1.1's complex-point comparison", "its open-restriction comparison", …) and replace `regularAffinePointEquiv` by `regularAffinePointHomeomorph` with its target `(ι → ℂ) × (κ → ℂˣ)` checked against the Tau Ceti declaration.

## R07 (P3) — README shape: no Checks lists, no Needs lines, no layer examples or dependencies, most targets without locators

Location: whole README. Counts: `**Checks.**` 0 (three inline "Checks:" sentences at lines 195, 381, 462), `*Needs:*` 0, `### Examples` 0, `### Dependencies` 0, none of the headings `Summary`, `Scope and ownership`, `Conventions`, `Exact supplier contracts`, `Downstream consumers`, `References`. Targets with no locator at all: F1.1–F1.2, F3.1–F3.4, F4.1, F4.2, F4.4, F5.1–F5.3, F7.1, F7.4, F8.1–F8.3.

Repair: restructure to the house shape (see any roadmap on main, for example SchemeAndStackFoundations or AnalyticToricGeometry at its head): one `*Needs:*` line per target, three discriminating Checks per definition (several already exist as prose and only need to be listed), `### Examples`/`### Dependencies` per layer, and a locator on every theorem (Frenkel's book chapters for F4–F5, Frenkel–Gaitsgory §§1, 4 for F8, Drinfeld–Sokolov for F7).

## R08 (P3) — Process narrative and pull-request references

Location: README lines 94–95 ("The preceding proposed roadmap contracts are dependencies to implement in Tau Ceti; their open status is never a reason to postpone construction"), line 569 ("current L7's"), lines 1074 and 1082 ("Acceptance examples", "Acceptance includes"), line 1093 (Zulip thread), line 1094 (five Mathlib pull-request links).

Repair: delete lines 94–95 and the Zulip/pull-request bullets; rename the references section `## References`; move the acceptance list into the layers' Checks.

## R09 (P3) — Roadmap-level cycles with ReductiveGroups and NilpotentOrbits that this folder cannot break alone

Location: README line 45 (ReductiveGroups Layers 0–9 supplier row); ReductiveGroups on main line 1964 ("The lower smooth/holomorphic dictionary of FormalConnectionsOpers F4.3 … is a prerequisite for the analytic charts here"); NilpotentOrbits on main lines 60 and 63 (consumes F2.4 and F4.3 exports).

Both sides state layer-level acyclicity (ReductiveGroups: "The algebraic classification, integral construction and that lower dictionary have no dependency on this lane"). Recorded as a design note: the complex-point Lie-group structure of `G(ℂ)` and its tangent identification (F4.3 lower dictionary, F2.4) are generic objects consumed by three roadmaps on main; their natural owner is ReductiveGroups or LieGroups. No repair in this folder; the intake should decide where the dictionary lives.

## Verified sound

**Gate.** Worker's gate at e2a605f: every check passed. Dependency check run here: `depcheck: 204 roadmaps, 1407 edges, 0 problem(s)` (no UPWARD or CYCLE line; see R05 for the one citation it does not parse). No change outside the roadmap folder (`git diff --stat origin/main...HEAD` excluding the folder is empty). Folder contents: `README.md`, `Suggested.lean`, `metadata.toml` only.

**Lean.** `Suggested.lean` imports `Mathlib`, `TauCeti.Algebra.AlgebraicGroup.PointsFunctor`, `TauCeti.Algebra.AlgebraicGroup.Reductive.Basic`; no `set_option`, no sorry'd data, `theorem` only, one module docstring. `#check @name` for all 12 declarations elaborated on a scratch copy: every binder in the README statement is in the elaborated type (`[Algebra ℚ R]` on `regularGauge_constantCoeff_bijective`, `reductiveCommHopfAlgProperty ℂ H` on the loop factorization, `IsScalarTower k A M/N` on the principal-parts theorem); nothing changed. One-tactic probe (`rfl`, `simp`, `infer_instance`, `intros; simp_all`, `decide`) on each of the three sorried theorems: none closes; no padding. `#synth Algebra ℚ (LaurentSeries ℚ)` under defaults returns `HahnSeries.powerSeriesAlgebra ℤ ℚ` (`Mathlib/RingTheory/HahnSeries/PowerSeries.lean` line 217); the file's `local instance (priority := high)` selects `HahnSeries.instAlgebra` instead, so the headline is stated against a propositionally but not definitionally equal `ℂ`-algebra structure on `R((t))`. Not a defect; a consumer should know it.

**Pinned declarations opened** (Tau Ceti a91d3aaf, Mathlib 6b7abb3c, the worktree manifest): `TauCeti.reductiveCommHopfAlgProperty` = smooth ∧ geometrically connected ∧ no nontrivial connected normal smooth unipotent subgroup over the algebraic closure (`TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean` lines 70–82), so the Lean hypothesis is "connected reductive" as the README says; `TauCeti.zHat.gen`, `hom_ext`, `lift`, `lift_gen`, `lift_unique`, `liftEquiv` (`Topology/Algebra/Group/Profinite/ZHat/Basic.lean` lines 89–170); `zHat.cohomologicalDimensionAt_le_one` (needs `p ≠ 0`), `cohomologicalDimensionAt_eq_one` (needs `Fact p.Prime`), `cohomologicalDimension_eq_one` (`ZHat/CohomologicalDimension.lean` lines 191–206), matching the README's "nonzero/prime hypotheses"; `TauCeti.chartedSpaceOfIsOpenEmbedding`, `isManifold_chartedSpaceOfIsOpenEmbedding` (`Geometry/Manifold/Gluing.lean` lines 68, 116); `ContinuousMonoidHom.exists_mem_nhds_one_forall_le_ker` (`Analysis/Normed/Algebra/NoSmallSubgroups.lean` line 95); `TauCeti.Bialgebra.CounitAlgebra`, `WithConv`, `HopfAlgebra.points`, `AlgHom.mapValue`, `ProjectiveGeneralLinear`, `regularAffinePointHomeomorph`, `coneChartEquiv` all present. Mathlib: `Algebra.Smooth.exists_span_eq_top_isStandardSmooth`, `Algebra.IsSmoothAt.exists_isStandardEtale_mvPolynomial`, `MvPolynomial.vanishingIdeal_zeroLocus_eq_radical`, `TopologicalSpace.secondCountableTopology_of_countable_cover`, `IsTopologicalGroup.exist_openSubgroup_sub_clopen_nhds_of_one`, `ProfiniteGrp.exist_openNormalSubgroup_sub_open_nhds_of_one`, `Matrix.linftyOpNormedRing/Algebra`, `GroupLieAlgebra`, `LeftInvariantDerivation`, `LieRinehartAlgebra`, `RootPairing.flip`, `RootPairing.Base.flip`, `HahnModule`, `PowerSeries.derivative`, `Matrix.GeneralLinearGroup.map` all elaborate; `mlieBracket` is in `Mathlib/Geometry/Manifold/VectorField/*` (not exported by the two imports but at the pin).

**Sources read at their locators.** stacks-09CI line 15759 (definition of order-k operators, inductive, order 0 = S-linear), stacks-09CK line 15779 (universal property `Diff^k(M,N) = Hom_S(P^k(M),N)`), stacks-0H90 lines 15908–15913 (`P^k ≃ (S⊗_R M)/J^{k+1}(S⊗_R M)`, `s` acting by `s⊗1`, universal operator `m ↦ 1⊗m`): the Lean `principalPartsRelations`, `PrincipalParts`, `principalJet` and `principalParts_universal` transcribe these exactly, including the left-factor `A`-action. cesnavicius-presheaf lines 359–369 (Theorem 19: `G(A((t))) = G(A[t,t⁻¹])·G(A[[t]])` for reductive `G` over any ring `A` with `G_ad` totally isotropic), lines 330–331 (split ⇒ totally isotropic), lines 332–333 (Theorem 16 = ČF Theorem 4.2), lines 373–382 (proof by patching to Theorem 16). cesnavicius-fedorov lines 721–735 (Theorem 4.2 statement and the diagonal-section, degree-`d` pullback and fibral-lift steps the README's F3A.2 lane restates). drinfeld-tate lines 218–240 (elementary Tate modules `P⊕Q*`, lattices: open with `L/U` finitely generated), 264 (Theorem 3.3), 477–489 (Lemma 3.9 topological nilpotence, Theorem 3.10), 490–496 (Theorem 3.11 with `f(a)=1⊗a`, `g(a)=a⊗1`): README F1.3 and F3.2 match. frenkel-zhu lines 9–18 (connected reductive `G`), 26 (gauge `Ad_g A − (∂_t g)g⁻¹`, the README's `regularGauge`), 346–354 (Lemma 10 for `r ≤ −1`), 193 and 362 (Theorem 4 and the fixed-locus stage for `r ≤ −2`): the README's `r ≤ −1` versus `r ≤ −2` distinction is the paper's. frenkel-gaitsgory lines 13, 16, 35: §1 Opers, §4 Groupoids and Lie algebroids associated to opers, §19 Miscellanea, as cited. Seeded sample "Native Lie-series and coefficient conventions": FormalLaurentPuiseux L1 line 94 pins `σ_φ∘σ_ψ = σ_(ψ(φ))` with `σ_φ(f)=f(φ)`, which is the README's `σ_(ψ∘φ)`; LieGroups Layer 6 on main has the `N(T)/T ≃ RootPairing.weylGroup` milestone and surjective `lieExp`; the Layer 7 items fail on main (R03). CharacteristicClasses C5 item 1 on main (line 1062) states compact Chevalley restriction `I(G) ≃ Sym(t*)^W`.

**Cross-roadmap citations resolved.** On main: ReductiveGroups Layers 0–9 and 6B (line 613, naming F6 as consumer), ReductiveGroupsPartII RG2.5.1 (line 6724), SchemeAndStackFoundations §§1.1, 1.14–1.18 (lines 2071–2745), ComplexKahlerGeometry K1/K4 (K3.0 as a sub-item), ComplexManifolds Milestones 1, 2, 7, AffineLieAlgebras A8, AffineMorseLefschetz A4, ProfiniteCohomology Layers 1 and 11, GeometricRepresentationCategories R3–R5 (consumer), SmoothBundlesConnections, AlgebraicVectorBundles, RootSystems. At open heads: CrystallineCohomology CR.1.3 (#857, line 1121), ComplexComparisonPartII C-1.1, C0.3, C0.4, C5.1, C5.2 (#848, lines 724, 1019, 1070, 2336, 2564), KacMoody KM8A (#1124, line 148), PadicDifferentialEquationsAndRigidCohomology RD.1.2–RD.1.6 and RD.6.52a (#1002, line 153), AnalyticToricGeometry Layers 2, 3G, 3, 6 (#1187, lines 283–465). Ownership against open pull requests checked by object: the affine Grassmannian in GeometricSatakeAndFusion (#1235) is the Witt/Fargues–Fontaine one over diamonds, not the complex loop Grassmannian; ReductiveGroupsPartII line 63 disclaims affine Grassmannians; no other open roadmap builds opers, Drinfeld–Sokolov reduction, polynomial loop factorization or the isomonodromy groupoid.

**Adversarial table.**

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `principalParts_universal`, n=0 | any k, A, M | relations = span{a⊗m − 1⊗am}; quotient ≃ M by a⊗m ↦ am; `Hom_A(M,N)` = order-0 operators | holds | none |
| same, A=k[x], M=N=A, D=d/dx | order 0, 1 | D(x·1)=1 ≠ x·D(1)=0 so not order 0; [D,x]f=(xf)'−xf'=f, A-linear, so order 1; factor f: 1⊗1↦0, 1⊗x−x⊗1↦1 | matches README Check | none |
| same, char p | k=𝔽_p | (d/dx)^p x^n = n(n−1)⋯(n−p+1)x^{n−p} = 0; x^n ↦ C(n,p)x^{n−p} has order p | matches README Check | none |
| same, zero ring / A=k | A=0; A=k | all modules zero; relations span{0}, every k-linear map order 0 | holds | none |
| `regularGauge` composition | symbolic | gauge(h,gauge(g,A)) = hgA(hg)⁻¹ − (h'h⁻¹ + hg'g⁻¹h⁻¹) = gauge(hg,A) | holds | none |
| frame-change dictionary line 373 | g=h⁻¹ | g⁻¹Ag + g⁻¹dg = hAh⁻¹ − (dh)h⁻¹ | holds | none |
| `regularGauge_constantCoeff_bijective` | n=1, A=1, B=0, R=ℚ | g'=g ⇒ g=g₀e^t, unique per g₀ | bijective | none |
| same | R=𝔽_p, A=B=0 | g=1+t^p has g'=0; constant term 1 shared with g=1 | not injective; `[Algebra ℚ R]` needed | none |
| same | R=ℚ[ε]/ε², A=εI, B=0 | g'=gε ⇒ g=g₀(1+εt) | bijective | none |
| same | n=∅; R=0 | both sides singletons | bijective | none |
| `formalLoop_eq_polynomial_mul_positive` | G=1 | singleton = singleton·singleton | holds | none |
| same | G=𝔾_m, R=ℂ | u = t^n·w, w∈ℂ[[t]]ˣ | holds | none |
| same | G=𝔾_m, R=ℂ[ε]/ε² | u=u₀+εu₁ unit iff u₀ unit; u = t^n(1+εh₋)·w₀(1+εh₊) with h₋∈t⁻¹ℂ[t⁻¹], h₊∈ℂ[[t]]; 1+εt⁻¹ already polynomial | holds | none |
| same, hypothesis | `reductiveCommHopfAlgProperty ℂ H` | = smooth ∧ geom. connected ∧ trivial geometric unipotent radical; over ℂ split ⇒ G_ad totally isotropic (cesnavicius-presheaf line 330) ⇒ Theorem 19 applies for every ℂ-algebra R | holds | none |
| F2.3 negative control | A=k[x,y]/(x,y)², ∇a=da+ax dy | Ω¹ has k-basis dx, dy, x dy (dim 3); Ω²=k·dx∧dy; curvature(1)=d(x dy)=dx∧dy≠0; ξ(x),ξ(y)∈(x,y) so xξ(y)=0 and ∇_ξ=ξ; Ω¹ needs 2 generators over a local ring, not projective | README correct | none |
| F5.4 Schwarzian | g=(φ')^{-1/2} f∘φ, f''=qf | g'' = g[φ'²q∘φ − ½(φ'''/φ' − (3/2)(φ''/φ')²)] | q^φ as stated | none |
| F5.4 infinitesimal | φ=t+ε | (1+2ε')(q+εq') − ½ε''' = q + εq' + 2ε'q − ½ε''' | as stated | none |
| F5.4 gauge witness | c=cosh, s=sinh, g=[[c−ts,−s],[−s+tc,c]] | g' = [[−tc,−c],[ts,s]] = gA₀ − A₁g; g(0)=1; det g = c²−s² = 1 | as stated | none |
| F7.2 anchor sign | H_x(A)=Res κ(A,x) | {H_x,H_y}(A) = Res κ([A,x],y) + Res κ(x',y) = ⟨dH_y, x'+[A,x]⟩ | anchor +∇_ad x | none |
| F3.3 infinitesimal gauge | g=1+εx | (1+εx)A(1−εx) − εx' = A + ε([x,A] − x') | as stated | none |
| F7.3 Virasoro | L_n=Res t^{n+1}q, P_q=2q∂+q'−½∂³ | Res t^{n+1}P_q(t^{m+1}) = (2(m+1)−(m+n+2))L_{m+n} − ½(m³−m)δ_{m+n,0} = (m−n)L_{m+n} − ½(m³−m)δ | as stated | none |
| F7.3 KdV | H=Res q² | P_q(2q) = 4qq'+2qq'−q''' = 6qq'−q''' | as stated | none |
| F7.4 ideal test | L₂=q_{−4}∈I, L₋₂=q₀∉I | {L₂,L₋₂} = 4L₀ − ½(8−2) = 4L₀−3; L₀=q_{−2}∈I; restricts to −3 | not a Poisson ideal | none |
| F7.4 coisotropy | m,n ≥ −1 | (m−n)L_{m+n} with L_{m+n}∈I unless m=n=−1 (coefficient 0); central term vanishes for m∈{−1,0,1} | {I,I}⊂I | none |
| F7.5 Miura | A_Miura=[[−u,0],[1,u]] | (∂−u)(∂+u)f = f'' + (u'−u²)f ⇒ q = u²−u' | as stated | none |
| F8.4 critical level | κ_c=−½Killing | Killing = 2h∨κ₀ ⇒ κ_c|_{𝔤_i} = −h_i∨κ_{0,i} | as stated | none |
| F6 vector fields | D=t^{−r}∂ | ε=−t^{−r}∈t²ℂ[[t]]∂ iff r≤−2; ∈tℂ[[t]]∂ iff r≤−1 (frenkel-zhu lines 346, 362) | as stated | none |
| F3A.3 Y⋊W | (λ,w)(μ,v)=(λ+wμ,wv) | n_w t^λ n_w⁻¹ = t^{wλ}; GL_n: Y/Q∨ ≅ ℤ by det; PGL₂: [Y:Q∨]=2; SL₂: Y=Q∨ | as stated | none |
| F1.2 substitution | σ_φ(f)=f∘φ | σ_φσ_ψ f = f∘ψ∘φ = σ_{ψ∘φ} f; (q^φ)^ψ = q∘φ∘ψ = q^{φ∘ψ}, a right action | agrees with FormalLaurentPuiseux L1 line 94 | none |
| F1.3 lattice, Tate module | Drinfeld lines 218–240 | same definitions | agrees | none |

**Headline theorems.** From the README: F3A.2 polynomial factorization (stated), F2.4 regular horizontal trivialization over ℚ-algebras (stated), F2.2 principal-parts universal property (stated; elementary but not one-tactic), F6 Frenkel–Zhu essential surjectivity and torsor triviality over ℂ((t)) (not statable: no torsors or flat principal bundles over `ℂ((t))` at the pins; docstring says so), F4.3 Chevalley–Kostant (docstring says not statable; after R04 it is imported, not a headline), F5.2 character classification of `Fun Op(D×)`, F7 Poisson structure, F8 isomonodromy algebroid (not statable; no completed oper function algebra at the pins; docstring says so). No statable headline is absent.

## Not verifiable

- kazhdan-lusztig-1988 (Israel J. Math., DOI 10.1007/BF02787119), cited at README lines 797–800 for §4 Lemmas 6 and 8: paywalled; recorded as uncertified.
- Kazhdan–Lusztig 1980, cited at line 826 for §2's involution σ_i: the README links the Lusztig archive index, which the sources service resolved to a different document ("History of the canonical basis"); the paper itself was not found at a legal address.
- Kostant 1963 (AMS Bull.): the AMS host is in no licence class for the service; the README cites it without a theorem number, so no locator was checked. Listed in `needs-references.toml`.
- Chevalley 1955, Matsushima, Drinfeld–Sokolov, Frenkel's *Langlands Correspondence for Loop Groups*: cited without theorem numbers; not fetched.

## Source issues

- **Gap** in frenkel-zhu at §5 Lemma 10, printed page 9: the proof derives the formula for the twisted adjoint action from its brackets with every element of 𝔤(F) and invokes semisimplicity, while the paper's G (page 1) is connected reductive, where bracket identities do not detect central directions; it should be proved by differentiating the semidirect multiplication directly, as the README's F6 does; affects the proof.
