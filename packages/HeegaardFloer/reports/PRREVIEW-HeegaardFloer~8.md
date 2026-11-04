# Review of HeegaardFloer (pull request #1794 at 6d38f63)

**Verdict:** needs changes

All nine findings are P3. The verdict follows from the failing gate alone (`blob=2`, `build=1`); once R01 and R02 are repaired the folder is ready for a human's approval, conditional on the PseudoholomorphicCurveAnalysis pull request merging first (the dependency check cannot see that edge, see "Supplier order" below).

## R01 (P3) — Two links to PseudoholomorphicCurveAnalysis are pinned to a commit

Location: `TauCetiRoadmap/HeegaardFloer/README.md` lines 25 and 1820, `[PseudoholomorphicCurveAnalysis](https://github.com/TauCetiProject/TauCetiRoadmap/blob/210705fc…/README.md)`.

Claim: the gate rule "no link into the roadmap repository pinned to a commit" (gate `blob=2`).

Witness: both lines link `blob/210705fcd02b…`. Every PH section the README cites (PH1, 1.2, 2.3, 2.4, 3.1–3.5, 5.1, 5.2, 6.1, 6.3, 7.1, 7.2) exists with the same content at that commit and at the pull request's current head (the section list of both copies was compared), so nothing depends on the pin.

Repair: write `[PseudoholomorphicCurveAnalysis](../PseudoholomorphicCurveAnalysis/README.md)` at both places (the path on main after that roadmap merges); keep "(PH below)".

## R02 (P3) — The Lake module-system warning fails the build check

Location: `TauCetiRoadmap/HeegaardFloer/Suggested.lean` line 1, `import Mathlib`.

Claim: the targeted build reports "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module`" and the gate counts it (`build=1`).

Witness: gate.md, build (1). The file is otherwise unchanged from main.

Repair, tested on a copy: put `module` as the first line, change the six `import` lines to `public import`, and insert `public section` before `namespace TauCetiRoadmap.HeegaardFloer`. The copy elaborates with only the seven `declaration uses sorry` warnings.

## R03 (P3) — F4.5 cites the wrong paper for absolute gradings and correction terms

Location: README lines 3361–3413 (§6.9, "F4.5q. Absolute grading before numerical d", *Needs:* "Ozsváth–Szabó, arXiv:math/0105202 (source)"), and line 3365 "OS Theorem3.15's boundary degenerations".

Claim: the absolute ℚ-grading normalized by HF̂(S³) in degree 0, the cobordism degree (c₁(t)²−2χ(W)−3σ(W))/4 and the correction term d are attributed to math/0105202.

Witness: math/0105202 (cache 1440911e) has only the absolute ℤ/2 grading (line 2984, "10.4. Absolute Z/2Z gradings") and refers absolute gradings to its reference [30]. The ℚ-grading and the shift formula are Theorem 7.1 of Ozsváth–Szabó, *Holomorphic triangles and invariants for smooth four-manifolds*, math/0110169, restated as formula (4) on p. 8 of math/0110170 (cache cb2158bd lines 268–276); d(Y,t) is math/0110170 Definition 4.1, p. 21 (line 691). Theorem 3.15 (the signed count of N̂(O_x+[S]) is zero, the boundary degenerations) is in math/0101206 (cache 035bccf5 line 1257), not in math/0105202.

Repair: in F4.5q cite math/0110169 Theorem 7.1 for the grading and its shift, math/0110170 Definition 4.1 for d, and math/0101206 Theorem 3.15 for the boundary degenerations; add both papers to References.

## R04 (P3) — M.10 has no source locator

Location: README lines 1152–1176 (§1.10 Witten comparison).

Claim: the semiclassical localization, the harmonic-oscillator model, the linear-in-t gap and the integration-map comparison are stated with no source; every other target in the sampled set carries a theorem or page.

Witness: the section's only citations are ComplexKahlerGeometry K5a and M.0b/M.4/M.5; the References list has no Witten, Helffer–Sjöstrand or Bismut–Zhang entry.

Repair: add a locator for the deformed Laplacian and the localization (Witten, *Supersymmetry and Morse theory*, J. Differential Geom. 17 (1982), §2) and for the Witten-complex comparison (Helffer–Sjöstrand, *Puits multiples IV*, Comm. PDE 10 (1985)), with theorem numbers read from the texts; neither text was readable from this worker.

## R05 (P3) — F1.2's Sobolev disc isomorphism re-proves a corollary of PH6.3 and PH7.2

Location: README lines 1853–1865, "let X be the closed real subspace of W^(2,p)(D,ℂ^n) whose trace lies in e^(3iθ/2)ℝ^n … First construct the boundary analytic input: the M. Riesz/Szegő projection … solve the boundary problem with W^(2,p) regularity".

Claim: the statement that ξ ↦ (∂̄ξ, ξ(0), ∂_sξ(0)) is a bounded isomorphism X → W^(1,p)×ℂⁿ×ℂⁿ is built here by a Szegő-projection route.

Witness: with F = e^(3iθ/2)ℝⁿ the operator ∂̄ on W^(2,p)_F is Fredholm of index nχ(D)+μ = n+3n = 4n and onto (PH7.2 step 8, k=3 ≥ −1), with kernel a₀+a₁z+conj(a₁)z²+conj(a₀)z³ of real dimension 4n (PH3.4's check, PH README line 723). The two constraints are injective on that kernel, so the augmented map has index 0 and trivial kernel: it is an isomorphism with no boundary analysis beyond PH6.3. PH's scope (line 59) leaves HF only "its normalized disc solvers with prescribed centre and first jet".

Repair: state the Sobolev isomorphism as consumed from PH6.3 and PH7.2 step 8, and keep as the owned target only the Hölder version (C^(1,α) → C^α×ℂⁿ×ℂⁿ, the Privalov estimates) and its small-coefficient Neumann-series perturbation, which PH does not cover.

## R06 (P3) — F0.3's *Needs:* now points at the wrong adjoint uniqueness theorem

Location: README line 1485, "*Needs:* … F1.2's adjoint uniqueness theorem".

Claim: F0.3's surjectivity argument for the universal gradient-trajectory section uses "the required adjoint uniqueness theorem" from F1.2.

Witness: after this revision F1.2's table (line 1848) resolves that name to PH6.3, the duality and unique continuation for real Cauchy–Riemann operators on compact surfaces. F0.3's section lives on paths ℝ → X; the uniqueness it needs is the adjoint ODE's, which F0.2 constructs ("adjoint-ODE identification", line 1459) and F0.4 uses ("adjoint-ODE uniqueness makes it zero globally", line 1659).

Repair: replace the item by "F0.2's adjoint-ODE identification and uniqueness".

## R07 (P3) — Stale "shared spine with PDE" text after the refactor

Location: README lines 175–179 ("Sobolev spaces in the shape PDE needs them … the shared spine with the PDE roadmap, which builds exactly this in its Lane A"), line 207 ("F1 is shared with the PDE roadmap") and line 2039 (Layer 3 Dependencies: "PDE Lanes A and B and Lane A7; Tau Ceti `Wkp`").

Claim: Layer 3 still presents itself as the Sobolev/Calderón–Zygmund spine shared with PDE.

Witness: no Layer 3 target now names PDE or `Wkp`: F1.1 consumes PH1 and PH6.1 (line 1835), F1.2 consumes PH2–PH3 and PH6.3 (line 1878), and PH consumes PDE Lane A (PH README lines 184–189). The Hölder spaces of Lane A item 7 enter through PH3.1.

Repair: say that F1 consumes PH, which consumes PDE Lane A, and reduce the Dependencies line to what F1.1's strip adapters and F1.3–F1.5 use.

## R08 (P3) — Locator and attribution slips

- (a) F2.4 (line 2242) and F2.5 (line 2249) cite "MS Chapter 3; Floer–Hofer–Salamon for strips" and "Schwarz's model, then MS Chapter 10" with no theorem numbers; Floer–Hofer–Salamon (Duke Math. J. 80 (1995)) is not in References. Repair: cite theorems, add the reference.
- (b) F4.1 (line 3286) and F4.4 (line 3359) cite "Perutz (source)" without a locator. Witness: the Lagrangian tori and handleslide Hamiltonian isotopy are arXiv:0801.0564v2 Theorem 1.2 (cache afc8261b line 111); the area equation ∫_D α = (1+λ)∫_A α − 2λ quoted at line 3279 is its Lemma 5.2 (line 546). Repair: cite them.
- (c) F1.5 (line 1968) cites "AlgebraicTopology Stage 6.1's universal coefficient theorem over the field". On main, Stage 6 item 1 defines cochains (AT README line 1011) and the universal-coefficient consequences are Stage 6 item 5 (lines 1560–1567); PH cites item 5. Repair: "Stage 6 item 5".
- (d) F2.6a (lines 2289, 2339) attributes `lineStab` to Tau Ceti. At the pin it is Mathlib's `Matrix.SpecialLinearGroup.lineStab` (Mathlib/LinearAlgebra/Projectivization/PSL/Stabilizer.lean:34). Repair: move it to the Mathlib list.
- (e) Lines 2228 and 2861 link `../HopfRinow/README.md`; on main HopfRinow is `Completed/HopfRinow`, so the relative path from this folder is `../../Completed/HopfRinow/README.md` (its "Layer 1: the geodesic equation, the flow, and the exponential map" exists, line 264).

## R09 (P3) — F1.5 re-derives the Euler-characteristic identification PH7.2 carries

Location: README lines 1957–1973, "The following Euler-characteristic conventions are those PH7.2 uses, and are recorded here … Consume CharacteristicClasses C2.3's … Apply them to the same `compactManifoldFiniteCWType` … obtaining `c₁(TΣ)[Σ]=χ_CW(Σ)` …".

Claim: the paragraph is introduced as a record of PH7.2's convention but is written as targets ("Consume", "Apply", "obtaining", "Work over ℝ and use").

Witness: PH7.2 (PH README lines 1256–1258 and step 6) identifies χ with the alternating Betti sum through CharacteristicClasses C2.3, AlgebraicTopology Stage 6 item 5, 7.1 and 8.7, the same chain; c₁(TΣ)[Σ]=χ follows from C3.2's c₁=e and C2.3, both PH suppliers.

Repair: keep one sentence naming PH7.2's χ convention and the finite CW witness, and keep as owned only what the weighted formula adds (χ(Σ̇) of the punctured surface, relative c₁ and clutching).

## Verified sound

**Gate and dependency check.** Gate at 6d38f63: every scanner 0 except `blob=2` (R01) and `build=1` (R02). Dependency check, run as instructed with `--movable`:

```
depcheck: 204 roadmaps, 1670 edges, 0 problem(s)
```

**Supplier order.** HeegaardFloer is on main; PseudoholomorphicCurveAnalysis is a new-folder pull request (#1793 in the index, head 575925d) absent from ORDER.txt, so the check is blind to the HF→PH edge. PH's scope (PH README lines 46–60) states that HeegaardFloer consumes it and supplies nothing to it; PH's own suppliers on main (PDE, CharacteristicClasses, ModularForms Layer 10B, FuchsianOrbifolds Layer 5, PseudodifferentialOperators P5.2/P6, AlgebraicTopology) do not cite HeegaardFloer as a supplier (AlgebraicTopology line 72 names it as a co-consumer only), so there is no cycle. The edge is sound only if #1793 merges before this pull request, as its description says. The other open HeegaardFloer pull request (#1776) revises the same F1.1–F1.5 headings; it is not a dependency, but the author should expect a conflict in Layer 3.

**PH sections, resolved at 210705fc and at 575925d.** PH1 and PH1.2 (local W^(k,p) classes, products, composition, change of variables); PH2.3 (adapted charts, one derivative lost, hence ℓ ≥ 2 at the boundary); PH2.4 (C^(ℓ,α) coefficient gives a C^(ℓ+1,α) chart by the Beurling contraction); PH3.1 (Cauchy and Beurling operators on Lᵖ and C^(k,α)); PH3.2–3.3 (interior estimates with Sobolev coefficients, the three-lemma route); PH3.4 (half-disc totally real boundary); PH3.5 (vector similarity principle, unique continuation, isolated zeros); PH5.1 (interior ℓ ≥ 1 gives W^(ℓ+1,p), boundary ℓ ≥ 2 gives W^(ℓ,p)); PH5.2 (uniform estimates); PH6.1 (bundle W^(k,p) on compact bordered surfaces); PH6.3 (Fredholm, duality, kernel regularity, unique continuation); PH7.1 (Maslov index of a bundle pair); PH7.2 (closed and bordered Riemann–Roch, zero count, vanishing theorem). Each is cited by HF for exactly what it states; the two regularity citations agree with each other (F2.2a: ℓ = 1 interior → W^(2,p); F1.2: boundary needs ℓ ≥ 2 → W^(ℓ,p)).

**Cross-roadmap anchors on main.** MorseTheory M1–M6; DifferentialGeometry 0.1, 0.3, 0.4, 1.1, 1.2, 1.4, 3.2, 3.4, 3.5, 5.4, 5.6.3, 6.1, 6.2, 8.4, 8.5, 10.2; ComplexKahlerGeometry K1, K4, K5a, K7.1, K7.2; AlgebraicTopology Stages 2.3, 2.6, 5 item 1, 6 items 3–5, 7.1, 8.7; CharacteristicClasses C2 item 3 and C3 item 2; GeometricCurrents G1–G4a; GeometricTopology Layers 1, 3, 9; FuchsianOrbifolds Layer 5 (branched-cover Euler formula, `compactManifoldFiniteCWType`); RiemannianGeometry R1, R5a; HopfRinow Layer 1 (under Completed, R08e); LieGroups Layers 3–5 and 9 with the SU(2)/SO(3) example (`TauCetiRoadmap/RepresentationTheory/LieGroups`); SelfAdjointSpectralTheory SA-E01; PDE Lane A item 7, Lane B, Lane C.13; CombinatorialHeegaardFloer Lanes H, H.1, G, L, ALG; DGAInfinity Layers 0–4. Consumers DGFloer, ComplexCurveModuli, TaubesGromov (main) and FukayaTheory #1045, SymplecticFieldTheory #1054 (open) cite HF F1.x as a supplier, so the retained Layer 3 objects (spectral flow, Conley–Zehnder, weighted ends, determinant lines) have one owner.

**Pinned declarations opened** (Mathlib f6090c70, Tau Ceti 358314d4): `TauCeti.SmoothTwoForm.IsSymplectic` (TwoForm.lean:92, closed and fiberwise nondegenerate); `TauCeti.SymplecticForm` (AlmostComplex.lean:343, alternating nondegenerate); `TauCeti.stdSymplecticForm` with `stdSymplecticForm_apply : ω₀((x₁,y₁),(x₂,y₂)) = ⟪x₁,y₂⟫ − ⟪y₁,x₂⟫` (StandardCompatible.lean:72–80); `Matrix.J = fromBlocks 0 (−1) 1 0` (Mathlib/LinearAlgebra/SymplecticGroup.lean:58); `IsAlt.exists_basis_toMatrix_eq_J`, `IsAlt.even_finrank`, `exists_basis_apply_eq_J_inl_zero_eq` (SymplecticBasis.lean:301–309); `TauCeti.SmoothEmbedding` bundling Mathlib's `IsSmoothEmbedding` (SmoothEmbedding/Basic.lean:68); `tangentRange` (NormalSpace.lean:43); the PSL(2,ℂ) action on `OnePoint ℂ` through `equivProjectivization`, faithful and transitive (ProjectiveLine.lean:189–206); `Matrix.SpecialLinearGroup.finite_center` (Tau Ceti SpecialLinearGroup/Basic.lean:227); `IsIsotropic.isLagrangian_of_finrank` (Lagrangian/Basic.lean:222); `maslovIndex`, `maslovIndex_map`, `maslovIndex_prod`, `maslovIndex_rotation`; `biholomorphOfDegreeEqOne`; `FiniteHolomorphicMap`; `HeegaardRegionSystem`, `WeaklyAdmissible`, `epsilon`; `levelSetChartedSpace`, `isManifold_levelSet`, `parameterProj`, `normalFormOpenPartialHomeomorph`, `obstructionSlice`, `isMeagre_image_criticalPoints_of_isFredholm`, `dense_compl_image_criticalPoints_of_isFredholm`, `ContDiff.addHaar_image_criticalPoints_eq_zero`; `Wkp`; `stdComplexLineEnergyDensity_sub_two_mul_symplecticForm`, `stdComplexLineEnergy`; `IsPseudoholomorphic`; `Resolvent.Unbounded`; `IsManifoldNondegenerateCriticalPoint`, `IsMorse` (Tau Ceti, as the README says "native"); Mathlib `ContDiffMapSupportedIn`, `CFC.sqrt`, `ContMDiffRiemannianMetric`, `IsFredholm`, `FredholmPackage`, `IsFredholm.eventually_nhds_index_eq`, `index_continuousOn_isFredholm`, `SpectralObject`, `SpectralSequence`, `Hofer.lean` (docstring names bubbling-off analysis).

**Lean.** `lake env lean` on Suggested.lean: 5.3 s, the seven `sorry` warnings and nothing else. The `#check @` elaborated types (signatures.md, re-elaborated here) match the README: `sharp_sard` (§2.1; k > finrank E − finrank F in ℕ, Haar measure on F, critical set `U ∩ {¬Surjective (fderiv ℝ f x)}`), `sharp_sardSmale` (§2.2; complete models, second-countable Hausdorff boundaryless C^k source, pointwise integer index bound, meagre critical values), `exists_darbouxChart` and `exists_standardDarbouxChart` (§4.1; finite-dimensional boundaryless, chart centred at x₀, constant linear form respectively `stdSymplecticForm`), `sphereAut_existsUnique_map_triple` (§4.6a), `nonsqueezing` (§4.6f; open ball, embedding of the restriction, derivative preserves Im⟨·,·⟩, first coordinate below R), `exists_nonconstant_holomorphic_disc_in_component` (§4.7; compact Hausdorff L, smooth embedding, pointwise isotropy, boundary in the component of x₀). No section binder is lost: every instance in the elaborated types occurs in the statement. One-tactic probe (`first | simp | rfl | trivial | exact le_rfl` in place of each `sorry`, on a scratch copy): 7 of 7 fail, so nothing is padding; every declared name appears in the README and the file states exactly the headlines the docstring claims statable; the 13 headlines it declares not statable (M.3–M.10, F0.0's determinant bundle, F1.3–F1.5, F2.1 Moser, F2.6b–h, F2.7's Liouville consequences, F3, F4, F5, R1–R3) each name the missing carrier.

**Source sample.**

| Target | Source and locator | Checked |
|---|---|---|
| 1.7 (M.7) | Hutchings notes, cache 3db44993: Lemma 6.2 (D²=0) p. 36 line 1184, "we omit the signs" line 1185; §6.2.5 Theorem 6.5 and Corollary 6.6 p. 38 lines 1234–1242 | locators and the "suppressed sign calculation" claim correct |
| 1.10 (M.10) | none given | R04 |
| 2.1 (F0.S) | Sard 1942, cache 9ccd011b: Theorem 4.1 (m ≤ n, m-null critical values, no hypothesis on q) printed p. 885 line 91; Theorem 7.2 (m > n, n-null, q ≥ m−n+1) p. 889 line 275 | matches: HF uses 4.1 only at m=n and proves m<n itself since 4.1 gives m-null, not n-null |
| 3.2 (F1.2) | PH2.3, 2.4, 3.1–3.5, 5.1, 6.3, 7.2 | each exists and states what the table attributes |
| 3.5 (F1.5) | PH7.1, PH7.2; CC C2.3/C3.2; AT 6 item 5, 7.1, 8.7; FO Layer 5 | resolved (R08c on the AT item number) |
| 4.5 (F2.5) | "Schwarz's model, then MS Chapter 10" | chapter-level only (R08a); MS not readable |
| 4.6c (F2.6c) | MS Lemma 2.2.1 | not readable; the energy identity and Wirtinger chain recomputed below |
| 4.7 (F2.7) | Gromov §0.3.A not cited here; internal suppliers DG 5.6.3, 8.4, 8.5, 6.2, 5.4, AT 2.3, 2.6, 6.1, 6.3, PDE C.13, GT Layer 1 | all resolve on main; the stdSymplecticForm = Im⟨·,·⟩ claim recomputed below |
| 6.1 (F4.A) | OS math/0101206v4, cache 035bccf5: §2.1 pp. 5–7 (line 165, pages 159–243); Proposition 7.1 p. 51 (line 2161) | correct |
| 6.3 (F4.C) | same: Definition 4.10 p. 37 (line 1553), Remark 4.11 p. 38 (1562), Lemmas 5.2 p. 44 (1836), 5.4 p. 45 (1888), 5.6 and 5.8 p. 47 (1946, 1975), Proposition 7.2 p. 52 (2191) | correct; Lemma 5.4 is on p. 45 within the stated "pp. 44–46" |
| 6.8 (F4.4) | "Perutz (source)" | no locator (R08b); the quoted area equation is Lemma 5.2 |
| 6.9 (F4.5) | math/0105202 | wrong paper (R03) |
| 7.4 (F5.4) | LOT arXiv:0810.0687v6, cache a96d1931 (printed = PDF − 8): §3.1 and Definition 3.2 pp. 29–30 (lines 1428, 1478), §3.2 pp. 33–37 (1650), §3.3 p. 38, equation (2.29) p. 22 (1166), Theorem 1.3 p. 5 (379) | correct |
| 8.2 (R2) | Zemke 2111.14962v4, cache 4778e9f5, Theorem 1.1 line 50: plumbing tree, completed 𝔽[[U]]-modules, relatively graded when b₁=0 | matches the README's tree/𝔽₂[[U]]/b₁=0 statement |
| 8.3 (R3) | MOS math/0607691v2, cache 2b11db5d, Theorem 1.1 p. 5 line 223: H_*(C(Γ)) ≅ HFK̂(K) ⊗ V^(⊗(n−1)) | matches F5.6 and the 2×2 unknot check |

**Adversarial pass.**

| Statement | Instances | Values | Result |
|---|---|---|---|
| `sharp_sard` | E=F=0-dim; E=ℝ³,F=ℝ, f const, k=3 and k=2; t↦(t,0), k=1 | 0−0<k forces k≥1, critical set ∅, ν(∅)=0; 2<3 passes, image {0} null, 2<2 fails (Whitney); 0<1, image a line, area 0 | sound, ℕ-subtraction encodes max(m−n,0) |
| `sharp_sardSmale` | id on ℝ; zero map ℝ³→ℝ; t↦(t,0); M=∅ | index 0, k=1>0, ∅ meagre; index 3−1=2, needs k≥3, {0} meagre; index −1<1, image line nowhere dense; image ∅ | sound; pointwise bound equals Smale's k>max(index,0) |
| `exists_darbouxChart` | ω=dx∧dy; ω=e^x dx∧dy; x₁dx₁∧dx₂+dx₃∧dx₄ at 0; dim 0 | chart id, form₀=ω; chart (e^x−1,y): d(e^x−1)∧dy=e^x dx∧dy; degenerate at x₁=0, excluded by `IsSymplectic`; zero form on a point, vacuous | sound |
| `exists_standardDarbouxChart` basis transport | b(inr a)↦(e_a,0), b(inl a)↦(0,e_a) | J(inr a, inl a)=+1 and ω₀((e_a,0),(0,e_a))=⟪e_a,e_a⟫−0=+1 | convention witness holds |
| `sphereAut_existsUnique_map_triple` | (0,1,∞)↦(1,0,∞); ↦(1,∞,0); stabilizer | z↦1−z; z↦1/(1−z) (0↦1, 1↦∞, ∞↦0); diag(a,a⁻¹) acts by a²z, fixing 1 forces a²=1, trivial in PSL | sharp 3-transitivity, action is the Möbius one |
| `nonsqueezing` | n=1 id r=R=1; f=2z; f=z/2; id r=2,R=1; n=0; r=0 | Im⟨1,i⟩=1 both sides; 4≠1; 1/4≠1; (3/2,0) has norm 3/2<2 but |z₀|=3/2≥1; excluded by hn, hr | sound |
| `exists_nonconstant_holomorphic_disc_in_component` | n=1, L=S¹, u(z)=z; n=0; L=ℝ⊂ℂ | smooth, holomorphic, boundary on S¹, u(0)≠u(1/2); Im⟨ie^{iθ},ie^{iθ}⟩t²=0; n=0 excluded (disc into a point is constant); ℝ excluded by compactness, as it must be (a loop in ℝ has ∫u*α=0 but area>0) | sound |
| stdSymplecticForm = Im⟨·,·⟩_ℂ (§4.7) | v=x₁+iy₁, w=x₂+iy₂ | Im((x₁−iy₁)(x₂+iy₂)) = x₁y₂−y₁x₂ = ω₀((x₁,y₁),(x₂,y₂)) | matches the pin |
| F1.3 tanh witness | A(s)=tanh s | (d/ds−tanh)cosh=sinh−sinh=0, cosh∉L²; (−d/ds−tanh)sech=sech·tanh−tanh·sech=0, ∫sech²=2; SF=+1, index −1 | consistent with index=−SF |
| F1.4 CZ witness | ω=dx∧dy, H=ε(x²+y²)/2, ι_{X_H}ω=dH | X_H=(εy,−εx) clockwise; S=−εI, CZ=−sign(S)/2=+1=n−ind_Morse(H)=1−0 | consistent |
| F1.5 disc kernel and R05 index | ∂̄ on W^(2,p), F=e^(3iθ/2)ℝⁿ | kernel a₀+a₁z+conj(a₁)z²+conj(a₀)z³, real dim 4n; index n·1+3n=4n; two ℂⁿ constraints injective on the kernel | augmented map an isomorphism |
| F1.5 weighted formula | trivial cylinder; constant sphere | χ(ℝ×S¹)=0, c₁=0, −CZ+CZ=0 ⇒ ind 0; χ(S²)=2, ind 2n = dim of constants | formula's tests pass |
| F2.6c Wirtinger | v=1, w=i / −i / 1+i; z↦z²; z↦z̄; x+iy↦x+2iy | 1=1 (a,b)=(0,1); −1<1; 1=1 with |v∧w|²=2−1; 4|z|² for all three; 1,1,−1; 5/2 > 2 = 2 | equality cases as stated |
| F2.1 Hodge check | T², η=cosθ dθ∧dφ | d*η=−*d*η=sinθ dφ, d(sinθ dφ)=cosθ dθ∧dφ=η; opposite sign gives −η | sign law consistent |
| F2.6a cross ratio | (1,0,∞,z) | z↦1−z carries (1,0,∞) to (0,1,∞), ratio 1−z | consistent |
| F2.6e automatic surjectivity vs PH7.2 | line operator of degree d on S² | μ+2χ=2d+4>0 ⇔ d≥−1 | HF's threshold equals PH7.2's vanishing theorem |
| PH5.1 regularity citations | F2.2a ℓ=1 interior; F1.2 boundary | W^(2,p); needs ℓ≥2, gives W^(ℓ,p) | both match PH5.1 |
| F4.A/B/C checks | α=(1,0), β=(1,3); ε(x,y); S¹×S² bigons; L(p,q) | 3 generators, H₁=ℤ²/⟨(1,0),(1,3)⟩=ℤ/3; (0,−1)=−b≡2b so ε=2; P=D₁−D₂ coefficients ±1; H₂=0 so no periodic domain | all correct |
| F5.1 bigon | two acute corners | e=1−2/4=1/2, n_x=n_y=1/4, μ=1, ind=1−1+1=1 | correct |
| F5.4 strands | A(4,2): (1↦3,2↦2)(2↦4,3↦3); A(3,1) | inversions 1,1 → composite (1↦3,2↦4) has 0 ≠ 2, product 0; (1↦3) with 0=0+0 | correct |
| F5.6 trefoil, R3 unknot grid | right-handed trefoil; 2×2 grid | (A,M)=(1,0),(0,−1),(−1,−2), rank 3, χ=t−1+t⁻¹; rank 2 = 1·2^(2−1) | correct |
| R1 twice-pointed S³ | raw; twisted | rank 2; R/(1+t) rank 1, 1+t injective on 𝔽[t,t⁻¹] | correct |
| M.3 ℝP², M.7 Klein bottle, M.8 SU(3) | ℤ→ℤ→ℤ (±2,0); ℤ→ℤ²→ℤ (n↦(0,2n),0); collapse | H=(ℤ,ℤ/2,0); H=(ℤ,ℤ⊕ℤ/2,0); ℤ in degrees 0,3,5,8 | correct |
| F0.S/F0.0 checks | const ℝ³→ℝ, k=3; zero map | 2<3 vs native 3≥10; index 2, k=3 passes, k=2 fails | correct |
| F1.5 χ paragraph (R09) | c₁(TS²)[S²] | 2 = χ(S²), via C3.2's c₁=e and C2.3 | value right, ownership duplicated |

**Manifest side effect.** The `sources fetch` command of the brief created `board/packages/HeegaardFloer/sources.toml` with one record (os-absolutely-graded) although the folder had none; since this review edits no manifest, the file was removed again. The cache keeps the text (cb2158bd). `needs-references.toml` in the scratch directory lists the McDuff–Salamon request.

## Not verifiable

- McDuff–Salamon, *J-holomorphic Curves and Symplectic Topology*, 2nd ed. (F2.2 Lemmas 2.4.1–2.4.3, F2.5 Chapter 10, F2.6b Proposition 2.5.1, F2.6c Lemma 2.2.1, F2.6d §3.2 pp. 54–56, F2.6e Appendix E, F2.6g Theorem 9.4.7(ii)) and *Introduction to Symplectic Topology* §3.2 (F2.1): no legal copy; the AMS edition is paywalled and Salamon's author page returns HTTP 403 for the manuscript. Cited by locator only.
- Y.-G. Oh, *Symplectic Topology and Floer Homology* (Layer 4 header): no locator is used, nothing to check.
- M.10's missing sources (R04): not fetched, since no locator names them.
- Witnesses for the capped-disc and scalar-crossing tests of F1.5's weighted formula depend on the F1.4 sign pin; only the trivial cylinder and constant sphere were recomputed.

## Source issues

- none
