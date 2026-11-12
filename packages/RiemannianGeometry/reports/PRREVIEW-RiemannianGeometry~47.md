# Review of RiemannianGeometry (pull request #2222 at 7cdd446)

**Verdict:** needs changes

## R01 (P3) — K5a's Seeley extension and §1.3's gluing are missing from the contract and from Layer 5's Dependencies

**Location:** `TauCetiRoadmap/RiemannianGeometry/README.md`:
- lines 777–780, the K5a contract: "real/complex bundle Sobolev/Rellich, … real de Rham Hodge theorem and harmonic representatives.";
- line 3741: "ComplexKahlerGeometry K5a on closed manifolds";
- lines 3744–3745: "GeometricTopology Layer 1's tubular neighbourhoods and collars".

**Claim:** The repaired collar sentence (lines 3544–3548) and *Needs:* line (lines 3611–3613) consume two things these passages leave out:
- K5a's Seeley extension across a boundary, which the K5a contract does not list;
- GeometricTopology §1.3's gluing, which the Dependencies paragraph omits. That paragraph also limits K5a to closed manifolds.

**Witness:** Line 3612 says "ComplexKahlerGeometry K5a's Seeley extension", but line 3741 says "K5a on closed manifolds". The extension is stated in ComplexKahlerGeometry on main at lines 1795–1796, and README lines 777–780 do not list it.

**Repair:**
1. Lines 779–780: replace "real de Rham Hodge theorem and harmonic representatives." with "real de Rham Hodge theorem and harmonic representatives, and, for R5c, the extension of smooth functions across a smooth boundary by a collar and the half-space Seeley extension."
2. Line 3741: replace "ComplexKahlerGeometry K5a on closed manifolds" with "ComplexKahlerGeometry K5a on closed manifolds and its Seeley extension across a boundary".
3. Lines 3744–3745: replace "GeometricTopology Layer 1's tubular neighbourhoods and collars" with "GeometricTopology Layer 1's tubular neighbourhoods, collars (§1.1) and gluing along the boundary (§1.3)".

## R02 (P3) — The description's list of edits omits this head's supplier-contract edits

**Location:** The description, under **Edits.**: "in the supplier contracts, a Tau Ceti paragraph for R5c, the PDE bullet (C13 added, with R5c's uses of A3, A4, A6, C13 and E20) and a VariationalMethods 3.1, 4.1–4.4 bullet".

**Claim:** The list leaves out two edits to the supplier contracts:
- this head adds an R5c sentence to the GeometricTopology bullet (README line 776);
- R01's repair edits the ComplexKahlerGeometry bullet.

**Witness:** README line 776, "R5c uses the smooth collars of §1.1 and the gluing along the boundary of §1.3.", is new at 7cdd446, and the description does not mention it.

**Repair:** Replace the quoted phrase with "in the supplier contracts, a Tau Ceti paragraph for R5c, the PDE bullet (C13 added, with R5c's uses of A3, A4, A6, C13 and E20), a VariationalMethods 3.1, 4.1–4.4 bullet, and R5c's sentences in the GeometricTopology bullet (the collars of §1.1 and the gluing of §1.3) and in the ComplexKahlerGeometry bullet (K5a's Seeley extension)".

## Previous findings

- R01 — repaired: the description now says "#2247 (PositiveMass) and #2248 (Yamabe) make them cite R5c item 1 instead … both merge after this pull request". At those heads, PositiveMass §3.0 (lines 38, 672–683) and Yamabe Y1 item 2 (lines 44, 134–136) consume R5c item 1.
- R02 — repaired: `Suggested.lean` lines 543–565 state `exists_rayleigh_lt_of_pos_dirichletEigenfunction` exactly as proposed. The docstring (lines 45–47, 89–91), the section comment (line 501), README lines 3556–3563 and 636–638, and the description are all updated.
- R03 — repaired: README lines 3544–3548 now read "a collar (GeometricTopology §1.1), glued along the boundary (§1.3), extends the manifold, and the metric extends … by ComplexKahlerGeometry K5a's Seeley extension". The *Needs:* line and line 776 are updated. The passages this leaves stale are R01 above.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| previous R01, closed principal eigenfunction | #2247 §3.0, #2248 Y1.2; unit circle with a=2, V=2c | λ₁(2Δ⁺+2c)=2c=2μ₁(Δ⁺+c); eigenfunction 1; the only owner left is R5c | repaired | none |
| `exists_rayleigh_lt_of_pos_dirichletEigenfunction` | M=ℝ, ρ₁=(x−π/4)(x−3π/4), ρ₂=x(x−π), q=0 | ρ₁′(π/4)=−π/2, ρ₂′(0)=−π; φ=−cos 2x>0, μ=4; cut-off sin has quotient →1<4 | holds | none |
| same, D₂=M closed | M=S¹ of length 2π, ρ₂=−1, D₁ an arc of length π, q=0 | level of ρ₂ empty, so regular; μ=1, φ=sin; u=1 gives Q=0<1·2π | holds | none |
| same, controls | D₁=D₂; dim E=0; φ=sin 4(x−π/4) on (π/4,3π/4) | D₁=D₂: quotient ≥4 on C_c^∞(D₁), so no u; dim 0: connected sets are points, hsub forces D₁=D₂, vacuous; μ=16>1 still true | `hne` needed; `hφpos` pins μ=μ₁(D₁) | none |
| same, signature and padding | `#check @` in a scratch copy; one-tactic probe | 11 section binders kept, hypotheses as in the README; `first \| rfl \| simp \| … \| aesop` leaves the goal open | match; not padding | none |
| README: every smooth domain is {ρ<0} | D=(0,π), boundary charts x and π−x | ρ=−x near 0 and −(π−x) near π, −1 inside, +1 outside; dρ=Σψᵢ(−dx_m⁽ⁱ⁾)≠0 on ∂D | holds | none |
| Tau Ceti contract, `TauCeti.IsRegularValue` | `RegularValue.lean:92` at the pin | `∀ x, f x = y → IsRegularPoint`, where a regular point has surjective `mfderiv` (line 83) | matches | none |
| collar sentence | closed upper hemisphere of S²; GeometricTopology §1.1 (line 788) and §1.3 (line 851) | collar plus gluing give an open M′⊃D̄; g_ij(y,t) Seeley-extended to t<0 stays positive definite for \|t\|<δ (∂D compact) | holds | none |
| contract and Dependencies vs the new *Needs:* | README lines 777–780, 3612, 3741, 3744–3745 | *Needs:* has K5a's Seeley extension and §1.3; the contract and Dependencies have neither | stale | R01 |
| docstring: no `L²` sections of a bundle | grep of the pins for bundle `Lp` or `L2` section carriers | none; `Riemannian/Sobolev.lean` is scalar | holds | none |
| description vs head | Edits sentence vs README line 776 | GeometricTopology bullet edited, not listed | omits it | R02 |

Rows for statements the diff does not touch stand as in the previous review, of eac5c69.

- **Gate:**
  - Re-run at 7cdd446: every check is 0 and the result is `OK`. The worker's gate passed, build included.
  - `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Dependency check:** `depcheck: 206 roadmaps, 1912 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration:** `lake env lean` gives 28 `sorry` warnings and nothing else. In a scratch copy the one-tactic probe leaves the new theorem's goal open.
- **Library declarations opened at the pins (5):** Tau Ceti:
  - `Geometry/Manifold/RegularValue.lean:83` and `:92`;
  - `Analysis/PDE/Spectrum/Basic.lean:298` (Euclidean `firstDirichletEigenvalue`, no domain monotonicity);
  - `Riemannian/MaximumPrinciple.lean` (weak principle only).
  - No pinned declaration proves strict domain monotonicity.
- **Cross-roadmap citations resolved (6):**
  - GeometricTopology §1.1 and §1.3, at main lines 788 and 851 and at #1797 lines 1270 and 1368.
  - ComplexKahlerGeometry K5a's Seeley extension, at main line 1796, #1807 line 1809 and #1808 line 1773, all under a K5a heading.
  - PositiveMass at #2247 and Yamabe at #2248.
- **Seeded sample:** §§1.1–1.3 and 2.1–2.3 are unchanged since 9a35a85. The diff touches README lines 636–638, 776, 3544–3563 and 3611–3613, and adds or alters no source locator.
- **Overlap check:**
  - Read MinimalSurfaces (#2226, which consumes R5c item 3 at lines 274, 1136, 1369 and 1386), PDE D19 (main), PositiveMass (#2247), Yamabe (#2248), Surfaces (#2225), LorentzianGeometry (#2232), ManifoldOptimization (#1506), RicciFlow and HopfRinow (main).
  - Strict domain monotonicity on manifold domains has one owner, R5c. PDE D19 owns the non-strict Euclidean monotonicity for −Δ, which is a different object.
  - Once #2247 and #2248 merge, R5c is the only owner of the closed principal eigenfunction.
- **Remarks on untouched text:**
  - `hconn₁` is not needed for the theorem's truth.
  - The citation tool's AT4.6 lead and the GeneralizedCohomology G4 and G4.0b ids stand as resolved at 9a35a85.

## Not verifiable

- Gilbarg–Trudinger, Theorems 3.5, 8.12–8.14, 8.37 and 8.38: DOI 10.1007/978-3-642-61798-0 resolves only to a paywalled page, and the description says that 8.12 and 8.37 were cited from memory.
- Milnor, *Morse Theory*; O'Neill, Theorem 2 and Corollary 1; Lee, *Introduction to Riemannian Manifolds*: uncertified in the manifest and cited by locator only.

## Source issues

- none
