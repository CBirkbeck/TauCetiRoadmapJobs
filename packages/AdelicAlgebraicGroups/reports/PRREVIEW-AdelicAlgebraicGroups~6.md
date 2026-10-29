# Review of AdelicAlgebraicGroups (pull request #792 at 1f7bd94)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 6008aed. The upward LFunctions dependency remains. The updated Mathlib pin also causes the worker's build-warning gate to fail. The dependency checker still reports a FuchsianOrbifolds cycle, which is a false positive against the required main-branch supplier policy; it is recorded separately below, not asserted to be a mathematical cycle. No pull-request file was changed.

## R01 (P1) — The targeted build fails the permitted-warning gate

Location: `TauCetiRoadmap/AdelicAlgebraicGroups/Suggested.lean:1`, `import Mathlib`.

Claim: the acceptance build must emit only `sorry` warnings.

Witness: `lake build TauCetiRoadmap.AdelicAlgebraicGroups.Suggested` exits 0 but emits “imports `Mathlib` from package `mathlib`, which is designed for use with the module system”. The worker records `build=1`. Direct Lean elaboration exits 0.

Repair: add the `module` header suggested by the diagnostic, preserving the imports and statements, then rerun the targeted build and warning gate. A scratch copy with that header and all declaration signature checks elaborates with only 20 `sorry` warnings. This validates elaboration, not the Lake warning gate after the edit; that gate must be rerun. Severity follows this job's rule for a failing build check; no theorem is claimed ill-typed.

## R02 (P1) — The cycle gate uses the wrong version of FuchsianOrbifolds

Location: `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:124`, “supplies the coarse quotient Riemann surface”; gate diagnostic `CYCLE among: AdelicAlgebraicGroups, FuchsianOrbifolds`.

Claim: the gate treats the open revision of an existing roadmap as the supplier, contrary to the brief's main-branch rule.

Witness: main's `TauCetiRoadmap/FuchsianOrbifolds/README.md` has zero occurrences of AdelicAlgebraicGroups. The supplied open revision has the reverse dependency at lines 133 and 965. Main's layers 1, 4 and 5 contain the requested quotient and map interfaces.

Repair: the worker must resolve this supplier to its main-branch version when adjudicating the gate. Keep the valid main-branch citation in this folder. On that graph, the reverse edge is absent, so this two-node cycle disappears. This is a disputed gate result, not an author-action mathematical defect. No tooling or merge-order file was edited. It is listed at P1 solely because the brief requires every reported cycle failure to be recorded at that severity.

## R03 (P2) — LFunctions remains an upward supplier

Location: `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:262`, “LFunctions, Layer 5 for continuation and Layer 7 for nonvanishing”; also lines 110, 500, 2008–2022 and 2313.

Claim: AA.2.4 consumes finite-order Hecke continuation and nonvanishing at one from a roadmap later in the merge order.

Witness: `UPWARD: AdelicAlgebraicGroups (#20) -> LFunctions (#268)`. The movable check is blocked by OrthogonalTamagawaAndLatticeMass (#116), whose README:11 consumes AA.1–4. For the quadratic character modulo 4, the required value is `L(1,χ₄)=π/4≠0`.

Repair: put the prerequisite in AA.2.4, or assign it to a single earlier owner which LFunctions also consumes: continuation and a nonzero germ at one for every nontrivial primitive finite-order ray-class character, with the finite Euler correction for larger moduli. Remove the upward supplier rows and `AA → LFunctions → ThetaSeries`. The corrected contract must cover χ₄ at `s=1` and the modulus-12 correction `1+3⁻ˢ`, giving `π/3` at one. The pinned `TauCeti.continuedLFunctionOfWeight_ne_zero_of_isTrivialOnGood_sq` in `TauCeti/NumberTheory/ArithmeticDirichletSeries/Cancellation/Nonvanishing.lean:134` explicitly requires `s ≠ 1`, so it is not a replacement. Replace `oddPrimitiveModFour` at README:2043 with prose describing the odd primitive character of conductor `4∞`; that name is absent from the cited LFunctions files.

## R04 (P3) — Retain only the locators that support the stated claims

Location: `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:559,940,4677,4746,4806`; the first two cite Sutherland §23.3 for second countability and multiplicative idele measure; the others cite Milne p. 58 for stronger level-map assertions.

Claim: these source locators support more than the texts establish.

Witness: previous review R02 records Sutherland lines 285–309 as additive box normalization, and Milne lines 2514–2533 as the neat-level inverse system and right action. Neither supplies all the extra assertions assigned to it.

Repair: cite Rosengarten §1, p. 2 for the multiplicative normalization, or state it as this roadmap's convention. Label second countability as an owned deduction. Label the covering degree, action-groupoid stabilizers and Cartesian square as owned deductions from the stated stabilizer and neatness inputs; retain Milne for the inverse system and right action. The unchanged checks still give idele-box mass `1/2` (not `1/4`) and degree `N` for `ℝ/Nℤ → ℝ/ℤ`. This finding carries the previous source inspection forward; it does not claim a fresh source fetch. The previous report's second-countability line 607 was inaccurate: it is line 559 here.

## R05 (P3) — Delete the unqualified duplicate library name

Location: `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:155,383`, `Subgroup.index_mul_measure`.

Claim: this exact fully qualified declaration is available at the pin.

Witness: scratch `#check @Subgroup.index_mul_measure` fails with “Unknown constant”; `#check @MeasureTheory.Subgroup.index_mul_measure` succeeds. The latter is declared in `Mathlib/MeasureTheory/Group/Measure.lean:285`, within the MeasureTheory namespace.

Repair: delete the bare duplicate or replace it with `MeasureTheory.Subgroup.index_mul_measure` at both occurrences. Its finite-index, measurable-subgroup and invariant-measure hypotheses are present. For counting measure on `C₄` and its order-two subgroup, the retained theorem gives `2·2=4`.

## R06 (P3) — Correct the cotangent and residue-unit supplier locators

Location: `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:317`, “ReductiveGroups, layer 2 (cotangent duality)”; lines 4433–4453 assign residue-unit input to LocalFieldsRamification layer 0.

Claim: those exact supplier sections own the indicated constructions.

Witness: main's ReductiveGroups README:227 gives Lie algebra and adjoint representation, without the cotangent equivalence. LocalFieldsRamification README:267 begins layer 1, units and their filtration. The cotangent equivalence is already pinned at `TauCeti/Algebra/AlgebraicGroup/Tangent/Cotangent.lean:261`.

Repair: cite `TauCeti.Bialgebra.CotangentSpace` (same file:57) and `Derivation.cotangentLinearEquiv` directly for duality; use LocalFieldsRamification layer 1 for residue units, retaining layer 0 for valuations. On `G_a`, the cotangent dual is one-dimensional; on `ℚ₃`, the residue-unit group has order 2. These are the intended inputs.

The previous finding also requested more explicit names for the compact-abelian Fourier and torus-cohomology deductions. Main's CompactGroups layer 5 does supply uniform Peter–Weyl density (README:320), and AlgebraicTopology supplies circle-product homology (README:907) and stage-6 cohomology tools. Those are valid inputs to the deductions; I do not treat the broad wording alone as an additional ownership defect.

## R07 (P3) — Consolidate detached Checks blocks without deleting their content

Location: `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:694,814,1615,1761`, repeated `**Checks.**` headings without an intervening target.

Claim: each Checks list should identify the definition or target it tests.

Witness: the box/level checks at 694 and the normalized-family checks at 814 follow other Checks lists without a new definition. At 1615 the split-component checks are split into two lists; at 1761 a paragraph precedes another Checks heading.

Repair: attach each check to its corresponding target and merge the lists. Preserve the values: exceptional mass 2 remains 2, tail normalization sends it to 1, and the real-quadratic idele `(2,1/2)` has norm 1 but is not a positive scalar diagonal. Turn the Borel paragraph into a bullet, retaining its nonmeasurability example. Do not delete README:4911: contrary to the previous report, it is already a valid bullet, not a duplicated paragraph heading.

## R08 (P3) — Correct the archimedean measure symbol

Location: `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:902`, “`inμ_f`”.

Claim: the factor `2^{r₂}` belongs to the archimedean measure used in the discriminant covolume formula.

Witness: README:887–901 defines and uses the archimedean factor; on the complex unit square `2 dx dy` has mass 2, while `dx dy` has mass 1. `inμ_f` is not that defined measure.

Repair: replace it with `μ_∞`. This gives the required factor 2 for an imaginary-quadratic complex place. The previous line-wrapping suggestion is editorial only, not an additional finding.

## Previous findings

- R01 — not repaired: README:262 and 2008–2022 still consume LFunctions layers 5 and 7; the current dependency check reports the upward edge. Carried as R03.
- R02 — not repaired: README:559, 940, 4677, 4746 and 4806 retain the source assignments. Carried as R04, correcting the previous report's second-countability line number.
- R03 — not repaired: README:155 and 383 retain the bare `Subgroup.index_mul_measure`; the new-pin scratch check still rejects it. Carried as R05.
- R04 — not repaired: README:317 and 4433–4453 retain the cotangent and residue-unit locators. Carried narrowly as R06; Peter–Weyl and circle-product homology remain legitimate inputs to the stated deductions.
- R05 — not repaired: README:694, 814, 1615 and 1761 retain detached or split Checks blocks. Carried as R07; the alleged duplicate paragraph at 4911 is not present and needs no repair.
- R06 — not repaired: README:902 still contains `inμ_f`. Carried as R08. The line-wrapping suggestion does not affect mathematical acceptance.
- R07 — not repaired: AA.5.3 still owns quaternion class sets and compact-level stabilizers. The open-roadmap index still lists QuaternionicModularForms' duplicate targets. This remains an external ownership note, not a blocker or requested edit in this folder.

## Verified sound

**Scope of this incremental pass.** Git confirms exactly zero changed lines in this folder since 6008aed, and zero files in `git diff origin/main...HEAD` outside it. The inter-head list in the supplied changes file is from the main-branch merge, not extra changes proposed by this pull request. The old sibling roadmap folders have been dropped from the PR diff. ReductiveGroupsPartII is now on main; SmoothRepresentationsOfLocalGroups is resolved as the earlier open supplier. The worktree remains clean.

The current pins are Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2` and Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`, verified against the manifest and the package checkouts. They changed despite the unchanged roadmap folder. The repository README's writing rules and CONTRIBUTING were read, along with main's RestrictedProducts and MassFormula roadmaps for shape.

**Build, signatures and padding.** The targeted build exits 0 with 20 `sorry` warnings and the additional Lake module-system warning (R01). Direct `lake env lean` on the actual Suggested.lean exits 0 with exactly the 20 `sorry` warnings. A scratch copy containing `#check @name` for all 62 non-instance declarations plus all four scoped instances elaborates. The header probe changes no theorem statement. No data are admitted and no option override is used. All 20 theorem probes using `first | rfl | (simp; done) | infer_instance | exact?` fail to close their respective goals; no padding is detected by this test.

The six suspected dropped-binder cases were compared with their definitions and README roles. `box` needs no topology, and retains its Group parameter; `InfinitePoints` uses the native infinite-adele carrier at its available generality; `IsCentralCocharacter`, `algebraicPointMap` and `IsFaithfulAlgebraicPointHom` are algebraic definitions not requiring NumberField. In the quotient-measure theorem, `H` is a subgroup of `G`, not the unrelated outer coordinate ring. Its locally compact, Hausdorff, second-countable, Borel and modular-character assumptions remain. NumberField remains on the adelic constructions and arithmetic theorems; finite type remains on reduction and level-map headlines; compactness and separation remain on the Fourier statements. No signature repair is required.

**Pinned declarations opened this round.** Seven directly relevant declarations were read in their current files: `MeasureTheory.Subgroup.index_mul_measure` (`Mathlib/MeasureTheory/Group/Measure.lean:285`); `TauCeti.reductiveCommHopfAlgProperty` and its iff (`TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean:70,78`); `TauCeti.simplyConnectedSemisimpleCommHopfAlgProperty` (`TauCeti/Algebra/AlgebraicGroup/SimplyConnected/Basic.lean:67`); `TauCeti.Bialgebra.CotangentSpace` and `Derivation.cotangentLinearEquiv` (`TauCeti/Algebra/AlgebraicGroup/Tangent/Cotangent.lean:57,261`); and `TauCeti.continuedLFunctionOfWeight_ne_zero_of_isTrivialOnGood_sq` (`TauCeti/NumberTheory/ArithmeticDirichletSeries/Cancellation/Nonvanishing.lean:134`). Reductivity still explicitly includes geometric connectedness, excluding the old `μ₂` counterexample; simple connectedness still tests coordinate central isogenies in the correct contravariant direction. The nonvanishing result still excludes `s=1`. The larger unchanged library audit is carried from the previous report, not represented as freshly reopened in full.

**Supplier resolution and ownership.** The citation resolver was rerun: zero unresolved roadmap citations; its 55 library-name leads mostly denote this roadmap's definitions or named supplier targets. Exact current content was additionally checked for the findings: LFunctions layers 5 and 7 (README:930,1441; `heckeLFunction_ne_zero_of_one_le_re`, Suggested.lean:2680); ReductiveGroups layer 2; LocalFieldsRamification layers 0 and 1; RepresentationTheory/CompactGroups layer 5; AlgebraicTopology stage 5 item 4 and stage 6; FuchsianOrbifolds main layers 1, 4 and 5, compared with its supplied open revision; ReductiveGroupsPartII RG2.0 analytic charts (README:640); DiophantineApproximationAndTranscendence §2.5 relative normalization (README:1357–1373); SmoothRepresentationsOfLocalGroups SR.1.1 (*a-valued-haar-measure*, README:1036); and OrthogonalTamagawaAndLatticeMass's AA.1–4 consumption (README:11). These are 11 roadmaps checked directly, in addition to the resolver's name checks. The untouched contracts' detailed previous audit is carried forward.

The required object search was run through `roadmaps grep` for the height transport, local analytic charts, Hecke nonvanishing and quaternion class sets. The first three still have the owners above. The index repeats the quaternion overlap identified by previous R07. AA.5.3's derivation from its own class-number and discreteness theorems still makes AA the earlier owner, so no duplicate implementation is requested here. QuaternionicModularForms has no supplied checkout in this round: its full current ownership contract was not independently re-read, and that external repair remains for its own review. Ownership of unchanged targets against all other open work is inherited, not a new exhaustive search.

**Headline inventory.** The unchanged file states restricted and convergent Haar products; restricted-product realization; homogeneous quotient integration; arithmetic covolume, class-number, finite-volume and compactness criteria; real GLₙ reduction; simply connected weak and strong approximation; neat-level existence and covering maps; Hasse–Schilling–Maass; compact idele classes modulo squares; two compact Fourier limits; the GL₁ torus homeomorphism; and the GL₂ upper-half-plane decomposition. This is 20 theorem declarations. The module docstring names the remaining headlines and missing carriers: Tamagawa measures and scalar restriction; Siegel covering, overlaps, cusps and subgroup containment; Weil restriction; disconnected finite-volume criteria; torsor Hasse principle; GL₁ component/cohomology comparisons; and the GL₂ Riemann-surface comparison. The previous headline-completeness assessment is carried forward; no changed headline requires a new replacement signature.

**Source sample.** All 15 newly seeded targets are in unchanged passages, so the incremental sample intersects the diff in zero targets. No source fetch or manifest edit was performed. The following is the previous report's source evidence, carried forward explicitly; it is not a claim that these texts were fetched again.

| Target | Text, locator, result |
|---|---|
| 0.1 Borel structure, 0.2 level measures, 0.4 adeles | Sutherland lines 285–309 (p. 6): local normalizations `μ_v(𝒪_v) = 1`, Lebesgue, `2 μ_ℂ`; box measure with `B_v = 𝒪_v` for almost all `v` and finite masses; Haar by uniqueness. Supports *level-measure* and the additive normalization; second countability and the idele measure are not there (r5 R02). |
| 0.2 restricted Haar product, Fubini, unimodularity | Borel lines 655–678 (Lemma 5.5, pp. 20–21): unimodularity equivalences; the product of local measures with convergence factors is delegated to Weil. Secondary; the primary [PRR] Lemma 3.63 is paywalled. |
| 1.1 integral models, 1.2 restricted product | Conrad lines 232–246 (Thm 3.4, p. 5: spreading out, uniqueness of descents), 253 (Rem. 3.5, p. 6), 281–291 (Thm 3.6, p. 6: bijection onto `∏_{v∈S} X(F_v) × ∏_{v∉S} X(𝒪_v)`, homeomorphism for affine `X`), 53 (Prop. 2.1, p. 2), 115 (Ex. 2.3, p. 3), 452 (Ex. 4.2, p. 9). All as cited. |
| 2.2 parabolic modulus | Arthur lines 1338–1351 (§5, p. 25): roots of `A_P` on `𝔫_P`, `ρ_P`, non-unimodularity of `P(𝔸)`; Casselman line 579 (§1.5, p. 16) defines `δ_P`. The displayed relation between left and right Haar measures on p. 25 has its exponent reversed (Source issues); the README's own convention is the correct one. |
| 2.5 scalar Jacobians, Tamagawa | Rosengarten lines 47–56 (§1, p. 2: normalizations `𝒪_v` mass 1, `dx`, `\|dz ∧ dz̄\|` giving `ℂ/ℤ[i]` mass 2, convergence factors), 87 (p. 3, `τ(G) = vol G(k)\G(𝔸)^1`), 1017–1025 (Lemma 3.5, p. 26). Gordon line 117 (eq. (1), p. 3), 1626 (eq. (48), p. 32). Dudas–Michel lines 1239–1247 (Prop. 7.12(iii), p. 27), 1278–1279 (Prop. 7.14, p. 28; missing absolute value, Source issues). Marzec–Neururer lines 2562 (Prop. 5.10, p. 61), 2583 (Def. 5.11, p. 62), 2599 (Rem. 5.12), 2625–2637 (Thm 5.14, pp. 62–63), 2808–2815 (Thm 5.20, Cor. 5.21, p. 67). |
| 3.1 Iwasawa integration | Arthur lines 1700–1727 (§7, p. 32): `∫_K ∫_{M_P} ∫_{N_P} f(mnk) dn dm dk` with `K` and `N_P(ℚ)\N_P(𝔸)` of volume 1, over `ℚ`; 744–764 (§3, p. 16: `H_G`, `G(𝔸)^1`); 1310 ((5.1), p. 24); 2044 (Thm 8.1, p. 37). Borel–Tits lines 1711 (5.3, p. 96), 1792–1802 (5.8–5.9, p. 98), 1832 (5.12, p. 99). |
| 3.4 adelic reduction | Borel lines 608–618 (Thm 5.1, p. 19: finitely many double cosets for any algebraic matric group), 679–695 (Thm 5.6, p. 21), 716–733 (Thm 5.8, p. 22: `G(𝔸)^1/G_k` finite measure, compact iff every unipotent rational element lies in the radical), 545 (Thm 4.5, p. 17), 581 (Thm 4.6, p. 18), 522–541 (Lemmas 4.3–4.4, p. 17), 300 (Prop. 2.2, p. 11), 363–372 (Cor. 2.5, Prop. 2.7, p. 13), 636–645 (5.3–5.4, p. 20), 734 (Lemma 5.9, p. 22), 853–862 (7.2–7.3, p. 25). Milne lines 1483–1486 (Thm 3.3(a), p. 33), 2475 (Lemma 5.12, p. 57), 2486–2500 (Lemma 5.13, p. 57). Rapinchuk lines 740–781 (§2.6, p. 16). |
| 3.7 containment and orbit maps | Orr lines 656–661 (Thm 4.1, p. 15), 685–699 (§4.A, p. 16), 715–767 (Lemmas 4.2–4.5, pp. 17–18), 791–801 (Lemma 4.6, p. 19), 817–868 (Prop. 4.7, Lemmas 4.8–4.9, pp. 20–21), 924–951 (Lemmas 4.10–4.11, pp. 22–23), 984–1001 (Lemmas 4.12–4.13, p. 24), 1010–1016 (Prop. 4.14, p. 24), 192–238 (§§2.A–2.B, Lemma 2.1, pp. 5–6). BKT lines 358–366 (Def. 2.3, Lemma 2.4, p. 8), 346 ((2.2)), 426 ((2.4), p. 9), 378–392 (Prop. 2.7, p. 9), 810–822 (Def. 4.11, §4.5, pp. 17–18), 210 (Remarks 1.4, p. 5). BKT erratum lines 11 (§1.1, p. 1), 50 (Rem. 1.1, p. 2), 72–99 (Thm 1.2 and proof, pp. 2–3: cites Orr–Schnell Thm 1 “provided `K_H ⊂ K_G` and `θ_G` stabilizes `𝔤′`”), 121–126 (§1.5, p. 3), 133 (§1.6.1, p. 4). Orr–Schnell itself is paywalled. |
| 4.1 weak approximation, torsors | HW lines 261 (§1, p. 6: weak approximation as density in `∏_{v∈Ω} X(k_v)`), 872 (Thm 6.1, p. 21), 911–916 (Lemma 6.3 and property (⋆)). [PR94] Thms 6.4, 6.6, 7.8 and Prop. 6.17 are paywalled (locator only). |
| 4.2 strong approximation | Rapinchuk lines 565–571 (Thm 2.3, p. 12: iff simply connected and `G_S` noncompact), 578–596 (Remark 1, p. 12), 436–440 (Prop. 2.1, p. 9), 744–759 (Lemma 2.7, p. 16), 96 (Lemma 1.2, p. 3), 542–554 (§2.3, p. 11). Arthur lines 539–546 (Thm 2.1, p. 12), 5167 (§16, p. 89, quasi-split off `S_ram`). Platonov 1969 and the addendum could not be fetched (Mathnet timed out). |
| 4.3 neat levels | Milne lines 1514–1520 (p. 34, definition of neat), 1521–1525 (Prop. 3.5, p. 34: neat finite-index congruence subgroup), 1500 (Ex. 3.4), 1845–1859 (§4, p. 42, congruence subgroups), 1911 (Prop. 4.1, p. 43), 2658–2668 (Lemma 5.21, p. 61), 2579 (Thm 5.17, p. 59), 2462 (Lemma 5.11, p. 56), 686 (Thm 1.16, p. 15), 2725–2730 (p. 63, `π₀`). |
| 4.7 Fourier limits, 4.6 squares | Khayutin lines 912–917 (Def. 3.1, p. 22: `G_res` compact abelian), 1001–1008 (Prop. 3.6, p. 24), 1011–1045 (Rem. 3.7 and proof, p. 25: compactness of `ℚ^×\𝔸^×/𝔸^{×2}`, Chabauty limit of kernels of distinct quadratic characters), 653 (§2.3, pp. 15–16). The README's Fourier route is its own, as it says. |
| 5.1 `GL₁` | CG lines 3526–3530 (§8.2, p. 77, `ℓ₀ = r₁ + r₂ − 1`), 3568–3576 (p. 78: `Y`, `Y_Q`, `U_Q` with the index-`pⁿ` subgroup at `v ∈ Q`, `X_Q`), 3579–3592 (p. 79: `A_∞^0`, the component-group sentence, `(S¹)^{r₁+r₂−1} × ℝ`, `H^0 = ℤ_p[RCl(Q)/pⁿ]`, Hecke and diamond operators). |
| 5.3 definite quaternions | Loeffler lines 691–704 (Assumption 3.1.3, Prop. 3.1.4, p. 15: for `G` compact modulo centre at infinity, `K ∩ Z(G)(F)` has finite index in `K ∩ G(F)` for compact open `K`). Voight is paywalled for the service (see Not verifiable); the Hurwitz facts used (24 units, one class, traces in `{−2,…,2}`) were recomputed below. |

**Adversarial table.** Every inherited row below cites [r5](packages/AdelicAlgebraicGroups/reports/PRREVIEW-AdelicAlgebraicGroups~5.md). The mathematical statements are unchanged; the inherited numbers are evidence from that review, not a fresh full review. Its stale Lean line references have been corrected where noticed. Additional rows supply explicit values for the current gate findings and the two sampled sections not separately named in that table.

| Statement | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| 0.2 `exists_unique_haarProduct` (Lean:69) | `ι = ∅`; `ι` finite with `C₂ × C₃` counting; one `B i = ℝ` noncompact of infinite mass | Empty product: box is `univ`, mass `∏ᶠ ∅ = 1`, Dirac; `C₂ × C₃`: full box 6, six singletons 1 each, sum 6; noncompact exceptional factor: determining box uses a compact `C_{i₀}` with finite positive mass, so the Haar scalar is pinned | Keep ; carried from [r5](packages/AdelicAlgebraicGroups/reports/PRREVIEW-AdelicAlgebraicGroups~5.md) |
| 0.3 `exists_unique_convergentHaarProduct` (Lean:84) | `a_i = 1 − 1/(i+2)²`; `S = ∅`, all `a_i = 1`; `T ⊂ T′` consistency | Partial products → 1/2; tail after the first factor 2/3 and `(3/4)(2/3) = 1/2`; all `a_i = 1` gives `∏ʳ μ_i` with `∏' = 1`; enlarging `T` to `T′` multiplies the finite part by `∏_{T′∖T} a_i` and divides the tail by the same, equal | Keep ; carried from [r5](packages/AdelicAlgebraicGroups/reports/PRREVIEW-AdelicAlgebraicGroups~5.md) |
| 0.4 additive normalization | `K = ℚ`; imaginary quadratic unit square | `[0,1) × ∏ ℤ_p` mass 1; `2 dx dy` gives the unit square mass 2, `dx dy` gives 1; Rosengarten line 54 takes `ℂ/ℤ[i]` mass 2, same convention | Keep ; carried from [r5](packages/AdelicAlgebraicGroups/reports/PRREVIEW-AdelicAlgebraicGroups~5.md) |
| 0.4 idele normalization Check | `K = ℚ`, `x₂ ∈ 1 + 4ℤ₂`, odd `x_p ∈ ℤ_p^×`, `x_∞ ∈ [1, e]` | `(1 − 1/2)⁻¹ · 4⁻¹ · 1 = 1/2`; without the factor at 2: 1/4 | Keep; locator r5 R02 ; carried from [r5](packages/AdelicAlgebraicGroups/reports/PRREVIEW-AdelicAlgebraicGroups~5.md) |
| 1.1 `IntegralModel.localPoints` | `G_a` with `X ↦ pT`, `v ∣ p` | Integral points `{a : pa ∈ ℤ_p} = p⁻¹ℤ_p ⊋ ℤ_p`; standard model gives `ℤ_p`; the set of integral-valued points is already a subgroup (comultiplication and antipode are integral on the model), so `Subgroup.closure` adds nothing | Keep ; carried from [r5](packages/AdelicAlgebraicGroups/reports/PRREVIEW-AdelicAlgebraicGroups~5.md) |
| 1.2 `exists_restrictedProductEquiv` (Lean:210) | `G_a` over ℚ, exceptional prime 2 | `(1/2 at 2, 0 elsewhere)` admitted; `1/p` at every prime excluded; coordinate equation `(e x v).ofConv h = (x.ofConv h) v` is Conrad's projection map | Keep ; carried from [r5](packages/AdelicAlgebraicGroups/reports/PRREVIEW-AdelicAlgebraicGroups~5.md) |
| 2.1 `normOne` | `G_m/ℚ`, idele `(p at ∞, p at p, 1 elsewhere)`; `SL₂` | Norm `p · p⁻¹ = 1`, in `normOne`, archimedean component not of norm 1; `GroupLike` of `O(SL₂)` trivial so `normOne = ⊤` | Keep ; carried from [r5](packages/AdelicAlgebraicGroups/reports/PRREVIEW-AdelicAlgebraicGroups~5.md) |
| 2.2 modular function and conventions | Borel of `GL₂`, `p = n(x)m(a)`, `a > 0` | Left Haar `da dx/a²`, right Haar `da dx/a` (both checked by substitution); right translation by `diag(2,1)` pushes the left measure to `2 ·` itself, so Mathlib's `Δ(diag(2,1)) = 2 = δ_P`; `dμ_ℓ = δ_P⁻¹ dμ_r` as the Conventions state; in `mn` coordinates `d_ℓ = dm dn`, matching Arthur's `f(mnk) dn dm dk`; Arthur's p. 25 relation `d_ℓ = e^{2ρ(H_P)} d_r` would give `da dx`, which is not left invariant | Keep; Source issues ; carried from [r5](packages/AdelicAlgebraicGroups/reports/PRREVIEW-AdelicAlgebraicGroups~5.md) |
| 2.2 `exists_unique_quotientMeasure` (Lean:234) | `H = ⊥`; `H = ⊤`; `C₂ ⊂ C₄` counting; `SL₂(ℝ) ⊃` Borel | `⊥`: `ν = μG / μH({1})`; `⊤`: point mass `c` with `μG = c μH`; `C₂ ⊂ C₄`: `f = 1` gives 4 = inner 2 × quotient 2; Borel: `Δ_G = 1 ≠ Δ_B`, hypothesis fails, no invariant measure on `ℙ¹(ℝ)` | Keep ; carried from [r5](packages/AdelicAlgebraicGroups/reports/PRREVIEW-AdelicAlgebraicGroups~5.md) |
| 2.4 Weil volume, corrected volumes | `GL₂`, `q = 2` | `#GL₂(𝔽₂) = 6`, `6/16 = 3/8`; `λ = 2`, `2 · 3/8 = 3/4 = 1 − 2⁻²`; rank 0: empty product 1 versus the GL correction `2` | Keep ; carried from [r5](packages/AdelicAlgebraicGroups/reports/PRREVIEW-AdelicAlgebraicGroups~5.md) |
| 2.4 finite reductive orders | split and nonsplit rank one at `q = 2`; `SL₂/𝔽₂` | `\|2 − 1\| = 1`, `\|−2 − 1\| = 3` (the source's signed determinant gives `−3`); `2 · 1 · (1 + 2) = 6 = #SL₂(𝔽₂)` | Keep; Source issues ; carried from [r5](packages/AdelicAlgebraicGroups/reports/PRREVIEW-AdelicAlgebraicGroups~5.md) |
| 2.5 scalar Jacobian | `ℚ(i)/ℚ`, basis `(1, i)`, complex place | Real determinant of `(x, y) ↦ x + iy` is 1, `b = 1`, `j = 2⁻¹`; `\|d_ℚ\|^{1} \|d_{ℚ(i)}\|^{−1/2} = 1/2`, agreeing with the global formula `\|d_F\|^{[E:F]/2} \|d_E\|^{−1/2}` | Keep ; carried from [r5](packages/AdelicAlgebraicGroups/reports/PRREVIEW-AdelicAlgebraicGroups~5.md) |
| 3.1 Iwasawa order and density | `GL₂`, `m = diag(2,1)`, `n = n(x)` | `mnm⁻¹ = n(2x)`, `d(mnm⁻¹) = 2 dn`, `δ_P(m) = 2`; Arthur's `∫ f(mnk) dn` becomes `∫ f(n′mk) · 2⁻¹ dn′`: `δ_P(m)⁻¹` in `nmk` order as the README states | Keep ; carried from [r5](packages/AdelicAlgebraicGroups/reports/PRREVIEW-AdelicAlgebraicGroups~5.md) |
| 3.2 `IsReduced`, `exists_reduced_GLZ` (Lean:337, 343) | `n = 0`; `n = 1`; `diag(4,1)` versus `diag(1,4)`, `C = 2` | `n = 0`: conditions (1), (2) vacuous, (3) `1 < C` so `C = 2` works; `n = 1`: `x < 2x`; `diag(4,1)`: `4 < 2 · 1` false; `diag(1,4)`: `1 < 8` true; Minkowski-reduced forms satisfy `\|b_ij\| ≤ b_ii/2`, `b_ii ≤ b_jj`, `∏ b_ii ≤ c_n det`, so some `C` works | Keep ; carried from [r5](packages/AdelicAlgebraicGroups/reports/PRREVIEW-AdelicAlgebraicGroups~5.md) |
| 3.4 `arithmetic_finite_volume_iff` (Lean:279) | trivial group; `G_m/ℚ`; `SL₂/ℚ`; `μ₂` | trivial: `D = univ`, mass finite, `GroupLike F F` subsingleton; `G_m`: `Γ = {±1}`, `{±1}\ℝ^×` infinite, `GroupLike = ℤ`; `SL₂`: finite, no characters; `μ₂` has `GroupLike ≅ ℤ/2` and finite quotient, excluded by connectedness inside `reductiveCommHopfAlgProperty` | Keep ; carried from [r5](packages/AdelicAlgebraicGroups/reports/PRREVIEW-AdelicAlgebraicGroups~5.md) |
| 3.4 `finite_classes` (Lean:293) | `G_a`, `G_m` over ℚ at full level; `U = {1}` | `𝔸_f = ℚ + ℤ̂`, one class; `ℚ^×\𝔸_f^×/ℤ̂^×` one class; `U = {1}` is not open and the class set is uncountable | Keep ; carried from [r5](packages/AdelicAlgebraicGroups/reports/PRREVIEW-AdelicAlgebraicGroups~5.md) |
| 3.4 `exists_fundamentalDomain_normOne_lt_top`, `finite_volume_iff` (Lean:302, 311) | `G_a`; `G_m`; `G_a ⋊ G_m` | `𝔸/F` compact; `F^×\𝔸^1` compact, `F^×\𝔸^×` infinite volume, `X* = ℤ`; `ax+b`: `X* = ℤ`, quotient surjects onto `F^×\𝔸^×`, infinite; norm-one quotient fibres over compact `F^×\𝔸^1` with compact fibre `𝔸/F` | Keep ; carried from [r5](packages/AdelicAlgebraicGroups/reports/PRREVIEW-AdelicAlgebraicGroups~5.md) |
| 3.4 `exists_compact_normOne_iff` (Lean:321) | `G_m`; `SL₂`; `GL₂` cocharacter `X₁₁ ↦ T` | `F^×\𝔸^1` compact and every `T ↦ T^k` central; `diag(t, t⁻¹)` noncentral and `SL₂(F)\SL₂(𝔸)` noncompact; `diag(2,1) · n(1) = [[2,2],[0,1]]`, `n(1) · diag(2,1) = [[2,1],[0,1]]` | Keep ; carried from [r5](packages/AdelicAlgebraicGroups/reports/PRREVIEW-AdelicAlgebraicGroups~5.md) |
| 3.5 heights | `GL₁` point 2 over ℚ, then quadratic `E` | Tuple `(2, 1/2)`: archimedean `√(4 + 1/4) = √17/2`, 2-adic `max(\|2\|₂, \|1/2\|₂) = 2`, product `√17`; relative height over `E`: `17`; absolute `√17` | Keep ; carried from [r5](packages/AdelicAlgebraicGroups/reports/PRREVIEW-AdelicAlgebraicGroups~5.md) |
| 3.7 Siegel torus intersection | `G = SL₂`, `H = {[[a,−b],[b,a]] : a² + b² = 1}`, standard triple | `diag(t, t⁻¹) ∈ H` iff `b = 0`, `a = t = t⁻¹`, so `S_G ∩ H = μ₂` while `S_H = 1`; `H(ℝ) = SO₂ = K_G`; Cartan involution fixes `H`; the README asserts only `S_H ⊆ S_G` and names the finite components | Keep; Source issues (Orr) ; carried from [r5](packages/AdelicAlgebraicGroups/reports/PRREVIEW-AdelicAlgebraicGroups~5.md) |
| 3.7 tilted and twisted examples | `x = 2`; `η diag(2,1,1/2) η⁻¹` | `[[2, 1/2 − 2],[0, 1/2]] = [[2, −3/2],[0, 1/2]]`, image `(1 − y) + iy` at `y = 1/4`: `3/4 + i/4` lies on the ray; `(ηᵀη)₁₃ = (3/2)(−1/2) + (−1/2)(3/2) = −3/2` | Keep ; carried from [r5](packages/AdelicAlgebraicGroups/reports/PRREVIEW-AdelicAlgebraicGroups~5.md) |
| 4.1 `HasWeakApproximation` (Lean:365) | `μ₂` at `{∞, 2}`; empty `S`; `G_m` at `{∞,2}` | Diagonal image `{(1,1),(−1,−1)}` not dense in `{±1}²`; empty product is a point; `ℚ^×` dense in `ℝ^× × ℚ₂^×` by field weak approximation and the open unit set | Keep ; carried from [r5](packages/AdelicAlgebraicGroups/reports/PRREVIEW-AdelicAlgebraicGroups~5.md) |
| 4.1 torsor convention | constant `S₃`, `g = (12)`, `h = (13)` | swapped rule: `(gh)·x = (132)` versus `g·(h·x) = (123)`; inverse rule: both `(13)(12)` | Keep ; carried from [r5](packages/AdelicAlgebraicGroups/reports/PRREVIEW-AdelicAlgebraicGroups~5.md) |
| 4.2 `HasStrongApproximation`, `hasStrongApproximation_of_simplyConnected` (Lean:358, 383) | `SL₂`, `S_f = ∅`; `SL₂ × SL₁(D)`, `D` definite over ℚ; trivial `G` | `SL₂(ℝ)` noncompact: hypothesis holds for the only nontrivial quotient; the product has the compact quotient `SL₁(D)(ℝ)`, hypothesis fails, no vacuous truth; trivial `G`: every `Q` with injective `f` is trivial, set is `univ`, dense | Keep ; carried from [r5](packages/AdelicAlgebraicGroups/reports/PRREVIEW-AdelicAlgebraicGroups~5.md) |
| 4.3 `IsNeatAut`, torsion-free balls | `(0 −1; 1 1)·2`; `p = 3`, `a = 1`; `p = 2`, `a = 2`; `−1` at `p = 2` | eigenvalues `2ζ₆^{±1}`, ratio `ζ₃`, not neat; `3⁻¹ < 3^{−1/2}`; `2⁻² < 2⁻¹`; `\|−1 − 1\|₂ = 1/2` on the boundary, order two | Keep ; carried from [r5](packages/AdelicAlgebraicGroups/reports/PRREVIEW-AdelicAlgebraicGroups~5.md) |
| 4.4 `isCoveringMap_levelMap` (Lean:473) | `G_a/ℚ`, `U = ℤ̂`, `U′ = Nℤ̂`, `K∞ = {0}`; `GL₁/ℚ`, `U(3) ⊃ U(9)`, `K∞ = ℝ_{>0}` | `X_U = ℝ/ℤ`, `X_{U′} = ℝ/Nℤ`, degree `N = [ℤ̂ : Nℤ̂]`, `hKH` vacuous (no characters), `hK` is compactness of `{0}`; `(ℤ/3)^× → (ℤ/9)^×` sizes 2 and 6, fibres 3 | Keep ; carried from [r5](packages/AdelicAlgebraicGroups/reports/PRREVIEW-AdelicAlgebraicGroups~5.md) |
| 4.4 real quadratic non-covering Check | `ℚ(√2)`, `η = (1+√2)⁴ = 17 + 12√2` | `(1+√2)² = 3+2√2 ≢ 1 mod 4`, `η ≡ 1 mod 4`, so `F^× ∩ U = ⟨η⟩`; `Λ ∩ {sum = 0}`: `a + b(1+√2) = 0` forces `a = b = 0`; `(L, −L) + (√2L, L) = (1+√2)(L,0) ≡ √2 (L,0)`, irrational rotation | Keep ; carried from [r5](packages/AdelicAlgebraicGroups/reports/PRREVIEW-AdelicAlgebraicGroups~5.md) |
| 4.5 Hecke Check | `K₀(p)`, `I` Iwahori | reductions of `I diag(p,1) I` have zero first column; of `I diag(1,p) I` zero bottom row; disjoint | Keep ; carried from [r5](packages/AdelicAlgebraicGroups/reports/PRREVIEW-AdelicAlgebraicGroups~5.md) |
| 4.6 `nrd_image` (Lean:499) | Hamilton over ℚ; split `(1,1)` over ℚ; `ℍ[F,a,b]` with real `τ` splitting | `a = b = −1`, condition `c > 0`, norms are sums of four squares; split: no real `τ` with both negative, every `c ≠ 0` a norm (`Nrd(diag(c,1)) = c`); `\|c\|_ℂ = \|c\|²` not involved | Keep ; carried from [r5](packages/AdelicAlgebraicGroups/reports/PRREVIEW-AdelicAlgebraicGroups~5.md) |
| 4.6 `compactSpace_ideleClassGroup_quotient_squares` (Lean:509) | `ℚ`, idele `−1` at 3 | `q y² = x` forces even valuations and `q > 0`, so `q = r²`, then `−1 = (r y₃)²` in `ℚ₃`, impossible; class survives; positive scalar `t` is `(√t)²` | Keep ; carried from [r5](packages/AdelicAlgebraicGroups/reports/PRREVIEW-AdelicAlgebraicGroups~5.md) |
| 4.7 Fourier limits (Lean:525, 536) | `C = ∏_ℕ {±1}`, coordinate characters | kernel masses 1/2, `2 · restrict` probability; `∫ ψ_J dm_n = 1` iff `J ∈ {∅, {n}}` else 0, so each coefficient is eventually the Haar one; a repeated character keeps coefficient 1 | Keep ; carried from [r5](packages/AdelicAlgebraicGroups/reports/PRREVIEW-AdelicAlgebraicGroups~5.md) |
| 5.1 `levelQ`, `XQ`, torus theorem (Lean:582) | `ℚ`; imaginary quadratic; `ℚ(√2)`, `Q = ∅`; `ℚ`, `Q = {3}`, `p = 2`, `n = 1` | rank 0, point; rank 0, point; `ε = 1+√2` has norm `−1`, `Γ⁺ = ⟨ε²⟩`, `log ε² = (2 log ε, −2 log ε)`, index 2 in `log⟨−1, ε⟩`; `4 = 2²` with `2 ∈ ℤ₃^×` admitted, `2` is a nonsquare mod 3 excluded; `N(v) ≡ 1 mod p` excludes `v ∣ p` | Keep ; carried from [r5](packages/AdelicAlgebraicGroups/reports/PRREVIEW-AdelicAlgebraicGroups~5.md) |
| 5.2 `exists_componentHomeomorph` (Lean:632) | `U = GL₂(ℤ̂)`; `K(3)` | `GL₂(ℚ)⁺ ∩ GL₂(ℤ̂) = SL₂(ℤ)`, one component; `det K(3) = 1 + 3ℤ̂`, `(ℤ/3)^×` two components, each `Γ(3)\ℍ` | Keep ; carried from [r5](packages/AdelicAlgebraicGroups/reports/PRREVIEW-AdelicAlgebraicGroups~5.md) |
| 5.3 class sets and stabilizers | Hamilton at Hurwitz level; `U₁(9)` | 24 units, `Z = {±1}`, quotient 12, weighted sum `1/12`; primitive rows mod 9: `81 − 9 = 72`; `ℚ^× ∩ U₁(9) = 1` since `−1` has bottom row `(0,−1)`, central index 2; `r(γ − 1) ≡ 0 mod 9` with `r` primitive forces `det(γ − 1) ≡ 0 mod 9` (Smith form), `2 − trd γ ≡ 0 mod 9` with traces in `{−2,…,2}` forces `γ = 1`; `3 = (72/2)(1/12)` | Keep ; carried from [r5](packages/AdelicAlgebraicGroups/reports/PRREVIEW-AdelicAlgebraicGroups~5.md) |
| 5.3 compactness cannot be dropped | Hamilton, `U = (D ⊗ 𝔸_f)^×` | `1 + ni` pairwise non-proportional over ℚ, `D^×/ℚ^×` infinite | Keep ; carried from [r5](packages/AdelicAlgebraicGroups/reports/PRREVIEW-AdelicAlgebraicGroups~5.md) |
| 2.4 Hecke prerequisite (R03) | χ₄; modulus enlarged from 4 to 12; s=1 | Primitive value `π/4`; Euler correction `1+1/3=4/3`; corrected value `π/3`; pinned substitute's `s≠1` is false | Upward contract remains; the proposed earlier-owner contract includes this case |
| 3.3 closed orbit, lattice and primitive-region definitions | Zero representation; one-dimensional weight-one action; lattice `(1/2)ℤ`; empty translate list | Zero orbit `{0}` is closed; nonzero orbit `𝔾ₘ` in `𝔸¹` omits its closure point 0; `1/2∈(1/2)ℤ`, `1/4∉(1/2)ℤ`; empty union has 0 points | Explicit elementary checks of unchanged sampled definitions; no change |
| 3.6 cusps and deep separation | `SL₂(ℤ)`, standard upper and lower rational parabolics | Primitive pairs give one arithmetic cusp orbit; `z=iy`, `y>1`, has `Im(-1/z)=1/y<1`; generally `Im(-1/z)=y/(x²+y²)≤1/y<1` | Distinct deep cusp regions are disjoint with fixed `SO₂`; no change |
| Current build and module-header probe (R01) | Actual file; scratch copy with `module` and all signature checks | Targeted build: exit 0, 20 sorry warnings plus 1 module warning; direct Lean: exit 0, 20 sorry warnings; header/signature probe: exit 0, 20 sorry warnings | Gate still fails; header preserves elaboration |
| Fuchsian supplier selection (R02) | Main version versus supplied open revision | Main reverse edges: 0; open revision reverse-edge mentions: 2; using main removes this two-node cycle | Gate diagnostic disputed; no author edit to the valid main citation |
| Finite-index Haar measure name (R05) | `C₂ ≤ C₄`, counting | Index 2; subgroup mass 2; total mass 4; `2·2=4`; qualified declaration elaborates, bare declaration yields 1 error | Replace/delete bare duplicate |

**Gate and dependency output.** The worker's build-aware result is reproduced here (all text scans pass):

```text
gate AdelicAlgebraicGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=2 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=1 FAIL
```

The gate rerun without a build stage gives the same two dependency failures and all other checks zero. The explicit movable dependency check reports:

```text
not movable: AdelicAlgebraicGroups consumes LFunctions (#268) and is consumed by OrthogonalTamagawaAndLatticeMass (#116), which comes first: moving AdelicAlgebraicGroups after LFunctions would put a supplier after a consumer, a cycle through AdelicAlgebraicGroups
UPWARD: AdelicAlgebraicGroups (#20) -> LFunctions (#268) at README lines [110, 262, 500, 2313]
CYCLE among: AdelicAlgebraicGroups, FuchsianOrbifolds
depcheck: 199 roadmaps, 1270 edges, 2 problem(s)
```

R03 records the genuine upward edge; R02 records why the cycle line is a false positive under this brief. All six previously reported upward edges to roadmaps on main have disappeared. No acceptance is issued while the gate fails. Of the three recorded P1/P2 findings, one is a disputed checker result and one is a build-warning policy failure; R03 is the remaining substantive supply-order defect.

## Not verifiable

The following limitations are inherited from [r5](packages/AdelicAlgebraicGroups/reports/PRREVIEW-AdelicAlgebraicGroups~5.md); there are no changed source passages to reopen in this incremental review. These are the previous review's access results, not newly attempted downloads:

- Platonov–Rapinchuk–Rapinchuk 2023, the cited restricted-measure, reduction and approximation locators: Cambridge paywall; locator-only evidence.
- Platonov–Rapinchuk 1994, the cited approximation and torsor theorems: Academic Press paywall.
- BHC 1962, §§1.6–1.9, 3.8, 5.3–5.4 and the cited theorems: JSTOR paywall.
- Voight, Lemma 11.2.1 and Proposition 11.3.4: the previous service request rejected the Springer DOI and the attempted author URL returned 404. The numerical Hurwitz checks are inherited in the table.
- Orr–Schnell 2023, Theorem 1 and related locators: the previous service did not classify the publisher host; indirect checking used Orr v6 and the BKT erratum.
- Platonov 1969 and its addendum: previous Mathnet requests timed out.
- Schneider's cited p-adic Lie theory and BHV Appendix B.1: not fetched in the previous review.
- Stacks Tags 0245, 04TY, 04SK: not re-fetched in the previous review or this incremental one.
- The previous table does not individually certify every locator in the new 15-target seeded list, notably all of §§3.3 and 3.6. With zero changed passages, the instructed incremental pass carries that evidence and its limits forward; the new elementary table rows are not source certification.
- Full current ownership verification of QuaternionicModularForms is unavailable within the supplied checkout set; only its current index hits and the previous report were used. No new finding is assigned to this folder on that basis.

## Source issues

No new source text was inspected this round. These four issues are carried from r5, whose unchanged numerical witnesses are retained in the adversarial table:

- **Error** in Orr at Lemma 4.6 and Theorem 4.1, printed pp. 19 and 15: the source says the ambient Siegel torus intersects the subgroup in its split torus; it should be the identity component of that intersection, which can have extra finite components; affects a stated result.
- **Misprint** in Arthur at §5, left/right Haar comparison, printed p. 25: the source says the left measure is the right measure multiplied by the positive modular exponential; it should be multiplied by its reciprocal; affects nothing.
- **Misprint** in Dudas–Michel at Proposition 7.14, printed p. 28: the source says the torus order is the signed determinant of Frobenius minus identity; it should be the absolute value of that determinant; affects nothing.
- **Error** in CG at §8.2, printed p. 79: the source says the component group is the maximal exponent-pⁿ quotient of the ray class group; it should retain the full narrow-class contribution, including at empty auxiliary level; affects a stated result.
