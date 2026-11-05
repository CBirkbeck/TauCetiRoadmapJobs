# Review of DGFloer (pull request #1798 at 1d67227)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/DGFloer/` at 1d67227 (README 3313 lines, Suggested.lean 173 lines, 8 declarations). The pull request changes nothing outside the folder (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DGFloer'` is empty). The worker's gate passes every check (build=0, sorry-data=0, depcheck=0, blob=0, tex=0, stray-files=0). The dependency check rerun this round reports no problem. One P2 and four P3 findings.

## Previous review (PRREVIEW-DGFloer~11), finding by finding

- **R01 (`I` token, parse failure): repaired.** `Suggested.lean:57` reads `open scoped unitInterval ContDiff`; `:169` declares `(I₀ : ModelWithCorners ℝ E H)`. The file builds (gate build=0; my elaboration below prints all eight `#check` types).
- **R02 (torus criterion lost its Lie binders): repaired.** The theorem at `:167–170` carries `I₀`, `[ChartedSpace H G]`, `[LieGroup I₀ ∞ G]`, `[CompactSpace G]`, `[ConnectedSpace G]` in its own signature; the elaborated type (worker's record and my `#check`) begins `∀ {E H G} … (I₀ : ModelWithCorners ℝ E H) … [LieGroup I₀ ↑⊤ G] [CompactSpace G] [ConnectedSpace G]`. The README Check at `:3078–3081` records the `ℕ → S¹` counterexample.
- **R03 (degree-one Hurewicz had no owner): repaired.** `README.md:547–553`: "Consume AlgebraicTopology Stage 8.3's Hurewicz map … Prove that for a path-connected space `h` is surjective with kernel the commutator subgroup". `AlgebraicTopology/README.md:1688–1689` on main: "DGFloer Layer 1 item 1 owns the theorem that this exact map is an isomorphism"; its 8.10 row still consumes DGFloer Layer 1 items 1 and 4. Consistent.
- **R04 (sorry'd data): repaired.** `gradingInvolution` (`:105–109`) has the decomposition body; the Moore-path prototype is gone (no `MoorePath` in the file); gate sorry-data=0.
- **R05 (ImplicitAtlases upward): repaired.** Zero occurrences of `ImplicitAtlases` in the README; the virtual comparison is listed under "Out of scope" (`:123–125`); the dependency check reports no UPWARD line.
- **R06 (phantom `serreFibrations`): repaired.** Zero occurrences of `serreFibrations`; Layer 1 item 2 (`:585–606`) defines the Serre-fibration predicate as a target with Hatcher locators, and the supplier contracts (`:327–329`) say the predicate is not at the pins. Rechecked: no `serreFibration`, `SerreFibration` or `HasHomotopyLifting` in the pinned Tau Ceti or Mathlib.
- **R07 (flux and suspension restated): repaired.** The F0–F4 and S0–S2 paragraphs are gone; the ownership table (`:78–80`) names SymplecticGeometry S0–S2, TaubesGromov (as a consumer of SymplecticGeometry, not of this roadmap) and HamiltonianReduction R1a.0–R1a.4 as owners; 7.T.1 instantiates S0 at `φ = f⁻¹` (`:2439`), 7.T.9 consumes R1a.2 (`:2661`). Both resolve on main (below).
- **R08 (capacity bullets for `Sⁿ`, `SU(2)`): repaired.** No acceptance-criteria section remains; `:2952–2957` states that this roadmap proves nothing about `c°_HZ(D*S²)` and why (`j_!` has degree `−n`).
- **R09 (Hutchings page ranges): repaired.** Hutchings is cited only for §§7.5–7.6 and 8.2 at the 7.T targets (`:2548, 2614, 3234, 3310`); the cached notes have §7.5 at p. 52, §7.6 at p. 55, §8.2 at p. 58 (hutchings-morse-notes lines 81–85, 1711, 1795). Layer 7.C cites Salamon §§1.4, 2.4–2.7, 3.1–3.7 (all present in the cached table of contents, salamon-lectures lines 17–35).
- **R10 (blob links, LaTeX, dangling "5.7"): repaired.** Gate blob=0 and tex=0; the only `github.com` link is the provenance repository (`:3239`); "5.7" now occurs only as "Lemma 5.7" (`:2926, 3215`).
- **R11 (padding): repaired.** `isAspherical_torus`, `not_isAspherical_SO3`, `IsDegenerate.prod_left/right` and `twistedDifferential_single` are deleted; 8 declarations remain.
- **R12 (shape, docstring inventory, manifest): repaired.** Counts: 117 `*Needs:*` lines, 86 `**Checks.**` blocks, 12 `### Examples`, 12 `### Dependencies`, the house headings present (`Scope and ownership`, `Conventions`, `Exact supplier contracts`, `How to read the build`, `Downstream consumers`, `Worked examples`, `References`). The module docstring (`Suggested.lean:7–44`) names nine unstatable headlines with the carrier each lacks. The manifest `sources.toml` lives in the board package (no roadmap folder on main carries one).

## R01 (P2) — The standing Conley–Zehnder witness has the wrong sign

**Location:** `TauCetiRoadmap/DGFloer/README.md:1755–1757`: "On `ℝ²` with `H = (q² + p²)/2 · ε` … the constant orbit at `0` has `CZ = −1` … since `CZ = ind_Morse − n` …; replacing `H` by `−H` gives `CZ = +1`."

**Claim:** in the standing convention (`ι_{X_H} ω = dH`, `CZ = −μ_RS` from HeegaardFloer F1.4), the minimum of a small Morse Hamiltonian has `CZ = ind − n`.

**Witness:** `ι_X(dq ∧ dp) = dH` gives `X_H = p ∂_q − q ∂_p` (the roadmap's own 7.C.1(i) Check, `:1921–1922`), whose linearized flow is the clockwise rotation `e^{−tJ}`, `S = −εI`; `μ_RS = ½ sign S = −1`, so `CZ = −μ_RS = +1`. `HeegaardFloer/README.md:2239–2245` on main states exactly this instance: "For the Hamiltonian convention `ι_(X_H)ω=dH` used by DGFloer this gives `CZ = n − ind_Morse(H)` … Check `ω=dx∧dy`, `H=ε(x²+y²)/2` … `S=−εI` and `CZ=+1`." The roadmap's 7.C.0 Check (`:1867–1871`) agrees with the supplier: `μ_H = ind_H − n = −CZ_HF`, hence `CZ_HF(min) = n − ind = +1`. The two Checks of this roadmap on the same object therefore contradict each other, and the 7.1 one contradicts the supplier. The normalization `FH_*(H) ≅ H_{*+n}(X)` itself is unaffected: with degree `n − ind_H` and the standing upward-`H` differential (`𝒜_H` decreasing along `s`), the complex is the Morse complex of `−H` in degree `ind_{−H} − n`, which computes `H_{*+n}(X)`.

**Exact repair:** replace the Check by "`CZ = +1`, since `CZ = n − ind_Morse` with `ind_Morse = 0`, `n = 1`; replacing `H` by `−H` gives `CZ = −1`", and in the same item replace "`CZ = ind_Morse − n`" wherever the standing formula is stated by `CZ = n − ind_Morse = ind_Morse(−H) − n`, as HeegaardFloer F1.4 writes it. Tested on the 7.C.0 overlap identity `CZ_HF(H∨, reflected cap) = −CZ_HF(H, cap) = μ_H`: with `CZ_HF(H∨, x) = n − ind_{H∨}(x) = ind_H(x) − n = μ_H(x)` the identity holds; with the current 7.1 formula it fails at the minimum of `S²` (`−1` against `+1`).

## R02 (P3) — The 8.6 Check instantiates the standing comparison on a non-aspherical target

**Location:** `TauCetiRoadmap/DGFloer/README.md:2771–2773`: "on `X = S²` with the small Morse Hamiltonian the generators have Conley–Zehnder indices `−1` and `+1` and the comparison sends them to `H₀` and `H₂`."

**Claim:** `S²` is an instance of Theorem 3.37's comparison `FH_*(X; 𝓕) ≅ H_{*+n}(X; i_X^*𝓕)`.

**Witness:** Theorem 3.37 (bdho-cotangent line 2617) assumes `X` closed symplectically atoroidal; `S²` has `∫_{S²} ω ≠ 0`. The roadmap's own 7.4 Check (`:1814–1815`) says so: "`S²` is not aspherical and is not an instance: it is the capped branch's monotone example". The 8.6 Check contradicts it.

**Exact repair:** replace the instance by `X = T²` (`n = 1`): the four constant orbits of the height function have degrees `−1, 0, 0, 1` and the comparison sends them to `H₀(T²)`, `H₁(T²)` (rank 2) and `H₂(T²)`, as the 7.4 Check already records; keep `S²` only as the capped branch's `ℤ/4`-graded example of 7.C.5b.

## R03 (P3) — Corollary 2.13 is stated without the hypothesis that makes `[E]` exist

**Location:** `TauCetiRoadmap/DGFloer/README.md:1544–1547`: "the source's Corollary 2.13: if `σ_*[F] ≠ 0` then `σ_*[E]` lives over the fundamental class, using oriented classes or their orientation-twisted replacements".

**Claim:** the corollary holds for a map of Hurewicz fibrations over a closed orientable base.

**Witness:** bdho-cotangent lines 1237–1239: "if `E` is a finite dimensional closed orientable manifold and if `σ : F → F′` satisfies `σ_*[F] ≠ 0`, then `σ_*[E]` lives over the fundamental class". The README's sentence names neither that `E` is a closed orientable manifold nor that `F` is one (so that `[F]` exists); a total space over a closed manifold need not be a manifold (the path-loop fibration over `S²`, whose total space is contractible, has no `[E]`).

**Exact repair:** state the hypotheses: "for a fibration map `σ : E → E′` over `Y` with `E` a closed orientable manifold (so `j_![E] = [F]` by Remark 2.10) and `σ_*[F] ≠ 0`, the class `σ_*[E]` lives over the fundamental class in `E′ → Y`"; the orientation-twisted variant replaces `[E]` and `[F]` by their twisted top classes with the same hypothesis on `E`.

## R04 (P3) — Lemma 3.41 is statable at the pins but neither stated nor named in the docstring

**Location:** `TauCetiRoadmap/DGFloer/README.md:2972–2973` ("Prove that `Ω²Q` has the homology of a point if and only if `Q` is a `K(π, 1)` (Lemma 3.41)"); `TauCetiRoadmap/DGFloer/Suggested.lean:7–44` (the docstring's inventory).

**Claim:** the docstring lists every headline that is statable at the pins and every one that is not, with its missing carrier.

**Witness:** Mathlib at f6090c7 has `LoopSpace X x` as `Path x x` with the compact-open topology (`Mathlib/Topology/Homotopy/HomotopyGroup.lean:86`, `Mathlib/Topology/Path.lean`), so `Ω²Q = LoopSpace (LoopSpace Q q) (Path.refl q)` is a topological space, and `AlgebraicTopology.singularHomologyFunctor` (`SingularHomology/Basic.lean:52`) gives its integral homology; Tau Ceti at 358314d has `TauCeti.IsAspherical` (`EilenbergMacLane/Basic.lean:59`). The statement `IsAspherical Q q ↔ (PathConnectedSpace (Ω²Q) ∧ ∀ n ≥ 1, Subsingleton H_n(Ω²Q; ℤ))` for a path-connected `Q` is therefore statable, and it is the one result of Layer 10 the file could test; the docstring names it neither among the stated nor among the unstatable headlines (the previous review's inventory recorded it as not statable, which the pinned `LoopSpace` refutes).

**Exact repair:** either state Lemma 3.41 in the Layer 10 section of `Suggested.lean` on the carriers above (with `sorry`), or add it to the docstring's "not statable" list with the carrier the author considers missing (the Moore double loop space, if the fixed-interval model is not wanted); the README keeps 10.4 unchanged.

## R05 (P3) — The mod-2 vanishing theorem is stated at universe `0` only

**Location:** `TauCetiRoadmap/DGFloer/Suggested.lean:69–73`: `(Y : TopCat.{0})` and `ModuleCat.{0} ℤ`.

**Claim:** the Lean statement has the README's generality (`:905–906`: "For a simply connected space `Y` …"; conventions `:260–262`: "Spaces, modules and bases live in arbitrary universes").

**Witness:** `singularHomologyFunctor` is universe-polymorphic (`C ⥤ TopCat.{w} ⥤ C`, `SingularHomology/Basic.lean:52`), so nothing at the pin forces `w = 0`; the stated theorem does not apply to a space in `Type 1`.

**Exact repair:** state it for `Y : TopCat.{u}` with coefficients in `ModuleCat.{u} ℤ` and the coefficient object `ModuleCat.of ℤ (ULift.{u} (ZMod 2))`, as the conventions prescribe (transport along `ULift`); or, if universe `0` is intended, say so in the README's statement of the theorem.

## Verified sound

**Scope.** Every passage of README.md (3313 lines) and Suggested.lean (173 lines) was read; the change set since ade115a (4505 lines) was reviewed as a whole, not incrementally. Diff outside the folder: none.

**Gate and dependency check.** Worker's gate at 1d67227: every counter 0, OK. Rerun this round:

```text
depcheck: 233 roadmaps, 2222 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**Elaboration.** A scratch copy of Suggested.lean (same `module` header and imports) with `#check @name` for all 8 declarations and the four sorried theorems replaced by one-tactic probes, run with `lake env lean` from the worktree root:

| Declaration | `#check` type agrees with worker's record | Probe | Result |
|---|---|---|---|
| `bijective_sq_homotopyGroup_of_mod_two_acyclic` | yes | `simp [Function.Bijective]` | goal left open (injective ∧ surjective) |
| `twistedDifferential_mem_totalGrading` | yes | `simp [twistedDifferential, totalGrading]` | goal left open (membership of the sum) |
| `twistedDifferential_sq` | yes | `simp [twistedDifferential]` | goal left open (the double sum) |
| `isAspherical_iff_exists_continuousMulEquiv_torus` | yes | `simp [TauCeti.IsAspherical]` | no progress (`IsAspherical` is not exposed) |
| `TwistingCocycle`, `gradingInvolution`, `totalGrading`, `twistedDifferential` | yes | — | real bodies; `twistedDifferential` keeps `[SMulCommClass R Aᵐᵒᵖ M]` in its signature |

No declaration is padding by the one-tactic test; none restates a definition or mirrors a README Check (the four Checks of 4.1–4.2 are prose only). Section binders: every instance in the four elaborated theorem types is used by the type (`IsDGRightModule` carries `IsScalarTower`, `GradedSMul`, `Decomposition`); the torus criterion carries its Lie-group instance explicitly. No `set_option`, no `lemma`, no `#eval`; a single `public import Mathlib` plus two `TauCeti.*` modules that exist at the pin.

**Pinned declarations opened** (Mathlib f6090c7, Tau Ceti 358314d; the PR worktree and the content checkout pin the same revisions):

| Declaration | File at the pin | Checked |
|---|---|---|
| `singularHomologyFunctor` | `Mathlib/AlgebraicTopology/SingularHomology/Basic.lean:52` | `C ⥤ TopCat.{w} ⥤ C`, coefficients an object of `C` (R05) |
| `HomotopyGroup.group`, `commGroup` | `Mathlib/Topology/Homotopy/HomotopyGroup.lean:547, 603` | group for `n+1`, commutative for `n+2` |
| `LoopSpace` | same file `:86` | `Path x x` with its topology (R04) |
| `IsFirstQuadrant`, `coreE₂Cohomological`, `spectralObjectMappingCone`, `EInt` | `SpectralObject/SpectralSequence.lean`, `SpectralObject/FirstPage.lean`, `HomotopyCategory/SpectralObject.lean`, `Order/WithBotTop.lean` | present; the 1.3 index bridge `(a, b) = (1 − 2p − q, p − 1)` matches `coreE₂Cohomological` (`deg = p+q`, `i₁ = q`, `i₂ = q+1`, `r₀ = 2`) |
| `Monotone.ae_differentiableAt` | `Mathlib/Analysis/Calculus/Monotone.lean:209` | file as cited |
| `DirectSum.lmap`, `decomposeLinearEquiv`, `Int.negOnePow`, `specialOrthogonalGroup`, `SimplyConnectedSpace`, `IsCoveringMap`, `ContinuousMulEquiv`, `LieGroup`, `Circle` | present | as cited |
| `TauCeti.IsAspherical`, `IsEilenbergMacLaneSpaceOne` | `TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean:59` | `PathConnectedSpace ∧ ∀ n, Subsingleton (π_(n+2) X x)`, no Hausdorff or CW condition, as the README says |
| `IsDGAlgebra`, `IsDGRightModule`, `DGRightModuleCat`, `DGAlgHom` | `DG/Algebra/Defs.lean`, `DG/Module/Right/Defs.lean`, `DG/Module/Right/Category.lean:44`, `DG/Algebra/Hom/Basic.lean:50` | present in `TauCeti/Algebra/Homology/DG/` as cited |
| `InternalGrading.ofDecomposition` | `TauCeti/Algebra/Module/GradedModule/Internal.lean` | present |
| `pathLoopSpaceMulEquiv` | `TauCeti/Topology/Homotopy/HomotopyGroup/LoopSpace.lean:361` | `π_(m+1)(Ω X, refl) ≃* π_(m+2)(X)`, as cited |
| `LocalCoefficientSystem`, twisted singular chains | `TauCeti/AlgebraicTopology/LocalCoefficient.lean`, `Singular/Twisted/` | present |
| `cotangentSymplecticForm_apply`, `cotangentLiouvilleForm`, `SymplecticForm`, `SmoothAlmostComplexStructure`, `IsPseudoholomorphicAt`, `SmoothTwoForm` | `Symplectic/Cotangent/Basic.lean`, `Cotangent/Graph.lean`, `Symplectic/AlmostComplex.lean:343`, `Symplectic/Manifold/TwoForm.lean`, `Manifold/JHolomorphic.lean`, `Manifold/TwoForm/Basic.lean` | present |
| `IsMorse.nonempty_morseChart`, Morse index, Sard | `Geometry/Manifold/Morse/Lemma.lean`, `Morse/Index.lean`, `Analysis/Calculus/Sard/` | present |
| Serre fibrations, `TwistingCocycle`, `HurewiczOne`, `isAspherical_iff_double_singularHomology`, `IsLiouvilleDomain`, `loopChainAlgebra`, `cwApproximationMap` | none at 358314d | absent, as the supplier contracts state; the STATUS.md progress postdates the pin, so no `Suggested.lean` declaration duplicates a native one |

**Cross-roadmap citations resolved** (main at 3b51055, open heads as the brief lists them):

| Citation | Resolved | Result |
|---|---|---|
| AlgebraicTopology 8.3 Hurewicz map; 8.10, 8.8/8.8a, 4.5 (`k(B × B)`, open neighbourhoods), 5.5 (`arbitraryCWSerreSpectralSequence`), Stage 3 open excision, 8.11b (Layer 2 item 3 loop comparison) | `AlgebraicTopology/README.md:1684–1693, 2106–2112, 1831–1848, 760–770, 915–922, 471` | all present; AT consumes DGFloer 1.1, 1.2, 1.3, 1.4, 2.3 and supplies 8.3's map |
| GeneralizedCohomology G2.10 (`IsHurewiczFibration`, `MappingPathSpace`, `mappingPathFiberConstHomeomorphPath/LoopSpace`), G5, G2.1 | `GeneralizedCohomology/README.md:535–568, 2214–2224, 231` | present; G2.10 and G5 consume DGFloer 1.2 |
| CharacteristicClasses `connectedMapHomologyComparison`, Serre membership, C3.2 | `CharacteristicClasses/README.md:71–78, 379–383, 612, 1177` | consumer of 1.2; C3.2 is the topological `c₁` |
| MorseNovikov N1, N4 (names N1–N7 kept, `:176`), N6 not consumed | `MorseNovikov/README.md:184–349, 176, 1414` | present; MN consumes DGFloer 1.1 |
| MorseTheory M1–M6, M4's `c(M)`, M5 consumer of 1.3 | `MorseTheory/README.md:110–895, 592, 885` | present |
| RiemannianGeometry R2, R3, R3.2 broken geodesics | `RiemannianGeometry/README.md:300, 347, 431–460` | present; RG cites DGFloer as owner of the closed-loop carrier |
| SmoothBundlesConnections B6.0 | `SmoothBundlesConnections/README.md:1306–1328` | normal-radius and strong-convexity bounds, as consumed |
| SymplecticGeometry S0 | `SymplecticGeometry/README.md:84–86` | mapping torus for any symplectomorphism |
| HamiltonianReduction R1a.2 | `SymplecticGeometry/HamiltonianReduction/README.md:97–103` | `Symp₀` in the compact-open `C^∞` topology, endpoints of smooth symplectic paths |
| HeegaardFloer Lane M (M.1–M.5), F0.0, F1.1–F1.5, F2.1, F2.2a–c, F2.6a–d | `HeegaardFloer/README.md:293–460, 1376, 2058–2364, 2475, 2630–2782, 3007` | present; F1.4 (`:2239–2245`) fixes `CZ = −μ_RS` and the value used in R01 |
| DGAInfinity Layers 1, 4, 5 | `DGAInfinity/README.md:293, 394, 431` | DG modules, Maurer–Cartan, twisted complexes |
| DifferentialGeometry Layers 0, 1, 3, 10 and item 0.4 (`SmoothTwoForm` migration) | `DifferentialGeometry/README.md:268, 311, 371, 877, 206–212, 294` | present |
| GeometricTopology Layers 1, 3, 7 | `GeometricTopology/README.md:177, 357, 627` | present |
| LieGroups Layers 5–6, CompactGroups, UniversalCovers Stage 3 | `RepresentationTheory/LieGroups/README.md:358, 383`; `CompactGroups/README.md`; `Completed/UniversalCovers/README.md:126` | present |
| TaubesGromov | `TaubesGromov/README.md:16` | consumes SymplecticGeometry S0–S2, as the table says |
| HamiltonianSystems Layers 1–2 (open pull request, new folder) | `roadmaps show` | Layer 1 Hamiltonian fields with `ω(X_H, v) = dH(v)`, Layer 2 dynamics with the variational equation |
| AnalyticStableMaps M3 | `rev/987 README:547` | Layer 3 global stable-map compactness |
| DGFloerPartII (consumer) | `rev/1799 README:69–74, 123`; its `Suggested.lean` | consumes Layers 0–6, 10, 11 of the base; declares no `TauCetiRoadmap.DGFloer.*` name |
| StringOrientation, HomotopySpheres, FukayaTheory (consumers) | `rev/948 README:52, 214, 317`; `rev/1287 README:147, 414`; `rev/1045 README:30, 75` | cite Layer 11 item 3 and Layer 1 item 2; Layer 1 items 2 and 4; Layer 6 items 2–3 |

**Seeded sample, locator by locator** (text lines in the cache):

| Target | Source and locator | Found at | Supports the statement |
|---|---|---|---|
| 0.2 cross product | BDHO §5.2; Massey Ch. VII (uncertified) | bdho-morse-dg lines 1428–1432 (degenerate cubes, the footnote on the point) | the normalized cubical complex and the footnote; the strict cross product is Massey's, cited by locator |
| 0.4 fundamental chains | Barraud–Cornea Appendix A; BDHO Appendix A | barraud-cornea-serre line 36 ("Structure of manifolds with corners on Floer moduli spaces", p. 39); bdho-morse-dg 9053–9075 and Theorem 5.2.1 at 1461–1468 | corners, orientation and fundamental class rel boundary |
| 1.2 | Hatcher Props 4.13, 4.21, Thm 4.41 and the terminology, Prop 4.48, Huebsch–Hurewicz remark | hatcher-at 15375, 15508, 16327, 16346 ("is sometimes called a Serre fibration", printed p. 376), 16461–16463 | as cited |
| 1.3 | Mathlib names above; Weibel 5.5.1, 5.5.10 | Mathlib verified; Weibel not in the cache (book) | the index bridge recomputed |
| 5.3 | BDHO §5.3, Chapters 9–12 | bdho-morse-dg §5 (1416–1716); Umkehr chapters not sampled line by line | chapter-level |
| 5.4 | BDHO Theorem 7.2.1, Prop 7.1.1 | bdho-morse-dg 3101–3111, 3086–3090 | Hurewicz fibration, `H_*(X; 𝓕) ≅ H_*(E)`, spectral-sequence comparison: as stated |
| 5.5 | source Def 2.3, Props 2.5, 2.6, Lemma 2.9, Prop 2.12, Cor 2.13, Lemma 2.14 | bdho-cotangent 1092, 1111, 1184, 1202, 1221, 1237, 1290 | as stated except Cor 2.13's hypothesis (R03) |
| 6.1 | source §3.2 convention; HZ Ch. 1, 4 (uncertified) | bdho-cotangent 1481 (`ω(X_H, ·) = −dH`) | the sign dictionary's claim about the source holds |
| 8.1 | Prop 3.4, Def 3.5, Prop 3.6 | bdho-cotangent 1721–1740 | representing chain systems with `∂s_{x,y} = Σ (−1)^{|x|−|z|} s_{x,z} × s_{z,y}` |
| 8.6 | Prop 3.36, Thm 3.37, Def 3.38, Thm 3.39, Theorem J | bdho-cotangent 2595, 2617, 2707, 2713, 640–648 | as stated; Theorem J's "Serre" is a source gap (below) |
| 8.7 | Props 3.44–3.46, Thm 3.49 | bdho-cotangent 2924, 2956–2966 | Liouville domain, `E²_{p,q} = SH_p(W; H_q(𝓕))` |
| 9.4 | Prop 4.1, Cor 4.17 | bdho-cotangent 3026–3040, 3772–3781 | `SH^{=0} ≅ H_*(Q; i_Q^*𝓕 ⊗ |Q|)` and the transfer system `𝒢` |
| 11.1 | source Ex 6.30, Prop 6.31; BtD Ch. V (uncertified) | bdho-cotangent 5015–5038 (BtD §V.8 Thm 8.1 cited there) | the finite cover and "`K(π,1)` iff torus" |
| 11.2 | UniversalCovers Stage 3; LieGroups Layer 6 | main, as above | induced maps on `π_j`, root `SU(2)` |
| 11.3 | source §6.4 as above | bdho-cotangent 5035–5036 | the criterion |

Also checked: 9.1's `η₀ = σ ⊗ ev₀^*(o_Q^{−1}) ⊗ ev₀^*(o_Q^{−w})` against bdho-cotangent 2992–3007 (agrees, including `w ∈ {0, −1}`); 6.5's Def 5.3, Def 6.1, Prop 6.3 at 3863–3867, 4340–4346, 4366–4368; 10.1's Thm 5.1, Prop 5.5, Lemma 5.7, Prop 5.8 at 3841, 3883, 3907, 3924; Lemma 3.41 and Prop 5.11 at 2753–2761, 4154–4161; Thms 5.10, 5.12, 5.15 at 4140–4150, 4204–4206, 4293–4298; Abouzaid Lemma 3.2.6, Ex 3.2.7, Def 3.2.8, Prop 3.2.4 at abouzaid-viterbo 2946, 2949, 2952, 2902–2907; Seidel §2a with (2.2)–(2.3) at seidel-biased 74–95; Abbondandolo–Schwarz Theorem 3.1 at 1771; Lee I §§2.1–2.3, 3.1, 3.3, 4–6 in its table of contents (lee-torsion-i 41–60) and Lee II cached; Salamon §§1.4, 2.4–2.7, 3.1–3.7 in the table of contents.

**Ownership.** The torus criterion, the finite cover, the Serre-fibration predicate and spectral sequences, the Moore-path replacement, twisting cocycles and the Brown resolution, the fibration theorem, DG Floer and Theorem K were searched by object on main and in the open roadmaps the brief gives: AlgebraicTopology, GeneralizedCohomology, CharacteristicClasses, HeegaardFloer, MorseNovikov, MorseTheory, RiemannianGeometry and StringOrientation all cite DGFloer as the owner of what they use; DGFloerPartII owns Theorems B, G, H, I and the homogeneous and projective computations; flux and suspension are HamiltonianReduction's and SymplecticGeometry's and are only consumed. No second owner found. Ownership against open pull requests whose files the brief does not give was not checked.

**Headline inventory.** Headlines by the README's summary: the fibration theorem (5.4), `FH_*(X;𝓕) ≅ H_{*+n}(X; i_X^*𝓕)` and Theorem J (8.6), Theorem K (9.3), Theorems L and M (10.1–10.2), Theorems A and C with Corollaries D and E (10.5, 6.3–6.4), the torus criterion (11.3); further named results: the mod-2 vanishing theorem (1.4), the Arnold bound (7.C.6g), the torsion invariant (7.T.8), Lemma 3.41 and Proposition 5.11 (10.4). Stated: the torus criterion, the mod-2 vanishing theorem, and the Layer 4 twisted-complex statements (`D² = 0`, degree `+1`). Named as unstatable with their missing carriers: A, C, L, M, J, K, the fibration theorem, the Arnold bound, degree-one Hurewicz, the Serre spectral sequences, the torsion invariant; each named carrier was checked absent at the pins (no Hamiltonian-flow carrier on a symplectic manifold: Tau Ceti's `timeDependentHamiltonianFlow` postdates the pin; no `SH_*`, no DG Morse complex, no Serre-fibration predicate, no Novikov Floer complex). Lemma 3.41 is statable and unlisted (R04).

**Adversarial table.** `J ∂_q = ∂_p`, `ω = dq ∧ dp` where used; "source" is bdho-cotangent.

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| `bijective_sq_homotopyGroup_of_mod_two_acyclic` | `Y = pt`; `S³`; `M(ℤ/3, 2)`; `K(ℚ, 2)`; `ℝP^∞` | point: hypothesis and conclusion trivial. `S³`: `H_3(S³; 𝔽₂) ≠ 0`, excluded, and `π₃ = ℤ` is not 2-divisible. `M(ℤ/3,2)`: `H_2 = ℤ/3 ⊗ 𝔽₂ = 0`, `H_3 = Tor(ℤ/3, 𝔽₂) = 0`, `π₂ = ℤ/3`, squaring bijective. `K(ℚ,2)`: `H̃_*(;𝔽₂) = 0`, `π₂ = ℚ`. `ℝP^∞`: `π₁ ≠ 0`, excluded by `SimplyConnectedSpace`. | holds |
| One-step lemma, Bockstein step | `Z` with `H_{i}(Z;𝔽₂) = H_{i+1}(Z;𝔽₂) = 0` | sequence `H_{i+1}(Z;𝔽₂) → H_i(Z;ℤ) →×2 H_i(Z;ℤ) → H_i(Z;𝔽₂)`: both ends `0`, so `×2` bijective | holds |
| `H̃_*(K(A,1); 𝔽₂) = 0` for `A` a `ℤ[1/2]`-module | `A = ℤ[1/2]`; `ℤ/3`; `ℤ/2` | `K(ℤ[1/2],1)`: `H_1 = ℤ[1/2]`, `H_1(;𝔽₂) = ℤ[1/2] ⊗ 𝔽₂ = 0`, `H_2(;𝔽₂) = Tor = 0`. `ℤ/3`: `3` a unit in `𝔽₂`, positive homology `0`. `ℤ/2`: `H_1(ℝP^∞;𝔽₂) = 𝔽₂ ≠ 0`, and `ℤ/2` is not a `ℤ[1/2]`-module | holds; hypothesis sharp |
| Torus criterion, both directions | `r = 0`; `T^r`; `SO(3)`; `U(2)`; `ℕ → S¹` | point and `T^r`: both sides hold. `SO(3)`: `π₃ = ℤ`, not a torus: both fail. `U(2)`: cover `T¹ × SU(2)` of degree 2, `π₃ = ℤ`: both fail. `ℕ → S¹`: aspherical, 2-torsion `(ℤ/2)^ℕ` uncountable, no `≃ₜ*` with `(S¹)^r`; excluded by the Lie binder (finite-dimensional charts) | holds |
| 11.1 finite cover | `U(n)`; `SO(3)`; `T^r` | `S¹ × SU(n) → U(n)`, kernel `{(ζ, ζ⁻¹I) : ζⁿ = 1}` of order `n`; `SU(2) → SO(3)` degree 2; identity | holds |
| `TwistingCocycle` vs Def 1.9 | degrees and sign | source 532: `m_{x,y} ∈ C_{|x|−|y|−1}`, `∂m = Σ (−1)^{|x|−|z|} m_{x,z} m_{z,y}`; Lean: `𝒜 (ind y − ind x + 1)`, sign `(ind x − ind z).negOnePow` | agree |
| One-sidedness independent | `ℚ[ε]/(ε²)`, `|ε| = −1`, `m_{x,x} = ε` | `∂ε = 0 = (−1)^0 ε²`, degree `−1 = ind x − ind x − 1`: twisting holds, one-sidedness fails | Check holds |
| 4.1 regression test | `∂c = −ab`, `ind = 2, 1, 0` | `(−1)^{2−1} ab = −ab = ∂c`; right-free reading `d²(e_x) = e_y(ba − ab) ≠ 0` | holds |
| 4.2 action dependence | `A = ℚ × ℚ`, `m_{x,y} = (1,0)` | first projection: `D(1 ⊗ x) = 1 ⊗ y`; second: `0` | holds |
| 4.2 noncommuting actions | `(u,v)·(a,b) = (au + (b−a)v, bv)` | associativity: `((u,v)·(a,b))·(c,d) = (acu + (db − ca)v, bdv) = (u,v)·(ac, bd)`; matrices `diag(c,d)·[[a,b−a],[0,b]] ≠ [[a,b−a],[0,b]]·diag(c,d)` when `a ≠ b`, `c ≠ d` | Check holds |
| 4.2 degree | `ε ⊗ x`, `|ε| = 1`, `ind x = 1`, `ind y = 0` | `totalGrading`: `n + 1 = 1`, `n = 0`; `D(ε⊗x) = −ε ⊗ y` in `n + 0 = 1` | holds |
| 4.2 `D² = 0` needs twisting | `m_{x,y} = r`, `∂r ≠ 0` | `D²(α⊗x) = ((−1)^{|α|+1} + (−1)^{|α|}) ∂α·r ⊗ y + α·∂r ⊗ y = α·∂r ⊗ y` | holds |
| 1.2 Checks | plus sign; double cover; Hopf pullback | path `t ↦ t` from `(0,1)`: points over `t > 0` have `y = 0`, no continuous lift. `z ↦ z²`: `π₁ → π₁` is `×2`, cokernel `ℤ/2 = π₀(fibre)`. Pullback along a constant: `S¹ × pt` | hold |
| Serre spectral sequence Checks | double cover; Hopf; path–loop over `S²` | `H_0(S¹; ℤ[ℤ/2]_{swap}) = ℤ`, `H_1 = ℤ`, abutment `H_*(S¹)`; trivial action gives `H_*(S¹ ⊔ S¹)`. Hopf: `ℤ` at `(0,0),(2,0),(0,1),(2,1)`, `d²` iso. `H_q(ΩS²) = ℤ` all `q` | hold |
| 1.4 colimit remark | `S¹ →² S¹ →² ⋯` in Top | quotient of `S¹` by the dense subgroup `μ_{2^∞}` is indiscrete | holds |
| 1.5 collapse degrees | point in `Sⁿ`; two points in `S¹` | `±1`; same orientation `2`, opposite `0` | hold |
| 2.1 associativity | fixed-interval `((γ·δ)·ε)(½)` vs `(γ·(δ·ε))(½)` | `δ(1)` vs `γ(1) = δ(0)` | Check holds |
| 3.4 rank-one twist | `S¹`, monodromy `−1` | `d = 1 − (−1) = 2`, `H₀ = ℤ/2`, `H₁ = 0` | holds |
| 6.1 vector field | `H = p²/2`, `T*ℝ` | `ι_{p∂_q}(dq∧dp) = p dp = dH`; source convention gives `−p ∂_q`; `ν_*(p ∂_q) = −p ∂_q` | holds |
| 6.2–6.3 Liouville data | `D²ⁿ`, `λ = ½Σ(p dq − q dp)`; `(D*Q, −λ_can)` | `ι_Z dλ = λ` for `Z = ½(q∂_q + p∂_p)`; `ι_{p∂_p}(dq∧dp) = −p dq = −λ_can` | hold |
| 6.3 magnetic translation | `σ = f(q) dq` on `T*ℝ`; `σ = x dy` on `T*ℝ²` | `Ψ'^*λ_can = λ_can − π^*σ`, `−d(λ_can − π^*σ) = ω_can + π^*dσ`; `f' dq∧dq = 0`; `dx∧dy ≠ 0` | holds |
| 6.4 Liouville converse | `Z = p∂_p + ∂_q` | `ι_Z(dp∧dq) = p dq − dp`, `d(p dq − dp) = ω`, `ι_Z ω = λ − dp` | Check holds |
| 7.1 standing `CZ` of the minimum | `H = ε(q²+p²)/2`, `n = 1` | `X_H = (p, −q)`, flow `e^{−εtJ}`, `S = −εI`, `μ_RS = −1`, `CZ = −μ_RS = +1`; README says `−1` | **false** (R01) |
| 7.C.0 reflected index | `H∨ = −H` at a critical point | `μ_{H∨} = n − ind_H = −μ_H`; `𝒜_H = −H(x) = −A_C` | holds |
| 7.C.0 scalar model | `D = ∂_s + tanh s` | kernel `sech s`, adjoint kernel `cosh s` not decaying, index `1 = SF(tanh)` | holds |
| 7.C.1 cap groups | `ℂPⁿ`; `T²ⁿ`; `S² × S²` areas `(1,2)` | `Γ = ℤ`, `N_C = n+1`; `S_sph = 0`, `Γ = 0`; joint kernel of `a + 2b`, `2a + 2b` is `0`, `Γ = ℤ²`, `(1,−1)` has `c₁ = 0`, `ω = −1` | hold |
| 7.C.1(i) variational equation | `H = (q²+p²)/2` | `X_H = p∂_q − q∂_p`, `φ_t = R_{−t}`, both sides `−J R_{−t} v`; `DX_H = −J` | holds |
| 7.C.2 symmetric-matrix identity | `S = diag(1,−1)` | `C_J = [[0,−2],[−2,0]]`, `z = (1,−1)` eigenvalue `2`, `Jz = (1,1)`, `LJz = (−4,−4) = −2aJz` | holds |
| 7.C.2c tame non-compatible `J_ε` | `ℝ⁴`, `B = diag(1,−1)` | `J_ε = [[J₀, εC],[0,J₀]]`, `ω(v,J_εv) ≥ (1−|ε|)|v|²`; `ω(J_εe₃, J_εe₄) = −4ε² + 1` | holds |
| 7.C.3a dimension count | `ℂP¹`, `A_end = L` | `2(2−2) − 2 = −2`; `ind q − ind p = 4 > 2` | holds |
| 7.C.5a time-independent cylinders | `H = εf` on `S²` | `g_J(JX_H, w) = dH(w)`; lines min→max 2-dimensional, `μ(max) − μ(min) = 1 − (−1) = 2`, `x₊ = max` since `A_H(x₊) ≥ A_H(x₋)` | holds |
| 7.C.5b cyclic formula | `ℂPⁿ`; `S²`; `T²` | residues `i + n ≡ 0, 2, …, 2n mod 2(n+1)`, rank `n+1`; `S²`: residues `±1 mod 4`; `T²`: `R, R², R` in `−1, 0, 1` | hold |
| 7.C.6a–d coefficient model | `ℂPⁿ`, `ω(L) = 1`; `S² × S²` areas `(1,1)` | `κ = 1/(n+1)`, `ν(t) = −1`, `deg t = 2(n+1)`, `Σ t^{−k}` converges, `1 − t = −t(1 − t⁻¹)` a unit; `ker c₁ = ker ω = ℤ(1,−1)`, `Γ = ℤ`, `deg t = 4` | hold |
| 7.C.6g injectivity of `ν` | `S² × S²` areas `(1,2)`, class `(2,−1)` | `ω = 0`, `c₁ = 2`: nonzero in `Γ` with `ν = 0` | Check holds |
| 7.C.6h critical numbers | `S²`, `T²` | `c(S²) = 2`, `c(T²) = 3 < 4 = Betti sum` | hold |
| 7.G/7.T.1 transgression | `T²`, `γ_s(t) = (t, s)` | sweeps `T²` once, `I_ω = 1`; constant sections sweep a circle, `I_ω = 0`; `S²`: `ψ_c = 2`, `ψ = 4` | hold |
| 7.T.2 metric sign | `J_L = −J₀` | `ω(J₀ v, v) = −|v|²`, so `ω(J_L v, w)` positive definite exactly for `J_L = −J₀` | holds |
| 7.T.5, 7.T.7 series | one simple orbit; `b = βe^A` | `Σ e^{mA}/m = −log(1 − e^A)`; `(1+b)(1+b)⁻¹` first-order truncation `1 − β²e^{2A}` | hold |
| 8.6 Check on `S²` | standing comparison | `∫_{S²} ω ≠ 0`, not atoroidal; 7.4 says not an instance | **outside hypotheses** (R02) |
| 9.2, 9.4 Checks | `Q = S¹`; `ℝP²` | `H_*(𝓛S¹) = ℤ[ℤ]` in degrees `0, 1`; `H_2(ℝP²; o) = ℤ`, `H_2(ℝP²; ℤ) = 0` | hold |
| 10.2 Check | `Q = S²`, degree-0 class | `j_!` of degree `−2` lands in `H_{−2} = 0` | holds |
| Lemma 3.41 | `S²`, `T²` | `π₀(Ω²S²) = ℤ`; `Ω²T²` contractible components, one component | holds |
| Theorems A, C hypotheses | source 4140–4150, 4293–4298 | `Q` orientable, `S` closed orientable `n`-manifold, `d ≠ 0`, `π₂ ≠ 0` or the torsion conditions; non-orientable: mod-2 degree, `π_ℓ ⊗ ℤ/2 ≠ 0` | README matches |
| Cor 2.13 | path–loop fibration over `S²` | total space contractible, no `[E]`; the source assumes `E` a closed orientable manifold | hypothesis missing (R03) |

## Not verifiable

- **Weibel §5.5 (Theorems 5.5.1, 5.5.10), Massey Chapters II and VII, Whitehead Chapter I, Palais 1960, Hofer–Zehnder Chapters 1, 3, 4, Bröcker–tom Dieck Chapter V, Struwe 1990, Hofer–Salamon §4, Floer–Hofer–Salamon Lemma 6.5, Piunikhin–Salamon–Schwarz §4:** books or paywalled papers recorded `uncertified` or absent from the cache; cited by locator only. Serre 1951 Chapter II and Serre 1953 Theorem 1 are not in the cache (the source paper's Theorem 5.12 restates the latter).
- **BDHO Chapters 9–12 (the Umkehr constructions of 5.3) and Chapter 13 (5.6):** the chapter and proposition numbers exist in the cached arXiv text (Props 13.2.2, 13.2.3, 13.3.2, 13.3.3, Def 13.3.1 at lines 8753–8864); their proofs were not read line by line.
- **Salamon's lectures:** the cached text is the 1997 course preprint; the printed 1999 numbering may differ.
- **Ownership against open pull requests whose files the brief does not give** was not checked; HamiltonianSystems (#480) was read through `roadmaps show`.

## Source issues

- **Gap** in bdho-cotangent at §1.4 and Theorem J, printed pp. 12 and 15 (lines 483–488, 641): the source says the DG local system of a fibration comes from a Serre fibration with a lifting function preserving concatenation, and states Theorem J for a Serre fibration; it should say Hurewicz fibration (BDHO Proposition 7.1.1 and the source's own "Fundamental example", line 958, construct the module structure only from a lifting function), a Serre fibration reaching it through the Moore-path replacement; affects a stated result.
