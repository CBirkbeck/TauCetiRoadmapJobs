# Review of RiemannianGeometry (pull request #2222 at eac5c69)

**Verdict:** needs changes

## R01 (P2) — The closed-manifold principal eigenfunction still has three owners on main

**Location:** `TauCetiRoadmap/RiemannianGeometry/README.md` lines 50–52: "R5c owns … the scalar first-eigenfunction theory on closed connected manifolds". The description says: "This pull request touches neither roadmap, and no revision of them is open."

**Claim:** PositiveMass §3.0 and Yamabe Y1 item 2 are both on main and both consume this roadmap. Each still owns the simple lowest eigenvalue of `aΔ⁺+V`, with a smooth positive eigenfunction, on a closed connected manifold. After this merge the object has three owners. A follow-up promised for after the merge leaves all three in place.

**Witness:** PositiveMass README lines 32–40 ("owned here so that supply runs in one direction") and 668–674; Yamabe README lines 133–135; main at 7342e8f. Since `aΔ⁺+V=a(Δ⁺+V/a)`, the eigenfunction is the same and `λ₁=aμ₁`.

**Repair:** R5c stays the owner because it supplies both roadmaps. Open revisions of PositiveMass and Yamabe that merge after this pull request. In the description, replace the paragraph "Follow-ups in other roadmaps" with their names.
1. PositiveMass §3.0:
   - Replace "Prove that its lowest eigenvalue λ₁ is the infimum of the Rayleigh quotient, simple, with a smooth eigenfunction that can be chosen positive: a minimizer u gives the minimizer |u|, smooth by K5a's regularity, and positive by the strong maximum principle of PDE 3.2 (C13)." with "Its lowest eigenvalue λ₁=aμ₁(Δ⁺+V/a) is the infimum of the Rayleigh quotient, simple, with a smooth positive eigenfunction, by RiemannianGeometry R5c item 1."
   - Add "RiemannianGeometry R5c" to the *Needs:* line at line 678.
   - In lines 32–40, move "the positive first eigenfunction of a Schrödinger operator on a closed connected manifold" from what it owns to what it consumes from RiemannianGeometry R5c.
2. Yamabe Y1 item 2:
   - Replace "Obtain the variational first eigenvalue and prove positivity/simplicity of its first eigenfunction on connected M" with "Obtain the first eigenvalue and the simple positive first eigenfunction on connected M from RiemannianGeometry R5c item 1".
   - Add R5c to the RiemannianGeometry supplier row at line 43.

## R02 (P2) — Strict domain monotonicity is statable at the pin but is named as not statable

**Location:** `TauCetiRoadmap/RiemannianGeometry/Suggested.lean` lines 89–90: "and for R5c's strict domain monotonicity, which needs a smooth subdomain of a manifold, absent at the pin."

**Claim:** Item 3 can be stated on native carriers:
- a relatively compact smooth domain is `{ρ<0}` for a smooth ρ with regular value 0;
- each domain's μ₁ is fixed by a positive eigenfunction and by the Rayleigh quotient, as in the two Dirichlet headlines;
- the pin also makes `{ρ≤0}` a manifold with boundary `{ρ=0}`.

**Witness:** Tau Ceti has:
- `TauCeti.IsRegularValue` (`Geometry/Manifold/RegularValue.lean:92`);
- `TauCeti.isManifold_scalarRegularSublevel` and `TauCeti.boundary_scalarRegularSublevel` (`RegularValue/Scalar/Sublevel.lean:639`, `:652`).

A scratch copy with the theorem below elaborates with 28 `sorry` warnings and nothing else.

**Repair:**
1. In `Suggested.lean`:
   - after the last import, add `public import TauCeti.Geometry.Manifold.RegularValue`;
   - change the comment at line 500 to `/-! ## Layer 5: Schrödinger operators on closed manifolds and smooth domains -/`;
   - insert the following before `end Schrodinger`:

```lean
/-- R5c, item 3, strict domain monotonicity: let `D₁ = {ρ₁ < 0}` and `D₂ = {ρ₂ < 0}` be
connected relatively compact smooth domains, cut out by smooth functions with regular value `0`,
with `D̄₁ ⊆ D₂` and `D₁ ≠ D₂` (`ρ₂ = −1` gives `D₂ = M` closed). If `φ`, smooth up to `∂D₁`,
positive on `D₁` and zero on `∂D₁`, solves `−Δφ + qφ = μφ` on `D₁`, so that
`μ = μ₁(Δ⁺ + q, D₁)`, then a smooth `u` supported in `D₂` has `∫|∇u|² + ∫qu² < μ∫u²`, that is
`μ₁(Δ⁺ + q, D₂) < μ₁(Δ⁺ + q, D₁)`. For `(π/4, 3π/4) ⊂ (0, π)` and `q = 0`, `μ = 4` with
`φ = −cos 2x`, and a cut-off `sin` has quotient near `1`. -/
theorem exists_rayleigh_lt_of_pos_dirichletEigenfunction (q : M → ℝ)
    (hq : ContMDiff I 𝓘(ℝ) ∞ q) (ρ₁ ρ₂ : M → ℝ) (hρ₁ : ContMDiff I 𝓘(ℝ) ∞ ρ₁)
    (hρ₂ : ContMDiff I 𝓘(ℝ) ∞ ρ₂) (hreg₁ : TauCeti.IsRegularValue I 𝓘(ℝ) ρ₁ 0)
    (hreg₂ : TauCeti.IsRegularValue I 𝓘(ℝ) ρ₂ 0) (hcpt₁ : IsCompact {x | ρ₁ x ≤ 0})
    (hcpt₂ : IsCompact {x | ρ₂ x ≤ 0}) (hconn₁ : IsConnected {x | ρ₁ x < 0})
    (hconn₂ : IsConnected {x | ρ₂ x < 0}) (hsub : {x | ρ₁ x ≤ 0} ⊆ {x | ρ₂ x < 0})
    (hne : {x | ρ₁ x < 0} ≠ {x | ρ₂ x < 0}) (mu : ℝ) (φ : M → ℝ)
    (hφ : ContMDiffOn I 𝓘(ℝ) ∞ φ {x | ρ₁ x ≤ 0}) (hφpos : ∀ x, ρ₁ x < 0 → 0 < φ x)
    (hφbd : ∀ x, ρ₁ x = 0 → φ x = 0)
    (hφeq : ∀ x, ρ₁ x < 0 →
      -TauCeti.Manifold.laplaceBeltrami I φ x + q x * φ x = mu * φ x) :
    ∃ u : M → ℝ, ContMDiff I 𝓘(ℝ) ∞ u ∧ tsupport u ⊆ {x | ρ₂ x < 0} ∧
      ∫ x, ‖TauCeti.Manifold.mgradient I u x‖ ^ 2 + q x * u x ^ 2
          ∂TauCeti.riemannianVolume I M <
        mu * ∫ x, u x ^ 2 ∂TauCeti.riemannianVolume I M := by
  sorry
```

2. In the module docstring:
   - replace "the closed-manifold and Dirichlet principal eigenfunctions of `Δ⁺ + q` and the scalar Dirichlet problem" with "the closed-manifold and Dirichlet principal eigenfunctions of `Δ⁺ + q`, strict domain monotonicity of the lowest Dirichlet eigenvalue and the scalar Dirichlet problem";
   - replace "which need the `L²` space of sections of a vector bundle, absent at the pin, and for R5c's strict domain monotonicity, which needs a smooth subdomain of a manifold, absent at the pin." with "which need the `L²` space of sections of a vector bundle, absent at the pin."
3. In the README:
   - in R5c item 3, after "`μ₁(L,D₁)>μ₁(L,D₂)`.", add: "The headline `exists_rayleigh_lt_of_pos_dirichletEigenfunction` states it with Dᵢ={ρᵢ<0} for smooth ρᵢ with regular value 0 and {ρᵢ≤0} compact, D₂=M closed being ρ₂=−1. Every relatively compact smooth domain has such a ρ, glued by a partition of unity from −x_m in boundary charts and ±1 away from ∂D. μ₁(L,D₁) is given by a positive eigenfunction smooth up to ∂D₁ and vanishing there (item 1), and μ₁(L,D₂)<μ₁(L,D₁) is written as a smooth function supported in D₂ whose Rayleigh quotient is below μ₁(L,D₁).";
   - in the Tau Ceti paragraph for R5c (line 636), add "`TauCeti.IsRegularValue` in `TauCeti/Geometry/Manifold/RegularValue.lean`, every point of the level a point where the manifold derivative is surjective, for the defining functions of item 3".
4. In the description:
   - replace "; its docstring lists the four and names the bundle realizations and strict domain monotonicity as not statable at the pins" with ", and `exists_rayleigh_lt_of_pos_dirichletEigenfunction` (strict domain monotonicity) in the section `Schrodinger`; its docstring lists the five and names the bundle realizations as not statable at the pins".

## R03 (P3) — The metric extension in the collar sentence has no supplier

**Location:** `TauCetiRoadmap/RiemannianGeometry/README.md`:
- lines 3541–3543: "Every compact Riemannian manifold with boundary arises so: a collar (GeometricTopology Layer 1) extends the manifold, and the metric extends to a neighbourhood of D̄.";
- the *Needs:* line, lines 3599–3600.

**Claim:** Extending a metric that is smooth up to the boundary across that boundary is a Seeley extension. Neither the sentence nor the *Needs:* line names who supplies it. The GeometricTopology contract (lines 762–763) lists neither collars nor gluing.

**Witness:**
- ComplexKahlerGeometry K5a on main (README line 1796) extends smooth functions across a smooth boundary by a collar and the half-space Seeley extension.
- GeometricTopology §1.1 covers smooth collars (line 788) and §1.3 covers gluing (line 851).

**Repair:**
1. Replace "a collar (GeometricTopology Layer 1) extends the manifold, and the metric extends to a neighbourhood of D̄." with "a collar (GeometricTopology §1.1), glued along the boundary (§1.3), extends the manifold, and the metric extends across the boundary by ComplexKahlerGeometry K5a's Seeley extension, staying positive definite on a neighbourhood of D̄."
2. In the *Needs:* line, replace "GeometricTopology Layer 1 (a smooth collar, for the headline on a manifold with boundary)" with "GeometricTopology §1.1 and §1.3 and ComplexKahlerGeometry K5a's Seeley extension (for the headline on a manifold with boundary)".
3. In the GeometricTopology contract, after "the actual normal bundle and tubular neighbourhood theorem", insert ", the smooth collars of §1.1 and the gluing along the boundary of §1.3".

## Previous findings

- R01 — not repaired: the description says that PositiveMass §3.0 and Yamabe Y1 item 2 "can cite R5c item 1 instead" once R5c is on main, and that "no revision of them is open". Both still own the object at 7342e8f.
- R02 — repaired: `Suggested.lean` lines 546–606 state `exists_pos_dirichletEigenfunction_neg_laplaceBeltrami_add` and `existsUnique_dirichletProblem_neg_laplaceBeltrami_add`. README lines 3537–3543 and 3616–3621 name them, and the description lists them. The new docstring sentence is R02 of this report.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| previous R01, closed principal eigenfunction | PositiveMass 3.0, Yamabe Y1.2 at 7342e8f; a=2, V=2c on the unit circle | λ₁=2c=2μ₁(Δ⁺+c), eigenfunction 1 for all three owners | three owners | R01 |
| previous R02, Dirichlet headlines | `Suggested.lean` 546–606; README 3537–3543, 3616–3621; description | both stated as proposed; 27 `sorry` warnings | repaired | none |
| `exists_pos_dirichletEigenfunction_neg_laplaceBeltrami_add` | [0,π] with q≡c; u=x(π−x); sin 2x | μ=1+c, φ=sin; Rayleigh 10/π²≈1.0132≥1; sin 2x has eigenvalue 4≠1 | holds | none |
| same, hypotheses | [0,π]⊔[2π,3π], q=0; empty boundary | μ₁=μ₂=1, eigenspace dimension 2; closed case, still true | `ConnectedSpace` needed; `hbd` only marks the Dirichlet case | none |
| `existsUnique_dirichletProblem_neg_laplaceBeltrami_add` | [0,π]: q=0, f=Φ=1; q=−2, f=0, Φ=1; q=−1 | u(π/2)=1+π²/8≈2.2337; Q(sin)=−π/2, u(π/2)=1/cos(√2π/2)≈−1.6510; Q(sin)=0, no solution | holds; `hpos` needed | none |
| same, `hcomp` | [0,1]⊔S¹, q=1, f=0, Φ=1 | `hpos` holds (Q=∫u′²+u²); u=0 on S¹, so `∀ x, 0 < u x` fails | `hcomp` needed | none |
| both Dirichlet signatures | `#check @` in a scratch copy | all 11 section binders kept; `hbd`, `hcomp`, `hpos`, `Φ` as in README | match | none |
| README: μ₁>0 iff Q>0 on smooth u vanishing on ∂D | φ₁; [0,π] with q=−1 | Q(φ₁)=μ₁‖φ₁‖²; Q(sin)=0=μ₁, so both sides fail | holds | none |
| docstring: strict monotonicity not statable | R02's theorem; D₁=(π/4,3π/4)⊂D₂=(0,π), ρ₁′=±π/2, ρ₂′=±π at the zeros | elaborates; φ=−cos 2x, μ=4; cut-off sin has quotient →1<4 | statable, absent | R02 |
| R02's theorem, controls | D₂=D₁; M=S¹⊔S¹, D₁ one circle, D₂=M, q=0, φ=1 | quotient ≥4 on C_c^∞(D₁): no u; μ=0 and Q≥0: no u | `hne`, `hconn₂` needed | none |
| docstring: no `L²` sections of a bundle | grep of the Mathlib and Tau Ceti pins | none; `Riemannian/Sobolev.lean` is scalar | holds | none |
| collar sentence | upper unit hemisphere; a metric smooth up to t=0 in a collar | extends to round S²; in general the coefficients need Seeley's extension, owned by K5a, not cited | supplier missing | R03 |
| GeometricTopology Layer 1 citation | §1.1 line 788, §1.3 line 851; head of #1797 | collars and gluing present at both | holds; contract omits them | R03 |

Rows for statements the diff does not touch stand as in the previous review, of 9a35a85.

- **Gate:**
  - Re-run at eac5c69: every check is 0 and the result is `OK`; the worker's gate passed, build included.
  - Outside the folder, `git diff --stat origin/main...HEAD` is empty.
- **Dependency check:** `depcheck: 206 roadmaps, 1912 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration:**
  - `lake env lean` gives 27 `sorry` warnings and nothing else; the copy with R02's theorem gives 28.
  - The one-tactic probe (`first | rfl | (simp; done) | infer_instance | positivity | trivial | decide | aesop`) closes neither new theorem.
- **Library declarations opened at the pins (11):**
  - Tau Ceti `Riemannian/Laplacian.lean:55`, `:238`; `Gradient/Basic.lean:73`; `VolumeDensity/Volume.lean:82`;
  - `LeviCivita/Nondegenerate/Existence.lean:102`; `RegularValue.lean:92`;
  - `Sublevel.lean:473`, `:639`, `:652`, `:675`; `Boundary/HalfSpaceChart.lean:162`.
  - None of them needs `Boundaryless`, and the pins have no Dirichlet eigenfunction theorem.
- **Cross-roadmap citations resolved:**
  - GeometricTopology §1.1 and §1.3, on main and at #1797.
  - The Seeley extension of ComplexKahlerGeometry K5a: main line 1796 and #1807 line 1809. #1808 renumbers §5.4 to §5.5, so the citation uses the label K5a.
  - PositiveMass §3.0 and Yamabe Y1 item 2 at 7342e8f.
  - MinimalSurfaces (#2226) consumes R5c item 3 at lines 274, 1136, 1369 and 1386.
- **Seeded sample:**
  - §§1.1–1.3 and 2.1–2.3 are unchanged since 9a35a85; the diff starts at README line 3534. The previous review checked 16 of their locators.
  - The change adds or alters no source locator.
- **Overlap check:**
  - Read Surfaces (main), MinimalSurfaces (#2226), LorentzianGeometry (#2232), ManifoldOptimization (#1506), DGFloerPartII (#1799), RicciFlow, PositiveMass and Yamabe (main).
  - The closed principal eigenfunction is also owned by PositiveMass §3.0 and Yamabe Y1 (R01).
  - The Dirichlet eigenfunction, strict monotonicity and the Dirichlet problem are owned by R5c, and MinimalSurfaces consumes them. PositiveMass's weighted Dirichlet problems are on noncompact ends, a different object.
  - Nothing else is shared.
- **Remark on untouched text:** the citation tool's `AT4.6` lead and the GeneralizedCohomology G4 and G4.0b ids stand as resolved at 9a35a85.

## Not verifiable

- Gilbarg–Trudinger, Theorems 3.5, 8.12–8.14, 8.37 and 8.38: DOI 10.1007/978-3-642-61798-0 resolves only to a paywalled page, and the description says that 8.12 and 8.37 were cited from memory.
- Milnor, *Morse Theory*; O'Neill, Theorem 2 and Corollary 1; Lee, *Introduction to Riemannian Manifolds*: uncertified in the manifest and cited by locator only.

## Source issues

- none
