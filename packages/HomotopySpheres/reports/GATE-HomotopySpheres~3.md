# GATE-HomotopySpheres~3: answers to human review of the HomotopySpheres pull request

Head before: `0932a8a`. Head after: `a4f5c1e`. One commit, touching only
`TauCetiRoadmap/HomotopySpheres/README.md`. There is one review to answer: CBirkbeck,
2026-11-07, of head `b3f62ce`. Its six findings F01–F06 are H01–H06 here.

Commit `0932a8a` was already on the branch when this round started. It is the first repair of these
findings, and it was never reviewed. This round checks it against the sources and the pins, then
repairs what it missed.

"Main's pins" means Tau Ceti `2fd255d` and Mathlib `1b1ccf4`. These are the pins of main, of the
brief and of the pull request's CI, which builds the branch merged with main. The branch's own
`lake-manifest.json` still pins Tau Ceti `a91d3aa` and Mathlib `6b7abb3`, and the targeted build
runs at those pins.

## H01 (CBirkbeck) — applied differently

The README now cites Tau Ceti at main's pin `2fd255d` throughout, and every locator was re-checked
there. The one remaining change is `Suggested.lean` line 3, `import TauCeti.Geometry.Manifold.Orientation` →
`import TauCeti.Geometry.Manifold.Orientation.OrientedAtlas`. It has to land in the same push as the
rebase onto main: at the branch's pin `a91d3aa` the new module does not exist and the targeted build
would fail, and `lake-manifest.json` is outside what this round may edit. A copy of `Suggested.lean`
with the new import elaborates at main's pins with exactly 16 `sorry` warnings and no error, and its
19 elaborated signatures are identical to those at the branch's pin.

- **Locators, re-checked at `2fd255d`** (README lines 331–388):
  - `Orientation/OrientedAtlas.lean`:283 `IsOrientedAtlas` and :129 `orientationPreservingGroupoid`;
  - `Orientation/Basic.lean`:32 `TauCeti.Manifold.Orientation`;
  - `Orientation/Preserving.lean`:63 `IsOrientationPreservingAt`;
  - `Boundary/Charts.lean`:195/321/374;
  - `ConnectedSum/Oriented.lean`:128/143/155/160/208/222/238/295;
  - `ConnectedSum/Orientation.lean`:250;
  - `Sard/EqualDimension.lean`:105/112;
  - `Degree/Basic.lean`:76;
  - `Morse/Deformation.lean`:259;
  - `Sphere/SimplyConnected.lean`:408;
  - `MappingCylinder.lean`:87/425;
  - `Plumbing/E8.lean`:63/199 and `Plumbing/IntersectionForm.lean`:108.

  In Mathlib: `SingularSet.lean`:50/66/74, `CompactlyGeneratedSpace.lean`:68 and
  `Bernoulli.lean`:696. Each line carries the declaration and hypotheses the README describes, and
  all 12 Tau Ceti files the README names exist at `2fd255d`.
- **`letI` sentence.** Old README:339, "Its charts are a definition used through `letI`", is now
  README:357, "Its charts and its smooth manifold structure are instances (lines 155 and 160)". At
  `2fd255d` those lines are `instance : ChartedSpace E (OrientedConnectedSum oM oN)` and
  `instance : IsManifold 𝓘(ℝ, E) ∞ …`.
- **Module named in the README.** README:105 and :332 name `TauCeti/Geometry/Manifold/Orientation/`
  and `Orientation/OrientedAtlas.lean`. So after the rebase, README and Lean agree as soon as line 3
  changes.
- **Evidence that line 3 must change.** The worker's own elaboration of this head at main's pins
  failed on that import: the object file for `TauCeti/Geometry/Manifold/Orientation.olean` is
  missing, because at `2fd255d` that path is a directory of modules.
- **What the rebase needs.** Main does not change `TauCetiRoadmap/HomotopySpheres/`, so the rebase
  conflicts only in files that main changed, and the branch never touches those.

## H02 (CBirkbeck) — applied differently

GeometricTopology §1.4 is now cited for associativity (README:96, :390–397, :727–736, :847). Section
2.2 carries it to `TauCeti.OrientedConnectedSum` through
`TauCeti.OrientedConnectedSum.nonempty_diffeomorph_connectedSum` (`Oriented.lean`:208), whose
hypotheses are:

- connected T2 summands;
- open-embedding local-diffeomorphism balls preserving and reversing orientation at 0.

The §1.4 those lines describe consumes the native `TauCeti.ConnectedSum`, proves associativity for
connected oriented summands and compares the native sum with the gluing model. That is GeometricTopology
§1.4 at #1797's head (`51ebd8a`), not at #903's (`b647e5c`). So the merge-order paragraph should name
#1797 for GeometricTopology §1.4, and #1663 or #1652 for AlgebraicTopology Stage 4 item 8.

- **#903's §1.4** builds its own gluing-model sum from ball complements. It proves commutativity
  and associativity for that sum only (#903 README:722–764). Reaching `TauCeti.OrientedConnectedSum`
  from there would need a native-versus-gluing comparison that #903 does not state. #1797's §1.4
  states it.
- **#903 and #1797 conflict.** Both rewrite GeometricTopology §1.4, and one must be rebased on the
  other before either merges. This roadmap's citation needs #1797's content (native-sum consumption,
  gluing comparison, associativity) to survive that rebase.
- **AlgebraicTopology Stage 4 item 8.**
  - Main's Stage 4 ends at item 7 (`simplicialRealizationCW`).
  - At #1663 (`8029fe9`), item 8 is "Compact generation and the pointed adjunction" (README:911).
  - At #1652 (`c686921`), README:458 maps Stage 4 items 1–8 to §§4.1–4.8, with item 8 the same
    topic.

  The README's 3A.1 → Stage 4 item 8 id map (README:858–864) keeps main's citations of
  "HomotopySpheres §3A.1" resolvable once either revision merges.
- **Check.** For Σ₁ = Σ₂ = Σ₃ = Sⁿ (README:837), both bracketings are Sⁿ by the sphere identity
  (`Oriented.lean`:295, `NeZero n`), so both sums are the class 0.

## H03 (CBirkbeck) — applied

`0932a8a` made the consumers the review asked for. Each was verified at its head:

- **GeneralAlgebraicKTheoryPartII** (#1742). §4.32 consumes 3B.1–3B.2 and 3B.4 (README:1263);
  §§4.33 and 7.7 consume 3B.6 and the CW approximation (README:1267–1280, :1923–1930).
- **FourManifolds** (#936). Consumes 3C, 4B, 6B, 6C, 7A–7C and Layer 9 (README:184, :658–664).
- **GeometryOfNumbersAndQuadraticArithmetic** (#851). Consumes 3A.3 and 7B–7C (README:196–198,
  :3185).
- **PositiveScalarCurvature** (main README:85–92).
- **DGFloerPartII** (#1799). Consumes 3A.1–3A.2, 3B.1, 3B.3–3B.4, 4A.1 and 4B.1–4B.8 (README:76–78).

This round adds the consumers on main that the section still omitted (new bullet, README:3155–3163),
and extends the table's "Feeds" column for tracks 3 and 4 (README:3172, :3174). The opening sentence
now names TopologicalKTheory T1.6d, which compares its tower with 4B.1's R₀ model (main README:579),
and T7, which uses 4B.1–4B.9 (main README:1222).

The added consumers, at the lines of their READMEs on main:

- **GeneralizedCohomology**: 3A's Puppe sequences, stable stems and Freudenthal comparison (:37),
  and 4B (:1491);
- **BordismFormalGroups**: 3C's Toda brackets (:331) and 3B's James stages (:668);
- **DGFloer**: 3B item 3 and 4A–4B (:185–189). Its Stage 5 framed collapse is TangentialBordism
  B5.2's, which Section 5.0 applies;
- **CharacteristicClasses**: 4A's SO(3) ≅ S³/{±1} (:456–458);
- **MorseTheory** (:97) and **GeometricCurrents** (:997);
- **AlgebraicTopology** (:117, :567, :768, :1933), **RiemannianGeometry** (:120) and **Orbifolds**
  (:430). These cite 3A.1, which Section 3A maps to AlgebraicTopology Stage 4 item 8.

## H04 (CBirkbeck) — applied

**From Tau Ceti** now cites `TauCeti.e8Plumbing` (`E8.lean`:63) and
`TauCeti.e8Plumbing_isNegativeDefinite` (:199) at README:381–388. Section 6B (README:2248–2258) states
that, in the basis of the oriented cores, the middle intersection form of P⁴ᵏ is that graph's
`intersectionMatrix`: −2 on the diagonal and +1 at the seven tree edges. It reads determinant 1 and
signature −8 from that matrix and from the pinned definiteness.

- **The pinned graph.** `E8.lean`:50–67 has edges 0–1, 1–2, 2–3, 3–4, 4–5, 5–6 and 2–7, with every
  weight −2. `IntersectionForm.lean`:108 defines the matrix as the diagonal of weights plus the
  adjacency matrix.
- **Computed values.** The leading principal minors are −2, 3, −4, 5, −6, 7, −8, 1, so the
  determinant is 1 and the signature −8. The entries (2,7), (6,5), (0,2), (7,3) are 1, 1, 0, 0, as
  the Check at README:2288 says.
- **Agreement with FourManifolds.** FourManifolds at #936 takes the same pinned lattice for 6B's
  dimension-four branch and calls its positive plumbing the orientation reversal (README:658–664,
  :1922). The two roadmaps therefore agree on the convention.

## H05 (CBirkbeck) — applied

The two course-page links are gone:

- Milnor's *Topology from the Differentiable Viewpoint* is cited bibliographically (README:3205–3207:
  University Press of Virginia, 1965; Princeton Landmarks, 1997).
- Fomenko–Fuchs is cited by its Springer DOI `10.1007/978-3-319-23488-5`, 2nd ed., GTM 273
  (README:3230–3232).

No `ux1.eiu.edu` or `cimat.mx` URL remains. The remaining 15 URLs are DOIs, arXiv, Hatcher's author
page and the Edinburgh surgery archive, which the manifest records as `institutional` for
`milnor_hcobordism` and `kervairemilnor1963`. The Milnor locator (§7, Theorems A–C, pp.43–44) is
unchanged, as the review asked. It was not re-read: there is no legal open text.

## H06 (CBirkbeck) — applied

`0932a8a` fixed the review's examples:

- it separated the listed numerals ("Pinch at ½", "base at t = 1", "determinant 1", "at most 16 at
  the prime 2, at most 3 at 3 and at most 5 at 5", README:876, :888, :2895);
- it rewrote the 9A formulas in Unicode, for example `μ = (⟨p₁(W)², [W, ∂W]⟩ − 4σ(W))/896`
  (README:2957, :2960, :2974, :3036–3037);
- it backticked `Bernoulli.padicValRat_bernoulli` (README:324, :2991, :3013).

A scan of all text outside code spans and link targets now finds no word fused to a numeral. The
same scan found five more shorthand citations of the "Stage4.6" kind, and this round spells them out:

- README:869: "Stage 4.5 cofibrations and contractible collapse" → "Stage 4 item 5 (cofibrations and
  contractible collapse)";
- README:897: "AT4.5 pushout/contractible-collapse" → "AlgebraicTopology Stage 4 item 5's pushout and
  contractible collapse";
- README:911: "AT8.11b" → "AlgebraicTopology Stage 8 item 11b";
- README:927: "Stage 4.4 raw sphere suspension" → "Stage 4 item 4's raw sphere suspension";
- README:1565: "Stage 4.6 projective quotient" → "Stage 4 item 6's projective quotient".

Each resolves on main's AlgebraicTopology:

- item 4: `reducedSuspensionSphereHomeomorph`, README:542–545;
- item 5: `relativeCWPushout` and the pair-quotient collapse, README:635–787;
- item 6: real projective space, README:789;
- item 8.11b: `ordinaryCohomologySuspension` and the cone sign formulas, README:1993–2010.

This round also lower-cased the capitalised mid-sentence "The" in Layer 2's Dependencies line
(README:846–848).

## Build, gate and dependency check

- **Targeted build.** `lake build TauCetiRoadmap.HomotopySpheres.Suggested` at the branch's pin
  (Tau Ceti `a91d3aa`, Mathlib `6b7abb3`): "Build completed successfully (8987 jobs)", with exactly
  16 warnings, all `declaration uses sorry`, and no other warning or error.
- **Gate:**
  `gate HomotopySpheres: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- **Dependency check** (`--movable`):

  ```text
  depcheck: 239 roadmaps, 2427 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line.
- **Citation resolver.** No cross-roadmap citation and no Lean name is found nowhere.

## Signature check

All 19 declarations were checked mechanically with `#check @…`, in one scratch file elaborated twice:

- at the branch's pin, with the file as it stands;
- at main's pins, with line 3 changed to `TauCeti.Geometry.Manifold.Orientation.OrientedAtlas`.

Both runs gave 16 `sorry` warnings and no error, and the 19 elaborated types are identical. Each
matches its README statement:

- `PreservesOrientedAtlases` keeps `M`, its topology and its six-dimensional charts, which is all its
  type needs.
- The h-cobordism theorem keeps `5 ≤ n`, `T2Space`, `CompactSpace`, `IsManifold (𝓡∂ (n+1)) ∞`,
  `SimplyConnectedSpace`, the closed `M₀` and the two inclusion homotopy equivalences.
- Both recognition theorems keep T2, second countability, compactness and `IsManifold (𝓡 6) ∞`.

Nothing changed in `Suggested.lean` this round.

## Adversarial pass on the statements changed by `0932a8a` and by this round

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 2.2: associativity carried to `TauCeti.OrientedConnectedSum` by `nonempty_diffeomorph_connectedSum` | Σᵢ = Sⁿ for n = 1, 2, 3; hypotheses of `Oriented.lean`:208 | It needs `PreconnectedSpace` and `T2Space`; homotopy n-spheres with n ≥ 1 are connected and Hausdorff. The balls must preserve and reverse orientation at 0, and the chosen balls do so at every v (`Oriented.lean`:128) | holds | none |
| Supplier contract: `ConnectedSum.orientation` needs preservation and reversal at every nonzero v | the oriented sum's own balls | `Orientation.lean`:250 needs `∀ v ≠ 0`; the balls give `∀ v` (`Oriented.lean`:128), which implies it | holds | none |
| Check README:837, Sⁿ associativity | n = 1, 2 | S¹ # S¹ ≅ S¹ (connected for n = 1, since both are circles); both bracketings are [Sⁿ] = 0, so 0 + (0 + 0) = (0 + 0) + 0 = 0 | holds | none |
| Check README:838, orientation of the second ball | ℂP² | ⟨1⟩⊕⟨1⟩ has σ = 2; ⟨1⟩⊕⟨−1⟩ has σ = 0. This agrees with #1797 §1.4's own Check | holds | none |
| 6B: core form = `e8Plumbing.intersectionMatrix` | −E₈, the −1-edge variant, the Cartan matrix | −E₈ minors −2, 3, −4, 5, −6, 7, −8, 1, det 1, σ −8. The variant has det 1 and σ −8 but entries (2,7) and (6,5) equal −1. The Cartan matrix has minors 2, 3, …, 8, 1 and σ +8 | holds; the Check at README:2288 separates the variant | none |
| 6B Check: k = 1 boundary | E₈ plumbing in dimension 4 | the boundary is the Poincaré homology sphere, with π₁ of order 120, nontrivial | holds | none |
| 9A.4: `Bernoulli.padicValRat_bernoulli` at p = 2 | k = 1, …, 6 | 1 ∣ 2k always. B₂ = 1/6, B₄ = −1/30, B₆ = 1/42, B₈ = −1/30, B₁₀ = 5/66, B₁₂ = −691/2730, each with v₂ = −1 | holds | none |
| 9A.4: v₂(dₖ) = 2k − 2 − v₂(k) + v₂(aₖ) ≥ 4 | k = 3, 4, 5 | 4 + v₂(a₃); 8 − 2 − 2 = 4; for k ≥ 5, k − 1 ≥ 4. σ = −8 has v₂ = 3 | holds | none |
| 9A μ values (README:2974, :3036–3037, :3195) | E₈ filling; clutching pairs (2,−1) and (1,0) | (0 + 32)/896 = 1/28; (36 − 4)/896 = 1/28; (4 − 4)/896 = 0; −(−8)/224 = 1/28 | holds | none |
| 9: ℤ/240 factorisation (README:2895) | 2, 3, 5 | 16 · 3 · 5 = 240 | holds | none |
| Spelled-out AlgebraicTopology citations (H06) | main README items 4, 5, 6 and 8.11b | each item carries the cited content (H06) | holds | five citations reworded |
| Consumer bullet (H03) | each consumer's line on main or at its head | read at the lines listed under H03. DGFloer's "Stage 5 collapse" is TangentialBordism B5.2's, so it is worded as a citation, not consumption | holds | bullet added |
| TopologicalKTheory T1.6d as a consumer of 4B.1 | supplier direction | 4A consumes T1.6a–T1.6c; T1.6d (main README:577) comes after them. The order is T1.6a–c, then 4A–4B.1, then T1.6d, with no cycle. The depcheck reports 0 problems | holds | sentence says so |

## Ownership, overlaps and dependencies

- **Ownership.** This round adds no construction, only citations and consumer entries.
  - Associativity of the connected sum is GeometricTopology §1.4's.
  - The E₈ lattice is Tau Ceti's.
  - The compact-generation substrate is AlgebraicTopology Stage 4 item 8's.
  - The plumbed manifolds in every dimension 4k stay here; FourManifolds consumes them.
- **Citations that only an open revision defines:**
  - GeometricTopology §1.4: the version at #1797, as H02 explains. #903's §1.4 is a different
    construction.
  - AlgebraicTopology Stage 4 item 8: at #1663 and #1652.

  The merge-order paragraph should name #1797, and #1663 or #1652, as merging before this pull
  request.
- **#284 (Paul-Lez).** It adds the same `TauCetiRoadmap/HomotopySpheres/` folder, a 1085-line
  draft at `fb7c47e`. This pull request is the developed successor and restates nothing #284 has
  that it does not also carry. Only one can merge. If #284 is kept, it is rebased onto this pull
  request's folder; the reverse would discard this roadmap.
- **Main roadmaps citing #284.** GeneralizedCohomology, RiemannianGeometry and AlgebraicTopology
  link "HomotopySpheres" to #284. Their section ids (3A, 3A.1, 3A.4, 4B) resolve in this README.
  3A.1 resolves through the id map at README:858–864.
- **Dropped ids.** None this round.

## Sources

No source was newly cited, and no locator was changed. `needs-references.toml` was not written.
Milnor's *Topology from the Differentiable Viewpoint* and Fomenko–Fuchs are cited by their published
bibliographic data. Their locators were not re-read, because no legal open copy exists.

Untrusted text: the review contains no instruction outside its mathematical claims, so nothing was
quoted as suspicious.
