# PKG-VirtualFundamentalClasses

Deliverables: `packages/VirtualFundamentalClasses/README.md` (2252 lines, 11 layers, 53 subsections
carrying all 61 targets of `design/plan.json`), `packages/VirtualFundamentalClasses/Suggested.lean`
(module docstring and namespace, no declaration), `packages/VirtualFundamentalClasses/metadata.toml`
(`topic = "math.AG"`, as AlgebraicVectorBundles, SchemeAndStackFoundations and StableReduction on
main), `packages/VirtualFundamentalClasses/sources.toml` (22 entries, one updated). `design/plan.json`
is unchanged: `gaps` stays `[]`, since every prerequisite resolves on main, at the pins or at the head
of EquivariantIntersectionTheory.

The README is the accepted design written out, with the corrections listed below. No target, Check
or worked example of the design was dropped; a word-level diff of `design/README.md` against
`README.md` shows only the edits listed here (the rest is line reflow).

## Headline theorems

None is statable at the pins. Each is named in the module docstring of `Suggested.lean` with what it
lacks; nothing is stated in its place.

| # | Headline (README) | Status | What it lacks at the pins |
| --- | --- | --- | --- |
| 1 | Coarse-space comparison `p_* : A_i(𝓜)_ℚ ≅ A_i(M̄)_ℚ` (6.1) | not statable | Deligne–Mumford stacks, proper morphisms of stacks, rational Chow groups of stacks and of algebraic spaces, rational pushforward |
| 2 | `A^G_i(X)_ℚ ≅ A_{i−g}([X/G])_ℚ`, ring isomorphism for smooth `X` (6.2) | not statable | quotient stacks, Chow groups of stacks, equivariant Chow groups (EquivariantIntersectionTheory §2.1, an open pull request) |
| 3 | `∫[𝒱_x] = [κ(x) : k]/|Aut(x̄)|`, `∫` vanishes on `R_0` (6.3) | not statable | DM stacks, integral closed substacks, function fields, automorphism groups of geometric points, Chow groups of stacks |
| 4 | `C_{M/𝔐}` pure of dimension `m`, abelian hull `N_{M/𝔐}`, vector bundle stack iff lci (8.5) | not statable | algebraic stacks and their dimension, cone stacks, the small étale site of a DM stack and its derived category, `τ^{≥−1}L_{M/𝔐}` of a morphism of stacks |
| 5 | Characterisations of obstruction theories (9.3) | not statable | as 4, and the stacks `h¹/h⁰(E^∨)` |
| 6 | Virtual class `0^!_{F_1}[C(F^•)] ∈ A_{m+r}(M)_ℚ`, independent of the global resolution (10.2–10.3) | not statable | as 4–5, and the zero-section Gysin map on stacks |
| 7 | Properties 10.4–10.8 (no obstructions, `c_top(Ob)`, products, flat and regular pullback, functoriality, deformation invariance) | not statable | as 6, Chern and bivariant classes on stacks, Vistoli's Gysin maps |
| 8 | `(Rπ_* F^*T_X)^∨ → τ^{≥−1}L_{M/𝔅}` perfect, rank `χ(F^*T_X)`, global resolution under a fibrewise ample sheaf (11.4–11.6) | not statable | as 4–5, derived pushforward and relative duality along a representable morphism of DM stacks |

Evidence: case-sensitive greps of the pinned Mathlib (`1b1ccf4b`) and Tau Ceti (`2fd255d9`) for
`DeligneMumford`, `AlgebraicStack`, `IsAlgebraicStack`, `ConeStack`, `ObstructionTheory`,
`IntrinsicNormal`, `CoarseModuli`, `EquivariantChow`, `normalCone`, `gysin`, `chernClass`: no hit.
What exists: Mathlib `Pseudofunctor.IsStack` (category-valued), Tau Ceti
`TauCeti.AlgebraicGeometry.SchPseudofunctor` (`TauCeti/AlgebraicGeometry/Stack/Basic.lean`),
`TauCeti.AlgebraicGeometry.Spaces.IsAlgebraicSpace` (`AlgebraicSpace/Basic.lean`), the scheme Chow
groups `TauCeti.AlgebraicGeometry.Chow.ChowGroup` (`Chow/Basic.lean`) and
`TauCeti.AlgebraicGeometry.PrestableFamily` (`Curves/Prestable.lean`, scheme morphisms only).
Defining algebraic or Deligne–Mumford stacks, or Chow groups of stacks, in `Suggested.lean` would be
the heavy definitions the brief excludes; a scheme-only version of any headline would be a weaker
substitute. The file therefore states nothing, as the brief allows.

## Elaboration

`lake env lean packages/VirtualFundamentalClasses/Suggested.lean`, run from the content checkout:
exit 0, no message of any kind; `sorry` warnings: 0 (the file declares nothing). First line
`module`, then the single `import Mathlib`; no `TauCeti.*` import, no `set_option`.

`#check` comparison: `Suggested.lean` has no declaration, so there is nothing to compare. To check the
library names the README cites, a scratch file with `#check @name` for 22 of them (Mathlib
`AlgebraicCycle`, `AlgebraicCycle.map`, `AlgebraicGeometry.Scheme.ord`, `SheafOfModules`,
`DerivedCategory`, `HasDerivedCategory`, `Algebra.Extension.cotangentComplex`, `.toKaehler`,
`.exact_cotangentComplex_toKaehler`, `Algebra.H1Cotangent`, `Algebra.FormallySmooth` with
`iff_split_injection` and `iff_comp_surjective`, `derivationToSquareZeroEquivLift`,
`AlgebraicGeometry.Scheme.smallEtaleTopology`, `CategoryTheory.Limits.CategoricalPullback`,
`topologicalKrullDim`, `CategoryTheory.Pseudofunctor.IsStack`; Tau Ceti `Chow.cyclesOfDimension`,
`Chow.RatEquiv`, `Chow.ChowGroup`, `Chow.cycleClass`, `AlgebraicCycle.div`,
`FiniteLocallyFreeSheaf.rank`, `Scheme.Modules.isFiniteLocallyFree`, `Spaces.IsAlgebraicSpace`)
elaborated with no error. The Tau Ceti modules `Chow/ClosedImmersion`, `VectorBundle/LinearScheme`,
`VectorBundle/Geometric`, `VectorBundle/TotalSpace`, `RelativeSpec/BaseChange`, `RelativeSpec/Graded`,
`RelativeSpec/UniversalProperty`, `Stack/Basic`, `Descent/QuasicoherentSheaf` and
`Sites/Big/StructureSheaf` have no object file at the pin; they are not imported by `Suggested.lean`,
so they were not built, and the names cited from them (`Chow.pushforward`, `linearSpec`, `totalSpace`,
`totalSpaceHomEquiv`, `totalSpaceSchemeBaseChangeIso`, `relativeSpecBaseChangeIso`,
`gradedRelativeSpec`, `CategoryTheory.CommMon.relativeSpecHomEquiv`, `SchPseudofunctor`,
`Chow.equivIntOfUnique`, `AlgebraicGeometry.Scheme.bigStructureSheaf`, `PrestableFamily`) were
checked at their declaration lines in the pinned sources.

## Corrections to the design

1. **Supplier contracts at the pins.** The design said no Tau Ceti declaration is consumed and cited
   scheme Chow groups, cones and vector bundles to roadmap sections. At the pinned Tau Ceti these
   exist: `Chow.cyclesOfDimension`, `Chow.RatEquiv`, `Chow.ChowGroup`, `Chow.cycleClass`,
   `Chow.equivIntOfUnique` (`Chow/Basic.lean`; signature `X i`, no base field), `Chow.pushforward`
   (`Chow/ClosedImmersion.lean`), `AlgebraicCycle.div`, `gradedRelativeSpec`,
   `relativeSpecBaseChangeIso`, `CommMon.relativeSpecHomEquiv`, `linearSpec` (contravariant,
   `Spec Sym F`), `totalSpace` (covariant, `Spec Sym E^∨`, points are sections of `E`, matching
   Convention 6), `totalSpaceHomEquiv`, `totalSpaceSchemeBaseChangeIso`,
   `Scheme.Modules.isFiniteLocallyFree`, `FiniteLocallyFreeSheaf.rank`, `bigStructureSheaf`,
   `Spaces.IsAlgebraicSpace`, `SchPseudofunctor`, `PrestableFamily`. "From Tau Ceti" now lists them
   with files and what each says; Conventions 6, 2.1, 2.3, 2.4, 4.1, 7.1, 11.1 and the layer
   dependencies cite them; the AlgebraicVectorBundles contract keeps only what is not at the pin
   (`FiniteLocallyFreeSheafOfRank`, `relativeSpecUniversalProperty`, `linearSpecBaseChangeIso`,
   `totalSpaceBaseChangeIso`, all declared in its `Suggested.lean`); the SchemeAndStackFoundations
   §5.1 contract now names the API it states there (`CH_top_free`, `CH_coprod`) instead of the
   carriers, and StableReduction Layer 3 is cited for the prestable-family API.
2. **Degree of zero-cycles on schemes** is SchemeAndStackFoundations §5.2 (line 6653 ff.: "for `X`
   proper over `k`, `deg : CH_0(X) → ℤ` is well defined and `deg f_* = deg`"), not §5.1: 6.3, its
   `*Needs:*`, Layer 6 Dependencies and the §5.2 contract are corrected.
3. **Notation clash.** The design used `k` both for the base field and the dimension index
   (`A_k(𝓜)` with `Spec k`, `Chow.ChowGroup k X k`). The dimension index is now `i` (second index
   `j`) throughout Layers 1–6 and the Summary; Convention 9 (proposed Lean names, which no
   declaration carries) is replaced by a notation convention; `A_i(∐ 𝓜_i)` became
   `A_i(∐_α 𝓜_α)`; in 10.7 the "`k`-invariant" is now the Postnikov class (as defined in place);
   the Summary uses `F` for the universal map as Layer 11 does.
4. **11.1: representable by schemes.** The design asked `𝒞 → 𝔅` to be representable (by algebraic
   spaces) with prestable base changes. Tau Ceti's `PrestableFamily` and StableReduction's are
   predicates on morphisms of schemes, and 11.2 sends `U ↦ 𝒞_U`, which must be an object of the
   small étale site of 7.3, whose objects are schemes. 11.1 now asks `𝒞 → 𝔅` to be representable
   by schemes (Convention 2); Behrend's universal curve over the stack of prestable curves is.
5. **Global resolutions in Layer 11** need an invertible sheaf on `𝒞_M` ample on the fibres (11.5).
   The Summary claimed global resolutions unconditionally; it now carries the hypothesis.
6. **Downstream consumers.** MotivicStructuresInModuliOfCurves was listed as consuming Layers 2–6.
   It is line 340 of the merge order (this roadmap is line 396), does not cite this roadmap, and asks
   SchemeAndStackFoundations for stack Chow groups through gap:stack-rational-chow; the entry is
   replaced by an unnamed consumer description. The residual-gerbe entry is removed and the
   corresponding boundary made neutral, since the board package StackPointsAndResidualGerbes lists
   this roadmap as its consumer (the opposite direction) and is not a citable supplier (not on main,
   not in the merge order, not an open roadmap pull request). The Kresch consumer entry became a
   boundary sentence (kresch1999 Theorem 2.1.12 (ii), kresch1999 lines 213 and 225).
7. **Scope.** Added the one-clause distinction from the obstruction theories of
   SchemeAndStackFoundations §4.5 (obstruction spaces of deformation functors on small extensions of
   Artin rings, README line 5244 there) and named the symplectic GromovWittenTheory explicitly.
8. **Code spans broken across lines** (13 hits of the gate's `tex` check, inherited from the design,
   in Convention 7, 1.5, 2.3, 5.3, 7.1, 7.5, 8.3, 10.2, 10.7) are joined.

## Ownership and duplication sweep

Removals: none. No definition or theorem of this roadmap exists on main, at the pins or as an owned
target of an earlier roadmap; the scheme-level objects found at the pins were already imported, not
defined, here, so the sweep changed citations (correction 1) and removed nothing.

Searched by object with `roadmaps grep` over main and the 466 open pull requests ("intrinsic normal
cone", "Behrend–Fantechi", "h¹/h⁰", "obstruction theor", "cone stack", "virtual class",
"Vistoli", "Chow groups of … Deligne", "Edidin–Graham", "rational degree"), and directly on main.
Findings:

- **VirtualFundamentalClass (#1996, Paul-Lez, a new roadmap folder, not in the merge order) plans the
  same objects**: stack dimension (its Layer 0 ↔ our 1.3), stack sites, cones and normal cones on
  stacks (Layer 1 ↔ 4.1–4.2, 7.3), Vistoli's rational Chow and Gysin theory and the canonical rational
  equivalence (Layer 2 ↔ Layers 2–5), cotangent complexes on stacks (Layer 3 ↔ 8.1–8.3), cone stacks
  and `h¹/h⁰` (Layer 4 ↔ Layer 7), the intrinsic normal sheaf and cone (Layer 5 ↔ 8.4–8.5),
  obstruction theories (Layer 6 ↔ Layer 9), the virtual class and its properties (Layers 7–9 ↔
  Layer 10, including Example 7.6 ↔ 9.4). Its `Suggested.lean` states nothing. The two cannot both
  own these objects. This roadmap keeps ownership: it is the one in the merge order (accepted
  design, line 396), its plan is the more complete one (locators, Checks, the corrected
  Proposition 3.5 and 5.10 routes), and the brief fixes its mathematics. Settling it needs a human:
  #1996 should cite this roadmap by section or be withdrawn; the folder names
  `VirtualFundamentalClass` and `VirtualFundamentalClasses` would also be confusingly close.
- **GromovWittenTheory (#1998, Paul-Lez)** names VirtualFundamentalClass (#1996) as its supplier
  and owns, in its Layer 4, the stable-map obstruction theory `(Rπ_* f^*T_X)^∨ → L` and its global
  resolution. That is the specialisation to stable maps of this roadmap's 11.4–11.6, which are
  stated over an arbitrary base stack with a prestable family; under single ownership #1998 would
  consume 11.4–11.6 and specialise them. It is not cited here (two open pull requests carry the
  folder name GromovWittenTheory; the merge-order entry at line 305 and the board package of that
name track the symplectic one, #990, whose review reports read "pull request #990").
- **MotivicStructuresInModuliOfCurves** (board package, merge order line 340) declares
  gap:stack-rational-chow on SchemeAndStackFoundations: rational Chow groups of finite-type
  algebraic stacks stratified by quotient stacks, with proper pushforward, intersection products on
  smooth DM stacks and the rest. If SchemeAndStackFoundations accepts it, it owns Kresch-type groups
  whose restriction to DM stacks is this roadmap's Layers 2–5 (kresch1999 Theorem 2.1.12 (ii)):
  a second owner of the DM case, to be settled when that gap is answered (one owner, the other
  citing it).
- **EquivariantIntersectionTheory (#1685, mycaule, new folder)** is a supplier (6.2). Its head
  still has Conventions 1, 4, 5 and §§2.1–2.3 as cited; it does not state the comparison of 6.2
  (its Out-of-scope lists Kresch's groups and DM fixed points only). It is not in the merge order;
  the pull request of this package must name it in its merge-order paragraph.
- SchemeAndStackFoundations §4.5 (obstruction theories of deformation functors) is a different
  object (correction 7). ImplicitAtlases, AnalyticStableMaps, the symplectic GromovWittenTheory,
  SymplecticFieldTheory, Orbifolds, ComplexCurveModuli and the topological K-theory roadmaps use
  "virtual class" for topological or K-theoretic objects. AlgebraicModuliForArithmeticGeometry's
  Vistoli citations are to fundamental gerbes and tame stacks.

Ownership against the open pull requests was checked with the roadmaps tool for all of them
(grep), and by reading #1996, #1998, #990 and #1685 at their heads; #1996, #1998 and #1685 are not
among the sibling checkouts listed in the brief, so they were read through `roadmaps show`.

Notions moved down from later roadmaps: none. Dependencies on roadmaps that only an open revision
defines: none (`scratch/overlaps.md`; no open pull request changes this roadmap or drops a cited id).

## Supplier citations resolved

Supplier READMEs on main (`fb998610`) have no commit since the design review's `7e2fae4e`
(`git log 7e2fae4e..HEAD` over SchemeAndStackFoundations, AlgebraicVectorBundles,
DerivedModuleAlgebra, EnhancedDerivedSheaves and StableReduction is empty), so the review's line
checks stand; in addition every SchemeAndStackFoundations name used in the body was found in its
section (`setoid_criterion` l.2847 in §1.20, `test_BG_representations` l.3008 in §1.22,
`flatPullback_properPushforward`/`localization_exact` l.6678 and `chow_affine_bundle` l.6680 in
§5.2, `deformationToNormalCone` l.6783, `commutes_with_c1` l.6823, `gysin_open_independent_double_cover`
l.6861 in §5.5, `Chow.graphPullback` l.6935 and `test_pn_ring` l.6956 in §5.6; `CH_top_free`,
`CH_coprod` in §5.1; `StackInGroupoids` is a `SchPseudofunctor`, l.2747). `roadmaps resolve` on the
new README: no cross-roadmap citation and no Lean name found nowhere.

## Adversarial pass

Rows cover every statement written or changed here and the headline theorems; the design's own
pass (four review rounds) was not repeated row by row, but the Checks below were recomputed.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Dimension index `i`, field `k` (Conv. 9, Layers 1–6) | `A_i(Spec 𝔽_p)`; `ℱ ×_k 𝒢`; `trdeg_k`; 3.5 `Z_i ⊗ Z_j → Z_{i+j}` | `A_0(Spec 𝔽_p) = ℤ`, `A_1 = 0`; every remaining `_k` is a field subscript (`×_k`, `⊗_k`, `𝔸¹_k`, `trdeg_k`) | no clash left | renamed |
| 2.3 `A_i(∐_α 𝓜_α) = ⊕_α A_i(𝓜_α)` | `BG ⊔ Spec k`, `i = 0, 1` | `ℤ ⊕ ℤ`; `0` | holds | index renamed |
| Tau Ceti Chow grading vs 2.1/2.4 | `𝔸¹_k`; `Spec k[ε]/(ε²)`; `i = −1` | generic point height `1`, `Z_1 = ℤ`; one point, `CH_0 ≃ ℤ` (`equivIntOfUnique`) `= A_0`; `CH_{−1} = 0 = A_{−1}` | agrees with 2.3–2.4 | cited |
| Conv. 6 with `linearSpec`, `totalSpace` | `ℙ¹`, `O(1)` | `totalSpace O(1) = Spec Sym O(−1)`, `H⁰` of sections `k²`; `C(O(1)) = linearSpec O(1) = totalSpace O(−1)`, zero-section self-intersection `−1`; 10.2 Check `deg = −1`, wrong dual `+1` | consistent across Conv. 6, 4.1, 10.2 | cited |
| 4.1 on schemes via `gradedRelativeSpec` | `S = Sym O`; `S = O` in degree 0 | `𝔸¹ × T`; `T` with vertex an isomorphism | matches 4.1 Checks | cited |
| 6.3 degree on schemes is §5.2 | `ℙ¹`, a point of degree 2; `𝔸¹` | `deg = 2`; on `𝔸¹` the point class is `∼ 0` with degree `1`, so no degree (SAF §5.2 text) | 6.3's properness is needed; §5.2 is the owner | locator fixed |
| §5.1 contract (`CH_top_free`, `CH_coprod`) | `𝔸²`; `∐_n Spec κ` | `CH_2 = ℤ`, `CH_1 = 0`; `CH_0 = ∏ ℤ` | scheme cases of the 2.3 API | rewritten |
| 11.1 representable by schemes | `𝔅 = Spec k`, `𝒞 = ℙ¹`; universal curve over the stack of prestable curves; a base change that is only an algebraic space | `𝒞_T = ℙ¹_T`, a scheme; prestable curves over a scheme are schemes; then `U ↦ 𝒞_U` is not an object of `(𝒞_M)_ét` (objects are schemes, 7.3) and `PrestableFamily` does not apply | hypothesis needed as stated | P2 corrected |
| Summary / docstring 8: global resolution | `M̄_{g,n}(X, β)`, `X ⊆ ℙ^N`; a family with no fibrewise ample sheaf | `L = ω_π(Σ p_i) ⊗ F^*O(3)`: degree on a contracted component `2g(E) − 2 + #special > 0`, on others `≥ 3·deg > 0`; without `L`, 11.5 gives nothing | 11.5's hypothesis must be carried | P2 corrected |
| Docstring 7: reduced base | `𝔐 = Spec k[ε]/(ε²)`, `v` regular | every `W` smooth over `𝔐` is non-reduced; 4.4 does not construct `β` (10.6 Checks) | docstring now matches 10.6–10.8 | corrected |
| Docstring 1: `M̄` of finite type | 6.1 statement | 6.1 requires `M̄` of finite type over `k` | matches | corrected |
| Kresch boundary sentence | `BG`, `G = μ_n` | Vistoli `A_0(BG)_ℚ = ℚ`, `A_{−i} = 0`; Kresch/equivariant `A_{−i} = ℤ/n`, `⊗ ℚ = 0`; kresch1999 line 225: (ii) for DM stacks | agree rationally | moved to Boundaries |
| 10.7 Postnikov class (renamed) | conic `C ⊂ ℙ²`, `X = ℙ² × ℙ¹`, `V = O(−2) ⊠ O(−2)` | `Ext²(g^*Ω_C, u^*V) = H¹(O(−2)) ⊗ H¹(O(−2)) = k`; `Ext²(Ω_{C×X}, q^*V) = 0` (`H^*(ℙ², O(−2)) = 0`, `T_{ℙ²}(−2)` acyclic by `0 → O(−2) → O(−1)³ → T(−2) → 0`) | Check holds | wording |
| 10.1 Check | `ℙ¹`, `E = [O(−4) --0--> Ω]` | `Hom_D(E, E) = k ⊕ k ⊕ H¹(O(−2)) = k³`; morphisms of complexes `k²`; homotopies `H⁰(O(−2)) = 0`; `Hom(O(−4)[1], Ω) = 0` | `1 + ξ` not representable | none |
| H1 coarse comparison (6.1) | `BG`; `[𝔸¹/μ₂]`; char `p`, `ℤ/p` on `k[x, y]` | `p_*[BG] = (1/|G|)[pt]`; integral `ℤ/2 → 0`, rational `0 → 0`, `p_*[Bμ₂] = ½[0]`; `deg = (1/p)·p = 1 ≠ 1/p` as `k(y^p)` is imperfect | matches (2.4)–(2.5), (6.1) | none |
| H2 equivariant comparison (6.2) | `G = 1`; `μ_n` on a point; `𝔾_m` on `𝔸² ∖ 0`; route | identity; `A^{μ_n}_i ⊗ ℚ = ℚ` iff `i = 0`; `A^{𝔾_m}_2 = A_1(ℙ¹) = ℤ`, shift `2 − 1`; complement dimension `< dim X + (l − dim X + i) − g = i + l − g` | holds without a quasi-projective quotient | none |
| H3 degree of zero-cycles (6.3) | non-neutral gerbe over `ℝ`; `[ℙ¹/μ₂]` | `[ℝ : ℝ]/2 = ½ = 2/4`; `div(x²/(x² − 1)) = 2[𝒫] − [𝒪]`, `∫ = 2·½ − 1 = 0` | vanishes on `R_0` | none |
| H4 pure dimension (8.5) | `Spec k → B𝔾_m`; `k[x]/(x²) ⊂ 𝔸¹`; fat point | `dim B𝔾_a = −1 = m`; `dim C_M = 1 − 1 = 0`; `C_M` dim `0`, `N_M` dim `1` | holds, lci criterion discriminates | none |
| H5 characterisations (9.3) | char 2, `k[x]/(x²)`, `φ = (0, id)` | `φ^*ω = 0` but `(x + ax²)² = x² ≠ 0` in `k[x]/(x³)` | `h^{−1}` surjectivity needed | none |
| H6 virtual class (10.2–10.3) | `ℙ¹`, `[O(1) --0--> Ω]`; `E = 0` with two resolutions | `deg = −1`; `[M]` from `0_M^![M]` and `0^!_{𝔸¹×M}[𝔸¹ × M]` | independent | none |
| H7 properties (10.4–10.8) | `[O(0) --0--> Ω]` on `ℙ¹`; `ℙ¹ × ℙ¹`; `O(2)` on `ℙ¹`, `x² + y²` over `ℂ` | `c_1(O) ∩ [ℙ¹] = 0` with `dim M = 1 > vd = 0`; `(−1)(−1) = 1`; count `2` | consistent | none |
| H8 maps from curves (11.4–11.6) | `ℙ¹ → ℙ^r` degree `d`; lines in `ℙ²`; CY3; `F = id : ℙ¹ → ℙ¹` on a point | `dim = (r + 1)d + r`; `vd = 3 + (2 − 3) = 2`; `vd = n`; `h^0(E) = k³ ≠ 0` without 11.1's hypothesis | consistent | none |
| §4.5 distinction (Scope) | `h_R`, `R = Λ[[t]]/(t²)`; `M = Spec k[x]/(x²)` with `E = τ^{≥−1}L_M` | SAF §4.5: a space `O` and classes `ob_e(ξ) ∈ O ⊗ I`; here a morphism in `D(O_M)` with `vd = 0` | different data | clause added |

## Dependency check

```
depcheck: 239 roadmaps, 2351 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line (this roadmap is the last line of the merge order).

The full gate, run on a scratch copy of the three files: every count `0` except `git=1`, which only
says the scratch copy is not a git repository (`git status --short: fatal: not a git repository`);
`tex` went from 13 to 0 with correction 8.

## Sources

No source fetched; no `needs-references.toml`. The manifest entry `kresch1999` now has locator
"Theorem 2.1.12 (ii) and (iii), Theorem 6.2.1" and `cited_for` matching the Boundaries sentence (its
"downstream consumers" use is gone). kresch1999 lines 213 and 225 were read for (ii). gillet1984 and
fulton1998 stay settled as uncertified.

## Untrusted text

Nothing in the fetched roadmaps, reports or sources asked for any action; no suspicious passage.
