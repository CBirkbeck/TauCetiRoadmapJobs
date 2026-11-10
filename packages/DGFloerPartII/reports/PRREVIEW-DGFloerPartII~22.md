# Review of DGFloerPartII (pull request #1799 at c8e0b93)

**Verdict:** needs changes

This is an incremental re-review of the 98 changed lines since `4def45e`. All of them are in
`README.md`: 69 insertions and 29 deletions, in the supplier contracts, the *Needs:* lines of 1.0,
3.2, 4.2, 4.2a, 4.3, 4.5 and 4.6, and the Layer 3 and Layer 4 Dependencies. `Suggested.lean` is
unchanged, and nothing changed outside the folder.

- Review 21's R03 is repaired.
- Review 21's R01 and R02 concern the pull-request description, which is unchanged. They are
  carried here as R01 and R03.
- R02 is new and comes from the repair. The new `Topology.CWComplex` contract bullet says that the
  pins do not make a CW complex compactly generated. For a Hausdorff ambient space, Tau Ceti and
  Mathlib already do.

The gate passes with the moved order and the targeted build.

## R01 (P2) — Not repaired: main's DGFloer still owns Theorem B, §§6.3–6.4 and §7, and the description does not order DGFloer #1798 first

**Location.**

- README lines 42–43: "The base roadmap, cited as **DGFloer** by layer and item, owns every other
  numbered statement of the source".
- The description's `merge-order` block ends "#1742 (GeneralAlgebraicKTheoryPartII) → **this pull
  request** (#1799)". Neither that block nor the `depends-on` block names #1798.

**Claim.** This roadmap is the single owner of:

- Theorem B, with the Theorem B forms of Corollaries D and E;
- every numbered statement of §§6.3–6.4 and §7;
- the carriers and computations these statements rest on.

**Witness.** On main (`f8836c4`), `TauCetiRoadmap/DGFloer/README.md` still owns Theorem B at Layer
10 item 5 (line 1567) and Layer 11 (line 1577). Only DGFloer #1798 hands them over: at `43731dc`,
lines 38–40 and 50–55, numbering note 182–196.

**Repair.** Append this sentence to the description's merge-order paragraph, and list #1798 in the
`depends-on` block:

> #1798 (DGFloer) merges before this pull request or together with it: it moves the source's
> Theorem B, §§6.3–6.4 and §7 out of DGFloer's Layers 10 and 11 into this roadmap, with the
> homogeneous carriers, explicit degree computations and projective loop-space computations they
> rest on.

The README needs no change.

**Tested.**

- At `43731dc` the numbering note maps Layer 10 item 5's Theorem B to "DGFloerPartII §§3.2–3.3"
  (line 191) and Layer 11 to §§4.1–4.6 (lines 195–196).
- Layer 10 item 5 keeps its number for Theorems A and C, and Layer 11 item 3 keeps its number for
  its remaining use. These are the uses this README cites, in the Layer 4 Dependencies: "Layer 10
  items 2–5, Layer 11".
- `overlaps.md` lists no id that an open pull request drops.

## R02 (P2) — New: the CW-complex contract says the pins lack a result that Tau Ceti has, and assigns it to 1.0 without the Hausdorff hypothesis

**Location.** README lines 233–236, new in the From Mathlib subsection: "`Topology.CWComplex` …: a
CW structure on a closed subset of a topological space, whose topology is coherent with its closed
cells. The pins do not make it compactly generated; 1.0 proves that it is, with the subspace
topology".

The bullet points to 1.0, lines 584–586: "A CW complex in the sense of Mathlib's
`Topology.CWComplex`, with the subspace topology, is compactly generated". The 1.0 *Needs:* line
(line 667) now lists `Topology.CWComplex`.

**Claim.** The pins lack compact generation of CW complexes, so 1.0 owns it for every Mathlib CW
complex.

**Witness.** Tau Ceti `TauCeti.instDeltaGeneratedSpaceCWComplex` (`…/Classical/DeltaGenerated.lean`
line 61): `[T2Space X] [CWComplex C] : DeltaGeneratedSpace ↑C`. Mathlib makes that
`SequentialSpace` (`DeltaGeneratedSpace.lean` 58), hence `UCompactlyGeneratedSpace.{u}`
(`CompactlyGeneratedSpace.lean` 211). Mathlib's class has no `T2Space` field.

**Repair.**

1. Replace the bullet at lines 233–236 with:

   > - `Topology.CWComplex` (`Mathlib/Topology/CWComplex/Classical/Basic.lean`): a CW structure on
   >   a subset of a topological space, whose topology is coherent with its closed cells; the subset
   >   is closed when the space is Hausdorff (`Topology.RelCWComplex.isClosed`). Mathlib's
   >   instances that delta-generated spaces are sequential
   >   (`Mathlib/Topology/Compactness/DeltaGeneratedSpace.lean`) and that sequential spaces are
   >   compactly generated, with Tau Ceti's `TauCeti.instDeltaGeneratedSpaceCWComplex`, make
   >   every CW complex in a Hausdorff space compactly generated with the subspace topology. 1.0
   >   compares the convenient product of two CW complexes with the ordinary product.

2. Add this bullet to From Tau Ceti:

   > - `TauCeti.instDeltaGeneratedSpaceCWComplex` and `TauCeti.instDeltaGeneratedSpaceOfCWComplexUniv`
   >   (`TauCeti/Topology/CWComplex/Classical/DeltaGenerated.lean`): a CW complex in a Hausdorff
   >   space, with the subspace topology, and a Hausdorff space with a CW structure on the whole
   >   space are delta-generated, hence compactly generated through Mathlib's instances. 1.0 uses
   >   them for the CW complexes whose suspensions it compares with the raw quotients.

3. In 1.0 (lines 584–586), replace "A CW complex in the sense of Mathlib's `Topology.CWComplex`,
   with the subspace topology, is compactly generated, its topology being coherent with its closed
   cells;" with "A CW complex in the sense of Mathlib's `Topology.CWComplex` in a Hausdorff space
   is compactly generated with the subspace topology (Tau Ceti's
   `TauCeti.instDeltaGeneratedSpaceCWComplex` with Mathlib's instances);".

4. In 1.0's *Needs:* line, add Tau Ceti `TauCeti.instDeltaGeneratedSpaceCWComplex` after
   `TauCeti.nonempty_ndrPair_iff`.

**Tested.** A scratch file imports Mathlib and
`TauCeti.Topology.CWComplex.Classical.DeltaGenerated`, and contains:

```lean
example {X : Type} [TopologicalSpace X] [T2Space X] (C : Set X) [Topology.CWComplex C] :
    CompactlyGeneratedSpace C := inferInstance

universe u in
example {X : Type u} [TopologicalSpace X] [T2Space X] (C : Set X) [Topology.CWComplex C] :
    UCompactlyGeneratedSpace.{u} C := inferInstance
```

- Both examples elaborate with `lake env lean`.
- The same goal without `[T2Space X]` fails with "failed to synthesize … `T2Space X`". So the
  Hausdorff hypothesis of the repair is exactly what the cited instance needs.
- Closedness of `C` needs the same hypothesis (`RelCWComplex.isClosed`, `Basic.lean` line 471),
  and so do Hatcher's CW complexes, which are Hausdorff (`hatcher-at` line 22617,
  Proposition A.3).
- The only CW complexes that 1.0 and 1.1 use are Hausdorff: the pointed CW complex of "Comparison
  with the raw quotients", and the carriers of 1.1 (line 232).
- Tau Ceti's `TauCeti.cwComplexProd` (`Classical/Product.lean` line 194) covers only finite
  complexes. The general product comparison of Hatcher Theorem A.6 therefore stays with 1.0, as the
  repaired bullet says.

## R03 (P3) — Not repaired: the description is stale

**Location.** The description contains five stale passages:

- in the `roadmap-summary` block, "HomotopySpheres' James construction and Bott periodicity";
- in the `roadmap-summary` block, "its boundaries vanishing by a Hopf-fibration rank count rather
  than degree gaps";
- in the free text, "compares the base's raw mapping-space carriers with HomotopySpheres'
  convenient ones";
- in the free text, "TangentialBordism's compact-image embedding";
- in the free text, "`Suggested.lean` states the rotation family at a fixed pole, the low-rank
  values of `π_(n−1)(SO(n))` and its torsion for odd `n`".

**Witness.** At `c8e0b93`, "HomotopySpheres" occurs 0 times in `README.md` and `Suggested.lean`,
"compact-image" 0 times in `README.md`, "rotation" 0 times in `Suggested.lean`. 2.3 uses the
`ΩHPᵈ` degree gaps (lines 1069–1070); 3.1 consumes TangentialBordism B5, B6.3 (lines 1209–1210).

**Repair.** Make five edits to the description:

1. Replace "HomotopySpheres' James construction and Bott periodicity" with
   "GeneralAlgebraicKTheoryPartII's James construction and Bott–Samelson theorem".
2. Replace "with HomotopySpheres' convenient ones" with "with the convenient carriers of 1.0 on
   Mathlib's `CompactlyGenerated`".
3. Replace "its boundaries vanishing by a Hopf-fibration rank count rather than degree gaps" with
   "the boundaries for `ΩCPᵈ` vanishing by a Hopf-fibration rank count, and those for `ΩHPᵈ` by
   the degree gaps once the Thom model is built".
4. Replace "TangentialBordism's compact-image embedding" with "TangentialBordism B5's structured
   Pontryagin–Thom and B6.3's rational oriented-bordism surjection".
5. Replace the last sentence of the free text with:

   > `Suggested.lean` states:
   >
   > - the compact-generation coreflection and product criterion of 1.0;
   > - Theorem B;
   > - the finiteness of the capacity in Theorem I for fibered families of 2-spheres, for sphere
   >   bundles over highly connected bases, for spheres, for manifolds `ℓ`-covered by
   >   diffeomorphisms, for non-aspherical compact Lie groups, and for `CPᵈ` and `HPᵈ`;
   > - the finite-to-stable range and the finite-rank Bott statements for `SO(n)`;
   > - Lemma 6.35's seven low-rank values, its splitting for odd `n ≥ 17` and its torsion for every
   >   odd `n`;
   > - Theorem G.

**Tested.** `Suggested.lean` is byte-identical to its state at `4def45e`. It declares every
statement the replacement names, at lines 106, 115, 132, 164, 192, 219, 247, 262, 280, 310, 323,
362–395, 403–443 and 460.

## Previous findings

- R01 — not repaired: README lines 42–43 are unchanged. The description's merge-order paragraph
  still ends "#1742 (GeneralAlgebraicKTheoryPartII) → **this pull request** (#1799)" and names
  no #1798. Carried as R01.
- R02 — not repaired: the description still says "HomotopySpheres' James construction and Bott
  periodicity", "TangentialBordism's compact-image embedding" and "states the rotation family at a
  fixed pole". Carried as R03.
- R03 — repaired. From Mathlib (lines 156–164) now names `HomotopyGroup.pi1MulEquivFundamentalGroup`.
  Lines 198–201 add `IsCoveringMap.comp_homeomorph` and `IsCoveringMap.homeomorph_comp`, and 4.3's
  *Needs:* (lines 1884–1886) lists both. The new CW bullet is R02.

The brief names no repair report, so no finding is marked "not actionable in this package".

## Verified sound

### Gate, dependency check, build

- **The worker's gate** (`gate.md`): every check is 0, and the result is `OK`.
- **The brief's gate command, with the configured order.** The result is `FAIL`, from one line:
  `depcheck: UPWARD: DGFloerPartII (#46) -> GeneralAlgebraicKTheoryPartII (#335) at README lines
  [440, 757, 978, 1482, 2166]`. This is the moved case: the configured order lists this roadmap
  above its supplier, and the worker moves it when it submits.
- **The same command with `--order merge-order-moved.txt --build`.** Every check is 0, `build=0`,
  and the result is `OK`. In the moved order this roadmap is at line 335, right after
  GeneralAlgebraicKTheoryPartII at line 334.
- **The brief's dependency check:**

      depcheck: 235 roadmaps, 2268 edges, 0 problem(s)

- **`lake env lean` on `Suggested.lean`**: exit 0, with 27 diagnostics, all "declaration uses
  `sorry`", and nothing else.
- **Other checks.**
  - `git diff --stat origin/main...HEAD` outside the folder is empty.
  - `git diff --stat 4def45e..HEAD` touches only `README.md`.

### Every name the diff adds, opened at the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`)

I opened 22 declarations and `#check`ed all of them in one scratch file, which elaborated with
exit 0.

| Name | Pinned file and line | README's description | What the pin says |
| --- | --- | --- | --- |
| `TopologicalSpace.generatedBy_eq_coinduced` | `Topology/Convenient/GeneratedBy.lean` 55 | coinduced by one evaluation map out of a sigma type, the form defining `compactlyGenerated` | `generatedBy X = coinduced (fun x ↦ x.1.2 x.2)` on `Σ (f : Σ i, C(X i, Y)), X f.1`; `compactlyGenerated` (`CompactlyGeneratedSpace.lean` 68) is coinduced on `Σ (i : Σ S : CompHaus, C(S, X)), i.1` |
| `CompactlyGenerated.compactlyGeneratedToTop` | `Topology/Category/CompactlyGenerated.lean` 78 | fully faithful inclusion | `CompactlyGenerated.{u, w} ⥤ TopCat.{w}` |
| `Topology.ContinuousMapGeneratedBy.ev` | `Topology/Convenient/HomSpace.lean` 120 | under local compactness and generated products | `[∀ i, LocallyCompactSpace (X i)] [∀ i j, IsGeneratedBy X (X i × X j)]` |
| `CompactCoherentification` | `Topology/Compactness/CompactlyCoherentSpace.lean` 120 | Mathlib's `𝐤X` | `def CompactCoherentification (X) := X` |
| `Topology.CWComplex` | `Topology/CWComplex/Classical/Basic.lean` 135 | see R02 | no `T2Space` field; `RelCWComplex.isClosed` (471) needs `[T2Space X]` |
| `HomotopyGroup.pi1MulEquivFundamentalGroup` | `Topology/Homotopy/HomotopyGroup.lean` 628 | `π_ 1 X x ≃* FundamentalGroup X x` | `HomotopyGroup.Pi 1 X x ≃* FundamentalGroup X x` |
| `IsCoveringMap.comp_homeomorph`, `.homeomorph_comp` | `Topology/Covering/Basic.lean` 388, 392 | homeomorphism on either side | `(g : E' ≃ₜ E) → IsCoveringMap (f ∘ g)`; `(g : X ≃ₜ Y) → IsCoveringMap (g ∘ f)` |
| `Bundle.Trivialization.IsLinear` | `Topology/VectorBundle/Basic.lean` 165 | linear trivialization | `Prop` on `Trivialization F TotalSpace.proj` |
| `Bundle.RiemannianBundle` | `Topology/VectorBundle/Riemannian.lean` 420 | metric data | class |
| `IsContMDiffRiemannianBundle` | `Geometry/Manifold/VectorBundle/Riemannian.lean` 68 | smooth metrics of 4.5 | `Prop` class |
| `LieGroup` | `Geometry/Manifold/Algebra/LieGroup.lean` 72 | Lie group | class over `I`, `n`, `G` |
| `Diffeomorph.continuous_eval_const` | Tau Ceti `Geometry/Diffeomorphism/Topology.lean` 111 | evaluation continuous, compact source | `[CompactSpace M] [IsManifold I n M] [IsManifold J n N]` |
| `IsManifold.restrictScalars` | Tau Ceti `Geometry/Manifold/IsManifold/RestrictScalars.lean` 92 | makes `CPᵈ` real | `IsManifold 𝓘(𝕜', E) n M → IsManifold 𝓘(𝕜, E) n M`, `[IsScalarTower 𝕜 𝕜' E]` |
| `TauCeti.SmoothEmbedding` | Tau Ceti `…/SmoothEmbedding/Basic.lean` 75 | embedding | structure |
| `TauCeti.SmoothEmbedding.instTopologicalSpaceNormalBundle` | Tau Ceti `…/NormalSpace/Topology.lean` 70 | quotient topology on the normal total space | `[IsManifold J 1 N] (f) (hn : n ≠ 0) : TopologicalSpace (TotalSpace K (f.NormalSpace · hn))` |
| `TauCeti.IsRegularValue` | Tau Ceti `Geometry/Manifold/RegularValue.lean` 92 | regular value | `(M → N) → N → Prop` |
| `TauCeti.RankOneLocalSystem` | Tau Ceti `AlgebraicTopology/DGLocalSystem/RankOne.lean` 96 | rank one, pointed space (4.4) | `(B) [TopologicalSpace B] (b : B) (R) [CommRing R]` |
| `TauCeti.IsAspherical` | Tau Ceti `AlgebraicTopology/EilenbergMacLane/Basic.lean` 59 | as in contract | `(X) [TopologicalSpace X] (x : X) : Prop` |
| `TauCeti.CotangentBundle.symplecticForm` | Tau Ceti `…/Cotangent/Bundle/Liouville.lean` 279 | canonical form | `SmoothTwoForm (I.prod 𝓘(ℝ, E →L[ℝ] ℝ)) (CotangentBundle I M)` |

Every name in the new *Needs:* lines of 1.0, 3.2, 4.2, 4.2a, 4.3, 4.5 and 4.6, and in the new
Layer 3 and Layer 4 Dependencies, is listed in the matching supplier contract. That was the check
review 21's R03 asked for.

### The changed contract text against `Suggested.lean`

- **`IsMulTorsion`**: one occurrence, line 135 (3.2).
- **`IsOfFinOrder`**: one occurrence, line 444 (4.3).
- **`π_`**: 35 occurrences.
  - 3.2: line 135.
  - 4.2: lines 206 and 233.
  - 4.5: lines 291–292.
  - 4.2c: lines 375–396.
  - 4.3: lines 399–444.
  - 4.6: line 476.
- **4.2a**: uses `HomotopyGroup (Fin i)` through `HomotopyGroup.map` (lines 364, 371).

So the new sentence "the carriers of the homotopy-group hypotheses and conclusions of 3.2, 4.2,
4.2a, 4.2c, 4.3, 4.5 and 4.6 …, `IsMulTorsion` in 3.2 and `IsOfFinOrder` in 4.3" is exact.

### Adversarial table

Rows 1–33 and 35–36 are carried from review 20, and rows 34 and 37–41 from review 21. Their
statements are untouched: the diff changes no Lean statement and no README statement of a theorem.
Rows 42–52 are new, for the changed contract and *Needs:* text.

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1–33, 35–36 | as in review 20 | as in review 20 | as in review 20 | true or sharp | none |
| 34, 37–41 | as in review 21 | as in review 21 | as in review 21 | as stated | none |
| 42 | `generatedBy_eq_coinduced` gives `compactlyGenerated` "by unfolding definitions" (lines 204–208; 1.0) | family `fun S : CompHaus.{u} ↦ S`, any `Y : Type v` | LHS rewrites to `coinduced` on `Σ (f : Σ S, C(S, Y)), f.1`. RHS is `coinduced` on `Σ (i : Σ S, C(S, Y)), i.1`. `rw [generatedBy_eq_coinduced]; rfl` closes the goal | true | none |
| 43 | `ContinuousMapGeneratedBy.ev` and `curryEquiv` hypotheses (lines 215–218) | the `CompHaus` family | members locally compact (compact Hausdorff); `S × T` is in `CompHaus`, so it is generated by the family | as stated | none |
| 44 | CW complexes not compactly generated at the pins (lines 233–236) | `X` Hausdorff; `X` not assumed Hausdorff | Hausdorff: `inferInstance` gives `CompactlyGeneratedSpace C` and `UCompactlyGeneratedSpace.{u} C`. Not Hausdorff: synthesis fails on `T2Space X` | false as written | R02 |
| 45 | `pi1MulEquivFundamentalGroup` gives 4.2c's case `i = 1` and 4.2a's Check value (lines 161–164) | `n = 2, 3` | `n = 3`: `π_1(SO 3) ≃* FundamentalGroup ≃* ℤ/2` (Tau Ceti needs `3 ≤ n`). `n = 2`: excluded, since `π₁(SO(2)) = ℤ` | as stated | none |
| 46 | Covering maps composed with homeomorphisms (lines 198–201) | `f ∘ g`, `g ∘ f` | the pinned types are exactly these; review 21's probe builds `S³ → SO(3)` with both | as stated | none |
| 47 | `Diffeomorph.continuous_eval_const` in 4.5's *Needs:* | `M` compact, `n = ∞` | the pin needs `CompactSpace M`; `…_of_covered` has `[CompactSpace M]` (line 282) and uses it at line 289 | as stated | none |
| 48 | `IsManifold.restrictScalars` makes `CPᵈ` real (4.5) | `𝕜 = ℝ`, `𝕜' = ℂ`, `E = Fin d → ℂ`, `d = 0, 1` | `d = 0`: `E` is the zero space and `CP⁰` a point. `d = 1`: a real 2-dimensional model. Line 303 elaborates | as stated | none |
| 49 | `instTopologicalSpaceNormalBundle` in 4.6's *Needs:* | `n = ∞`, `hn = WithTop.coe_ne_zero.2 ENat.top_ne_zero` | needs `[IsManifold J 1 N]`; `Q` has `IsManifold 𝓘(ℝ, E) ∞ Q`, which gives the `1` instance | as stated | none |
| 50 | `Bundle.Trivialization.IsLinear` in 4.6's *Needs:* | `e.IsLinear ℝ` at line 480 | `Prop` on a `Trivialization F TotalSpace.proj`; linear on fibres over the base set, which is `univ` here | as stated | none |
| 51 | `TauCeti.RankOneLocalSystem` (4.4) in the Layer 4 Dependencies | 4.4's *Needs:* | line 1971 lists it; the pin is pointed (`b : B`), matching "on a pointed space" | consistent | none |
| 52 | Hatcher Theorem A.6, cited where the new bullet points (1.0) | `hatcher-at` line 22693, printed p. 524 | `(X×Y)_c` is a CW complex; it equals `X × Y` if a factor is locally compact or both are countable. Hatcher's CW complexes are Hausdorff (line 22617, Proposition A.3) | locator correct; supports R02's hypothesis | none |

### Seeded sample where the diff touches it

- **1.0.** Only its *Needs:* line changed. The contract bullet the diff adds points into it: R02,
  and row 52 for the Hatcher locator.
- **3.2.** Only its *Needs:* line and the Layer 3 Dependencies changed. They now list
  `TauCeti.CotangentBundle.symplecticForm`, `TauCeti.IsRegularValue`, `HomotopyGroup.Pi` and
  `IsMulTorsion`. These are the carriers of the statement at `Suggested.lean` lines 132–144.
- **4.2a.** Mathlib `HomotopyGroup.Pi` was added to its *Needs:* line. Its range Check now matches
  the contract's `π₁(SO(3)) = ℤ/2` (row 45).
- **4.2c.** The contract now reads its case `i = 1` through `pi1MulEquivFundamentalGroup` (row 45).
- **4.4.** Only the Layer 4 Dependencies changed (row 51).
- **4.5.** Its *Needs:* line now covers every carrier of the Lean statements at lines 247–330:
  `Diffeomorph.continuous_eval_const` (row 47), `IsManifold.restrictScalars` (row 48), `LieGroup`,
  `IsContMDiffRiemannianBundle`, `Bundle.RiemannianBundle`, `TauCeti.IsAspherical`,
  `HomotopyGroup.Pi` and `AlgebraicTopology.singularHomologyFunctor`.
- **The other sampled targets** (1.1, 1.3, 1.4, 2.4, 2.5, 2.6, 3.1, 3.3, 4.1): the diff does not
  touch them, and review 20's sample rows stand.

### Suggested.lean

- The file is unchanged since `4def45e`. `signatures.md` lists 33 entries for 31 declarations:
  its `of` (line 130) and `on` (line 298) are words from docstrings. No entry has lost a section
  binder.
- Review 20's and review 21's results stand for the headline list, the elaborated-signature
  comparison and the one-tactic probe.

### Citations and ownership

- **Main** is at `f8836c4`, as in review 21. Every cross-roadmap citation reviews 20 and 21
  resolved still resolves.
- **`roadmaps resolve`** finds no unresolved citation or Lean name.
- **`overlaps.md`.** Its "only an open revision defines GeneralizedCohomology G4.0b" is a false
  positive: main's `TauCetiRoadmap/GeneralizedCohomology/README.md` defines G4.0b, at lines 939,
  958 and 1006. `overlaps.md` lists no dropped id, and no other open pull request changes this
  roadmap.
- **Ownership.** The diff adds no new object. It adds citations, and one of them contradicts the
  pins (R02).

### Remark on untouched text (no change asked)

1.0's product sentence (lines 586–589) could also cite Tau Ceti's `TauCeti.cwComplexProd` for two
finite complexes. That statement is more special than Hatcher A.6 and is not a duplicate.

## Not verifiable

These texts are not in the sources cache. None of them bears on a changed passage, and the values
that depend on them were recomputed in reviews 20 and 21:

- Ziller;
- Milnor, *Morse Theory*;
- Bott 1959;
- Steenrod;
- Milnor–Stasheff;
- Pontryagin;
- Thom 1954;
- BDHO, *Morse homology with DG coefficients*;
- [Jap87].

## Source issues

- none
