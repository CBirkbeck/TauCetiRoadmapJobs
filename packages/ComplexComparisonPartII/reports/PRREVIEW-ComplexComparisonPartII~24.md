# Review of ComplexComparisonPartII (pull request #848 at c051258)

**Verdict:** needs changes

This is an incremental re-review of the 65 README lines changed since `d8d530a` (35 added, 30 removed). The changes are:

- the GeometricCurrents ownership row (:154), scope bullet (:259–265) and supplier contract (:767–774);
- the first paragraph of `realComplexCurrentComparison` (:3609–3618), its locator (:3654–3655), its *Needs:* line (:3656–3658) and its first Check (:3663–3664);
- the UniversalCovers scope bullet (:300–301), its contract (:924) and four *Needs:*/build mentions (:4635, :4678, :4692, :5033).

`Suggested.lean` is unchanged (`git diff d8d530a HEAD` on it is empty). No file outside the folder changed.

The commit repairs R02 and R03 of the previous review. R01 is not addressed and is carried below as the only finding.

## R01 (P2) — The frame-torsor bijection, the holomorphic exponential sequence and the `c₁` identification still have two owners across the open heads

**Location:** `TauCetiRoadmap/ComplexComparisonPartII/README.md:146`: "C5.4 is the single owner, on every complex manifold, of … the frame-torsor bijection from holomorphic line-bundle classes to `H¹(M,O_M^×)`, the holomorphic exponential sequence with its cocycle `δu`". The same claim is at :91 and :5102.

**Claim:** C5.4 is the only owner of these objects, and its consumers take them from C5.4.

**Witness:** ComplexKahlerGeometry #1234 is unchanged at `682823d`. Its README :731–735 still reads "K4.P owns, on every complex manifold, the holomorphic exponential sequence, the isomorphism `Pic_hol(M)≃H¹(M,𝒪×)` … It supplies this segment … to ComplexComparisonPartII C5.4". The claim is repeated at :826.

The other pull requests are also unchanged:

- **K3Surfaces #1285 (`920b522`):** README :184 still declares `gap:integral-topology` against ComplexKahlerGeometry, and :434 still says no part of that comparison is constructed there.
- **K3SurfacesAndSymplecticBoundedness #1375 (`c1d6da0`):** README :13 still calls `Pic_hol(M)≃H¹(M,O_Mˣ)` "K3Surfaces' contract with ComplexKahlerGeometry".
- **The pull-request description:** still has no ownership paragraph.

ComplexKahlerGeometry on main has no K4.P and no `Pic_hol` (grep of `TauCetiRoadmap/ComplexKahlerGeometry/README.md`), so this roadmap cannot cite K4.P: #1234 revises an existing roadmap and is not a supplier. The repair has to be stated from this side. No repair report marks R01 `not actionable in this package`.

**Repair:** unchanged from the previous review. Add the following paragraph to the merge-order block of the pull-request description. It edits no file in the folder.

> **Ownership.** ComplexComparisonPartII C5.4 is the single owner, on every complex manifold, of `Pic_hol(M) ≃ H¹(M,O_M^×)` with its tensor, dual and pullback laws, the holomorphic exponential sequence and the identification of its connecting map with the integral first Chern class. ComplexKahlerGeometry on main states none of them. ComplexKahlerGeometry #1234 drops K4.P's ownership claim (README :731–735, :826), which hands the segment to C5.4, and reads isomorphism classes of K4's line bundles directly. K3Surfaces #1285 replaces `gap:integral-topology` (README :184, :434) by a citation of C5.4. K3SurfacesAndSymplecticBoundedness #1375 re-points README :13 to C5.4.

**Tested** on the refuting lines: with this paragraph, each of #1234 :731 and :826, #1285 :184 and :434, and #1375 :13 is named together with the edit that makes it cite the one owner. If the repair job cannot edit the description, it should mark R01 `not actionable in this package` and give that reason.

## Previous findings

- R01 — not repaired: README :146 still reads "C5.4 is the single owner, on every complex manifold, of … the frame-torsor bijection". #1234 at `682823d` :731 still says K4.P "supplies this segment … to ComplexComparisonPartII C5.4". The description has no ownership paragraph.
- R02 — repaired: C5.4 :3611–3618 now reads "consume GeometricCurrents G1's identification … G1 also gives the equality of the LF topologies and the compact-convergence dual equivalence … none of them is restated here". :154, :259–262 and :767–774 agree.
- R03 — repaired: :300 reads "*UniversalCovers (completed roadmap), Stages 0–2.*" and :924 "**UniversalCovers** Stages 0–2 supply". All six mentions (:300, :924, :4635, :4678, :4692, :5033) now carry the stage range.

## Verified sound

### Gate, dependency check and Lean

- **Gate.** My run on `c051258` exited 0. The worker's `gate.md` records the same result, including `build=0`.

  ```text
  gate ComplexComparisonPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```

- **Dependency check** (`--movable`), in full. It printed no UPWARD, CYCLE or `moved:` line. This roadmap is at `ORDER.txt:39`. GeometricCurrents (`TauCetiRoadmap/GeometricCurrents`) and UniversalCovers (`Completed/UniversalCovers`) are both on main.

  ```text
  depcheck: 239 roadmaps, 2364 edges, 0 problem(s)
  ```

- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with exactly four `declaration uses sorry` warnings, at :116, :127, :154 and :172.
- **Signatures.** I elaborated `#check @` for all four declarations in one scratch copy (exit 0). The types match the worker's signature file character for character. No binder is lost:
  - `[FiniteDimensional ℂ E]` in `montelTheorem`;
  - `[CompleteSpace F]` and the rest of the Fréchet structure in `schwartzFiniteness`;
  - `IsManifold 𝓘(ℂ,E) ⊤ M` in `holomorphicPoincare`;
  - `LocallyContractibleSpace ↑T` in `nonempty_sheafSingularComparison`.

  Since the file is unchanged, the account of earlier reviews carries: 4 of the 67 headline targets are stated, the other 63 are named in the docstring with the carrier each lacks, and the one-tactic probes close none of the four.
- **Diff scope and hygiene.** The 65 changed lines contain no process word, pull-request number, LaTeX or copied passage. Outside the folder, `git diff --stat origin/main...HEAD` is empty.

### The repaired passages against their suppliers

- **GeometricCurrents G1 (R02's repair).** G1 on main states everything the new text attributes to it:
  - `TestForm k M := BundleTest(V_k* ⊗ D)` through `c_k`, with `V_k = A_k* ⊗ D` (:42, :139–141);
  - LF-topology equality, "independent of atlas, frame, auxiliary connection and partition of unity" (:147–151);
  - the "compact-convergence dual equivalence with real `BundleDistribution(V_k)`" (:161–162);
  - support, extension by zero, restriction and gluing (:143–146); `∂T(ω)=T(dω)` and `∂²=0` (:175–176); comass mass (:183–184);
  - orientation-freeness (:49).

  The README's `V_q = (Λ^q T* N)* ⊗ DensityBundle N` is G1's `V_k`. K5a on main defines `BundleDistribution(E) = BundleTest(E*⊗DensityBundle M) →L_c[𝕜] 𝕜` (ComplexKahlerGeometry README :641), so `BundleDistribution(V_q)` is the dual of the `q`-form tests, as the contract says. G1 :978–979 says "C5.4 later consumes the G1 specialization", which is now what C5.4 says. C5.4 keeps only what G1 does not state: `J_q`, the sign `(−1)^(2n−q+1)` and the mass comparison (G1 is real and uses no complex structure, :49). The ambient hypotheses at C5.4 :3609–3610 (finite-dimensional, Hausdorff, second countable, boundaryless) match G1's (:13–14). With the duplicate gone, "No supplier is re-planned" (:331) is true. `roadmaps list` shows no open pull request changing GeometricCurrents, and #1234 and #1398 (heads unchanged) do not state G1's specialization.
- **UniversalCovers Stages 0–2 (R03's repair).** `Completed/UniversalCovers/README.md` on main:
  - Stage 0 (:63–87): the universal cover, the `π₁` action and `Deck p`.
  - Stage 1 (:89–96): `Deck(proj) ≃* π₁`.
  - Stage 2 (:98–124): the lifting criterion; the cover of `H ≤ π₁` with conjugacy under basepoint change (item 7); the pointed/unpointed classification with deck group `N(H)/H` and the monodromy-functor lens for disconnected covers (item 8).

  STATUS.md on main marks all three done. It names `monodromyEquivalence` (covers ↔ functors from the fundamental groupoid) and the finite-cover fibre-functor/profinite-completion results under Stage 2. These cover exactly what :300–301 and :924–926 name and what C6.2 uses ("Unbased and disconnected statements use groupoids", :4685). Stage 3 (`π_n`) and Stage 4 (applications) are consumed nowhere. Its C6.2 Check `z ↦ zⁿ` needs only the deck group `μ_n`, not Stage 4's `π₁(S¹) ≅ ℤ`.
- **Citation and overlap tools.** `scratch/overlaps.md` lists no dropped id and no other pull request changing this roadmap. None of the 39 Lean-name leads of `scratch/citations.md` falls on a changed line. "Cross-roadmap citations found nowhere" is "None".

### Seeded sample

Two seeded targets fall in the changed passages; I re-verified both against the cached texts.

- **`realComplexCurrentComparison`.** Demailly, *Complex Analytic and Differential Geometry* (author's page, sources cache):
  - Chapter I: (2.1) is on p. 13, (2.3)–(2.5) on pp. 14–15, and (2.6) `⟨dT,u⟩ = (−1)^{q+1}⟨T,du⟩` and (2.7) `d[Z] = (−1)^{m−p+1}[∂Z]` on p. 15.
  - Chapter III: (1.14) is on p. 133, (1.15) on p. 134, (1.21) on p. 135, and (1.22) and (1.24) on p. 136, where (1.24) is the volume identity the README calls Wirtinger's formula (Demailly derives it from (1.25), Wirtinger's inequality).

  The locators are right. With `m = 2n`, `p = q`, (2.7) gives the README's `(−1)^(2n−q+1)`.
- **`riemannExistence`** (its *Needs:* and route lines changed). `sga1` line 9872: Exposé XII, Théorème 5.1, for a `ℂ`-scheme locally of finite type. Its printed page is 251 (table of contents, `sga1` line 451), as the README says.

The other seeded targets lie outside the changed lines. Their verification in r20, r21 and r23 carries (`sga1` XII 3.1; `sga4` XVI 4.1 and XVII 5.3.5; `adicArtinComparison`; `CurrentCalculus`; `complexAlgebraicTopology`).

### Adversarial table

New rows, computed this round for each changed statement:

| # | Statement (changed) | Instances | Values computed (left / right) | Result |
| --- | --- | --- | --- | --- |
| N25 | G1's test-form identification, consumed at :154, :259–265, :767–774, :3609–3618 and in the `ℝP²` Check :3663–3664 | `N = ℝP²`, `q = 0`; `N = ℝ²`, `q = 1`; a surface with `q = 3`; `x ↦ −x` on `ℝ` | `V_0 = ℝ*⊗D = D`, so `V_0*⊗D ≅ ℝ`: the tests are scalar `C_c^∞`, and the mass of `δ_a` is `sup_{‖f‖≤1}|f(a)| = 1`, with no orientation. On `ℝ²`, `rank V_1 = 2·1 = 2 = rank Λ¹ = C(2,1)`, the fibre of G1's Euclidean model. For `q = 3`, `Λ³ = 0`, so the tests and `Current 3 N` are `0`. Under `x ↦ −x`, `\|dx\| ↦ \|dx\|`, so `c_1` has no sign. An orientation-based `Λ^q ≅ (Λ^{m−q})*⊗Λ^m` would flip sign: it is the wrong model, and the density line excludes it | Holds. G1 is the only roadmap that states the identification |
| N26 | UniversalCovers Stages 0–2, at :300, :924, :4635, :4678, :4692, :5033 | `z ↦ zⁿ` on `ℂ*`; `ℂ* ⊔ ℂ* → ℂ*`; a non-normal degree-3 cover of `S¹∨S¹`; the Hawaiian earring | `H = nℤ`, deck `N(H)/H = ℤ/n`, fibre `n` (`n = 1`: trivial). The disjoint union is the `π₁`-set `{1,2}` with trivial action: 2 orbits, 2 components (Stage 2 monodromy). Non-normal `H`: `N(H)/H = 1` while the fibre has 3 points, so "deck = `π₁/H`" needs normality, as item 8 states. The Hawaiian earring is not semilocally simply connected and is excluded at :925, while `T_X` is locally contractible (C6.0) | Holds. Stages 3–4 are not needed |
| N27 | `riemannExistence` (seeded), *Needs:* :4692 | `X = ⊔_{n≥1} G_m`; `ℂ[ε]/(ε²)` | The degree-`n` cover on the `n`-th copy has `n`-point fibres and unbounded total degree, inside SGA 1 XII 5.1 (locally of finite type). The thickening has 1 point, and both sides give `FinSet` | Holds |

Rows carried from `PRREVIEW-ComplexComparisonPartII~23.md` for statements this diff leaves untouched (values computed there or in the review it cites):

| Row | Statement | Key values |
| --- | --- | --- |
| N19 (r23) | RealAlgebraicGeometry Layers 3, 6 | CAD of `ℝ` for `X² − 1`: 5 cells, signs `+,0,−,0,+`; the circle projects to `[−1,1]` |
| N21 (r23) | Hyperfunctions HF3a / C6.1 variant | `RΓ_c(ℝ,ℂ) = ℂ[−1]`; `H¹_c(ℝ,𝔽₃) = 𝔽₃`; the Hilbert cube lies in C6.1's domain only |
| N22 (r23) | DerivedDeRhamCohomology §§2.1–2.19 | `d(x²) = 2x dx`; `d(x^p) = 0` over `𝔽_p` |
| N23 (r23) | CrystallineCohomology CR.1.3, CR.5 | `d + x dy` has curvature `dx∧dy ≠ 0`; `ω¹_log(pt) = ℂ·dlog t` |
| N16–N18 (r22) | ModularCurves §0B, C3.2d.5 | `(ℤ/n)ᴰ ≅ μ_n`; `ℤ/2 → ℤ/4` dualizes to `μ₄ → μ₂`, `ζ ↦ ζ²` |
| N1–N13 (r21) | IFT, Cartier, C-1, C1, C6 examples | `2z + z²` has `f′(0) = 2`; `ℂ[ε]/(ε²)` has 2 endomorphisms; `H¹(ℂ*, ℤ/n) = ℤ/n`; `h⁰(O(−1)) = 0` |
| 1 (r20) | `montelTheorem` | on `ℓ²`, `‖f_n − f_m‖ = r` at `r e_n`, so `FiniteDimensional` is needed |
| 2 (r20) | `schwartzFiniteness` | `h = −id` on `ℓ²`: infinite codimension |
| 3 (r20) | `holomorphicPoincare` | `dz₁∧dz₂` has the primitive `(z₁dz₂ − z₂dz₁)/2` |
| 4 (r20) | `nonempty_sheafSingularComparison` | Warsaw circle: sheaf `H¹ = ℤ`, singular `H¹ = 0` |
| 11 (r20) | `realComplexCurrentComparison` signs | `dJ₂[D] = −J₁[∂D]`; `dJ₁[a,b] = J₀(δ_b − δ_a)`; the mass of `½δ_a` is `½`. These are rechecked this round against Demailly (2.7) with `m = 2`: `(−1)^{2−2+1} = −1` and `(−1)^{2−1+1} = +1` |
| 20 (r20) | C5.4 bijection | `δ[O(1)] = +1`; Enriques `δ[K]` is nonzero 2-torsion (ownership: R01) |
| 5–19, 23–29 (r20) | seeded and C1–C5 targets | as tabulated in r20 |

### Remarks (no change requested in this round)

- :924 says that UniversalCovers Stages 0–2 "supply the topological fundamental groupoid". The groupoid itself is Mathlib's `FundamentalGroupoid`: UniversalCovers lists it as consumed (`Completed/UniversalCovers/README.md:38–40`), and this README uses it directly at :610. What Stage 2 supplies is the classification over it. The wording comes before this diff, and the previous review passed it apart from the stage range.
- G1's standing hypotheses include a chosen Riemannian metric (GeometricCurrents :14). Its test forms, LF topology and dual equivalence do not use the metric. C5.4 supplies the underlying Riemannian metric of its Hermitian metric where mass enters (:3640).
- From r23, unchanged: Worked example 2 (:5049) calls an elliptic curve "the carrier of the Tau Ceti EllipticCurves roadmap". No target consumes that roadmap.

## Not verifiable

These are carried from r20–r23. No changed line cites a new source.

- **Kato**, *Logarithmic structures of Fontaine–Illusie* (C5.5): no legal copy.
- **Dimca**, *Sheaves in Topology* (part of `topologicalCoefficientComparison`): paywalled (Springer).
- **Hironaka**, *Triangulations of algebraic sets*, and **Bochnak–Coste–Roy**, Thm. 9.2.1 (part of `complexAlgebraicTopology`): no open host found.
- **Kleiman's published numbering "9.6.16"** (C3.2e): the AMS chapter is paywalled. The arXiv Theorem 6.16 was verified in r20.

## Source issues

- none
