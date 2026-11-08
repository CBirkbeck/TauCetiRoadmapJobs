# Review of PainleveEquations (pull request #1955 at 0d04994)

**Verdict:** needs changes

Five blocking findings (P2) and eight P3 findings. The push gate fails at this head (R06), so the folder cannot be accepted until that is fixed as well.

## R01 (P2) — Suggested.lean has no headline theorem, though the scalar Painlevé property can be stated

**Location.** `TauCetiRoadmap/PainleveEquations/Suggested.lean:14–25`: "These declarations suggest Lean forms for representative interfaces". README §7.2 API: "Deduce the standard scalar Painlevé property from §4.9 on every observer stratum covered by the comparison."

**Claim.** The file states three API lemmas from 0.1, an autonomous special case of 0.4, and one definition from 0.7. None of these is a headline result of the roadmap. The roadmap's classical end theorem is that every local solution of PI, PII and PIV extends to a meromorphic function on ℂ, and that the same holds for PIII and PV after t = eˢ. That theorem can be stated with Mathlib's `MeromorphicOn`, and the file does not state it.

**Witness.** A scratch copy under the single `import Mathlib` elaborated, with only the `sorry` warning, the following statement: `∃ f : ℂ → ℂ, MeromorphicOn f Set.univ ∧ Set.EqOn f q (Metric.ball t₀ r)`, under the hypothesis `deriv (deriv q) t = 6 * q t ^ 2 + t` on the ball. The PII analogue with `2 * q t ^ 3 + t * q t + α` also elaborated.

**Repair.**
- State each of the following as a `theorem … := by sorry`, in the DLMF normalization of §7.2:
  - PI, PII (parameter α) and PIV (α, β) on ℂ;
  - PIII and PV for `q ∘ Complex.exp` on ℂ, using Mathlib `Complex.isCoveringMap_exp` (`Mathlib/Analysis/Complex/CoveringMap.lean:46`), with the coefficient conditions of the primitive rows of §7.3.
- Rewrite the module docstring in the required form ("Painlevé equations: target signatures"). It should say that README.md is the roadmap, and name each headline that cannot be stated at the pins together with what is missing:
  - the construction theorem §2.4 and the dimension theorem §1.5: there are no moduli of decorated meromorphic connections and no analytic algebraic spaces;
  - RH properness §4.4 and the geometric Painlevé property §4.6: there are no Betti or character families;
  - the Okamoto–Painlevé comparison §5.2;
  - the tau sections §§6.1–6.5: there is no holomorphic determinant line bundle;
  - PVI's scalar property: there is no holomorphic universal covering of ℂ∖{0,1}. I found no modular λ-function in Mathlib or Tau Ceti at the pins.
- Name every new theorem at its target in the README.

## R02 (P2) — §§4.4 and 4.6 claim RH properness and the geometric Painlevé property for every profile and every exponent, which no cited source proves

**Location.** README line 1336: "Prove properness of RHθ for the whole time/exponent family". Line 1346: "Separately prove that for every allowed exponent parameter, b ∈ Bθ and r ∈ Rθ,b there is m". §4.6, line 1409: "Obtain a unique horizontal lift for every admitted θ".

**Claim.** Properness and surjectivity of the RH map are stated for all ten profiles at every exponent, including resonant and reducible ones. So is the resulting geometric Painlevé property. This covers the unramified and ramified irregular profiles. Line 1350 itself concedes that IS12 has only generic scope and asks to "prove the remaining … assertions". No cited source covers the ramified profiles at all.

**Witness.**
- IS12 lines 1796–1800: for resonant or reducible residues, the authors only *expect* RH to be proper, surjective and bimeromorphic, and say the Painlevé property would follow "if we can show this".
- VDPS09 line 69: the RH resolution is "conjectured and proved for the PVI case".

**Repair.** Choose one of the following.
- Cite, with theorem and page, a published proof of properness and surjectivity of the generalized RH map for each irregular profile at the stated generality.
- Restrict §4.4 and §4.6 to the established scope, and say in the scope section that the remaining profiles and exponents are outside this roadmap. The established scope is:
  - the four-logarithmic profile at every κ (I13 Theorem 2.2, I13 lines 305–313; IIS06 Theorem 4.10, IIS06 lines 881–883);
  - unramified profiles at non-resonant irreducible exponents (IS12 Theorem 5.1, IS12 lines 1424–1426, and IS12 §6).

  Then restrict §§4.7–4.9 and the scalar-Painlevé deduction of §7.2 to the same scope. The scalar headline of R01 can instead rest on a published analytic proof.

In either case, add to §4.6 the locators of the geometric Painlevé theorems it specializes (IIS06 Theorem 5.12; IS12 §6).

## R03 (P2) — §5.2 asks for an Okamoto–Painlevé comparison for every profile, which its own source records as a conjecture outside PVI

**Location.** README line 1542: "Construct a relative compactification S → B of the degree-four connection moduli family … construct an isomorphism from the full phase family to U over B". Line 1544: "Construct the comparison for every admitted profile … the global comparison in the introduction of VDPS09 has conjectural status."

**Witness.** VDPS09 lines 58–63 state, as a conjecture, that a relative compactification of each of the ten connection families is one of the universal Okamoto–Painlevé families. The source records it as proved only for type D̃₄ (PVI).

**Repair.**
- Restrict §5.2 to PVI (IIS06 §10, Theorems 10.6 and 10.10), plus any other type for which you cite a published proof with its locator.
- Put the remaining types out of scope.
- Then restrict the consumers of the global comparison to the same types: §§5.3, 5.5, 5.6 and §7.2, all of which list 5.2 in *Needs*. Alternatively, drop 5.2 from a consumer's *Needs* where the chart-level comparison of §7.2 suffices.

## R04 (P2) — §§0.1–0.2 and `NonlinearConnection` duplicate SmoothBundlesConnections B1.5's Ehresmann connection

**Location.** README line 126: "A real nonlinear connection is a C¹ vector-bundle splitting h:π*TB→TM with dπ∘h=id". Line 173: "Construct unique maximal horizontal lifts". `Suggested.lean:53` declares the corresponding structure.

**Witness.** SmoothBundlesConnections on main, README lines 500–515 (B1.5), already defines this object: an Ehresmann connection on a smooth submersion is a distribution complementary to `ker(mfderiv π)`, typed as `TauCeti.IsContMDiffDistribution`. B1.5 also provides pullback, restriction, and unique horizontal lifts on the maximal interval. A splitting h and its image determine each other.

**Repair.**
- For the smooth real case, cite B1.5's object, its pullback and restriction, and its horizontal lifts.
- Keep here only what B1.5 lacks, each stated in one clause as a variant of B1.5's object:
  - a non-surjective submersion;
  - C¹ splittings with piecewise-C¹ paths (for 0.2);
  - the holomorphic branch.
- Delete the second Lean carrier (see R07).

## R05 (P2) — §1.5 and JacobianChallengePartII §0.3 both own the relative Picard scheme of smooth projective curve families

**Location.** README line 671: "Construct the fppf relative Picard algebraic space … For smooth marked curves construct the relative Picᵈ, its rigidified Poincaré comparison".

**Witness.** JacobianChallengePartII, at the head of #1225, `TauCetiRoadmap/JacobianChallengePartII/README.md` line 175 is the heading "0.3 Relative curve Picard scheme". Its line 10 lists relative curve Picard representability for smooth projective curves among its owned targets.

**Repair.** Settle one owner. In the candidate merge order this roadmap (line 45) comes before JacobianChallengePartII (line 53). Either:
- state in a scope section that §1.5 owns relative Picard for projective flat curve families, smooth and nonreduced, and that JacobianChallengePartII §0.3 should cite it; name the overlap in the pull-request description so that #1225 is rebased; or
- move JacobianChallengePartII ahead, cite its §0.3 for smooth curves, and keep here (or declare as a gap to it) only the nonreduced-fibre extension that §5.1 uses.

## R06 (P3) — The push gate fails

**Location.**
- README lines 62–67: blob links.
- LaTeX: `$`…`$` spans on lines 117–424, and ```` ```math ```` blocks at lines 302, 308, 392, 400, 2020, 2055, 2062 and 2066.
- TeX syntax at lines 720, 1542 and 2047.
- 100 `<a id=…>` anchors.
- `Suggested.lean:1–9`: `module`, `public import`, and `Mathlib.Dynamics.Flow` and `Mathlib.Geometry.Manifold.VectorBundle.Pullback` imported instead of `import Mathlib`.

**Witness.** The gate at 0d04994 reports `blob=6 latex=416 tex=5 … residue=100 … imports=1 mathlib-subimports=2 no-import-mathlib=1 … FAIL`. I reran it and got the same result.

**Repair.**
- Cite CrystallineCohomology, FormalConnectionsOpers and ComplexComparisonPartII by roadmap name and section, not by `…/blob/<sha>/…` links.
- Rewrite every `$`…`$` and every math block in Unicode, inline code spans or indented code blocks, for example `π: M → B` and `K_h(X,Y) = [hX,hY] − h[X,Y]`.
- Remove the anchors and link to heading slugs.
- In Suggested.lean: drop `module` and `public`, use the single line `import Mathlib`, and add only the `TauCeti.*` modules the remaining statements use.

## R07 (P3) — Suggested.lean consists of padding, and README and Lean disagree

**Location.**
- `Suggested.lean:53–105`: `NonlinearConnection`, `horizontal`, `isCompl_vertical_horizontal`, `isContMDiffDistribution_horizontal`, `liftVectorField`, `curvatureOn`, `curvatureOn_mem_vertical`.
- `:120`: `isCompleteVectorField_of_proper_semiconjugacy`.
- `:143`: `meromorphicObservation`.

**Claim.**
- The 0.1 theorems restate 0.1's API bullets.
- The 0.4 theorem is an autonomous special case of a supporting lemma. It generalizes Tau Ceti `isCompleteVectorField_of_isProperMap` from an invariant proper map to a proper semiconjugacy.
- `meromorphicObservation` is Tau Ceti's `MeromorphicFunction` constructor applied to `Q ∘ s`, and no theorem uses it.
- None of the nine names occurs in the README.
- The generality differs from the README. Curvature is stated for a C¹ lift, while README 0.1 requires a smooth splitting for curvature. The structure omits the Hausdorff, second-countable, finite-dimensional and boundaryless hypotheses that README 0.1 states.

**Witness.** The probe does not close these declarations: `simp` fails on `isCompl_vertical_horizontal`, and `exact?` returns only the sorried theorem itself. They are therefore API restatements rather than one-tactic facts. A README search finds 0 occurrences of each name.

**Repair.** Delete all nine declarations from Suggested.lean; the README keeps the targets. Write the docstring and the headline statements as in R01.

## R08 (P3) — §0.2 re-proves Mathlib's Picard–Lindelöf theorem for time-dependent fields (continuous in t, Lipschitz in y)

**Location.** README line 158: "Prove the local existence–uniqueness theorem for y′=F(t,y) … continuous in time and locally uniformly Lipschitz … integral-equation contraction argument, prove uniqueness".

**Witness.** The pinned Mathlib already has:
- `IsPicardLindelof` (`Mathlib/Analysis/ODE/PicardLindelof.lean:80`: Lipschitz in space, continuous in time);
- `exists_eq_forall_mem_Icc_hasDerivWithinAt` and `exists_forall_mem_closedBall_eq_hasDerivWithinAt_lipschitzOnWith` (`Mathlib/Analysis/ODE/ExistUnique.lean:57, :79`);
- `ODE_solution_unique_of_mem_Icc` (`:252`).

**Repair.** Cite these declarations in the supplier contracts and in 0.2's *Needs*. Keep as targets only the manifold gluing, the maximal lift, the concatenation across piecewise-C¹ pieces, and the compact-extension lemma. Compare that lemma with Tau Ceti's escape lemma `eventually_flowOf_notMem` (`TauCeti/Geometry/Manifold/Flow/Basic.lean:187`).

## R09 (P3) — §§3.8 and 4.1 take Deligne's regular-singular theory from the source instead of from its supplier

**Location.** README line 1236: "Deligne II5.4 gives an extension … Use Deligne II5.9 with its erratum for the regular-singular algebraic/analytic correspondence". Line 1103: "(DEL70, II §5.)".

**Witness.** ComplexComparisonPartII, at the head of #848, §C5.6 (its README line 4150) states `RegularSingular` and `CanonicalLogExtension` (Deligne II.5.1–5.6). It also gives monodromy conjugate to exp(−2πi Res) and the logarithmic-lattice criterion. This roadmap already consumes that supplier.

**Repair.** Add ComplexComparisonPartII C5.6 to the contract table and to the *Needs* of §§3.8, 4.1 and 4.3, citing its named declarations. Keep here only the decorated, resonant-lattice and determinant comparisons that C5.6 does not state.

## R10 (P3) — §1.3 builds general reductive GIT, which other roadmaps have requested from AlgebraicModuliForArithmeticGeometry as declared gaps

**Location.** README line 57: "1.3 constructs reductive invariant theory". Line 589: "specify the reductive framing group, linearization and Hilbert–Mumford comparison … prove finite generation".

**Witness.** Two open roadmaps already request this from AlgebraicModuliForArithmeticGeometry, which is line 36 of the candidate merge order:
- CountingBundlesAndHallAlgebrasOfCurves (#1547), README line 103, declares `gap:reductive-character-git` to it;
- QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups (#1842), line 89, declares `gap:hilbert-mumford-linear` to it.

**Repair.** Under `## Exact supplier contracts` and in `design/plan.json`, declare a gap to AlgebraicModuliForArithmeticGeometry for the reductive quotients 1.3 uses. Reuse `gap:reductive-character-git` if its `needs` covers the GL-framing quotients; otherwise give it a precise new slug. Keep in 1.3 only boundedness, the connection and factorization equations, and the stability-to-GIT comparison.

## R11 (P3) — Citations of three roadmaps that do not exist, and undefined abbreviations

**Location.**
- "NonlinearConnections §0.x", "MeromorphicConnectionModuli §1.x" and "AnalyticRHPAndDeterminants §6.1" occur 24 times, at lines 761, 823, 910, 914, 937, 1016, 1018, 1043, 1067, 1139, 1163, 1180, 1204, 1352, 1385, 1409, 1433, 1457, 1484, 1743 and 1871.
- "SSF4.14", "SSF4.5", "SSF1.17" and "SSF5.9" first appear at line 589.
- "CKG" appears at line 543.

**Witness.** `roadmaps resolve` finds no roadmap with any of these three names on main or in the 478 open pull requests. Each one means this roadmap's own §0.x, §1.x or §6.1.

**Repair.** Write "§0.6", "§1.1", "§6.1" and so on. Spell out SchemeAndStackFoundations and ComplexKahlerGeometry.

## R12 (P3) — README shape and Checks

**Location.** The whole README. Examples: line 1 is `# Painlevé equations`, and `### 3.10` (line 1155) has no Checks.

**Claim.**
- There is no `# Roadmap:` title and no opening `**Summary.**`; a Summary appears only at line 870, inside Layer 3.
- These sections are missing: `## Scope and ownership`, `## Conventions` (only a Layer-3 `###` exists), `## Exact supplier contracts` (a table called "External dependency contracts" stands in for it), `## How to read the build` and `## Downstream consumers`.
- The bibliography is split across lines 81, 430, 859 and 2117.
- The targets use field lists (**Hypotheses.**, **API.**, **Tests and falsification cases**, **Source scope.**).
- Line 850 is a catalogue with labels such as `M-local-presentation-descent`.
- Layers 0–2 have no `### Examples`, and most layers have no `### Dependencies`.
- Targets 3.10, 3.12, 4.9 and 7.3 have no Checks.
- 3.1, 3.5, 3.7, 3.9, 3.11 and 6.2 repeat the Checks of 1.1, 1.3, 1.5–1.6, 2.1, 2.2 and 6.1, so they do not test the specialization.

**Witness.** 3.1's six Checks repeat 1.1's six "Tests" with one rewording. 3.10 ends at its *Needs* line without any Checks.

**Repair.**
- Restructure the README to the house shape and merge the bibliographies into `## References`.
- Write the field lists as prose.
- Give 3.10, 3.12, 4.9 and 7.3 at least three Checks each. For 7.3, for example: PIII with (α,β,γ,δ) = (1,1,0,1) is D₇, (1,1,0,0) is D₈, and (0,1,0,1) is quadrature.
- Replace the copied Checks with checks on the classical instance, for example the relative dimension 2 on a PII fibre chart for 3.7.

## R13 (P3) — General-theory targets have no locator

**Location.** §0.1 (line 151: "The construction applies to every submersion…"), §0.2 (line 185), §0.3 (line 218), §0.5 (line 292).

**Witness.** None of these four targets cites a source with theorem and page. The only Layer-0 continuation locator is §0.4's IIS06 Lemma 2.12 (IIS06 line 285).

**Repair.** Add a textbook or primary locator, with theorem and page, for each of the following:
- Ehresmann connections and pullback (for example Kolář–Michor–Slovák §9, as B1.5 uses);
- continuous-time existence, uniqueness and extension;
- holomorphic parameter dependence;
- flat-connection transport and descent.

## Verified sound

**Gate and dependency check.**
- The gate rerun at 0d04994 gives the same failures as the worker's gate (R06). `stray-files`, `outside-folder`, `sorry-data`, `set_option`, `statement-hygiene` and `metadata` are all 0.
- Without the candidate order, the gate prints "depcheck: NOT IN ORDER", which is expected before the design is accepted.
- The dependency check against the candidate order prints `depcheck: 240 roadmaps, 2443 edges, 0 problem(s)`: no UPWARD or CYCLE line. PainleveEquations is at line 45, after FormalConnectionsOpers (44), ComplexComparisonPartII (43) and CrystallineCohomology (24).
- `git diff --stat origin/main...HEAD` outside the folder is empty.

**Lean.**
- `lake env lean Suggested.lean` reports only four `sorry` warnings, at lines 71, 78, 98 and 120.
- I compared the elaborated type of each of the nine declarations (`#check @name`, signatures file) with the README. No section binder is dropped. The generality differences are recorded in R07.
- Probe on a scratch copy: no sorried declaration closes in one tactic. The PI and PII Painlevé-property statements of R01 elaborate under `import Mathlib`.
- Truth of the current statements: `isCompl_vertical_horizontal` holds because P = lift∘dπ is an idempotent with range = range(lift) and ker = ker(dπ). `isCompleteVectorField_of_proper_semiconjugacy` holds because a maximal curve with finite supremum b stays in the compact set F⁻¹(β([0,b]×{F x})), which contradicts `eventually_flowOf_notMem`.

**Library declarations opened at the pins.**

Mathlib:
- `IsFredholm.nonempty_fredholmPackage` (`Mathlib/Analysis/Normed/Operator/Fredholm/Basic.lean:322`)
- `analyticAt_inverse` (`Mathlib/Analysis/Analytic/Constructions.lean:955`), `analyticAt_inverse_one_sub` (`:899`)
- `IsPicardLindelof` (`Mathlib/Analysis/ODE/PicardLindelof.lean:80`)
- `ExistUnique.lean:57, 79, 252`
- `Complex.isCoveringMap_exp` (`Mathlib/Analysis/Complex/CoveringMap.lean:46`)
- `LinearMap.isCompl_of_proj` (`Mathlib/LinearAlgebra/Projection.lean:56`)

Tau Ceti:
- `IsCompleteVectorField`, defined as `flowDomain v = univ` (`TauCeti/Geometry/Manifold/Flow/Complete.lean:61`)
- `isCompleteVectorField_of_isProperMap` (`:166`)
- `flowDomain`, `flowOf` (`Flow/Basic.lean:57, 62`)
- `eventually_flowOf_notMem` (`:187`)
- `maximalIntegralCurveInterval_eq_univ_of_isCompact_of_mapsTo` (`IntegralCurve/Maximal.lean:385`)
- `RiemannSurface.MeromorphicFunction`: a map to `OnePoint ℂ` not constantly ∞, with no connectedness field (`Analysis/Complex/RiemannSurface/FunctionField.lean:104`); the `FunctionField/Comap.lean` module exists
- `IsContMDiffDistribution` (`Geometry/Manifold/Distribution.lean:269`)
- `IsFredholm.exists_stabilization_kernel_coordinates` (`Analysis/Fredholm/Stabilization.lean:72`)
- `kernelHomeomorph`, `contDiffAt_kerSection` (`Analysis/Normed/Operator/Splitting/Family.lean:62, 42`)
- `detLineCongr` (`LinearAlgebra/Determinant/Line.lean:92`)
- `IsFredholm.finrank_detLine`, whose fibre is det ker ⊗ (det coker)*, as §6.1 states (`Analysis/Fredholm/DeterminantLine.lean:41`)
- `exists_frobenius_flat_coordinate` (`Analysis/ODE/Frobenius.lean:753`)

**Cross-roadmap citations resolved (47).**

On main:
- ComplexKahlerGeometry K1 (line 96), K3.0, K3.HolomorphicStalk (317), K3.MeromorphicGermField (332), K4 (444), K7.1 (1405 ff.)
- SmoothBundlesConnections B1.5 (498), B5.0 (1072), B5.2 (1209)
- DifferentialGeometry Layers 0–1 and 3.1–3.5 (371–400)
- UniversalCovers items 2–4, 5 and 6–8 (its numbering runs across stages)
- ComplexCurveModuli D0.3 and D3–D5
- SchemeAndStackFoundations 1.1, 1.17–1.23, 2.2 (3309), 2.6 (3437), 2.7 (3482), 2.20 (4275), 3.3 (4713), 3.4 (4789), 4.2–4.6, 4.11, 4.14 (5706), 4.15 (5725), 4.17, 5.9–5.10
- AlgebraicVectorBundles L0A–L2B
- JacobianChallenge Layers C and D
- FormalLaurentPuiseux L1–L6
- OperatorIdeals OI-B01–B19, B23, B29–B30
- RandomMatrices 8.3 (984)
- ToeplitzOperators T1–T3

At open heads:
- CrystallineCohomology CR.1.3 (#857, line 1121)
- FormalConnectionsOpers F1.1 (415), F1.2 (454), F1.3 (486), F2.1 (568), F2.4 (722), F3.3 (980), F3.4 (1001), F8.1 (2341) (#1056)
- ComplexComparisonPartII C-1.1 (894), C-1.2 (985), C0.3 (1198), C0.4 (1249), C0.5 (1296), C0.7 (1361), C1.9 (1855), C5.1 (2698), with `IsDifferentialOperator` (2799), `DifferentialOperatorAnalytification` (2850) and `boundedOperatorHyperGaga` (2876), and C5.2 (2973) (#848)

**Ownership against open pull requests.** Checked with `roadmaps grep` over main and all 478 open pull requests. Search terms: isomonodromy, Painlevé, Okamoto, Stokes, wild character, meromorphic connection, Ehresmann connection, determinant line bundle, GIT/Hilbert–Mumford, Levelt–Turrittin and relative Picard.
- FormalConnectionsOpers F8 owns an isomonodromy groupoid of opers, a different object, which §2.1 only contrasts.
- No other roadmap owns Painlevé, Okamoto or Stokes objects.
- The real overlaps are R04, R05, R09 and R10.
- `overlaps.md` lists no dropped ids and no conflicting heads. I read the three closest roadmaps (ComplexComparisonPartII, FormalConnectionsOpers, StableReductionPartII).

**Sampled locators (15 targets).**
- 0.1, 0.2, 4.5, 4.6 and 4.7 carry no external locator (R13 and R02).
- 0.4: IIS06 Definitions 2.1–2.2 (lines 141, 150), 2.11 (272), Lemma 2.12 (285) ✓.
- 1.2: I23 §5 (lines 1116–1267: atlas H→M_{g,n}, jet space, open T) ✓.
- 1.6: I23 Theorem 8.1 (2270), Propositions 8.2 (2406) and 8.3 (2431), the unfolding with q_{m}=1 (2282–2285), and smoothness over H° (2415) ✓.
- 2.4: I23 model ✓.
- 3.7: I23 Theorem 7.5 (2112–2114, dimension 2r²(g−1)+2+r(r−1)deg D) ✓.
- 3.9: I23 Definition 10.1 (3495), Propositions 10.7 (4039) and 10.10 (4124) ✓.
- 4.3: I13 Definition 4.3 (564–578, classes modulo a base line bundle twist) ✓; I13 Theorem 2.2 (305) ✓; IIS06 Definition 4.9 (862) and Theorem 4.10 (881) ✓; IS12 Theorem 5.1 (1424, non-resonant irreducible) ✓; I23 Proposition 3.3 (651) and Corollaries 4.3–4.4 (1101, 1107) ✓.
- 5.5: IIS06 Theorem 7.4 (1425), Remark 7.5(2) (1441), Theorem 10.13 (1928); STT02 Tables 2–3 (383, 390) ✓.
- 6.5: MAL04 Theorem 5.12 (525; restricted to non-resonant Schlesinger systems, 511–515) ✓; BERT10 §5.1 (1436) and Proposition 5.1 (1547) ✓; BERT16 Definition 2.1 (80) and Theorems 2.1–2.2 (99, 135) ✓; BERT17 Proposition 2.3 (278) and (3.6) (708) ✓.
- 7.5: VDPS09 (38)–(41) (2462–2481) and (44)–(47) (2520–2539) ✓; DLMF 32.6.2–32.6.15 ✓.
- Also checked: I23 Remark 2.9 (480) and MAL04 §2, which lies on printed pp. 1372–1374 as cited.

**Adversarial table.**

| Statement | Instances | Computed values (both sides) | Result | Change |
|---|---|---|---|---|
| 0.1 Check: time change | τ=2t | ∂_t=2∂_τ, so h(∂_τ)=½h(∂_t) | holds | — |
| 0.1 Lean `isCompl_vertical_horizontal` | P=lift∘dπ | P²=lift(dπ lift)dπ=P; range P=range lift; ker P=ker dπ | true; not one-tactic | R07 delete |
| 0.2 Checks | y′=y², y(0)=1; γ=\|s−½\|^{3/2} | y=1/(1−t); γ′=(3/2)\|s−½\|^{1/2}·sgn is continuous but not differentiable at ½ | hold | R08 |
| 0.3 Check: curvature | h∂_s=∂_s, h∂_t=∂_t+s∂_y | y_st=0 ≠ y_ts=1; K=[∂_s,∂_t+s∂_y]=∂_y | holds | — |
| 0.4 Check, and Lean theorem | h∂_t=∂_t+y²∂_y | y(½)=2, y(¾)=4, pole at 1; F⁻¹(β([0,b]×{F x})) is compact, contradicting escape | hold | R07 |
| 0.5 Checks | q′=q/(2t), p′=−p/(2t); rectangle a×b | t^{±½} gives (q,p)↦(−q,−p); Δp=(q₀+a)b−q₀b=ab | hold | — |
| 0.6 components | (hX,U,V), (hX,hY,U), (hX,hY,hZ) | D^h_Xω(U,V); −ω(K_h(X,Y),U); 0 | hold | — |
| 0.6 Checks | ω=e^t dq∧dp; H=p²/2 | dΩ=e^t dt∧dq∧dp ≠ 0; ι_v(dq∧dp+p dp∧dt)=p dp−p dp=0 | hold | — |
| 0.7 Check: non-regular cover | z³−3z | critical values ±2; fibre over 2 is {−1,2}; fibre over 0 is {0,±√3}; monodromy S₃, centralizer trivial | holds | — |
| 0.8 jet formula | q′=A, p′=B | q″=A_t+AA_q+BA_p; A=p²: ∂A/∂p=2p=0 at p=0 | holds | — |
| 1.1 Checks | g=diag(z,1); r=2 ramified | g⁻¹dg=diag(1,0)dz/z, trace-free part diag(½,−½)dz/z; I23 §5 term rc+(r−1)/2 = 2c+½ | hold | — |
| 1.5/3.7 dimension | (g,r,deg P)=(0,2,4),(0,2,5),(1,2,1),(1,1,0) | 2, 4, 4 unfixed and 2 fixed (=4−2g), 2 and 0; matches I23 line 2113 | hold | — |
| 1.6 Check: unfolding | r=2, m=2, q₁=2 | (z−2h²)(z−h²): z² at h=0, (z−2)(z−1) at h=1, z² mod h² | holds | — |
| 2.2 Checks | h∂_t=∂_t+q∂_q; E=pr*O(1) | flow pulls dq∧dp back to e^t dq∧dp; O(1) on ℙ¹ has no holomorphic connection (deg 1 ≠ 0) | hold | — |
| 2.3 Check | t=s² | h′(∂_s)=(∂_s, 2s·h(∂_t)) | holds | — |
| 2.4/3.3 Checks | 5 and 3 logarithmic points | 2·5−6=4, 2·3−6=0 | hold | — |
| 3.3 pole budget | slopes 0, k, k+½ | m=1, k+1, k+2; Σ(1+⌈rᵢ⌉)=Σmᵢ=4, so time dimension 4−3=1; PI slope 5/2 gives m=4 (VDPS09 2485) | holds | — |
| 3.4 counts | compositions of 4 | ordered 2+8+6+1=17; unordered 2+5+2+1=10 | holds | — |
| 3.8 Checks | d+½I dz/z; [[0,1],[0,1/z]] | e^{−πi}=−1; y₂=c/z, y₁=−c log z+d, giving [[1,−2πi],[0,1]] | hold | — |
| 4.3/4.4 PVI inequality | I13 Theorem 2.2 | rn−2r−2=8−4−2=2>0 | holds | — |
| 4.4/4.6 scope | irregular profiles at special exponents | IS12 1796–1800 (expectation only); VDPS09 69 (conjectured except PVI) | unsupported | R02 |
| 4.7 Check | H=qp/(2t) | H_p=q/(2t), −H_q=−p/(2t); multiplier (−1)(−1)=1 | holds | — |
| 5.2 scope | all eight boundary types | VDPS09 58–63: proven only for D̃₄ | unsupported | R03 |
| 5.5 Check: s₀ | κ=(½,0,0,0,0) | Cartan D₄⁽¹⁾: s₀κ₀=−κ₀, s₀κⱼ=κⱼ+κ₀; 2κ₀+Σκⱼ: 1 → −1+2=1; without the sign change 1+2=3 | holds | — |
| 6.1/6.5 Checks | T_s=s, s²; c=2 at s₀=1 | τ=s; double zero with dim ker=1; f_norm=2s; e′=ae gives f′=a⁻¹f | hold | — |
| 6.3 index | rank 2, deg d on ℙ¹ | χ(E(k))=d+2k+2; d=k=−1 gives −1 | holds | — |
| 6.4 Check | z=w², gauge diag(1,w) | leading term 2(E₁₂+E₂₁)/w², eigenvalues ±2/w², exponent ∓2w⁻¹, slope ½ | holds | — |
| 7.2 sign lemma | p′=FH_q, q′=−FH_p | ι_v(dp∧dq/F+dH∧dt)=0; with −dH∧dt it is 2(H_q dq+H_p dp) ≠ 0; PI (44)/(46) similarly | README right | source issue |
| 7.2 PV | t=1, q=2, p=0, θ=(0,1,1); 20 random rational points | compatible q″=2, printed 7/2; dictionary Q=q/(q−1), (θ₁²/2,−θ₀²/2,1−θ∞,−½) exact at all 20 | holds | source issue |
| 7.2 PI | VDPS09 (45) q″=6q²+2t | Q″=c⁻⁴q″=6Q²+2c⁻⁵T, which needs c⁵=2 | holds | — |
| 7.2 Flaschka–Newell | VDPS09 (34) | T=−ct, U=cq: needs 2c³=4 and c³=2; U′=2QU+a with a=α+½, giving U″=U′²/(2U)+2U²−TU−a²/(2U) | holds | — |
| 7.2 PVI dictionary | IIS06 line 23, (2) | α=κ₄²/2, β=−κ₁²/2, γ=κ₂²/2, δ=(1−κ₃²)/2; 2κ₀+Σκᵢ=1 | holds | — |
| 7.3 PIII coverage | γδ=0 split by α, β | every tuple falls in a row; all coefficients zero: q=C t^μ | holds | R12 (no Checks) |
| 7.4 σ identities | PII; D₇; D₈ | E′=2vD and H−σ=E/(2u); D₇: u=p and E₇≡0; D₈: u=−1/q, v=2p/t, E₈≡0; Δ=−S₂ (PI, PII), −tS₂ (D₇, D₈) | hold | — |
| 7.4 Check: PII affine branch | c=0, σ=t+2 | E=4−4=0; q=0, p=−2; residual 2+t/2 | holds | — |
| 7.5 Checks | α=0, 1, −½ | (0,t/2): q′=0, p′=½; q=−1/t: q′=1/t², p′=−4/t³+½, q″=−2/t³=2q³+tq+1; u″=−tu/2 | hold | — |
| Headline: PI/PII Painlevé property | Lean probe | elaborates with `MeromorphicOn f univ` | statable | R01 |

## Not verifiable

- **GR84** (Springer) and **MFK94** (Springer): paywalled and not legally readable here. I checked no locator in them.
- **Not opened**, because they lie outside the seeded sample: SAB12, BOA01, BOA14, BY15, HEU10, TER02, ST04, FM19, DIL21, AHT17, IMS18, KED09, DEL70, ACV03, PICREL, SGA1XII, SERREGAGA. Their locators are unchecked.
- **Not recomputed:** the IMS18 σ-rows for PIII(D₆), PIV, PV and PVI, and the VDPS09 dictionaries for PIV, PIII(D₆) and degenerate PV.

## Source issues

- **Error** in VDPS09 at §4.1, preprint p. 31 (VDPS09 lines 1809, 1815): the source says the extended form is dp∧dq/F − dH∧dt for p′=F·H_q, q′=−F·H_p; it should be dp∧dq/F + dH∧dt, which is the form the vector field annihilates (likewise lines 1972, 2411, 2471, 2530); affects a stated result.
- **Error** in VDPS09 at §4.3, equation (3), preprint p. 34 (VDPS09 lines 1966–1967): the source says the exponent terms of scalar PV are θ₀²/(2qt²)+θ₁²/(2(q−1)t²); it should be θ₀²(q−1)/(2qt²)−θ₁²q/(2(q−1)t²), as eliminating p from its system (2) gives; affects a stated result.
- **Gap** in DLMF at §32.6(ii), equations 32.6.7–32.6.8 (DLMF line 245): the source says every solution σ of 32.6.6 gives a PI Hamiltonian solution q=−σ′, p=−σ″; it should require σ″ not identically zero (σ=az+2a³ is a counterexample); affects a stated result.
- **Gap** in DLMF at §32.6(iii), equations 32.6.14–32.6.15 (DLMF line 439): the source says every solution of 32.6.13 reconstructs a PII Hamiltonian solution; it should require σ″ not identically zero (α=−½, σ=z+2 gives q=0, p=−2, violating 32.6.10); affects a stated result.
