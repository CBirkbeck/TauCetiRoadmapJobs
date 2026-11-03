# Review of CharacteristicClasses (pull request #1654 at b5e148d)

**Verdict:** needs changes

The pull request revises a roadmap that is already on main: it adds the general-group lane of C1.1b, C1.1d, C2.3a, C2.6, the L₃ coefficient in C7.1, C7.AdjointHopfObstruction, one theorem in `Suggested.lean` and five companion `.lean` files. The whole folder was reviewed. The gate fails on eight scanners; two findings are blocking (one is the gate's `sorry-data`, one is a second owner for the Lefschetz fixed-point formula). The new mathematics itself checks out: every identity, sign and table entry recomputed below agrees with the README.

## R01 (P1) — `Suggested.lean` carries sorry'd data

Location: `TauCetiRoadmap/CharacteristicClasses/Suggested.lean` lines 44–50 (`noncomputable def trivialDiskSphereRelCW … := by sorry`) and 69–71 (`def trivialThomIso … := by sorry`); lines 53–59 and 75–77 mention them.

Claim: the file states the Thom-isomorphism and disk-bundle-cell targets as definitions whose bodies are `sorry`.

Witness: the gate reports `sorry-data=2` at those two lines; the principles make sorry'd data a blocking finding, and the Lean rules forbid "a `def`, `abbrev`, `instance` or `opaque` whose body is `sorry`, and nothing that mentions one". `trivialThomClass` (line 75) and `trivialDiskSphereRelCW_noCellsBelowRank` (line 53) mention them.

Repair: delete the four declarations `trivialDiskSphereRelCW`, `trivialDiskSphereRelCW_noCellsBelowRank`, `trivialThomIso`, `trivialThomClass`, and `TrivialThomTarget`/`deletedTrivialPair`/`integralCohomologyUnit` if nothing else uses them. The README (C2.0, C2.1) keeps the targets; the module docstring says the Thom isomorphism and the bundle cell structure are not statable at the pins because no Thom-class or bundle-cell carrier exists there. The gate's `sorry-data` count must be 0.

## R02 (P2) — C2.6 plans the Lefschetz fixed-point formula a second time

Location: `TauCetiRoadmap/CharacteristicClasses/README.md` lines 963–984 (`### C2.6`): "Define L(f)=Σ_i(−1)^i tr(f*:…)… prove L(f)=⟨Γ_f*δ_Δ,[M]⟩ … identify the right side with the sum of local signs det(id−df) at fixed points."

Claim: the roadmap owns the Lefschetz number, its graph/diagonal expression and the fixed-point sum.

Witness: MorseNovikov on main, `TauCetiRoadmap/MorseNovikov/README.md` N6 (mapping-torus bullet, lines 499–560): "Construct the Lefschetz fixed-point formula here by simplicial approximation on a smooth triangulation and Hopf's barycentric modification … Compare graph/diagonal intersection using AT 6's orientation local system in the oriented specialization", with the local index `sgn det(1−df)`. Two roadmaps now build one theorem. CharacteristicClasses cannot cite MorseNovikov instead: MorseNovikov N7 consumes MorseTheory M4, and MorseTheory consumes CharacteristicClasses C2 (`TauCetiRoadmap/MorseTheory/README.md` line 69), so a citation would close a cycle.

Repair: cut from C2.6 the definition of L(f), the identity `L(f)=⟨Γ_f*δ_Δ,[M]⟩` and the fixed-point-sign sentence. What is genuinely this roadmap's, `⟨f*e(TM),[M]⟩=deg(f)χ(M)`, is naturality of the Euler class plus `f_*[M]=deg(f)[M]` and belongs as a Check of C2.3, with the constant map on S² (value 0 while the Lefschetz number is 1) as the discriminating example. Record in the scope paragraph that the Lefschetz fixed-point formula is MorseNovikov N6's.

## R03 (P3) — `Suggested.lean` imports

Location: `Suggested.lean` lines 1–12.

Claim/witness: gate `no-import-mathlib=1`, `mathlib-subimports=10`, `imports=1`: the header has ten `import Mathlib.<submodule>` lines and no `import Mathlib`.

Repair: replace lines 1–12 by `import Mathlib` followed by the two `TauCeti.AlgebraicTopology.Cohomology.*` lines, which exist at the pin. The targeted build already passes, so nothing else changes.

## R04 (P3) — residue: anchor tags added by this pull request

Location: README lines 962 and 1844 (`<a id="euler-pullback-and-self-map-graph">`, `<a id="c7-adjoint-hopf-obstruction">`).

Witness: gate `residue=2`; both lines are new in this pull request.

Repair: delete the two tags; headings are addressable without them.

## R05 (P3) — pull-request numbers in the README

Location: README lines 82 and 606 (`PR963`); also pull-request URLs at lines 24 (`pull/1287`), 146 (`pull/437`), 1340 (`pull/949`) and the Mathlib pull-request links at lines 603–604, 611–613 and 684.

Witness: gate `prnum=2`; the house rule is "never by a pull-request number, including for roadmaps still in pull requests".

Repair: name the roadmap and section (DGFloer Layer 1.2; HomotopySpheres §3A/§4A; ClassifyingSpaces; LieHighestWeight L7) and, for Mathlib, the declaration names at the pin or the Tau Ceti target.

## R06 (P3) — commit-pinned repository links

Location: README lines 18, 54, 71, 94, 99, 102, 104, 111, 117, 119, 122, 125, 129, 135, 139, 154, 332, 346, 620, 1177 and the other `blob/<sha>` links the gate lists (27 in all).

Witness: gate `blob=27`.

Repair: link the path on main (`../TopologicalKTheory/README.md`) or name the roadmap and section, as the GeneralizedCohomology and SpinGeometry citations already do in places.

## R07 (P3) — LaTeX delimiter

Location: README line 563, `C^*(A,A\(K intersect A);L|A)`.

Witness: gate `latex=1`: `\(` outside a code span.

Repair: put the display in a code span or write `A \ (K ∩ A)` with a Unicode set-minus.

## R08 (P3) — companion `.lean` files: form and padding

Location: `AdjointHopfTargets.lean`, `BarycentricHopfFieldTargets.lean`, `ClutchingTrivializationTargets.lean`, `JoinActionTargets.lean`, `JoinTruncationTargets.lean`.

Claims and witnesses (all five files elaborate with only `sorry` warnings; the form rules of the brief apply to each listed file):
- Every file imports `Mathlib.<submodule>` lines instead of `import Mathlib`; two carry copyright headers; `ClutchingTrivializationTargets.lean` line 20 opens `namespace CharacteristicClasses.ClutchingTrivialization` without the `TauCetiRoadmap.` prefix.
- Missing docstrings: `TwoMatrix` (Adjoint 17), `reflection` (Clutching 60), `rightLabels`, `leftLabels`, `inverseLabels` (JoinAction 23–33).
- One-tactic probe (scratch copy, elaborated): `reflection_rotation` (Clutching 63) closes with the single tactic `simp [rotation, reflection]`; it also mirrors the README Check `J R(θ) J⁻¹=R(−θ)`. `adjoint_root_identity` (Adjoint 28) is a two-variable polynomial identity that restates the README display `p₁(su(F))=c₁(F)²−4c₂(F)` at the root level (computes a small value). The three proved theorems of `JoinActionTargets.lean` are one-line API facts about `StdSimplex.map`. None of the other sorried statements closed in one tactic (`sum_flagVelocity`, `flagHeight_variance`, `compact_simplex_weights_uniform_prefix`, `traceless_decomposition`, the two gauge theorems).
- The five files are not built by the gate (`lake build …Suggested`), so nothing checks them on push.

Repair: delete `reflection_rotation`, `adjoint_root_identity` and the `JoinActionTargets.lean` API theorems (the README keeps the statements as Checks); move the remaining genuine targets (`traceless_decomposition`, `flagVelocity_eq_zero_iff`, `flagHeight_variance`, `sum_flagVelocity`, `gaugeHomeomorph_classification`, `gaugeHomeomorph_homotopic_iff`, `compact_simplex_weights_uniform_prefix`) into `Suggested.lean` under `/-! ## Layer … -/` comments with docstrings, or delete the companion files; either way the README's backticked file names (lines 280, 304, 486, 928, 1899) change to match.

## R09 (P3) — padding and form in `Suggested.lean`

Location: `Suggested.lean` lines 14–20 (module docstring), 81–82, 99–106, 119–130, 133–134, 161–167, 176–242.

Claim/witness: the file is an API catalogue rather than headline statements. Proved in one tactic or by one library lemma: `pontryaginRootValue_top_eq_euler_sq` (simp), `root_exponential_tensor_product` (one `simp_rw`), `compactCE_degreeOne_sign` (one `exact` of `LieModule.Cohomology.d₁₂_apply_apply_ofTrivial`, Mathlib `Algebra/Lie/Cochain.lean` line 118 at the pin), `compactKoszulGeneratorMap_basis` (simp), `compactExteriorGenerator_square` (simpa with `ExteriorAlgebra.ι_sq_zero`); `compactCE_degreeOne_closed_iff` and `todd_denominator_identity` are short API lemmas; `lSeries_even` is an API lemma (it follows from `bernoulli'_odd_eq_zero`, Mathlib `NumberTheory/Bernoulli.lean`). Definitions no headline needs: `standardCirclePolynomial`, `rationalMultiplicationPullback`, `compactKoszulGeneratorMap`, `compactExteriorGenerator`, `RationalCohomology` (no docstring). The module docstring does not say which headline theorems (Thom isomorphism, universal rings `ℤ[c₁,…,c_r]`, Borel's theorem, e(TM)[M]=χ(M), Chern–Weil comparison) are not statable at the pins and what each lacks.

Repair: delete the listed declarations from `Suggested.lean` (the README keeps them as API bullets and Checks); keep `lSeries_root_coefficient_six` and `twice_even_product_correction_eq_zero`, which state C7.1/C3.3 formulas; rewrite the docstring in the "<title>: target signatures" form naming the unstatable headlines and the missing carriers (characteristic-class, Thom-class and classifying-space carriers).

## R10 (P3) — Tau Ceti declarations cited at a commit later than the pin

Location: README lines 72–80 and 471–474: `TauCeti.TopCat.serreFibrations`, `TauCeti.TopCat.mem_serreFibrations_of_exists_trivialization`, `TauCeti.TopCat.mem_serreFibrations_proj`, "source interfaces at 720bf8c, absent from this repository's a91 pin".

Witness: none of the three names occurs in the pinned Tau Ceti (a91d3aa); the commit 720bf8c exists in the packages checkout and has a91d3aa as an ancestor, so the names are future API. The review rules check library declarations at the pins only.

Repair: cite the Serre-fibration membership as a DGFloer Layer 1.2 target (by name and section), without backticked declaration names, until the pin moves.

## R11 (P3) — sources: an unclassified copy, course-note scans, and targets without locators

Location: README line 1980 (Milnor–Stasheff linked at a GitHub-pages host), line 1893 ("Teichner1086_003 pp5–7"), line 438 ("the sphere exercise"), C2.3a (lines 838–931, no locator), C7.1 L₃ sentence (lines 1806–1811, no locator), C1.1b general lane (lines 276–336, locator only "Milnor, Construction of Universal Bundles, II, §§2–3").

Witnesses: the sources service refuses the Milnor–Stasheff URL ("in no licence class"); the Teichner and Kirby course notes named in the pull-request text are not public sources and the README names a scan by file id; C2.3a and the L₃ derivation cite nothing; Milnor II resolves only to JSTOR (paywalled, so `uncertified`).

Repair: cite Milnor–Stasheff by locator only (or the publisher's page); replace the scan id by a public source or drop it (the mathematics of C7.AdjointHopfObstruction is fully supported by zentner-instanton-sheet2 line 45–61, Exercice 2*); add locators: for C2.3a, Milnor, *Topology from the Differentiable Viewpoint*, §6 (Poincaré–Hopf) and tom Dieck §14.4 for the join; for L₃, Milnor–Stasheff §19 or Hirzebruch, *Topological Methods*, §1.5; for the general Milnor join, tomdieck-at line 14467 (14.4.3 "The Milnor space") in addition to Milnor II.

## R12 (P3) — the HomotopySpheres §4A citation names an unlabelled prefix of a section that cites this roadmap back

Location: README lines 452–455: "Use only HomotopySpheres4A's independent finite SO/quaternion/sphere-LES prefix and TopK T1.5's finite frame-bundle computations."

Witness: HomotopySpheres at its open head (`TauCetiRoadmap/HomotopySpheres/README.md`, "4A early finite orthogonal and sphere-loop comparisons", lines 1259–1340) has one `*Needs:*` line for the whole subsection, and it lists "CharacteristicClasses C7.3 tangent/hyperplane adapter"; HomotopySpheres also consumes CC C1.2b and C6.2–3/C7.3 (its lines 74, 373, 822, 935, 1070). The depcheck reports no problem because the prefix (π₁(SO(r)) from T1.5a's sphere-bundle sequence, S³/{±1}≃SO(3)) does not use C7.3, but the citation is to an unlabelled part of a mutually citing section. HomotopySpheres itself says "the general finite Stiefel calculation is the supplier's".

Repair: cite TopologicalKTheory T1.5a for the sphere-bundle sequence and π₁(SO(r)), and name the quaternion dictionary S³/{±1}≃SO(3) as the only HomotopySpheres input, so the fine-grained direction is visible; π₂(SO(k))=0 then follows from the T1.5a sequences alone (π₂(SO(3))=0 from S³→RP³, surjectivity π₂(SO(k))→π₂(SO(k+1)) for k≥3).

## R13 (P3) — C2.3a is a second proof of C2.3's theorem

Location: README lines 838–931.

Claim: the barycentric field gives `⟨e(TM),[M]⟩=Σ_σ(−1)^(dim σ)=χ(M)`, "Compare with C2.3's diagonal/trace proof after constructing both comparisons."

Witness: C2.3 (lines 823–834) already proves `e(TM)[M]=χ(M)` by diagonal self-intersection and the Künneth trace; MorseNovikov N6/N7 on main plan Hopf's barycentric modification and the vector-field index sum `Σind(V,p)=χ(X)` for every field. The field construction and the index `(−1)^d` are correct (see the table), but as a second route to an owned theorem they add work without a new library statement.

Repair: keep the field, its flag formulas and the index computation as a worked example under C2.3 (the index count on the boundary of a tetrahedron, 4−6+4=2, is a good Check), and drop the sentence claiming a second proof of the Euler formula; or cut C2.3a. Either way, no `*Needs:*` on GT's triangulation remains for C2.3.

## Verified sound

**Gate and direction.** Re-ran the gate at b5e148d: `set_option=0 blob=27 latex=1 tex=0 prnum=2 sorry-data=2 sorry-examples=0 residue=2 private-paths=0 imports=1 mathlib-subimports=10 no-import-mathlib=1 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL`; the worker's run adds `build=0` (the targeted build passes). Depcheck with `--movable`: `depcheck: 205 roadmaps, 1676 edges, 0 problem(s)`; no UPWARD or CYCLE line. `git diff --stat origin/main...HEAD` outside the folder: empty. Pins: Mathlib 6b7abb3c, Tau Ceti a91d3aa (manifest and packages checkout agree).

**Elaboration.** All five companion files elaborate from the worktree with only `declaration uses sorry` warnings (2, 3, 3, 0, 1 respectively). The 29 elaborated signatures of `Suggested.lean` were compared with their README statements; none lost a binder; `lSeries_root_coefficient_six` is universal over `[CommRing A] [Algebra ℚ A]` and all `r`, as C7.1 says ("ranks with fewer than three roots by setting the absent classes to zero": `pontryaginRootValue x 3 = 0` for r<3 since `esymm` of degree 3 on fewer variables is 0).

**Library declarations opened at the pin.** `Convexity.StdSimplex` (Mathlib `Geometry/Convex/ConvexSpace/Defs.lean` 58–64: `weights : X →₀ R`, nonneg, sum 1; `single` 130, `map` 183, `map_map` 216, `total_of_fintype` 93); `LieModule.Cohomology.d₁₂_apply_apply_ofTrivial` (`Algebra/Lie/Cochain.lean` 118); `bernoulli'PowerSeries_mul_exp_sub_one` (`NumberTheory/Bernoulli.lean` 158); `sSetTopAdj` (`AlgebraicTopology/SingularSet.lean`); `MvPolynomial.symmetricSubalgebra`/`esymmAlgEquiv` (`RingTheory/MvPolynomial/Symmetric/*`); `exists_embedding_euclidean_of_compact` (`Geometry/Manifold/WhitneyEmbedding.lean` 131); `Topology.RelCWComplex` (`Topology/CWComplex/Classical/Basic.lean` 99); Tau Ceti `TopPair.ofSubset`, `TopCat.singularCup` (`AlgebraicTopology/Cohomology/Cup.lean` 203), `constSingularCocycle` (`Cohomology/Basic.lean` 170), `HasHomotopyExtensionProperty.image` (`Topology/Homotopy/Extension/Basic.lean` 268), `hasHomotopyExtensionProperty_base` (`Extension/CWComplex.lean` 278), the three `CliffordAlgebra.*Spin*` names (files `Spin/Covering.lean`, `Spin/Connected.lean`, `Spin/SphereSection.lean`). Not at the pin: the three `serreFibrations` names (R10).

**Cross-roadmap citations resolved** (main unless noted): TopologicalKTheory T1 items 1–6, T1.5a, T1.6a–d, T6.4, T7 item 4; AlgebraicTopology Stages 2–8; DGFloer Layer 1.2 and `connectedMapHomologyComparison` (named there as a target); DifferentialGeometry 10.2 Sard; SmoothBundlesConnections B1.4, B2.5, B6.0; ComplexKahlerGeometry K4, K7; GeometricTopology Layer 10 (foliations/Euler class) and Layer 11 (triangulations); SpinGeometry G4.1a; SchubertGeometry S9.6; ReflectionInvariantTheory §4; LieHighestWeight L7 names (`lieChevalleyRestrictionIso_mem_homogeneous_iff`, `killingSymmetricEquiv_cartan_restriction`, `killingSymmetricEquiv_lie`, `lieInvariantSymmetricAlgebra`, `lieCartanRestriction`); CompactGroups Layer 0; ConvexityToric T2; TopologicalSheafCohomology TS1.1; AffineMorseLefschetz A4.0; MorseTheory M5; RiemannianGeometry R3; GeneralizedCohomology G4.0a/G4.0b, whose line 1323 pins `c₂(Cγ_H)=h`, so `⟨u,[HP¹]⟩=1` as C7.AdjointHopfObstruction uses (StringOrientation at its head states the same `+1` and consumes CC); IndexTheory I7 (open pull request head; I7.2 is the signature formula, cited internally there as `σ=⟨p₁,[M]⟩/3`); LieGroupoidsPoisson G1.3a and HomotopySpheres §3A/§4A at their open heads. ClassifyingSpaces on main builds the countable join for discrete groups with the weak topology only, so the general Hausdorff-group lane of C1.1b (strong topology) is not a second owner; Orbifolds on main consumes "C1.1b's Milnor universal bundle". Ownership against open pull requests was checked only in the sibling checkouts this brief lists.

**Sources at their locators.** hatcher-vbkt (printed page = PDF page − 4): §1.2 "Clutching Functions" lines 844–1010, Example 1.10 (canonical line bundle has clutching `z⁻¹` when the inner disk is `D_+`, line 893), Proposition 1.11, 1.14 and the marked ("orientation over one point") hybrid, lines 905, 988–993: supports C1.1d as written. zentner-instanton-sheet2 lines 45–61: Exercice 2*, `p1(su(E))=−4c2(E)+c1(E)²`, parts (a) `su(E)⊗ℂ≅End₀(E)`, `End₀(E)⊕ℂ≅End(E)`, (b) `p₁=−c₂(su(E)⊗ℂ)`: supports C7.AdjointHopfObstruction. tomdieck-at: §14.4 line 14430, 14.4.3 "The Milnor space" line 14467 (strong topology join); §§13.1–13.3 lines 13374–13619; §9.5 line 9942. dupont-ccc: §8 line 3511, Theorem 8.1 (Cartan) line 3514, Proposition 8.3 (Borel) line 3548, the `EG/T→BG` fibre-integration injectivity lines 3806–3862, Appendix line 4110: the "proof spine of Dupont1978 §8" cited in C5.2. dupont-ln: §9 line 2097, §10 line 2343. may-concise: Chapter 16 §2 "Geometric realization" line 5264, §3 "Proofs of the theorems". C1.0, C2.0 and C5a.1–C5a.7 carry no literature locator of their own (R11); their mathematics was checked directly (table).

**Adversarial table.**

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `lSeries = rescale 2 toddSeries − X` is `x coth x` | degrees ≤ 6 | todd `1+x/2+x²/12+…`; rescale 2 gives `1+x+x²/3`; minus `x`: `1+x²/3`; full series `1, 1/3, −1/45, 2/945` (exact, matches `2^{2k}B_{2k}/(2k)!`) | agrees | none |
| `lSeries_root_coefficient_six` | ranks 0–4, six random rational root vectors each, exact arithmetic | coefficient of `T⁶` in `∏ L(x_iT)` equals `(62p₃−13p₁p₂+2p₁³)/945` in every case; r=0 both sides 0; r=1 both `2y³/945`; degree-4 and degree-2 parts `(7p₂−p₁²)/45`, `p₁/3` also agree | true | none |
| `twice_even_product_correction_eq_zero` | general P,Q | `coeff_{2k}(PQ)=Σ_{a+b=2k}P_aQ_b`; terms with `a` odd have `b` odd and `2P_a=0` | true | none |
| C1.1d table `[Sⁿ,GL_k(ℝ)]` | k=1,2,≥3; n=0,1,2; k=0 | S⁰: `π₀×π₀=(ℤ/2)²`; S¹: k=1 `π₁(O(1))=0` so `ℤ/2`; k=2 `ℤ⋊_{−1}ℤ/2` since `JR(θ)J=R(−θ)`; k≥3 `Aut(ℤ/2)=1` so `(ℤ/2)²`; S²: `π₂(SO(k))=0` so `ℤ/2`; k=0 singleton | all nine entries agree | none |
| `JR(θ)J⁻¹=R(−θ)`, `J=diag(−1,1)` | one θ | `JR=[[−c,s],[s,c]]`, `JRJ=[[c,s],[−s,c]]=R(−θ)`; `J⁻¹=J` | true | none |
| Split sequence `1→π_n(G,1)→[Sⁿ,G]→π₀(G)→1`, n≥1 | G=O(2), n=1 | kernel = classes with `f(q)∈G⁰`; injectivity uses the trivial π₁-action on π_n of an H-space; complement = constants; action `[g]·[α]=[gαg⁻¹]` | true | none |
| `[S⁰,G]≅π₀(G)×π₀(G)` | O(1) | 2×2=4 classes | true | none |
| Unmarked bundles over S¹ = conjugacy classes in π₀(G) | general G | clutching pair `(c₀,c₁)`, normalize `c₀=1`, residual `c₁↦a₁⁻¹c₁b₁` with `[a₁]=[b₁]` | true | none |
| Marked bundles over S^(n+1) = `π_n(G,1)`, unmarked = `π_n(G)/π₀(G)` | n≥1 | `[S^{n+1},BG]_*=π_{n+1}(BG)=π_n(G)`; free classes = quotient by `π₁(BG)=π₀(G)` conjugation | true | none |
| Euler sign calibration `⟨e(E_m),[CP¹]⟩=m` | O(−1), TS² | O(−1): `(w,1)=z⁻¹(1,z)`, `c=e^{−iθ}`, winding −1, `c₁(O(−1))=−h` pairs to −1; TS²: `∂/∂w=−z²∂/∂z`, winding 2, `c₁=2h` pairs to 2; Hatcher Example 1.10 gives `z⁻¹` for the inner disk as `D_+` | consistent, linear in m | none |
| Winding mod 2 at rank 2→3 | m=1,2 | `π₁(SO(2))=ℤ→π₁(SO(3))=ℤ/2` reduction | true | none |
| `π₂(SO(k))=0` from sphere sequences | k=3,4,≥5 | `π₂(SO(3))=0` (S³→RP³); `π₂(SO(4))` is a quotient of `π₂(SO(3))` via `π₂(S³)=0`; `π₂(S^k)=0` for k≥3 gives surjectivity onward | true | none |
| C1.1b `m=max t_i` continuous, `ψ_i` locally finite | point p with finite support S | near p, `Σ_{j∈S}t_j>1−ε` so every tail weight `<ε<m/2`; `ψ_j=0` off S; `ψ_{i₀}=m/2>0` | true | none |
| Truncation homotopy weights | general | `(S_N+(1−s)(1−S_N))/D=1`, `D≥S_N>1/2` | sum 1, denominator positive | none |
| `compact_simplex_weights_uniform_prefix` | K compact, K empty | `S_N` continuous increasing, `S_N(x)→1` (Finsupp weights, sum 1 at the pin); open increasing cover of K, finite subcover; K=∅ any N | true | none |
| BG Hausdorff for Hausdorff G | two orbits | separated by some `t_i` or by the invariant `g_i⁻¹g_j` on `U_i∩U_j` | true | none |
| Barycentric field: `Σv_i=0`, variance identity, zero set | general flag; `d` injective | `Σt_i(d_i−μ)=μ−μ`; `Σd_iv_i=Σt_id_i²−μ²=Σt_i(d_i−μ)²` using `Σt_i=1`; zero iff all positive-weight `d_i=μ`, injectivity forces one vertex | true both directions | none |
| Local index `(−1)^d` at `h(b_σ)` | d=0, d=m, general | lower faces (dimension d) attracting (`v_ρ=t_ρ(d_ρ−μ)<0`), cofaces (dimension m−d) repelling; model `(u,v)↦(−u,v)`, `sign det=(−1)^d`; m=0 index +1 | agrees | none |
| `Σ_σ(−1)^{dim σ}=χ` on the field's zero set | boundary of a tetrahedron (S²) | 4−6+4=2=χ(S²) | agrees | none |
| C2.6 constant map on S² | f=const | `f*e(TS²)=0`, `deg f·χ=0·2=0`; `L(f)=tr H⁰=1`; one fixed point with `det(1−0)=1` | agrees (R02 is ownership, not truth) | cut per R02 |
| C2.6 f=id | id | `Γ_id*δ_Δ=e(TM)`, `L(id)=χ` | agrees | — |
| `traceless_decomposition` | general Z, tr Z=0 | `X=(Z−Z*)/2`, `Y=−i(Z+Z*)/2`; `X+iY=Z`; `star X=−X`, `star Y=−Y`; traces 0 since `tr Z*=conj tr Z=0`; uniqueness: `X+iY=0` and its star `−X+iY=0` give `X=Y=0` | true | none |
| `adjoint_root_identity` | symbolic | `e₂(0,a,−a)=−a²`, `−e₂=(x−y)²=(x+y)²−4xy` | true | padding (R08) |
| `p₁(su(F))=c₁²−4c₂` integrally | roots x,y | `End₀` roots `0,x−y,y−x`; `p₁=−c₂(su⊗ℂ)=(x−y)²`; flag injection is integral | true | none |
| Hopf example on S⁴ | HP¹ | `c₁(F)∈H²=0`; `p₁(E)=−4u≠0`; `e(E)∈H³=0`; `w₁,w₂,w₃∈H^{1,2,3}(S⁴;𝔽₂)=0`, `w₄=0` by rank; section ⇒ `E=ε⊕P`, `e(P)∈H²=0`, `p₁(P)=e(P)²=0` ⇒ `p₁(E)=0`, contradiction; dimension 4 > rank 3 | all claims hold | none |
| `p₁(P)=e(P)²` for an oriented plane bundle | line L | `L⊗ℂ=L⊕L̄`, `c₂=−c₁(L)²`, `p₁=c₁(L)²` | true | none |
| Orientation of su(F) frame-independent | U(2) | U(2) connected, so Ad lands in SO(3) | true | none |
| C5a.1 degree-1 CE sign | general | `da(X,Y)=−a([X,Y])` = `d₁₂_apply_apply_ofTrivial` (the proved `compactCE_degreeOne_sign`) | agrees | none |
| `2d=Σ_a e^a∧L_{e_a}` on trivial-coefficient cochains | degree 1 | `Σ_a[e^a(X)(L_{e_a}a)(Y)−e^a(Y)(L_{e_a}a)(X)]=−2a([X,Y])=2da(X,Y)` | true | none |
| `H¹(K;ℝ)=ann([g,g])` | general | degree-0 coboundaries vanish; closed iff `a([X,Y])=0` (the proved `compactCE_degreeOne_closed_iff`) | true | none |
| C5a.3 `F_t=tΩ+((t²−t)/2)[θ,θ]` | Weil algebra | `d_W(tθ)+½[tθ,tθ]=tΩ−(t/2)[θ,θ]+(t²/2)[θ,θ]` | agrees | none |
| `τ(−a/(2π))=−θ/(2π)` | circle | degree 1, `B_P=P`, `CS_P=∫₀¹P(θ)dt` | agrees | none |
| C5a.6 Poincaré series and dimension | general K | `Σ(2d_i−1)=2Σd_i−rank=2(N+rank)−rank=dim K` with N positive roots; total Betti `2^rank` | true | none |
| C5a.7 E8 and SU(2)/N(T) | E8; SU(2) | exponents 1,7,11,13,17,19,23,29 give degrees 3,15,23,27,35,39,47,59 summing to 248=dim E8; `SU(2)/N(T)=S²/antipodal=RP²`, `H²=ℤ/2` | true | none |
| C7.1 Td, L, Â low terms | degrees ≤ 8 | `x/(1−e^{−x})=1+x/2+x²/12`; `x coth x` as above; `(x/2)/sinh(x/2)=1−x²/24+7x⁴/5760` | agree with the displays | none |

**Padding probe.** Scratch copies of `Suggested.lean` and of the companion statements were elaborated with one-tactic attempts (`rfl`, `simp [defs]`, `infer_instance`, `simp …; ring`): only `reflection_rotation` closed (R08). `lSeries_even`, `lSeries_root_coefficient_six`, `twice_even_product_correction_eq_zero`, `adjoint_root_identity`, `sum_flagVelocity`, `flagHeight_variance`, `compact_simplex_weights_uniform_prefix` left goals.

**Manifest note.** The brief's fetch command recorded the six fetched texts in the board package manifest `packages/CharacteristicClasses/sources.toml` (new file); nothing in the pull-request worktree was changed.

## Not verifiable

- Milnor, *Construction of Universal Bundles, II* (Ann. of Math. 63, 1956), §§2–3: resolves only to the JSTOR landing page (paywalled); cite by locator as `uncertified`. tom Dieck 14.4.3 covers the same construction and was read.
- Milnor–Stasheff, *Characteristic Classes*, §§9–15, 18, Appendix C, Theorem 15.3: the README's link is to a GitHub-pages host in no licence class; not opened. Theorem 15.3 (Pontryagin Whitney formula modulo 2-torsion) is cited from memory of the published text only.
- "Teichner1086_003 pp5–7", "Teichner1086_018 p7", Kirby p87 and "Index Theory 0218_001 p15" (named in the pull-request description and, for the first, in the README): scanned course notes, not public; the statements were checked against zentner-instanton-sheet2, hatcher-vbkt and direct computation instead.
- Bott–Tu, *Differential Forms in Algebraic Topology*: no link; standard text, not opened.

## Source issues

- none
