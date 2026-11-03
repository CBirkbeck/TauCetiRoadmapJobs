# Review of HeegaardFloer (pull request #1776 at 890d216)

**Verdict:** needs changes

The supplied previous report identifies PR #957 at `dedee83`, rather than this PR/head. I compared its five findings with the actual files; I did not assume its earlier acceptance established their truth. No supplied repair report marks a finding non-actionable.

| Previous finding | Passage at this head | Disposition |
| --- | --- | --- |
| R01: missing definition Checks | `README.md:597`, “Bott trajectories and orientation coefficients”; `:1818`, “Sobolev surface and bundle adapters” | Not repaired. There are 63 numbered subsections, 22 Checks blocks in 21 subsections, and 42 subsections without one. The previous count of 43 was inaccurate. See R07. |
| R02: unsupported consumer assertions | `README.md:4210`, “its N5 applies F0.6's return-map germ”; `:4222`, “its H7 consumes M.9a's cup product” | Not repaired against the consumers on main. See R08. |
| R03: supplier overclaims | `README.md:2212`, “DG 3.5's full maximal time-dependent flow”; `:2357`, “GT Layer1's general-ambient orthogonal tube” | Not repaired. The stronger imported interfaces are still absent from those suppliers on main; R05 distinguishes the missing constructions from minor attribution repairs. |
| R04: broken inbound anchors | `README.md:203`, “Layer 1: Morse homology”; `:1811`, “Layer 3: the Cauchy–Riemann elliptic package” | Partly upheld: the Lane M link is broken. The old report overstates the Lane F1 case: DGFloer uses a fixed historical commit, not this head. See R09. |
| R05: locator and process wording | `README.md:2480`, “arXiv:1011.1690v3.2”; `:1881`, “Any code integration follows the repository's” | Not repaired. The Wendl work is arXiv v2, internal Version 3.2; the theorem is on printed p. 121. See R10. |

## R01 (P1) — The targeted build emits the warning rejected by the gate

**Location:** `TauCetiRoadmap/HeegaardFloer/Suggested.lean:1`, `import Mathlib`.

**Claim:** the acceptance module passes the required build with only admitted-proof warnings.

**Witness:** The supplied gate has `build=1 FAIL`. Re-running the targeted build reproduces the Mathlib module-system warning, although Lake exits successfully. Direct Lean elaboration does not emit that warning.

**Repair:** add the module-system header supported by this pin, retaining the permitted imports and the seven target statements, then rerun the gate with its build check. A scratch copy with just `module` prepended elaborates with only the seven `sorry` warnings. Adding `public section` without changing import visibility instead fails; that is not the tested repair. This is P1 because the brief explicitly classifies the failed build gate as P1, not because the seven statements failed elaboration.

## R02 (P1) — The bordered pairing Check reverses the algebra convention

**Location:** `TauCetiRoadmap/HeegaardFloer/README.md:3952`, “pairing CFA(Y₁) over A(Z) with a type-D structure over A(Z) instead of A(−Z) is undefined”.

**Claim:** the two factors of the displayed bordered pairing must use different algebras.

**Witness:** `lot` lines 379–387, Theorem 1.3, printed p. 5, tensors over A(Z). If ∂Y₂=F(−Z), its type-D algebra is A(−(−Z))=A(Z). The theorem immediately above this Check uses that convention correctly.

**Repair:** replace the Check by the double-reversal calculation, distinguishing boundary parametrization from the algebra of the type-D invariant. Both factors use A(Z); reversing the boundary is essential. Do not justify the wrong convention by nonmatching idempotent rings: in genus one both rings identify with 𝔽₂×𝔽₂. For a right generator y and left generator x supported at the same primitive idempotent, with zero higher operations/differential, y⊗x is defined and nonzero, and its differential is zero.

## R03 (P1) — The genus-one bigon sum is not periodic

**Location:** `TauCetiRoadmap/HeegaardFloer/README.md:3669`, “Concatenating the bigon A from x to y with the bigon B from y to x gives a periodic class”.

**Claim:** the two positive bigons form a periodic class of Maslov index 2.

**Witness:** `TauCeti/LowDimTopology/Heegaard/CircleTimesSphere.lean:193` requires D₁+D₂=2D₀ for periodicity. The proposed positive sum has (D₀,D₁,D₂)=(0,1,1): 2≠0. Lines 212 and 218 give both bigons the same direction.

**Repair:** use A followed by the inverse class of B, explicitly allowing a signed, nonholomorphic second class. The difference has coefficients (0,1,−1), so 0=0 in the periodicity equation, Euler measure 0, both point averages 0, and μ=0=1+(−1). The pinned theorem `maslovIndex_circleTimesSphere_periodic` at line 302 gives exactly this index. Keep the positive-bigon calculation μ=1, but do not attach geometrically impossible endpoints to its sum.

## R04 (P2) — Area equality needs the rank-deficient case

**Location:** `TauCetiRoadmap/HeegaardFloer/README.md:2572`, “the second exactly when the image plane is J-complex and positively oriented”.

**Claim:** equality in the area-versus-symplectic-area inequality characterizes a positive complex image plane for every map from a surface.

**Witness:** For u(s,t)=s into ℂ, u_s=1 and u_t=0. Both wedge area and ω(u_s,u_t) are 0, while the image of du is a real line, not a complex plane.

**Repair:** say equality holds if rank du≤1, or if rank du=2 and its image plane is positive J-complex. The earlier linearly independent formulation at line 2563 already has the needed restriction. Preserve the combined equality criterion u_t=Ju_s: the same rank-one example has energy density 1/2>0, while a constant map gives 0=0=0 and satisfies the CR equation. Add these two degenerate Checks alongside the existing rank-two examples.

## R05 (P2) — Stronger flow and tube interfaces are treated as supplied

**Location:** `TauCetiRoadmap/HeegaardFloer/README.md:2212`, “Consume DG 3.5's full maximal time-dependent flow”; `:2357`, “Retain GT's zero-section derivative, smooth inverse and positive radius function”.

**Claim:** the cited suppliers on main provide these complete, normalized interfaces.

**Witness:** `TauCetiRoadmap/DifferentialGeometry/README.md:399` lists time-dependent existence only. `TauCetiRoadmap/GeometricTopology/README.md:218` gives a normal-bundle neighborhood diffeomorphism. Neither stated contract specifies the stronger data consumed here. No matching declared supplier gap exists.

**Repair:** cite those actual inputs and make the remaining maximal-flow, compact-time escape, orthogonal exponential-tube and derivative/radius comparisons explicit targets here, with dependencies and locators; alternatively declare precise supplier gaps through the prescribed plan/README mechanism. A revision of DifferentialGeometry in an open PR cannot replace its main contract. For the tube, composing an allowed normal-bundle neighborhood diffeomorphism with fibre dilation by 2 preserves the cited existence conclusion but changes its vertical derivative from identity to twice identity. Require and construct the normalized derivative to exclude this model. For the flow, x′=x² has local solutions x/(1−tx), with a pole at t=1/x; local existence alone supplies neither a global time interval nor the compact escape argument.

The remaining attribution discrepancies from previous R03 are itemized with their actual owners in the supplier audit below; they should be repaired at the same time.

## R06 (P3) — The new scalar companion is calibration padding

**Location:** `TauCetiRoadmap/HeegaardFloer/LinearNeckTargets.lean:5`, “Scalar calibrations for stabilized linear gluing in F1.4”; `README.md:2068` links it.

**Claim:** these declarations belong in the roadmap's Lean acceptance files.

**Witness:** All ten declarations concern only tanh, cosh, exp, scalar derivatives, limits or positivity. None states the Sobolev inverse, obstruction sequence or gluing theorem; the companion docstring itself distinguishes those missing constructions.

**Repair:** delete the companion and its README file link; keep the scalar calculations as README Checks. This is the required “delete it from `Suggested.lean`” padding repair applied to the additional acceptance file, not a request to prove calibrations in place. Its three definitions and seven theorems also lack declaration docstrings. The six admitted theorems elaborate, but that does not make them headlines. At R=0 they reduce to a₀=1, F₀=eˢ and F₀′=F₀; the actual cancellation and inverse-growth targets still require the Sobolev construction.

## R07 (P3) — Definition APIs and discriminating Checks remain incomplete

**Location:** `TauCetiRoadmap/HeegaardFloer/README.md:597`, “Bott trajectories and orientation coefficients”; `:1818`, “Sobolev surface and bundle adapters”; `:3565`, “Carriers, domains and dependency order”.

**Claim:** each definition has its API and at least three discriminating Checks in the prescribed form.

**Witness:** Forty-two numbered subsections have no Checks block. M.6's orientation convention, F1.1's Sobolev adapters and F5.0's labelled domains are examples. Inline calculations do not supply the required per-definition API/Check lists.

**Repair:** organize the existing mathematical laws into per-definition API bullets, move the worked tests into Checks lists, and fill the genuine gaps. For M.6 use determinant −1, determinant +1 and dimension 2; for stable genus-zero domains use three special points giving 1>0, two giving 0, and a node counted on both normalization branches. Repeat this at each definition, rather than treating three tests for an entire layer as sufficient. The inventory is §1.0a–b, §1.4–1.10, §2.4–2.5 and §2.7–2.9, §3.1–3.5, §4.2–4.5, §4.6d–e and §4.6g–h, §4.7, §5.1, §6.4–6.9, §7.0, §7.3, and §8.1–8.3, including the lettered subsections within those ranges.

## R08 (P3) — Consumer descriptions do not match the consumers on main

**Location:** `TauCetiRoadmap/HeegaardFloer/README.md:4202`, “each consumes the sections named and makes its own comparisons there”.

**Claim:** the listed consumers already specify those imports and comparisons.

**Witness:** `TauCetiRoadmap/MorseNovikov/README.md:309` constructs the general local-return germ independently. `TauCetiRoadmap/DGFloer/README.md:217` owns filtered-complex spectral-sequence adapters. Neither passage delegates those constructions to the asserted HeegaardFloer sections.

**Repair:** distinguish intended downstream comparisons from assertions about those files. Record the proposed ownership moves explicitly and identify the consumers' remaining specialization/comparison targets; do not create a reverse supplier edge. Check the other named consumers against their texts as listed below. For example, the corrected sentence about MorseNovikov must acknowledge its existing general-field germ and designate the comparison, rather than assert that N5 already imports F0.6. The conjugacy hPh⁻¹ has the same derivative eigenvalues on both constructions; that comparison is the concrete common interface.

## R09 (P3) — The Lane M inbound anchor no longer resolves

**Location:** `TauCetiRoadmap/HeegaardFloer/README.md:203`, the Layer 1 heading.

**Claim:** the retained lane names still resolve, as promised at line 56.

**Witness:** `TauCetiRoadmap/RiemannianGeometry/README.md:161` uses a relative link to the old Lane M anchor. That anchor is absent. DGFloer’s historical-commit links do not establish a second broken link at this head.

**Repair:** add the explicit alias `lane-m-morse-homology-stage-0` before Layer 1. Its target count then changes from zero to one without changing the layer numbering.

## R10 (P3) — Correct locators and remove process wording

**Location:** `TauCetiRoadmap/HeegaardFloer/README.md:2480`, “arXiv:1011.1690v3.2”; `:4304`, “pp. 131–132”; `:1881`, “Any code integration follows the repository's”.

**Claim:** citations identify the text at its printed locator and the roadmap is timeless mathematical prose.

**Witness:** `wendl` lines 5085 and 5107–5117 place Proposition 4.3 and Definitions 4.4–4.5 on printed p. 121, PDF p. 131, in arXiv:1011.1690v2. The repository-coordination sentences are process requirements, not mathematics.

**Repair:** use arXiv v2, internal Version 3.2, printed p. 121; remove the two code-integration coordination sentences, and replace “reconciliation1” by R1 (§8.1). Add exact locators beside the F0.0 sharp Sard–Smale and determinant-family targets, the residual genericity part of F0.6, F1.2's boundary solver, and F4.2–F4.4's individual comparisons. Teschl's return-germ locator does not cover residual genericity. The new general stabilized gluing theorem also needs its own locator and explicit F1.1/domain-estimate dependency; a Maslov-path citation does not locate that analytic theorem. Keep the demonstrated values and the full generality; do not replace these targets by scalar examples.

## Verified sound

This section records successful falsification tests and resolved inputs, not proofs of the admitted theorems. The three mathematical failures above were missed by the earlier report's examples. The unchanged parts were reviewed as well as the new gluing passage.

**Gate, scope and pins.** The diff outside `TauCetiRoadmap/HeegaardFloer` is empty. The PR adds the gluing discussion to an existing roadmap and adds the companion; it does not replace the base roadmap with a new plan. No source passages, algorithms, sorry-valued data, free-Prop stand-ins or `set_option` were found in the reviewed files. No declared gaps were supplied. The text-only gate rerun passes, but does not run the build unless requested. The supplied build gate fails as R01; the independent targeted build reproduced the additional module warning. Lake itself returns 0. Direct elaboration of `Suggested.lean` returns 0 with exactly seven admitted-proof warnings.

The dependency check was rerun against main and the supplied merge order:

```text
depcheck: 205 roadmaps, 1658 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The sharper mathematical contracts still need the corrections in R05/R08; a graph check cannot establish their content. The text gate reports zero for all its scanners, including outside-folder, stray-files, imports, sorry-data and missing README identifiers.

Mathlib pin: `f6090c7095e1e56b3464c1daba5f24631f1290d2`. Tau Ceti pin: `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`.

**Headline coverage and signatures.** The README's end results are integral Morse/Bott homology and singular comparison; filtered/bundle, product/duality/cup and Witten comparisons; sharp Sard and Sard–Smale; determinant/orientation transport and CR index/gluing; Darboux/Moser; sphere normalization, compactness, evaluation and ruling/group theorems; nonsqueezing; compact Lagrangian discs and nonexactness; exact Floer invariance/Morse comparison; Heegaard Floer invariance, absolute/relative gradings and based naturality; cylindrical equivalence, bordered pairing and knot Floer; and R1–R3's nice-diagram, completed lattice and grid comparisons.

All seven retained `Suggested.lean` signatures were re-elaborated with `#check @name` on a scratch copy and compared with the README: `sharp_sard` (line 69), `sharp_sardSmale` (82), `exists_darbouxChart` (114), `exists_standardDarbouxChart` (125), `sphereAut_existsUnique_map_triple` (149), `nonsqueezing` (166), and `exists_nonconstant_holomorphic_disc_in_component` (189). No needed section binder disappeared: Haar/finite dimension, completeness, Hausdorffness, source second countability, boundarylessness, positive k, distinct marked points, positive radii/dimension, compact L and its marked point remain explicit. No signature change was made.

The module docstring names the geometric headlines not stated and the missing chain, moduli, determinant-bundle, domain or comparison carriers. I found no additional statable headline forced through an unrelated substitute. In particular, the pinned rational combinatorial Maslov expression does not define a geometric Whitney class or prove its analytic integrality. The companion's ten types were also elaborated; its nonnegative-R bound is retained.

For each of the seven admitted headline theorems I tried `simp`, `rfl` and `infer_instance` separately on scratch copies. None closed. Searches by object found no single pinned theorem giving the general sharp regularity bounds, Darboux chart, marked PSL equivalence, nonsqueezing or compact Lagrangian disc theorem. The companion's six admissions also fail the single `simp` probe; R06 concerns their role as calibration Checks, independent of proof length. Its proved positivity theorem is elementary arithmetic on `Real.exp_pos` and `Real.cosh_pos`.

**Seeded source sample (all 15 requested targets).** Sources were fetched through the sources service. The locators below refer to the versions actually read; no source text was copied into the repository. A located supporting result does not certify every additional adapter promised by the subsection.

| Target | Text inspected, hypotheses and outcome |
| --- | --- |
| M.1 (§1.1) | `hutchings` lines 262–325, §2.2, printed pp. 8–10: negative gradient, Morse–Smale intersections, translation quotient, dimension drop by one, and the exceptional constant trajectory. Supports the retained nonconstant quotient and orientation convention. |
| M.6 (§1.6) | `hutchings` lines 1085–1120, §6.2.1, pp. 33–34, and 1133–1164, §6.2.3, p. 35: iterated endpoint transversality and orientation coefficients. It explicitly does not require every endpoint map to be a submersion. The nonorientable trajectory-space warning matches the README. OCR garbles the dimension display, so I independently computed the dimension rather than treating that OCR as a verified formula. |
| F0.0 (§2.2) | The pinned Fredholm normal form and parameter algebra were opened. `audin-damian` lines 9776–9785, Theorem 8.5.7, p. 264, states the smooth separable-Banach version only; it does not certify the sharp finite-k extension or determinant-family theorem. `sard` lines 91–92, Theorem 4.1, p. 885, and 275–278, Theorem 7.2, p. 889, supply the finite-dimensional input. Missing sharp infinite-dimensional/determinant locator: R10. |
| F0.6 (§2.8) | `teschl` lines 9184–9216, Lemma 6.9, pp. 197–198, and 14067–14098, equation (12.9)/Theorem 12.4, p. 317: C^k local hitting branch at a transverse section; monodromy spectrum is the return spectrum plus the flow eigenvalue 1. Supports the local germ, not the stated all-iterate residual theorem. R10. |
| F1.2 (§3.2) | The explicit normalized boundary kernel was recomputed below. The McDuff–Salamon analytic text was unavailable. The source list does not give an exact locator for the Hölder/Sobolev augmented boundary solver. This part is not source-certified. |
| F2.1 (§4.1) | Pinned two-form/nondegeneracy and symplectic-basis inputs opened; Moser sign and Darboux models recomputed. *Introduction to Symplectic Topology*, 3rd ed., §3.2 was inaccessible. The Hodge primitive is an adapter from the cited main Hodge theory; the stronger flow contract is R05. |
| F2.2 (§4.2) | MS Lemmas 2.4.1–2.4.3 were not readable legally in this run. The README retains C¹ for isolated preimages/critical points and C² for local coincidence factorization, rather than claiming the same threshold for all three steps. Local model computations appear below; exact lemma hypotheses remain uncertified. |
| F2.6b (§4.6b) | `wendl` lines 5107–5119, Proposition 4.3 and Definitions 4.4–4.5, printed p. 121: closed connected nonconstant source, branched factorization, finite exceptional set and simple iff somewhere injective. Supports the sphere specialization; correct the version/page via R10. MS Proposition 2.5.1 remains unread. |
| F2.6f (§4.6f) | `gromov` lines 134–158, §0.3.A Corollary, printed pp. 310–311: the ball/cylinder radius obstruction. The author-hosted published scan was read after an initially incorrect URL returned a webpage. The README's positive dimension/radii and compact-inner-ball argument avoid the empty-ball and unbounded-image shortcuts. |
| F4.1 (§6.5) | `perutz` lines 74–81, Proposition 1.1, p. 3, and 111–125, Theorem 1.2, p. 4: disjoint independent attaching circles, small λ, two-intersection handleslide, positive λ for the Hamiltonian criterion, and the stated area balance. Supports the route with these restrictions. |
| F4.2 (§6.6) | `os-disks` lines 1546–1549, Theorem 4.9, p. 37; `lipshitz` lines 1067–1104 and 1155, Corollary 4.3/Proposition 4.8/Lemma 4.11, printed pp. 981–982 and 984; `lipshitz-erratum` lines 24–39 and 59–110. The erratum preserves the embedded-holomorphic index formula and repairs its extension to arbitrary classes. The README retains the corrected representative construction; R03 concerns its separate bad Check. |
| F4.3 (§6.7) | `os-disks` lines 739–757, Definition 3.1, p. 19; 1553–1559, Definition 4.10, p. 37; 1592–1622, Lemma 4.13, pp. 38–39. The nearly-symmetric restrictions and weak admissibility at fixed Spinᶜ/index/basepoint multiplicity agree. The extra uniform-parameter and strip/triangle adapters need individual locators, not only these citations. |
| F4.4 (§6.8) | `os-disks` lines 76–90, Theorem 1.1, p. 2, and `perutz` lines 111–125. These support invariant groups and the area-balanced Hamiltonian handleslide. Perutz alone does not prove the continuation energy, degeneration or chain-homotopy comparisons promised here; the README correctly keeps them as work. |
| F5.4 (§7.4) | `lot` lines 1431–1480, §3.1.1/Definition 3.2, pp. 29–30; 1777–1787, Definition 3.23, p. 36; 1138–1169, §2.4/equation (2.29), pp. 21–22. Read the upward partial-permutation algebra, inversion-additive multiplication, matched-circle subalgebra, ground idempotents and bounded box tensor. The noncommutative grading data at lines 1312–1329 is not an automatic integer grading. The README keeps that distinction. |
| F5.6 (§7.6) | `os-knots` lines 371–375, Lemma 2.5, p. 10, and 472–504, p. 13: relative Spinᶜ difference and the (n_w,n_z) filtered differential for null-homologous knots. `mos` lines 220–225, Theorem 1.1, p. 5: the V^(n−1) factor with bigradings (0,0),(−1,−1). The README separates general relative structures, null-homologous normalization and the grid associated graded. |

**Adversarial values.** “Survives” means these stated instances did not refute the target; it does not turn a plan into a proof. The 94 rows include the sampled targets, the headline results, every mathematical finding, the new linear-neck model, and the remaining subsection constructions. Arithmetic uses the README's negative-gradient, homological and Hamiltonian sign conventions.

| Statement/convention | Instances and computed values on both sides | Result; change |
| --- | --- | --- |
| M.0a stable/unstable spaces | f=−x²+y²: Hessian diag(−2,2), −grad=(2x,−2y); unstable/stable dimensions 1 and 1 versus index 1 and codimension 1. | Survives; list Checks. |
| M.0b standard metric/time | Same quadratic: flow (e^(2t)x,e^(−2t)y); half-quadratic source model gives e^(±T), agreeing at T=2t. | Survives; retain factor 2. |
| M.1 parametrization and quotient | Index 2→0: intersection dimension 2, quotient 2−0−1=1. Constant orbit: stabilizer ℝ, actual quotient dimension 0 rather than −1. | Survives; constant orbit excluded from free quotient. |
| M.2 broken corners | 2→1→0 has one neck, codimension 1; 3→2→1→0 has two necks, codimension 2. | Survives. |
| M.3 orientation and d² | Boundary exponents ind p+ind r−1 and ind p+ind r+1 differ by 2. On ℝP²: d₂=2,d₁=0 gives H₂=0,H₁=ℤ/2,H₀=ℤ; mod 2 gives one generator in all three degrees. | Survives; integral coefficients matter. |
| M.4 quartic flow | f=Σ(x²−1)²/4: x′=x(1−x²), rates 1 at 0 and −2 at ±1; derivative of log abs(x)−½log(1−x²) along flow is 1. | Survives. |
| M.4 compactified cube | Boundary strata count 6+12+8=26; triangulated sphere Euler number 48−72+26=2. | Survives. |
| M.5 circle complex | D=I−S=[[1,−1],[−1,1]]; kernel and cokernel both ℤ. Tracking by π is S; a sufficiently small admissible continuation gives I. | Survives; keep maps distinct. |
| M.5 chain homotopy/composition | K=−I gives DK=KD=S−I. Two π/3 steps lie within 5π/12, while 2π/3 does not; subtracting π gives −π/3 in the opposite basin. | Survives; strict equality of maps is not asserted. |
| M.5 continuation collar | h=(t²−1)²/4: h″(0)=−1,h″(1)=2; product Hessian contributes index shifts 1 and 0, respectively. | Survives. |
| M.5a relative boundary | H₁([0,1],{0,1})=ℤ, while H₁([0,1])=0; oriented endpoint coefficients +1 and −1 sum to 0. | Survives. |
| M.6 Bott dimension | λ_C=2, λ_D=0, dim C=1 gives 2−0+1−1=2; forgetting dim C would give 1. | Survives; add Check. |
| M.6 fibre-product orientation | Columns (1,1),(1,0) have determinant −1; convention factor (−1)^(1·1)=−1. Negative-bundle monodromies diag(1,−1), diag(1,−1,−1) have signs −1,+1. | Survives; excludes trivial local coefficients. |
| M.7 cross-term cancellation | (−1)^λ_D (−1)^(λ_C−λ_D−1)+(−1)^λ_C=0, including λ_C=λ_D=0 where −1+1=0. | Survives. |
| M.7 sign local system | Circle monodromy −1 gives differential −1−1=−2; H₀=ℤ/2,H₁=0. Constant coefficients would instead give two copies of ℤ in degrees 0,1. | Survives. |
| M.7 two caps and shear | Cap boundary (a,b)↦a+b has kernel ℤ(1,−1). Shear (x,y)↦(x+Py,y) intertwines differentials exactly when ∂P+P∂=F; inverse subtracts Py. | Survives. |
| M.7 Klein bottle | d₂(n)=(0,2n),d₁=0: H₂=0,H₁=ℤ⊕ℤ/2,H₀=ℤ, not torus H₁=ℤ². | Survives. |
| M.7 four critical components | a=√(5/12); extrema values ±5a/6≈±0.538 enclose ±0.25. D₁D₂(a,b)=D₁(0,−a+b)=0; survivors H₂=ℤ(1,1),H₀=ℤ. | Survives. |
| M.8 two-cap filtrations | Index filtration: d₁=0 and d₂:ℤ²→ℤ is (a,b)↦a+b. Value filtration: the same map is d₁. Both leave ranks 1 in degrees 0,2. | Survives; filtration affects page number. |
| M.8 four-component filtrations | Value filtration has two nonzero d₁ maps ±1; survivors at (0,0),(3,−1). Index filtration survivors at (0,0),(2,0); total degrees are 0,2 in both. | Survives. |
| M.8 bundle comparison | S³-fibre over S⁵: base indices 0,5 and fibre degrees 0,3 give total degrees 0,3,5,8, each rank 1; no differential can join them. | Survives; ring comparison needs consumer correction. |
| M.9 tensor/duality | For degree-one x,y the cross terms in d²(x⊗y) have coefficients −1,+1. Tor₁(ℤ/2,ℤ/2)=ℤ/2, so a field-only tensor formula cannot replace the integral one. | Survives. |
| M.9a cup product | T²: a∪b=−b∪a and a²=b²=0; over 𝔽₂, ℝP² has x²≠0,x³=0. Three-valent rigid count dimension 0−0−0=0 at the unit model. | Survives. |
| M.10 Witten normalization | f=x on ℝ: d_t=d+t dx∧ and Δ_t=Δ+t²; Hessian term 0. Quadratic f=±x² has Hessian ±2, not ±1. | Survives. |
| F0.S / sharp_sard | m=3,n=1,k=3: 3>2, whereas native sufficient bound is 3≥10, false. m<n uses natural subtraction 0; m=n=0 has surjective zero derivative and empty critical set. Empty U has empty image. | Survives; not native-bound padding. |
| F0.0 / sharp_sardSmale | idℝ: ker=coker=0,index=0,critical set empty. ℝ→ℝ² inclusion: index −1,image a nowhere-dense line. Zero ℝ³→ℝ: index 2,critical image {0}; k=3 allowed, k=2 not. | Survives. |
| F0.0 determinant families | Identity: Λ⁰0⊗(Λ⁰0)*=ℝ. Orientation reversals compose (−1)²=1. Multipliers 1 and 2 have equal orientation action but send 1 to different vectors. | Survives; no canonical linear transport claimed. |
| F0.1 finite smoothness | On a compact chart f_ε=f+εx has derivative f′+ε; for f=x³, ε>0 gives 3x²+ε>0, while ε=0 has degenerate critical point x=0. | Survives. |
| F0.2 asymptotic operator | D=∂s−a: a≡±1 gives no L² homogeneous or adjoint solution, index 0. a=tanh s gives kernel 0,cokernel 1,index −1=dim Eᵘ(−1)−dim Eᵘ(1). | Survives. |
| F0.3 parameter projection | L=0:ℝ→ℝ, B=id: total (x,λ)↦λ is onto. Projection of total kernel is 0:ℝ→ℝ, with kernel/cokernel dimensions 1,1 and index 0=index L. | Survives; total regularity is distinct from parameter regularity. |
| F0.4 metric realization | α=dx,V′=2∂x gives g′=½dx² and g′(V′,∂x)=1=α(∂x); choosing g′=dx² would give 2. | Survives. |
| F0.4 noncompact qualification | f=x is proper but unbounded below and has zero critical generators although H₀(ℝ)=ℤ. arctan x+π/2 is bounded below but nonproper. For f=x²+x⁴, backward escape time has finite integral ∫∞ dx/(2x+4x³). | Survives; no unsupported global Morse complex. |
| F0.5 compatible tangent space | J=[[0,−1],[1,0]], A=diag(1,−1): AJ+JA=0 and first variation of ω(Ju,Jv) is 0. A=I gives AJ+JA=2J≠0. | Survives. |
| F0.6 iterates and sections | Transverse rotation by θ has mth-return eigenvalues e^(±imθ); θ=2π/3 fails at m=3, irrational θ/(2π) never gives 1. Conjugation preserves these values. In transverse dimension 0 the spectrum is empty. | Survives; all iterates must be included. |
| F0.7 Bott constraints | Constant f on compact X: normal rank 0, negative bundle rank 0, no nonconstant gradient trajectories. The complex reduces to the coefficient-chain model on X, not zero homology. | Survives. |
| F1.1 Sobolev thresholds | Surface W^(1,p): p=3 gives 1−2/3>0; p=2 gives 0 and does not yield the same continuous-evaluation claim. | Survives; strict embedding threshold retained. |
| F1.2 normalized disc kernel | u=a₀+a₁z+bar(a₁)z²+bar(a₀)z³ has e^(−3iθ/2)u real on the boundary. u(0)=a₀, ∂su(0)=a₁; both zero force u=0. Unaugmented kernel has real dimension 4 per component. | Survives; normalization excludes kernel. |
| F1.2 CR and similarity | ∂̄z=0; ∂̄bar(z)=1 with the 1/2 normalization. G invertible gives zeros of Gσ exactly zeros of σ; G=0 would wrongly make every point a zero and is excluded. | Survives. |
| F1.3 spectral flow | (∂s−tanh s)cosh s=0 but cosh∉L²; (−∂s−tanh s)sech s=0 and ∫sech²=2. Index −1 agrees with 0−1. | Survives. |
| F1.4 CZ/Hamiltonian sign | Positive planar rotation with S=I gives CZ=−signature(S)/2=−1. H=ε(x²+y²)/2 and ι_Xω=dH give X=(εy,−εx), CZ=+1=1−ind_Morse(H). | Survives. |
| F1.4 stabilized exact sequence | Piece dimensions (ker,coker)=(1,0),(0,1); if b_R:ℝ→ℝ is nonzero, glued dimensions (0,0), index 0=1−1. If b_R=0, glued dimensions (1,1), same index. | Survives; separate dimension additivity needs b_R=0. |
| F1.4 rank-jump family | T_t:ℝ→ℝ, x↦tx: for t≠0 dimensions (0,0); for t=0 (1,1). Stabilizer S=ℝ makes (x,s)↦tx+s onto for all t, with kernel span(1,−t) of constant rank 1. | Survives; exact-cokernel bundles require constant ranks. |
| LinearNeck coefficient/fundamental | a_R=1−tanh(s+R)+tanh(s−R); log derivative of eˢcosh(s−R)/cosh(s+R) equals a_R. At R=0: a=1,F=eˢ,F′=eˢ. Denominator cosh≥1 never vanishes. | Survives mathematically; R06 removes padding. |
| LinearNeck pulse/adjoint | (sech s)′=−tanh(s)sech(s); (1/F_R)′=−a_R/F_R. At s=0 pulse=1,pulse′=0 and F_R=1,F_R′=1−2tanh R. | Survives; R06. |
| LinearNeck end ratios | At +∞, F_R/eˢ→e^(−2R); at −∞, →e^(2R). F_R grows at +∞, its reciprocal grows at −∞; both global L² kernels are 0. | Survives; R06. |
| LinearNeck translation/bound | a_R(s−R)→−tanh s, a_R(s+R)→tanh s. For R≥0, tanh(s+R)−tanh(s−R)∈[0,2], hence a_R∈[−1,1]. R=−1,s=0 instead gives 1+2tanh1>1. | Survives; nonnegative-R binder essential. |
| LinearNeck inverse | u=−F_R∫_s∞f/F_R has u′=a_Ru+f, hence D_Ru=f. For R=0 this is −eˢ∫_s∞e^(−t)f(t)dt. | Survives; uniform inverse bound not inferred. |
| LinearNeck near-kernel/growth | With t=s+R, D_R(η(t/R)sech t) equals η′(t/R)sech(t)/R minus η(t/R)(1+tanh(t−2R))sech t. On abs(t)≤2R both terms are O(e^(−R)) in L², while pulse norm tends √2. Thus inverse norm ≥c e^R. | Survives. |
| LinearNeck cylinder | Mode e^(2πikt) changes D to ∂s−(a_R+2πk). For k≠0 its coefficient has fixed sign and magnitude ≥2π−1>0; zero mode gives complex dimensions (1,0),(0,1), or real dimensions (2,0),(0,2), then glued (0,0). | Survives. |
| F1.5 RR and weights | Trivial line on S²: index 2+0=2; TS²: 2+2·2=6. Disc with constant real line boundary: index 1. Crossing a simple asymptotic eigenvalue changes the weighted index by one, not zero. | Survives. |
| F2.1 Darboux model/standard | (x,y)↦(eˣ−1,y) pulls du∧dv back to eˣdx∧dy. In the stated basis order b(inr),b(inl), both native and standard forms evaluate to +1. Rank-zero space has the identity chart and zero alternating form, nondegenerate on the zero space. | Survives; both Lean chart targets. |
| F2.1 Moser/Hodge primitive | On T², η=cosθ dθ∧dφ has primitive sinθ dφ; d of that primitive is η. For ω_t′=dα_t and ι_Xω_t=−α_t, derivative of pullback is dα_t−dα_t=0. Family (1+t)ω has changing area and fails the cohomology premise. | Survives; supplied-flow claim R05. |
| F2.1 four-dimensional compatibility | Self-dual coefficients (a,b,c) give norm² 2(a²+b²+c²) and A²=−(a²+b²+c²)I; normalization norm²=2 yields J²=−I. Scaling by 2 would give −4I. | Survives. |
| F2.2 local branches | u=z² has one critical point 0; a nonzero value has two preimages. With reference u₀=z and u₁=z², factor φ=z² is holomorphic despite du₁(0)=0. | Survives; no unnecessary immersion hypothesis on second branch. |
| F2.3 removal and boundary | u=z has finite disc energy π and extends through 0. u=1/z has energy integral proportional to ∫₀ r^(−3)dr=∞ and fails the finite-energy premise. Unit-circle boundary primitive has period π. | Survives. |
| F2.4 regular simple maps | For z², deck group contains {±1}, order 2; for z the group preserving the map has order 1. Simple-curve genericity cannot certify all covers. | Survives. |
| F2.5 strip gluing | Two parametrized index-one strips give unparametrized dimensions 0+0; adding one positive neck gives dimension 1=2−1 for the glued strip. | Survives. |
| F2.6a sphere triple | 1−z sends (0,1,∞) to (1,0,∞); 1/(1−z) sends it to (1,∞,0). If three target marks coincide there is no bijective Möbius map; pairwise distinctness excludes that case. | Survives; Lean triple headline. |
| F2.6b factorization/quotient | z² has degree 2 and total ramification 2: χ(S²)=2=2·2−2. A nodal cubic normalization is degree 1 but has two preimages of its node; simplicity does not mean global injectivity. | Survives. |
| F2.6c energy and equality | z² gives densities E=area=ω=4 abs(z)². bar(z) gives 1,1,−1. x+2iy gives 5/2,2,2. u=x gives 1/2,0,0 with rank-one image. | Last instance refutes plane iff; R04. |
| F2.6c bubbling/mark stability | Sphere area group aℤ with a>0: splitting total a into two positive multiples would require a≥2a, false. A constant genus-zero leaf with one node and ≤1 mark has ≤2 special points, so is unstable. | Survives. |
| F2.6d evaluation degree | Product ruling in S²×S²: unmarked real dimension 4+4−6=2, one-marked dimension 4; evaluation is the identity model of degree +1. CP² lines: 4+6−6=4, one-marked dimension 6. | Survives. |
| F2.6e adjunction | Line: 3=2+1; conic: 6=2+4; nodal cubic: 9=2+9−2·1. Lagrangian sphere has square −χ(S²)=−2. | Survives. |
| F2.6e automatic regularity | Normal O(−1) on S² has complex H⁰=H¹=0, real index 0=2+2(−1). O(0) has kernel real dimension 2 and cokernel 0, index 2. | Survives. |
| F2.6f nonsqueezing | n=1,r=R=1,id: ω(1,i)=1 on each side. Dilation 2 gives 4≠1; compression 1/2 gives 1/4≠1. id on B(2) fails cylinder R=1 at 3/2. n=0,r=0 are excluded. | Survives; Lean headline. |
| F2.6f mixed wedge | ω₀=e¹²+e³⁴ and β=p e¹²+q e³⁴+cross terms give ω₀∧β=(p+q)e¹²³⁴>0 for p,q>0; convex-path square has three positive terms. | Survives. |
| F2.6g relative ruling | Radial rescaling ρ(z)=b(r)z has determinant b(b+rb′); b=1 gives 1, while b=1/r gives 0 and is not a local symplectomorphism. | Survives. |
| F2.6h group/polar model | H=diag(4,1/4) gives P=(H+I)/√(tr H+2)=diag(2,1/2), P²=H,det P=1. Factor swap preserves areas (a,b) iff a=b. | Survives. |
| F2.7 compact Lagrangian disc | Unit circle: u(z)=z is nonconstant, boundary lies on L, area and Liouville period π. Constant map has area 0 and is excluded. Zero-dimensional point L would admit only constants; n≥1 is explicit. | Survives; Lean headline. |
| F2.7 forcing/nonexactness | For 2∂̄u=a on radius-r disc, Stokes gives ∮u dz=iπr²a. At r=1 and boundary norm≤R, abs(a)≤2R; choosing forcing larger than 2R is impossible. y=c in T*S¹ has period 2πc, detecting nonexactness. | Survives. |
| F3 no escape/action | Exact cotangent zero-section with a small graph εdf has the Morse generators; on S¹ there are two, with canceling signed strips, homology rank 2. Energy A(x₋)−A(x₊)≥0 for downward action; an arbitrary nonexact pair need not have this complex. | Survives. |
| F4.A diagrams | α=(1,0),β=(0,1): determinant 1,one generator,H₁=0. β=(1,3): determinant 3,three generators,H₁=ℤ/3. Parallel perturbation has two generators but H₁=ℤ. | Survives. |
| F4.B Spinᶜ/relative index | Genus-one lens example gives ε=(0,−1)=2b mod 3; reversal gives b, and 2+1=0 mod 3. Bigon μ−2n_z=1−0=1; U shift is −2. | Survives. |
| F4.B sphere correction | Whole surface has e=2−2g,n_x=n_y=g, hence μ=2; μ−2n_z=2−2=0, matching zero capped homology class. Low-genus homotopy realization is separately required. | Survives. |
| F4.C admissibility | Periodic difference (0,1,−1) has both signs; a nonnegative annular periodic domain fails weak admissibility in the zero-Chern slice. For lens spaces H₂=0, this slice condition is vacuous. | Survives. |
| F4.M multipointed factor | k=g+b−1 gives μ(Σ)=2−2g+2k=2b and μ−2Σn_z=0. S³ with b=1,2,3 has raw hat ranks 1,2,4. | Survives; basepoint addition is not ordinary genus stabilization. |
| F4.1 Perutz balance | λ=0.1, area(A)=1 requires area(D)=1.1−0.2=0.9; taking equal areas 1,1 fails by 0.1. At λ=0 the equation becomes equality of areas, but the cited Hamiltonian criterion assumes λ>0. | Survives. |
| F4.2 analytic index | Embedded genus-one bigon: e=1/2,n_x=n_y=1/4; combinatorial μ=1 and cylindrical 1−χ(disc)+2e=1. Constant strip: 1−1+0=0. | Survives; geometric integrality remains a target. |
| F4.3 finiteness | If a nonzero nonnegative zero-Chern periodic P were allowed, D+nP would remain nonnegative for every n≥0 at the same μ,n_z, yielding infinitely many domains. Weak admissibility removes exactly this obstruction. | Survives. |
| F4.4 hat invariant | S³ genus-one diagram: one generator,d=0,rank 1. Admissible S¹×S² diagram: two same-direction bigons cancel mod 2,d=0,rank 2. | Survives. |
| F4.5 grading/naturality | Identity cobordism has χ=σ=c₁²=0, so degree shift (0−0−0)/4=0. S³ generator degree 0 and U degree −2 fix the tower origin. | Survives; arbitrary torsor origins excluded. |
| F5.0 stability/domains | For a constant sphere, 2h−2+n is −2 at n=0,0 at n=2,1 at n=3. For a constant torus it is 0 at n=0,1 at n=1. A node contributes two normalization flags. | Survives. |
| F5.1 proposed periodic sum | In the pinned circle-times-sphere regions, A+B=(0,1,1): periodicity requires 1+1=2·0, false. A−B=(0,1,−1) gives 0=0 and μ=0=1−1. | Refutes Check; R03. |
| F5.2 end energies | Trivial cylinder (Ts,γ(Tt)): ω-energy 0, cutoff contact energy T²∫φ(Ts)ds=T; k-fold cover has energy kT. Replacing both energies by 0 would lose orbit-period control. | Survives. |
| F5.3 cylindrical lift | Unordered pair {√z,−√z} is single-valued; a loop around z=0 swaps the two ordered lifts. Thus symmetric-product geometry permits the branch while a global ordered lift does not. | Survives. |
| F5.4 strands algebra | In A(4,2), two composable partial permutations each have inversion number 1, but their composite has 0: product is 0 because 0≠1+1. Identity has inversion 0. Torus algebra: ρ₁ρ₂=ρ₁₂,ρ₂ρ₁=0. | Survives; noncommutativity retained. |
| F5.5 boundedness | δ¹(x)=ρ₁₂⊗x: algebra product ρ₁₂²=0, but tensor iterate δᵏ(x)=ρ₁₂⊗…⊗ρ₁₂⊗x≠0 for all k. Algebra nilpotence does not imply bounded type D. | Survives. |
| F5.5 orientation/pairing | ∂Y₁=F(Z),∂Y₂=F(−Z) gives CFA over A(Z) and CFD over A(−(−Z))=A(Z). Same-idempotent y⊗x is nonzero; opposite idempotents give 0. Gluing ranks can be 1,2,p. | Refutes algebra Check; R02. |
| F5.6 knot filtration | Trefoil gradings A=1,0,−1 and M=0,−1,−2 give Euler polynomial t−1+t⁻¹. A disc with (n_z,n_w)=(1,0) changes A by 1 and is absent from hat associated-graded differential. | Survives. |
| R1 raw/stable/twisted | Over 𝔽₂[t,t⁻¹], multiplication by 1+t is injective with cokernel 𝔽₂. After augmentation t=1 it is 0, yielding two generators; Tor₁ supplies the extra copy. | Survives; no underived augmentation shortcut. |
| R2 contraction/completion | Acyclic pair with d=1 and h=−1 has dh+hd=−id on its two degrees, matching ip−id when ip=0. Single −1 plumbing vertex bounds S³; completed minus is one 𝔽₂[[U]] tower. | Survives; completion retained. |
| R3 grid factor | n=2 unknot grid has rank 2=1·2^(2−1); n=3 factor rank 4=1·2^(3−1). V degrees (0,0),(−1,−1) preserve the stated bigrading, not merely rank. | Survives. |
| R05 tube/flow supplier strength | Normal fibre dilation 2 gives derivative 2I rather than I while preserving neighborhood diffeomorphism. Local flow of x′=x² is x/(1−tx), with pole at 1/x. | Stronger interface does not follow from the stated import. |
| R07/R09 form and anchors | Numbered subsections 63; Checks blocks 22 in 21 subsections, leaving 42; Lane M anchor multiplicity 0 instead of 1; the fixed-commit Lane F1 link is not a defect at this head. | Repair lists and aliases. |

**Pinned library audit.** These are the declarations/definitions opened, not name-only search results. Paths in this table are relative to the named library repository. The searches were by Fredholm splitting, parameter projections, determinant families, symplectic forms, embeddings, Maslov operators and filtered objects, as well as the seven acceptance names.

| Pinned input | Location and actual content |
| --- | --- |
| Fredholm splitting | Mathlib `Mathlib/Analysis/Normed/Operator/Fredholm/Basic.lean:178`, `FredholmPackage`; splitting at line 292; composition index at 613. `Open.lean:89` and `:104` give local constancy/continuity of index. This is not a determinant line bundle. |
| Native Sard | Tau Ceti `TauCeti/Analysis/Calculus/Sard/OutermostStratum.lean:345` and `:366`; `EqualDimension.lean:97`. The quadratic sufficient bound and the equal-dimensional special case do not subsume the sharp unequal-dimensional target. |
| Native Sard–Smale | Tau Ceti `TauCeti/Analysis/Fredholm/SardSmale.lean:451`: the pointwise budget uses squared kernel dimension plus one. Completeness and source countability remain hypotheses. Index zero does not bound kernel dimension. |
| Universal parameter algebra | Tau Ceti `TauCeti/Analysis/Fredholm/Parametric.lean:135`, `parameterProj`; `:147`, `kerCoprodHom`; `:247`, `parameterToCoker`; `:273`, total-surjectivity criterion; `:375`, projection index. These are the algebraic part of the new obstruction sequence, not analytic splicing. |
| Symplectic carrier | Tau Ceti `TauCeti/Geometry/Symplectic/Manifold/TwoForm.lean:68` defines nondegeneracy by `(form.bilinFormAt x).Nondegenerate` at every x. `:92` defines `IsSymplectic` by closedness and nondegeneracy. Neither supplies compactness, finite dimension or Hausdorffness. The target binders carry what they need. |
| Smooth embedding | Tau Ceti `TauCeti/Geometry/Manifold/SmoothEmbedding/Basic.lean:68` bundles a smooth map and smooth-embedding property, not compactness of its source. `NormalSpace.lean:50` and `:62` construct its tangent range and closedness; `:262`/`:274` give dimension comparisons. The disc theorem includes compact L explicitly. |
| Sphere automorphism action | Tau Ceti `TauCeti/Topology/Compactification/OnePoint/ProjectiveLine.lean:111`, `:144`, `:221`: scalar/kernel/action calculations. They support the PSL action, not a direct one-line proof of the distinct-triple classification. |
| Boundary Maslov index | Tau Ceti `TauCeti/LinearAlgebra/TotallyReal/Maslov/Index.lean:103`, index construction; rotation at `:216`; `Map.lean:61` and `Prod.lean:183`, naturality/product. This index is distinct from the Heegaard rational domain expression. |
| Heegaard domain index | Tau Ceti `TauCeti/LowDimTopology/Heegaard/MaslovIndex.lean:292` is an additive map into ℚ with body `eulerMeasure + generatorPointMeasure x + generatorPointMeasure y`. It accepts integer region coefficients; that does not by itself establish geometric representability or integral analytic index. |
| Genus-one witness | Tau Ceti `TauCeti/LowDimTopology/Heegaard/CircleTimesSphere.lean:193`, periodicity iff; `:212`/`:218`, both bigons have the same endpoints; `:288`/`:295`, their indices are 1; `:302`, the difference has index 0. |
| Spectral objects | Mathlib `Mathlib/CategoryTheory/Triangulated/SpectralObject.lean:44` bundles a functor and distinguished triangles, not the trajectory filtration or its geometric Serre comparison. The latter is genuine additional work; its ownership description still needs R08. |

The source file for the genus-one witness initially lacked an object file. I built only `TauCeti.LowDimTopology.Heegaard.CircleTimesSphere`, then elaborated a scratch witness proving the positive sum is not periodic, the signed difference is periodic, and its Maslov index is zero. No PR source was changed.

**Supplier and ownership audit.** I read all Needs lines, ran `roadmaps resolve` (no unresolved names reported), and used `roadmaps grep` plus the supplied checkouts and board packages for object-level ownership searches. The resolver's zero count was treated as a lead, not a proof of the stronger contracts. Existing roadmaps were checked on main; an open revision was not substituted as a supplier. The main shape examples read were MorseTheory, DGAInfinity and Completed/HopfRinow.

| Roadmap/input | Resolved section and boundary of supply |
| --- | --- |
| MorseTheory | Main M1, M2, M3, M5, M6, starting at lines 90,124,430,611,649: Hessians, normal forms, compact bands/attachments and finite Morse–Bott topology. HeegaardFloer's signed trajectory complex is a separate construction. |
| DifferentialGeometry | Main 0.1 at line 280 supplies `curryLeft`; 0.4 at 294 the common form carrier/migration; Layers 1–3 and 6/8 the indicated calculus; 10.2 at 884 transfers the native Sard theorem. Full time-dependent maximal-flow claims exceed 3.5 at 399: R05. Layer 2 supplies orientations/double cover; the twisted coefficient local system must be attributed to AlgebraicTopology 6.3, not DG Layer 2. |
| ComplexKahlerGeometry | Main K5a starts at 570; its smooth-section topology and real Hodge theory are inputs. The elliptic estimate at 1027 and Green inverse at 1067 support deriving the Green estimate; they do not separately state every bound the README attributes to them. K1 supplies the complex-manifold framework, not the complex structure of Sym^g(Σ); F4.1 must own that construction. |
| GeometricTopology | Main Layer 1, line 218, is the normal-bundle tubular neighborhood theorem; R05 identifies the extra tube normalization. Its splitting/reconstruction infrastructure is an input to F4.A, not the smooth pointed-Heegaard/Spinᶜ comparison itself. |
| AlgebraicTopology | Stages 2.3/2.6, 6.1/6.3 and 8.7 supply pair exactness, coefficient naturality, orientation-local-system/fundamental-class and finite-CW comparisons. The `or_M` construction and boundary law are explicit at lines 1374–1408. F2.7's mod-2 coefficient reduction is an application, not a replacement fundamental-class theory. |
| GeometricCurrents | Main G1, G2, G3, G4a (lines 137,240,406,523): tests/currents, integral pushforward, current homology comparison and flat topology. M.4 constructs its trajectory evaluation comparison on those carriers. Its indirect use of the supplier's established chain infrastructure is not a new direct upward edge. |
| CharacteristicClasses | Main C2 Euler/Thom and C3 first-Chern/Euler comparison (sections beginning 550 and 720) supply the topological classes used in F1/F4; the analytic index comparison remains here. |
| FuchsianOrbifolds | Main line 81 mentions `compactManifoldFiniteCWType` in ownership; it is not a named declaration of Layer 5. Cite that ownership passage or AlgebraicTopology 8.7's actual statement, not Layer 5 as its constructor. |
| LieGroups | Main `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md`, Layers 3–5 and 9: Lie subgroups/actions and the stated compact-group infrastructure used by the sphere/group models. No second generic Lie-group carrier is introduced here. |
| HopfRinow / RiemannianGeometry | Main `Completed/HopfRinow/README.md`, Layer 1 and along-curve connection comparisons, and RiemannianGeometry R1/R5a supply connection/curvature/submanifold inputs. F2.3 explicitly owns its two-parameter pullback and boundary-energy adapter. RiemannianGeometry's Lane M link needs R09. |
| PDE | Main Lane A at lines 223–245 gives the indicated domain Sobolev foundation, with the stated regularity range; it does not list the full multiplication theorem attributed to it at HeegaardFloer line 170. F1.1 already owns the needed multiplication/bundle adapters: say so consistently. |
| SelfAdjointSpectralTheory | Main `TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory/README.md:873` has graph norms/cores and `:1202` SA-E01 spectral measures. “Common-domain graph calculus” is not a located target. Name the actual theorem used and own the family adapter. |
| DGAInfinity | Main scope line 27 and Layers 1 onward are uncurved integer-cohomological DG/A∞ theory. F5.4's noncommutative grading-set and relative idempotent adapters differ and are explicitly needed; a generic DG hierarchy must remain imported. |
| CombinatorialHeegaardFloer | Main Lane G at 162, ALG at 213, L at 240, H at 250 supplies the combinatorial complexes and moves. Smooth realization, analytic rectangle/bigon counts and R1–R3 comparisons remain here. The matched-circle strands algebra is not supplied by those grid/lattice lanes. |

The other attribution repairs in previous R03 remain small but concrete: DG5.6.3's Green theorem can be specialized to circles/inset regions, but that specialization should be described as an adapter; DG8.4 supplies integration of smooth chains and a cohomology map, not a prepackaged arbitrary-singular-chain integral. They do not require changing the mathematical scope.

Ownership against the provided open checkouts was checked, including AnalyticStableMaps §0.5, FukayaTheory's tree/gluing layer, SymplecticFieldTheory's cylindrical applications, InstantonFloerTheory's ASD comparison and the combinatorial roadmap. No other reviewed `Suggested.lean` defines one of the seven fully qualified acceptance names. Generic Fredholm algebra is owned by the pins; this roadmap's additional determinant-family construction and CR gluing adapters are distinct from gauge/ASD or higher-tree application gluing. The native two-form/boundary-index carriers are consumed rather than redeclared. Board-package search hits concerning arithmetic return maps or condensed Fredholm rings concern different objects.

Two ownership moves are asserted by this roadmap but not reflected in the consumers on main: finite-filtered spectral-sequence algebra (DGFloer Layer 1 item 3 versus M.8) and the general vector-field return germ (MorseNovikov N5 versus F0.6). Record them as such and reconcile the consumers; they are not incoming suppliers. R08 also applies to these checked mismatches: ConvexityToric T2 cites MorseTheory M5/CharacteristicClasses rather than M.7–M.8; HamiltonianFloerOperations H7 has no specified M.9a cup-product comparison; AnalyticStableMaps §0.5 cites F2.2–F2.3, not F2.6b; GromovWittenTheory has direct F1/F2 inputs, not only indirect ones; FourManifolds' listed input is F0, not all F0–F2. DGFloer's explicit convention transport at main lines 1148–1153 distinguishes its reflected capped action/index from the standing HeegaardFloer convention; I found no hidden sign identification there. None of these observations is a request to add a reverse dependency.

## Not verifiable

- **McDuff–Salamon, J-holomorphic Curves and Symplectic Topology, 2nd ed.** The author-hosted PDF and author publication page returned HTTP 403. The exact locators in F1.2/F2.2 (Lemmas 2.4.1–2.4.3), F2.6b (Proposition 2.5.1), F2.6c (Lemma 2.2.1), F2.6d (§3.2), F2.6g (Theorem 9.4.7), F2.3's Chapter 4 compactness/removal references, and the appendix analytic/determinant citations remain uncertified. Wendl verifies the factorization result separately; it does not verify every MS locator or low-regularity proof step.
- **McDuff–Salamon, Introduction to Symplectic Topology, 3rd ed., §3.2.** The publisher landing page returned 403. The Darboux locator is recorded, but its page-level text was not read.
- **Micallef–White and Hartman–Wintner.** DOI resolution led to JSTOR pages, with no legal open text returned. F2.6e's exact local expansion/normal-form locators are not certified.
- **Schwarz, Morse Homology**, and **Oh, Symplectic Topology and Floer Homology**: no legal text from the title/DOI searches; the Oh result led to the Cambridge book landing page. The boundary-specific Oh hypotheses and the Schwarz locators were not independently read.
- **Robbin–Salamon.** The path-index paper resolves as paywalled/uncertified; no new request was made to bypass that status. The spectral-flow paper's publisher route returned 403. The sign tests and native Maslov declarations were checked, but do not certify the papers' exact generality.
- The source service fetched the remaining available cited arXiv works, including Wehrheim, BEHWZ, LOT bimodules, JTZ, OSS, Zemke, Mescher, Zhou, Banyaga–Hurtubise, Auroux and Abouzaid–Seidel. Fetching them is not a claim to have audited every proof or erratum in those works. No exhaustive correctness claim about all source proofs is made.
- The external `damian_formalizare` port references were not certified against a fixed external commit. The local native declarations and the mathematical normalization were inspected; that does not establish portability of every external file.

- **Hutchings, physical p. 84 in the PR description.** The retrieved 2002 Morse notes have 63 pages; Pavlov’s separately authored notes of Hutchings’ Floer course have 24 pages. Neither contains that physical page. I could not authenticate the attributed separate-kernel/cokernel assertion, so I do not register an error against an unseen source. The new tanh cancellation model was checked independently.

Unavailable works and the routes tried are preserved in the scratch reference inventory, under their existing keys. The review did not modify a source manifest or any PR file.

## Source issues

- **Gap** in hutchings at Proposition 3.2, footnote 13, printed p. 14: the source says compactified evaluation is smooth while leaving that smoothness unverified; it should justify the extension in its chosen corner charts; affects the proof.
- **Misprint** in lot at §3.1.1, printed p. 29: the source says its three-strand, five-place example lies in A(3,5); it should be A(5,3), consistently with Definition 3.2; affects nothing.
- **Misprint** in lot at Examples 3.19–3.20, printed p. 35: the source says marked points start at zero but gives matching-map domains starting at one; it should use one consistent indexing set for each example; affects nothing.
- **Misprint** in lot at Definition 3.21, equation (3.22), printed p. 35: the source says the section subset S ranges inside [2k]; it should range inside the 4k marked points, mapping bijectively onto s⊂[2k]; affects a stated result.
- **Gap** in lipshitz at Lemma 4.1, printed pp. 975–976: the source says maximal gluing and local changes produce the required corner set; it should supply the controlled construction given in the erratum; affects the proof; corrected in print at lipshitz-erratum §1.2.
- **Error** in lipshitz at Lemmas 4.1 and 4.9, printed pp. 975–976 and 983: the source says double points can be resolved while retaining the required branched projections; it should allow immersed representatives with signed double-point corrections and use the corrected index argument; affects the proof; corrected in print at lipshitz-erratum §§1.1–1.2.
