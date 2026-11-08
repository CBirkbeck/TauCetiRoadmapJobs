# Review of PainleveEquations (pull request #1955 at b31ece8)

**Verdict:** needs changes

Full review of the repaired head (1769 changed lines since 0d04994). One P1, two P2 and four P3 findings. The push gate still fails (R04), so the folder cannot be accepted at this head.

**The previous review's findings at this head.**

- R01 (no headline theorem): repaired. `Suggested.lean` now states six scalar meromorphic-continuation theorems and a docstring naming the non-statable headlines; one of the six is false as written (new R01 below).
- R02 (RH properness for every profile claimed without a source): partly repaired. §§4.2–4.4 now give a proof route (projective incidence morphism, GIT comparison, irreducible realization and closedness) whose inputs are owned, and §4.3 restricts the IS12 comparison to "its generic unramified scope". The README still nowhere says that for the irregular profiles the theorem exceeds every cited source (new R06).
- R03 (Okamoto–Painlevé comparison for every profile): repaired. §5.2 is PVI only ("Global identifications of the other connection families with relative compactification complements are outside this target"), and §§5.3, 5.5, 5.6 refer to "the PVI comparison of §5.2".
- R04 (Ehresmann duplication): repaired. §0.1 uses "the Ehresmann distribution of SmoothBundlesConnections B1.5" and keeps only the non-surjective, C¹ and holomorphic extensions; the Lean carrier is gone.
- R05 (relative Picard owned twice): repaired on the previous review's terms, but on a wrong premise: the earliest owner is ComplexComparisonPartII C3.2d.2–C3.2d.3, not this roadmap, and JacobianChallengePartII already cites it (new R02).
- R06 (gate): mostly repaired (blob, LaTeX, anchors, imports all 0); four new TeX hits remain (new R04).
- R07 (padding), R08 (Picard–Lindelöf), R09 (C5.6), R11 (invented roadmap names, abbreviations), R13 (Layer-0 locators): repaired. I found no occurrence of NonlinearConnections, MeromorphicConnectionModuli, AnalyticRHPAndDeterminants, SSF4.x or CKG; §§0.1–0.3 and 0.5 cite KMS93, Teschl12, IY08 and IIS06.
- R10 (reductive GIT as a declared gap): partly repaired; the gap is named but not in the intake's form and its needs is compound (new R03).
- R12 (shape and Checks): mostly repaired (house shape, 55 targets each with at least three Checks, bibliography merged); some copied Checks and shape residue remain (new R07).

## R01 (P1) — `painleveV_meromorphic_extension` is false: the lift point `s₀` is unconstrained

**Location.** `TauCetiRoadmap/PainleveEquations/Suggested.lean:64–74`: the PV theorem has binders `{α β γ δ : ℂ} {q : ℂ → ℂ} {t₀ : ℂ} {r : ℝ}` and concludes `f =ᶠ[nhds s₀] q ∘ Complex.exp`, with no hypothesis relating `s₀` to `t₀`. README line 1522: "For the logarithmic time plane, fix a point above the initial time and require agreement near that point."

**Claim.** `s₀` is auto-bound; the elaborated type is `∀ {s₀ α β γ δ : ℂ} {q : ℂ → ℂ} {t₀ : ℂ} {r : ℝ}, …` (scratch `#check`, and the worker's signatures file). The hypotheses constrain `q` only on `Metric.ball t₀ r`, so for `exp s₀` outside the closed ball the conclusion asks an arbitrary function to be meromorphic near `s₀`.

**Witness.** Take any PV solution germ on the ball and set `q t = conj t` outside the closed ball; choose `s₀` with `|exp s₀ − t₀| > r`. If `f =ᶠ[nhds s₀] q ∘ exp` with `f` meromorphic on `ℂ`, then `q ∘ exp` is analytic on a punctured neighbourhood of `s₀`, so `conj` is analytic on an open set: false. The PIII theorem (line 40) carries the needed `hlift : Complex.exp s₀ = t₀`; PV omits it.

**Repair.** Add the binder `{s₀ : ℂ}` and the hypothesis `(hlift : Complex.exp s₀ = t₀)` to `painleveV_meromorphic_extension`, exactly as in `painleveIII_meromorphic_extension`. With it the statement is the PV Painlevé property on the universal cover of the punctured time plane, which is what README §7.2 states. (Checked on the instance above: with `exp s₀ = t₀` the point `s₀` lies over the ball, where `q` is the analytic germ, and the counterexample disappears.)

## R02 (P2) — §1.5 rebuilds the relative Picard algebraic space that the supplier ComplexComparisonPartII C3.2d.2–C3.2d.3 owns, and the ownership statements about JacobianChallengePartII are wrong

**Location.** README line 584: "Construct the fppf relative Picard algebraic space for the projective flat finitely presented complex curve families used here, over locally Noetherian bases, under the universal-functions condition O_B≅p_*O_C after every base change." Line 35: "Section 1.5 owns relative Picard representability … JacobianChallengePartII §0.3 consumes the smooth projective specialization". Line 1662: "JacobianChallengePartII §0.3 uses the smooth-curve relative Picard specialization of §1.5."

**Witness.** ComplexComparisonPartII at the head of #848 (`roadmaps show`, its README line 2338) "### C3.2d.2 Representability of the relative Picard sheaf": `relative_picard_algebraicSpace`, for `f : X → B` proper, flat, finitely presented with `O_T → (f_T)_*O_{X_T}` an isomorphism after every base change, with the same Stacks locators (Proposition 99.11.8, Lemma 108.9.3); its C3.2d.3 (line 2356) gives the diagonal and separatedness. This roadmap already consumes ComplexComparisonPartII (merge-order line 39, before this roadmap at 40). JacobianChallengePartII at the head of #1225, its §0.3 (README line 175 ff.), writes "The hypotheses of ComplexComparisonPartII §§C3.2d.2–C3.2d.3 hold … So `Pic_{X/S}` is a quasi-separated algebraic space"; it contains no occurrence of PainleveEquations, and it is later in the candidate order (line 70).

**Repair.**
- Add ComplexComparisonPartII C3.2d.2–C3.2d.3 to `## Exact supplier contracts` and to the *Needs* of §1.5 (and §5.1, which uses the nonreduced case), and delete the construction of the algebraic space from §1.5. Keep in §1.5 only what C3.2d lacks: the smoothness argument through PICREL 0DPJ/0DPK (H² vanishing by relative dimension at most one), the identity-component and constant-dimension statements, the affine torsor of line connections over the Picard space with its de Rham tangent complex, and the determinant-map smoothness.
- Replace line 35 and line 1662: this roadmap owns no Picard representability; it consumes C3.2d.2–C3.2d.3 and, for a fixed smooth curve over ℂ, JacobianChallenge Layer D (already in the contracts). Do not name JacobianChallengePartII as a consumer; its smooth-curve scheme representability and degree pieces are its own and are not needed here.
- The pull-request description's paragraph "Relative Picard representability … is owned by §1.5 … JacobianChallengePartII … should consume §1.5" must go with it.

## R03 (P2) — The reductive-GIT gap is not declared in the intake's form and its needs is compound

**Location.** README line 85: "AlgebraicModuliForArithmeticGeometry, `gap:reductive-connection-git`. Supply finite generation and affine reductive quotients, relatively ample linearization and the relative invariant Proj, the Hilbert–Mumford criterion and stable geometric quotients over ℂ for the GL framing and Stokes frame groups."

**Claim.** This pull request has no `design/plan.json`, so the README sentence is the only place the intake reads a gap, and it must have the shape `What <Supplier> must provide (gap:<slug>): <one sentence>`. The sentence above is not in that shape, and it asks for five separate results (finite generation, affine quotients, relative Proj, Hilbert–Mumford, stable geometric quotients). AlgebraicModuliForArithmeticGeometry at the head of #853 has no reductive GIT (no match for "reductive", "Hilbert–Mumford" or "invariant theory" in its README), so without a well-formed gap the citation is of a section that does not exist.

**Witness.** The sibling declarations in the required shape: CountingBundlesAndHallAlgebrasOfCurves (#1547) README line 103, `What AlgebraicModuliForArithmeticGeometry must provide (gap:reductive-character-git): …` (character-linearized GIT for products of general linear groups, Hilbert–Mumford, free geometric quotients, base change and the projective morphism from the character quotient to the affine quotient); QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups (#1842) README lines 89 and 91, two one-sentence gaps `gap:hilbert-mumford-linear` and `gap:free-stable-quotient-bundle`.

**Repair.** Under the supplier subsection write one sentence `What AlgebraicModuliForArithmeticGeometry must provide (gap:reductive-connection-git): for a reductive group G over ℂ acting on a projective morphism X → X₀ of finite-type schemes with X₀ affine and a G-linearized relatively ample ℒ, the invariant Proj of ⊕ₙ Γ(X, ℒⁿ)^G is projective over X₀//G, and on a chart where ℒ-semistable equals stable its stable locus is a geometric quotient.` Cite `gap:reductive-character-git` (CountingBundlesAndHallAlgebrasOfCurves) for finite generation, affine quotients and the Hilbert–Mumford criterion, which the README already says this gap "extends". Keep the GL framing groups and the determinant-one tori as the only groups named; the unipotent Stokes groups are handled by explicit descent in §4.2, not by this gap.

## R04 (P3) — The push gate fails: four TeX-syntax hits

**Location.** README line 626: `E → E|_{mᵢaᵢ}/Fᵢ,k`; line 1605: `I_{x₀}` three times.

**Witness.** The worker's gate at b31ece8: `tex=4 … FAIL`; I reran it and got the same four hits. Every other scanner is 0 (`blob=0 latex=0 residue=0 imports=0 sorry-data=0 set_option=0 statement-hygiene=0 stray-files=0 outside-folder=0 build=0`).

**Repair.** Put the two expressions in code spans (`` `E|_{m_i a_i}/F_{i,k}` ``, `` `I_{x₀}` ``) or write `E|ₘᵢₐᵢ` and `I_(x₀)` as the README does elsewhere (`M_(b₀)`, `Res_(i,n)`).

## R05 (P3) — The depcheck does not see FormalConnectionsOpers as a supplier, so the intake will not place this roadmap after it; the description lists one of four open suppliers

**Location.** README lines 73, 109, 129, 466, 641: "FormalConnectionsOpers — F1.1–F1.3; F2.1; F3.3–F3.4", "FormalConnectionsOpers F2.4", "FormalConnectionsOpers F1.1–F1.3, F2.1 and F3.3–F3.4's", "FormalConnectionsOpers F8.1". Pull-request description, depends-on block: only #848.

**Witness.** The candidate merge order lists PainleveEquations at line 40 and FormalConnectionsOpers at line 41, yet the worker's depcheck and my rerun print `0 problem(s)` with no `moved:` line. On a scratch copy with one added line `*Needs:* FormalConnectionsOpers §F1.1.` the same command prints `UPWARD: PainleveEquations (#40) -> FormalConnectionsOpers (#41)`, and with `--movable` `moved: PainleveEquations moved in the merge order from #40 to #41, right after its last supplier FormalConnectionsOpers`. So the `0 problem(s)` line is a false negative: the parser needs `§` after the roadmap name. CrystallineCohomology (#857, order line 23), AlgebraicModuliForArithmeticGeometry (#853, line 34) and FormalConnectionsOpers (#1056) are open new-folder pull requests cited as suppliers and absent from the depends-on block.

**Repair.** Write at least the contract citation as `FormalConnectionsOpers §F1.1–§F1.3, §F2.1, §F3.3–§F3.4` (and likewise `§F2.4`, `§F8.1`), so the depcheck records the edge and the worker moves this roadmap after FormalConnectionsOpers at submission; then list #1056, #857 and #853 (the gap supplier) with #848 in the description's depends-on block. Not a defect of the order itself: the move is the intake's.

## R06 (P3) — §4.4 proves RH properness and surjectivity for all ten profiles beyond every cited source without saying so

**Location.** README line 1072: "The chartwise projective models give properness over the full admitted time and exponent base"; line 1074: "Prove surjectivity on each fixed time and exponent fiber"; line 1076 cites I13 Theorem 2.2 and IIS06 Theorem 4.10 for the four-logarithmic case only; line 1053: "Compare the ordinary inverse with IS12 Theorem 5.1 on its generic unramified scope."

**Claim.** The route (projective incidence morphism X → X₀ of §4.2, GIT comparison of §4.3, irreducible realization and closedness) is coherent and its inputs are owned (§§4.1–4.3, the gap of R03, ComplexComparisonPartII C5.6, C−1.2). But the theorem for the five ramified profiles and for resonant or reducible strata of the irregular unramified profiles has no published source: I13 Theorem 2.2 (I13 line 305) is logarithmic; IIS06 Theorem 4.10 (IIS06 line 881) is PVI; IS12 Theorem 5.1 (IS12 line 1424) assumes "ν is non-resonant and irreducible" and IS12 Remark 6.3 (line 1796) only "expect[s]" properness beyond that; VDPS09 line 69 calls the analytic resolution "conjectured and proved for the PVI case". A reader of §4.4 cannot tell which part is sourced.

**Repair.** Add to §4.4 one timeless sentence of scope: the four-logarithmic case is I13 Theorem 2.2 and IIS06 Theorem 4.10, the generic unramified inverse is IS12 Theorem 5.1, and the remaining profiles and strata are proved here from §§4.2–4.3 with the gap of R03 and the analytification comparisons as the only external inputs; name there the step that turns the family-level comparison of §4.3 into the analytic isomorphism (the coarse space of the stable quotient stack is the analytification of the GIT quotient, through ComplexComparisonPartII C−1.2 and the gap). Mirror the sentence in §4.6, which inherits the scope. Previous R02: partly repaired.

## R07 (P3) — Copied Checks and shape residue

**Location and claim.**
- §3.6 (lines 852–854) repeats §1.4's Checks (lines 549–551): bullets 1 and 3 are identical and bullet 2 is a rewording; §3.2 bullets 2–3 (lines 779–780) are identical to §1.2 bullets 2–3 (lines 489–490). They do not test the rank-two specialization (`diff` on the quoted lines).
- Layer 3 carries a second `**Summary.**` (line 722) and a `### Scope` (line 724) whose exclusions ("difference and q-difference Painlevé dynamics, … Garnier systems") belong in `## Scope and ownership`; Layers 3–7 have no layer-level `### Examples` (only `#### Examples` under some targets).
- `Suggested.lean:7`: "The statements here are selected target signatures" rather than the required statement that the file states the roadmap's headline theorems against the pinned APIs.
- §3.8 line 892 cites "IIS06 … Theorems 4.10–4.12": 4.11 is a Corollary (IIS06 line 885).

**Repair.** Replace the copied bullets by Checks on the classical instance (for §3.6: the PII Jimbo–Miwa chart has a two-dimensional tangent space with trace pairing dq ∧ dp; the μ₂ stabilizer of a fixed-determinant rank-two object; the ramified three-term cone at the PI pole). Move the exclusion paragraph to `## Scope and ownership`, drop the inner Summary, and give Layers 3–7 a closing `### Examples`. Reword the docstring sentence. Write "Theorem 4.10, Corollary 4.11 and Theorem 4.12".

## Verified sound

**Gate, order and build.**
- Gate at b31ece8: every scanner 0 except `tex=4` (R04); the targeted build passed for the worker and `lake env lean Suggested.lean` gives only the six `sorry` warnings (lines 26, 33, 40, 54, 64, 77).
- `gate --depcheck … --movable` on the candidate order: `depcheck: 238 roadmaps, 2346 edges, 0 problem(s)`, no UPWARD or CYCLE line; the false negative for FormalConnectionsOpers is R05.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds README.md, Suggested.lean and metadata.toml (`topic = "math.AG"`).

**Lean.**
- The six elaborated types (worker's signatures file, and my `#check @painleveV_meromorphic_extension` on a scratch copy) agree with README §7.2 except for R01. PIII carries `exp s₀ = t₀`; PVI takes a covering `p` with `IsCoveringMapOn p {0,1}ᶜ` (`Mathlib/Topology/Covering/Basic.lean:197`), `IsSimplyConnected (p ⁻¹' {0,1}ᶜ)` (`Mathlib/AlgebraicTopology/FundamentalGroupoid/SimplyConnected.lean:137`, which implies nonempty and path-connected, so the preimage is the universal cover), analyticity and nonvanishing derivative, and concludes `MeromorphicOn f (p ⁻¹' {0,1}ᶜ)`; that is the PVI Painlevé property on the universal cover and is true.
- One-tactic probe (scratch copy, `simp_all` for each `sorry`): all six remain unsolved. None is padding; each is a headline.
- The normalizations in `hODE` equal DLMF 32.2.1–32.2.6 (DLMF322 lines 124, 150, 174, 200 for PIII–PVI).
- The PIII hypothesis `hprimitive` is not needed for truth (in the quadrature case α = γ = 0 the substitution u = s − log q reduces PIII to u'' = −βeᵘ − δe²ᵘ, whose solutions are meromorphic in s), but it matches README §7.3's scope; noted, not a finding.

**Previous-review findings** re-read as listed at the top.

**Library declarations opened at the pins.** Mathlib: `IsPicardLindelof` (`Analysis/ODE/PicardLindelof.lean:80`), `exists_eq_forall_mem_Icc_hasDerivWithinAt` (`ExistUnique.lean:57`), `exists_forall_mem_closedBall_eq_hasDerivWithinAt_lipschitzOnWith` (`:79`), `ODE_solution_unique_of_mem_Icc` (`:252`), `Complex.isCoveringMap_exp` (`Analysis/Complex/CoveringMap.lean:46`), `analyticAt_inverse` (`Analysis/Analytic/Constructions.lean:955`), `analyticAt_inverse_one_sub` (`:899`), `IsFredholm.nonempty_fredholmPackage` (`Analysis/Normed/Operator/Fredholm/Basic.lean`), `IsProperMap` (`Topology/Maps/Proper/Basic.lean:77`), `IsSimplyConnected`, `IsCoveringMapOn`, `IsEvenlyCovered` (`Topology/Covering/Basic.lean:39`). Tau Ceti: `exists_frobenius_flat_coordinate` (`Analysis/ODE/Frobenius.lean:753`), `IsFrobeniusIntegrableAt` (`:94`), `RiemannSurface.MeromorphicFunction` (`Analysis/Complex/RiemannSurface/FunctionField.lean:104`) and the `FunctionField/Comap.lean` module, `IsFredholm.exists_stabilization_kernel_coordinates` (`Analysis/Fredholm/Stabilization.lean:72`), `kernelHomeomorph` (`Analysis/Normed/Operator/Splitting/Family.lean:62`), `contDiffAt_kerSection` (`:42`), `detLine` (`LinearAlgebra/Determinant/Line.lean:74`), `detLineCongr` (`:92`), `eventually_flowOf_notMem` (`Geometry/Manifold/Flow/Basic.lean:187`), `isCompleteVectorField_of_isProperMap` (`Flow/Complete.lean:166`), `IsContMDiffDistribution` (`Topology/VectorBundle/Subbundle.lean`).

**Cross-roadmap citations resolved (every round, at the current heads).**
- On main (c58403c): SmoothBundlesConnections B1.5 (line 498), B5.0 (1072), B5.2 (1209); DifferentialGeometry Layers 0, 1, 3 (268, 311, 371); ComplexKahlerGeometry K1 (96), K3 (296) with K3.0, K3.HolomorphicStalk (317), K3.MeromorphicGermField (332), K4 (444), K7 (1405); UniversalCovers Stage 0 items 2–4, Stage 1 item 5, Stage 2 items 6–8; ComplexCurveModuli D0.3, D3–D5 (74–119); SchemeAndStackFoundations 1.1 (2071), 1.17–1.23 (2624–3021), 2.2 (3309), 2.6 (3437), 2.7 (3482), 2.20 (4275), 3.3 (4713), 3.4 (4789), 4.2–4.6 (5110–5291), 4.11 (5528), 4.14 (5706), 4.15 (5725), 4.17 (6075), 5.9–5.10 (7129, 7175); AlgebraicVectorBundles L0A–L2B (215–340); JacobianChallenge Layers C and D (143, 218); FormalLaurentPuiseux L1–L6 (70–279); OperatorIdeals OI-B01, B19, B23, B29, B30; RandomMatrices 8.3 (984); ToeplitzOperators T1–T3 (41–124).
- At open heads: FormalConnectionsOpers #1056 F1.1 (415), F1.2 (454), F1.3 (486), F2.1 (568), F2.4 (722), F3.3 (980), F3.4 (1001), F8.1 (2341); ComplexComparisonPartII #848 C-1.1 (894), C-1.2 (985), C0.3 (1198), C0.4 (1249), C0.5 (1296), C0.7 (1361), C1.9 (1855), C5.1 (2698) with `IsDifferentialOperator` (2799), `DifferentialOperatorAnalytification` (151), `boundedOperatorHyperGaga` (2860), C5.2 (2973), C5.6 (4150) with `RegularSingular` (4152) and `CanonicalLogExtension` (4159), monodromy conjugate to exp(−2πi Res) and the strip uniqueness; CrystallineCohomology #857 CR.1.3 (1121); AlgebraicModuliForArithmeticGeometry #853 §7.6.1 exists (9648) but has no GIT (R03); JacobianChallengePartII #1225 §0.3 (175) (R02).
- Overlaps file: no open pull request changes this roadmap, no dropped ids. Closest roadmaps read: ComplexComparisonPartII, FormalConnectionsOpers (its F8 isomonodromy groupoid of opers is a different object, only contrasted in §2.1), StableReductionPartII. Ownership search by object (`roadmaps grep` over main and the open heads for isomonodromy, Painlevé, Okamoto, Stokes, wild character, determinant line bundle, relative Picard): the only second owner found is R02.

**Sampled locators (15 targets), read at the locator.**
- 0.1: KMS93 §9.3 (line 3597, printed p. 78) and Theorem 9.8 "Parallel transport" (3705, printed p. 81) ✓.
- 0.2: Teschl12 Theorem 2.2 Picard–Lindelöf (line 1807, printed p. 38) and Corollary 2.15 compact-containment extension (2528, printed pp. 52–53) ✓, matching the stated criterion.
- 0.8: no theorem locator (construction with VDPS09 §4.1 as application; VDPS09 lines 1800–1815 confirm the factor F and the modified Hamilton equations) — acceptable as a standard construction.
- 1.3: I23 Theorem 5.1 (line 1272, quasi-projective coarse moduli), Remark 2.9 (480, ramified ⇒ irreducible ⇒ stable for every weight) ✓.
- 1.5: I23 Theorem 7.5 (2112, dimension 2r²(g−1)+2+r(r−1) deg D) ✓; PICREL 0D2C (quot.pdf line 1359: Picard functor an algebraic space under flat, proper, finitely presented and universal functions), 0DNI (moduli.pdf 598: quasi-separated, locally of finite presentation), 0DPJ (555) and 0DPK (639): smooth when the relative dimension is at most one ✓ — and these are exactly ComplexComparisonPartII C3.2d.2's hypotheses (R02).
- 2.1: I23 Definition 10.1 (3495) with (10.1) (3494: pole module generated by dz/z^m and dε/z^{m−1}), Lemmas 10.3–10.6 (3547–3836), Propositions 10.7 (4039) and 10.10 (4124) ✓.
- 2.2: I23 Theorem 11.6 (4407, bracket identity), Definition 11.4 (4399, Ω(v,w) = ω(v − Ψdπv, w − Ψdπw)), Corollary 11.8 (4590, dΩ = 0) ✓.
- 2.4: assembled from the above ✓.
- 3.1: I23 §§2–4 (252–1115) ✓.
- 3.3: VDPS09 §2.2 Table 1 (1000–1010, printed pp. 18–19: the ten profiles with slopes and parameter counts) ✓; I23 Theorem 7.5 ✓.
- 4.3: I13 Definition 4.3 (564: families modulo base line-bundle twist), Theorem 2.2 (305: rn − 2r − 2 > 0 in genus 0; proper surjective bimeromorphic), Proposition 5.3 (1347) ✓; IIS06 Definition 4.9 (862), Theorem 4.10 (881) ✓; IS12 Theorem 5.1 (1424, non-resonant irreducible) ✓; ComplexComparisonPartII C5.6 ✓; I23 Proposition 3.3 (651), Corollaries 4.3–4.4 (1101, 1107) ✓.
- 4.5: internal (§0.3 with IY08 Theorem 1.1 — IY08 not readable here, see below).
- 5.2: IIS Part II Theorem 4.1 (line 496, preprint p. 11: the φ-connection compactification S over T₄ × Λ₄ with ∧²φ = 0 the anticanonical divisor, an Okamoto–Painlevé pair of type D₄⁽¹⁾) ✓; IIS06 §§5, 10 ✓; STT02 Definition 1.1 (130), Definition 1.3 (359), Proposition 1.2 (391), Tables 2–3 (383, 390), Theorem 3.1 (via 93) ✓.
- 6.2: internal to 6.1 ✓.
- 7.5: VDPS09 §4.10 (2424–2481: (38)–(41)), §4.11 (2482–2539: (44)–(47)) ✓; DLMF 32.6.2–32.6.15 (DLMF line 115–466) ✓; DLMF 32.9.6 and 32.9.12 (DLMF329 lines 196, 375) ✓ for §7.3.
- Also read: IIS06 Definitions 2.1–2.2, 2.11, Lemma 2.12, Lemma 5.3, Definition 3.5, Theorems 4.12, 5.12, 5.15–5.16, 7.4, Remark 7.5, 10.6, 10.10, 10.13 and the κ-relation (1)–(2) ✓; IS12 Remark 6.3 ✓; IMS18 (2.18)–(2.30) ✓; VDPS09 §§4.3–4.9 ✓.

**Adversarial table.** Computed this round with exact rational arithmetic (truncated Taylor series over ℚ on random rational points and parameters, script in my scratch directory); rows marked (r1) were recomputed by hand from the previous review.

| Statement | Instances | Computed values (both sides) | Result | Change |
|---|---|---|---|---|
| Lean PV, free `s₀` | q = conj off the ball, exp s₀ off the ball | conj not analytic on any open set; conclusion needs analyticity near s₀ | false | R01 |
| Lean PIII/PV/PVI domains | ball with t ≠ 0 (PIII, PV), t ≠ 0, 1 (PVI) | ball is simply connected and misses 0 (and 1), so the lift exists and q∘exp, q∘p are germs | consistent | — |
| Lean PVI cover hypotheses | p constant (empty preimage) | `IsSimplyConnected` needs Nonempty, so excluded; nonempty + path-connected + covering of connected base = universal cover | sound | — |
| Lean PIII quadrature | α = γ = 0 | u = s − log q gives u'' = −βeᵘ − δe²ᵘ, y = eᵘ, z = 1/y: z'² quadratic in z, entire; q = t/z meromorphic in s | hypothesis unused but harmless | note |
| 7.2 PVI dictionary | K₁ of §7.4 at random (θ₀,θ₁,θ_t,θ∞), 7 points | fitted (α,β,γ,δ) = ((θ∞−1)²/2, −θ₀²/2, θ₁²/2, (1−θ_t²)/2) exactly, consistent on 3 extra points | holds | — |
| IMS18 (2.27) at ℏ = 1 versus K₁ | same θ | fitted α = (θ∞−1)²/2 − 1/2, others equal | K₁'s −2ε is a different convention, consistent with its own dictionary | — |
| 7.4 PVI sigma | S = t(t−1)K₀ + (θ_t²−θ∞²)t/4 − (θ₀²+θ_t²−θ₁²−θ∞²)/8, K₁ dynamics | IMS18 (2.30) at ℏ = 1 evaluates to 0 at 4 points; E_v = 2u t²(t−1)² v | holds | — |
| 7.4 PI, PII sigma | 3 points each | E_I = v²+4u³+2tu−2s = 0; E = v²+4u³+2u(tu−s)−c²/4 = 0; Δ = −S₂ both | hold | — |
| 7.4 D₇ | K = (q²p²+θqp+tp−q)/t, S = tK | E₇ = t²v² − (θu−1)² − 4u²(s−tu) = 0; Δ = −tS₂; VDPS09 (18) with θ = λ+2, q = 1/r, p = −z − θr/2 − tr²/2 intertwines (3 points) | hold | — |
| 7.4 D₇ dictionary | t = T², Q = T/q | fitted PIII (4(θ−1), −8, 4, 0) | holds | — |
| 7.2 D₇ dictionary | VDPS09 (19), t = T², Q = Tq | fitted PIII (4(θ∞+1), −8, 4, 0) | holds | — |
| 7.4 D₈ | K = (q²p² − q − t/q)/t, S = tK | E₈ = t²v² + 4tu³ − 4su² + 4u = 0; Δ = −tS₂; VDPS09 (23) with q = r, p = (z + r/2)/r² intertwines; K + H_(25) = 1/(4t) | hold | — |
| 7.2/7.4 D₈ dictionary | VDPS09 (24), t = T², Q = q/T | fitted PIII (8, −8, 0, 0) | holds | — |
| 7.2 PIV dictionary | VDPS09 (29), t = 2T, Q = 2q | fitted (α,β) = (−θ∞−1, −2θ₀²) | holds | — |
| 7.4 PIV | IMS18 (2.21), Q = 2q; S = K + 2t(θ₀+θ∞/3) | fitted (2θ∞−1, −8θ₀²); (2.23) = 0; Δ = −S₂ | hold | — |
| 7.2 PV elimination | VDPS09 (4)/(5), point (t,q,p,θ₀,θ₁,θ∞) = (1,2,0,0,1,1) | q'' = 2 from the system; printed (3) gives 7/2; README's corrected scalar matches the system at 7 random points | README right | source issue |
| 7.2 PV dictionary | Q = q/(q−1) | fitted (θ₁²/2, −θ₀²/2, 1−θ∞, −1/2) | holds | — |
| 7.4 PV | IMS18 (2.24), S = tK | fitted ((θ₀−θ₁−θ∞)²/8, −(θ₀−θ₁+θ∞)²/8, θ₀+θ₁−1, −1/2); (2.26) = 0; Δ = −tS₂ | hold | — |
| 7.2 degenerate PV | VDPS09 (7), T = t², Q = q/(q−1) | fitted (θ₁²/2, −θ₀²/2, −2, 0) | holds | — |
| 7.4 PIII(D₆) | IMS18 (2.18), S = tK + pq | fitted (4θ₀, 4(1−θ∞), 4, −4); (2.20) = 0; Δ = S₁ − tS₂ | hold | — |
| 7.2 PIII(D₆) | VDPS09 (14) | by inspection (4(θ∞+1), −4θ₀, 4, −4) | holds | — |
| 7.2 Flaschka–Newell | VDPS09 (34); c³ = 2, T = −ct, U = cq | U'' = U'²/(2U) + 2U² − TU − θ₀²/(2U) (by hand); Q = (U'−a)/(2U) solves PII with α = a − 1/2 and U = Q'+Q²+T/2 (5 points) | holds | — |
| 7.2 PI scaling | VDPS09 (45), c⁵ = 2 | Q'' = c⁻⁴(6q²+2t) = 6Q² + 2T/c⁵ = 6Q² + T | holds | — |
| 7.2 PVI dictionary from IIS06 (1) | κ | α = κ₄²/2, β = −κ₁²/2, γ = κ₂²/2, δ = (1−κ₃²)/2 (IIS06 line 20) | holds | — |
| 7.4 Δ and E_v formulas | PI, PII, PIV, PV, D₇, D₈, D₆ | as in the rows above; E_v = ∂E/∂v read off each E | hold | — |
| 7.4 PII affine branch (r1) | c = 0, σ = t+2 | E = 4 − 4 = 0; q = 0, p = −2; residual q' − (p − q² − t/2) = 2 + t/2 | holds | source issue (DLMF) |
| 7.4 PI affine branch (r1) | σ ≡ 0 | E_I = 0; q = 0 does not solve 6q² + t = 0 | holds | source issue (DLMF) |
| 7.2 source sign (r1) | p' = FH_q, q' = −FH_p | ι_v(dp∧dq/F − dH∧dt) = (vp/F + H_q)dq + (H_p − vq/F)dp ≠ 0 for the source's system; + dH∧dt annihilates | README right | source issue |
| 1.5 / 3.7 dimension | (g,r,deg P) = (0,2,4), (0,2,5), (1,1,0), (1,2,1) | 2, 4, 2 (fixed 0), 4 (fixed 2) | hold | — |
| 1.6 unfolding | r = 2, m = 2, q₁ = 2 | (z−2h²)(z−h²): z² at h = 0, (z−2)(z−1) at h = 1; I23 line 2436 uses z = hʳq | holds | — |
| 3.3 pole budget | slopes 0, 1, 1/2 | m = 1, 2, 2; 4 logarithmic: 4; two slope-1/2: 2+2 | holds | — |
| 3.4 counts | compositions of 4 | ordered 2+8+6+1 = 17; unordered 2+5+2+1 = 10 | holds | — |
| 3.8 Checks | d + ½I dz/z; [[0,1],[0,1/z]]dz | monodromy −I; residue diag(0,1), exp(−2πi Res) = I, transport [[1,−2πi],[0,1]] | hold | — |
| 4.3/4.4 index | I13 Theorem 2.2 | rn − 2r − 2 = 8 − 4 − 2 = 2 > 0 | holds | — |
| 4.4 PV split example | d + [[a,0],[b,−a]]dz/(z(z−1)), 2a = zb − z + 1 | ∇(ze₁+e₂) ∝ ze₁+e₂ iff 2a = zb − z + 1; lines ⟨e₂⟩, ⟨ze₁+e₂⟩ ≅ O(−1), meeting at z = 0, so E is not their sum | consistent | — |
| 4.4 cubic surfaces | PVI cubic as quadratic in x₃ | discriminant has x₁²x₂² and −4x₁² − 4x₂² terms, no x₁²x₂ term, so not a square | holds | — |
| 4.7 Check | H = qp/(2t) | q' = q/(2t), p' = −p/(2t); loop: (q,p) ↦ (−q,−p); multiplier (−1)(−1) = 1 | holds | — |
| 5.1 lattice | δ = [Y] = Σ mᵢ[Dᵢ] | δ·Dᵢ = 0 ⇒ δ ∈ R∂^⊥, δ ∈ R∂, δ² = Σ mᵢ δ·Dᵢ = 0 | holds | — |
| 5.3 Check | A = ℂ[ε]/(ε²), A/(ε) | fibre dimension 1, length 1 ≠ 2 | holds | — |
| 5.5 Check | κ = (½,0,0,0,0), s₀ | κ' = (−½,½,½,½,½): 2κ₀' + Σκⱼ' = −1 + 2 = 1; without the sign change 3 | holds | — |
| 6.3 index | rank 2, degree d on ℙ¹ | χ(E(k)) = d + 2k + 2; d = k = −1 gives −1 | holds | — |
| 6.1 Checks | T_s = s, s², e^s I | τ = s; double zero with dim ker = 1; I ds has no trace on an infinite-dimensional space | hold | — |
| 7.3 PIII coverage | (1,1,0,1), (1,1,0,0), (0,1,0,1), all zero | D₇, D₈, quadrature (DLMF322 line 331–334), q = C t^μ | holds | — |
| 0.3 Check | h∂_s = ∂_s, h∂_t = ∂_t + s∂_y | y_st = 0 ≠ y_ts = 1 | holds | — |
| 0.5 Check | h∂_s = ∂_s + ∂_q, h∂_t = ∂_t + q∂_p | curvature ∂_p; rectangle (a,b): Δp = ab | holds | — |
| 0.6 Checks | ω = eᵗ dq∧dp; H = p²/2 | dΩ = eᵗ dt∧dq∧dp ≠ 0; ι(∂_t + p∂_q)(dq∧dp + p dp∧dt) = p dp − p dp = 0 | hold | — |
| 0.7 Check | z³ − 3z over ℂ∖{±2} | fibre over 0: {0, ±√3}, f = z not constant on it; monodromy S₃, trivial deck group | holds | — |
| 0.8 Checks | A = p, A = p² | inverse p = q'; two branches, rank loss at p = 0 | hold | — |

**Declared gaps.** One (`gap:reductive-connection-git`), see R03.

## Not verifiable

- **GR84**, **MFK94** (Springer, paywalled): not read; cited for background only.
- **JK94** (Wiley DOI, paywalled): cited by locator as a second route in §7.2; not read.
- **IY08**: the sources service fetched the author-page PDF but this worker has no PDF text extractor, so the file has no text; §0.3's Theorem 1.1 locator is unchecked.
- **Not opened** (outside the sample): SAB12, BV89, BOA01, BOA14, BY15, HEU10, TER02, ST04, FM19, DIL21, AHT17, KED09, DEL70, ACV03, SGA1XII, SERREGAGA; MAL04, BERT10, BERT16, BERT17 were checked by the previous review and not re-read.
- The general-profile RH properness of §4.4 (R06) has no published proof I could compare with; I checked the route's steps and found no counterexample.

## Source issues

- **Error** in VDPS09 at §4.1, preprint p. 31 (VDPS09 lines 1809, 1815): the source says the isomonodromic foliation is the kernel of dp∧dq/F − dH∧dt for the system p' = F·H_q, q' = −F·H_p; it should be dp∧dq/F + dH∧dt, which that vector field annihilates (likewise lines 1972, 2411, 2471, 2530); affects a stated result.
- **Error** in VDPS09 at §4.3, equation (3), preprint p. 34 (VDPS09 lines 1966–1967): the source says the exponent terms of scalar PV are θ₀²/(2qt²) + θ₁²/(2(q−1)t²); eliminating p from its system (2) gives [θ₀²(q−1)² − θ₁²q²]/(2q(q−1)t²), and at (t,q,p,θ₀,θ₁,θ∞) = (1,2,0,0,1,1) the system gives q'' = 2 against the printed 7/2; affects a stated result.
- **Gap** in DLMF at §32.6(ii), equations 32.6.7–32.6.8 (DLMF line 245): the source says every solution σ of 32.6.6 gives a PI Hamiltonian solution q = −σ', p = −σ''; it should require σ'' not identically zero (σ ≡ 0 is a counterexample); affects a stated result.
- **Gap** in DLMF at §32.6(iii), equations 32.6.14–32.6.15 (DLMF line 439): the source says every solution of 32.6.13 reconstructs a PII Hamiltonian solution; it should require σ'' not identically zero (α = −1/2, σ = z + 2 gives q = 0, p = −2, violating the first Hamilton equation); affects a stated result.
