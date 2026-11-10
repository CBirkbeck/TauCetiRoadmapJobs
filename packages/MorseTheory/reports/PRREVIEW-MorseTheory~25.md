# Review of MorseTheory (pull request #1682 at cc6f063)

**Verdict:** needs changes

This is a full review. The folder changed by 3085 lines since bcad0bc, the head the previous review read. The head is now a merge of main. `lake-manifest.json` pins Tau Ceti 2fd255d and Mathlib 1b1ccf4, the same pins as main (4820485), and nothing outside `TauCetiRoadmap/MorseTheory/` differs from main.

The previous review's one finding is repaired. The merge did not take that review's two content steps, which were to resolve the README to bcad0bc's text and to state `Suggested.lean` on the native Tau Ceti names. R01–R04 come from that.

Every headline that remains is true on every instance tried (table below). The findings are about duplication of the pinned library, shape and locators.

## Previous findings

- **R01 (re-raising H01, the unmerged branch): repaired.**
  - `lake-manifest.json` now pins Tau Ceti 2fd255d and Mathlib 1b1ccf4, main's pins.
  - Of the README's 231 backticked identifiers, only one is absent at those pins without being this roadmap's or AlgebraicTopology's (R05). The README's own names are declared in `Suggested.lean`, and AlgebraicTopology's are resolved below.
  - The four results the module docstring says are consumed (`Suggested.lean:45–51`) are at the pin:
    - `TauCeti.lsCategoryCount_univ_le_totalCriticalCount`: `Morse/LusternikSchnirelmann.lean:185`;
    - `TauCeti.dense_setOf_isMorse_manifoldStrongWhitney`: `Morse/Generic/Strong.lean:267`;
    - `TauCeti.exists_isMorse_isProperMap_bddBelow`: `:290`;
    - `TauCeti.IsMorse.nonempty_homeomorph_sphere_of_totalCriticalCount_eq_two`: `Morse/Reeb.lean:148`.
  - The pull-request title and description now describe the head, sentence by sentence.
  - Not taken: repair steps 1 (resolve the README to bcad0bc's text) and 2 (use the native names in `Suggested.lean`). These are R04 and R01 below.

## R01 (P2) — The headline theorems are stated through private copies of pinned carriers

**Location.**
- `TauCetiRoadmap/MorseTheory/Suggested.lean:76–85` declares `criticalPoints`, `criticalCount` and `totalCriticalCount`.
- `:342–344` declares `mgradient`.
- Every kept headline uses these copies (`:167`, `:187`, `:298`, `:322`, `:353`, `:367`).
- `README.md:200–202`: "Suggested.lean's `criticalPoints`, `criticalCount` and `totalCriticalCount` have the same bodies".
- `README.md:1449–1450`: "The `mgradient` of `Suggested.lean` is that definition with the same body".

**Claim.**
- All four carriers are declared in the pinned Tau Ceti, in modules that `Suggested.lean` can import.
- The repository's normative README (Writing a roadmap › Prototyping, "Import existing Tau Ceti APIs") requires prototyping against the implementation "instead of restating it behind a private stand-in".
- As stated, the headlines quantify over `TauCetiRoadmap.MorseTheory.*` copies. A consumer stating against the pinned carriers has to bridge them.
- The gradient copy does not even have the pinned body. It applies `rieszDual` to `mfderiv I 𝓘(ℝ) f x`, while the pinned definition applies it to `mvfderiv I f x`. So README:1449 is inaccurate as written.

**Witness.** At Tau Ceti 2fd255d:
- `TauCeti.criticalPoints`: `Geometry/Manifold/Morse/CriticalPoints.lean:87`;
- `TauCeti.totalCriticalCount`: `:342`;
- `TauCeti.criticalCount`: `:348`;
- `TauCeti.Manifold.mgradient`: `Geometry/Manifold/Riemannian/Gradient/Basic.lean:73`.

Mathlib's `mvfderiv` (`Geometry/Manifold/MFDeriv/NormedSpace.lean:608–610`) is `fromTangentSpace ∘L mfderiv`.

**Exact repair.**
1. Replace the imports `TauCeti.Analysis.Calculus.Morse.NormalForm` (unused) and `TauCeti.Geometry.Manifold.VectorBundle.Riemannian.Riesz` with `TauCeti.Geometry.Manifold.Morse.CriticalPoints` and `TauCeti.Geometry.Manifold.Riemannian.Gradient.Basic`.
2. Delete the four definitions.
3. Write `TauCeti.criticalPoints I f`, `TauCeti.criticalCount I f j`, `TauCeti.totalCriticalCount I f` and `TauCeti.Manifold.mgradient I f x` in their place.
4. Rewrite the docstring (`:12–20`) and README `:51–52`, `:200–202` and `:1449–1451` to say that `Suggested.lean` states its headlines on these pinned carriers.

**Tested.**
- A scratch copy with this repair and the deletions of R02 and R03 elaborates with `lake env lean`. It prints seven `declaration uses sorry` warnings and nothing else.
- `#check @` of its eight declarations shows every standing binder (`FiniteDimensional`, `Boundaryless`, `T2Space`, `SecondCountableTopology`, `IsManifold I ∞`) on every manifold statement.

## R02 (P3) — Ten sorried theorems are pinned Tau Ceti theorems, each closed by one `exact`

**Location.** `Suggested.lean:34–39`: "Several of the M1, M2 and M4 statements restate theorems the pinned Tau Ceti proves in the same or greater generality … consumers use the pinned one."

**Claim.** These declarations restate the pinned library. They are padding, not acceptance tests.
- Five of them occur nowhere in the README: `finite_criticalPoints_sublevel`, `isLocalMin_mem_criticalPoints`, `criticalPoints_nonempty_of_compact`, `exists_degenerateCriticalLevelDeformation` and `exists_noCriticalOpenSublevelDeformation`.
- Four occur in the README only as the pinned `TauCeti.` names.
- `exists_scalarRegularLevelData` is named at README `:361` as owned work, although `:311–317` says the atlas is pinned.

**Witness.** In a scratch copy, with the pinned modules imported, each `sorry` below was replaced by the single proof shown. The file elaborated with no error, and these ten no longer use `sorry`.

| Declaration (line) | One-step proof at the pin |
| --- | --- |
| `exists_normalized_morseChart` (88) | `TauCeti.IsManifoldNondegenerateCriticalPoint.exists_normalized_morseChart` (`Morse/NormalizedChart.lean:196`) |
| `finite_criticalPoints_inter` (101) | `TauCeti.IsMorse.finite_criticalPoints_inter` (`Morse/CriticalPoints.lean:274`) |
| `finite_criticalPoints_sublevel` (107) | `TauCeti.IsMorse.finite_criticalPoints_inter_preimage_Iic` (`:304`) |
| `exists_scalarRegularLevelData` (117) | `rw [← Module.finrank_self ℝ]`, then `TauCeti.exists_regularFiber_smoothEmbedding` (`RegularValue/ManifoldLevel.lean:257`) |
| `exists_sublevelHomotopyEquiv` (131) | `TauCeti.exists_sublevelHomotopyEquiv` (`Morse/Deformation.lean:213`) |
| `exists_sublevelDeformation` (145) | `TauCeti.exists_sublevelDeformation` (`:199`) |
| `isLocalMin_mem_criticalPoints` (192) | `IsLocalMin.mem_criticalPoints` (`Morse/CriticalPoints.lean:220`) |
| `criticalPoints_nonempty_of_compact` (198) | `TauCeti.criticalPoints_nonempty` (`:229`) |
| `exists_degenerateCriticalLevelDeformation` (204) | `TauCeti.exists_criticalLevelDeformation` (`Morse/Deformation.lean:315`) |
| `exists_noCriticalOpenSublevelDeformation` (219) | `TauCeti.exists_ambientSublevelDeformation` (`:283`) |

**Exact repair.**
1. Delete these ten theorems from `Suggested.lean`, together with `sublevelInclusion` (`:139`), which only `exists_sublevelDeformation` uses.
2. Delete the docstring sentence at `:34–39`.
3. In the README, replace the own-name backticks `exists_scalarRegularLevelData` (`:361`) with the pinned `TauCeti.exists_regularFiber_smoothEmbedding` and `TauCeti.regularLevelChartedSpace`. Otherwise the README names a declaration that `Suggested.lean` no longer has.

The README keeps the pinned names as it does now.

**Tested.** This is the probe above. The repaired scratch file of R01 contains none of these declarations and elaborates.

## R03 (P3) — The minimum-count block and the critical categorical cover restate pinned objects

**Location.** `Suggested.lean:233–282`: `exists_criticalCategoricalCover`, `finiteSmoothCriticalCounts`, `MorseFiniteWitness`, `morseFiniteWitnessOfMorse`, `nonempty_morseFiniteWitness`, `minimumCriticalCount` and `minimumCriticalCount_eq_extended_sInf`.

**Claim.**
- The witness structure, the `Nat.find` minimum and its comparison with the extended infimum rebuild the pinned minimal critical count, which needs no witness.
- The categorical cover is the corollary that README `:975–979` derives from the pinned Lusternik–Schnirelmann theorem.
- Six of the seven names occur nowhere in the README. `nonempty_morseFiniteWitness` occurs only at `:1062`, where the README asks for the pinned object to be constructed.

**Witness.**
- `TauCeti.minCriticalCount` (`Morse/MinCriticalCount.lean:68`) is the ℕ∞ infimum of `TauCeti.totalCriticalCount` over all smooth functions.
- It is attained (`:83`) and finite on compact M (`:115`); README `:1077–1084` says so.
- The cover follows from `lsCategoryCount_univ_le_totalCriticalCount` (`Morse/LusternikSchnirelmann.lean:185`) and `lsCategoryCount_le_iff` (`Topology/Homotopy/LusternikSchnirelmann.lean:287`).

**Exact repair.**
- Delete the seven declarations.
- Rewrite README `:1062–1076` to consume `TauCeti.minCriticalCount`, `TauCeti.exists_totalCriticalCount_eq_minCriticalCount` and `TauCeti.minCriticalCount_ne_top`, with no backticked own name.

**Tested.** The repaired scratch file of R01 omits them and elaborates. Its own names are the eight kept declarations, all of which the README names.

## R04 (P3) — The README reverted to main's legacy shape and restates pinned developments as owned targets

**Location.**
- `README.md:1`: "# Morse functions, sublevel topology and Morse–Bott attachments".
- `:12`: "## Scope, conventions and dependencies".
- `:952–954`: "Here prove the critical-point bound for **every smooth real-valued f** …", against `:972`: "This bound is pinned as `TauCeti.lsCategoryCount_univ_le_totalCriticalCount`".

**Claim.** The README has none of the required headings:
- `# Roadmap:` with `**Summary.**`;
- `## Scope and ownership`, `## Conventions` and `## Exact supplier contracts`;
- `## How to read the build`;
- `## Layer k:` with `### k.n`, `### Examples` and `### Dependencies`;
- `## Downstream consumers` and `## References`.

`*Needs:*` lines occur only in M4.1 (`:1164`, `:1224`, `:1280`, `:1310`).

Pinned work is written as Prove and Construct instructions and then annotated as pinned:
- M1 `:222–243`: the normalized chart and compact finiteness.
- M2 `:339–407`: about 70 lines of section-zero atlas construction for the pinned `TauCeti.regularLevelChartedSpace` (`:311–317`).
- M3 `:789–799`: Morse density.
- M4 `:952–1093`: the Lusternik–Schnirelmann inequality, the deformations, the finite witness and c(M).

This contradicts the README's own `:54–58`, which says the pinned declarations are "consumed by those names and not restated". A reader cannot tell what is owned without reading each paragraph to its end.

**Witness.** The previous head, `git show bcad0bc:TauCetiRoadmap/MorseTheory/README.md`, has the required shape, for example:
- `## Scope and ownership` at `:12` and `## Exact supplier contracts` at `:116`;
- `## How to read the build` at `:470`;
- `## Layer 2: compact-band deformation, handles and cells (M2)` at `:591`;
- `### Dependencies` at `:910` and `## Downstream consumers` at `:1481`.

Its owned-target list is the one at head `:54–58` intends.

**Exact repair.**
- Re-resolve `README.md` to bcad0bc's structure, with the labels M1–M6 kept in the Layer titles as bcad0bc does.
- List the pinned results once, by name and hypotheses, under Scope and ownership and the Tau Ceti supplier contract.
- State in each Layer only the owned targets (the §1.3 chart-change comparison, the §2.1 typed boundary diffeomorphisms, the §2.2–§2.3 comparisons, the §2.4 CW model, the §3.1 laws, the §4.1–§4.4 owned statements, Layer 5, the §6.1 arbitrary-curve forms), each with a `*Needs:*` line.
- Take from this head only text that bcad0bc lacks.

**Tested.** In the previous review, the gate's README checks passed on bcad0bc's README, and every check of that review's 32-row adversarial table held on it.

## R05 (P3) — A consumed declaration the pin does not have, and links to superseded Tau Ceti commits

**Location.**
- `README.md:235–236`: "Consume native `IsMorse.finite_setOf_mfderiv_eq_zero` and `MorseChart.mfderiv_eq_zero_iff` from [PseudoGradient/Existence](…/e8375e4f…/Existence.lean)".
- `:49–50`: "the links cite them at commit e8375e4f, and their declarations are consumed as stated there".

**Claim.** The README consumes a name that does not exist at the pin, and it ties its links to commits other than the pin.

**Witness.**
- `IsMorse.finite_setOf_mfderiv_eq_zero` is declared at Tau Ceti e8375e4f (`Morse/PseudoGradient/Existence.lean:323`) and occurs nowhere at 2fd255d.
- The links at `:44` and `:236` point at e8375e4f. Those at `:302`, `:303`, `:393` and `:432` point at a91d3aaf, the pin the previous review rejected.

**Exact repair.**
- Replace the name with `TauCeti.IsMorse.finite_criticalPoints` (`Morse/CriticalPoints.lean:298`, compact M).
- Point the six links at 2fd255d.
- Reduce `:49–50` to "these files are in the pinned Tau Ceti".

**Tested.**
- `MorseChart.mfderiv_eq_zero_iff` is at 2fd255d (`PseudoGradient/Existence.lean:252`).
- All six linked files exist at 2fd255d: `Morse/Lemma.lean`, `PseudoGradient/Existence.lean`, `VectorBundle/Section/Manifold.lean`, `VectorBundle/Section/SmoothZero.lean`, `Analysis/Calculus/ImplicitFunctionTheorem.lean` and `Boundary/Charts.lean`.

## R06 (P3) — Missing spaces before numerals, and capitalised emphasis

**Location.**
- Missing spaces: `README.md:421` "slot0", `:427`/`:437` "coordinate0", `:459–461` "Dimension0", "boundaryless0-manifolds", "dimension1", "Fin0", `:666` "to1", `:672`/`:687–688` "chart0", "chart1", `:823` "Layer1's", `:1154` "time0" and `:1317` "dimension0".
- References: `:1597`, `:1601–1603` and `:1606` have "Theorem4.1", "Remark1", "France87", "Theorem1(3)", "Corollary1", "Soc.7", "abstract570-28", "p.380", "Lemma1" and "Soc.66".
- Capitals: "SAME" at `:366`, `:389` and `:407`; "POINTS" at `Suggested.lean:315`.

**Claim.** This is house-style prose; the run-together words read as typos.

**Witness.** These are the lines quoted above.

**Exact repair.** Insert the space in each, for example "slot 0", "Theorem 4.1" and "Soc. 66", and write "same" and "points".

**Tested.** Code spans and link targets were stripped from the README, and the rest was searched for a letter followed directly by a digit. Apart from section labels (C2, K7, M1–M6) and the commit hash at `:50`, it finds exactly the README lines listed above. The "Soc." items were read off the References.

## R07 (P3) — Takens' F.(M) is defined for connected manifolds only

**Location.** `README.md:1073–1075`: "This is Takens' F.(M), the minimum over all smooth functions of the number of critical points (Takens 1968, Introduction, p. 198)".

**Claim.** The README defines c(M) on every compact M (`:1062–1063`) and identifies it with F.(M). Takens' definition carries a connectedness hypothesis.

**Witness.**
- Takens's standing hypothesis, on p. 197, is that X is compact and connected (takens-1968 line 69).
- F.(X) is defined on p. 198 as the minimal critical count (lines 79–81).
- For M = S¹⊔S¹ the README's minimum is 2+2 = 4, which lies outside Takens' definition.

**Exact repair.** Write "For connected M this is Takens' F.(M) (Takens 1968, Introduction, pp. 197–198)".

**Tested.** For S¹, which is connected, every function has a maximum and a minimum and the height has two critical points. So c(S¹) = 2 = F.(S¹).

## Verified sound

### Gate, dependency check, elaboration, signatures

- **Gate.** Re-run on this head: every check 0, `OK`. The worker's `gate.md` agrees and records `build=0`. The worktree is clean afterwards.
- **Dependency check.** Output: `depcheck: 233 roadmaps, 2259 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- **Elaboration.** `lake env lean` on `Suggested.lean` at the pins prints 20 `declaration uses sorry` warnings and nothing else.
- **Signatures.**
  - The 30 elaborated types in `signatures.md` were compared with the README. The eight "looks dropped" flags are all on definitions: the three counts, `sublevelInclusion`, `finiteSmoothCriticalCounts`, `MorseFiniteWitness`, `minimumCriticalCount` and `mgradient`. Their bodies need no manifold binder.
  - Every theorem keeps `FiniteDimensional`, `Boundaryless`, `T2Space`, `SecondCountableTopology` and `IsManifold I ∞`.
  - `#check @` of the eight kept declarations in the repaired scratch file gives the same binders.
  - `morse_inequalities` takes `k : Type u_3`, M's universe, as README `:856–857` says.
  - `nonempty_homeomorph_sphere_of_two_euclidean_opens` carries only `T2Space`, `CompactSpace` and `0 < m`, as README `:1248–1249` says.
- **Padding.** The probe closes ten theorems (R02). The rest cannot be closed in one step:
  - `exists_cwComplex_homotopyEquiv`, `morse_inequalities`, the three M4.1 theorems and the two M6 theorems have no pinned proof;
  - the seven R03 declarations need more than one lemma.
- **Not proved at 2fd255d, checked by grep and in `Morse/`:**
  - the polynomial identity for a Morse function (`Morse/Inequalities.lean` has only the alternating inequalities and Euler's equality, `:393–429`);
  - the global CW model;
  - `exists_twoEuclideanOpenCover_of_two_criticalPoints`;
  - any degenerate two-critical-point theorem;
  - arbitrary-curve forms of the M6 theorems;
  - a Betti number (the only Betti definition is `firstBetti` of a dual graph).
- **Headlines.**
  - Stated: the CW model, the polynomial strong inequalities, the two-critical-point sphere theorem with its two inputs, and compact-trapped convergence with exponential decay.
  - Docstring, consumed: the Lusternik–Schnirelmann inequality, Morse density, proper Morse existence and Reeb.
  - Docstring, not stated: handle attachment, as a long encoding.
  - Docstring, not statable: M5. 2fd255d has no Morse–Bott predicate; `Morse/` has no `Bott` directory.

### Library declarations opened (Tau Ceti 2fd255d, Mathlib 1b1ccf4)

- **`Morse/CriticalPoints.lean`**:
  - `:87`, `:213`, `:220`, `:229`, `:274`, `:298`, `:304`, `:342` and `:348`;
  - `IsMorse.criticalCount_neg` at `:426`, with j ≤ dim E as README `:1351–1353` says.
- **`Morse/Deformation.lean`**: `:199`, `:213`, `:283` and `:315`, with section variables `:83–86`. `T2Space` and `Boundaryless` hold, compactness of M is not assumed, and `a ≤ b`, as README `:502–505` and `:1039–1044` say.
- **`Morse/NormalizedChart.lean:196`**: f smooth near x, Euclidean target and the ±1 weights, as README `:228–232` says.
- **`RegularValue/ManifoldLevel.lean:257`**: no separation or countability hypothesis, as README `:317–325` says.
- **`Morse/MinCriticalCount.lean:68`, `:83` and `:115`.**
- **`Morse/LusternikSchnirelmann.lean:185`**: section variables `:82`. This is the seeded statement's pinned form.
- **`Topology/Homotopy/LusternikSchnirelmann.lean:287`** (`lsCategoryCount_le_iff`) and **`:454`** (`lsCategoryCount_eq_sum_inter`).
- **`Topology/Order/Sublevel.lean:124`**: `sublevelInclusion` via `ContinuousMap.inclusion`.
- **`Riemannian/Gradient/Basic.lean:73`**, together with Mathlib `mvfderiv` (`MFDeriv/NormedSpace.lean:608`).
- **`Analysis/InnerProductSpace/Hemisphere.lean:377`**: `TauCeti.nonempty_homeomorph_sphere_of_union_closedBall`.
- **`Morse/RelCWComplex.lean:298`** and **`Morse/Exhaustion.lean:110`**: the §2.4 route inputs.
- **`Morse/GradientFlow.lean:261` and `:282`**, and **`Morse/ExponentialConvergence.lean:303`**: the §6.1 route inputs.
- **Mathlib `Manifold.riemannianEDist_le_pathELength`**: bounds the distance on [0,T] by the length of the C¹ trajectory. This is used in row 8.

### Cross-roadmap citations, resolved on main 4820485

- **AlgebraicTopology:**
  - `#stage-6-cohomology-products-and-manifold-duality`, the heading at `:946`;
  - `relativeCWPushout`, `relativeCWPushoutCWModel`, `homotopyPushoutGluingComparison`, `cofibrationTowerHomotopyEquivalence`, `cwSubcomplexTowerUnion`, `diskBoundaryRelCW`, `lsCupLength`, `normalizedLSCategory`, `LSCategoricalCover` and `lsCategoryCount`, each found in its README.
- **GeometricTopology:**
  - §2.2 (`:1357–1365`): for n ≥ 1 and a bicollared sphere, closure ≃ Dⁿ restricting to the parametrization;
  - the anchor `#22-the-generalized-schoenflies-theorem` resolves.
- **ComplexManifolds:** Milestone 1 (`:172`), anchor matches.
- **DifferentialGeometry:** Layers 3 (`:371`), 5 (`:503`, anchor `#layer-5-integration-and-stokes-theorem`), 10 (`:877`) and 12 (`:910`), with items 5.1 (`:507`), 12.2 (`:918`) and 12.3 (`:920`).
- **CharacteristicClasses:** C2 (`:728`).
- **ComplexKahlerGeometry:** K7 (`:1405`).
- **DGFloer:** Layer 1 item 3, `SpectralObject` (`:622–624`).
- **HeegaardFloer:** Lane M (`:70`).
- **ConvexityToric:** T2 (`:73`).
- **RiemannianGeometry:** R3 (`:89–120`).
- **AffineMorseLefschetz:** consumes M1–M4 (`:130`).
- None of these is on the forbidden list.

### Overlaps and ownership

- **Dropped ids.** `scratch/overlaps.md` lists AlgebraicTopology `#stage-6-…` (dropped by #1652) and ComplexKahlerGeometry `#k7-…` (dropped by #1234, #1807, #1808 and #1854). Each revision maps the old id:
  - #1652 README `:863`: a table row from the Stage 6 anchor to Layer 6;
  - #1234 `:365–366`: "K7 is now Layer 7";
  - #1807 `:555`: the anchor and K7.1 and K7.2 map to Layer 7, 7.1 and 7.2;
  - #1808 `:571`;
  - #1854 `:542`: an anchor row.

  So the citations stay valid; this is not a finding.
- **Other pull requests.** None changes this roadmap.
- **Second owners.** `roadmaps grep` over main and every open head for "exactly two critical points", "two-open-cell", "strong Morse inequalit", "compact-trapped", "one cell of dimension" and "cell per critical point" finds:
  - AffineMorseLefschetz as a consumer;
  - DGFloer (#1798) only in an example;
  - no second owner.
- **Name clashes.** No other `Suggested.lean` declares a name in `TauCetiRoadmap.MorseTheory`.
- **Not read directly.** ManifoldOptimization (#1506) and MorseNovikov (#1161) are listed as closest in vocabulary. Their files are not in this brief, so they were covered only by the greps above.

### Seeded sample: "Arbitrary-function Lusternik–Schnirelmann inequality" (README `:949–1114`)

- **Weber, Theorem 1.1, p. 2.**
  - weber-conley lines 65–67: f of class C² on a closed manifold has at least cat(M) critical points.
  - cat(M) is the least ℓ ≥ 1 for an open cover by sets nullhomotopic in M (lines 62–63, footnote line 75).
  - The finite-cover proof by thickened stable manifolds is on pp. 2–3 (lines 73–106).
  - The README's hypotheses (smooth, compact, boundaryless) are within Weber's. Its "unnormalized count for nonempty M; empty case 0 ≤ 0" matches Weber's ℓ ≥ 1 convention.
- **Takens, Introduction, p. 198**, read from GDZ (open repository; the OCR text, takens-1968).
  - Lines 91–92 attribute F.(X) ≥ L.S.(X) for closed X to Lusternik–Schnirelmann.
  - Lines 94–96 define L.S.(X) by open covers by sets contractible in X.
  - Both are as README `:962–965` says.
  - Connectedness: see R07.
- **Pinned form.** `lsCategoryCount_univ_le_totalCriticalCount` needs smooth f on a compact Hausdorff boundaryless manifold, with no nondegeneracy, as README `:972–975` says.
- **Other locators, re-checked against the line-numbered texts** (printed page = PDF page − 13 for cohen-iga-norbury):
  - Cohen–Iga–Norbury Theorem 4.6 (line 1022, p. 27);
  - Theorem 5.3 (line 1322, p. 36);
  - Corollary 5.4 (line 1423, p. 38);
  - Theorem 5.7 (line 1519, p. 40);
  - Corollary 5.11 (line 1569, p. 42);
  - Application 5.13 (line 1617, p. 43: closed Mⁿ, Morse function with two critical points, homeomorphic to Sⁿ).

### Adversarial table

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | LS inequality (seeded; pinned) | S¹; T²; RP² over 𝔽₂ and ℚ; S¹⊔S¹; ∅; point; constant on S¹ | crit ≥ cat ≥ cup+1: 2≥2≥2; 4≥3≥3; 3≥3≥3 and 3≥3≥1; 4=4, normalized 1+1=2≠3; 0≤0 but 0+1≤0 false; 1≥1≥1; ⊤≥2 | true; the cup bound needs M nonempty, as stated | R07 (locator) |
| 2 | `exists_cwComplex_homotopyEquiv` | S² height; x² on ℝ; ∅; ℕ with f(n)=n; f=x on ℝ; f=eˣ on ℝ | cells (1,0,1) vs indices {0,2}; one 0-cell; empty; ℵ₀ 0-cells; f=x is proper but unbounded below, with no critical points, would give an empty X ≄ ℝ; eˣ is bounded below but not proper, same | true; properness and the lower bound are both needed | R01 (carrier) |
| 3 | `morse_inequalities` | RP² over ℚ and 𝔽₂; S²; T² height; 3 points (m=0); ∅; j>dim | (1,1,1)=(1,0,0)+coeff((1+t)t)=(0,1,1); Q=0 over 𝔽₂; (1,0,1)=(1,0,1); (1,2,1)=(1,2,1); 3=3; 0=0; c_j=b_j=0 forces q_m=0 | true | R01 (carrier) |
| 4 | §4.1 strong vs weak | c=(2,0,0,2), b=(1,0,0,1) | weak ok; alternating sums 0=0; S₁: −2 ≥ −1 false | the Check excludes the weak-only model | none |
| 5 | `exists_twoEuclideanOpenCover_of_two_criticalPoints` | m=0 with 2 points and 1 point; S¹ height; h−h³/3; h²; S²⊔S² | U={x}, V={y} ≃ Fin 0→ℝ; count 1≠2; η²=3/4, T>8/3; count 2, Hessians 0; count 4 (m=1), ⊤ (m≥2); count ≥4 | true | R01 (carrier) |
| 6 | `nonempty_homeomorph_sphere_of_two_euclidean_opens` | point, m=0; ℝ^m; Sᵐ minus poles; RP² | 1 point ≠ S⁰ (excluded by 0<m); not compact; caps glue to Sᵐ; cat(RP²)=3 > 2, so no such cover | true | none |
| 7 | `nonempty_homeomorph_sphere_of_two_criticalPoints` | Sᵐ height; m=0, M={x,y}; f=h−h³/3 | Sᵐ; S⁰={±1}⊂ℝ¹; f=2/3−r⁴/4+O(r⁶) at the pole, critical set the poles only | true; the proof term composes rows 5 and 6 | R01 (carrier) |
| 8 | `exists_edist_le_exp_of_tendsto_neg_mgradient` | Sᵐ height; x⁴; x²−y²; x² with metric 4dx²; equilibrium | u′=−sin u, c=1; x=(x₀⁻²+8t)^(−1/2) not exponential (excluded by Morse); c=2; 2\|x₀\|e^(−t/2); C=0; on [0,T] distance ≤ length of the C¹ curve < ∞ | true | R01 (carrier) |
| 9 | `tendsto_of_isMIntegralCurveOn_neg_mgradient` | x², K=[−\|x₀\|,\|x₀\|]; f=x; λ=x⁻² metric; e^(−x) | x₀e^(−2t)→0∈K; untrapped; x₀/(1+x₀t)→0 regular (smooth metric needed); log(e^(x₀)+t) untrapped | true | R01 (carrier) |
| 10 | §6.1 endpoint | γ=x₀e^(−2t) on t≥0, x₀ on t<0 | right derivative −2x₀ = −grad f(x₀), left derivative 0; Γ(s)=x₀e^(−2(1+s))=γ(1+s) for s≥−1 | the route is needed and correct | none |
| 11 | `bettiNumber` | point; RP², j=1; discrete ℕ; S¹ vs ℝ²∖0; disc | (1,0,…); 0 over ℚ, 1 over 𝔽₂; finrank of ⊕ℕ k is 0 (junk, as the API says); 1=1; 0 | matches the API and Checks | none |
| 12 | R01 carriers | copies vs pinned | criticalPoints body identical; criticalCount set-builder variant (defeq); mgradient: `rieszDual x (mfderiv …)` vs `rieszDual x (mvfderiv …)`, mvfderiv = fromTangentSpace∘L mfderiv | README `:1449` "same body" is false | R01 |
| 13 | Probe, ten restatements | the ten declarations of R02 | each `sorry` replaced by one `exact` of the pinned lemma; 0 errors; 10 fewer `sorry` warnings (20 → 10) | padding | R02 |
| 14 | `exists_scalarRegularLevelData` | f(x,y)=x, c=0; dim 0 | level ≅ ℝ, range span(e₂) = ker df; level empty, model Fin 0; finrank ℝ ℝ = 1 rewrites the pinned model `Fin (dim E − dim F)` | true, pinned | R02 |
| 15 | min-count block vs `TauCeti.minCriticalCount` | ∅; S²; S¹ | 0 = 0 (`minCriticalCount_of_isEmpty`); height count 2 ≥ cat 2, so 2; 2 | same object | R03 |
| 16 | M1 seminorm comparison | τ(y)=y/2, K=[−2,2], g=x²; reverse y=2x | g∘τ sups (1,1,1/2) vs g sups (1,2,2): C=1; reverse 4x² sups (4,8,8) vs (4,4,2), and 2^k in general | true | none |
| 17 | complementary index | x²; 0; −x²+y² | 0+1=1; 0+0≠1; 1+1=2 | needs nondegeneracy, as stated | none |
| 18 | double-well acceptance | (x²−1)², c=1, ε=1/2 | 1−x²(2−x²)=(x²−1)²; x²=1−1/√2, α±(1)=±0.5412, f=1/2; {f≤1/2} = ±[0.5412,1.3066], two components | consistent | none |
| 19 | RP² top cell | f=(y²+2z²)/(x²+y²+z²), chart z=1 | 2−f=(2a²+b²)/(1+a²+b²); coordinates (√2a,b)/√(1+a²+b²); boundary degree ±2 | consistent | none |
| 20 | pseudo-gradient normalization | x², z=√2x; −u²+v² | x′=−x, df(X)=−2x²; Euclidean −2x reads z′=−2z; metric 2dx² gives −x; (−z₁,−z₂): df=z₁²−z₂²>0 on z₂=0 | consistent | none |
| 21 | Brown m=1 collar | b(+1,t)=εt/(1+\|t\|), b(−1,t)=π−εt/(1+\|t\|) | t>0: angles in (0,ε) ∪ (π−ε,π), both in the upper arc | consistent with README `:1241–1245` | none |
| 22 | two-open-cell route | b(θ,s)=(r+ηs/(1+\|s\|))θ | s/(1+\|s\|) is a bijection ℝ→(−1,1), image {r−η<\|u\|<r+η} ⊂ V; X∖D=∅ would make U compact | true | none |
| 23 | R05 name | `IsMorse.finite_setOf_mfderiv_eq_zero` | e8375e4f `Existence.lean:323` present; 2fd255d absent | stale | R05 |
| 24 | R07 identification | S¹⊔S¹ | README c = 4; takens-1968 line 69 requires connected X | locator hypothesis dropped | R07 |

## Not verifiable

- **lee-smooth-manifolds, milnor-1963, hirsch-differential-topology.** The manifest settles them as uncertified. They are cited by locator only and were not read. This covers Lee Corollary 5.14 and Proposition 5.38; Milnor 1963 Theorems 3.1, 3.5 and 4.1, Lemma 3.6, Corollary 6.7 and Remark 1; and Hirsch Chapter 2 §1 and Chapter 6 Theorem 1.2.
- **Rosen 1960** (Notices Amer. Math. Soc. 7, abstract 570-28, p. 380, Lemma 1; README `:1602–1603`). It is not in the package's `sources.toml`. No statement rests on it alone, since Milnor 1959 and Brown carry M4.1, so it was not requested.
- **Takens 1968.** It was read from GDZ, but it is not recorded in the package's `sources.toml`. That is a manifest entry for the worker to add, not a README change.
- **Overlaps with ManifoldOptimization (#1506) and MorseNovikov (#1161).** The brief gives no files for them, so ownership against them was checked only by `roadmaps grep`.

## Source issues

- **Misprint** in weber-conley at footnote 3, p. 3: the source says the half-line `[0,∞)` for `f(u)=u³` is `W^u(0)`, while calling it the stable manifold; it should be `W^s(0)`; affects nothing.
