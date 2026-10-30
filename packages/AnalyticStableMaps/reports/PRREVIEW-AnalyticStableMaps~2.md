# Review of AnalyticStableMaps (pull request #987 at e191666)

**Verdict:** needs changes

Files reviewed: `TauCetiRoadmap/AnalyticStableMaps/README.md` (1103 lines), `TauCetiRoadmap/AnalyticStableMaps/Suggested.lean` (56 lines, docstring only), `metadata.toml`. The pull request changes nothing outside the folder (`git diff --stat origin/main...HEAD` outside it is empty). The worker's gate at this head passes every check; the dependency check reports `depcheck: 208 roadmaps, 1457 edges, 0 problem(s)` (no UPWARD or CYCLE line). This is a full review of the repaired head, 1257 lines changed since the previous review's head `9045e48`.

## Repairs of the previous review's findings

- **R01 (HeegaardFloer items that exist only at a revision pull request): repaired.** The contract now reads "Lane F1 item 1: Sobolev spaces `W^(k,p)` of maps of surfaces … Lane F2 item 2 … item 3 … item 4 … item 5" (README lines 70–71); every item exists on main (`TauCetiRoadmap/HeegaardFloer/README.md` lines 176–205). Grep for `F2.6`, `F1.5`, `F1.4`, `F0.5`, `F2.2a`, `μ_RS`: 0 occurrences. The determinant-line functor, closed index, finite-regularity parameter spaces, completion comparison, coincidence lemma and sphere model are now Layer 0 and Layer 2 targets, as the scope section records (line 23).
- **R02 (mutual citation with HeegaardFloer): repaired from this side.** Line 23: "HeegaardFloer consumes nothing from it"; line 1093 repeats it under Downstream consumers. No sentence makes HeegaardFloer a consumer of Layers 0–3. (The reverse citations in the HeegaardFloer revision at its own pull request remain that author's to repair; HeegaardFloer on main cites nothing here, which is what the dependency check sees.)
- **R03 (stand-ins in `Suggested.lean`): repaired.** The six declarations are gone; the file is the module docstring, the namespace and a comment. The docstring lists six headline theorems and the carrier each lacks. The pin confirms the carrier claim: `TauCeti.SmoothAlmostComplexStructure` (`TauCeti/Geometry/Symplectic/Manifold/AlmostComplex.lean` line 67) has only `neg` (158), `const` (195), `constSmooth` (230) and `product` (263), so no complex one-manifold is a domain carrier.
- **R04 (imports): repaired.** The file begins with the single line `import Mathlib`; `lake env lean` on it gives no output.
- **R05 (commit-pinned links): repaired.** `blob/` occurs 0 times.
- **R06 (not in TauCetiRoadmap form): repaired.** `# Roadmap:` title with `**Summary.**`, `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, Layers 0–13 with `### k.n` prose, `**Checks.**` and `*Needs:*` on every target, `### Examples` and `### Dependencies` per layer, `## Downstream consumers`, `## References`. Locators now appear at the claims (Wendl Def. 4.2, Thm 4.43, 4.48, Prop. 4.49, 4.55, Lemmas 4.56–4.59; IS Thm 1.1, Remark 2, Def. 1.11, Lemmas 3.1, 3.7, 3.8, 4.1, 4.3, 4.5, Cor. 3.6, Thm 4.2(a)–(g); Pardon Def. 9.2.1–9.2.3, Prop. 9.2.6, Lemmas 9.2.7–9.2.9, Thm 9.2.10, Thm B.1.1, §B.4, Lemmas B.5.1, B.9.1, B.10.2–3, B.11.2, B.12.1, Props B.7.9, B.10.4, B.11.5, §B.13). All were opened and checked below.
- **R07 (README and Lean names disagree): repaired.** No backticked name of the roadmap's own remains in the README (gate `readme-ids-missing=0`); the Lean file declares nothing.
- **R08 (degree theory at the pin): repaired.** The `From Tau Ceti` contract (line 65) names `FiniteHolomorphicMap`, `localMultiplicity`, `fiberMultiplicitySum`, `degree`, `fiberMultiplicitySum_eq_degree`, `degree_comp`, `FiniteHolomorphicMap.ofMDifferentiable`, `biholomorphOfDegreeEqOne`, `ramificationDegree`, `ramificationDivisor`, `degree_ramificationDivisor`; all exist at the pin (`Degree.lean` lines 97, 120, 133, 246, 356, 434, 442; `Ramification.lean` lines 76, 112, 152). FuchsianOrbifolds Layer 5 item 3 is consumed only for Riemann–Hurwitz, which is what main states (`FuchsianOrbifolds/README.md` lines 325–331).
- **R09 (constant-mode convention): repaired.** §6.1 states the circle average as "this roadmap's convention", gives Pardon's node value with its locator (Definition B.4.1 and display (B.4.3); pardon13 lines 6424–6441 confirm), and makes the uniform equivalence as the gluing parameter tends to 0 a target of §6.3.

## R01 (P2) — The finite-regularity budgets do not meet the pinned Sard–Smale theorem's hypothesis

Location: `README.md` line 390 ("before invoking the pinned Sard–Smale theorem, whose differentiability requirement is strictly greater than the index"), line 394 ("Lines in `ℂP²` unmarked: `N = 4`, so `q ≥ 5`"), line 396 ("A budget with `q = N` fails the hypothesis of the pinned theorem, whose conclusion is stated for `C^n` maps with `n > index`"), line 64 ("Sard–Smale for a `C^n` Fredholm map of index less than n between Banach manifolds"), and §2.9, §2.19 which consume these budgets.

Claim: the budget `q ≥ max(q₀, N + 1)`, with N an upper bound for the Fredholm index, satisfies the differentiability hypothesis of `TauCeti.isMeagre_image_criticalPoints_of_isFredholm` and `dense_compl_image_criticalPoints_of_isFredholm`.

Witness: at the pin (`TauCeti/Analysis/Fredholm/SardSmale.lean` lines 468–471 and 493–496) the hypothesis is `hn : ∀ x ∈ U, (finrank ℝ (fderiv ℝ f x).ker)² + 1 ≤ n`, pointwise in the kernel dimension, on an open subset U of a separable Banach space (`SecondCountableTopology E`, line 455); the local form (line 246) has the same threshold, and the docstring (lines 464–466) says so. For the unmarked lines in `ℂP²`, at a regular point dim ker = index = 4, so the pin needs `n ≥ 17`, and at a critical point dim ker = index + dim coker is larger still; the README's `q ≥ 5` does not meet it. No pinned declaration has the classical threshold `n > index`.

Repair, tested on the lines instance: either (a) consume the classical theorem and say so: cite HeegaardFloer Lane F0 (main, lines 161–169: "Sard–Smale (Smale 1965)") for the threshold `q > max(index, 0)`, keep the budgets, and delete the claim that the pinned theorem has that threshold; or (b) keep the pinned theorem and raise the budget per bounded piece: on each compact piece of §2.13/§2.19, dim ker of the projection's derivative is bounded (upper semicontinuity of the kernel dimension of a continuous Fredholm family on a compact set), say by κ; take `q ≥ max(q₀, κ² + 1)` on an open neighbourhood of the piece and apply the pinned local form `exists_mem_nhds_isClosed_isNowhereDense_image_criticalPoints` (line 246) there before the Baire intersection. In both cases rewrite line 64 to describe the pin (open subset of a separable Banach space; pointwise threshold `(dim ker)² + 1`) and replace the Check at line 396 by one that tests the chosen threshold (for (a): `q = 4` fails, `q = 5` suffices; for (b): with κ = 4 the threshold is 17).

## R02 (P3) — The constant-class virtual dimension Check contradicts the formula it tests

Location: `README.md` line 114 ("for the constant class with (g, n) = (0, 2) it is `2(m−3) + 0 + 4 − 2m = −2`"); line 672 ("the constant class with (g, n) = (0, 2) and `E = 0`, `v = −2`", in a sentence that begins "`v + dim E < 0` with E nonzero").

Claim: v = −2 for the constant class with (g, n) = (0, 2).

Witness: the section's formula `v = 2((m−3)(1−g) + ⟨c₁,β⟩ + n)` at (g, n, c₁) = (0, 2, 0) gives `2(m − 3 + 2) = 2m − 2`, which is 0 for a surface and 2 for a fourfold; it equals −2 only for m = 0. The displayed expression subtracts an extra 2m that the formula does not contain. Pardon's form (line 663) agrees: `(6·0 − 6 + 4) + 2m = 2m − 2`.

Repair: use an instance that is negative for every m, for example (m, g, n, c₁) = (2, 2, 0, −2) with `v = 2((−1)(−1) − 2) = −2` (the §2.9 instance), or state m = 0 explicitly; in §4.1 make the Check either "E nonzero" or "E = 0", not both. The (0, 2) constant space is still empty (§3.7, §11.1), but for the stability reason, not for a negative v.

## R03 (P3) — The K3 genus-two Check conflates complex and real dimensions and names a non-regular instance as a match

Location: `README.md` line 359 ("A genus-two curve in a K3 surface in a class of square 2: `c₁ = 0`, `d_0 = (2−3)(−2) + 0 = 2`, matching the two-dimensional linear system").

Claim: the real signed dimension d₀ = 2 matches the linear system of the curve.

Witness: for a smooth genus-two curve C in a K3 surface with C² = 2, Riemann–Roch gives `h⁰(O(C)) = C²/2 + 2 = 3`, so |C| is a ℙ² of real dimension 4, not 2. The normal bundle is `K_C` (adjunction, trivial canonical bundle), with `h⁰ = 2`, `h¹ = 1`: the integrable structure is not regular (cokernel of complex dimension 1), and `2·(2 − 1) = 2 = d₀` is the index, not the dimension. For a generic tame J on the K3 the class has no representative at all, so the §2.9 regular stratum is empty there.

Repair: state it as the non-regular integrable instance (kernel 2, cokernel 1 complex; index 1 complex = d₀ = 2 real; actual real dimension 4) and as a negative control for the generic theorem, parallel to the product curves of §2.23.

## R04 (P3) — "Mathlib invariance of domain" does not exist at the pin and is not needed by the cited route

Location: `README.md` line 850 ("*Needs:* §7.1, §7.2, §5.3; Mathlib invariance of domain"), line 858 ("Mathlib fixed-point theorem and invariance of domain"), line 842 ("with the open-ball image open in a manifold neighbourhood").

Witness: grep of the pinned Mathlib and Tau Ceti for "invariance of domain", `invarianceOfDomain` and "Brouwer": no declaration (Tau Ceti stops at Jordan–Brouwer separation, `TauCeti/AlgebraicTopology/Singular/JordanBrouwer.lean`). Pardon's Lemma B.12.1 proof (pardon13 lines 7360–7365) uses only that a continuous injection of the closed ball into a Hausdorff space is a homeomorphism onto its compact image, plus the hypothesis that the restriction to any neighbourhood of 0 is surjective onto a neighbourhood of f(0) (supplied by Proposition B.11.5), and the proof of Theorem B.1.1(i)–(iii) (lines 7366–7375) adds nothing else. The theorem is owned by AbelianSchemesAndArithmeticModuliPartII §B2.9 (open head, `README.md` line 1376, "a continuous injective map f:U→ℝ^m from an open subset U⊆ℝ^m is an open embedding"), earlier in the merge order, and ImplicitAtlases cites it there (rev head line 23).

Repair: delete "with the open-ball image open in a manifold neighbourhood" and the two "invariance of domain" citations; the chart's image is open by the surjectivity hypothesis. If the manifold-openness clause is wanted, cite AbelianSchemesAndArithmeticModuliPartII §B2.9.

## R05 (P3) — Two library citations name the wrong library or no declaration

Location: `README.md` line 57 ("Relative singular homology … carriers of classes"), lines 120 and 219 ("Mathlib relative singular homology"), lines 233 and 728 ("Mathlib finite-dimensional Sard"), line 760.

Witness: the pinned Mathlib has absolute singular homology (`Mathlib/AlgebraicTopology/SingularHomology/Basic.lean`) and no relative version (grep "relative" in that directory: none); the relative theory is Tau Ceti's `TauCeti/AlgebraicTopology/Singular/Relative.lean`. The roadmap uses only absolute `H₂(X; ℤ)` and `u_*[Σ]`. Sard: the equal-dimension form Pardon's Lemma 9.2.7 needs (a regular value of `π∘f` with `π` a local projection to `T_pN`, pardon13 lines 4296–4297) is `MeasureTheory.addHaar_image_eq_zero_of_det_fderivWithin_eq_zero` (`Mathlib/MeasureTheory/Function/Jacobian.lean` line 645); the full Morse–Sard theorem is Tau Ceti's `ContDiff.addHaar_image_criticalPoints_eq_zero` and `ContDiff.dense_compl_image_criticalPoints` (`TauCeti/Analysis/Calculus/Sard/OutermostStratum.lean` lines 366, 397).

Repair: cite absolute singular homology at the pin (or Tau Ceti's relative file if a relative class is ever used), and name the Sard declaration consumed in §1.2 and §5.1.

## R06 (P3) — Process reference in the Lean docstring

Location: `Suggested.lean` line 46 ("Theorem 6 needs the implicit-atlas structure of ImplicitAtlases, a roadmap still in a pull request").

Witness: the README rules make files timeless; a reader a year from now cannot tell what "still in a pull request" meant. Repair: "the implicit-atlas structure of ImplicitAtlases §1.1, which is not in the pinned Tau Ceti".

## R07 (P3) — Check and locator corrections

- `README.md` line 686 ("One node, `m = 1`: the weighted index drops by 2 for `δ ∈ (0, 1)`; at `δ = 1` … drops by a further 2"): a node has two ends; crossing eigenvalue 0 removes the constants on both ends, `2·2m = 4` real dimensions for m = 1, and the common node constant restores 2m = 2, giving the stated net drop of 2 relative to the matched index; crossing eigenvalue 1 removes the `e^(it)` mode on both ends, a further 4, not 2. Say per end or per node explicitly.
- Line 779 (neck Check, "of order `|c₁ − c₂| e^(δR) R^(−1/2)`"): for the linear interpolation under the middle-centred weight the zeroth-order term is `|c₁−c₂|² ∫ (s/2R)² e^(2δ(R−|s|)) ds ≈ |c₁−c₂|² e^(2δR)/(R² δ³)` and the derivative term `|c₁−c₂|² e^(2δR)/(4R² δ)`, so the norm is of order `|c₁ − c₂| e^(δR) R^(−1)` up to δ-constants; the conclusion (unbounded as R → ∞) stands.
- Line 585 ("long-cylinder estimates … (Ivashkovich–Shevchishin Lemmas 3.7 and 4.1)"): Lemma 4.1 (is99 lines 1306–1309) is the conformal-radius containment lemma `Z(0, a₊) ⊂ A`; the long-cylinder energy and diameter decay with the common limiting node value is Lemma 3.7 (lines 1233–1242). Cite Lemma 3.7 for the neck statement and Lemma 4.1 only for the covering geometry of §3.6.
- §2.4 and §2.18 are definitions (carriers) with two Checks each; add a third discriminating one (for §2.4: the fixed-sphere model with a nonconstant map has residual isotropy exactly the finite `Aut(u)`; for §2.18: a convergent sequence in `T*S¹ × ℂP¹` with bounded first coordinate does have a common compact neighbourhood, so the comparison applies).

## Verified sound

**Gate, build and dependency check.** Worker's gate: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`. `lake env lean` on `Suggested.lean`: no output. Dependency check: `depcheck: 208 roadmaps, 1457 edges, 0 problem(s)`. The file declares nothing, so there is no elaborated signature to compare with the README; the `#check` step is void and is recorded as such. LaTeX delimiters in the README: 0; `lemma` in the Lean file: 0; `blob/` links: 0.

**Principles.** No route-specific shortcut (no semipositivity, no genericity on the virtual branch, line 29); no re-planned roadmap (domains are imported from ComplexCurveModuli, the engine from ImplicitAtlases, line 18–26); no cycle (HeegaardFloer consumes nothing, line 23); no copied passage found at any locator opened; no algorithm; no sorry'd data; no `set_option`. Declared gaps: none, and none needed (every supplier section cited exists where cited, below).

**Headline theorems.** The README's end theorems (line 3) are normalization (§0.5), stability (§1.2), generic-J smooth-simple manifold (§2.9), all-genus compactness (§3.7), topological regularity (§7.3) and the implicit-atlas axioms with orientation (§9.1–§9.2, §8.1); the docstring lists the same six. None is statable at the pins: a pseudoholomorphic map out of a compact Riemann surface needs `SmoothAlmostComplexStructure` on the domain, which the pin cannot produce for any complex one-manifold (constructors at `AlmostComplex.lean` lines 158, 195, 230, 263 only); nodal curves, bundle Sobolev spaces (`Wkp` is scalar on open subsets of a Euclidean space, `TauCeti/Analysis/Sobolev/Wkp/Basic.lean`) and the atlas structure are absent. The docstring names each with its missing carrier. Padding probe: no declaration to probe.

**Ownership.** `roadmaps grep` over main and the 440 open pull requests for stable (pseudo)holomorphic maps, Gromov compactness and implicit atlases: StableReduction (algebraic stable maps over a scheme, #898), HeegaardFloer at #957 (genus-zero strips and discs), DGFloer (#963, consumer of ImplicitAtlases) and ImplicitAtlases (#974, the engine, which states at its line 25 that it builds no stable maps) are the only other hits; GromovWittenTheory at its open head cites this roadmap as the supplier of Layers 1, 3, 4, 7, 9, 11–13 (its lines 25, 197–230, 256–275) and builds none of them. This roadmap is the owner.

**Supplier citations resolved, every one on main unless stated.** HeegaardFloer Lane F0 (lines 161–169), F1 items 1–3 (176–185), F2 items 1–5 (191–205; item 3 says "fixed genus-zero domains only", which the README restates at line 71). PDE Lanes A (223) and B (265). ComplexCurveModuli D0 items 1, 2, 3, 5 (lines 27–51; item 2 ends with the point-constrained restriction exact sequence used in §3.6; item 3 the `OnePoint ℂ` Möbius and genus-one lattice models; item 5 properness of the actual Diff action), D1 (53–61, including `unorderedAuxiliaryIsomorphismGroupoid` and partitions), D3 item 5 (98–102, derivative `2j₀(∂bar ξ+η)`, jointly moving marks), D4 (105–117), D5 (119–137), D6 item 1 with `roundAnnulusNormalization`, `annulusModulusFamilyComparison`, `protectedCollarAnnulusInterpolation`, `nodalAnnulusBranchLimit` (141–149), D6 item 4 with `finiteActionUniversalChart` and `unorderedAuxiliaryActionChart` (179–190), D7 item 1 with `forgetAuxiliarySet` and `forgetPartitionedAuxiliarySet` (196–206), D7 item 2 `markedPointCollisionBubbleCharts` (207–211), D7 item 3 clutching (212), D8 (215–221, with the `M̄_(1,1)` orders 2, 4, 6 and `M̄_(2,0)` order 2 that §13.3 repeats). ComplexKahlerGeometry K1 (96), K5 (568), K7 (1405). DifferentialGeometry 8.3–8.5 (Layer 8 items, lines 836–852). CharacteristicClasses C3 (720). AlgebraicTopology Stage 6 item 1 (relative singular cochains and coefficients), Stage 7 item 1 (Euler–Poincaré), Stage 8 item 7 (finite CW type of compact smooth manifolds via GeometricTopology item 1). GeometricTopology smoothing-and-triangulation comparison item 1 (line 938). Orbifolds O1–O5 (87–672). MorseNovikov N1 (75). FuchsianOrbifolds Layer 5 items 1 (`χ = 2 − 2g`) and 3 (branched-cover Euler formula and Riemann–Hurwitz), lines 313–331. ImplicitAtlases at its open head: §0.2 (line 109, exchange sign `(−1)^(dim E · dim F)` as §8.1 uses), §1.1–1.4 (284–347), Layers 2–4 (370–550), §4.3 (550), §5.1–5.4 (584–628, §5.2 is the boundary and cobordism law), §6.4 (728), Layer 7 (766–829). TopologicalSheafCohomology at its open head: Layers 0–2 (55, 108, 192). All of these roadmaps are on main or earlier in the merge order.

**Pinned declarations opened.** `SmoothAlmostComplexStructure` (line 67), `SmoothTwoForm.IsSymplectic` (`TwoForm.lean` 92), `Tames` (114), `Compatible` (157), `IsPseudoholomorphicAt`/`IsPseudoholomorphic` (`JHolomorphic.lean` 91, 103), `stdComplexLineEnergyDensity` (`Energy.lean`), the Fredholm modules of `TauCeti/Analysis/Fredholm` (Adjoint, ClosedRange, Restriction, Parametric, UniversalLevelSet, SardSmale), the degree and ramification declarations of R08, `ContinuousLinearMap.IsFredholm` (`Mathlib/Analysis/Normed/Operator/Fredholm/Basic.lean` 123), `IsFredholm.index_comp` (613), `LinearMap.index` (`Mathlib/Algebra/Module/LinearMap/Index.lean`), `ContinuousLinearMap.isClosed_ker` (`Topology/Algebra/Module/ContinuousLinearMap/Basic.lean` 663), `ContinuousLinearMap.pi` (`PiProd.lean` 208), `NonemptyCompacts` metric space (`Topology/MetricSpace/Closeds.lean` 292), the Vietoris topology on `Compacts` (`Topology/Sets/VietorisTopology.lean`; second countability is not there and §3.3 rightly proves it), `ContractingWith.fixedPoint` (`Topology/MetricSpace/Contracting.lean` 275), `Units.oneSub` (`Analysis/Normed/Ring/Units.lean`), `Representation` (`RepresentationTheory/Basic.lean` 48), the Baire files (`Topology/Baire/`), the open-mapping theorem (`Analysis/Normed/Operator/Banach.lean`).

**Sources read at their locators.** wendl10 is arXiv v2 = "Version 3.2" (line 8), as cited. Line 1927: `∂̄_J u = Tu + J∘Tu∘j`, unhalved. Def. 4.2 (5081–5083): `vir-dim = (n−3)(2−2g) + 2c₁(A) + 2m`. Prop. 4.3 (5107–5112): factorization through a curve embedded outside a finite set, unique up to reparametrization; Def. 4.4–4.5 simple and somewhere injective. Thm 4.8 (5150–5157): M need not be compact, U of compact closure, as §2.18–§2.21 use. Thm 4.43 (5909–5917): regular nonconstant locus an orbifold with isotropy `Aut(u)`, proof in the stable case. Thm 4.45 (6019), Thm 4.48 (6082–6089), Prop. 4.49 (6099), Prop. 4.55 (6263–6276, evaluation a submersion on the universal space), Lemma 4.56 (6280–6283), Lemma 4.57 (6325–6326, symmetric anticommuting Y with `Yv = w`), Lemma 4.59 (6449–6455, the bounded pieces). is99: Thm 1.1 (299–307) with hypotheses a)–c); Remark 2 (314–326, marks by attached constant discs); Def. 1.11 (401); Lemma 3.1 (1026–1031, `2 < p < ∞`, ε₁ independent of p, `‖du‖_(L^p(½∆)) ≤ C_p‖du‖_(L²)`); Cor. 3.6 (1208–1216); Lemma 3.7 (1233–1242); Lemma 3.8 (1249–1252, spheres, structures L∞-close); Lemma 4.1 (1306–1309); Thm 4.2(a)–(g) (1330–1347), matching §3.6's seven conditions one for one; Lemma 4.3 (1576); Lemma 4.5 (1902). pardon13: Def. 9.2.1 (4142–4154, the 6-tuple exactly as §5.1), Def. 9.2.2 (4155–4159), Def. 9.2.3 (4160–4172), Prop. 9.2.6 (4269–4283), Lemma 9.2.7 (4290–4297, equal-dimension Sard), Lemma 9.2.8 (4298–4306), Lemma 9.2.9 (4307), Thm 9.2.10 (4353), Thm B.1.1 (6182–6188), §B.4 (6405–6444: `k ≥ 6`, `δ ∈ (0,1)`, ends `[0,∞)×S¹`, node value `ξ(n)`), Lemma B.5.1 (6512), Prop. B.7.9 (6884), Lemma B.9.1 (7013), Lemmas B.10.2–B.10.3 (7059, 7086), Prop. B.10.4 (7098), Lemma B.11.2 (7203–7209, `µ < 1`, derivative decay), Prop. B.11.5 (7312), Lemma B.12.1 (7353–7365), §B.13 (7376–7396, codimension-two extension).

**Adversarial table.**

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `v = 2((m−3)(1−g)+c₁+n)` (§0.1) | (3,0,0,0); (1,0,3,2); (2,1,0,0); (m,0,2,0) | 0; 2(−2+2+3)=6; 0; 2(m−3+2)=2m−2 | first three match the Checks; the fourth is 2m−2, the Check says −2 | R02 |
| Pardon dim = v + dim E (§4.1) | general | (6g−6+2n+2ℓ)+2m(1−g)+2c₁+dim E−2ℓ = 2((m−3)(1−g)+c₁+n)+dim E | identity | none |
| Energy of id on ℂP¹ (§0.1) | area-1 Fubini–Study | `E = ∫u*ω = 1`; unhalved `∫|du|² = 2` | pins the ½ convention | none |
| `g_J(v,w) = (ω(v,Jw)+ω(w,Jv))/2` (§0.1) | ℂ, J=i, ω=dx∧dy, v=(1,0) | g(v,v)=ω(v,iv)=1 >0; symmetric by construction | metric, energy = area for J-curves | none |
| Index `rχ + 2c₁` (§0.3) | sphere O, TS²; torus O; genus-2 O | 2; 2+4=6; 0 (ker 2, coker 2); −2 (ker 2, coker 4) | all four Checks hold | none |
| Riemann–Hurwitz and `D(u) = dD(v) − (m−3)R` (§0.5) | d=2, g₀=0, R=4, m=2, c₁(line)=3 | g=1; D(v)=−2+6=4; D(u)=0+12=12; 8+4=12 | identity holds; general proof: `(m−3)(d(2−2g₀)−R)+2dc₁(v)` | none |
| Equality `g(Σ)=g(Σ₀)` cases (§0.5) | solve `R = (d−1)(2−2g₀)` | g₀≥2 ⇒ d=1; g₀=1 ⇒ R=0; g₀=0 ⇒ R=2d−2 | the three stated cases, no others | none |
| `B = u⁻¹(u(Crit u))` and the covering (§0.4–§0.5) | `z ↦ z²(z−1)` | Crit = {0, 2/3}; u⁻¹(0) = {0, 1}: 1 ∈ B∖Crit; a partner of z ∉ B cannot lie in B since u(z) ∉ u(Crit) | both Checks and the properness step hold | none |
| Coincidence lemma Checks (§0.2) | (z,0) vs (ζ²,0); (z,0) vs (0,ζ); (z,0) vs (ζ,ζ²) | φ(ζ)=ζ²; coincidence set {0}; {0} | hypotheses discriminate | none |
| Stability ⇔ constant components pointed stable (§1.2) | z↦z² unmarked; constant unmarked torus; constant 3-marked sphere | Aut = {±1}; Aut ⊇ T²; Aut trivial | both directions witnessed | none |
| Anticommuting and compatible variations (§2.1) | ℝ², Y=[[a,b],[b,−a]], v=e₁, w=e₂; ℝ⁴ | ω(Ye₁,e₂)=a=ω(Ye₂,e₁); dims 2 = dim Sp(2)/U(1); 8 and 6 = dim Sp(4)/U(2) | Check holds | none |
| Chart `Y ↦ (1+JY/2)J(1+JY/2)⁻¹` (§2.1) | derivative at 0 with YJ=−JY | ½(JYJ − J²Y) = ½(Y+Y) = Y | identity derivative, well-formed chart | none |
| Node-matching codimension 2m (§2.2) | one node, two spheres; self-node z≠z′ | kernel of `ξ ↦ ξ(z₁)−ξ(z₂)` onto `T_xX`, codim 2m; bump near z only | holds; junk z=z′ excluded by D1's distinct flags | none |
| `d_r = (m−3)(2−2g)+2c₁+2r` vs v and a_g, t_g (§2.5) | g=0,1,2 | (a,t)=(6,0),(2,2),(0,6); `m(2−2g)+2c₁−a_g+t_g+2r − d_r = 0` each | consistent | none |
| Anchor cancellation (§2.7) | 3 anchors on sphere; 1 on torus | 6−6=0; 2−2=0 | holds | none |
| `d₀` instances (§2.9) | lines; conics; K3 genus 2; CY₃; genus-2 with c₁=−2 | 4; 10; 2 (index), actual 4, coker ℂ; 0; −2 | K3 Check wrong (dimension 4, non-regular) | R03 |
| Fixed-j dimensions (§2.10) | g=0,1,2 | d₀; d₀−2; d₀−6 with d₀(g=2)=−2m+6+2c₁ | consistent | none |
| Exceptional curve evaluation (§2.11) | Bl_pℂP², c₁·E=1 | d₀=−2+2=0; marked 2; image E of dim 2 in dim 4 | not a submersion, as stated | none |
| Incidence counts (§2.15) | lines/2 pts; conics/5 pts; lines/3 pts | 8−8=0; 20−20=0; 10−12=−2 | consistent | none |
| Pinned Sard–Smale threshold (§2.12) | lines in ℂP², N=4 | pin needs `(dim ker)²+1 = 17` at a regular point, more at critical points; README `q ≥ 5` | hypothesis not met | R01 |
| Koszul factor (§2.17) | (1,2); (1,1) | +1; −1 | correct | none |
| Joint operator factor ½ (§2.20) | derivative of `(du+J du j)/2` in J | `½ Y∘du∘j` | correct | none |
| Escape test (§2.22) | ℝ²×S², m=2, c₁=2 | d₀=−2+4=2; normal O: ker ℂ, coker 0; tangent O(2): ker ℂ³, coker 0; 8−6=2 | regular, escaping | none |
| Product class (§2.23) | (g,n)=(1,2); (0,n); n=1; degree-2 first projection | expected 0, actual 2, coker 1 complex; 2(n−1)=2n−2; 0=0; energy 2·area ≠ area | all consistent; `c₁·A = 2−2g + 0` | none |
| Contracted-tree flag count (§3.1) | (V_orig,V_ins)=(1,2); (0,1) | 3+4−4=3>2; 2 | only pure inserted trees contract | none |
| `Σ_v(2g_v−2+val_v)=2g−2+n` and bounds (§3.7) | general; (0,0,1); (0,4,0); conic a=2 | `2Σg_v−2V+2E+n` with `b₁=E−V+1` gives 2g−2+n; (0,0); (2,1); #edges ≤ 3, #ghost ≤ 2 | identity and bounds hold | none |
| Conic degeneration (§3.8) | `[s²:εt²:st]`; z=s/t; z=εw; zv=ε | XY=εs²t²=εZ²; `[z:ε/z:1]→[z:0:1]`; `[εw²:1:w]→[0:1:w]`; x=z, y=v, xy=ε; L+L=2L | holds | none |
| Nodal index bookkeeping (§4.1) | two lines at a node; constant sphere with 3 nodes | 10+10−12+4−4+2=10=v; 2m−6+6−6m=−4m | holds | none |
| Weighted index per end/node (§4.2) | one node, m=1, δ∈(0,1); δ crosses 1 | per end −2, per node −4, +2 common constant = −2 net; crossing 1: −4 more per node | Check says "further 2" | R07 |
| Thickening datum (§5.1) | stable domain; unmarked sphere | D=∅, r=0, `2g+n>2`; r≥3 | matches Pardon Def. 9.2.1(i)–(vi) | none |
| Neck norm of an interpolation (§6.1) | c₁ at −R, c₂ at R, middle-centred weight | zeroth order `≈|c₁−c₂|²e^(2δR)/(R²δ³)`, derivative `≈|c₁−c₂|²e^(2δR)/(4R²δ)` | unbounded; power is R⁻¹ not R^(−1/2) | R07 |
| Weight ratio on a neck (§6.3) | length 2R, `e^(δ|s|)` | `e^(−δR) → 0` | correct sign | none |
| Lemma B.12.1 route (§7.3) | Pardon lines 7360–7375 | compact-Hausdorff bijection + surjectivity onto a neighbourhood; no invariance of domain | citation unneeded and absent at the pin | R04 |
| Two-line chart dimension (§7.3) | ε∈ℂ plus pairs of lines through a point | 2 + (4+2+2) = 10 = v | holds | none |
| Obstruction swap sign and family parity (§8.1) | (1,1),(1,2),(1,3); v=10, dim P=1 | −1,+1,−1; 11, signs + at 1 and − at 0 | correct | none |
| Constant class over a point (§9.2) | (g,n)=(0,3); (1,1); (2,0) | v=0, point; v=2, sphere, weight ½; weight ½ | matches D8's isotropy orders | none |
| Tame structures not convex (§10.1) | `J_a=[[a,−(1+a²)],[1,−a]]`; midpoint of J₁, J₋₁ | J_a²=−id; ω(v,J_av)=(x−ay)²+y²; midpoint² = −2·id | Check holds | none |
| Clutching genus (§11.2) | external 0+0; self-clutch 2-marked sphere | 0; 1 | holds | none |
| Forget-compatible dimension (§12.2) | v(n+1) = v(n)+2 | `v+2+dim E` both sides iff dim E′ = dim E | holds | none |
| Three-point invariants (§13.4) | lines, (0,3): v=10 | 3 points: degree 12 > 10 → 0; 2 points + line: 8+2=10 → 1 | holds | none |

## Not verifiable

- McDuff–Salamon, *J-holomorphic Curves and Symplectic Topology*, 2nd ed. (Lemmas 2.4.1, 2.4.3, Prop. 2.5.1, §3.2, Chapter 4, Appendix A): the DOI resolves only to the AMS bookstore; the README says so and cites by locator alone (settled as uncertified).
- Robbin–Ruan–Salamon, *The moduli space of regular stable maps*: paywalled Springer page only; cited by locator alone, as the README states.
- Robbin–Salamon's corrigendum: cited without a locator for the domain-family input consumed through ComplexCurveModuli; not fetched.

## Source issues

- none
