# Review of HomotopySpheres (pull request #1287 at a4f5c1e)

**Verdict:** needs changes

This is a full re-review of head `a4f5c1e29d7b3e45ed660f23c550afe44b130de9`: 746 lines of the folder changed since `8a5be10`. There are seven findings:

- **One P1.** The README cites declarations from the Tau Ceti and Mathlib that main pins. The branch's own `lake-manifest.json` pins older versions, and `Suggested.lean` imports a module that main's Tau Ceti no longer has.
- **One P2.** The previous review's double ownership of the James construction (its R02) was not repaired. It now also covers stable `O`/`SO` with real Bott periodicity, and Wall's forms and L-groups.
- **Five P3.** These cover the failing `dropped` gate check, suppliers that exist only in open revisions, two Milnor locators, one Check, and naming.

## Previous findings (review r7 at 8a5be10)

- **R01 (h-cobordism headline statable): repaired.** `Suggested.lean`:93–106 states `exists_diffeomorph_prod_Icc_of_hCobordism`, and README 1.7 (lines 646–657) restates it. The docstring no longer lists the theorem as not statable.
- **R02 (James construction has two owners): not repaired.** README:3140–3143 now says "GeneralAlgebraicKTheoryPartII §4.32 consumes 3B.1–3B.2 and 3B.4 … Its §4.33 and §7.7 consume … 3B.6". That roadmap's head still owns these objects itself, so the double ownership remains and has grown (R02 below).
- **R03 (DifferentialGeometry Layer 10 dropped by an open revision): repaired.** README:111–116, 694–696 and 1785–1788 now cite TangentialBordism B1.6 and B1.1's point sign σ, and AlgebraicTopology Stage 4 item 4's `basedSphereReferenceGenerator`. Both resolve: B1.6 at TangentialBordism README:67 (head `059ac6a`), σ at :590–605, and the generator at AlgebraicTopology `Suggested.lean`:2092 on main. The Tau Ceti Sard and degree declarations it adds exist only at main's pin (R01).
- **R04 (inverse h-cobordism of 2.3): repaired.** README:775–791 now follows Kervaire–Milnor Lemmas 2.4 and 2.3: the rotated punctured sphere V_Σ, then W_Σ obtained by removing a disc, with both inclusions proved to be homotopy equivalences. The Check at :832 refutes the one-handle reading.
- **R05 (compact generation only in open revisions): partly repaired.** The stale *Needs* sentence is fixed at README:981–984. AlgebraicTopology Stage 4 item 8 is still absent from main, and the description still names neither defining revision (R04 below).
- **R06 (group law for n = 1, 2): repaired.** README:738–750 cites Lemma 2.2 for n ≥ 3, closed and simply connected. README:752–767 adds the n = 1, 2 recognition target with a route through Milnor Theorems 8.1 (index 0) and 3.4.
- **R07 (false rank in a 3B.6 Check): repaired.** README:1151 now gives ranks 1, 3 and ∞ as required.

No repair report marks any finding as not actionable, so nothing below is a re-raise in that sense.

## R01 (P1) — The README and `Suggested.lean` are written against different Tau Ceti and Mathlib pins

**Location.**
- README:92–95: "Tau Ceti already has the oriented connected sum … `TauCeti.OrientedConnectedSum` … `TauCeti.ConnectedSum.orientation`".
- README:111–112: "Sard's theorem in equal dimensions is already in Tau Ceti (`TauCeti.dense_isRegularValue`)".
- README:331–388 (the From Tau Ceti contract).
- `Suggested.lean`:3: `import TauCeti.Geometry.Manifold.Orientation`.
- `Suggested.lean`:35–36: "The pins have that connected sum".

**Claim.** This branch's `lake-manifest.json` pins Tau Ceti `a91d3aa` and Mathlib `6b7abb3`. That is where `Suggested.lean` elaborates, and where every library citation must hold. The README's Tau Ceti and Mathlib locators were instead written against main's pins, Tau Ceti `2fd255d` and Mathlib `1b1ccf4`. All of them are correct there.

At the branch's own pin, the following do not exist:
- `TauCeti.OrientedConnectedSum` with its five theorems.
- `TauCeti.ConnectedSum` and `TauCeti.ConnectedSum.orientation`.
- `TauCeti.isNullSet_image_criticalPoints`, `TauCeti.dense_isRegularValue`, `TauCeti.degreeAtRegularValue` and `TauCeti.exists_bandHomeomorph`.
- `TauCeti.Manifold.Orientation` and `TauCeti.Manifold.Orientation.IsOrientationPreservingAt`.

These are consumed as supplied:
- by 2.2, for the group law;
- by 1.2's *Needs* and the Layer 1 *Needs*, for Sard;
- by the Conventions, for the orientation carrier.

Several line numbers are also off at the branch's pin:

| Citation | README | At the branch's pin |
| --- | --- | --- |
| `TauCeti.MappingCylinder` | :377, line 87 | line 81 |
| `TauCeti.MappingCylinder.homotopyEquiv` | :377, line 425 | line 399 |
| `SSet.toTop`, `sSetTopAdj` | :311, lines 66 and 74 | lines 65 and 73 |
| `TopologicalSpace.compactlyGenerated` | :321, line 68 | line 67 |
| `Bernoulli.padicValRat_bernoulli` | :324 and 9A.4, line 696 | line 689 |

Rebasing alone does not fix this. At main's Tau Ceti `2fd255d`, `TauCeti/Geometry/Manifold/Orientation.lean` no longer exists: the code is split into the directory `Orientation/`. So once this branch merges onto main's manifest, `Suggested.lean`:3 fails to import. The worker's signature run against main's pin failed on exactly that missing `Orientation.olean`.

**Witness.** At `a91d3aa`, `grep -rn OrientedConnectedSum TauCeti` returns nothing, and there is no `Geometry/Manifold/ConnectedSum/`, `Sard/` or `Degree/` directory. At `2fd255d`, `ls Geometry/Manifold` shows `Orientation/` only, with no `Orientation.lean`.

**Repair.**
1. Rebase onto main so that the manifest pins Tau Ceti `2fd255d` and Mathlib `1b1ccf4`; the README locators are then correct as written.
2. Replace `Suggested.lean`:3 with `import TauCeti.Geometry.Manifold.Orientation.OrientedAtlas`.
3. Re-elaborate.

Checked by reading only:
- At `2fd255d`, `Orientation/OrientedAtlas.lean`:283 defines `IsOrientedAtlas` with fields identical to `a91d3aa` `Orientation.lean`:332.
- `orientationPreservingGroupoid` is at :129 of the same file.
- `Boundary/Charts.lean` lines 195, 321 and 374 are unchanged.

The brief allows Lean only at this branch's pin, so this repair has not been elaborated.

## R02 (P2) — Three later open roadmaps own, at their heads, objects that this roadmap owns and claims they consume from it

**Location.** README:3140–3149, Downstream consumers:
- "GeneralAlgebraicKTheoryPartII §4.32 consumes 3B.1–3B.2 and 3B.4".
- "DGFloerPartII consumes 3A.2 … 3B.1 and 3B.3–3B.4 … 4A.1 and 4B.1–4B.8".
- "GeometryOfNumbersAndQuadraticArithmetic consumes 3A.3 … 7B.2–7B.4 … 7C.1–7C.3".

The table rows at README:3172, :3174 and :3177 repeat these claims. The duplicated objects are 3B.1–3B.6, 4A.1, 4B.1–4B.8, 7B.2–7B.4 and 7C.1–7C.3.

**Claim.** Each of the three heads owns the same objects itself:

- **GeneralAlgebraicKTheoryPartII** (#1742, head `8a4b822`). README:13 says the James reduced product, word filtration, James map, connected James equivalence, James–Hopf maps, stable James splitting and metastable EHP sequence "are owned here (§§4.30b–4.30c)". Its §4.32 *Needs* (:1327), §4.33 *Needs* (:1344) and §7.7 *Needs* (:1994) cite §4.30b–c, not 3B.
- **DGFloerPartII** (#1799, head `d1b2ba2`). README:20–24 builds "the convenient category of compactly generated spaces … and the stable orthogonal groups with real Bott periodicity" itself. Its :68–71 owns stable `O`/`SO`, Milnor's Clifford chain, real Bott periodicity and the stable groups of `O` and `SO` (its 4.2a–4.2c). Its :88 takes the James construction from GeneralAlgebraicKTheoryPartII §4.30b.
- **GeometryOfNumbersAndQuadraticArithmetic** (#851, head `102e668`). README:23 owns Wall's nonsingular quadratic forms and formations, the characteristic-two Arf invariant and the simply connected quadratic L-groups of ℤ. Its :43 says that the stable stems are not part of that roadmap.

So each of these objects has two owners, and the consumer sentences are false at the cited heads.

**Witness.** ORDER.txt places HomotopySpheres at line 72, DGFloerPartII at 73, GeometryOfNumbersAndQuadraticArithmetic at 74 and GeneralAlgebraicKTheoryPartII at 333. `roadmaps grep HomotopySpheres` finds no citation at the #1742, #1799 or #851 heads.

**Repair.** One owner, earlier in the merge order, with citations from the others. This roadmap is the earliest of the four. It keeps 3B, 4A.1–4B.8 and 7B–7C, and the description names #1742, #1799 and #851 as consumers that must replace §§4.30b–c, 1.0 with 4.2a–4.2c, and their Wall forms, formations and L-groups by citations of these sections.

Until those heads cite this roadmap, remove the three false sentences at README:3140–3149 and their table entries at :3172, :3174 and :3177.

Note that the project's dropped-names list contains `HomotopySpheres`, which forbids citing it (R03). If that entry is intentional, the only consistent settlement is the reverse: HomotopySpheres moves after those roadmaps in the merge order and cites them. That is a decision for a human.

## R03 (P3) — The push gate fails its `dropped` check on the roadmap's own namespace

**Location.** `Suggested.lean`:61 `namespace TauCetiRoadmap.HomotopySpheres` and :229 `end TauCetiRoadmap.HomotopySpheres`.

**Claim.** The gate reports `dropped=2 … FAIL` on these two lines. That is the worker's result at this head, and it also failed when I re-ran the gate. `HomotopySpheres` is the first entry of the project's dropped-names list, "names our roadmaps never cite as suppliers". The previous head passed with `dropped=0`, so the entry is new. The form rules require exactly this namespace, so the author cannot repair the failure by renaming.

**Witness.** The gate output reads: `dropped: line 61: namespace TauCetiRoadmap.HomotopySpheres`, `dropped: line 229: end TauCetiRoadmap.HomotopySpheres`.

**Repair.** This is an operator action, outside the folder: exempt a roadmap's own name from the `dropped` check, or remove `HomotopySpheres` from the list if this roadmap is to stay in the merge order. The decision is the same one as in R02's last paragraph. Until then there is no acceptance, because the gate fails.

## R04 (P3) — Two supplier items are defined only in open revisions that the description does not name

**Location.**
- README:145–156, 434–445 and 859–865, plus 12 *Needs* lines among its 29 citations: "AlgebraicTopology Stage 4 item 8, *Compact generation and the pointed adjunction*".
- README:95–96, 391–394, 727–732 and 847: "the associativity of the native sum proved in GeometricTopology §1.4".

**Claim.**
- **AlgebraicTopology.** On main, Stage 4 ends at item 7 (`simplicialRealizationCW`). Item 8 exists only at AlgebraicTopology #1663 (README:911) and #1652 (README:1301, "4.8"). This is the previous review's R05, not repaired.
- **GeometricTopology.** Main has no §1.4. At #1797 (head `11a9ca1`), §1.4 consumes `TauCeti.ConnectedSum` and `TauCeti.OrientedConnectedSum` and proves their associativity and the comparison with the gluing model, as cited here. At #903 (head `091ed17`), §1.4 (README:763–781) instead defines its own connected sum from the collared gluing model and never mentions the native sum.

The merge-order paragraph of the description names neither AlgebraicTopology revision and neither #1797 nor #903.

**Witness.** In main's AlgebraicTopology README, the line after Stage 4 item 7 (:817) starts Stage 5 (:849). The overlap file lists GeometricTopology §1.4 as defined only by #903 and #1797.

**Repair.**
- Name #1663 (or #1652) and #1797 in the merge-order paragraph as merging before this pull request.
- In README:96 and :727, say that §1.4 is the native-sum associativity of GeometricTopology as revised by #1797.

Checked: #1797 §1.4 states "Prove **associativity** `(M # N) # P ≃ M # (N # P)` for connected oriented summands" on the native sum.

## R05 (P3) — Two Milnor locators extend past the cited proofs

**Location.** README:630 (1.6): "(Milnor, Theorem 6.6, p.71, and its proof, pp.73–89)". Also README:617 (1.5): "(Lemmas 6.10–6.12, pp.78–79)".

**Claim.** The proof of Theorem 6.6, which ends with the proof of Lemma 6.7, runs from printed p.73 to p.84. Section 7 begins on p.85. The value 89 is the PDF page of p.84, not a printed page. Lemmas 6.10–6.12 are stated on printed p.79, and the proof of 6.10 ends on p.80.

**Witness.** `milnor_hcobordism` line 1804 prints p.70 on PDF page 75 (offset 5). Line 2185 ends Lemma 6.7's proof on PDF 89 (p.84), and line 2187 starts §7. Lines 2049 and 2077 (Lemma 6.10, end of its proof) are on PDF 84–85.

**Repair.** Change "pp.73–89" to "pp.73–84" at README:630, and "pp.78–79" to "pp.79–80" at README:617. Checked against the four cited lines.

## R06 (P3) — A Check for the product theorem blames the wrong hypothesis

**Location.** README:678: "Taking M₀ to be the whole boundary of W=D^(n+1) leaves M₁=∅, whose inclusion into W is not a homotopy equivalence; without that hypothesis the theorem would assert D^(n+1)≅Sⁿ×[0,1]".

**Claim.** In this example, h₀ fails as well. The inclusion of M₀ = Sⁿ into D^(n+1) induces ℤ → 0 on H_n, so dropping h₁ alone still excludes D^(n+1). The Check therefore does not show that h₁ is needed.

Given h₀ and simple connectivity of W, Milnor's remark after Theorem 9.1 gives H_*(W, M₁) = 0 by duality. So h₁ holds exactly when M₁ is simply connected, and it fails only through π₁(M₁).

**Witness.** For n = 5: H₅(S⁵) = ℤ → H₅(D⁶) = 0. `milnor_hcobordism` lines 2791–2794 give the duality H_*(W,V) = 0 ⇒ H_*(W,V′) = 0.

**Repair.** Say that both inclusions fail for D^(n+1): ℤ → 0 on H_n for M₀, and ∅ for M₁. Add that, given h₀, h₁ is equivalent to π₁(M₁) = 0 (Milnor, remark after Theorem 9.1, p.107), so it is tested by an end with the homology of Sⁿ and nontrivial fundamental group. Checked at n = 5 above.

## R07 (P3) — Naming and typography

**Location.**
- README:251: "The outward normal of `S² -> R³` is a example".
- README:3094 (10.3): "`e.deriv` sends the chosen `Manifold.Orientation` on `M` to the standard orientation".

**Claim.** "a example" is a typo. `e.deriv` is not a Mathlib name: `Diffeomorph` has no `deriv`. Everywhere else the README calls the carrier `TauCeti.Manifold.Orientation`, and calls the pointwise notion `TauCeti.Manifold.Orientation.IsOrientationPreservingAt` (README:101–104 and 337–340).

**Witness.** README:180 says "An orientation is Tau Ceti's `TauCeti.Manifold.Orientation I M ι`", and README:337 defines the pointwise preservation notion.

**Repair.**
- Write "an example" at :251.
- At :3094, write "that at every point the manifold derivative of `e` carries the chosen `TauCeti.Manifold.Orientation` of `M` to the standard orientation of `S⁶` (`TauCeti.Manifold.Orientation.IsOrientationPreservingAt`)".

## Verified sound

**Gate and build.** My run of the push gate at this head:

```text
gate HomotopySpheres: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=2 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL
```

The worker's gate also records build=0. `lake env lean TauCetiRoadmap/HomotopySpheres/Suggested.lean` at this branch's pin gave exactly 16 `declaration uses sorry` warnings and nothing else. The diff outside the folder is empty.

**Dependency direction.**

```text
depcheck: 244 roadmaps, 2464 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line.

**Signatures (19 declarations, checked with `#check @`).** The elaborated types are:
- `exists_diffeomorph_prod_Icc_of_hCobordism`: `5 ≤ n`, `T2Space`, `CompactSpace`, `ChartedSpace (EuclideanHalfSpace (n+1))`, `IsManifold (𝓡∂ (n+1)) ∞`, `SimplyConnectedSpace`, an open `M₀` of the boundary with `IsClosed`, and both homotopy-equivalence hypotheses fixing the underlying map to the inclusion. The conclusion is a diffeomorphism for `(𝓡 n).prod (𝓡∂ 1)` with `f (x, 0) = x`.
- `sphere_parallelizable_iff`: keeps `0 < n`.
- The Bott and stem statements: keep every range bound.
- Both recognition theorems: keep T2, second countability, compactness and `IsManifold (𝓡 6) ∞`.

No binder is lost. None of the three definitions depends on a section variable. Second countability is not needed for the h-cobordism theorem, since a compact manifold is second countable. Imports are `import Mathlib` plus two existing Tau Ceti modules at this branch's pin, with `theorem` only and no `set_option`.

**Padding probe.** In a scratch copy, every `sorry` was replaced by `first | rfl | simp | infer_instance | trivial | decide | exact Subsingleton.intro (fun _ _ => rfl)`. All 16 still failed: 4 with unsolved goals and 12 with type mismatches. No declaration restates a definition or mirrors a Check.

**Headline inventory** (Scope items 1–10 and the Summary):
- Stated:
  - the h-cobordism theorem (new and correct);
  - real Bott periodicity and its seven base entries;
  - the fourth to seventh stems;
  - sphere framing;
  - oriented and unoriented recognition in dimension six.
- Named in the docstring as not statable, with correct reasons at the pins:
  - Θₙ as a group and Θ₆ = 0;
  - stable stems as colimits, stable J and PT;
  - the James construction and EHP;
  - Hopf invariant one;
  - Aₙ, Pₙ, Lₙ and the Kervaire–Milnor sequence;
  - Θ₇, Eells–Kuiper and the E₈ boundaries.
- The single error in the docstring is the phrase "The pins have that connected sum" (R01).

**Library declarations opened** (file:line at both Tau Ceti pins unless noted):
- `IsOrientedAtlas`: a91d3aa `Orientation.lean`:332; 2fd255d `Orientation/OrientedAtlas.lean`:283.
- `boundaryChartedSpace`, `isManifold_boundary`, `isSmoothEmbedding_subtypeVal_boundary`: `Boundary/Charts.lean`:195/321/374 at both.
- `simplyConnectedSpace_sphere_euclideanSpace`: `AlgebraicTopology/Sphere/SimplyConnected.lean`:408 at both.
- `e8Plumbing`: `LowDimTopology/Plumbing/E8.lean`:63 at both.
- `e8Plumbing_isNegativeDefinite`: E8.lean:199 at both.
- `PlumbingGraph.intersectionMatrix`: `IntersectionForm.lean`:108 at both, defined as diagonal weights plus adjacency, so −E₈ as stated.
- At 2fd255d:
  - `OrientedConnectedSum`: `ConnectedSum/Oriented.lean`:143.
  - Its theorems, as described at README:345–363: :128, :155, :160, :208, :222, :238, :295.
  - `ConnectedSum.orientation`: `ConnectedSum/Orientation.lean`:250.
  - `isNullSet_image_criticalPoints` and `dense_isRegularValue`: `Sard/EqualDimension.lean`:105/112.
  - `degreeAtRegularValue`: `Degree/Basic.lean`:76.
  - `exists_bandHomeomorph`: `Morse/Deformation.lean`:259.
  - `MappingCylinder` and `MappingCylinder.homotopyEquiv`: :87/425.
- Mathlib `ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere`: `PoincareConjecture.lean`:41 at both Mathlib pins.
- Mathlib `padicValRat_bernoulli`: line 689 at 6b7abb3 and line 696 at 1b1ccf4. Its hypotheses are a prime p, 0 < k and p − 1 ∣ 2k, as stated at README:324–326.

**Cross-roadmap citations resolved.**
- On main:
  - AlgebraicTopology Stage 4 items 4 (Euler–Poincaré, `basedSphereReferenceGenerator`), 5, 6 and 7; `homologicalWhitehead` (`Suggested.lean`:1214); `compactManifoldFiniteCWType` (:1155).
  - DifferentialGeometry Layers 2, 3 and 5.1 (README:342–371 and 505–509).
  - GeometricTopology's smoothing-and-triangulation item 1 (README:938).
  - The consumers on main: PositiveScalarCurvature (§§1.2–1.6, Layer 2, §3C, Layers 6–8, §9A.1); GeneralizedCohomology (3A, 4B); BordismFormalGroups (3B, 3C); DGFloer (3A, 4A–4B); CharacteristicClasses (3A, 4A); MorseTheory (4B); GeometricCurrents (4A); Orbifolds, RiemannianGeometry and AlgebraicTopology (3A.1, mapped to Stage 4 item 8 at README:863 and 3162).
- At open heads:
  - TangentialBordism B1.1 σ, B1.6, B3.2 and B5.2 (#942 `059ac6a`).
  - FourManifolds (#936), which consumes 3C, 4B, 6B, 6C, 7A–7C and Layer 9 as claimed (README:184).
  - GeometricTopology §1.4 (#1797 and #903, R04).
  - AlgebraicTopology item 8 (#1663 and #1652, R04).
  - The three consumers of R02.
- The conflict with #284 (Paul-Lez) is a stated order: the description says this pull request carries #284's baseline.

**Sources read this round, at the sampled locators.** Both texts are certified entries of the package manifest; Milnor's are printed pages, PDF page minus 5.

| Target | Locator and finding |
| --- | --- |
| 1.1 | `milnor_hcobordism` line 2804 (Definition 9.2, p.107): both ends are deformation retracts. The cofibration remark justifies the homotopy-equivalence form. |
| 1.3 | Lines 2565–2569 (7.8, p.97: dim ≥ 6, no indices 0, 1, n−1, n); 2613–2626 (8.1, p.100: index 0 needs only H₀(W,V)=0; index 1 needs dim ≥ 5); 7.6 on p.92. |
| 1.4 | Lines 1841–1857 (6.6, p.71: r+s ≥ 5, s ≥ 3, π₁ injectivity for r ≤ 2); 1913–1938 (Lemma 6.7 and the isotopy on the standard model, pp.73–74). The README's "pp.71–76" covers the statement and the isotopy. |
| 1.6 | Lines 1868–1896 (proof of 6.4, pp.72–73: λ = 2 needs π₁(V − S_R) = 1, from the trajectory diffeomorphism with V₀ − S_L and codimension n−λ−1 ≥ 3). The proof of 6.6 ends at line 2185 (p.84): R05. |
| 1.7 | Lines 2784–2794 (9.1, p.107: W, V, V′ simply connected, H_*(W,V) = 0, dim ≥ 6; duality remark); 2807–2823 (remark after 9.2, pp.107–108: deformation retracts). The equivalence of hypotheses at README:654–657 holds. |
| 2.2 (new route) | Line 582 (3.4, p.21); 2613–2615 (8.1 index 0); 2875–2879 (twisted sphere, proof of Proposition B, p.110); `kervairemilnor1963` lines 78–107 (Lemma 2.2, pp.505–506, n ≥ 3); 142–144 (Θ₁ = Θ₂ = 0, p.507). |
| 2.3 | `kervairemilnor1963` lines 108–124 (Lemma 2.3, pp.506–507) and 125–136 (Lemma 2.4, p.507). The README's gluing formula restates the construction in its own words. |
| 2.4 | Lines 25–26 (Theorem 1.1, p.504); 70–72 (Lemma 2.1, p.505). The n ≥ 5 comparison is Milnor 9.2 (`milnor_hcobordism` lines 2825–2828, p.108). |
| 8.2 | `kervairemilnor1963` lines 257–266 (Lemma 4.2, p.510), 292–307 (Lemma 4.5, p.511), 316–319 (p.512: p(Sⁿ) = im Jₙ, quotient coker Jₙ). README 8.4 correctly says that 8.2's sequence for all almost-framed cycles is an additional target. |
| 9.2, 9.3 | `kervairemilnor1963` lines 316–327 (p.512 table). The OCR scrambles the column order, but the tokens ℤ₂ ×3, ℤ₂₄, 0, 0, ℤ₂₄₀ and ℤ₂+ℤ₂ match Πₙ for n = 1–8, so Π₄ = Π₅ = 0 and Π₆ = ℤ₂. |
| 10.2 | KM §2, pp.505–507 (above); Milnor 9.1, p.107 (above). |
| 2.1, 10.4, 5.0, 5.1 | See Not verifiable, and the Lean signatures above. |

**Adversarial table.** Each row gives the values computed on each side.

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| `exists_diffeomorph_prod_Icc_of_hCobordism` | W = S⁵×[0,1], M₀ = S⁵×0 | n = 5 ≥ 5; H₅: ℤ→ℤ identity at both ends; f = id, f(x,0) = x | True |
| same | W = D⁶, M₀ = ∂D⁶ | h₀: H₅ ℤ→0 fails; h₁: ∅→D⁶ fails | Excluded (both); R06 |
| same | M₀ = ∅ | h₀ forces a map W→∅, so W = ∅; `SimplyConnectedSpace` forces W ≠ ∅ | Vacuous case excluded |
| same | W = S⁵×I minus a ball, M₀ = S⁵×0 | H₅: ℤ → ℤ² | h₀ fails; excluded |
| same | n = 4 (dim 5) | 5 ≤ 4 false; Milnor 9.1 needs dim ≥ 6 | Excluded, sharp |
| same, h₁ | contractible W bounded by a homology sphere with π₁ ≠ 0, minus a ball | h₀ holds; H_*(W,M₁) = 0, but π₁M₁ ≠ 0 = π₁W | h₁ needed; R06 |
| 1.1 predicate | M×I; Dⁿ from ∅ | retraction composites id, id; π₀(∅) = ∅ vs {*} | Pass |
| 1.3 trading | dim W = 6 | removed indices 0, 1, 5, 6; 8.1(1) needs 6 ≥ 5; 7.8 needs 6 ≥ 6 | Pass |
| 1.4 Whitney move | (r,s) = (3,3); a local opposite pair | 6 ≥ 5, s = 3, no π₁ condition; count 2→0, signed sum 0→0 | Pass |
| 1.6 level five | (r,s) = (2,3) in V⁵ | r+s = 5, s = 3, r = 2 ⇒ π₁(V−Q) = 1 needed; attaching circle codimension 5−1 = 4 | Pass |
| 1.6 locator | end of proof of 6.6 | line 2185 on PDF 89 = p.84 vs cited p.89 | R05 |
| 1.7 Check | D^(n+1) | both h₀ and h₁ fail, not h₁ alone | R06 |
| 2.2 descent | n = 3; n = 2 | n = 3: Σ−p and W−A have codimension-3 removals, π₁ = 1; n = 2: arc of codimension 2 | Pass for n ≥ 3; n = 2 by route |
| 2.2 n = 2 route | Σ = S²; T² | χ(W)−χ(V) = (2−2)−0 = 0 ⇒ c₁ = 0; (0−2)−0 = −2 ⇒ c₁ = 2 | Pass; T² separated |
| 2.2 n = 1 route | circle m₁ M₁ m₂ M₂ | after removing m₁ and M₁: one minimum and one maximum left, cancelled ⇒ 0 critical points, two arcs | Pass |
| 2.2 n = 2 twisted sphere | h ∈ Diff⁺(S¹) | the lift H_t = (1−t)H + t(x+H(0)) has H_t′ > 0 and H_t(x+1) = H_t(x)+1 | Pass |
| 2.3 V_Σ, W_Σ | Σ = Sⁿ | V ≅ D^(n+1); W ≅ Sⁿ×I; H_n ℤ→ℤ at both ends; π₁ = 0 | Pass |
| 2.3 one-handle reading | Σ = Sⁿ, n ≥ 2 | ≃ Sⁿ∨Sⁿ∨S¹: π₁ = ℤ, H_n = ℤ² | Excluded (Check :832) |
| 2.3 gluing | KM 2.4 coordinates | t ∈ (½,1] ↦ radius 2t−1 ∈ (0,1]; ∂ = (Σ−D)×{0} ∪ (Σ−D)×{π} ∪ S^(n−1)×diameter = Σ#(−Σ) | Pass |
| 2.4 Θₙ ⇔ diffeomorphism | n = 5; n = 4 | dimension of the h-cobordism 6 ≥ 6 (Milnor 9.2); 5 < 6 | Pass for n ≥ 5 only |
| 2.1 codes | two ℝ charts glued by id; zero charts | one point over each real; empty realization | Pass (Checks :819–821) |
| 5.0 signed count | ∅; one positive point; reflected | degrees 0, +1, −1 = Σσ(x) of B1.1 | Pass |
| 5.1 Thom space | two points | Th(ν) = Sᵏ∨Sᵏ; fold count 2 | Pass |
| 6B E₈ matrix | entries (2,7), (6,5), (0,2), (7,3), diagonal | 1, 1, 0, 0, −2 = `intersectionMatrix` (adjacency plus weight −2); det(−E₈) = (−1)⁸ = 1; σ = −8 | Pass |
| 8.2 exactness | n = 6, 7, 8 | im J₆ = 0 ⇒ A₆ = ℤ/2; J₇ onto ℤ/240 ⇒ A₇ = 0; im(A₈→π₇SO) = ker J₇ = 240ℤ | Pass |
| 9A.4 valuations | k = 3, 4, ≥ 5 | v₂(B₆) = v₂(1/42) = −1, v₂(B₈) = v₂(−1/30) = −1; v₂(d₃) = 6−2−0+1 = 5, v₂(d₄) = 8−2−2+0 = 4, v₂(dₖ) ≥ k−1 ≥ 4 > v₂(−8) = 3 | Pass |
| `sphere_parallelizable_iff` | n = 1, 2, 3, 7, 8 | LHS T, F, T, T, F; RHS T, F, T, T, F; n = 0 excluded by `0 < n` | Pass |
| 3C.5 divisibility | r = 1, 2, 3, 4, 8 | ν₂(3ʳ−1) = 1, 3, 1, 4, 5 vs r | Only 1, 2, 4 pass |
| `nonempty_orthogonalGroup_bottPeriodicity` | (k,n) = (0,11) | π₉O(11) = ℤ/2 = π₁O(11); 9 ≤ 11−2 | Pass |
| third entry | n = 5 vs 4 | π₃O(5) = ℤ vs π₃SO(4) = ℤ² | Pass; sharp |
| fourth entry | n = 6 vs 5 | 0 vs π₄SO(5) = ℤ/2 | Pass; sharp |
| fifth entry | n = 7 vs 6 | 0 vs π₅SO(6) = π₅SU(4) = ℤ | Pass; sharp |
| sixth entry | n = 8 vs 4 | 0 vs π₆SO(4) = (ℤ/12)² | Pass |
| seventh entry | n = 9 vs 8 | ℤ vs ℤ² | Pass; sharp |
| eighth entry | n = 10 vs 9 | ℤ/2 vs (ℤ/2)² | Pass; sharp |
| second entry | n = 4 | π₂ of a Lie group = 0 | Pass |
| fourth stem | n = 6 vs 5 | π₁₀S⁶ = 0, 10 ≤ 2·6−2; π₉S⁵ = ℤ/2 | Pass; sharp |
| fifth stem | n = 7 vs 6 | π₁₂S⁷ = 0; π₁₁S⁶ = ℤ | Pass; sharp |
| sixth stem | n = 8 | π₁₄S⁸ = ℤ/2; 14 ≤ 14 | Pass |
| seventh stem | n = 9 vs 8 | π₁₆S⁹ = ℤ/240 vs π₁₅S⁸ = ℤ⊕ℤ/120 | Pass; sharp |
| `smoothPoincareSix_oriented` | S⁶ with A = B; A reflected | f = id, sign +1; f = reflection, (−1)(−1) = +1 | Pass |
| `nonempty_diffeomorph_sphere_six` | S⁶; ℝ⁶ | id; ℝ⁶ excluded (not compact) | Pass |
| 10.2 | M with Θ₆ = 0 | h-cobordism of dimension 7 ≥ 6, Milnor 9.1 applies | Pass |
| R01 citations | `OrientedConnectedSum` at a91d3aa vs 2fd255d | absent vs Oriented.lean:143 | R01 |
| R02 ownership | James for X = S¹ at #1742 and here | ΣΩS² ≃ ⋁S^(r+1) on both; two owners | R02 |

## Not verifiable

- **5.0 and 5.1:** Milnor, *Topology from the Differentiable Viewpoint*, §7, Theorems A–C, pp.43–44. The sources service found no legal source (the JSTOR landing page only). The README has correctly dropped its earlier link.
- **9.2 and 9.3:** two sources are paywalled and recorded as uncertified by the service; their locators were not checked.
  - Gray 2001, §2, pp.131–133 (DOI `10.1007/978-3-0348-8312-2_11`).
  - Fomenko–Fuchs 2016, §27.4, Corollary, p.387 (DOI `10.1007/978-3-319-23488-5`). A course-page copy exists in the cache, but it is not a legal source and was not used.
  - Toda, Propositions 5.8, 5.9 and 5.11, is settled as uncertified.
- **2.1:** the target carries no source locator. Its claims are routed to GeometricTopology's smoothing-and-triangulation item 1 (main README:938) and AlgebraicTopology `compactManifoldFiniteCWType`; both resolve.
- **R01's repair:** not elaborated at main's pin, because the brief allows Lean only at this branch's pin.
- **Ownership against open pull requests:** checked through `roadmaps grep` and the heads named above. Open pull requests without supplied files were not searched beyond that.

## Source issues

- none
