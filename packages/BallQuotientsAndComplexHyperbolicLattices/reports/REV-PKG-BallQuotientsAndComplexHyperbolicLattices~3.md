<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17136#issuecomment-6901965560 -->
Review (claude) of 35ca452

Verdict: accepted
Conditional on the announced gaps: `normality-analytification`, `normal-riemann-extension`

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

No finding. The single finding of round 2 is repaired, the repaired pattern does not recur, the
elaboration passes with `sorry` as its only warning, no statement was found false on the instances
computed below, and no declaration of `Suggested.lean` is padding. The acceptance is conditional on
the two declared supplier gaps `gap:normality-analytification` and `gap:normal-riemann-extension`
(ComplexComparisonPartII). There are no maintainer notes for this roadmap.

## Round 2 finding, checked

- **F01 (P3, `*Needs:*` lines of §§7.1, 7.2, 8.1, 8.2 and five layer Dependencies lines): repaired.**
  `packages/BallQuotientsAndComplexHyperbolicLattices/README.md` line 552 (§7.1) now ends "*Needs:*
  §§5.2–5.3 (precisely invariant neighbourhoods; compactness and volume of X_Γ); ShimuraVarieties
  §P.6; ComplexComparisonPartII §C−1.1 …; Mathlib `MulAction.orbitRel.Quotient`"; line 565 (§7.2)
  adds "ComplexKahlerGeometry K6.0 (the descended Kähler metric)"; line 607 (§8.1) reads "*Needs:*
  §§1.5, 6.1, 6.4, 7.2 (X as a complex manifold, Γ being torsion-free by §6.4); … FuchsianOrbifolds
  Layer 3 (the cusp coordinate, n = 1)"; line 621 (§8.2) reads "*Needs:* §§6.1, 6.4, 7.2, 8.1; …".
  The Dependencies lines now begin: 546 "Layers 1–2 and 4–5", 599 "Layers 1–2 and 5", 668 "Layers
  1–2 and 6–7", 741 "Layers 2 and 6–8", 813 "Layers 1–2, 4–7 and 9".
- **The same pattern in the rest of the package.** Recomputed for all 57 subsections, by script and
  then by hand for every hit: the own-section references of each statement, API list and route
  against its *Needs:* line, and the union of the *Needs:* lines of a layer against its Dependencies
  line. The eight script hits are all section numbers of other works (WitteMorris2015 "§4.1" in
  §5.1; RealSemisimpleLieGroups §5.4 in §6.1; SchemeAndStackFoundations §1.17 in §9.5;
  AdelicAlgebraicGroups §1.1 in §11.1; ShimuraVarieties §§0.1, 0.5 and BaldiUllmo2023 §3.2 in §11.3;
  ShimuraData §3.8 in §11.5) or *Needs:* lists with a parenthesis the script did not parse (§§6.4,
  9.1). Layer unions computed: 2 {1}; 3 {1,2}; 4 {1,2}; 5 {1,2,3,4}; 6 {1,2,4,5}; 7 {1,2,5};
  8 {1,2,6,7}; 9 {2,6,7,8}; 10 {1,2,4,5,6,7,9}; 11 {1,5,9,10}; 12 {3,5,6,8,9,10,11}. Each equals
  its Dependencies line. No omission found.
- **Adversarial pass on the changed passages.** The repair changed only dependency lines and one
  supplier-contract sentence (`UpperHalfPlane`, `Matrix.ProjectiveSpecialLinearGroup`); both names
  are at the pin where cited (Mathlib/Analysis/Complex/UpperHalfPlane/Basic.lean:28,
  Mathlib/LinearAlgebra/Matrix/ProjectiveSpecialLinearGroup.lean:36). The added cross-roadmap
  items exist on main: FuchsianOrbifolds "Layer 3: cusps and q-coordinates" (README line 563),
  ComplexKahlerGeometry K6.0, RiemannianGeometry R5a, ComplexManifolds Milestones 4–7.

## Verified sound

**Principles (step 1).** Every lattice of PU(1,n) for every n ≥ 1, arithmetic or not, cocompact or
not, with or without torsion; no route-specific shortcut. Nothing is planned a second time: the
form, the groups, the ball, the metric and the sub-balls are RealSemisimpleLieGroups §5.7, read
again at its open head (the contract paragraph of README line 78 agrees with that section: form
linear in the first slot, kernel μₙ₊₁, K acting by v ↦ āAv, g_𝔹, Killing = 2(n + 1)·g_𝔹, sub-balls
for 1 ≤ m ≤ n); that roadmap's scope lists Selberg's lemma, finite generation, non-arithmetic ball
quotients and the biholomorphism group of the ball as outside itself. No algorithm, no copied
passage, no sorry'd data, no `set_option`, no `lemma`, no `variable`.

**Elaboration (step 6).** `lake env lean` on `packages/BallQuotientsAndComplexHyperbolicLattices/Suggested.lean`
from the content checkout: exit 0, seven warnings, all `declaration uses sorry` (lines 101, 131,
160, 169, 175, 184, 208). No `TauCeti.*` import, so nothing to build. `#check @name` for the 16
declarations in one scratch copy: each elaborated type is the README statement; the file has no
section `variable`, so no binder can be lost. (The worker's list counts 17; its extra entry "of"
is a word of a docstring, not a declaration.)

**Padding probe (step 7), all seven theorems.** Each `sorry` replaced, in a scratch copy, by
`first | rfl | simp | infer_instance | trivial | tauto | decide | aesop | exact ⟨⊥, bot_le, inferInstance, inferInstance, by simp⟩ | exact ⟨∅, by simp⟩ | exact ⟨1, one_pos, 0, by simp⟩`:
seven errors, one at each theorem (unsolved goals at each; a failed instance search at the two
`⊥` candidates). None restates a definition, mirrors a Check, computes a value or treats a boundary
case. Each of the nine definitions has a real body and occurs in a stated headline.

**Headlines (step 7).** From the Summary and README line 7. Stated: G is the biholomorphism group
of the ball (§2.1), the Margulis lemma (§4.4), finiteness of cusp classes and the cocompactness
criterion (§6.1), finite presentation (§6.2), Selberg's lemma (§6.3), neat subgroups (§6.4). Named
in the module docstring with the missing carrier: §§3.3, 7.1, 8.2, 9.3–9.5, 10.2–10.5, 11.3–11.4,
12.2–12.4; the list equals that of README line 24. Checked at the pins (Mathlib 1b1ccf4, Tau Ceti
2fd255d): no complex analytic spaces, no analytification, no pure Shimura data, no Selberg lemma
(only Mathlib/NumberTheory/SelbergSieve.lean), no Zassenhaus neighbourhood, no neat subgroups, no
lattice predicate for subgroups of a topological group (`IsLattice` at
Mathlib/Algebra/Module/Lattice.lean:68 is for modules). Same-name or near objects, all different:
`Matrix.IsParabolic` (Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/FinTwo.lean:38, 2×2
matrices by discriminant), `IsCusp` (Mathlib/NumberTheory/ModularForms/Cusps.lean:58, subgroups of
`GL (Fin 2) ℝ`), Tau Ceti `IsParabolic` on PSL(2,R)
(TauCeti/LinearAlgebra/Matrix/ProjectiveSpecialLinearGroup/FinTwo.lean:80). Schwarz–Pick between
balls (§2.5) and the Zassenhaus theorem are routes to stated headlines, not headlines of the Summary.

**Names at the pins.** Every library declaration the README cites was opened: 55 with a file and
line by script (each line carries the declaration named), the nine "(line N)" forms by hand
(`finite_stabilizer'` 566, `finite_stabilizer` 601, `covolume` 679, `covolume_eq_volume` 695,
`commensurator` 141, `instNormalCenter` 132, the `CompactSpace` instance 110,
`affineOpenPartialHomeomorph` 311, `GeneralLinearGroup` 43), and those without a line
(`EuclideanSpace.equiv` PiL2.lean:296, `Fin.insertNth` Tuple/Basic.lean:864,
`MulAction.orbitRel.Quotient` GroupAction/Defs.lean:349, `MulAction.stabilizer` line 515,
`TopCat.GlueData` Gluing.lean:90). The 16 backticked names the README gives as this roadmap's own
are the 16 declarations of `Suggested.lean`.

**Adversarial pass (step 3).** Values computed in this round.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `biholomorphic_ball_iff` (§2.1) | n = 0; f(w) = w/2, n = 1; f = boost, tanh t = −1/2 | n = 0: ball = {0}, G trivial, both sides true with one class. w/2: no inverse on B; diag(2,1) has gᴴJg = diag(4,−1) ≠ J. Boost: (w + tanh t)/(1 + w tanh t) = (w − 1/2)/(1 − w/2), 0 ↦ −1/2 | sound both ways | none |
| Cartan's theorem hypotheses (§2.1) | z + z² on ℂ; w/2 on B | derivative 1 at 0, not the identity (unbounded); derivative 1/2, not bijective | both hypotheses used | none |
| Cayley transform (§1.3) | C(0,1/2); C(0,2); C⁻¹∘C | (0, 3i), ρ = 3 = (3/4)/(1/4); (0, −3i), ρ = −3; 1 − wₙ = 2i/(v + i), so w′ = 2iu/(v + i) | sound | none |
| Law of N, Heisenberg comparison (Conventions, §1.5) | n_a∘n_a′ on (u,v); n = 2 | vertical part t + t′ + 2i⟨a,a′⟩ − 2i Re⟨a,a′⟩ = t + t′ − 2 Im⟨a,a′⟩; (1,0)(i,0) = (1 + i, −2), reversed (1 + i, 2); image z + z′ + pq′ under (p + iq, t) ↦ (p, q, −t/4 + pq/2) | sound | none |
| Sub-ball through a point (§3.2) | p = (1/2, 0), T = ℂe₂ | W = span((1,1/2,0),(0,0,1)) = {z₁ = z₀/2}; ⟨(1,p),(1,p)⟩ = 3/4 > 0; points [1 : p + t/λ], so (p + T) ∩ B | sound | none |
| Fixed sets (§3.4) | diag(1, eⁱᶿ, 1); diag(1, ζ, ζ) | eigenspaces orthogonal, one of signature (1,1), resp. (1,0): fixed set {w₁ = 0}, resp. {0} | sound | none |
| Types of elements (§4.1) | three null eigenlines, eigenvalues λ, μ, ν | pairwise ⟨vᵢ,vⱼ⟩ ≠ 0 gives ν = 1/λ̄ = μ and ν = 1/μ̄ = λ, so \|λ\| = 1: at most two boundary fixed points without an interior one | exactly one type | none |
| Displacement (§4.2) | T_t; n_(a,0) at (0, iy); screw m·T_t | √2 arcsinh(\|t\|/2ρ); cosh(d/√2) = 1 + \|a\|²/(2y), d ≈ √2\|a\|/√y; ((2ρ + A)² + (t + B)²)/4ρ² with A = 2\|u\|²(1 − cos θ), B = 2\|u\|² sin θ: near 1 with ρ ≤ N forces A → 0, then B → 0, and \|t\|/2N remains | sound | none |
| `margulis_lemma` route (§4.4) | ε = 1/m, cover of B₁ by m translates g_iV | products of ≤ m elements have displacement < 1; two in one g_iV differ by an element of V⁻¹V ⊂ U; C₀ ⊊ … ⊊ C_m needs m + 1 cosets, so index ≤ m; S₃ ⊂ U(2): index 2, not nilpotent | sound; bound is on the index | none |
| Discrete groups at a cusp (§4.5) | n = 2, ⟨n_(1,0), n_(i,0)⟩; {n_(a,0) : a ∈ ℤ} | commutator T₋₄, Λ = ℤ[i] of rank 2 = 2n − 2; rank 1, isotropic real span of dimension ≤ n − 1 < 2n − 2 | hypothesis used | none |
| `IsLattice`, covolume (§§5.1, 5.3) | n = 0; ⟨T_1⟩, n = 1; Killing scaling | point, covolume finite; strip area (ε⁻¹ − 1)/2 → ∞, horoball part 1/(2Y); volume factor (2(n + 1))ⁿ in real dimension 2n | sound | none |
| Proper discontinuity (§5.2) | {1, w ↦ −w}; irrational rotation | stabiliser of 0 has 2 elements; infinite stabiliser, not discrete | finite, not trivial, stabilisers | none |
| Cusp theorems (§6.1) | n = 0; PSL(2,ℤ); elliptic point of parabolic type | sphere empty, quotient compact; one cusp class; zᴴHz = −iv + iv̄ − 2\|u\|² = 2(Im v − \|u\|²), √2·arcsinh(1/2000) = 0.000707106752 | sound | none |
| `selberg_lemma` (§6.3) | char 0, char p, Γ(3), ι = ∅ | (ζ − 1)^N ∈ 𝔞R[ζ]; Π(1 − η^j) = e ∈ 𝔐 gives ℓ ∣ e; two residue characteristics give d = 1; char p: e prime to p; traces −2, 0, 1 ≢ 2 mod 3 | sound in every characteristic | none |
| `IsNeat`, `IsLattice.exists_neat` (§6.4) | lift diag(1/2, i, 2); γ = mη ∈ Γ_b | y ↦ (y₀/2, iy₁, 2y₂) gives (2iu, 4v) and preserves Im(ȳ₀y₂) − \|y₁\|²; ratios 1, 1, 1, ±2i, ±i/2, 4, 1/4; 2i·(i/2) = −1; γᵏ ∈ N forces mᵏ = 1, then Ad(m) = 1 | sound; weaker than the supplier's neatness | none |
| Cusp chart (§8.1) | Ψ_b; ⟨n_(λ,0), n_(iλ,0)⟩ | \|q\|² = exp(−4π Im v/τ), μ = exp(−4πρ/τ); e_(a+a′)/(e_a(u + a′)e_a′) = exp(−4πi Im/τ)·exp(4πi Im/τ) = 1; central elements have t ∈ 4λ²ℤ, product has t = −2λ² = −τ/2, χ = −1 | sound | none |
| Appell–Humbert data (§8.2) | H_b(u,a) = −(4/τ)⟨a,u⟩ | πH_b(u,a) + πH_b(a,a)/2 = −(4π/τ)⟨a,u⟩ − (2π/τ)\|a\|²; −H_b(iλ, λ) = i, so E′(iλ, λ) = 1 | sound | none |
| Asymptotics (§8.3) | n = 1 | ∂∂̄(−log L) = ∂L∧∂̄L/L² with L = −log\|q\|: ω = i dq∧dq̄/(4\|q\|² log²\|q\|); metric \|dq\|²/(2\|q\|² log²\|q\|) | sound, agrees with §10.1 | none |
| L² criterion (§8.4) | f = q^k | \|ν\|² ≍ (−log\|q\|)ⁿ⁺¹; integrand r^(2k−1)(−log r)^((ℓ−1)(n+1)); k = 0 diverges iff ℓ ≥ 1; ∫₀^δ dr/(r log² r) = 1/(−log δ) | sound; ℓ = 0 excluded | none |
| Finite volume (§8.5) | β = i dw∧dw̄/(\|w\|² log²\|w\|) | β∧β = 0, so ω^k ≤ C(ω_E′^k + k ω_E′^(k−1)∧β); radial integral 1/(−log δ) | sound | none |
| Jets (§9.1) | weights n log\|z\|², (n + 1) log\|z\|²; genus g, ℓ = 2 | r⁻²ⁿ·r²ⁿ⁻¹ = 1/r diverges (value 0); r⁻²ⁿ⁻²·r²·r²ⁿ⁻¹ = 1/r diverges (first order); 4g − 4 ≥ 2g + 1 iff g ≥ 3; g = 2: 4 < 5 | sound; ℓ₀ depends on Γ | none |
| Sections of E^ℓ (§9.2) | Γ(2)/{±1} | E = O(−2 + 3) = O(1); O(ℓ − 3) has dimension ℓ − 2 = −(2ℓ − 1) + 3(ℓ − 1); ℓ = 1: no section of O(1) vanishes at two of three points only | sound; ℓ ≥ 2 sharp | none |
| Embedding (§9.3) | Γ(2)/{±1}; K alone | O(ℓ) very ample, T_b points; K = O(−2) has no sections | sound | none |
| Hyperbolic embedding (§10.1) | circle \|q\| = r | 2πr/(√2 r\|log r\|) = √2π/\|log r\| → 0; d_Γ ≤ Kobayashi distance, so Kiernan's hypothesis follows | sound | none |
| Uniqueness (§10.5) | Γ₀(2); nodal cubic; doubled ℙ¹ | genus 1 + 3/12 − 1/4 − 1 = 0, two ends; node: two branches; six boundary points, not Hausdorff | each hypothesis used | none |
| Γ₀(11) (§9.6) | index 12 | (−1/11) = −1; −3 ≡ 8 is not among the squares 1, 3, 4, 5, 9; genus 1 + 1 − 0 − 0 − 1 = 1 | sound | none |
| Components of X (§11.3) | n = 1, 2 | \|det g\|² = det(−J)/det J = 1, resp. −1; Sylvester for all n ≥ 2; compact factors have connected real points | sound | none |
| Integral points (§11.1 (c)) | A = diag(2,1) | A·SL₂(ℤ)·A⁻¹ = {[[a, 2b],[c/2, d]]}, meeting SL₂(ℤ) in Γ⁰(2), index 3 | commensurable, not equal | none |
| Intersection inequality (§12.4) | Q = B × {s}; Q = B × S_Γ | dim U = 0 = n − n; dim U = n = 2n − n | sound | none |

Context, generality and conventions: the README works for n ≥ 1 and says (Conventions) that the
headlines are stated for n ≥ 0, as the Lean signatures are; the form is conjugate-linear in the
first slot here and linear there in the supplier, with the witness of §1.1 (1 + i/4 against
1 − i/4); the Lean `IsLattice` (a fundamental domain of finite Haar measure for left
multiplication) is VonNeumannAlgebras Layer 9's notion on the unimodular G and is word for word the
notion AdelicAlgebraicGroups §3.4 uses for arithmetic lattices (its README line 3386), so §11.1
reads the supplier's predicate on the same lattices.

**Sources (step 2): the 15 sampled targets**, every locator opened.

- §1.3: BaldiUllmo2023 line 559 to line 565 (Siegel domain); Mok2012 line 131 to line 137: correct.
- §2.1, §3.2: Goldman1999 Ch. 3 only (uncertified): not readable; statements checked by computation
  (table) and against RealSemisimpleLieGroups §5.7.
- §4.1: Mok2012 line 325 to line 335: correct.
- §4.4: Mok2012 line 342 to line 349; BaldiUllmo2023 line 573 to line 575: correct; Raghunathan1972
  uncertified.
- §5.2: WitteMorris2015 line 18549 to line 18561, Definitions B1.3, printed pp. 447–448: correct.
- §6.4: WitteMorris2015 line 2969 to line 2973; BaldiUllmo2023 line 523 to line 524, Proposition
  3.3.3 at line 530: correct.
- §8.1: Mok2012 line 152 to line 239, equations (5)–(6) at line 173 to line 175; BaldiUllmo2023
  line 559 to line 571: correct; the source's kτ and the missing factor are as the README says.
- §8.3: Mok2012 line 240 to line 304, Proposition 1 at line 295; BaldiUllmo2023 Definition 3.3.4,
  line 586, Theorem 3.3.5, line 600: correct.
- §8.5: BaldiUllmo2023 line 586 to line 601; Mok2012 line 295: correct (inputs; the statement is
  proved in the README).
- §9.1: Mok2012 Theorem 2, line 495 to line 514 (the L² existence theorem), line 681 to line 772
  (base points) and line 817 to line 901 (jets and separation): correct.
- §9.2: Mok2012 Main Theorem, line 546 to line 553, and line 591 to line 678; the source takes
  q ≥ 2 at line 639 to line 641, as the README's ℓ ≥ 2: correct.
- §9.3: Mok2012 line 546 to line 562 and line 681 to line 930: correct.
- §10.1: Kiernan1972 line 57 to line 75; Deng2020 line 61 to line 63: correct.
- §10.5: Mok2012 line 11 to line 16; MilneSVI line 1690 to line 1694; BaldiUllmo2023 line 511 to
  line 516: correct, and the README says rightly that none of them states the uniqueness.
- Beyond the sample: BaldiUllmo2023 line 486 to line 506, Theorem 1.3.2 at line 151, Definition
  3.1.13 at line 468, Corollary 3.4.6 at line 686, Corollary 5.5.2 at line 1346; Kiernan1972
  Theorem 1 at line 111, Theorem 2 at line 157; Mok2012 Theorem 1 at line 476: as cited.
- Manifest: 17 works cited, 17 entries in `sources.toml`, no local path; no locator is flagged as
  unverified by the author. No source was fetched; `needs-references.toml` was not written.

**Duplication and ownership (step 4).** Searched every README on main and at the open heads, by
object: Selberg's lemma, Zassenhaus neighbourhoods, the cusp structure theorem, finite presentation
of lattices, Cartan's uniqueness theorem, hyperbolic embedding and the Siu–Yau–Mok compactification
are stated by no other roadmap; the Margulis lemma for ℍⁿ is GeometricTopology §7.3, which the
README distinguishes; ShimuraVarieties and PELModuli mention ball quotients as examples only.
`scratch/overlaps.md`: no other pull request changes this roadmap, no cited id is dropped, none is
defined only by a revision, no second copy. The board's index lists two packages under review
(AnalyticNumberTheory, LawrenceVenkateshMethod), neither on this subject.

Overlap check: read RealSemisimpleLieGroups, ArithmeticFuchsianGroups, KleinianGroups, ShimuraVarieties, FuchsianOrbifoldsPartII (open), FuchsianOrbifolds, AdelicAlgebraicGroups, ConformalMappingPartII (main), the third list being empty; shared objects and owners: the form, groups, ball, metric and sub-balls — RealSemisimpleLieGroups §5.7; arithmetic lattices and neat levels — AdelicAlgebraicGroups §§3.4, 4.3; Shimura data and Baily–Borel — ShimuraVarieties; the case n = 1 — FuchsianOrbifolds; nothing has two owners.

**Suppliers (step 5).** Dependency check:

    depcheck: 240 roadmaps, 2265 edges, 0 problem(s)

No UPWARD, CYCLE or moved line. The roadmap is at line 122 of the merge order, after
ComplexComparisonPartII (42), ShimuraVarieties (110), PELModuli (120) and ShimuraData (121).
RealSemisimpleLieGroups is another author's open pull request adding a new folder. Resolved now, on
main: VonNeumannAlgebras Layer 9 (README line 2861), AdelicAlgebraicGroups §§1.1, 3.4, 4.3 with
`Reduction.IsSArithmetic` (used as `IsSArithmetic ∅ Γ`, as at its README line 3393),
`Reduction.arithmetic_finite_volume_iff`, `Reduction.levelArithmetic`, `Neat.IsNeatAut`,
`Neat.IsNeatLevel`; RepresentationTheory/LieGroups Layer 9 (`IwasawaData`, `kakDecomposition`,
`iwasawaDecomposition`); ComplexKahlerGeometry K1–K4, K6.0; ComplexManifolds Milestones 4–7;
ComplexTori Milestone 1; RiemannianGeometry R4.7, R5a; FuchsianOrbifolds Layers 0–4, L2.1;
SchemeAndStackFoundations §1.17 (`finiteGroupQuotient_projective`); GeometricTopology §7.3;
ResolutionOfSingularitiesCharacteristicZero §6.2; Completed/ConformalMapping Layer 2. At open heads:
RealSemisimpleLieGroups §§3.1, 5.2, 5.3, 5.4, 5.6, 5.7; ComplexComparisonPartII C-1.1, C-1.2, C0.6
(where `analyticSetGeometry` is defined), C1.4, C1.6, C1.9, C4.1, C4.2, C4.4 with the eleven
names; ShimuraVarieties §§P.1, P.2, P.6, 0.1, 0.4, 0.5, 1.2, 2.1, 2.2, 2.5, 2.7, 3.1, 3.3, 3.4a, 3.5
with the thirteen `TauCeti.Shimura.*` names; PELModuli §M5.5 (three names); ShimuraData §3.8;
AbelianSchemesAndArithmeticModuli §A5.3 (`appellHumbert`); AlgebraicModuliForArithmeticGeometry
§§5.4, 9.5; ArithmeticLocallySymmetricSpaces ALS.0.5; ShimuraCompactifications Layer 2 (a boundary
of scope, not consumed). All exist where cited. Both gaps carry the same slug in `design/plan.json`
and under `## Exact supplier contracts`, name ComplexComparisonPartII and a section, and ask for
nothing that roadmap states: its README, at line 2926 to line 2929 of its open head, says that its
own route avoids "the normality of the analytification of a normal scheme and the extension theorem
on normal analytic spaces", the two inputs the gaps ask for, and states neither elsewhere.

**Shape (step 6).** 57 subsections, each with one *Needs:* line and a Checks list of at least
three bullets (60 Checks lists with the Conventions and the two gaps); twelve layers, each ending
with Examples and Dependencies; layers named by their mathematics; no sentence says the roadmap
follows a source. Searched and not found: LaTeX delimiters, pull-request numbers, dates, anchors,
machine paths, "review", "round", "removed", "optional", "deferred", "current". The Lean file has
one module docstring, the namespace, layer comments in README order, a docstring on every
declaration, `import Mathlib` only.

**Copyright and arrangement (step 8).** Wording set beside the source at every readable locator of
the sample and at these further passages: §1.1 against BaldiUllmo2023 line 486 to line 496; §3.1
against line 496 to line 506; §8.4 against Mok2012 line 568 to line 626; the routes of §9.1 and
§9.2 against Mok2012 line 681 to line 772 and line 629 to line 678; §12.1 against BaldiUllmo2023
line 468 to line 474; the docstrings of `IsParabolic` and `selberg_lemma` against Mok2012 line 331
to line 335 and WitteMorris2015 line 2972 to line 2973. No sentence is shared; the longest common
runs are standard names ("the mean-value inequality", "nontrivial root of unity"). BaldiUllmo2023's
contents (line 15 to line 21: introduction; notation; real Shimura data; ℤ-Hodge theory; comparison
of special structures; finiteness; special points) do not map onto the twelve layers. Mok2012's
order (cusp charts, metric near the divisors, structure of ends, L² estimates, Main Theorem) meets
Layers 8–9 only where *Needs:* lines force it (§8.3 needs §§8.1–8.2; §9.2 needs §§8.2–8.4 and 9.1;
§9.3 needs §§9.1–9.2), and its structure of ends is in Layer 6. No table, figure or list is taken
over.

Source independence: 27 passages compared with 6 sources, none shared; largest share BaldiUllmo2023, 39 of 145 locators; contents compared with BaldiUllmo2023 and Mok2012: independent. Not read: Goldman1999, Raghunathan1972, Borel1969, Borel1972, BailyBorel1966, SiuYau1982, Cartan1957, Alperin1987, GarlandRaghunathan1970 (31 locators together).

## Not verifiable

- Goldman1999 Ch. 3 (uncertified): the only locator of the sampled §§2.1 and 3.2 and of §3.4. The
  statements were checked by computation and against RealSemisimpleLieGroups §5.7; the locator was
  not.
- Raghunathan1972, Borel1969, Alperin1987, Borel1972, BailyBorel1966, SiuYau1982, Cartan1957
  (uncertified) and GarlandRaghunathan1970 (waived): not read. Each stands beside a readable source
  or a proof route written in the README, except Cartan1957 for §§7.1 and 7.3.
- Ownership against open pull requests was checked with the roadmaps tools over the indexed heads
  (461 pull requests, index of 2026-11-15), not by reading every folder.

## Source issues

- **Gap** in Mok2012 at §1.1, equation (5), line 173: the source says every element of the cusp group has vertical part an integer multiple of τ; it should allow any real value determined modulo τ (a product of two generators can have −τ/2); affects a stated result.
- **Misprint** in Mok2012 at the proof of the Main Theorem, equation (4), line 641: the source says the curvature of the q-th canonical power plus the Ricci form is (q − 1) times the Kähler form; it should be (q − 1)(n + 1) times it for the form of §1.2 (1); affects nothing.
- **Gap** in BaldiUllmo2023 at Corollary 1.3.3 (Corollary 5.5.4 of the published version): the source says the corollary is proved; it should be regarded as unproved, a step of its proof being unjustified; affects a stated result; corrected in print at Appendix A, line 1889 to line 1903.

## For the human reviewers

- **Licence.** Mok2012 was read in the HKU IMR preprint IMR2009-4 (`sources.toml`, `licence_class` "author-page"); the published chapter was not compared, and the README cites the preprint's numbering.
- **Not tested.** Goldman1999 (uncertified) is the only source cited for §§2.1, 3.2 and 3.4; wording and locators there were compared with no text.
- **Scope.** Lattices in locally compact groups are defined both by VonNeumannAlgebras Layer 9 (cited here) and by AdelicAlgebraicGroups AA.2.3 (cited by RealSemisimpleLieGroups, Scope and ownership); both are on main, and the two definitions agree on PU(1,n).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "35ca45252ace7c0462e35f381f4f6b8bf45c10cd", "job": "REV-PKG-BallQuotientsAndComplexHyperbolicLattices~3", "model": "fable", "worker": "chris-x81"} -->
