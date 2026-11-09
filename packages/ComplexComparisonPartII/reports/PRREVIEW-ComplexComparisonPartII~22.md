# Review of ComplexComparisonPartII (pull request #848 at ab134e5)

**Verdict:** needs changes

This is an incremental re-review of the 8 lines added to `TauCetiRoadmap/ComplexComparisonPartII/README.md` since `03e34bc`. The additions are:

- the scope bullet *ModularCurves, §0B* at :298–300;
- the supplier contract **ModularCurves** at :813–817.

`Suggested.lean` is unchanged (`git diff --stat 03e34bc HEAD` lists only the README). No file outside the folder changed.

The 8 added lines are correct. R01 of the previous report is still not repaired and is carried below.

## R01 (P2) — The frame-torsor bijection, the holomorphic exponential sequence and the `c₁` identification still have two owners across the open heads

**Location:** `TauCetiRoadmap/ComplexComparisonPartII/README.md:146`: "C5.4 is the single owner, on every complex manifold, of … the frame-torsor bijection from holomorphic line-bundle classes to `H¹(M,O_M^×)`, the holomorphic exponential sequence with its cocycle `δu`, and the identification of its connecting map". The same claim is at :91 and :5065.

**Claim:** C5.4 is the only owner of these objects, and its consumers take them from C5.4.

**Witness:** ComplexKahlerGeometry #1234 has a new head (`682823db`), but README:731–735 still reads: "K4.P owns, on every complex manifold, the holomorphic exponential sequence, the isomorphism `Pic_hol(M)≃H¹(M,𝒪×)` … It supplies this segment … to ComplexComparisonPartII C5.4". The claim is repeated at :826–827.

The other pull requests are unchanged:

- **K3Surfaces #1285 (`920b5227`):** README:184–205 still requests the frame-torsor isomorphism from ComplexKahlerGeometry as `gap:integral-topology`. README:431–435 still says no part of that comparison is constructed there.
- **K3SurfacesAndSymplecticBoundedness #1375 (`c1d6da06`):** README:13 still calls `Pic_hol(M)≃H¹(M,O_Mˣ)` "K3Surfaces' contract with ComplexKahlerGeometry".
- **GeometricQuantization #1186 (`be6ed5f4`):** README:20 and :719 consume C5.4, which agrees with this roadmap.
- **The pull-request description:** still has no ownership paragraph.

ComplexKahlerGeometry on main states none of these objects, so :146 is true of main. Across the open heads, though, the objects have two owners, and #1234 hands the segment to C5.4.

No repair report marks this finding `not actionable in this package`, so it carries no `Re-raised:` line. The commit since `03e34bc` addresses only the ModularCurves remark.

**Repair:** unchanged in substance. Add the following paragraph to the merge-order block of the pull-request description. It edits no file in the folder; the line numbers are updated to the current heads.

> **Ownership.** ComplexComparisonPartII C5.4 is the single owner, on every complex manifold, of `Pic_hol(M) ≃ H¹(M,O_M^×)` with its tensor, dual and pullback laws, the holomorphic exponential sequence and the identification of its connecting map with the integral first Chern class. ComplexKahlerGeometry on main states none of them. ComplexKahlerGeometry #1234 drops K4.P's ownership claim (README :731–739, :826–827), which hands the segment to C5.4, and reads isomorphism classes of K4's line bundles directly. K3Surfaces #1285 replaces `gap:integral-topology` (README :184–205, :431–435) by a citation of C5.4. K3SurfacesAndSymplecticBoundedness #1375 re-points README :13 to C5.4.

Tested on the refuting lines: with this paragraph, each of #1234 :731, #1285 :184 and :434, and #1375 :13 is named together with the edit that makes it cite the one owner. #1186 already cites C5.4. If the repair job cannot edit the description, it should mark R01 `not actionable in this package` and give that reason. A later review would then treat it as settled.

## Previous findings

- R01 — not repaired: README :146 still reads "C5.4 is the single owner, on every complex manifold, of … the frame-torsor bijection". #1234 at `682823db` :731 still says "K4.P owns … It supplies this segment … to ComplexComparisonPartII C5.4". The description has no ownership paragraph. Carried as R01.

## Verified sound

### Gate, dependency check and Lean

- **Gate.** My run on `ab134e5` exited 0. The worker's run on the same head also records `build=0`.

  ```text
  gate ComplexComparisonPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```

- **Dependency check** (`--movable`), in full. It printed no UPWARD, CYCLE or `moved:` line. This roadmap is at `ORDER.txt:39`. ModularCurves, the newly listed supplier, is on main.

  ```text
  depcheck: 239 roadmaps, 2364 edges, 0 problem(s)
  ```

- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with exactly four `declaration uses sorry` warnings, at :116, :127, :154 and :172.
- **Signatures.** I elaborated `#check @` for all four declarations in one scratch file (exit 0). The types are identical to the worker's signature file and to r21. The binders are kept: `[FiniteDimensional ℂ E]` (`montelTheorem`), `[CompleteSpace F]` and the rest of the Fréchet structure (`schwartzFiniteness`), `IsManifold 𝓘(ℂ,E) ⊤ M` (`holomorphicPoincare`) and `LocallyContractibleSpace ↑T` (`nonempty_sheafSingularComparison`).
- **Headlines and padding.** The file is unchanged, so the account in r20 and r21 carries:
  - 4 of the 67 headline targets are stated;
  - the other 63 are named in the docstring with the carrier each lacks;
  - the one-tactic probes close none of the four.
- **Diff scope.** `git diff --stat origin/main...HEAD` outside the folder is empty. The 8 added lines contain no process word, pull-request number, LaTeX or copied passage. Every backticked name in them is a Tau Ceti declaration (`FiniteFlatCommGroupScheme`) or mathematics.

### The changed passages against their supplier and their consumer

- **ModularCurves §0B on main** (`TauCetiRoadmap/ModularCurves/README.md`). The heading is at :688. Lines :748–757 construct Cartier duality "as a contravariant anti-equivalence on `FiniteFlatCommGroupScheme S` over an arbitrary base by gluing the affine dualities along these base-change isomorphisms". They prove evaluation, biduality, preservation of rank and arbitrary base change. Lines :760–763 give `((ℤ/Nℤ)_S)ᴰ ≅ μ_N` over an arbitrary base. The README's :813–817 claims exactly these five items, and :298–300 claims a subset of them.
- **"Glued from the pinned affine dualities above".** On the Tau Ceti pin, `FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality` (`TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean:262–268`) is defined by transporting `FiniteLocallyFreeBicommutativeHopfAlgCat.cartierDuality`. That is the Hopf-algebra duality named in the README's Tau Ceti contract (:707–719). `cartierDualBaseChangeIso` is at `CartierDuality/BaseChange.lean:204`. So "the pinned affine dualities above" names the inputs §0B glues.
- **Consistency with C3.2d.5.** The scope bullet says C3.2d.5 "extends it to algebraic-space bases". The contract says the extension "by étale charts is part of C3.2d.5". C3.2d.5's route (:2465) says "apply this supplier on affine étale charts and glue by its base-change comparison and Layer 3 descent; this chart-gluing bridge is part of the present target". Its *Needs:* (:2467) lists ModularCurves §0B. The Tau Ceti contract (:718–719) says the same. All four places agree.
- **Placement.** :298 sits under **Built in other roadmaps and cited.** (:176), next to the other supplier sections. :813 sits under *From TauCetiRoadmap roadmaps* (:721). Together they settle r21's remark that ModularCurves had no bullet in either place.
- **No cycle.** ModularCurves on main mentions ComplexComparison only at :2308–2310, and there it takes no dependency on it. Its three analytic hypotheses stay explicit contracts.
- **Open heads of ModularCurves.** Two open pull requests change ModularCurves: #1187 (`66ed0d4`, a Tau Ceti bump) and #1808 (`a96d197`, draft). Both keep the heading "0B. Finite locally free group schemes and Cartier duality" (#1187 :281, #1808 :371). Both keep the contravariant anti-equivalence with evaluation, biduality, rank, arbitrary base change and `((ℤ/Nℤ)_S)ᴰ ≅ μ_N` (#1187 :328–336). Neither drops §0B, which agrees with `scratch/overlaps.md` ("None"). The citation holds at every head.
- **Ownership.** ModularCurves §0B is the only owner of global Cartier duality. Other roadmaps cite it the same way, for example AbelianSchemesAndArithmeticModuli #849 README :371 ("consumed from ModularCurves 0B") and FiniteFlatGroupsAndIntegralPadicHodgeTheory #879 README :817. This roadmap owns only the algebraic-space extension inside C3.2d.5, which no other roadmap states.
- **Citation-tool leads.** None of the 39 leads comes from a changed line. "Cross-roadmap citations found nowhere: None."

### Seeded sample

None of the 15 seeded targets falls in the 8 changed lines, and the changed lines cite no source. These targets were verified at their locators in earlier rounds, and that verification carries:

- r20/r21: the Riemann surface of a smooth curve (`sga1` Prop. XII.3.1), `riemannExistence` (`sga1` XII Thm. 5.1), the `IsIso` unit map and `relativeArtinComparison` (`sga4` XVI Thm. 4.1), and `artinComparisonCompactSupport` (`sga4` XVII Cor. 5.3.5);
- r20: `IsDifferentialOperator`, `holomorphicConnectionDictionary`, `realComplexCurrentComparison`, `analyticSetLocalFiniteMass`, `complexAlgebraicTopology`, `topologicalCoefficientComparison`, `artinComparison` and `artinSmoothTrace`;
- r17/r20: the cotangent and logarithmic differentials;
- r3–r9: `adicArtinComparison`.

### Adversarial table

New rows, computed this round for each changed statement:

| # | Statement (changed) | Instances | Values computed (left / right) | Result |
| --- | --- | --- | --- | --- |
| N16 | :813–817, `((ℤ/n)_S)ᴰ ≅ μ_n` | `S = Spec R`, `n = 1, 2, 3`; `R = 𝔽₂`, `n = 2` | `(ℤ/n)_R` has Hopf algebra `Map(ℤ/n, R) = Rⁿ`; its linear dual is `R[ℤ/n] = R[t]/(tⁿ − 1)`, the coordinate ring of `μ_n`. `n = 1`: both sides `Spec R`. `𝔽₂`, `n = 2`: `ℤ/2` is étale (reduced, 2 points) and `μ₂ = Spec 𝔽₂[t]/(t − 1)²` is infinitesimal (1 point, nonreduced). The ranks are 2 and 2 | Holds. The "self-dual identity" wrong model fails, because over `𝔽₂` `(ℤ/2)ᴰ` would then be étale, not `μ₂` |
| N17 | :813–817, contravariance and base change | `ℤ/2 → ℤ/4`, `x ↦ 2x`; `R → R′` | The dual is `μ₄ → μ₂`, `ζ ↦ ζ²`: it is contravariant, and the injection becomes a surjection with kernel `μ₂`. `(μ_{n,R})_{R′} = Spec R′[t]/(tⁿ − 1) = μ_{n,R′}`, which is the dual of `(ℤ/n)_{R′}`, matching `cartierDualBaseChangeIso` (`BaseChange.lean:204`) | Holds; the direction is pinned |
| N18 | :298–300 and :816–817, algebraic-space extension inside C3.2d.5 | `B` an algebraic space with étale atlas `U → B`, `U` affine; `M = (ℤ/n)_B`; `M = 0` | On `U` the dual is `μ_{n,U}`. On `U ×_B U` the two pullbacks agree by the base-change isomorphism, so the descent datum is the one of `μ_n`. Finite morphisms are affine, so étale descent of affine algebraic spaces is effective (C3.2d.5 *Needs:* Layer 3 descent), giving `μ_{n,B}`. `M = 0` gives `D(0) = 0`, which agrees with the C3.2d.5 Check | Consistent with C3.2d.5 :2465 and :2467 and with the Tau Ceti contract :718–719 |

Rows carried from `PRREVIEW-ComplexComparisonPartII~21.md` (statements untouched by this diff; the values are computed there):

| r21 row | Statement | Key values (r21) |
| --- | --- | --- |
| N1 | Tau Ceti analytic IFT contract | `f(z) = 2z + z²`: `f′(0) = 2`, inverse `−1 + √(1+w)`; `z²` is excluded (`f′(0) = 0`) |
| N2 | Tau Ceti `C^n` IFT contract | `x + x³`: `g′(0) = 1`; `n = 0` is excluded by `1 ≤ n` |
| N3 | Cartier contracts (:707–719) | `R^{ℤ/n}` dual to `R[t]/(tⁿ − 1)`; the reversed pullback does not typecheck |
| N4 | C3.2d.5 route and *Needs:* | `D((ℤ/n)_B) = μ_n`; `D(0) = 0`; 4 names resolve |
| N5–N8 | C-1 Examples | `Spec ℂ[ε]/(ε²)` has 1 point and 2 distinct endomorphisms; `exp ∉ ℂ[z]_(z)`; node `m/m²` of dimension 2; doubled origin non-Hausdorff; `(Δ*)²` |
| N9 | C1 Picard comparison example | `h⁰(O(1)) = 2`, `h⁰(O(−1)) = 0`; `Pic(E∖∞) ≅ E(ℂ)`; holomorphic `Pic = 0` on the noncompact surface |
| N10 | C-1 and C1 *Dependencies* | 7 and 5 *Needs:* lines; all items listed, none extra |
| N11–N13 | C6 Examples | `H¹(ℂ*, ℤ/n) = ℤ/n`; `H⁰_c(A¹) = 0`; trace `(a,b) ↦ a + b`; `𝔽₃` invariants 0; `Tor_i(ℤ/2, ℤ/2) = ℤ/2` over `ℤ/4` |
| N14 | Layer shape | 8 of 8 layers end with Examples and Dependencies |
| N15 | C5.4 ownership | carried as R01 above |

Rows carried from `PRREVIEW-ComplexComparisonPartII~20.md` through r21 (headlines and seeded targets):

| r20 row | Statement | Key values (r20) |
| --- | --- | --- |
| 1 | `montelTheorem` | On `ℓ²` with `⟨·,e_n⟩`: `‖f_n − f_m‖ = r` at `r e_n`, so no convergent subsequence; `FiniteDimensional` is needed |
| 2 | `schwartzFiniteness` | `ℓ²`, `h = −id`: codimension `∞`; `g = 0`: range dense, not closed |
| 3 | `holomorphicPoincare` | `ℂ²`, `dz₁∧dz₂`: `η = (z₁dz₂ − z₂dz₁)/2` of type `(1,0)` |
| 4 | `nonempty_sheafSingularComparison` | Warsaw circle: sheaf `H¹ = ℤ`, singular `H¹ = 0` |
| 5–19 | seeded targets | nodal cubic; `𝔽₂` principal parts; curvature `dz∧dw`; `P¹_{ℂ[ε]}` length 2; `d[Z] = (−1)^{k+1}[∂Z]`; mass `πR²`; `ℂ*` not a subcomplex; `⊔ G_m`; `e^{±2πi/n}` distinct for `n ≥ 3`; `H²_c(G_m) = Λ(−1)`; `1_ℤ` not étale-finite; trace on `A¹ ⊔ A¹` |
| 20 | C5.4 bijection and exponential sequence | `δ[O(1)] = +1`; for an Enriques surface `δ[K]` is nonzero 2-torsion |
| 23–29 | C1.3–C1.8, C3.2b, C3.2e–f, C5.6–C5.7, C4.1 | as tabulated in r20 |

### Remark on untouched text (no change requested in this round)

- The paragraph **Tau Ceti roadmaps this roadmap builds on** (:314–327) names neither ModularCurves nor several other suppliers in *From TauCetiRoadmap roadmaps*: CharacteristicClasses, SmoothBundlesConnections, AffineMorseLefschetz and UniversalCovers. It reads as a selection, not a complete list.

## Not verifiable

These are carried from r20 and r21. None of them is cited in the changed lines:

- **Kato**, *Logarithmic structures of Fontaine–Illusie* (C5.5): no legal copy.
- **Dimca**, *Sheaves in Topology* (part of `topologicalCoefficientComparison`): paywalled (Springer).
- **Hironaka**, *Triangulations of algebraic sets*, and **Bochnak–Coste–Roy**, Thm. 9.2.1 (part of `complexAlgebraicTopology`): no open host found.
- **Kleiman's published numbering "9.6.16"** (C3.2e): the AMS chapter is paywalled. The arXiv Theorem 6.16 was verified in r20.

## Source issues

- none
