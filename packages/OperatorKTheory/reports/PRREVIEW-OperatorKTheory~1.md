# Review of OperatorKTheory (pull request #866 at d1b2465)

**Verdict:** needs changes

The gate fails (five `blob` links, eight `Mathlib.<submodule>` imports, no `import Mathlib`); the dependency check shows no UPWARD or CYCLE line (`NOT IN ORDER` only, which is the board's to settle). The findings below are ordered by severity. Four are blocking (R01 is P1, R02 to R04 are P2); the rest are the author's to take or leave, but R06 and R07 must be repaired for the gate to pass.

## R01 (P1) — Dynamics sub-sections cited as supplied do not exist on main

Location: `TauCetiRoadmap/OperatorKTheory/README.md` lines 985–987 ("consume Dynamics D1.CentralTwists/D2.CentralTwists' counting-Haar algebra C*(L,c), its faithful coefficient trace and gauge action"), line 920 ("consume Dynamics D2's regular right-coset subgroup embeddings"), line 912 ("belong to Dynamics D2.FreeGroups").

Claim: the twisted group algebra `C*(L,c)` with its gauge action and faithful trace, the reduced right-coset subgroup embeddings, and the free-group simplicity results are supplied by OperatorAlgebraDynamics.

Witness: OperatorAlgebraDynamics on main (commit 4d14cbd) has sections D1–D9 only (`TauCetiRoadmap/OperatorAlgebraDynamics/README.md` lines 75–728); no `CentralTwists`, no `FreeGroups`, no "coset" anywhere. Those subsections exist only at the head of the pull request revising that roadmap (`### D1.CentralTwists` line 155, `### D2.CentralTwists` line 523, `### D2.FreeGroups` line 585, right-coset decomposition line 653). A pull request that revises an existing roadmap is never a dependency: the supplier is cited as it is on main, and on main these sections do not exist. The whole "Twisted abelian centers and simplicity" block (lines 984–1017) and the arbitrary-basis reduced-algebra limit (lines 916–924) therefore rest on an unowned prerequisite.

Repair: either (a) declare the two contracts as gaps in `## Exact supplier contracts` under OperatorAlgebraDynamics: `What OperatorAlgebraDynamics must provide (gap:dynamics-central-twists): for a discrete abelian L and a normalized circle-valued 2-cocycle c, the full twisted group C*-algebra C*(L,c) with unitaries W_x, W_xW_y = c(x,y)W_{x+y}, its faithful trace and the gauge action of L̂ by α_χ(W_y) = χ(y)W_y`, and `(gap:dynamics-reduced-coset-embeddings): for a subgroup H of a discrete G, the faithful inclusion Cr*(H) → Cr*(G) through the right-coset decomposition of ℓ²(G)`; or (b) build `C*(ℤ^d,c)` here as the universal C*-algebra of d unitaries with the cocycle relations, with its trace and gauge action, since for L = ℤ^d this is a two-paragraph construction. The ownership note on D2.FreeGroups (line 912) becomes a statement about what this roadmap does not prove, with no section named.

## R02 (P2) — OperatorKTheory and OperatorTheory cite each other

Location: `README.md` line 56 ("[OperatorTheory] supplies Hilbert spectral theory and compact operators") and lines 683–685 ("P_Hardy is ToeplitzOperators T1's projection onto nonnegative Fourier modes, transported through its normalized AddCircle/Circle Haar comparison").

Claim: the Hardy projection of ToeplitzOperators T1 is an input to the K6 index-pairing compatibility theorem `⟨[z],[2P_Hardy−1]⟩ = −1`.

Witness: on main, `TauCetiRoadmap/OperatorTheory/README.md` line 83 lists `OperatorKTheory K4` in the supplier row of its `ToeplitzOperators` sub-roadmap, and `TauCetiRoadmap/OperatorTheory/ToeplitzOperators/README.md` lines 27–28 say "OperatorKTheory K4 owns the Calkin/Atkinson comparison and compact-perturbation theorem". OperatorTheory is at position 251 of the merge order; this roadmap is placed after its last supplier, so the OperatorTheory edge is downward from here, but the two roadmaps now cite each other, which the principles forbid. The mechanical check does not see it because this roadmap is not in the order yet.

Repair: remove the T1 dependency. State the odd-pairing witness on `lp (fun _ : ℕ => ℂ) 2` directly: P is the projection of `ℓ²(ℤ)` onto `ℓ²(ℕ)`, u is the bilateral shift, `PuP` is the unilateral shift of CStarAlgebras C8 (already this roadmap's supplier for the Toeplitz extension, line 303), and `⟨[z],[2P−1]⟩ = index(PuP) = 0 − 1 = −1`. The transport to the Hardy model then belongs to ToeplitzOperators, which already proves "the forward shift T_z has Fredholm index −1" (its README line 22) and consumes K4.

## R03 (P2) — A statable headline theorem is absent from `Suggested.lean`

Location: `TauCetiRoadmap/OperatorKTheory/Suggested.lean` (whole file); README lines 1169–1183 (Brown–Douglas–Fillmore classification).

Claim: `Suggested.lean` states the roadmap's headline theorems that are statable at the pins.

Witness: the BDF classification (README lines 1169–1183) is statable on native carriers: for `T : H →L[ℂ] H` with `[CompleteSpace H]`, essential normality is `IsCompactOperator (adjoint T * T - T * adjoint T)`, the essential spectrum is `{λ | ¬ (T - algebraMap ℂ _ λ).IsFredholm}` (Mathlib `ContinuousLinearMap.IsFredholm`, `Mathlib/Analysis/Normed/Operator/Fredholm/Basic.lean` line 123), the index is `ContinuousLinearMap.index` (same file, line 613 uses it), and unitaries are `unitary (H →L[ℂ] H)`. Both headline statements ("T₁ is unitarily equivalent to a compact perturbation of T₂ iff the index functions agree on the complement of the common essential spectrum" and "T is normal plus compact iff the index function vanishes") need only these two simple predicates. The file instead states six API lemmas and four unused definitions.

Repair: add the two BDF statements with `sorry`, each with a docstring citing Blackadar 16.2.2 (`Blackadar1998` line 5966), with the two definitions above and the hypotheses `[CompleteSpace H] [SeparableSpace H]` and infinite dimension carried explicitly in the signature.

## R04 (P2) — The module docstring does not name the headlines that are not statable

Location: `Suggested.lean` lines 15–22.

Claim: the docstring says the file "is not exhaustive" and that "K-groups and KK cycles require the constructions specified in the README".

Witness: the brief's form requires the docstring to say which headline theorems are not statable at the pins and what each lacks. Bott periodicity (README line 247), the six-term sequence (line 282), the pullback Mayer–Vietoris sequence (line 308), Pimsner–Voiculescu (line 842), the free-group K-groups (line 902), Green–Julg (line 609), Connes–Thom (line 955), UCT and Künneth (lines 1119, 1187), the Manuilov–Thomsen sequence (line 652) and the E-theory universal property (line 1151) are all absent and none is named. Each lacks `K₀`/`K₁` of a C*-algebra (no carrier at the pins: Mathlib has `Algebra.GrothendieckAddGroup`, `Mathlib/GroupTheory/MonoidLocalization/GrothendieckGroup.lean`, but no projection monoid with block-sum addition), crossed products, or KK.

Repair: rewrite the docstring in the required form ("Operator K-theory: target signatures", the README is the roadmap, this file is not), listing each unstatable headline with the missing carrier, and delete the sentence about "suggested forms".

## R05 (P3) — "Pullback Mayer–Vietoris" has no locator, and the nearest cited source assumes both legs surjective

Location: `README.md` lines 308–334.

Claim: exactness of the six-term pullback sequence when at least one leg is surjective.

Witness: no locator at the claim; the Sources list cites Blackadar §§5–9 and 19.9 only. Blackadar Theorem 21.2.2 (`Blackadar1998` lines 9541–9552) assumes both `f₁` and `f₂` surjective and remarks (line 9578) that Schochet 1984a, 4.5 removes the hypothesis. The one-leg statement is true: with π₁ surjective, D → A₂ is surjective (lift π₂(a₂) through π₁) with kernel J = ker π₁, and the sequence is the diagram chase of the two six-term sequences; the Milnor-patching element checks out (`π₁(XeX⁻¹) = diag(u,u⁻¹) e diag(u⁻¹,u) = e = π₂(e)`, and `[XeX⁻¹]−[e]` maps under `j ↦ (j,0)` plus the unit `(e,e)` to `[(XeX⁻¹,e)]−[(e,e)]`).

Repair: add a locator at the claim (Blackadar 21.2.2 with the remark on Schochet 1984a Theorem 4.5, or Schochet directly, recorded in `sources.toml`), and say in one clause that the one-surjective-leg case is proved from the two extensions `0→J→D→A₂→0` and `0→J→A₁→Q→0`.

## R06 (P3) — Five commit-pinned repository links (gate: `blob`)

Location: `README.md` lines 29, 36, 40, 48, 58.

Claim: supplier links to CStarAlgebras, HilbertModules, OperatorAlgebraDynamics, TopologicalKTheory and PseudodifferentialOperators pinned to commits.

Witness: the gate rule forbids `github.com/<repo>/blob/<sha>` links. The pins are also stale: CStarAlgebras is pinned at `2a35ac0` while its open head is `1d4e2ed`; HilbertModules at `0cd2929` while its head is `6e91366`; OperatorAlgebraDynamics and TopologicalKTheory are on main and should be cited as `../<Name>/README.md`.

Repair: replace each by the roadmap name and section (relative link for roadmaps on main, bare name and section for roadmaps still in pull requests).

## R07 (P3) — Imports (gate: `imports`, `mathlib-subimports`, `no-import-mathlib`)

Location: `Suggested.lean` lines 5–13.

Claim: eight `import Mathlib.<submodule>` lines and no `import Mathlib`.

Witness: gate rule: the single line `import Mathlib` followed only by the `TauCeti.*` modules used. The file elaborates in 3 s with the olean cache, so `import Mathlib` costs nothing here.

Repair: header `import Mathlib` then `import TauCeti.CategoryTheory.GrothendieckGroup.Split`.

## R08 (P3) — Lean form: namespace, unused definitions, a setoid proof routed through a sorried theorem

Location: `Suggested.lean` line 27 (`namespace OperatorKTheory`), lines 120–166 and 168–209.

Claim: the file is in the required form.

Witness: the namespace must be `TauCetiRoadmap.OperatorKTheory`. `StableProjection`, `stableProjectionSetoid`, `ProjectionMonoid`, `BusbyPullback`, `BusbyPullback.mul`, `moduleCompacts` and `KasparovCycle` are not mentioned by any theorem; definitions are allowed only to make a headline statable. `stableProjectionSetoid` (line 127) discharges transitivity with the sorried `MatrixProjectionEquivalent.trans`, so a `def` depends on `sorry`. `ProjectionMonoid` (line 149) is a bare `Quotient` with no `AddCommMonoid` instance, so the docstring's "block sum gives its monoid structure" is not in the file. In `KasparovCycle`, `operator_module` (line 198) is redundant: `operator_adjoint` already forces `Bᵐᵒᵖ`-linearity, as it does for `grading` and `representation a`, which carry no linearity field.

Repair: rename the namespace; delete the seven definitions (the README keeps them as K1, K4 and K5 targets); if a projection-monoid definition is kept to make a K₀ headline statable, give the `AddCommMonoid` instance a real body or keep the whole construction in the README.

## R09 (P3) — API lemmas stated as if headlines

Location: `Suggested.lean` lines 39–46 (`MatrixProjectionEquivalent.trans`), 58–61 (`projection_path_equivalent`), 68–72 (`isFredholm_iff_inverse_modulo_compacts`), 99–102 (`AsymptoticMorphism.eventually_norm_le`).

Claim: these are acceptance-test statements.

Witness: one-tactic probe (copy of the file with each `sorry` replaced by `first | rfl | simp | infer_instance | simp_all | exact isFredholm_iff_exists_isQuasiInverse | …`): none closes, so none is trivial, but all four are API lemmas of K1, K4 and K9, not end theorems. For Atkinson, the forward direction is Mathlib's `ContinuousLinearMap.isFredholm_iff_exists_isQuasiInverse` (`Fredholm/Basic.lean` line 368; a quasi-inverse differs from an inverse by finite rank, hence compact), and the converse follows from Tau Ceti `isFredholm_one_sub` (`TauCeti/Analysis/Fredholm/CompactPerturbation.lean` line 65) with `IsFredholm.comp_iff_left`/`comp_iff_right` (`Fredholm/Basic.lean` lines 550, 557). `close_projections_unitarily_conjugate` (line 52) and the Bartle–Graves theorem (line 113) are genuine theorems but neither names an object of this roadmap.

Repair: delete the four API lemmas from `Suggested.lean` (the README keeps them as targets) and cite the two library routes above in the K4 supplier contract; keep Bartle–Graves only if the author regards it as a deliverable of K9 (it is a classical selection theorem, Messerschmidt2016 Theorem 5.1, line 677).

## R10 (P3) — README shape: no Checks, no `*Needs:*` lines, no layer dependencies, no locators at claims

Location: `README.md` whole file.

Claim: the README is in TauCetiRoadmap form.

Witness: counts over the file: `**Checks.**` 0, `*Needs:*` 0, `### Dependencies`/`### Examples` 0, `**Summary.**` 0, `## Layer` 0. The headings are `## K1`–`## K9` plus "Scope, conventions, and dependencies" and "Sources and implementation interfaces"; there is no `## Exact supplier contracts`, no `## How to read the build`, no `## Downstream consumers`. Every definition (V(A), K₀, K₁, the Bott map, graded Fredholm pairs, Busby sums, Kasparov cycles, the bootstrap class, asymptotic morphisms) lacks its API bullets and its three discriminating Checks, and theorem locators appear only in the Sources list, not at the claims (for example Green–Julg, line 609, has none; the technical theorem, line 585, has none).

Repair: restructure to the house shape (Summary; Scope and ownership; Conventions; Exact supplier contracts, including the gaps of R01; How to read the build; `## Layer k` with `### k.n` prose subsections, `*Needs:*` per target, `**Checks.**` per definition, `### Examples` and `### Dependencies` per layer; Downstream consumers; References). The computed witnesses in the adversarial table below (Bott projection, Toeplitz boundary, Clifford matrices, complete-pair example, rotation cocycle, Cuntz vacuum class) are ready-made Checks.

## R11 (P3) — Sources not recorded; one block without any source; process wording

Location: roadmap folder (no `sources.toml`); `README.md` lines 984–1017; line 1303.

Claim: every cited work is recorded; every target has a locator.

Witness: the folder holds `README.md`, `Suggested.lean`, `metadata.toml` only. "Twisted abelian centers and simplicity" (lines 984–1017) cites no source (the pull-request text mentions a Rieffel source that the Sources list does not contain). Line 1303 "including relevant open PRs" is process narrative.

Repair: add `sources.toml` with the seven cited works (Blackadar, Roe, Messerschmidt, Cuntz, Pimsner–Voiculescu, Julg, Manuilov–Thomsen; the two Journal of Operator Theory scans are image-only, so record them with their locators); cite a source for the twisted-centre block (for example Rieffel, Pacific J. Math. 93 (1981), or Packer–Raeburn, Math. Proc. Cambridge 106 (1989), Theorem 1.? for the simplicity criterion); delete the open-PRs sentence.

## R12 (P3) — Rotation-algebra K-groups narrowed to irrational θ

Location: `README.md` lines 970–973.

Claim: "The following … assertions assume irrational 0<θ<1. … Prove K₀(A_θ)=K₁(A_θ)=ℤ², with K₁ basis [u],[v]."

Witness: the PV sequence (line 842, Blackadar 10.2.1) with A = C(𝕋) gives `K₀(A_θ) ≅ K₁(A_θ) ≅ ℤ²` for every real θ, since a rotation is homotopic to the identity so `1 − α_* = 0` on both K-groups of C(𝕋); θ = 0 gives C(𝕋²) with the same groups. Only the unique-trace statement needs irrationality; the trace range `ℤ+θℤ` holds for rational θ = p/q as well, where it equals `(1/q)ℤ`.

Repair: state the K-group computation and the K₁ basis for every θ; keep "irrational" for the unique trace and for "the trace is injective on K₀".

## R13 (P3) — Identifications written against conventions of this roadmap's consumers

Location: `README.md` line 776 ("Identify n=2 with FreeProbability F3's four-regular reduced-word model") and lines 1010–1011 ("Prove the displayed abstract cocycle and gauge conventions agree with K7 and N6").

Claim: this roadmap proves agreement with F3 and N6.

Witness: FreeProbability on main consumes "OperatorKTheory K7.FreeGroups' early shared reduced-word/path/acyclicity interface" (`TauCetiRoadmap/FreeProbability/README.md` line 308), and NoncommutativeGeometry on main lists OperatorKTheory K1–K7 as a supplier (`TauCetiRoadmap/NoncommutativeGeometry/README.md` line 57). An identification proved here against their objects is a reverse edge.

Repair: phrase both as what this roadmap exports (the `SimpleGraph.mulCayley` tree interface on positive generators; the cocycle `c((m,n),(m′,n′)) = exp(2πiθ n m′)` with gauge action `α_χ(W_y) = χ(y)W_y`) and leave the identification to F3 and N6.

## Verified sound

**Gate and direction.** Gate output: `set_option=0 blob=5 … imports=1 mathlib-subimports=8 no-import-mathlib=1 … depcheck=1 … build=0 FAIL`. Dependency check run by me:

```
NOT IN ORDER: OperatorKTheory (insert it after its last supplier)
depcheck: 155 roadmaps, 1063 edges, 1 problem(s)
```

No UPWARD or CYCLE line. Suppliers in the merge order: OperatorAlgebraDynamics (246), OperatorTheory (251); the others are on main (BanachAlgebras, GrothendieckEulerForms, TopologicalKTheory, NoncommutativeGeometry, FreeProbability) or open pull requests adding new folders (CStarAlgebras #860, HilbertModules #861, AlgebraicKTheory #1142, FactorRigidity #876, VonNeumannAlgebras #1041, PseudodifferentialOperators #952, CStarClassification #863). The mutual citation with OperatorTheory (R02) is the only two-way edge found; none of the open-pull-request suppliers mentions OperatorKTheory except as a downstream owner.

**Elaboration.** `lake env lean` on `Suggested.lean`: six `declaration uses 'sorry'` warnings (lines 39, 52, 58, 68, 99, 113), nothing else, 3 s. A scratch file with `#check @name` for all fifteen declarations elaborated; each type agrees with its README statement (unital `B` for the close-projections theorem is the unitization case of README line 93; `AsymptoticMorphism` carries no separability, which the README's K9 assumes but the definition does not need). Nothing changed as a result.

**One-tactic probe.** Each of the six sorried theorems with `first | rfl | simp | infer_instance | simp_all | exact isFredholm_iff_exists_isQuasiInverse | exact ⟨_, rfl⟩ | exact fun _ => rfl`: six errors, none closes.

**Library declarations opened at the pins** (Mathlib 6b7abb3c, Tau Ceti a91d3aaf): `ContinuousLinearMap.IsFredholm` (Fredholm/Basic.lean:123), `isFredholm_tfae`/`isFredholm_iff_exists_isQuasiInverse` (343, 368; quasi-inverse means modulo finite rank, `Mathlib/Algebra/Module/LinearMap/FiniteRange.lean:328`), `FredholmPackage` (178), `IsFredholm.comp_iff_left/right` (550, 557), `index_continuousOn_isFredholm` (Fredholm/Open.lean:104); `Unitary.mem_pathComponentOne_iff` (CStarAlgebra/Unitary/Connected.lean:336: identity path component = finite products of `expUnitary`, as README line 161 says); `IsStarProjection` lemmas (CStarAlgebra/Projection.lean: no unitary-equivalence theorem, so the close-projections statement is not a duplicate); `CStarMatrix.conjTranspose` (CStarMatrix.lean:100); `CStarModule` (Module/Defs.lean:72); `Algebra.GrothendieckAddGroup` (MonoidLocalization/GrothendieckGroup.lean, via `to_additive`; `of` injective only for cancellative monoids, line 40, consistent with README line 106 "Do not assume cancellation in V(A)"); `ContinuousLinearMap.NonlinearRightInverse` (Normed/Operator/Banach.lean:37, no continuity field, as README line 1225 says); `SimpleGraph.mulCayley` (Combinatorics/SimpleGraph/Cayley.lean:36, `fromRel (∃ g ∈ s, a * g = b)`: edges `g — g·g_i`, so left translation preserves them, README line 780); `FreeGroup.toWord`, `SimpleGraph.IsTree`, `LocallyConvexSpace`, `IsTopologicalAddGroup`, `ContinuousStar`, `MetrizableSpace`, `CategoryTheory.Tor`, `LocallyConstant.freeOfProfinite` (Profinite/Nobeling/Induction.lean:153), `ShortComplex.ShortExact.extClass` (DerivedCategory/Ext/ExtClass.lean:78): all present. Tau Ceti: `TauCeti.SplitK0` (CategoryTheory/GrothendieckGroup/Split.lean:114), `isFredholm_one_sub`, `index` compact-perturbation invariance (Analysis/Fredholm/CompactPerturbation.lean:65, 139), continuous families (Analysis/Fredholm/ContinuousFamily.lean); no C*-algebra K-theory, Calkin algebra, asymptotic morphism or Bartle–Graves anywhere in Tau Ceti.

**Cross-roadmap citations resolved** (29): CStarAlgebras C1–C2, C5 (inductive limits line 605, mapping cone 622), C6–C8, C8 Toeplitz extension (829) and Voiculescu's Weyl–von Neumann (806) at head 1d4e2ed; HilbertModules H1 standard module (131), H2 `K_A(H_A)≅K⊗A` and `L_A(E)≅M(K_A(E))` (172–175), polar decomposition (202–211), H3 Morita, H4 Kasparov stabilization (302), H5 analytic section-module comparison (380–384), H6 bounded transform (582), H7 localization, at head 6e91366; OperatorAlgebraDynamics D1 (full crossed products, `ℂ⋊G≃C*(G)` line 64), D2 (regular representations, reduced products, regular quotient 98), D4 Takai (264), D6 Cuntz `O_n` (457) on main; TopologicalKTheory T1–T7 on main, with `β=[L]−1`, `L` tautological `O(−1)`, `s₀=(z,1)` (148–150) and "Koszul symbol is conjugate z, so its compact-support class is −β" (159), agreeing with README lines 72–82; BanachAlgebras A1 renorming `‖1‖_*=1` (131–132), A2 holomorphic calculus (161); AlgebraicKTheory A1–A2, A6 Milnor patching, A8 topological comparison at head of #1142; NoncommutativeGeometry N2, N6; FreeProbability F3; FactorRigidity R4 Haagerup; VonNeumannAlgebras V11 Pontryagin duality (#1041, line 2121); CStarClassification CL8 mapping telescope (654); GrothendieckEulerForms Layers 1–2; PseudodifferentialOperators P6 (ellipticity, parametrices); OperatorTheory/ToeplitzOperators T1 (R02). Not found on main: Dynamics D1.CentralTwists, D2.CentralTwists, D2.FreeGroups, right-coset embeddings (R01). The brief's sibling list gave HilbertModules at a second path whose checkout has no HilbertModules folder; #861 is the only HilbertModules head.

**Ownership.** By object: Calkin/Atkinson (OperatorTheory main line 68 and ToeplitzOperators line 28 assign them to K4; IndexTheory #1077 consumes K4), Bott maps (HilbertModules head line 384 assigns them here and to TopologicalKTheory; TopologicalKTheory T4 owns the geometric statement, cited), K/KK (CStarAlgebras head line 63 assigns them here), PV and Connes–Thom (Dynamics main line 70 assigns them to operator K-theory), asymptotic morphisms and E-theory (CStarClassification head lines 523, 565 consume K9), rotation algebra (NoncommutativeGeometry main line 477 consumes K7's), free-group tree interface (FreeProbability main line 308 consumes K7). No second owner found among main, the board packages index, or the sibling checkouts. Open pull requests not in the brief's list (for example a ToeplitzOperators pull request surfaced by the grep tool) were not checked for ownership.

**Sources read at their locators.** Blackadar (author page): 9.1.1 Bott map `f_e f_{p_n}⁻¹` (line 2996), 9.2.1, 9.3.1–9.3.2 exponential map `[exp(2πix)]` (3154–3174), 10.2.1 PV with `1−α_*` (3370), 10.2.2, 12.4.2 technical theorem with "Δ derives A₁" (4721), 14.6.1, 15.7.1 invertibility iff CP contractive lift, unital version with non-unital lift (5662–5667), 16.2.1–16.2.2 BDF with `∏ℤ` (5956–5969), 18.4.3, 18.6.1, 19.3.6, 19.5.7 (semisplit, σ-unital/separable), 19.7.1 countable additivity, 20.2.7 Green–Julg, 21.2.2 (R05), 22.3.4 bootstrap class (N1–N4), 23.1.1 UCT (Ext of degree 1), 23.1.3 KTP (A ∈ N, B arbitrary), 23.5.1 geometric resolution, 25.1.1 asymptotic morphism (no boundedness in the definition). Julg2013 (arXiv): F (111–113, `F*F=1−p₀`, `FF*=1`), T_t (60), Theorem 2 unitary `T_t⁻¹π₀(g)T_t` (89), limit `F*π₁(g)F+p₀` (129), Corollary 3 γ = 1 (150). ManuilovThomsen2005 (arXiv): hypotheses A, B separable, A unital, B stable (8, 13), complete pair `V₁V₁*+V₂V₂*=1` (19), Theorem 3 cycle (257–266) matches README lines 655–658 with `Ext⁻¹(A,B)=KK(A,SB)` (37). Roe2017 (author page): Lecture 19 Lemma 19.1 and Lecture 20 use winding number −1 (3463, 3839), matching README line 958. Messerschmidt2016 (arXiv): Theorem 5.1 continuous positively homogeneous right inverse (677–679).

**Adversarial table.** Values computed on each side.

| Statement (README line) | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Bott projection `p(z)` (77–78) | z arbitrary, z=0, z→∞ | `M=[[r,z],[z̄,1]]`, `M²=(1+r)M` so `p²=p`, `tr p=1`, `p(0)=diag(0,1)`, `p(∞)=diag(1,0)`, range of `p(z)` = line through `(z,1)` | projection of rank 1, range = tautological `O(−1)` of TopK T4 line 148 | none |
| `β` sign vs TopologicalKTheory (81–82) | Koszul symbol | TopK line 159: Koszul symbol `z̄` has class `−β` | agrees | none |
| Bott loop `f_e` (238–244) | e projection | `exp(2πit e)=1+(e^{2πit}−1)e=f_e(t)`; `f_e(0)=f_e(1)=1` | matches Blackadar 9.1.1 | none |
| Homotopy `H(r,s)` (262–267) | r=0, r=1, s=0, s=1, scalar part | r=0: `exp(2πi[se+(1−s)p])=exp(2πix(s))`; r=1: `exp(2πise)exp(2πi(1−s)p)=f_e(s)f_p(s)⁻¹` since `exp(2πip)=1`; s=0: `exp(2πi(1−r)p)exp(2πirp)=1`; s=1: `exp(2πie)=1`; scalar part `exp(2πip[s+(1−r)(1−s)+r(1−s)])=1` | all four identities hold without `ep=pe` | none |
| Toeplitz boundary (303–305) | lift v = unilateral shift S | `δ₁[z]=[1−S*S]−[1−SS*]=0−[p₀]=−1`; `index S=dim ker−dim coker=0−1=−1` | consistent with K4's index convention | none |
| Odd index pairing (679–686) | P = Hardy, u = z | `PuP` = unilateral shift, index −1 | `⟨[z],[2P−1]⟩=−1` as claimed; supplier is the issue (R02) | R02 |
| Pullback MV (308–334) | A₂=0; Q=0; Milnor element | A₂=0: D=J, sequence = six-term of `0→J→A₁→Q→0`, ∂=δ; Q=0: D=A₁×A₂, ∂=0, `K(D)=K(A₁)⊕K(A₂)`; `π₁(XeX⁻¹)=e=π₂(e)`; `j↦(j,0)` on `[XeX⁻¹]−[e]` plus unit `(e,e)` gives `[(XeX⁻¹,e)]−[(e,e)]` | exact in both degenerate cases; patching formula correct | R05 (locator) |
| Cl₂ matrices (493–494, 500–506) | e₁, e₂ | `e₁²=1`, `e₂²=[[i·(−i),0],[0,(−i)i]]=1`, `e₁e₂=diag(−i,i)=−e₂e₁`, both odd for `diag(1,−1)`; `(2,1)` block of `se₂+te₁` is `t−is=−iz`; unswapped gives `s−it=z̄` | winding +1 vs −1 as stated | none |
| Period-reduction sign coherence (309–311) | p,q,r ∈ {0,1} | `pq+(p+q)r ≡ qr+p(q+r)` mod 2 (both = pq+pr+qr) | coherent | none |
| Connes–Thom normalisation (955–958) | `u(x)=(x+i)/(x−i)` | `arg u=2arg(x+i)`: 2π → 0 as x: −∞→+∞, winding −1; Cayley `(x−i)/(x+i)`: −2π → 0, winding +1 | matches Roe 19.1 (−1) and K5 (+1) | none |
| Complete pair (424–451) | even/odd; `e_n↦e_{3n},e_{3n+1}`; B=0 | `S₀S₀*+S₁S₁*=1`; triple pair sum `1−R`, R onto `{e_{3n+2}}`, rank ∞; `U=t₀s₀*+t₁s₁*`: `U*U=Σs_is_i*=1`, `UU*=Σt_it_i*=1`, `Us_i=t_i`; B=0: `H_B=0`, `0=1_{L(0)}` | correct, including the negative control | none |
| Technical theorem (584–597) | hypotheses vs 12.4.2 | Blackadar: J, A₁, A₂ σ-unital, Δ separable, `A₁A₂⊆J`, Δ derives A₁; conclusion `M+N=1`, `MA₁⊆J`, `NA₂⊆J`, `[M,Δ]⊆J` | identical | none |
| Manuilov–Thomsen cycle (651–673) | A=M_n, J=K; X compact nonempty | unit evaluation `KK₀(M_n,K)≅ℤ→K₀(K)=ℤ` is ×n, image in `KK₁` is 0, so `U(M_n,K)=ℤ/n`; X: evaluation class pairs to 1 so unit evaluation onto, `K₁(K)=0`, so `U(C(X),K)≅KK₁(C(X),K)` | both examples follow from exactness | none |
| Julg–Valette cycle (783–812) | F, defect of g | `v↦e(v)` bijection `V∖{1}→E` so `F*F=1−p₁`, `FF*=1`; `(Fλ(g)−π(g)F)δ_v=±δ_{e(gv)}∓δ_{g·e(v)}`, zero unless `gv∈[1,g]` i.e. `v∈[g⁻¹,1]`, values in edges of `[1,g]` | finite rank with the stated supports | none |
| Γ_n (845–848) | w=1, `g_i⁻¹`, `g_n^k`, `g_n⁻¹` | `g_i·1=g_i∈Γ_n`, `g_ig_i⁻¹=1`; `g_n·1=g_n`, `g_ng_n^k=g_n^{k+1}`; `g_nw=1` iff `w=g_n⁻¹∉Γ_n`; `g_n⁻¹g_n^k=g_n^{k−1}` | `g_iΓ_n=Γ_n`, `g_nΓ_n=Γ_n∖{1}` | none |
| Covariance direction (888–889) | `(u_gξ)(h)=t_gξ(g⁻¹h)` | `u_gρ(a)u_g*=ρ(α_g(a))` so `u_g*ρ(a)u_g=ρ(α_{g⁻¹}(a))`; `S_n=u_{g_n}` restricted | `S_n*ρ(a)S_n=ρ(α_{g_n⁻¹}(a))` | none |
| Free-group K-groups (895–905) | A=ℂ, n=0,1,2 | `δ₁[u_n]=[1−S_n*S_n]−[1−S_nS_n*]=−[P₁]=−[1]`; `1−α_*=0` so `K₀(B_n)≅K₀(B_{n−1})=ℤ`, `0→K₁(B_{n−1})→K₁(B_n)→ℤ→0`, `K₁=ℤ^n`; n=0: (ℤ,0), n=1: C(𝕋): (ℤ,ℤ) | matches `ι→₀ℤ` for \|ι\|=0,1 | none |
| PV ℤ convention (942–958) | `UaU*=α(a)` | `(1−(α⁻¹)_*)∘(−α_*)=−α_*+1=1−α_*` | agrees with Blackadar 10.2.1 display | none |
| Rotation cocycle (965, 1008–1009) | `uv=λvu`, `λ=e^{2πiθ}` | `v^mu^nv^{m′}u^{n′}=λ^{nm′}v^{m+m′}u^{n+n′}`, `c=exp(2πiθnm′)`; `ρ(x,y)=exp(2πiθ(nm′−n′m))`; `C_ρ={0}` (θ irrational), `qℤ²` (θ=p/q), `ℤ²` (θ=0) | all three cases as stated | none |
| Twisted centre (984–1007) | d=0; trivial c; `Ad(W_x)` | `W_xW_yW_x*=ρ(x,y)W_y=α_{κ_x}(W_y)`; `Q(W_y)=∫κ(y)=W_y` iff `y∈H_ρ^⊥=C_ρ`; d=0: `C*(0,c)=ℂ`, `C_ρ=0`, `H_ρ=L̂={1}`, simple; trivial c, d≥1: `C_ρ=L`, `C(𝕋^d)` nonsimple | criterion holds in both degenerate cases | R01 (supplier), R11 (locator) |
| Rotation K-groups (970–973) | θ rational | PV with `α_*=id` on `K_*(C(𝕋))` gives ℤ² for all θ | true more generally than stated | R12 |
| Cuntz–Toeplitz (1018–1034) | n=1,2 | vacuum `1−Σs_is_i*`, `[s_is_i*]=[1]`, class `(1−n)[1]`; n=2: `K₀(O₂)=ℤ/1=0`; n=1: ℤ/0=ℤ = `K₀(C(𝕋))` | consistent | none |
| Mapping torus boundary (1044–1048) | lift `x(t)=(1−t)p+tα(p)` | `x(1)=α(p)=α(x(0))` so `x∈M_α`; homotopy of row 4 with `e↦α(p)` gives `[exp(2πix)]=b_A(α_*[p]−[p])` | `b_A∘(α_*−1)` | none |
| BDF and UCT for planar X (1150–1183) | X with k bounded holes | `K₁(C(X))=⊕_kℤ`, `K₀(C(X))=C(X,ℤ)` free so `Ext¹=0`; `KK₁(C(X),ℂ)=Hom(⊕ℤ,ℤ)=∏ℤ` | equals Blackadar 16.2.1's `∏ℤ` | R03 (statable, absent) |
| UCT, KTP degrees (1119–1122, 1187–1190) | i, j mod 2 | Ext in degree i from `K_j(A)`, `K_{j+i+1}(B)`; Tor in `K_i` from `j+k=i+1` | match 23.1.1, 23.1.3 (A∈N, B arbitrary) | none |
| Asymptotic contractivity (1210; Lean line 99) | unbounded `‖φ_t(a)‖` | a=a*, ‖a‖≤1, `a−a²=w²`: `φ_t(a)≈φ_t(a)²+φ_t(w)²`; self-adjoint part `h_t` with spectral value ±M_t gives `λ−λ²≈−M_t²` ≪ `−Cε_tM_t`, so M_t bounded and `limsup‖φ_t(a)‖≤‖a‖` | true without a boundedness field, as Blackadar 25.1.1 | none |
| `C₀(ℝ²)` has no matrix projections (278–279) | p ∈ M_n(C₀(ℝ²)) | rank locally constant on connected ℝ², rank 0 at ∞, so p=0 | holds | none |
| Trace pairing (133–137) | `[e]−[p_n]` | `τ⁺_n(p_n)=n`, value `τ⁺_n(e)−n`; K(H): no tracial state, rank-one generator used instead | consistent | none |
| `GL_n(B)_0=⋃O_n^k` (205–216) | subgroup H generated by O_n | H open ⇒ closed ⇒ ⊇ component; `t↦exp(t log g)` puts O_n in the path component | equality | none |
| Lean `MatrixProjectionEquivalent.trans` (39–46) | v*v=p, w*w=q | `(wv)*(wv)=v*qv=v*(vv*)v=p²=p` needs p idempotent | hypotheses `IsStarProjection` needed and present | none |
| Lean `close_projections…` (52–55) | B unital | README states it for the unitization; unital B covers it by applying to A⁺ | generality agrees | none |
| Lean `exists_continuous_nonlinearRightInverse` (113–117) | r=0, y=0 | positive homogeneity at r=0 gives `s 0 = 0`; norm bound from continuity at 0 | matches Messerschmidt 5.1 plus README line 1224 | none |

## Not verifiable

- `PimsnerVoiculescu1982` (J. Operator Theory 8, 1982, Lemmas 1.1–1.3, §2, Theorem 3.1, Corollary 3.2), fetched from the journal's open archive as an image-only scan: no OCR on this worker and no PDF renderer, so the locators were not read. The mathematics of the selected-generator Toeplitz extension and of the canonical K-groups was checked independently (table rows Γ_n, covariance direction, free-group K-groups).
- `Cuntz1981` (J. Operator Theory 5, 1981, Theorem 1.5, §2.4, pp. 105–107): same image-only scan; the Cuntz–Toeplitz computation was checked independently (table row Cuntz–Toeplitz).
- "Twisted abelian centers and simplicity" (README lines 984–1017): no source cited (R11); the mathematics was checked independently (table rows rotation cocycle, twisted centre).
- Open pull requests the brief did not list with files (a ToeplitzOperators pull request surfaced by the grep tool): ownership against them was not checked.

## Source issues

- **Gap** in Julg2013 at §5, p. 4: the source says the KK_G class is independent of t because the unitaries ρ̃_t(g) are strongly continuous in t; it should be that the compact differences ρ̃_t(g) − π₀(g) are norm-continuous in t, which is what a cycle over C([0,1]) needs; affects the proof.
