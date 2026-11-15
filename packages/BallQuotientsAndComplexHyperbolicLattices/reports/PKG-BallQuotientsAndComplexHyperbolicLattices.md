# PKG-BallQuotientsAndComplexHyperbolicLattices

Package of the accepted design (twelve layers, 57 subsections, two supplier gaps) as
`packages/BallQuotientsAndComplexHyperbolicLattices/README.md`, `Suggested.lean`, `metadata.toml`
(`topic = "math.AG"`) and `sources.toml`. Every target, Check and worked example of the design is
kept; the mathematics is the design's except for the corrections listed below. `design/plan.json`
is unchanged: its `gaps` list already declares the two gaps the README states
(`gap:normality-analytification`, `gap:normal-riemann-extension`, supplier ComplexComparisonPartII),
and both are still open at its head (its README still says its route avoids "the analytification
of a normal scheme and the extension theorem on normal analytic spaces").

## Headline theorems

| Headline (README) | Status | Lean name / what is missing at the pins |
|---|---|---|
| PU(1,n) is the biholomorphism group of the ball (§2.1) | stated | `biholomorphic_ball_iff` |
| Margulis lemma for discrete subgroups of PU(1,n) (§4.4) | stated | `margulis_lemma` (distance `ballDist`) |
| Finitely many cusp classes of a lattice (§6.1) | stated | `IsLattice.exists_finset_cuspPoint_orbits` |
| A lattice is cocompact iff it has no cusp point (§6.1) | stated | `IsLattice.compactSpace_quotient_iff` |
| Lattices are finitely presented (§6.2) | stated | `IsLattice.isFinitelyPresented` |
| Selberg's lemma, eigenvalue form (§6.3) | stated | `selberg_lemma` |
| Normal neat subgroups of finite index (§6.4) | stated | `IsLattice.exists_neat` |
| Totally geodesic complex subvarieties of the ball are sub-balls (§3.3) | not statable | no complex-analytic subsets of a complex manifold (irreducibility, regular locus) in Mathlib or Tau Ceti; the invariant metric is not a declared Riemannian metric |
| Γ\𝔹ⁿ is a normal complex analytic space (§7.1) | not statable | no complex analytic spaces |
| Toroidal compactification with abelian-variety boundary (§8.2) | not statable | no analytification of projective varieties ("abelian variety" cannot be said of a complex torus) |
| Mok's theorem: S*_Γ normal projective with finite boundary (§§9.3–9.5) | not statable | no complex analytic spaces, no analytification functor |
| Extension theorem into S*_Γ (§10.2) | not statable | S*_Γ is a normal complex space, not carried |
| Borel algebraicity and minimality (§10.3) | not statable | no analytification of varieties and morphisms |
| Uniqueness of the model and of the finite-point normal compactification (§§10.4–10.5) | not statable | same |
| Shimura datum of an arithmetic lattice; comparison with Baily–Borel (§§11.3–11.4) | not statable | no pure Shimura data, no Baily–Borel compactification |
| Γ-special = totally geodesic; intersection inequality in 𝔹ⁿ × S_Γ (§§12.2–12.4) | not statable | no analytification, no analytic subsets |

Supporting results judged not headlines and kept in the README only: the Schwarz–Pick contraction
between balls (§2.5), the Kähler–Einstein and curvature values (§2.3), the covolume–volume
equality (§5.3), the arithmetic witness form and cocompactness transfer (§§11.1–11.2).

Definitions added to `Suggested.lean`, each with a real body and needed by a headline:
`indefiniteUnitaryGroup` (a `Subgroup` of `GL (Fin 1 ⊕ Fin n) ℂ`, closure proofs written out),
`projectiveUnitaryGroup` (quotient by `Subgroup.center`), `ballMap`, `ballDist`, `IsParabolic`,
`IsLattice`, `IsCuspPoint`, `conjugationMap`, `IsNeat`. No instance, no `set_option`, single
`import Mathlib`, no Tau Ceti import needed.

## Corrections to the design (said in the README)

1. **Selberg's lemma generalised (§6.3, `selberg_lemma`).** The design stated the eigenvalue form
   for fields of characteristic 0. The eigenvalue conclusion holds over every field: in
   characteristic p roots of unity have order d prime to p, and Π_{0<j<d}(1 − ζ^j) = d lying in a
   prime over the maximal ideal of a congruence kernel is a contradiction, so one maximal ideal
   suffices; in characteristic 0 two maximal ideals of distinct residue characteristics are used.
   `[CharZero F]` is dropped in Lean and README; the README keeps "torsion-free" for
   characteristic 0 only and adds the Check Λ = ⟨diag(t,1), [[1,1],[0,1]]⟩ ⊂ GL₂(𝔽_p(t)), where
   every finite-index subgroup contains elements of order p (eigenvalue 1). The route paragraph
   is rewritten to cover both characteristics; Mathlib's lying-over theorem is added to *Needs*.
   The index set is any finite ι (ι empty gives the empty statement).
2. **Positivity of ω is a pinned declaration (§2.2).** The design proved "ω is closed and
   positive". Tau Ceti's `TauCeti.leviForm` (TauCeti/Analysis/Complex/LeviForm.lean:119) is the
   matrix h of ω's potential, and
   `TauCeti.norm_fderiv_apply_sq_le_re_leviForm_neg_log_one_sub_norm_sq`
   (TauCeti/Analysis/Complex/NegLogOneSubNormSq.lean:55) with g the identity gives h(v,v) ≥ |v|².
   Positivity is now cited (supplier contract and §2.2 *Needs*), not proved again.
3. **Supplier gaps placed in the supplier's subsection.** The two `What ComplexComparisonPartII
   must provide (gap:…)` paragraphs, with their Checks, now sit inside "From
   TauCetiRoadmap.ComplexComparisonPartII"; the separate subsection heading is gone.
4. **§1.4.** Non-vanishing of the denominator a + bᵀw extended from B to the closed ball
   (|a|² − |b|² = 1 from g ∈ U(1,n) ⇔ gᴴ ∈ U(1,n)), since `ballMap` is used on the sphere.
5. **§5.1.** New target: the σ-algebra on G used by `IsLattice` (`QuotientGroup.measurableSpace`
   over `Units.instMeasurableSpace`, which is the comap along `Units.val` of
   `Matrix.instMeasurableSpace`, checked by `rfl` in a scratch file) is the Borel σ-algebra, so
   `IsLattice` is VonNeumannAlgebras Layer 9's notion.
6. **Locator.** "WitteMorris2015 Exercise 4.1#10" rewritten "Exercise 10 of §4.1" in the README and
   `sources.toml` (same line 2000 to line 2001), so that no `#digits` string appears.
7. **Conventions.** The headlines are stated for every n ≥ 0 in Lean; the README now says so (n = 0:
   a point, G trivial, no sphere, each headline trivially true), so README and Lean have equal
   generality.

New README text (all in prose, every backticked name declared in `Suggested.lean`): a paragraph
after the Summary naming the acceptance test's headlines; a Scope bullet on the acceptance-test
carriers and why the other headlines are absent; Mathlib locators for every carrier the Lean file
uses; carrier comparisons in §§1.1, 1.2, 1.4, 2.4, 5.1; Lean names in §§2.1, 4.1, 4.4, 6.1–6.4;
new Checks in §1.4 (`ballMap` of diag(2,1,…,1); the pole of h_t at w = i coth t, outside the closed
ball), §2.4 (`ballDist` values and non-invariance of the Euclidean distance), §4.1 (fixed points of
T_t off the closed ball), §6.3 (characteristic p).

## What the README could not support

Nothing of the design was dropped. Notions moved down from later roadmaps: none.

## Duplication sweep (by object)

Searched with `roadmaps grep` over main and the 477 open heads of the tools' index, and in the
pinned Mathlib and Tau Ceti: Selberg's lemma / virtually torsion-free / finitely generated linear
groups; Margulis lemma, Zassenhaus; PU(1,n), complex hyperbolic, ball quotient; Siegel domain,
Cayley transform; automorphisms / biholomorphism group of the ball; toroidal compactification;
Garland, precisely invariant; hyperbolically embedded, Kiernan, Borel extension, big Picard;
lattices in Lie groups; group-lattice predicates in Lean files; indefinite unitary groups,
Bergman / complex hyperbolic metrics, analytic subsets, analytification at the pins.

- Selberg's lemma: owned by no other roadmap (RealSemisimpleLieGroups lists it as outside its
  scope; FinitenessAndDualityOfGroups only assumes virtual torsion-freeness); not in Mathlib or
  Tau Ceti (the Tau Ceti "Selberg" hits are the Eichler–Selberg trace formula).
- Cartan's theorem for the ball, Margulis lemma for 𝔹ⁿ, cusp theorem, Mok's theorem: no other
  owner (GeometricTopology §7.3 owns the ℍⁿ Margulis lemma, already cited as a different object;
  Tau Ceti's `TauCeti/Analysis/Complex/Fuchsian/Margulis.lean` is PSL(2,ℝ)-specific, the n = 1
  case reached through FuchsianOrbifolds).
- Indefinite unitary group, PU(1,n), lattice predicate in a Lie group: not at the pins (Mathlib
  has only `Matrix.unitaryGroup` and the module-lattice `Submodule.IsLattice`); RealSemisimpleLieGroups'
  Suggested.lean declares no unitary group or ball; no roadmap's Lean file declares a lattice
  predicate for subgroups of a topological group.
- **Removal:** the proof of positivity of ω (§2.2), replaced by the Tau Ceti citation above.
  No other definition or theorem of the design exists elsewhere.

Ownership against open pull requests was checked through the tools' index of open heads (477 pull
requests), which includes RealSemisimpleLieGroups, ComplexComparisonPartII, ShimuraVarieties,
ShimuraData, PELModuli and ShimuraCompactifications; all section ids and backticked names the
README cites were re-read there (RealSemisimpleLieGroups §§3.1, 5.2–5.4, 5.6, 5.7;
ComplexComparisonPartII §§C−1.1, C−1.2, C0.6, C1.4, C1.6, C1.9, C4.1, C4.2, C4.4 and the nine names;
ShimuraVarieties §§P.1, P.2, P.6, 0.1, 0.4, 0.5, 1.2, 2.1, 2.2, 2.5, 2.7, 3.1–3.4a, 3.5 and the
thirteen `TauCeti.Shimura.*` names; PELModuli §M5.5 and its three names; ShimuraData §3.8;
ShimuraCompactifications Layer 2) and on main (LieGroups Layer 9 with `IwasawaData`,
`iwasawaDecomposition`, `kakDecomposition`; ComplexKahlerGeometry K1–K4, K6.0; ComplexManifolds
Milestones 4–7; ComplexTori Milestone 1; AbelianSchemesAndArithmeticModuli §A5.3 `appellHumbert`;
VonNeumannAlgebras Layer 9; RiemannianGeometry R4.7, R5a; Completed/ConformalMapping Layer 2;
Completed/HopfRinow; SchemeAndStackFoundations §1.17; GeometricTopology §7.3; AdelicAlgebraicGroups
§§1.1, 3.4, 4.3 with `Reduction.IsSArithmetic`, `Reduction.levelArithmetic`,
`Reduction.arithmetic_finite_volume_iff`, `Neat.IsNeatAut`, `Neat.IsNeatLevel`;
AlgebraicModuliForArithmeticGeometry §§5.4, 9.5; ResolutionOfSingularitiesCharacteristicZero §6.2;
ArithmeticLocallySymmetricSpaces ALS.0.5; FuchsianOrbifolds Layers 0–4). All hold.
`roadmaps resolve` on the final README: no cross-roadmap citation and no Lean name found nowhere.

## Elaboration

`lake env lean packages/BallQuotientsAndComplexHyperbolicLattices/Suggested.lean`, run from the
content checkout at the pins (Mathlib 1b1ccf4, Tau Ceti 2fd255d): exactly **7** warnings, each
"declaration uses `sorry`" (lines 101, 131, 160, 169, 175, 184, 208: the seven headline theorems);
no other message. The definitions elaborate with complete proofs.

`#check` comparison: a scratch copy of the file with `#check @name` for all sixteen declarations
was elaborated and each type compared with its README statement. Every declaration carries its
binders in its own signature (no section `variable`s are used). Changes made after the comparison:
the Margulis statement used a `let` that elaborated as `have`; it is restated with the nilpotent
subgroup taken in the subtype of the generated subgroup (`N.FiniteIndex ∧ N.index ≤ m`), which
also avoids `Subgroup.relIndex`'s junk value 0 for infinite index; `[CharZero F]` dropped from
`selberg_lemma` (correction 1). Elaborated types after the changes:
`margulis_lemma : ∀ n, ∃ ε > 0, ∃ m, ∀ Δ, DiscreteTopology ↥Δ → ∀ x ∈ ball 0 1, ∃ N, Group.IsNilpotent ↥N ∧ N.FiniteIndex ∧ N.index ≤ m`;
`selberg_lemma : ∀ {F} [Field F] {ι} [Fintype ι] [DecidableEq ι] (Λ : Subgroup (GL ι F)), Group.FG ↥Λ → ∃ Λ' ≤ Λ, (Λ'.subgroupOf Λ).Normal ∧ (Λ'.subgroupOf Λ).FiniteIndex ∧ ∀ g ∈ Λ', ∀ ζ, (map (algebraMap F (AlgebraicClosure F)) (↑g).charpoly).IsRoot ζ → ∀ k, 0 < k → ζ ^ k = 1 → ζ = 1`.

## Adversarial pass (statements written or changed here)

Conventions: ⟨z,w⟩ = Σ conj-linear in the first slot, J = diag(1, −1, …, −1), g = [[a, bᵀ],[c, D]].

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| `indefiniteUnitaryGroup` | h_t (n = 1); 2·1; swap S; n = 0 | h_tᴴJh_t: entries cosh² − sinh² = 1, cosh·i sinh − i sinh·cosh = 0, sinh² − cosh² = −1, so = J; (2·1)ᴴJ(2·1) = 4J ∉; SᴴJS = −J ∉; n = 0 gives U(1) | Pass |
| `projectiveUnitaryGroup` (centre = unit scalars) | n = 1: diag(1,−1) vs h_t; i·1; n = 0 | diag(1,−1)h_t has (0,1) entry i sinh t, h_t diag(1,−1) has −i sinh t: not central for t ≠ 0; i·1 central, trivial in G; U(1,0) = U(1) abelian, PU(1,0) trivial | Pass |
| `ballMap` | h_t at 0; diag(2,1); pole of h_t; Lean `mulVec` rows | (g(1,w))_inl = a + bᵀw, (g(1,w))_inr = c + Dw; h_t·0 = −i sinh t / cosh t = −i tanh t; diag(2,1): w ↦ w/2, not onto B; pole w = i coth t, \|w\| = coth\|t\| > 1; junk value 0 only off the closed ball | Pass; Check added (§1.4) |
| §1.4 denominator on the closed ball | g ∈ U(1,n) via gᴴ ∈ U(1,n) | (gJgᴴ)₀₀ = \|a\|² − \|b\|² = 1, so \|a\| > \|b\| ≥ \|bᵀw\| for \|w\| ≤ 1; h_t: cosh² − sinh² = 1 | Extended from B to closed ball |
| `biholomorphic_ball_iff` | f = id; f = −w; Möbius (w − 1/2)/(1 − w/2); f = w/2; antiholomorphic conj; lifts g, i·g; n = 0 | boost with tanh t = −1/2: (tanh t + w)/(1 + w tanh t) = (w − 1/2)/(1 − w/2); w/2: no inverse onto B, RHS false since every `ballMap g` is onto B; conj: not ℂ-differentiable, both sides false; g and i·g same class; n = 0: B = {0}, both sides true | Pass |
| `ballDist` | (0, (1/2,0)); w = w′; boost pairs (0,1/2) ↦ (1/2,4/5); reverse Cauchy–Schwarz | argument 2/√3, arcosh = (1/2) ln 3, d = 0.776836 = √2 artanh(1/2); w = w′: argument 1, d = 0; pair images: \|1 − 2/5\| = 3/5, √((3/4)(9/25)) = 3√3/10, ratio 2/√3 again, Euclidean 1/2 → 3/10; (1 − ab)² − (1 − a²)(1 − b²) = (a − b)² ≥ 0 | Pass; Checks added (§2.4) |
| `IsParabolic` | T_t (n = 2); a_s; identity; diag(1, e^{iθ}) | T_t: y ↦ (y₀, y₁, y₂ + ty₀) fixes {y₀ = 0} = {w₂ = 1}, i.e. (c,1), norm √(1 + \|c\|²), only c = 0 on the sphere: parabolic; a_s fixes b₀ and C⁻¹(0,0) = (0, −1): two boundary points, not parabolic; identity and the rotation fix 0 ∈ B: not parabolic | Pass; Check added (§4.1) |
| `margulis_lemma` | S₃ ⊂ K (n = 2) at 0; C_m ⊂ K (n = 1); ⟨T_1⟩ high in a horoball; dense free subgroup of K; n = 0 | S₃: all displacements 0, H = S₃, nilpotent A₃ of index 2 ≤ m; C_m: H abelian, index 1 for every m; ⟨T_1⟩: displacement √2 arcsinh(1/(2y)) → 0, H ≅ ℤ; dense free group excluded by `DiscreteTopology`; `Subgroup.relIndex` would read 0 at infinite index, hence `FiniteIndex`; n = 0: H trivial, N = ⊤ | Pass; restated without `let` |
| `IsLattice` | ⊥ (n ≥ 1); image of PSL(2,ℤ); ⟨T_1⟩; n = 0 | ⊥: fundamental domain G, Haar(G) = ∞ (G noncompact); PSL(2,ℤ): ω-covolume π/6 < ∞; ⟨T_1⟩: strip area ∫_ε^1 dy/(2y²) = (ε⁻¹ − 1)/2 → ∞; n = 0: G trivial compact, lattice | Pass |
| §5.1 σ-algebra on G | Lean probe | `(inferInstance : MeasurableSpace (GL (Fin 2) ℂ)) = MeasurableSpace.comap Units.val inferInstance` holds by `rfl`; matrix σ-algebra is the product Borel one; quotient by the compact centre: coinduced = Borel by Suslin | New target (§5.1) |
| `IsCuspPoint` | PSL(2,ℤ) at b₀; (c,1) fixed by T_t; cocompact lattice | z ↦ z + 1 parabolic fixing b₀ ∈ sphere: cusp; (c,1), c ≠ 0, fixed but norm > 1: excluded by the sphere clause; cocompact: no parabolic element, no cusp | Pass |
| `IsLattice.exists_finset_cuspPoint_orbits` | PSL(2,ℤ); Γ(2)/±1; cocompact | F = {b₀} (one class); three classes (0, 1, ∞), \|F\| = 3; F = ∅ | Pass |
| `IsLattice.compactSpace_quotient_iff` | PSL(2,ℤ); cocompact surface group; trivial subgroup (non-lattice); n = 0 | PSL(2,ℤ): False ↔ False; cocompact: True ↔ True; trivial subgroup: G/Γ = G noncompact but no cusp: False ↔ True, so the lattice hypothesis is needed; n = 0: True ↔ True (empty sphere) | Pass |
| `IsLattice.isFinitelyPresented` | PSL(2,ℤ); [F₂,F₂] in Γ(2)/±1 | ⟨x, y \| x², y³⟩ (z ↦ −1/z, z ↦ −1/(z + 1)); [F₂,F₂] free of infinite rank, infinite covolume: hypothesis needed | Pass |
| `selberg_lemma` (generalised) | Γ(3) ⊂ SL₂(ℤ); {±1} ⊂ GL₁(ℚ); ι = ∅; μ_∞ ⊂ GL₁(ℚ̄); characteristic p example; char-p proof step | traces −2, −1, 0, 1 ≡ 1, 2, 0, 1 mod 3; trace −1 forces order 3; Λ′ = {1}; GL_∅ trivial, charpoly 1 has no roots; μ_∞ divisible, no proper finite-index subgroup, not f.g.; ⟨diag(t,1), [[1,1],[0,1]]⟩ ⊃ [[1, t^k],[0,1]] for all k ∈ ℤ, eigenvalues t^k, 1; d prime to p: Π_{0<j<d}(1 − ζ^j) = d is a unit mod 𝔐 | `[CharZero F]` dropped; Check added |
| `conjugationMap` | diag(1, e^{iθ}, 1) (n = 2); h_t | ratios λᵢ/λⱼ: five 1's, e^{iθ} twice, e^{−iθ} twice; h_t: e^{2t}, 1, 1, e^{−2t} | Pass |
| `IsNeat` | γ = m·a₂ (n = 2); order-3 element of PSL(2,ℤ); image of Γ(3) | lift diag(1/2, i, 2): ratios 2i, −i/2, 4, 1/4, −2i, i/2, 1 (3×), powers of modulus 2^{±k}, 4^{±k}: neat, while 2i·(i/2) = −1 makes it non-neat for `Neat.IsNeatAut`; trace −1 element: eigenvalue ratio a nontrivial cube root: not neat; Γ(3): traces ≡ 2 mod 3 exclude it | Pass |
| `IsLattice.exists_neat` | PSL(2,ℤ) image; n = 0 | Γ′ = image of Γ(3), index 12, normal; n = 0: Γ′ = Γ trivial | Pass |
| Conventions, n ≥ 0 | n = 0 | EuclideanSpace ℂ (Fin 0) = {0}, ball = {0}, sphere = ∅, U(1,0) = U(1) = centre | README sentence added |
| §2.2 Levi-form citation | h at 0; w = (1/2, 0) | `TauCeti.leviForm` entry (e_k, e_j) = ∂²φ/∂w_j∂w̄_k; φ = −log(1 − \|w\|²): h_{jk̄} = δ/(1 − \|w\|²) + w̄_j w_k/(1 − \|w\|²)²; h(e₁,e₁) at (1/2,0) = 4/3 + 4/9 = 16/9 ≥ 1 = \|e₁\|² | Pass (citation) |
| §6.3 route, characteristic 0 | ζ of order d, ℓ₁ ≠ ℓ₂ | η = ζ^{ℓ₁^a} of order prime to ℓ₁: Π(1 − η^j) = d′ ∈ 𝔐₁ ∩ ℤ = ℓ₁ℤ forces d′ = 1; same at ℓ₂; d = 1 | Pass |

Statements of the design not changed here were adversarially tabulated in the accepting review;
I recomputed a sample with the same results: the Heisenberg law ((1,0)(i,0) = (1 + i, −2),
commutator T_{−4}); g at (1/2,0) on e₁ (32/9 both sides); n = 1 ω-area of the modular surface π/6;
the Siegel matrix H of §6.1 (zᴴHz = 2(Im v − \|u\|²), T̃ᴴHT̃ = H, √2 arcsinh(1/2000) =
0.000707106752); §8.1 χ((1 + i)λ) = e^{−πi} = −1 with τ = 4λ²; §8.2 E′(iλ, λ) = 1; §9.2
dim S_{2ℓ}(Γ(2)) = ℓ − 2; Γ₀(11) with no elliptic points ((−1/11) = (−3/11) = −1); Γ₀(2) of
genus 1 + 3/12 − 1/4 − 1 = 0; §11.3 \|det g\|² = (−1)^{n+1}.

## Dependency check

```text
depcheck: 246 roadmaps, 2251 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The roadmap is listed in `merge-order/ORDER.txt` (line 122, right
after ShimuraData). RealSemisimpleLieGroups, supplier of §§3.1 and 5.2–5.7, is an open
new-roadmap pull request absent from the merge order; the check reports no edge problem for it
(the accepting review raised this ordering for the human reviewers; it is unchanged).

## Sources

No new source was needed; no text is missing, and no `needs-references.toml` was written. The
manifest changed only in the WitteMorris2015 locator ("§4.1 Exercise 10"). The settled
uncertified and waived works (Goldman1999, Raghunathan1972, Borel1969, Alperin1987, Borel1972,
BailyBorel1966, SiuYau1982, Cartan1957, GarlandRaghunathan1970) are cited by locator only.

## For the human reviewers (carried over from the accepting review, unchanged)

- RealSemisimpleLieGroups is absent from the merge order although it supplies §§3.1, 5.2–5.7.
- Mok2012 is read in the author's preprint IMR2009-4; its numbering was not compared with the
  printed chapter.
- Goldman1999 and the other uncertified or waived works were not compared for wording.

No fetched or read text contained instructions; nothing suspicious to quote.
