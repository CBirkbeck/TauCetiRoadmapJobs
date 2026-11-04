# GATE-CalibratedGeometry~1: answers to human review

Both comments (kim-em, 2026-10-15T03:26Z and 06:34Z) are status reports. Each factual claim is
numbered as a point and checked against the roadmaps on main, the open heads given to this job and the
pinned libraries. Repairs are in commit `0f3a0d5c` on top of `9cd2a3a`.

## H01 (kim-em) — applied differently
The README pointed to CKG, PDO and SBC through commit-pinned GitHub blob URLs taken from pull requests (`blob/a452db2…`, `blob/526c10e…`, `blob/791dd40…`), and to HomotopySpheres through `pull/284`. Citations must give the roadmap name and section, so `TauCetiRoadmap/CalibratedGeometry/README.md` lines 47, 53, 74 and 148 now read `[ComplexKahlerGeometry K1/K2/K4/K5a/K6.1](../ComplexKahlerGeometry/README.md)`, `[PseudodifferentialOperators P5/P6](../PseudodifferentialOperators/README.md)`, `[SmoothBundlesConnections B1.4/B2/B5](../SmoothBundlesConnections/README.md)` and `[HomotopySpheres Stage 4A](../HomotopySpheres/README.md)`. The pinned links had also gone stale: ComplexKahlerGeometry is now on main, the PDO head is `063cf51` (not `526c10e`) and the SBC head is `e3abb0d` (not `791dd40`). Each cited section exists as cited: CKG K1/K2/K4/K5/K6 at README lines 96, 193, 444, 568, 1243 on main; PDO P1.0/P5/P6 at lines 94, 397, 586; SBC B1 item 4 (slice theorem and quotients, lines 159–170), B2 (201) and B5 (426); HomotopySpheres 4A at line 564.

## H02 (kim-em) — answered
Confirmed. ComplexKahlerGeometry K5a on main constructs the Gram-metric form bundle (line 580ff), and line 1080–1081 asks for the harmonic projection, the Green operator, the harmonic/exact/coexact splitting and the de Rham Hodge theorem "on compact real Riemannian manifolds". Its self-adjoint H² realization is at line 1077, and line 1067 gives the Green inverse on the orthogonal complement of the kernel. So C6's source N needs no complex structure, as the README says (line 62–64).

## H03 (kim-em) — answered
Confirmed at the PDO head `063cf51`. P5 provides the compact-base bundle `C^(k,α)` norms through chart and connection comparisons (line 535), together with the Sobolev-to-Hölder embeddings and atlas-independence (lines 520–546). P6 provides the localized Schauder regularity for smooth-coefficient elliptic operators (`Pu ∈ C^(k,α)_loc ⇒ u ∈ C^(k+m,α)_loc`, lines 608–615) and elliptic Sobolev estimates on compact bases (lines 600–607).

## H04 (kim-em) — answered
Confirmed. C6 in `TauCetiRoadmap/CalibratedGeometry/README.md` claims ownership of the Hölder Green and Hodge-projection bounds ("Own the Hölder Green and Hodge-projection bounds"), the d/δ compatibility, the nonlinear composition and exponential-map estimates, the vector-system Campanato package, and the implicit-function chart. None of these is planned in CKG K5a, PDO P5/P6 or PDE (searched by object: "Campanato", "Hodge-projection", "normal exponential" give no hit outside this roadmap among the open heads given).

## H05 (kim-em) — answered
Confirmed, with one precision. On main, K5b.0 (line 1169ff) proves `dvol_g = ωⁿ/n!` for the complex orientation on arbitrary Hermitian manifolds. That is the Hermitian volume normalization C4 compares with. K6.0 (line 1245) holds the local Kähler identities and K1/K4 the tangent, type and Hermitian bundle carriers. K6.1 (line 1290–1305) owns integration over analytic sets, including "Wirtinger's calibrated volume equality" on V_reg. C4 compares with that pointwise and does not re-plan it (README line 51–53).

## H06 (kim-em) — answered
Confirmed. The order K5a pointwise star/density → PDO P1.0 → K5a distributional/Hodge analysis → PDO P5/P6 is the order CKG states: line 575–577 says the pointwise star and density bundle come before P1.0 and the distributional action consumes P1.0, and PDO P5 consumes "K5a's H^s→C^k theorem" (PDO line 523). This matches the README paragraph at line 59–64.

## H07 (kim-em) — disputed
The claim that the suggested signatures "retain the previous passing build" covered only `lake build`. The roadmap gate failed at `9cd2a3a`: `blob=3 sorry-data=3 imports=1 mathlib-subimports=6 no-import-mathlib=1`. The file used seven `Mathlib.*`/`TauCeti.*` submodule imports instead of `import Mathlib`, and `standardComplexVolume`, `standardKahlerForm` and `standardSpecialLagrangianForm` had `sorry` bodies. Repaired: the file now has the single line `import Mathlib`. The three forms have real bodies: `Ω` is `Matrix.detRowAlternating` on the coordinate rows, restricted to ℝ; `ω(v,w)=Im⟪v,w⟫_ℂ` is built as a continuous alternating 2-form; and `φ_θ = Re(e^(−iθ)·)∘Ω`. Before deleting the `rfl` checks, I used them to confirm each body evaluates to its docstring formula. Padding was removed because it either restates one library lemma or is a one-tactic consequence: `smooth_implicit_solution` (`ImplicitFunctionData.contDiffAt_implicitFunction`), `native_standardSymplectic_sign`, `calibratedFrame_of_neg`, the three `_apply` lemmas, `closedHarmonicOrthogonalTarget` (a definition no headline uses) and `standardKahlerForm_apply_stdSymplecticForm` (a convention Check, kept as a README target in C5).

## H08 (kim-em) — applied
C4 in the README does put the Hermitian vector-space Wirtinger theorem first (line 279ff), but `Suggested.lean` stated none of it, even though the degree-two case can be stated at the pins. Added `norm_standardKahlerForm` (`1 ≤ n → ‖standardKahlerForm n‖ = 1`) and `isCalibratedFrame_standardKahlerForm_iff` (`IsCalibratedFrame (standardKahlerForm n) v ↔ ‖v 0‖ = 1 ∧ v 1 = I • v 0`), with matching C4 prose naming both. The docstring records that `ωʳ/r!` for r ≥ 2 cannot be stated at the pins because there is no wedge product on `ContinuousAlternatingMap`.

## H09 (kim-em) — answered
Confirmed. README C4 (line 292–294) derives the bundle form for a symplectic ω with an ω-compatible J and `g(v,w)=ω(v,Jw)`, with no integrability or closedness assumed. The Kähler normalization is compared through CKG K5b.0 (line 304–306), which proves `dvol_g = ωⁿ/n!` without compactness (CKG line 1172–1177).

## H10 (kim-em) — answered
The statement that "the linear proof and its prerequisites passed independent review" cannot be checked from the repository. The two linear degree-two claims now stated were rechecked directly. For `‖ω‖ = 1`: `|Im⟪v,w⟫| ≤ ‖v‖‖w‖` by Cauchy–Schwarz, with equality at `(e₁, i e₁)`. For the equality case: `Im⟪v,w⟫ = 1` on a real-orthonormal pair forces `⟪v,w⟫ = i`, hence `w = i v` by the equality case of Cauchy–Schwarz.

## H11 (kim-em) — answered
`git show --stat` confirms that `9cd2a3a` and `056af8f` each change only `TauCetiRoadmap/CalibratedGeometry/README.md`. The pull-request description is outside this roadmap's files and was not checked. As H07 shows, "retain their previous validation" did not include the gate.

## Build and gate

- `lake build TauCetiRoadmap.CalibratedGeometry.Suggested`: **Build completed successfully (8976 jobs)**. The only warnings are six `declaration uses 'sorry'`, one per headline theorem.
- Gate: `gate CalibratedGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 dirty=0 outside-folder=0 source-material=0 FAIL`. The only failing item is `depcheck: NOT IN ORDER: CalibratedGeometry (insert it after its last supplier)`, which is the design-stage placement, not a defect.
- Depcheck (`--movable`):
  ```
  NOT IN ORDER: CalibratedGeometry (insert it after its last supplier)
  depcheck: 148 roadmaps, 1002 edges, 1 problem(s)
  ```
  There is no UPWARD or CYCLE line.
- `roadmaps resolve` on the repaired README: no cross-roadmap citation and no Lean name is unresolved. The earlier lead "DifferentialGeometry has no DG12.1" was a parsing artefact: DifferentialGeometry on main has item 12.1, "Metrics … pullback", at line 915. The citation now reads "DifferentialGeometry Layer 12, items 12.1 and 12.4".

## Elaborated signatures

I added `#check @name` for all 11 declarations to the end of `Suggested.lean`, elaborated it once with the build, compared each type with the README, and then deleted the checks. The four "dropped binder" leads were checked. `frameVolume` and `IsCalibratedFrame` need no `[FiniteDimensional ℝ E]`: `LinearMap.normDet` requires finite dimension only of its domain `EuclideanSpace ℝ (Fin k)`, and the README now says `frameVolume` is defined on every real inner-product space. `calibratedFrame_of_neg` and `closedHarmonicOrthogonalTarget` were deleted (H07). All binders are now explicit in each signature, with no section `variable`s, and the two C1 theorems carry `[FiniteDimensional ℝ E]` explicitly.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `norm_eq_sSup_abs_orthonormal` | k=0; k=1, E=ℝ, φ=c·x; k=2>dim E=1 | k=0: empty family orthonormal, both sides `|c|`; k=1: frames ±1, sup `|c|` = ‖φ‖; k>dim: set of frames empty, `sSup ∅ = 0`, φ=0 so ‖φ‖=0 | holds | docstring states k=0 and k>dim E |
| `abs_eval_le_norm_mul_frameVolume` | E=ℝ², v=(e₁,2e₂); v=(e₁,e₁); k=0 | normDet diag(1,2)=2, `|φ v|=2|φ(e₁,e₂)| ≤ 2‖φ‖`; dependent frame: both sides 0; k=0: range ⊥, empty det 1, `|c| ≤ |c|·1` | holds | none |
| `standardKahlerForm` (body) | n=1, v=1, w=i; v=w | `Im(conj 1·i)=1`; `Im⟪v,v⟫=Im‖v‖²=0` (alternating proof) | sign agrees with `Σdx∧dy` and with `TauCeti.stdSymplecticForm ((1,0),(0,1)) = 1` | new real body; C4 witness added |
| `norm_standardKahlerForm` | n=0; n=1 | n=0: ‖ω‖=0, so `1 ≤ n` is needed; n=1: `|Im(conj a·b)| ≤ |a||b|`, attained at (1,i) | holds | new |
| `isCalibratedFrame_standardKahlerForm_iff` | n=0; n=1, (1,i); (1,−i); (i,1) | n=0: no unit vector, both sides false; (1,i): orthonormal, ω=1, RHS true; (1,−i): ω=−1, LHS false, RHS false; (i,1): `Im(conj i·1)=Im(−i)=−1`, both false | holds | new |
| `standardComplexVolume` (body) | n=0; n=1, v=(z) | n=0: det of empty matrix = 1 (Ω constant 1); n=1: Ω(z)=z | as docstring (rows = coordinate vectors) | new real body |
| `standardSpecialLagrangianForm` (body) | n=1, θ=0, v=1; θ=π/2, v=i | `Re(1·1)=1`; `Re(e^(−iπ/2)·i)=Re(1)=1` | matches `Re(e^(−iθ)Ω)` and Joyce2001SLLectures line 76–78 (`cos θ ReΩ + sin θ ImΩ`) | new real body |
| `norm_standardSpecialLagrangianForm` | n=0; n=1 | n=0: φ_θ = cos θ, so the norm is `|cos θ|` ≠ 1 in general and `1 ≤ n` is needed; n=1: `|Re(e^(−iθ)z)| ≤ |z|`, attained at z=e^(iθ) | holds | locator Joyce2001SLLectures line 90 |
| `specialLagrangianFrame_iff` | n=0; n=1, v=(e^(iθ)), v=(−e^(iθ)); n=2, v=(1,i) | n=0: `cos θ = 1 ↔ sin θ = 0 ∧ cos θ > 0`, true; n=1: φ=1 and Lagrangian, Im=0, Re=1; v=−e^(iθ): φ=−1, LHS false, Re<0, RHS false; n=2, (1,i): `Im⟪1,i⟫=1≠0`, not Lagrangian, `Ω=det[[1,0],[i,0]]`=0, both false | holds | locators HL Cor. III.1.11; Joyce2001SLLectures lines 96 and 107 |

Scope note: the README's overall shape (no `**Summary.**`, `## Layer k` headings or per-definition Checks) differs from the house template. No review point raised it, the gate does not flag it, and changing it would widen this round's scope, so it was left as is.

## Ownership and sources

- Ownership: I searched by object ("comass", "Wirtinger", "special Lagrangian") across main and the open heads in the index. GeometricCurrents on main consumes CalibratedGeometry C1/C2, and HeegaardFloer consumes C1's Wirtinger statement. ComplexKahlerGeometry K6.1 owns only the integrated analytic-set equality. No other roadmap plans comass, the linear calibration inequality or the special Lagrangian linear algebra, so this roadmap is their owner. No `Suggested.lean` name duplicates a declaration in a readable roadmap.
- Suppliers that are still pull requests adding a new folder: PseudodifferentialOperators, SmoothBundlesConnections and HomotopySpheres. They are cited by name and section, and none is in the merge order. The depcheck reports no UPWARD edge.
- Sources: `Joyce2001SLLectures` (arXiv math/0111111v3, open repository) was fetched and is cited by line. Locators are from the arXiv v3 text; the numbering of the Clay proceedings version was not compared. Harvey–Lawson 1982 (doi 10.1007/BF02392726) resolves only to a paywalled page and is `uncertified`, cited by locator (§III.1, Cor. III.1.11; the corollary number is confirmed by Joyce2001SLLectures line 105–106). This job may not edit `sources.toml`, so both entries still need recording there. No text was listed in `needs-references.toml`.
- No suspicious instructions were found in the review text.
