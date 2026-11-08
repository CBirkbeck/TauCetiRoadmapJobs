# Review of AlgebraicTopology (pull request #1797 at a285fd7)

**Verdict:** needs changes

## R01 (P2) — DGFloer still owns the Serre machinery, the K(A,n) family, Hurewicz modulo a class and CW approximation of arbitrary spaces, which this head now claims

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` 111–128: "Stage 4.8 … owns … CW approximation of arbitrary spaces …; Stage 5.5 owns the fibration homotopy long exact sequence … and the homological and cohomological Serre spectral sequences … Stage 8.8c owns the single functorial abelian K(A,n) family". The same claims appear at 1171–1180 (5.0 complete convergence) and 2550–2595 (8.8d), with 129–131 adding "DGFloer Layer 1 consumes these ordinary targets". In `TauCetiRoadmap/AlgebraicTopology/Suggested.lean`: `exists_cwApproximation` (349) and `hurewicz_isCIso` (660).

**Claim.** This roadmap owns these objects and DGFloer consumes them.

**Witness.** DGFloer on main, README 405–416, lists among the targets "built here": "CW approximation; the homotopy exact sequence and arbitrary-CW/arbitrary-base … spectral sequences for native `serreFibrations`; … Serre classes, Eilenberg–MacLane spaces `K(A, n)`". README 140–142 says it "owns … Serre spectral sequence consumed by AT5.5". DGFloer's open head (#1798) says the same at README 61–70 ("owns … CW approximation of spaces that are not path-connected … Hurewicz modulo a Serre class, the functorial Eilenberg–MacLane models") and 1037–1038. No open pull request removes these claims.

**Repair.** Each object needs one owner. DGFloer consumes AlgebraicTopology Stages 2–8, so the acyclic choice is for this roadmap to own them. That requires DGFloer's ownership list (main 196–231 and 405–416; #1798 55–70), its Layer 1 items 1–4 and its "consumed by AT5.5" sentence to become consumption of AlgebraicTopology 4.8, 5.0, 5.5, 8.8c and 8.8d. Make that change in a pull request that this one's description names, with the merge order. Until then this folder states a second owner.

## R02 (P2) — This roadmap and CharacteristicClasses each say the other consumes the compactly supported local-coefficient cochains

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` 158–163: "CharacteristicClasses C1.2a consumes the compactly supported local-coefficient cochains of the supported-cellular supplement after Stage 6.2 (their support colimit, enlargement and cofinality comparisons, proper pullback, open extension …)". Lines 1666–1669 say the supplement "owns the compactly supported local-coefficient cochain foundation below".

**Claim.** The foundation (`C_K^*`, `C_c^*`, `H_c^n`, proper pullback, open extension, jointly proper homotopy invariance) is owned here.

**Witness.** CharacteristicClasses on main, README 66–67: "The separate AT supported-cellular supplement consumes C1.2a S0–S4". Its S0 (514) defines the same `C_K^*(X,A;L)` and its filtered colimit `H_c^n`. The text is unchanged at #1854 (72–73, 586), #1807 (72–73, 579) and #1808 (70–71, 573).

**Repair.** CharacteristicClasses consumes AlgebraicTopology 6.1–6.2. So CharacteristicClasses citing this supplement keeps the order acyclic; this supplement citing C1.2a would recreate the old cycle. Change C1.2a S0–S4 to consume "AlgebraicTopology, supported-cellular supplement after Stage 6.2" in a pull request that this one's description names, with the merge order. Until then the object is handed in both directions.

## R03 (P2) — Integral Poincaré duality for closed oriented manifolds is statable at the pins, but the docstring says it is not

**Location.** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` 118–120: "integral and twisted Poincaré–Lefschetz duality and the twisted relative fundamental class (Stages 6.3–6.4): the homological orientation local system … is a construction of the roadmap". Lines 480–481 say the same ("the integral and twisted forms need the orientation local system").

**Claim.** The integral corollary named in README 6.4 (2134–2135) and scope item 5 ("their oriented integral corollaries") needs `or_M`.

**Witness.** Tau Ceti pins `TauCeti.HomologicalOrientation` (`AlgebraicTopology/Singular/LocalHomology/Orientation/Homological.lean` 75). It also pins `HomologicalOrientation.fundamentalClass` (`…/LocalHomology/FundamentalClass.lean` 204), defined for a compact T2 manifold charted on a finite-dimensional `E`. The statement below elaborates against this file's `capProduct`, with only the `sorry` warning.

**Repair.** Add under Stage 6.4 (Hatcher Theorem 3.30, hatcher line 10453), name it in README 6.4, and limit the docstring bullet to the twisted forms, the compact-boundary forms and the twisted relative class:

```lean
theorem poincareDuality_int (n : ℕ) (M E : Type) [TopologicalSpace M] [T2Space M]
    [CompactSpace M] [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [ChartedSpace E M] (o : TauCeti.HomologicalOrientation M E n)
    (hn : Module.finrank ℝ E = n) (p : ℕ) (hp : p ≤ n) :
    Function.Bijective fun a =>
      (capProduct ℤ (TopCat.of M) p n hp).hom a
        ((((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{0} ℤ) n).map
          (ModuleCat.ofHom (ULift.moduleEquiv (R := ℤ) (M := ℤ)).toLinearMap)).app
            (TopCat.of M)).hom (o.fundamentalClass hn)) := by
  sorry
```

Calling the native `singularCap` directly at `k := ℤ` fails to elaborate (`MonoidalLinear ℤ (ModuleCat ℤ)` is not found). Tau Ceti itself works around this with a local instance in `Cohomology/IntegralCup.lean` 75. Going through `capProduct` avoids the problem.

## R04 (P3) — `IsCIso` and `IsCEpi` duplicate Mathlib's `isoModSerre` and `epiModSerre`

**Location.** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` 627–636. README 2575–2578: "Own the C-isomorphism and C-epimorphism vocabulary, `IsCIso` (kernel and cokernel in C) and `IsCEpi` (cokernel in C)".

**Witness.** The Mathlib pin has `ObjectProperty.epiModSerre` (cokernel in `P`) and `ObjectProperty.isoModSerre` (kernel and cokernel in `P`) in `CategoryTheory/Abelian/SerreClass/MorphismProperty.lean` 59 and 66. Both apply to every Serre class of an abelian category, including `AddCommGrpCat`.

**Repair.** Delete both definitions. State the conclusion of `hurewicz_isCIso` as `C.isoModSerre (AddCommGrpCat.ofHom (HomotopyGroup.hurewiczHom (X := X) (x := x) (ModuleCat.of ℤ ℤ) (n + 1))) ∧ C.epiModSerre (AddCommGrpCat.ofHom (HomotopyGroup.hurewiczHom (X := X) (x := x) (ModuleCat.of ℤ ℤ) (n + 2)))`. With the other hypotheses unchanged this elaborates. README 8.8d cites the Mathlib names and keeps only the two-out-of-three laws Mathlib lacks.

## R05 (P3) — `ordinaryEMRepresentability` does not pin the universal class, and the normalization is statable

**Location.** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` 716–719: "The README's universal class is normalized through the Hurewicz map; the existence of a representing class is the statable content." `OrdinaryEMModel.homotopyIdentification` (687) is used by no statement.

**Witness.** If ι works, so do −ι and ι composed with any automorphism of `A`. README 8.10 (2642–2644) excludes these: the class must evaluate to the identity of `A`. The normalized statement below elaborates using the native `TopCat.singularKronecker` (`AlgebraicTopology/Cohomology/Kronecker.lean` 65) and `HomotopyGroup.hurewiczHom` (`Homotopy/Hurewicz/Basic.lean` 652).

**Repair.** Import `TauCeti.AlgebraicTopology.Cohomology.Kronecker`. State the theorem for `K : OrdinaryEMModel A (n + 1)` to match the Hurewicz indexing, and add this conjunct:

```lean
(∀ γ : HomotopyGroup (Fin (n + 1)) K.space K.point,
  ((HomotopyGroup.hurewiczHom (ModuleCat.of ℤ (ULift.{0} ℤ)) n (Additive.ofMul γ)) ≫
    (K.space.singularKronecker ℤ (n + 1) ι)).hom (ULift.up 1) =
      (K.homotopyIdentification γ).toAdd)
```

This was tested in universe 0; in universe `u` use `ULift.{u} ℤ` as the file already does. Then drop the docstring sentence.

## R06 (P3) — The Lean statements are narrower than the README and than the native theorems they extend

**Location.** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` 449–475: `compactSupportTopClass_exists` and `compactSupportTopClass_unique` assume `[T2Space M] [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold … ∞ M]`. Lines 595–600: `compactManifoldFiniteCWType` is stated on the Euclidean model only.

**Witness.** README 6.3 (1797–1800) states the compact-support lemma for a "boundaryless m-manifold U", with no smooth structure. The native constant-coefficient theorems these extend (`Singular/LocalHomology/Compact.lean` 259 and 294) need only `[ChartedSpace E M]` with a finite-dimensional `E` and `finrank ℝ E = n`: no T2, no second countability, no smoothness. README 8.7 (2417–2424) attaches `compactManifoldFiniteCWType` to manifolds "with the Euclidean or half-space model, with or without boundary".

**Repair.** For the compact-support pair, use `{E : Type} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E] (hm : Module.finrank ℝ E = m) [ChartedSpace E M]` and drop `IsManifold` and `SecondCountableTopology`; this elaborates. For finite CW type, either add the half-space form `(n) [NeZero n] … [ChartedSpace (EuclideanHalfSpace n) M] [IsManifold (𝓡∂ n) ∞ M] : TauCeti.FiniteCWType M` (it elaborates), or narrow README 8.7's sentence to the boundaryless case.

## R07 (P3) — Stage 5.5 plans again a filtered-space spectral sequence and fibre-homology local system that Tau Ceti already pins

**Location.** README 1305–1309: "Own the homological Serre spectral sequence for every path-connected CW base B, using … the actual filtration `E_p=p⁻¹(B^(p))` … apply item 0's filtered-complex construction". Lines 1274–1277 say "Own fibre transport … giving … the fibre π_n local system". The Inventory (226–470) lists neither native object.

**Witness.** The Tau Ceti pin has `TauCeti.filteredSpaceSpectralSequence` (`AlgebraicTopology/Singular/FilteredSpace.lean` 247). Its docstring says filtering a total space by preimages of the base skeleta gives the Serre spectral sequence. The same file has the first page (255), d¹ as the triple connecting map (420), the abutment (275) and convergence for finite filtrations (287). The pin also has `TauCeti.fiberLocalSystem` (`Singular/Fibration/LocalSystem.lean` 102), the path-transport local system `b ↦ H_t(p⁻¹ b)` of a Hurewicz fibration.

**Repair.** List both in the Inventory. Stage 5.5 should consume `filteredSpaceSpectralSequence` on the skeletal-preimage filtration and `fiberLocalSystem` for Hurewicz fibrations. It then owns only the passage to Serre fibrations, exhaustion and convergence over infinite-dimensional bases, the E² identification, and the cohomological and multiplicative forms.

## R08 (P3) — Locators

- **Milnor 1959 has no Theorem 4.** README 2679 ("Milnor 1959 Theorems 3–4"), 2958 ("Section 2 and Theorems 3–4") and `Suggested.lean` 729 ("Milnor 1959, Theorems 3–4") all cite it. The function-space theorem is Theorem 3 (milnor1959 line 209); the loop-space result is Corollary 3 (line 218). The source's proof of Corollary 3 itself says "Theorem 4" (line 221), a misprint recorded under Source issues. Repair: write "Theorem 3 and Corollary 3".
- **Hatcher has no "Section 0.4".** README 1130 ("Hatcher, Sections 0.4 and 2.2, supplies CW pairs, cellular approximation") and References 2933 cite it. Chapter 0 is unnumbered (hatcher lines 9–12), and cellular approximation is Theorem 4.8 in §4.1 (line 15205). Repair: "Hatcher, Chapter 0, Theorem 4.8 and Section 2.2".
- **The absolute Hurewicz theorem is §4.2, not §4.1.** README 2817 says "Hatcher Section 4.1 gives the absolute Hurewicz". It is Theorem 4.32 in §4.2 (line 15961; contents line 65). §4.1 holds Whitehead's theorem (Theorem 4.5, line 15109). The References list (2933) also omits §§4.2–4.3 and the Appendix, although the README cites Theorems 4.37 and 4.57 and Proposition A.3 and Theorem A.6.
- **Lean-stated theorems with no locator.** Repair: give these locators at the README targets.
  - `ordinaryPairQuotientComparison` (README 1008): Hatcher Proposition 2.22 (line 5456).
  - `poincareDuality_zmodTwo` (2132): Theorem 3.30 (line 10453).
  - `homologicalWhitehead` (2303): Corollary 4.33 (line 16001).
  - `ordinaryEMRepresentability` (2634): Theorem 4.57 (line 17069); README 2820 gives only "Section 4.3".
- **Wrong citing roadmap.** README 755–756 says "the comparison RiemannianGeometry cites as compactReducedSuspensionCarrierComparison". No RiemannianGeometry text cites it, on main or at any open head; DGFloer does (main README, and line 1669 at #963). Repair: "DGFloer".

## R09 (P3) — No stated order with the open pull requests that change this folder or carry the other half of its ownership moves

Not repaired from the previous review's R06.

**Location.** The pull request's description (data). It names no other pull request and still describes a side-file fold with "No statement changes", which no longer describes this head.

**Witness.** The overlap index shows #1652, #1663, #1807, #1808, #1854 and #1187 conflicting with this head in `README.md` or `Suggested.lean`.
- GeneralizedCohomology consumes "AT Stage 4.5's simplicial-realization product comparison" only at #1854 and #1807 (README 237). On main it still says "Build `realizationProductKelleyComparison`" (234).
- ClassifyingSpaces consumes the 8.8a nerve model only at #1854 (101–108).
- #1663 puts compact generation and the pointed adjunction in "Stage 4 item 8", and HomotopySpheres at #1287 cites that location (README 434, 860–862). In this head they are Stage 4.5 and 8.11b.

**Repair.** Have the description describe this head and state the merge order. For example:
- this pull request merges first;
- #1854 and #1807, which carry the GeneralizedCohomology and ClassifyingSpaces halves of the moves, rebase on it;
- #1652 and #1663 rebase and adopt the Stage 4.5 and 8.11b numbering, after which HomotopySpheres updates its citation.

## R10 (P3) — The README is not in the TauCetiRoadmap form

The previous review's R07 is partly repaired: the module docstring now has the required form, but the README does not.

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` throughout.

**Witness.**
- The headings are "Scope and completion criterion", "Ownership and dependencies", "Encoding conventions", "Inventory", "Stage 1"–"Stage 8", "Dependency order" and "Acceptance checks".
- Missing: the `**Summary.**` paragraph, `## Exact supplier contracts`, `## How to read the build`, per-layer `### Examples` and `### Dependencies`, and `## Downstream consumers`.
- None of the file's definitions has a `**Checks.**` list: `LocallyRepresentedTopSection`, `lsCupLength`, `HasProperHomotopyExtensionProperty`, `OrdinaryEMModel`, `SatisfiesSerreAxioms`, `groupClassifyingSpace`, `ordinaryPairQuotient`.
- `SingularHomology` (`Suggested.lean` 357) is never named in the README.
- The word "current" appears at 228, 2043 and 2834.

**Repair.**
- Use the house sections: Summary, Scope and ownership, Conventions, Exact supplier contracts (Mathlib, Tau Ceti, each roadmap), How to read the build, `## Layer k` with `### k.n` subsections, and Examples and Dependencies per layer.
- Give each definition at least three discriminating Checks. The adversarial rows below supply some: cup length 0 for a point, 1 for Sⁿ, 2 for T² over ℤ; `OrdinaryEMModel` accepts S¹ for (ℤ,1) and rejects S² for (ℤ,2), since π₃S² = ℤ.
- Name `SingularHomology` in the README or inline it.
- Replace "current".

## Verified sound

**Previous review (r58 at 11a9ca1), finding by finding.**

| r58 | Status at this head | Evidence |
|---|---|---|
| R01 HomotopySpheres supplier | repaired | README 135–148: "Stage 4.5 owns the compact-generation interface … The homotopy-sphere roadmap consumes … and supplies nothing here"; depcheck 0 problems; gate `dropped=0` |
| R02 import of DifferentialGeometry's file | repaired | imports at lines 3–61 are `Mathlib` and `TauCeti.*` only; gate `imports=0` |
| R03 75 sorry'd definitions | repaired | gate `sorry-data=0`; every `def`/`abbrev`/`structure` has a real body (read) |
| R04 native results restated | repaired | native results pinned by `#check` (142–217), listed in the Inventory (310–449) and in the docstring (88–106) |
| R05 statement hygiene | repaired | gate `statement-hygiene=0` |
| R06 no stated order | not repaired | re-raised as R09 |
| R07 form | partly | docstring now in form (63–128); README not (R10) |
| R08 padding | repaired | old declarations gone; probe below finds none closing in one tactic |
| R09 locators | repaired | Milnor *Morse Theory* Lemmas 3.6–3.7 cited (863, 2950); "GT3g" gone (2312 names FourManifolds, whose head consumes "proper 8.5 plus its end API", README 177); DG 9.3 described as de Rham duality, its integration comparison moved to DeRhamCohomologyAndDuality §4.1, which states it at #1768 README 512–546; S² outward-first convention now cites DG 5.1 (1931) |

**Gate.** Worker's run: all checks 0, build 0. My rerun without `--build` matches, except `outside-folder=43`. All 43 files are in folders this pull request owns (GeometricTopology 30, ReductiveGroups 9, QuadraticFormInvariants 2, LieHighestWeight 2), so this is an artefact of running the gate on one folder.

**Dependency check.**

```
depcheck: 229 roadmaps, 2313 edges, 0 problem(s)
```

**Build, signatures, probe.**
- **Build.** `lake env lean` on `Suggested.lean` (14 s) gives exactly 20 `declaration uses sorry` warnings and nothing else.
- **Signatures.** I compared the worker's 56 elaborated signatures with the README statements. The two "looks dropped" leads are `relativeCWPushoutInclusion` and `relativeCWPushoutCarrier`. Losing `[T2Space Y]`/`[T2Space Z]` there is harmless: the carrier is the pushout of any spaces, and both theorems about it keep `[T2Space Y] [T2Space Z]`. No signature changed.
- **One-tactic probe.** A scratch copy replaced every theorem's `sorry` by `first | rfl | (simp; done) | infer_instance | decide | exact? | sorry` (3 min). All 20 still report `sorry`, so no stated theorem closes in one tactic.
- **Repair statements.** Every Lean statement proposed in R03–R06 elaborates in a scratch file importing this module.

**Library declarations opened at the pins.**
- Tau Ceti:
  - `Homotopy/Hurewicz/Basic.lean` 652 (`hurewiczHom`: π_{k+1} → H_{k+1});
  - `Hurewicz/Relative.lean` 199 and 282 (native relative Hurewicz needs both spaces highly connected);
  - `EilenbergMacLane/Basic.lean` 123 (`IsEilenbergMacLaneSpaceOne` = aspherical ∧ `Nonempty (π₁ ≃* G)`);
  - `CWComplex/Classical/CWType.lean` 38;
  - `Homotopy/LusternikSchnirelmann.lean` 84 and 264 (covers by opens whose inclusions are nullhomotopic; the count is an infimum in ℕ∞);
  - `LocalHomology/Compact.lean` 259 and 294;
  - `Orientation/Homological.lean` 75;
  - `LocalHomology/FundamentalClass.lean` 93 and 204;
  - `Cohomology/Cap/Basic.lean` 101;
  - `Cohomology/Kronecker.lean` 65;
  - `Cohomology/IntegralCup.lean` 75;
  - `Topology/Homotopy/Proper.lean` 41 (`HasProperHomotopyInverse` includes properness of the map, so `A` is closed in `properStrongDeformationRetract_of_inverse`);
  - `Singular/FilteredSpace.lean` 247, 255, 275, 287 and 420;
  - `Singular/Fibration/LocalSystem.lean` 102;
  - `ClassifyingSpace/EilenbergMacLane.lean`, `HomotopyFunctor.lean` 209 and `Uniqueness.lean`;
  - `ContCohomology/Cup/Graded/Basic.lean` 120 (`TopPairing`, so README 2484 resolves).
- Mathlib: `CategoryTheory/Abelian/SerreClass/MorphismProperty.lean` 52–67.
- Grep over the 221 dotted names in the README: all resolve at the pins except module paths, and `ContCohomology.GroupCohomologyIso`, which is a module (`RepresentationTheory/Homological/ContCohomology/GroupCohomologyIso/`) named in prose.

**Cross-roadmap citations resolved.**
- DeRhamCohomologyAndDuality §4.1 (#1768 README 510–546): the consumer of 6.3's classes, as the README says.
- FourManifolds (#936 README 177).
- GeneralizedCohomology: main 234–239; #1854/#1807 34 and 237.
- ClassifyingSpaces: main 72–80; #1854 101–108 and 377.
- DGFloer: main 140–142, 196–231 and 405–416; #1798 55–70, 1037 and 1196–1222.
- CharacteristicClasses: main 66–67 and 514; #1854, #1807 and #1808.
- HomotopySpheres: #1287 434 and 860–862.
- Names other roadmaps cite from here:
  - `relativeCWPushoutCWModel`: MorseTheory and CharacteristicClasses on main;
  - `reducedSuspensionSphereHomeomorph`: RiemannianGeometry and DGFloer on main;
  - `cwProductKelley` and `basedHomotopyInverseOfEquivalence`: TopologicalKTheory on main;
  - `standardCellBallToOrderedSimplex`: FuchsianOrbifolds #1168 and StableHomotopyKTheory #1227;
  - `compactReducedSuspensionCarrierComparison`: DGFloer, not RiemannianGeometry (R08).
- Overlap leads: none of "ids dropped" or "only an open revision defines" applies; the vocabulary neighbours CharacteristicClasses and DGFloer give R01 and R02.

**Seeded sample (15 targets, seed 68 over the 42 locator mentions).**

| # | README line | Target | Source line | Result |
|---|---|---|---|---|
| 1 | 867 | product of cofibered pairs, `A` closed | strom1972 181–185 (Theorem 6) | supports |
| 2 | 970 | k-product carries the product CW structure; ordinary product if a factor is locally compact | hatcher 22693–22697 (Theorem A.6) | supports |
| 3 | 1130 | "Sections 0.4 and 2.2" for CW pairs and cellular approximation | hatcher 9–12, 15205 | fails (R08) |
| 4 | 1417 | transfer follows §3.G | hatcher 57, 14042 (Proposition 3G.1) | supports |
| 5 | 1758 | DeRhamCohomologyAndDuality §4.1 consumes 6.3's classes | #1768 README 512–546 | supports |
| 6 | 1810 | compact-support lemma | hatcher 10255–10259 (Lemma 3.27) | supports |
| 7 | 2126 | compact triad duality by the five lemma | hatcher 10976–10982 (Theorem 3.43, empty faces allowed) | supports |
| 8 | 2396 | proper Whitehead for SC and SC-at-infinity finite-dim locally finite CW | ftw1973 752–756 (Corollary 4.9: H_* and H_c^* isomorphisms) | supports |
| 9 | 2401 | locally finite contraction of C with C and its dual acyclic | ftw1973 600–607 (Theorem 4.2); 610–614 (Lemma 4.3) | supports |
| 10 | 2401 | FTW §§1–4 | ftw1973 46, 216, 452, 547 | supports |
| 11 | 2402 | FTW, Compositio 27 (1973), Numdam copy | ftw1973 2, 10 | supports |
| 12 | 2586 | Hurewicz mod C (Serre 1953, Theorem 1) | serre1953 uncertified | not verifiable |
| 13 | 2817 | "Section 4.1 gives the absolute Hurewicz" | hatcher 65, 15961 | fails (R08) |
| 14 | 2951 | Milnor, *Morse Theory*, Lemmas 3.6–3.7 | milnor1963 uncertified | not verifiable |
| 15 | 2953 | tom Dieck 9.5.1 | tomdieck2008 uncertified | not verifiable |

Further locators checked against the source text:
- Hatcher Proposition 4.13 for `exists_cwApproximation`: line 15375 supports it ("every space X has a CW approximation").
- Hatcher Theorem 4.37 for `relHurewicz_bijective_of_simplyConnected_subspace`: line 16124; with π₁A = 0, π′ₙ = πₙ.
- Milnor 1959 Theorem 3 (line 209: A ∈ Wₙ and C a compact n-ad give A^C ∈ W) and Corollary 3 (218) support `finiteSourceMappingCWType` and `basedLoopCWType`.
- Hatcher SSAT Theorem 1.8 (hatcher-ssat line 849) supports the C-isomorphism part of `hurewicz_isCIso`.

**Adversarial pass** (values computed on each side):

| Statement | Instances | Values | Result |
|---|---|---|---|
| `ordinaryPairQuotientComparison` / cohomology form | B=∅; (D¹,S⁰); n=0 | H_n(X,∅)=H_n(X) vs H̃_n(X₊)=H_n(X); H₁(D¹,S⁰)=ℤ vs H̃₁(S¹)=ℤ; H₀(D¹,S⁰)=0 vs H̃₀(S¹)=0 | holds; the non-good pair ([0,1], {0}∪{1/k}) is excluded by `RelCWComplex` |
| `relativeCWPushout_t2Space`, `_base_isClosedEmbedding` | (D¹,S⁰) attached to a point | pushout S¹ is T2; `inr : pt → S¹` closed embedding | holds; B closed by `isClosedBase` |
| `homotopyInversePairExtension_left` | A=X; A=∅; A=pt | g=g₀, H=H₀; plain inverse; based inverse (Hatcher 0.19) | holds; general case: extend `iH₀` by HEP, invert under A (Dold), correct the restriction to exactly H₀ by the cylinder-boundary HEP |
| `exists_cwApproximation` | ∅; Warsaw circle; ℚ | Z=∅; Z=pt (all π_k trivial); Z=ℚ discrete (path components are points) | holds |
| `compactSupportTopClass_exists/_unique` | m=0; K=∅; ℝ, K=[−1,1], L=ℤ | H₀(M,M∖K;L)=⊕_{x∈K}L_x with images the projections; H_m(M,M;L)=0; H₁(ℝ,ℝ∖K)=ℤ maps to a generator at each x | holds; the family +1 on [−1,0), −1 on [0,1] is not locally represented at 0 and no class has these images, so the hypothesis is needed |
| `poincareDuality_zmodTwo` | n=0; RP²; ∅; p=n+1 | (ℤ/2)^M → (ℤ/2)^M by a ↦ a⌢Σ[x]; ranks H^p = 1,1,1 vs H_{2−p} = 1,1,1; 0→0; `hp` excludes H^{n+1}=0 vs H₀≠0 | holds |
| `poincareDuality_int` (R03) | S²; RP² | H⁰=ℤ→H₂=ℤ, H¹=0→H₁=0, H²=ℤ→H₀=ℤ; RP² has H²(ℤ)=ℤ/2 vs H₀=ℤ, and the orientation hypothesis excludes it | holds |
| `lsCupLength_add_one_le_categoryCount` | pt; Sⁿ; T² over ℤ; RPⁿ over ℤ/2; R=0 | 0+1≤1; 1+1≤2; 2+1≤3; n+1≤n+1; 0+1≤count | holds; degree-0 factors are excluded (otherwise a point has cup length ⊤) |
| `relHurewicz_bijective_of_simplyConnected_subspace` | (D³,S²), n=0; Y=D³⊔S³ | π₃(D³,S²)≅π₂S²=ℤ vs H₃=ℤ; the native theorem's `hB` fails (π₂S²≠0), so this is new content; disconnected Y gives π₃=ℤ vs H₃=ℤ², so `PathConnectedSpace` is needed | holds |
| `homologicalWhitehead` | id_{S²}; degree-one P→S³ (P the Poincaré sphere) | iso; H_* iso but π₁P≠0, excluded by `SimplyConnectedSpace` | holds |
| `HasProperHomotopyExtensionProperty.cylinderBoundary` | A=∅; A closed | ∅: the constant homotopy is proper (preimage I×f⁻¹C); in general PHEP gives a proper retraction onto 0×X∪I×A (target in universe u), then use the square homeomorphism (I², 0×I∪I×∂I) ≅ (I², 0×I) | holds |
| `properStrongDeformationRetract_of_inverse` | A=X; ([0,∞),{0}) | r=id; the inverse [0,∞)→pt is not proper, and no proper retraction onto a point exists | consistent |
| `compactManifoldFiniteCWType` | n=0; ∅; Sⁿ | finite discrete; empty CW; two cells | holds |
| `groupClassifyingSpace_isEMOne` | G=1, ℤ/2, ℤ | point; ≃RP^∞ with π₁=ℤ/2; ≃S¹ | holds |
| `hurewicz_isCIso` | C=0, S², n=0; C torsion, S³, n=1 | H₁=0; h₂ iso; h₃: ℤ→0 epi; π₂S³=0∈C; H₁=H₂=0; h₃: ℤ→ℤ iso; h₄: ℤ/2→0 C-epi | holds (index check: `hurewiczHom k` maps π_{k+1} → H_{k+1}) |
| `IsCIso` | C torsion; ℤ/2→0; ℤ→0 | kernel ℤ/2, cokernel 0: C-iso; kernel ℤ ∉ C: not | discriminates (a cokernel-only definition would accept ℤ→0) |
| `ordinaryEMRepresentability` | A=0; Sⁿ; ∅; two points; n=1, S¹∨S¹ | [X,K]=1=H^n; A=A; 1=1; π₀K² = 1 vs H^n = 0; Hom(F₂,A)/conj = A² = H¹ | holds; −ι also works (R05) |
| `OrdinaryEMModel` | S¹ for (ℤ,1); CP^∞ for (ℤ,2); S² for (ℤ,2) | admitted; admitted; π₃S²=ℤ violates `vanishing` | discriminates |
| `finiteSourceMappingCWType` | K=∅; K=pt; X=∅, K≠∅ | C(∅,X)=pt; ≅X; ∅ | holds |
| `basedLoopCWType` | S¹ at its 0-cell | ΩS¹ ≃ ℤ discrete | holds |
| `capProduct` degree | p=q+1 | excluded by `p ≤ q`, so no truncated q−p=0 | holds |
| cap and MV sign pins (README 203–210) | k=0; n=1 | ∂(c⌢φ)=(−1)^0(∂c⌢φ−c⌢δφ); Hatcher line 10400 has the same sign | agrees |

**Ownership.** The moves of compact generation (from HomotopySpheres), the realization-product comparison (GeneralizedCohomology), the nerve model (ClassifyingSpaces), the Serre machinery and K(A,n) (DGFloer) and supported cochains (CharacteristicClasses) into this roadmap follow the merge order: each of those roadmaps consumes this one. Two counterparts are missing everywhere (R01, R02); the others exist only at unnamed open heads (R09). Of the open pull requests without a checkout in the brief, I read #1807, #1808, #1854, #1652, #1663 and #1187 through the roadmaps tool; others were not checked.

## Not verifiable

- serre1953 Theorem 1 (uncertified). I could not check the degree-(n+3) C-epimorphism conjunct of `hurewicz_isCIso` against Serre's text. Hatcher SSAT Theorem 1.8 (hatcher-ssat line 849) states only the C-isomorphism part.
- milnor1963 Lemmas 3.6–3.7, tomdieck2008 Theorem 9.5.1, weibel 5.5.1 and 5.5.10, and fq1990 §7.7 are all uncertified; each is cited by locator.
- Brown (*Topology and Groupoids* Chapters 6–7, in the cache but not drawn in the sample), Eilenberg–Steenrod, G. W. Whitehead, Dold, May, McCleary, K. Brown and Serre 1951 are cited at chapter level only.
- `homotopyInversePairExtension_left`, `HasProperHomotopyExtensionProperty.cylinderBoundary` and `properStrongDeformationRetract_of_inverse` have no source locator in the README. I checked them by the proof sketches in the adversarial table, not against a text.

## Source issues

- **Misprint** in milnor1959 at the proof of Corollary 3, p. 276: the source says Theorem 4 gives the triad of loop spaces; it should be Theorem 3, the only function-space theorem in the paper; affects nothing (the roadmap's "Theorems 3–4" locator inherits it, R08).
- **Misprint** in milnor1959 at the end of the proof of Theorem 2, (c)⇒(d), p. 276: the source says this completes the proof of Theorem 3; it should be Theorem 2, whose implication was just proved; affects nothing.
