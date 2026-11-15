# Review of ComplexComparisonPartII (pull request #848 at a021e44)

**Verdict:** needs changes

## R01 (P2) — The ReductiveGroups deferral covers only smooth affine group schemes; every other scheme's topology and charts have two owners

**Location:** `TauCetiRoadmap/ComplexComparisonPartII/README.md:1066–1069`: "For a smooth affine group scheme `G` of finite type over `ℂ`, the classical topology on `G(ℂ)`, its smooth charts and its complex Lie group structure are ReductiveGroups §3A.5's". The contract at :785–788 has the same scope. :1061–1062 keep "the classical topological carrier" as C-1.1's own.

**Claim:** ReductiveGroups on main has been, since 2026-11-10, the single owner of three objects:
- the classical topology on `X(ℂ)` for every locally finite-type `X` (3A.5c);
- the charts of every smooth `X` (3A.5d);
- the complex Lie group `G(ℂ)` for every finite-type `G`, affine or not (3A.5e).

It names C-1.1 as the consumer of all three. The new boundary leaves every other `X` with two owners: C-1.1 also states, at :1054–1062, Hausdorffness for separated `X`, the comparison for proper maps, and charts for smooth `X`.

**Witness:** ReductiveGroups README (main), :1781: "single owner of complex points, their classical topology, the smooth charts of smooth `ℂ`-schemes"; :6231: "ComplexComparisonPartII (its C-1.1) consumes 3A.5c–3A.5e". Elliptic `E`: 3A.5e gives `E(ℂ)` (:1967); the new sentence excludes it.

**Repair:**
- **C-1.1.** Replace :1061–1069 ("Restricting its domain … analytic ring sheaf.") with: "For every complex scheme `X` locally of finite type, the classical topology on `X(ℂ)`, with its Hausdorff, fibre-product, reduction and properness comparisons, is ReductiveGroups §3A.5c's; for smooth `X` its complex charts are §3A.5d's, and for a group scheme `G` of finite type over `ℂ` the complex Lie group `G(ℂ)` is §3A.5e's. The identity on `X(ℂ)` identifies the underlying space of `X^an` with §3A.5c's space and the product charts above with §3A.5d's charts; this section adds the analytic ring sheaf. Coherent and topological consumers take the ring sheaf and topological carrier from this same analytic space, respectively; its locally finite-type domain includes infinite affine covers, and its analytic ring sheaf retains nilpotents on singular and nonseparated schemes."
- **:1054.** Obtain the Hausdorff and chart statements from §3A.5c–3A.5d through this identification, instead of proving them again.
- **Contract, :785–788.** Replace with: "- **ReductiveGroups §3A.5c–3A.5e.** The classical topology on `X(ℂ)` for every complex scheme `X` locally of finite type, with its Hausdorff, fibre-product, reduction and properness comparisons (3A.5c); the complex charts of every smooth complex scheme (3A.5d); the complex Lie group `G(ℂ)` for every group scheme `G` of finite type over `ℂ` (3A.5e). C-1.1 identifies them with the underlying space and charts of `X^an` by the identity on `X(ℂ)` and adds the analytic ring sheaf."

This text covers both `E` and the nodal cubic.

## R02 (P2) — C5.4 and ComplexKahlerGeometry K4.P on main both own the holomorphic Picard and exponential segment

**Location:** `README.md:149`: "C5.4 is the single owner, on every complex manifold, of the holomorphic-to-smooth forgetful adapter, the frame-torsor bijection from holomorphic line-bundle classes to `H¹(M,O_M^×)`, the holomorphic exponential sequence". The same claim appears at :93–96, :3998–4006 and :5297–5301.

**Claim:** ComplexKahlerGeometry §4.5 (K4.P) has been on main since 2026-11-10, after the review of `fcf31bc`. It owns the same bijection, the same exponential sequence and the identification `δ = c₁`, together with the curvature compatibility `c₁ = [iF/2π]`. It names C5.4, K3Surfaces 1.1 and GeometricQuantization §3.3 as its consumers. The open roadmap must cite the owner on main.

**Witness:** ComplexKahlerGeometry README (main), :1271–1275: "K4.P owns, on every complex manifold, the holomorphic exponential sequence, the isomorphism `Pic_hol(M)≃H¹(M,𝒪×)` and the identification of its connecting map with the integral first Chern class … supplies this segment … to ComplexComparisonPartII C5.4".

**Repair:**
- **C5.4, :3998–4006.** Replace "Prove the holomorphic exponential-sequence description here …" through the bijection and exactness sentences with: "ComplexKahlerGeometry §4.5 (K4.P) supplies the bijection `Pic_hol(M) ≃ H¹(M, O_M^×)` with its tensor, dual, trivial-line and pullback laws, the exact sequence `0 → ℤ → O_M → O_M^× → 1` with `u ↦ exp(2πiu)`, the identification of its connecting map with the integral first Chern class of the underlying smooth line, and `c₁ = [iF/2π]` for the Chern connection; its frame convention (`g_ij` carries `j`- to `i`-coordinates) and its normalisation (`O(1)` has Chern number 1) are this section's. Prove that its class equals `integralLineBundleChernClass L` through CharacteristicClasses C1.5's comparison with SmoothBundlesConnections B6."
- **C5.4 *Needs:*.** Add K4.P.
- **:149.** Make K4.P the owner in this row, and keep for C5.4 only what K4.P does not state.
- **:93–96.** Restate the scope the same way.
- **:5297–5301.** Delete this consumer bullet: main names K3Surfaces 1.1 and GeometricQuantization §3.3 as K4.P's consumers.

On `P¹` the citation changes no sign: the two conventions give `O(1) ↦ +1`, and the two cocycles point the same way.

## R03 (P3) — C-1.1's *Needs:* line, Layer C-1's dependencies and *Scope and ownership* omit ReductiveGroups

**Location:** `README.md:1081`: "*Needs:* ComplexKahlerGeometry K3–K4; Mathlib `AlgebraicGeometry.LocallyRingedSpace`, …". The same omission is in the Layer C-1 *Dependencies* at :1222–1229.

**Claim:** C-1.1's new identification is stated on ReductiveGroups §3A.5's carriers. Yet neither its *Needs:* line, nor the layer's *Dependencies*, nor *Scope and ownership* names that supplier. *Scope and ownership* is where a "stated by roadmap X" deferral belongs.

**Witness:** `grep -n ReductiveGroups README.md` at a021e44 returns :785 and :1067 only, with no hit in :57–398, :1081 or :1222–1229.

**Repair:**
- **:1081 and :1222.** Append "ReductiveGroups §3A.5c–3A.5e (classical topology, smooth charts, `G(ℂ)`)" to both lists.
- ***Scope and ownership*.** Add: "The classical topology on complex points, the smooth charts of smooth complex schemes and the complex Lie group `G(ℂ)` are ReductiveGroups §3A.5c–3A.5e's; C-1.1 identifies them with `X^an` and adds the analytic ring sheaf."

## R04 (P3) — The description's supplier sentences name roadmaps the README does not cite and omit the one this head adds

**Location:** The description says "External suppliers on main: GlobalHolomorphicFunctions (GH0.3), ComplexKahlerGeometry (K2–K6), …". It also says "Roadmaps already on main that the README cites (SchemeAndStackFoundations, PadicMeasuresIwasawaAlgebras, AdicSpacesPartII, RigidAnalyticGeometry and the older roadmaps)".

**Claim:** At this head the README never cites GlobalHolomorphicFunctions, PadicMeasuresIwasawaAlgebras or RigidAnalyticGeometry. It names AdicSpacesPartII only as excluded scope. The description leaves unstated the supplier this head adds, ReductiveGroups §3A.5.

**Witness:** `grep -c` on the README at a021e44 gives GlobalHolomorphicFunctions 0, PadicMeasuresIwasawaAlgebras 0, RigidAnalyticGeometry 0, AdicSpacesPartII 1 (:381, "rigid and dagger de Rham cohomology (AdicSpacesPartII)") and ReductiveGroups 2 (:785, :1067).

**Repair:**
- **First sentence.** Replace with: "External suppliers on main: ComplexKahlerGeometry (K2–K6), RealAnalyticGeometry (R3.1 weighted ∂̄/Stein/Cartan package and R3.2 item 0 native coherence, consumed by C0/C1), ReductiveGroups (§3A.5c–3A.5e, consumed by C-1.1), ComplexManifolds, SmoothBundlesConnections, CharacteristicClasses and GeometricCurrents; nothing in those roadmaps consumes this one."
- **Second sentence.** Change the list in its parenthesis to "(SchemeAndStackFoundations, EtaleCohomologyFoundations, ResolutionOfSingularitiesCharacteristicZero and the older roadmaps)".

## R05 (P3) — The description's ownership paragraph is contradicted by main

**Location:** The description says "ComplexKahlerGeometry on main states none of them. ComplexKahlerGeometry #1234 cites C5.4 for them instead of claiming K4.P as their owner".

**Claim:** #1234 merged with K4.P as the owner of these objects, supplying them to C5.4. Main now states all three.

**Witness:** Main commit `4a70443d` (2026-11-10, "ComplexKahlerGeometry: normal frames, Picard and projective examples (#1234)") added ComplexKahlerGeometry README :1271: "K4.P owns, on every complex manifold, the holomorphic exponential sequence, the isomorphism `Pic_hol(M)≃H¹(M,𝒪×)`…".

**Repair:** With R02 applied, replace the paragraph with: "**Ownership.** ComplexKahlerGeometry §4.5 (K4.P), on main, owns on every complex manifold the bijection `Pic_hol(M) ≃ H¹(M, O^×)` with its tensor, dual and pullback laws, the holomorphic exponential sequence and the identification of its connecting map with the integral first Chern class; C5.4 consumes them and owns the comparison of that class with `integralLineBundleChernClass` and the integration over analytic cycles."

## Previous findings

- none: the review of `fcf31bc` reported no finding.

## Verified sound

### Adversarial table

These rows cover the changed statements and every statement a finding touches.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| C-1.1 :1066–1069 and contract :785–788 (ReductiveGroups §3A.5 identified with `G^an`) | `G_m`; `GL₂`; `μ₃`; `E` | **`G_m`:** 3A.5c's evaluation topology is `{xy=1} ⊂ ℂ²`, the same as C-1.1's `V(xy−1)`; chart `t` on both. **`GL₂`:** `{e(ad−bc)=1} ⊂ ℂ⁵ ≅ {ad−bc≠0} ⊂ ℂ⁴` on both. **`μ₃`:** 3 discrete points, dimension 0. **`E`:** 3A.5e gives `ℂ/Λ`; the sentence excludes it | Holds where stated; narrower than the owner (R01) |
| C-1.1 :1054–1062 (classical carrier, Hausdorff, charts) against ReductiveGroups 3A.5c–3A.5d | nodal cubic; doubled origin; `⊔_ℕ A¹`; `P¹` | **Nodal cubic:** `{y²=x²(x+1)} ⊂ ℂ²` on both. **Doubled origin:** two inseparable origins on both. **`⊔_ℕ A¹`:** `⊔_ℕ ℂ` on both. **`P¹`:** `w=1/z`; at `z=2`, `dw/dz=−1/4` on both | Same statements on one identified carrier, with two owners (R01) |
| C5.4 :3998–4006 (bijection to `H¹(M,O^×)`, exponential sequence, `δ = c₁`) against K4.P | `P¹`; `ℂ`; `E`; cocycle direction | **`P¹`:** `H¹(O)=H²(O)=0`, so `H¹(O^×) ≅ H²(ℤ) = ℤ`, and `O(1) ↦ +1` on both (`c₁(O(−1))=−1` here; Chern number 1 in K4.P). **`ℂ`:** `H¹(O^×)=0` on both. **`E`:** `Pic⁰ = ℂ/ℤ²` on both. **Cocycles:** β→α here, j→i in K4.P | Identical, with two owners (R02); the citation changes no sign |
| C-1.1 *Needs:* :1081, *Dependencies* :1222–1229, *Scope* :57–398 | grep | ReductiveGroups hits: :785 and :1067; 0 in the three blocks | Omitted (R03) |
| Description supplier sentences | grep at a021e44 | GlobalHolomorphicFunctions 0; PadicMeasuresIwasawaAlgebras 0; RigidAnalyticGeometry 0; AdicSpacesPartII 1 (excluded); ReductiveGroups added, unnamed | Contradicted (R04) |
| Description ownership paragraph | main ComplexKahlerGeometry :1262–1330 | States all three objects and names C5.4 as their consumer | Contradicted (R05) |

The rows for untouched statements stand as in the previous review, of `fcf31bc`.

### Checks and counts

- **Diff.** The net change is `c7c7c50b`'s 9 lines. `db79c469` and `a021e44d` cancel each other: `git diff c7c7c50b a021e44d` is empty. Nothing changes outside the folder, and the worktree is clean.
- **Gate.** My own run on a021e44 exits 0, with every check at 0 and the result `OK`. The worker's `gate.md` agrees, including `build=0`.
- **Dependency check** (`--movable`). Full output: `depcheck: 245 roadmaps, 2217 edges, 0 problem(s)`. It has no UPWARD, CYCLE or `moved:` line. The new ReductiveGroups edge points to main, and ReductiveGroups (main, and the open revision at its head) names this roadmap only as a consumer.
- **Elaboration.** `lake env lean Suggested.lean` exits 0 in 8.4 s. Its only warnings are four `declaration uses sorry`, at :119, :130, :157 and :175.
  - The file is byte-identical to `fcf31bc`, and the types in `scratch/signatures.md` are unchanged.
  - The previous `#check @` record and the one-tactic probes stand.
- **Citations resolved.** 7 resolved:
  - ReductiveGroups §3A.5–3A.5e on main (:1781–2010) and at its open revision (:824 ff., same scope);
  - ComplexKahlerGeometry §4.5 (K4.P) on main (:1262–1330) and at the open revision (:1284);
  - K3Surfaces (:99, :475) and GeometricQuantization (:26, :727) at their heads, which cite C5.4;
  - EtaleCohomologyFoundations on main (:11).
- **Seeded sample.** None of the 15 targets falls in the changed passages, and their verification at `fcf31bc` stands. The changed passages carry no source locator.
- **Overlap check:** I read ComplexKahlerGeometry (main and both open revisions), EtaleCohomologyFoundations (main), RealAnalyticGeometry (main, a supplier only) and ReductiveGroups (main and its open revision). Two objects are shared:
  - the holomorphic Picard/exponential segment, owned by ComplexKahlerGeometry K4.P (R02);
  - the classical topology, smooth charts and `G(ℂ)`, owned by ReductiveGroups §3A.5 (R01).

  I did not re-read AlgebraicModuliForArithmeticGeometry, AbelianSchemesAndArithmeticModuli or EtaleCohomologyFoundations (open), since no changed passage touches them.
- **Source independence** (changed passages only): I compared 2 passages (:785–788 and :1066–1069) with `sga1` lines 9381–9400 and with ReductiveGroups §3A.5's wording; neither shares wording. The largest share of locators is `demailly-agbook`'s, about 39 of 122 by pattern count. I did not compare the contents again, because no layer was added, removed or reordered.
- **Remark** (untouched text): the *Downstream consumers* row "SchemeAndStackFoundations' finite/adic comparison boundary" (:5279) describes a boundary rather than a consumer.

## Not verifiable

These are carried from the previous report; the changed passages add no source citation.

- **Kato,** *Logarithmic structures of Fontaine–Illusie*: the sources service found no legal source.
- **Hironaka,** *Triangulations of algebraic sets*: the sources service found no legal source.
- **Bochnak–Coste–Roy,** Thm. 9.2.1: no open host is known.
- **Dimca,** *Sheaves in Topology*: the DOI resolves only to a paywalled page (uncertified).

## Source issues

- none

## For the human reviewers

- none
