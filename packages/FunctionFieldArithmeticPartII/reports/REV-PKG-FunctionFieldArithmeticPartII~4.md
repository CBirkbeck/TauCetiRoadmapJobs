<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1232#issuecomment-6403244985 -->
Review (claude) of 5a6bc6d

Verdict: accepted
Conditional on the announced gaps: `finite-diagonalizable-coarse`, `invertible-section-coordinates`, `completed-lattice-root-dictionary`, `quadratic-root-residue-character`, `coherent-site-universe-lifts`, `invertible-sheaf-universe-lifts`, `normal-proper-hyperplane-covers`

1. **F01** (P3) Seven Layer 7 `*Needs:*` lines cite a Layer 8 target (coarse Layer 7 ↔ 8 cycle)

   **Location.** packages/FunctionFieldArithmeticPartII/README.md, §7.3 line 12918: "*Needs:* EtaleCohomologyFoundations §§F.0.2; F.0.A1–F.0.A2 and F.3a; the scheme projective-space target in Layer 8; …"; the same item in §7.4 (line 12934), §7.7 (13020), §7.11 (13120), §7.16 (13200), §7.18 (13235), §7.22 (13304).

   **Claim.** Each of these Layer 7 targets needs the unnumbered Layer 8 target "The scheme projective-space input".

   **Witness.** Layer 8's `### Dependencies` (line 13753) reads "Layers 4–5 and 7; … the scheme projective-space target of this layer", so Layer 8 consumes Layer 7 while seven Layer 7 targets consume Layer 8: a layer-level cycle. None of the seven routes uses projective-space simple connectivity: §7.3's route (lines 12909–12912) uses IG.5.7, §7.26, Abhyankar's lemma (0EYG), 0H2W and Noohi 7.11 only; §7.4, §7.7, §7.11, §7.16, §7.18 and §7.22 mention "projective" only in the standing hypothesis "X/k is smooth, projective". The fine-grained graph of §-numbered edges (1,824 edges over 816 targets) is acyclic, so the cycle lives only in these seven items.

   **Exact repair.** Delete the item "the scheme projective-space target in Layer 8" from the seven Layer 7 `*Needs:*` lines (it stays in the five Layer 8 lines §§8.2, 8.8, 8.10, 8.11, 8.12, whose routes use it). While there, give the Layer 8 input a number (`### 8.0 The scheme projective-space input`) so that it has the `### k.n` shape every other target has. Tested: after the deletion no Layer 7 target cites Layer 8, and Layer 8's dependency on Layer 7 is one-directional.

2. **F02** (P3) Six Layer 1 targets need Layer 3 and Layer 2 targets (coarse Layer 1 ↔ 3 and 1 ↔ 2 cycles)

   **Location.** README §1.35 line 789: "*Needs:* §3.30 (the root-point action groupoid); §3.33 (the point satisfies the chart root equation); …"; §1.58 line 1162 and §1.87 line 1659 need §3.31; §1.106 line 2004 needs §3.49; §1.225 line 3966 needs §3.30; §1.240 line 4191 needs §2.4 (fpqc descent of finite root data).

   **Claim.** The build is in layer order ("How to read the build", line 107, concedes that "Supporting finite-coordinate algebra in Layer 3 can be read with Layer 1").

   **Witness.** Layer 3's `### Dependencies` (line 11787) consumes "Layers 1–2 finite roots and coordinate comparisons", and Layer 2's consumes "Layer 1 coordinates", so both pairs are coarse cycles. The consumed targets are self-contained: §§3.30, 3.31, 3.33 need only §3.10 (algebra-valued finite root points), §3.49 needs §3.31, and §2.4 needs SchemeAndStackFoundations §1.1 and §2.1, which needs only suppliers; the fine-grained graph is acyclic.

   **Exact repair.** Move §3.10, §3.30, §3.31, §3.33 and §3.49 to the end of Layer 1 (as §§1.241–1.245, renumbering their citations: 19 citing sites), and move §2.1 and §2.4 ahead of §1.240 or, equivalently, move §1.240 to Layer 2 as its first target (its route is stackification over the fpqc descent of §2.4). Then delete the concession sentence at line 107. Tested: with those moves every `*Needs:*` edge points to an earlier layer or to an earlier target of the same layer, and no `### Dependencies` paragraph changes except that Layer 1 no longer needs "Layer 3".

3. **F03** (P3) About sixty `*Needs:*` items are Lean names with their camel-case split into words and no backticks

   **Location.** README §7.5 line 12960: "*Needs:* … alternating Map Linear Equiv; map; alternatization; coe alternatization; lift; tprod; RepresentationTheory/SchurWeyl; Layer 8."; §1.235 line (item) "zariski Precoverage le fppf Precoverage; affine Cover; of Is Invertible"; §3.13 line 4869 "Faithfully Flat; flat and surjective iff faithfully Flat of is Affine"; §7.2 "is Idempotent Complete iff idempotents have kernels; average Map; is Proj average Map; range norm eq invariants"; §9.6 "exists le degree add nsmul of Point; degree of Point"; §6.4–6.5 "surjective unit Group To Residue Field Units"; §2.17 line 4490 "Is Regular Ring; Is Regular Local Ring; Away"; §3.409 line 11490 "root; mk ne zero of nat Degree lt"; §10.27 "H; covariant Sequence exact"; §7.6 "ProfiniteCohomology; Layer 10; group Cohomology"; §§6.2, 6.5, 6.7 "AlgebraicCurves; Layer 12".

   **Claim.** A `*Needs:*` line lists the pinned declarations the route uses, in backticks, so that an implementer can open them.

   **Witness.** The split items are real declarations at the pins: `AlgebraicGeometry.Scheme.zariskiPrecoverage_le_fppfPrecoverage` (Mathlib/AlgebraicGeometry/Sites/Fpqc.lean:44), `AlgebraicGeometry.Flat.flat_and_surjective_iff_faithfullyFlat_of_isAffine` (Mathlib/AlgebraicGeometry/Morphisms/Flat.lean:168), `CategoryTheory.Idempotents.isIdempotentComplete_iff_idempotents_have_kernels` (Mathlib/CategoryTheory/Idempotents/Basic.lean:102), `exteriorPower.alternatingMapLinearEquiv`, `CategoryTheory.Action.stabilizerIsoEnd` (Mathlib/CategoryTheory/Action.lean:102), `AdjoinRoot.mk_ne_zero_of_natDegree_lt`, `Ext.covariantSequence_exact`, `TauCeti.…exists_le_degree_add_nsmul_ofPoint` (TauCeti/FieldTheory/FunctionField/Divisor/Basic.lean:254), `Representation.range_norm_eq_invariants` (TauCeti/RepresentationTheory/Invariants.lean), `CategoryTheory.Sheaf.additiveUnitsFunctor`, `ValuationSubring.surjective_unitGroupToResidueFieldUnits`. Three items resolve to nothing at either pin in this form: "equiv Sym add" (§5.15), "unit is Square iff" (§§6.9, 6.11), "scheme Points Mul Equiv map Value" (§5.22). The semicolon also splits "ProfiniteCohomology Layer 10", "RepresentationTheory/SchurWeyl Layer 8" and "AlgebraicCurves Layer 12" into two items, which read as this roadmap's own (nonexistent) Layers 10, 8 and 12.

   **Exact repair.** In every `*Needs:*` line write each library declaration as its exact fully qualified name in backticks (the list above gives the resolved names; resolve the three unresolved items or delete them), write "ProfiniteCohomology Layer 10", "RepresentationTheory/SchurWeyl Layer 8" and "AlgebraicCurves Layer 12" without the inner semicolon, and write the fifteen "Mathlib AdjoinRoot.eval₂_root" and seven "Mathlib MonoidAlgebra.single_pow" items as `AdjoinRoot.eval₂_root` and `MonoidAlgebra.single_pow`. Tested: the resolver's "Lean names found nowhere" stays empty, since these names exist at the pins.

4. **F04** (P3) ASCII and slug residue in Layer 10 and in three Layer 1 targets; one notation conflict with the Conventions

   **Location.** README §10.24 line 14566: "chi(inverse_uniformizer_x) for a homomorphism chi:Q to ℚ̄_ℓ^units"; line 14571 "For O(D)^natural use the signed-divisor trace formula … by root-framed-support-moving"; §10.13 line 14371 "Apply root-framed-support-moving"; §10.22 line 14536 "Rprime_T", "including2", line 14542 "trace+1 … trace2 … trace0"; §10.21 (three hits), §§10.3, 10.8–10.11, 10.25–10.29 ("Rprime" twelve times, "^units" four, "^natural" four, "eta(" once); §§1.211, 1.221, 1.232 "chi(psi(phi p))". Also §1.58, §1.87, §3.49 "an chart point"; fourteen `*Needs:*` parentheticals lowercase proper nouns ("(the graded root picard stack)", "(the family abel–jacobi fibre chart)", "(the dvr zero-section gerbe …)"). §3.427 line 11744: "banded by lim_n μ_n=Ẑ(1)".

   **Claim.** House style: mathematics in Unicode, every term the literature's or defined, targets cited by section number.

   **Witness.** "quadratic-local-values", "reciprocity-root-unit-triviality", "signed-divisor-trace" and "root-framed-support-moving" are planning slugs, not section numbers; their targets are §10.22, §10.14, §10.11 and §10.10 (titles at lines 14532, 14380, 14319, 14302). Conventions line 17 defines the band as "the affine group scheme D(ℚ/ℤ)=lim μ_n, including its infinitesimal points"; over a residue field of characteristic p, μ_p is infinitesimal, so lim μ_n is not the profinite étale group Ẑ(1), which §3.427 equates it with.

   **Exact repair.** Replace the four slugs by "§10.22", "§10.14", "§10.11" and "§10.10"; write π_x⁻¹, ℚ̄_ℓ^×, O(D)^♮, R′_T, χ, η, "ℓ=2", "trace +1", "trace 2", "trace 0" and χ(ψ(φ p)); "a chart point"; capitalise Picard, Abel–Jacobi, DVR and Kummer in the parentheticals; in §3.427 write "banded by D_k(ℚ/ℤ)=lim μ_n (whose étale points away from p form Ẑ(1))". Tested: the end-theorem signs of §§10.20 and 10.22 are unchanged (split +1, inert −1) and η(π_x⁻¹)=η(π_x) for the quadratic η.

5. **F05** (P3) A truncated boilerplate sentence in fourteen Layer 1 targets; a dangling clause in §7.5

   **Location.** README §1.130 line 2405 (and identically §§1.19, 1.40, 1.65, 1.66, 1.88, 1.108–1.111, 1.131–1.133, 1.150): "No cancellation of the root section is used.  sheaf RootObject comparison, local line-frame existence, stackification, effective descent and infinite genuine 2-limits are constructed in the indicated layers." §7.5 line 12938 ends "These maps are imports, not new constructions in Layer 7;".

   **Claim.** The hypothesis paragraph is prose.

   **Witness.** The second sentence has lost its subject (compare §1.17 line 464, "Existence of a line-bundle frame and its sheaf comparison, scheme-cover packaging, … are constructed in the indicated layers"); §7.5's clause lost its second half when the private-signature wording was deleted in round 4.

   **Exact repair.** At the fourteen sites write "Existence of a line-bundle frame and its sheaf RootObject comparison, local line-frame existence, stackification, effective descent and infinite genuine 2-limits are constructed in the indicated layers."; in §7.5 end the sentence at "Layer 7." Tested: no mathematical content changes.

6. **F06** (P3) §3.86 has one discriminating Check of three

   **Location.** README §3.86 lines 6158–6162: "The image of the index-2 root is the cube of the index-6 root. / Over ℤ/4Z, the index-3 insertion preserves every coefficient, for arbitrary parameter f. / The identity transition at any positive index leaves its insertion unchanged."

   **Claim.** Each definition has at least three discriminating Checks.

   **Witness.** The second Check holds for every A-algebra homomorphism out of B_3 (coefficient preservation is the algebra-map law), and the third restates the directed-system identity equation of §3.65; neither rejects a wrong model of κ_n. Only v_2=v_6³ computes something (true: the transition B_2→B_6 sends t_2 to t_6³).

   **Exact repair.** Replace the second and third Checks by: "Over A=𝔽₂ with f=0, κ_2(t_2) is nonzero with square zero; a construction inserting the reduced charts would send it to 0." and "Over A=ℤ with f=2, 1+v_2+v_3 is represented at stage 6 by 1+t_6³+t_6², whose power-basis coordinates (1,0,1,1,0,0) are unchanged by every later insertion; the identity map B_6→B_6 is not a reindexing." Tested: in ℤ[T]/(T⁶−2) the classes T² and T³ are distinct basis elements, and in 𝔽₂[t]/(t²) the class t is nonzero with t²=0; both survive in the colimit because every transition sends a power basis into a power basis.

7. **F07** (P3) §7.29 is stated over an algebraic closure as well, where the cited supplier category is not provided

   **Location.** README §7.29 line 13414: "Let k be a finite field or an algebraic closure of one, ℓ≠char k … On the rational bounded constructible category of a finite-type DM stack 𝒳 supplied by DeligneWeightsAndPurity §8.24".

   **Claim.** The supplied category exists over k̄.

   **Witness.** DeligneWeightsAndPurity §8.24 at its open head constructs `dmStack_etaleCohomology` "for a finite-type Deligne–Mumford stack over 𝔽_q with ℓ≠p" (its line 3274); no clause gives the category over an algebraically closed field. Every consumer of §7.29 (§7.17 line 13218; Layer 8) works under the standing hypothesis "k is finite"; the k̄ wording is used only in §7.29's own Checks (Bμ₂, 𝔸¹ over an algebraically closed field), which are geometric-fibre statements.

   **Exact repair.** State §7.29 over a finite field k, as the supplier does, and phrase its three Checks as computations on the geometric fibre of the stack over k (base change to k̄ of objects defined over k); if the k̄ category is wanted later, declare it as a gap on DeligneWeightsAndPurity §8.24 rather than assume it. Tested: the three Checks' values (invariant dimensions 1 and 0 on Bμ₂; H⁻¹=L, H⁰=0 for L[1]; stalk ranks 2 and 1 for t↦t²) are unchanged by this rephrasing.

Round 4 reviews the package at the head that carries the round-4 repair (six findings applied). Every round-3 finding was re-verified at this head with a witness; the adversarial pass was rerun on every passage the repair changed or added, the repaired patterns were searched for in the rest of the package, the fifteen seeded targets were read against their sources, the Lean acceptance file was elaborated, probed and signature-checked, the dependency check was run (the roadmap's position in the merge order moves), and every supplier citation was resolved on main, at the open heads or at the pins. No P1 or P2 finding remains. The seven findings below are P3 (build-order policy, style and Check quality) and are applied by the next stage.

## Round-3 findings, checked individually at this head

| Round-3 finding | Repaired passage (README) | Disposition and witness |
| --- | --- | --- |
| F01 (P1) factorial relation written as an inequality | §3.186 line 7869 (and §§3.215, 3.216, 3.240–3.243, 3.293, 3.294, 3.308, 3.325–3.327): "roots u_i satisfying u_i^((i+1)!) = f, where f denotes its image under the coefficient map"; §3.375 line 10937: "u_n^((n+1)!/n) … ((n+1)!/n)/(n+1)! = 1/n"; Worked examples line 14728: "order 6! = 720 … 144-th tensor power, since 5·144 = 720 … order 5! = 120 gives exponent 6 followed by 24"; Conventions line 17 and §3.64 Checks lines 5790–5791 add the i=0 and i=2 witnesses. | **Repaired** at all thirteen sites (counted 13, one per section) and no "≠f" or "u_i^(i+1)" residue anywhere. Recomputed: i=0, f=2: u_0¹=2; i=2: u_2⁶=2 and T³≠2 in ℤ[T]/(T⁶−2) (coordinates (0,0,0,1,0,0) vs (2,0,…)); n=2: (6/2)/6=1/2; n=1: e_[1]=e_[0]; 5·144=720, 6·24=144. |
| F02 (P2) rank-one dictionary used in finite rank | §7.26 line 13352 "Finite-rank lisse descent and finite-cover monodromy"; line 13354 "locally free of finite rank, the rank being locally constant on 𝒳 and allowed to be zero, with all O_E-linear sheaf morphisms"; API bullet line 13362 "pullback is fully faithful in every finite rank"; §7.3 line 12907 "local systems on 𝒳 of every finite rank, including zero, are continuous representations of it (§7.26 …)". | **Repaired.** The J=[[1,1],[0,1]] Check (line 13373) recomputed: Jⁿ=[[1,n],[0,1]], order 3 mod 3, 9 mod 9, infinite over ℚ₃; commutant {[[a,b],[0,a]]} of dimension 2; only invariant line ⟨e₁⟩. Rank-zero and locally-constant-rank Checks (line 13374) present. Reduction still precedes localization (line 13354, "No finite-reduction functor is asserted on the rational localization"). |
| F03 (P3) §1.18 duplicates `AdjoinRoot.finitePresentation` | No `### 1.18` heading; §1.40 line 873 "the Mathlib instance `AdjoinRoot.finitePresentation` at S=B and f=Tⁿ−C(u)"; Scope line 11 and From Mathlib line 35 list the instance "for every natural n, including n=0 where D=B[T]/(1−u)". | **Repaired.** `@AdjoinRoot.finitePresentation : … [Algebra.FinitePresentation S R] → Algebra.FinitePresentation S (AdjoinRoot f)` at the pin, no positivity. Manifest `cited_for` of FramedRoot now §1.15–1.17. |
| F04 (P3) generic Checks in §§3.284, 3.308 | §3.284 lines 9435–9438; §3.308 lines 9865–9868; §3.186 lines 7884–7885. | **Repaired.** Recomputed: d_1=2 so E(v_2)=u_1 and u_1=u_2³≠u_2; T⁻¹(e_[1/2]⊗u_2)=e_[1/2]⊗v_6 since d_2=6, and the wrong coaction-applied model gives e_[1/2]·e_[1/6]=e_[2/3]; action values −1 and ζ₆=(1+√3i)/2 against 1, 1; ζ₆²=(−1+√3i)/2; (h_1−1)⊗u_1≠0 over 𝔽₂ because both H_A and C_A(0) are free with injective transitions; the ZMod4 instance (3·2=2=1·2) is now stated as non-separating. |
| F05 (P3) lemma tag 01JO | Twenty-one sites now "line 1410 — Stacks Project §26.17, Lemma 26.17.2 (tag 01JQ), printed p.31"; §7.2 cites STACKS-KAROUBIAN line 259, Lemma 12.4.2 (tag 09SH). | **Repaired.** NormalizationThree line 1410 is "Lemma 17.2.01JQ … all affine then X×_S Y is affine" after the page-31 marker at line 1385; STACKS-KAROUBIAN line 259 is "Lemma 4.2.09SH" with item (3) the direct-sum splitting. Counted 21 "tag 01JQ"; the 24 remaining "tag01JO" are section-level citations of line 1383, which are correct. |
| F06 (P3) field symbol and process wording | §3.8 line 4723 "the map F₃:B₃→ₐ[A]A[ℤ/3] sends t₃⁴ to e_[1]⁴=e_[4]=e_[1] … for every A (for instance A=ℤ and A=𝔽₃)"; §7.5 line 12938 cites the pinned maps, "private signature" absent. | **Repaired** (e_[4]=e_[1] in ℤ/3 for every A). The deletion left the dangling clause recorded in R05. |

The round-2 finding marked `not actionable in this package` (the architecture objection) is not re-raised.

## Verified sound

The inventory has 816 numbered targets in ten layers plus the unnumbered Layer 8 input, 1,824 own-roadmap `*Needs:*` edges, no fine-grained cycle, no target without a `*Needs:*` line and no reference to a deleted section (§§1.18, 2.7–2.10, 2.12, 2.15, 3.87, 3.102, 10.30 are absent and uncited). The package has the required shape: Summary, Scope and ownership, Conventions, Exact supplier contracts (Mathlib, Tau Ceti, nine roadmap suppliers with the seven declared gaps), How to read the build, ten layers each ending with Examples and Dependencies, Downstream consumers, Worked examples, References. No LaTeX delimiter, process word, pull-request number, job id, machine path, "(removed)" stub, "optional" or "deferred" item was found; `Suggested.lean` has no `lemma`, `set_option`, `#print`, `#eval`, `#synth` or `True` placeholder; `metadata.toml` is `topic = "math.NT"`; the manifest has 39 entries, all with `id`, `authors`, `title`, `year`, `locator_scheme`, `locator` and `cited_for`, none flagged unverified, B24 settled `uncertified`. The sources manifest and every package file are unchanged by this review.

### Principles

No route-specific shortcut: Layers 1–3 keep arbitrary commutative A including the zero ring, arbitrary f, nonunit and nilpotent parameters, wild exponents and fpqc descent; the odd-characteristic restriction enters only with the quadratic class-field layers (Conventions line 21), where the source (YZ19) needs it. No roadmap is re-planned: finite root stacks, their charts and the branch fibre are consumed from SchemeAndStackFoundations §1.21 (its line 2951 and the `test_fibre_nonreduced` Check at its line 2984), root gerbes with invertible exponent from AlgebraicModuliForArithmeticGeometry §4.3 (its line 2097 states `n>0` invertible, as this README says), Weil restriction from ModularCurves §0F (its line 412). No copied passage, computational algorithm, sorry'd data or `set_option`.

### Seeded source verification

All fifteen sampled locators were read in the cached texts. "Deduction" means the source supplies the construction and the README the elementary coordinate statement.

| Sample (README line) | Source at the locator; hypotheses; result |
| --- | --- |
| 1.17 (460) | FramedRoot-codex-rtOQ9t line 7989, Example 4.9.22 (root stack of (L,s) as a fibre product over [𝔸¹/𝔾_m]), pp.159–160. The Fin n basis of B[T]/(Tⁿ−u) for n>0 is `AdjoinRoot.powerBasis'` with `Polynomial.monic_X_pow_sub_C` (needs n≠0, checked at the pin); over the zero ring `Module.subsingletonEquiv` gives the family. Deduction, hypotheses match. |
| 1.127 (2336) | TV17 line 778, Corollary 3.13 (quotient presentation with Kato chart, P=ℕ), pp.14–16; STACKS-KUMMER line 1442, Lemma 28.3 (040N), fppf Kummer sequence for any n, proof with B=A[T]/(Tⁿ−a), a a unit. The residue map is a deduction from the target-coordinate equivalence; the unit hypothesis of 040N is not used for arbitrary f. |
| 1.130 (2401), 1.132 (2427) | FramedFppfCover-codex-rtOQ9t line 837, Definition 7.1 (021M): fppf covering = flat, locally finitely presented, jointly surjective. Surjectivity of Spec D→Spec B for n>0 is the finite free positive-rank cover; the global-section statement is `ΓSpecIso_naturality` (checked at the pin). |
| 1.176 (3109) | Same locators as 1.127. Kernel criterion recomputed: Θ(x^i⊗x^j)=e_i⊗x^{i+j}, and for fixed i the exponents i+j<n and i+j−n are disjoint, so the kernel is c_{ij}=0 for i+j<n and f·c_{ij}=0 for i+j≥n; witness 2(x⊗x) over ℤ/4, f=2 maps to 2·2(e₁⊗1)=0. |
| 1.220 (3870) | NormalizationThree-codex-rtOQ9t line 1383 (section 01JO), Definition 17.1 (01JP) at line 1387, Lemma 17.2 (01JQ) at line 1410, p.31. Inverse-transport identity is `CategoryTheory.Iso.inv_comp_eq` applied to the forward equation of §1.210; locator valid at section level. |
| 3.70 (5886), 3.92 (6255) | AffineRootPointGroupoid-rtOQ9t line 966, Section 10 "Actions of group schemes" (022Y), Definitions 10.1 and the action diagrams, printed pp.21–22. p(t_N)^{N/n} at n=N is p(t_N)¹: `pow_one`. Deduction. |
| 3.86 (6142) | TV17 line 650, Proposition 3.5 and Remark 3.6, §3.1 line 668, pp.13–16 (X_P^{[∞]}=lim X_P^{[n]} over divisibility). Insertions `DirectLimit.Algebra.of`; injectivity because each transition sends a power basis into a power basis. Checks: R06. |
| 3.90 (6214) | TV17 line 668, §3.1 (the (1/n)P^gp/P^gp grading). c_N([(N/n)·k])=((N/n)k)/N=k/n in ℚ/ℤ, needs n,N>0; `Nat.cast_div` at the pin. |
| 3.322 (10068) | TV17 line 668. Q_B(1)=1 is identity preservation of a monoid equivalence. The parenthetical cites TV17 line 668 twice; harmless. |
| 3.371 (10856) | TV17 line 733, Remark 3.9 (a torsor under a limit of affine finite-type group schemes is the limit of its finite-stage pushforwards), line 738, Proposition 3.10, p.15. The limit itself is §3.13 (read: hypotheses finite locally free G_n, faithfully flat transitions with finite locally free kernel; conclusions (a)–(g) incl. fpqc covering by Stacks 090N, 0245, 02KY/02L2/02LA). |
| 3.398 (11284) | TV17 line 714, Definition 3.8 (R_P=[X_P^{[∞]}/μ_∞(P)], fpqc quotient), line 738, Proposition 3.10 and its proof (μ_∞(P)-torsor of trivializations), line 778, Corollary 3.13; AGV08 line 2431, B.2. With P=ℕ, 1↦f, Corollary 3.13 gives the equivalence for every f as the README says; the LEFT coframe convention and the ζ↦ζ⁻¹ band inversion are this roadmap's (Conventions line 19). |
| 4.1 (11791) | YZ19 line 6918, Definition A.1 (triples (L,K_R,ι:K_R^{⊗2}≅L|_{R×S})), line 6926 (decomposition over d∈ℤ), pp.514–515. Hypotheses match; relative stabilizer μ₂^r recomputed (u²=1 on each of r points). |
| 5.11 (12296) | YZ19 line 7095, Lemma A.4 and proof lines 7121–7128, pp.516–517 (D_I≅X_{d−#I} by D↦D+Σx, nonempty only if #I≤d, smooth of codimension #I); STACKS-DIV line 207 (0B9C), Lemma 3.3 (0B9F) at line 268 (residual subtraction of relative effective Cartier divisors), Proposition 3.6 (0B9I) at line 324. Checks recomputed: d=1, I={x,y}: empty; d=2, I={x}: residual of 2x is x. |

Additional locators read this round: YZ19 line 7507, Lemma A.9 with the bound d≥ρ+max{2g−1,1} (matches Conventions line 27 and §8.1); ETINGOF line 1493, Theorem 3.8 and its proof at lines 1500–1511 (P=|G|⁻¹Σg is the projector onto invariants, p.37), supporting §7.2's citation; FunctionFieldArithmetic §4.8 at its open head (b↦O(D) with rigidification b_v⁻¹) and §0.1 (uniformizer idele acts by arithmetic φ^{d_v}), supporting the sign adapter of the supplier contract (a=2 over 𝔽₅: b=3, inverse rigidification 2).

### Computed adversarial table

| Statement or convention | Instances and values computed on each side | Result |
| --- | --- | --- |
| `rootChart A f n` | A=ℤ, f=2, n=0: ideal (1−2), quotient zero. A=𝔽₂, f=0, n=2: t≠0, t²=0. | Total quotient, correct at the boundary; headlines require 0<n. |
| `rootChartCoaction` | n=2: (h⊗t)²=h²⊗t²=1⊗f, root relation holds. n=1: h=1, coaction x↦1⊗x. | Real body; `#check` keeps A, [CommRing A], f, n. |
| `rootChartComparison` | Basis x^i⊗x^j↦e_i⊗x^{i+j}; n=2: Θ(t⊗t)=f·(e₁⊗1) (README line 627); ℤ/8, f=4: cokernel ℤ/4 generated by e₁⊗1, 2z≠0, 4z=0 (line 626). | Matches README API; elaborated type is the stated tensor map. |
| `rootChartComparison_injective_iff` (§1.184) | n=1 any f: Θ≅id, true/true. ℤ, n=2, f=2: kernel 0, ×2 injective, true/true. ℤ/4, f=2: 2(x⊗x)↦0, ×2 not injective, false/false. 𝔽₂, f=0, n=2: x⊗x↦0, false/false. Zero ring: true/true. | Both directions hold on every instance; probes `simp`, `rfl`, `constructor <;> simp_all` fail to close it. |
| `rootChartComparison_surjective_iff` (§1.185) | n=1: true/true. ℤ, n=2, f=2: e₁⊗1 not in image, 2 not a unit, false/false. 𝔽₂, f=1, n=2: bijective, true/true. 𝔽₂, f=0: e₁⊗1 missing, false/false. Zero ring: IsUnit 0 holds, true/true. n=0 excluded by hn (for f=2 over ℤ, Θ:0→0 is bijective while 2 is not a unit). | hn is necessary and present; probes fail to close it. |
| Factorial relation (13 sites, Conventions, §3.64) | i=0: d_0=1, u_0=f. i=1: d_1=2. i=2: d_2=6, u_2⁶=f, u_2³≠f over ℤ, f=2. | Equality restored (F01). |
| §3.375 character | n=1: (2/1)/2=1≡0; n=2: (6/2)/6=1/2; n=3: (24/3)/24=1/3. | Correct for n>0. |
| Worked example, factorial restriction | 720/5=144; 720/120=6, 120/5=24, 6·24=144. | Correct. |
| §3.284 T, T⁻¹ | T(e_[1/3]⊗v_2)=e_[1/3]⊗u_1 (d_1=2); T⁻¹(e_[1/2]⊗u_2)=e_[1/2]⊗v_6 (d_2=6); wrong coaction model e_[2/3]. | Discriminating (F04). |
| §3.308 action | g(h_i)=exp(2πi/d_i): coherence exp(2πi/d_j)^{d_j/d_i}=exp(2πi/d_i); values −1, ζ₆; ζ₆²=(−1+√3i)/2; 𝔽₂: (h_1−1)⊗u_1≠0. | Trivial action excluded (F04). |
| §3.186 ZMod4 Check | h_1∈{1,3}, x(u_1)∈{0,2}: 3·2=2=1·2. | Correctly stated as non-separating. |
| §3.64 Checks | ι_1(t_2) over 𝔽₂, f=0: nonzero, square zero; ℤ/1: zero. | Nilpotents retained. |
| §3.86 insertions | v_2=v_6³ true; the other two Checks hold for any algebra map / are the identity law. | R06. |
| §3.90 scaled divisibility | n=2, N=6, k=1: c_6([3])=3/6=1/2=c_2([1]). | Scaled, not [k]↦[k]. |
| §3.13 torsor tower | G_n=μ_n, ζ↦ζ^{m/n}: coordinate ring of μ_m free of rank m/n over μ_n, kernel μ_{m/n}; roots of 2 over ℚ: colim ℚ[z_n]/(z_nⁿ−2) has no ℚ-point. | Hypotheses and conclusions consistent. |
| §3.398 quotient | f unit: Spec C_A(f) a G-torsor, quotient Spec A; k, f=0: substack z_n=0 is BG_k. | Matches TV17 Definition 3.8/Proposition 3.10 with P=ℕ. |
| §3.413 Kummer classification | ℝ: n odd gives ℝ^×/ℝ^{×n}=1, n even {±1}; two compatible families (1) and ([−1]_n); ℚ: ([2]_n) nontrivial. Inverse limit of nonempty finite Isom sets is nonempty, so detection is injective. | Correct. |
| §3.427 band | Characteristic p residue field: μ_p infinitesimal, lim μ_n≠Ẑ(1) as group schemes. | R04 notation. |
| §4.1 stabilizers | r branch points: μ₂^r; R=∅: ordinary Picard stack. | Correct. |
| §5.11 incidence | d=1, I={x,y}: empty; d=2, I={x}: residual x; I=∅: identity. | Matches YZ19 A.4 proof. |
| §6.7 adapter | a_x=π_x: lattice π_xO_x, line O_X(−x); π_x⁻¹: O_X(x) of degree [k(x):k]. FFA §4.8: b=a⁻¹, rigidification b_v⁻¹=a_v; a=2 over 𝔽₅: b=3, rigidification 2. | Sign adapter agrees with the supplier at its head. |
| §7.2 averaging | S₂ on K², 2 invertible: e(x,y)=((x+y)/2,(x+y)/2); ℤ/2[ℤ/2]: augmentation sends invariant 1+g to 0. | Unit hypothesis necessary and stated. |
| §7.3 inertia of order two, finite rank | Image of I_x̄ of exponent 2 is a quotient of I^tame/2≅ℤ/2 (p odd); J=[[1,1],[0,1]] on ℙ¹ over 𝔽₅ with E=ℚ₃: in the domain, End of dimension 2 on every nonempty open. | Finite-rank statement true; dictionary supplied by §7.26. |
| §7.26 lattices | ×3 on ℤ₃ not invertible, reduces to 0; ×2 invertible, reduces to 2; ℚ₃: ×3 invertible. Frobenius↦4: 4≡1 mod 3, order 3 mod 9. | Reduction before localization retained. |
| §7.29 Checks | Bμ₂: invariants 1 and 0; j:𝔾_m→𝔸¹: j_!*E[1]=E_𝔸¹[1]; t↦t²: ranks 2 on 𝔾_m, 1 at 0, sign summand boundary 0, constant 1. | Values hold; base-field wording R07. |
| §8.1 bound | d≥ρ+2g−1 gives deg L(−R)>2g−2 so H¹=0; ranks d−g+1 and d−ρ−g+1. | Matches YZ19 A.9. |
| §8.8/Layer 8 input | r=1: 2g(Y)−2=−2m forces m=1; t↦t² on ℙ¹: fibre of 1 is {1,−1}, image dimension 1, outside the gap's hypothesis. | Hyperplane gap used only for r≥2. |
| §§10.20, 10.22, 10.24 signs | Split fibre: Frobenius fixes e₁−e₂, trace +1; inert: −1; η(π_x⁻¹)=η(π_x) for quadratic η; unit trace 1. | End-theorem signs agree. |
| §2.17 regularity | A[z,q,q⁻¹]/(zⁿ−qf), n≥2, prime ∋z: class of zⁿ−qf in m/m² is −q[f]≠0; on z≠0 the ring is A_f[z,z⁻¹]. Nonexample D=(x²), n=2: nodal chart. | Regular-divisor hypothesis necessary and stated. |
| §2.18 DM locus | Spec ℤ, s=2, n=3: DM everywhere; (1+ε)^p=1 in K[ε]/ε² detects μ_p. | Correct. |
| Layer 7 → Layer 8 edges | 7 Layer 7 `*Needs:*` items cite Layer 8; Layer 8 depends on Layer 7. | R01. |
| Layer 1 → Layers 2, 3 edges | §§1.35, 1.58, 1.87, 1.106, 1.225 → §§3.30/3.31/3.33/3.49 (which need only §3.10); §1.240 → §2.4 → §2.1 (suppliers only). | R02. |

### Pins, ownership and supplier resolution

Pinned libraries: Mathlib and Tau Ceti at the content manifest's revisions. Declarations opened at the pin with a `#check` scratch file (all elaborate): `AdjoinRoot.finitePresentation`, `DirectLimit.exists_eq_mk`, `finite_of_finite_type_of_isJacobsonRing` (needs `Field S`, `IsJacobsonRing R`, `Algebra.FiniteType R S`), `exteriorPower.toTensorPower`, `ValuationSubring.surjective_unitGroupToResidueFieldUnits`, `Finset.card_product_filter_lt`, `Nat.choose_two_right` (n·(n−1)/2: values 0,0,1,3 at n=0..3 as README line 39 says), `MonoidAlgebra.single_pow`, `AdjoinRoot.powerBasis'`, `Polynomial.monic_X_pow_sub_C` (n≠0), `Polynomial.natDegree_X_pow_sub_C` (needs `Nontrivial R`, which is why §1.17 treats the zero ring separately), `Module.subsingletonEquiv`, `AlgebraicGeometry.LocallyOfFinitePresentation.SpecMap_iff`, `RingHom.finitePresentation_algebraMap`, `AlgebraicGeometry.Scheme.ΓSpecIso_naturality`, `Algebra.TensorProduct.congr`, `CategoryTheory.Iso.inv_comp_eq`, `AlgebraicGeometry.Scheme.fpqcTopology`, `AlgebraicGeometry.Scheme.fppfTopology`, `CategoryTheory.Pseudofunctor.IsStack`, `Nat.factorial_dvd_factorial`, `mem_rootsOfUnity`, `ZMod.natCast_zmod_val`. Tau Ceti names of the supplier contract found at the pin: `RootsOfUnityGroup.pointsMulEquiv` (TauCeti/Algebra/AlgebraicGroup/RootsOfUnity/BaseChange.lean), `AddCircle.exists_mem_torsionBy_rat` and `exists_zsmul_eq_of_mem_torsionBy` (TauCeti/Algebra/AddCircle.lean), `groupCohomology.natCard_nsmul_eq_zero` (…/GroupCohomology/Corestriction.lean), `PiTensorProduct.reindexRepresentation` (…/Symmetric/TensorAction/Basic.lean), `InvertibleSheaf`, and the seven `exteriorPower.*` maps (TauCeti/LinearAlgebra/ExteriorPower/Basic.lean). Mathlib has no sharp root-chart comparison: `AdjoinRoot.tensorAlgEquiv` (Mathlib/RingTheory/AdjoinRoot.lean:1101) is base change of a quotient, not the action comparison, and Mathlib/FieldTheory/KummerPolynomial.lean is field-only; the two headlines are not duplicates.

Supplier citations resolved this round: on main, SchemeAndStackFoundations §§0.9 (line 848), 1.1 (2071), 1.15 (2502), 1.18–1.23 (2745–3021), 2.3 (3330), 2.10–2.11 (3631–3656), 3.2–3.7 (4671–4937), 4.13 (5643); AlgebraicVectorBundles L0A–L0C (lines 215–254); ModularCurves §0F (412); AlgebraicCurves Layer 12 (1085); JacobianChallenge Layers A–D (111–218); EtaleCohomologyFoundations F.0.2 (200), F.0.A1 (284), F.0.A2 (368), F.1 (457), F.2.1 (504), F.2.6 (645), F.2.7 (759), F.3a (776), F.4.1–F.4.6 (959–1089), 0.11 (1157), F.5 (1179), F.6 (1200), F.8 (1265); RepresentationTheory/SchurWeyl Layer 8 (352); ProfiniteCohomology Layer 10 (its introduction). At open heads: FunctionFieldArithmetic §§0.1, 2.1, 4.1, 4.2, 4.5–4.10 (headings at its lines 441–1576); AlgebraicModuliForArithmeticGeometry §4.3 `neutralizationEquivalence` and `rootGerbe` (n invertible), §4.4 `GerbeLimitFamily`, `limitStackDescent`, `nonemptyAffineLimitGerbe`, §4.23; InverseGaloisAndArithmeticFundamentalGroups §IG.5.7, the paragraph "Finite-cover criteria for full monodromy image" (its line 6349: dense open of a connected normal locally noetherian DM stack); DeligneWeightsAndPurity §8.24 `dmStack_etaleCohomology` with `_atlas`, `_refinement`, `_pullback`, `_frobenius` (its lines 3274–3294, over 𝔽_q: R07). The citation resolver reports no cross-roadmap citation and no Lean name found nowhere.

Ownership: the roadmap grep over main and the 367 open heads finds "infinite root stack", "root Picard", "symmetric lisse", "L_d^Pic" and "zero-section gerbe" nowhere else; "rootChart" hits in RelativeFarguesFontaine, HodgeTateAndCanonicalSubgroups and AutomorphicBundles are log/Fargues–Fontaine charts, different objects and different namespaces; "D(ℚ/ℤ)" hits (ClassicalArithmeticCompletion and others) are Cartier duals in local class field theory, not root bands. The board packages SchemeAndStackFoundationsPartII (head 9022ef2) and VStackSheavesAndLisseCategoriesPartII (head 99411c4) carry only `design/README.md` at those heads (no package README); their design READMEs mention no root stack, Kummer tower or root Picard object (the second is about v-stacks). GlobalShtukasAndFunctionFieldLanglands is later in the merge order and is a consumer, not a supplier. The seven declared gaps have the same slugs in design/plan.json and the README, each with a named supplier and a one-sentence `needs`; none asks for what a pin or an earlier roadmap provides (the hyperplane theorem is absent from EtaleCohomologyFoundations F.0.2, lines 200–283, and the nonreduced diagonalizable coarse contract from SchemeAndStackFoundations §1.23).

Dependency check (run as instructed, output verbatim):

```text
moved: FunctionFieldArithmeticPartII moved in the merge order from #16 to #169, right after its last supplier FunctionFieldArithmetic (EtaleCohomologyFoundations, AlgebraicModuliForArithmeticGeometry, InverseGaloisAndArithmeticFundamentalGroups, DeligneWeightsAndPurity also came after it); checked as moved (the worker moves it there when it submits)
depcheck: 56 roadmaps, 639 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The `moved:` line is the round-3 move (the merge-order file on this branch still lists the roadmap at #16 and FunctionFieldArithmetic at #169); it is not a defect, and the worker applies it on submission.

### Headline theorems and the Lean acceptance file

README headlines: the sharp affine root comparison (injectivity §1.184, surjectivity §1.185); relative regular root geometry (§§2.17–2.18); the coherent infinite root stack, its fpqc quotient and base change (§§3.398, 3.424); infinite affine coinvariants (§§3.391–3.401); the infinite DVR gerbe, Kummer classification and non-fppf torsor (§§3.409, 3.413, 3.427–3.428); the root Picard square quotient and signed adelic equivalence (§§4.1–4.12, 6.7); rational DM perverse descent with the proper quasi-finite comparison (§7.29); symmetric lisse lines, collisions and multiplication (§§7.7–7.22); exterior-power cohomology (§§7.5–7.9, 7.18); high-degree Abel–Jacobi descent (§8.13); the normalized character in every integer degree (§§9.5, 9.11); the quadratic Frobenius trace comparison (§§10.20, 10.22, 10.24). The two affine headlines are stated in `Suggested.lean` (lines 79–89) at the README's generality (arbitrary `CommRing A`, arbitrary `f`, explicit `0 < n`); each of the other eleven is named in the module docstring (lines 9–30) with the carrier it lacks, and none is statable at the pins (no DM-stack lisse or perverse category, no root Picard stack, no coherent root pseudofunctor). `lake env lean` on packages/FunctionFieldArithmeticPartII/Suggested.lean from the pinned content checkout exits 0 with exactly two warnings, `declaration uses sorry` at lines 79 and 86; the only import is `import Mathlib`, so no Tau Ceti module was built. A scratch copy with `#check @name` for all five declarations elaborated once: every type keeps `A`, `[CommRing A]`, `f`, `n`, and both headlines keep `hn : 0 < n`; nothing changed. The one-tactic probe (scratch copy, `fail_if_success simp`, `fail_if_success rfl`, `fail_if_success (constructor <;> intro h <;> simp_all)` before each `sorry`) elaborated with no error at the two headlines: neither closes. The three definitions have real bodies and are used by both headlines; no API lemma, example, boundary case or Check is restated in Lean, so there is no padding to delete. Every Lean name appears in the README (lines 262, 298, 635, 3258, 3277); no backticked name of this roadmap's own is absent from the file.

## Not verifiable

- **B24** (Bresciani 2024, cited at §§3.2, 3.14, 3.62, 3.78, 3.409, 3.413, 3.427–3.428 and the Worked examples, pp.133–136): settled `uncertified`; cited by locator alone, not requested again. The Kummer, real-point and reduced-fibre computations in those targets were checked independently (table above), which does not certify the unread text.
- **Package READMEs of SchemeAndStackFoundationsPartII and VStackSheavesAndLisseCategoriesPartII** at the heads in the board index: neither head carries `packages/<Name>/README.md` (only `design/`, `reports/` and `sources.toml`); ownership was checked against their `design/README.md` instead.
- **Open roadmap pull requests without files in the brief:** ownership was checked through the indexed roadmap grep service and the readable board packages; unread heads are not asserted to contain no overlapping construction.

## Source issues

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "5a6bc6d", "job": "REV-PKG-FunctionFieldArithmeticPartII~4", "model": "fable", "worker": "fable-rev143"} -->
