# Review of PurityOfBranchLocus (pull request #1807 at 70140e6)

**Verdict:** needs changes

## R01 (P2) — The pinned Tau Ceti already proves Layers 0–1 and two §2.3 targets, which the README plans as its own

- **Location.** `TauCetiRoadmap/PurityOfBranchLocus/README.md` lines 12–14 ("this roadmap supplies the pointwise vocabulary in stalk form, the permanence of normality under étale homomorphisms of local rings, étale localization of a quasi-finite morphism"), 43–51 (ownership), §§0.1, 0.2, 0.4, 1.1, and §2.3 lines 295–320.
- **Claim.** Every target of §§0.1, 0.2, 0.4 and 1.1, with its Checks, and two of the four §2.3 targets are sorry-free declarations of Tau Ceti at the pin `2fd255d`, sometimes in greater generality. The README cites none of them, claims to own them, and sends 0AFS, regular ⇒ normal, and the étale invariance of regularity to roadmaps instead of the pinned declarations.
- **Witness.** `TauCeti/AlgebraicGeometry/Morphisms/RamificationLocus.lean` line 104 defines `ramificationLocus` exactly as README §0.4 does. Line 197 proves `ramificationLocus_eq_nonEtaleLocus` for any normal target, without quasi-finiteness or a normal source. Full map below.
- **Repair.** Add these declarations to a `From Tau Ceti` supplier list, with names, files and their pinned hypotheses. Then delete the matching targets and Checks from §§0.1, 0.2, 0.4, 1.1 and 2.3. Rewrite the Summary, the layer table and *This roadmap owns* so that they name what remains here: 0BMB in all dimensions (scheme, Stacks and affine forms), §2.2, and the two codimension-one theorems of §2.3. Keep §0.3 as a one-line pointer to the Tau Ceti instance, because AbhyankarLemma on main (README lines 31, 363, 375) cites "PurityOfBranchLocus §0.3 (0AFS)". Map of the pinned declarations (paths under `TauCeti/`):

| README target | Pinned Tau Ceti declaration | File, line |
|---|---|---|
| §0.1 `unramifiedAt_iff_stalkMap`, `etaleAt_iff_stalkMap` | `AlgebraicGeometry.Scheme.Hom.unramifiedAt_iff_stalkMap`, `…etaleAt_iff_stalkMap` (same statements) | `AlgebraicGeometry/Morphisms/StalkMap.lean` 201, 222 |
| §0.1 `etaleAt_spec_iff`, the `IsUnramifiedAt` analogue | `Scheme.Hom.etaleAt_spec_iff`, `Scheme.Hom.unramifiedAt_spec_iff` | ibid. 363, 376 |
| §0.1 `quasiFiniteAt_of_appLE`, Convention 3 (01TD) | `Scheme.Hom.quasiFiniteAt_of_appLE`, `Scheme.Hom.exists_appLE_quasiFiniteAt_iff` | ibid. 389, 418 |
| §0.2 `isNormalDomain_iff_of_etale` (025P) | `TauCeti.Algebra.isNormalDomain_iff_of_etale` (no Noetherian hypothesis) | `RingTheory/Etale/Normal.lean` 164 |
| 039S, 025N at stalks (cited from ModularCurves §4D) | `Scheme.Hom.ringKrullDim_stalk_eq_of_etale`, `Scheme.Hom.isRegularLocalRing_stalk_iff_of_etale` | `AlgebraicGeometry/Morphisms/Etale/Stalk.lean` 46; `AlgebraicGeometry/Scheme/Regular/LocalRing.lean` 113 |
| 0AFS localization (cited from SchemeAndStackFoundations §4.13) | instance `TauCeti.isRegularRing_of_isRegularLocalRing`, `@[stacks 0AFS "second sentence"]` | `RingTheory/RegularLocalRing/ProjectiveDimension.lean` 441 |
| `IsRegular.isNormal` (cited from SchemeAndStackFoundations §4.13) | `TauCeti.AlgebraicGeometry.IsRegular`, instance `IsRegular.isNormal` (0569) | `AlgebraicGeometry/Scheme/Regular/Scheme.lean` 68, 175 |
| §0.4 the three loci | `Scheme.Hom.ramificationLocus`, `nonEtaleLocus`, `branchLocus` | `AlgebraicGeometry/Morphisms/RamificationLocus.lean` 104, 111, 116 |
| §0.4 `ramificationLocus_eq_stacks`, `isClosed_*`, `ramificationLocus_subset_nonEtaleLocus` | `ramificationLocus_eq_setOf_not_exists`, `isClosed_ramificationLocus`, `isClosed_nonEtaleLocus`, `ramificationLocus_subset_nonEtaleLocus`, `isClosed_branchLocus` (universally closed, not only finite) | ibid. 170, 179, 185, 189, 217 |
| §0.4 `*_spec` | `ramificationLocus_specMap`, `branchLocus_specMap`, `nonEtaleLocus_specMap` | ibid. 225, 233, 241 |
| §0.4 Checks; §2.3 Check `test_purity_branchLocus_square` | `example`s and `TauCeti.AlgebraicGeometry.ramificationLocus_square`, `branchLocus_square`, `nonEtaleLocus_square`, `isGenericPoint_branchLocus_square` | `Examples/AlgebraicGeometry/Morphisms/RamificationLocus.lean` 74, 83, 129, 249, 258, 298, 325 |
| §1.1 `exists_elementaryEtale_finite_of_isolated` (02LK) | `Scheme.Hom.exists_elementaryEtale_finite_of_isolated`; persistence `Scheme.Hom.exists_finite_open_baseChange` | `AlgebraicGeometry/Morphisms/ElementaryEtale/Basic.lean` 70; `…/BaseChange.lean` 44 |
| §1.1 `etale_of_etale_comp_surjective` (036W) | `AlgebraicGeometry.Etale.of_comp_surjective` (`f` LFP, `g` flat surjective: the case §2.1 uses, `f` LFT over a locally Noetherian base) | `AlgebraicGeometry/Morphisms/StalkMap.lean` 509 |
| §2.3 `ringKrullDim_stalk_eq_of_locallyQuasiFinite` | `Scheme.Hom.ringKrullDim_stalk_eq_of_locallyQuasiFinite` (`IsNormalScheme Y`, no Noetherian hypothesis) | `AlgebraicGeometry/Morphisms/LocallyQuasiFinite.lean` 142 |
| §2.3 `ramificationLocus_eq_nonEtaleLocus` | `Scheme.Hom.ramificationLocus_eq_nonEtaleLocus` | `AlgebraicGeometry/Morphisms/RamificationLocus.lean` 197 |
| §2.1 inputs: dimension one, dimension two, the I 9.5 (ii) route | `Scheme.Hom.exists_etale_of_formallyUnramified_stalkMap_of_isDedekindDomain`, `TauCeti.Algebra.etale_of_isUnramifiedAt_height_eq_one_of_ringKrullDim_le_two` (0BMB for `dim ≤ 2`), `Scheme.Hom.exists_etale_of_formallyUnramified_stalkMap_of_ringKrullDim_le` | `StalkMap.lean` 303, 324; `RingTheory/RegularLocalRing/Purity.lean` 88 |

  All the files above contain no `sorry`; I built the modules that had no object files and elaborated the `#check`s at the pins.

## R02 (P2) — Suggested.lean restates pinned Tau Ceti declarations and five statements the README disowns

- **Location.** `TauCetiRoadmap/PurityOfBranchLocus/Suggested.lean` lines 38–127 (Layer 0: two §0.1 theorems, the three loci, seven API theorems), 129–165 (`globalDimension`, `globalDimension_le_iff_hasProjectiveDimensionLE`, `isRegularLocalRing_of_projectiveDimension_residueField`, `isRegularLocalRing_iff_finite_globalDimension`, `isRegularLocalRing_localization`), 226–246 (the two §2.3 auxiliary theorems).
- **Claim.** (a) None of these is a headline. Each restates a pinned Tau Ceti declaration (R01). (b) README §0.3 says the regular-local-ring statements belong to SchemeAndStackFoundations §4.13 and "nothing here restates them". None of the five names of lines 129–165 appears in the README. Their docstrings name EnhancedDerivedSheaves E1.6 as a consumer, which the README no longer says. The docstring of line 156 also claims the localization statement, which the theorem does not state.
- **Witness.** With the Tau Ceti imports added, one tactic closes 12 declarations: `exact Scheme.Hom.<same name>` (lines 41, 50, 90, 95, 99, 104), the `…_setOf_not_exists`/`…_specMap` lemmas (82, 109, 116, 124), `exact TauCeti.globalDimension_le_iff_hasProjectiveDimensionLE R n` (137), and `infer_instance` (163).
- **Repair.** Delete lines 32–167 and 226–246. Import `TauCeti.AlgebraicGeometry.Morphisms.RamificationLocus` and `TauCeti.AlgebraicGeometry.Scheme.Regular.Scheme`, and state the §2.3 headlines on `f.ramificationLocus` and `f.branchLocus`, e.g. `[IsIntegral X] [IsIntegral Y] [IsNormalScheme X] [IsRegular Y] (f : X ⟶ Y) [LocallyOfFiniteType f] [LocallyQuasiFinite f] [IsDominant f] (hne : f.ramificationLocus ≠ Set.univ) (z : X) (hz : z ∈ f.ramificationLocus) (hmax : ∀ z' ∈ f.ramificationLocus, z' ⤳ z → z' = z) : ringKrullDim (X.presheaf.stalk z) = 1`, and the same for `w ∈ f.branchLocus`. **Tested:** a scratch file with this import header, the three 0BMB forms of lines 175–222 unchanged, R03's theorem and the two §2.3 headlines elaborates with six `declaration uses 'sorry'` warnings and nothing else. In the same scratch session, the two §2.3 auxiliaries exactly as stated at lines 232–245 are proved from the pin by `have : IsRegular Y := ⟨inferInstance⟩` followed by `exact f.ringKrullDim_stalk_eq_of_locallyQuasiFinite x` (resp. `exact f.ramificationLocus_eq_nonEtaleLocus`).

## R03 (P2) — The §2.2 end theorem is statable at the pins but absent from Suggested.lean

- **Location.** README lines 37–38 (end theorems: "`Scheme.Hom.etale_of_etaleAt_codimOne` (§2.2)") and 271–281; `Suggested.lean` has no such declaration.
- **Claim.** One of the three headline theorems is missing from the acceptance test, and nothing in the module docstring says it is not statable.
- **Witness.** Every carrier exists at the pins: Mathlib `IsFinite`, `IsDominant`, `genericPoint`, `Etale`, `Scheme.Hom.stalkMap`, and Tau Ceti `IsNormalScheme`, `IsRegular`. The statement below elaborates in the scratch file of R02.
- **Repair.** Add, with a docstring: `theorem etale_of_etaleAt_codimOne [IsIntegral X] [IsIntegral Y] [IsNormalScheme X] [IsRegular Y] (f : X ⟶ Y) [IsFinite f] [IsDominant f] (hgen : ∃ U : X.Opens, genericPoint X ∈ U ∧ Etale (U.ι ≫ f)) : Etale f ↔ ∀ x : X, ringKrullDim (X.presheaf.stalk x) = 1 → (f.stalkMap x).hom.FormallyUnramified`. Write `hgen` in this form in the README too. The README's own negative control, `𝔽_p(t^{1/p})/𝔽_p(t)`, makes the right side vacuously true and the left side false, and it violates `hgen`.

## R04 (P3) — Checks carry backticked Lean names that no declaration has

- **Location.** README lines 202, 204, 208, 262, 265, 352, 355 (`test_ramificationLocus_ne_nonEtaleLocus`, `test_ramificationLocus_frobenius`, `test_branchLocus_square`, `test_purity_needs_regular`, `test_purity_needs_codimOne`, `test_purity_branchLocus_square`, `test_purity_branchLocus_needs_regular`).
- **Claim.** A Check never names a Lean counterpart, and a backticked name of this roadmap's own claims a declaration in `Suggested.lean`.
- **Witness.** None of the seven names is declared in `Suggested.lean`, Mathlib or Tau Ceti at the pins. Tau Ceti mentions five of them only in italics, in docstrings of its Examples file (`Examples/AlgebraicGeometry/Morphisms/RamificationLocus.lean` 67, 107, 247, 265, 290).
- **Repair.** Drop the backticked names and keep the prose. After R01 only the two §2.1 Checks and `test_purity_branchLocus_needs_regular` stay here.

## R05 (P3) — §2.2's *Needs:* line omits what its route uses

- **Location.** README lines 276–281: "§2.1 applies at the remaining points after the codimension-one and dimension-equality inputs are supplied … *Needs:* §2.1."
- **Claim.** The dimension equality, which 0BMB needs as hypothesis (4), is the §2.3 statement `ringKrullDim_stalk_eq_of_locallyQuasiFinite`, from a later section. The "only if" direction needs Mathlib `FormallyUnramified.stalkMap`. Neither is listed.
- **Witness.** `exists_etale_of_formallyUnramified_stalk_codimOne` takes `hdim : ringKrullDim (X.presheaf.stalk x) = ringKrullDim (Y.presheaf.stalk (f x))` (`Suggested.lean` line 185). §2.2's hypotheses do not include it.
- **Repair.** Change the line to: *Needs:* §2.1; Tau Ceti `Scheme.Hom.ringKrullDim_stalk_eq_of_locallyQuasiFinite`; Mathlib `IsFinite`, `IsDominant`, `genericPoint`, `FormallyUnramified.stalkMap` (`AlgebraicGeometry/Morphisms/FormallyUnramified.lean` 148). Also say in the sketch that a finite morphism is locally quasi-finite and locally of finite type.

## R06 (P3) — README shape: no supplier-contract, build-reading or consumer sections, and no layer-closing Examples/Dependencies

- **Location.** README headings: `## Scope and ownership`, `## Conventions`, `## Layer 0–2`, `## Stacks alignment`, `## Provenance`, `## References`.
- **Claim.** The required form asks for `## Exact supplier contracts` (`From Mathlib`, `From Tau Ceti`, `From TauCetiRoadmap.<X>`), `## How to read the build`, `### Examples` and `### Dependencies` closing each layer, and `## Downstream consumers`.
- **Witness.** None of these five headings occurs in the README. Its suppliers are a bullet list inside Scope (lines 53–78), and its consumers (AbhyankarLemma §3.3, PurityForFlatCohomology Layer 7) are named nowhere as such.
- **Repair.** Move lines 53–78, extended by R01's Tau Ceti list, into `## Exact supplier contracts`. Add a one-paragraph `## How to read the build`, the two closing subsections per layer, and `## Downstream consumers`.

## R07 (P3) — The module docstring is in the old "suggested forms" framing

- **Location.** `Suggested.lean` lines 5–10: "Purity of the branch locus: suggested forms … not exhaustive … suggest Lean forms for particular milestones … discharging all of them finishes neither a layer nor the roadmap."
- **Claim.** The file is the roadmap's acceptance test. Its docstring must be titled "…: target signatures" and say that it states the headline theorems against the pins and which headlines are not statable.
- **Witness.** The form rules for `Suggested.lean` (module docstring); every headline is statable at the pins (R02's scratch file).
- **Repair.** Use the docstring of R02's tested scratch file: title "Purity of the branch locus: target signatures"; the roadmap is `README.md`; the file states 0BMB in three forms, the global corollary and the two codimension-one theorems on Tau Ceti's loci; every headline is statable at the pins.

## R08 (P3) — The provenance path does not exist in the cited repository

- **Location.** README line 391: "Paths are under `lean/Pcf/`."; lines 395–396 give unqualified names with no commit.
- **Claim.** The locator into the cited formalization is wrong and is not pinned to a commit.
- **Witness.** The GitHub contents API for `tdupu/pcfawd-formalization`: the root has `library`, not `lean` (`contents/lean` returns 404). The cited files are `library/Pcf/Stacks/Purity/Tag0BMA.lean`, `Tag0BMBScheme.lean`, `Tag0BMBSchemeAPI.lean` and `library/Pcf/NonEtaleLocus.lean`.
- **Repair.** Write "Paths are under `library/Pcf/` at commit `<sha>`", with namespace-qualified names. After R01 the 0.4/2.3 row is superseded by Tau Ceti's `RamificationLocus.lean`, which credits the same three authors; say so in one clause or drop the row.

## R09 (P3) — An open roadmap cites `auslander_buchsbaum` at §0.3, which this pull request removes without a moved-id line

- **Location.** README §0.3 (lines 139–151) no longer states `auslander_buchsbaum` and its Stacks-alignment row was deleted. It says only that the "global-dimension, Auslander–Buchsbaum and Koszul inputs" are SchemeAndStackFoundations §4.13.
- **Claim.** An id this pull request drops is cited elsewhere, and no one-line old → new mapping is given.
- **Witness.** PurityForFlatCohomology (open pull request #1840), README lines 118, 467 ("§0.3 `auslander_buchsbaum` (Stacks 090V)") and 1947 ("*Needs:* PurityOfBranchLocus §0.3 (`auslander_buchsbaum`)").
- **Repair.** Add to §0.3: "`auslander_buchsbaum` (090V) → Tau Ceti `ModuleCat.projectiveDimension_add_depth_eq_depth` (`TauCeti/RingTheory/Depth/AuslanderBuchsbaum.lean` line 148, `@[stacks 090V]`)". Do the same for any other moved target id another roadmap cites.

## Previous findings

The previous report (r30) read pull request #1808's copy of this folder at a3b1e14. This head carries the earlier state of the folder that #1808 supersedes: §0.2 here has no dimension or regularity statements, ModularCurves §4D is still cited, and the Check names are backticked. So the earlier reports' "unchanged since" adversarial rows do not transfer here; the table below is recomputed.

- r30 R01 (two files outside the named folders, `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md`): **repaired at this head**. Excluding the 14 folders the brief names as this pull request's own, `git diff --stat origin/main...HEAD` is empty, and the worker's gate reports `outside-folder=0`.

## Verified sound

**Gate.** The worker's gate at 70140e6 passes every scanner: `set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`. I re-ran it standalone with `--base origin/main`. It lists `outside-folder` hits only in the 13 other folders the brief names as this pull request's own; every other scanner is 0. My dependency check:

```text
depcheck: 240 roadmaps, 2436 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The folder holds `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.AG"`).

**Elaboration.** `lake env lean TauCetiRoadmap/PurityOfBranchLocus/Suggested.lean` at the pins (Mathlib `1b1ccf4b0`, Tau Ceti `2fd255d99`, `v4.36.0-rc2`) exits 0 with 21 `declaration uses 'sorry'` warnings (lines 41, 50, 82, 90, 95, 99, 104, 109, 116, 124, 137, 146, 156, 163, 181, 198, 213, 232, 241, 253, 268) and nothing else. I compared the worker's `signatures.md` (25 elaborated types) binder by binder with the README statements: no binder is lost, and the README and the Lean agree on generality for every declaration that both name.

**One-tactic padding probe.** A scratch copy with every `sorry` replaced by `first | rfl | simp | infer_instance | assumption` gives 21 errors on 21 theorems: nothing closes generically at the file's own imports. With the Tau Ceti imports added, 12 close by one `exact`/`infer_instance` (R02), and the two §2.3 auxiliaries close in two lines.

**Sources (seeded sample), each opened at its line.**

- Morphisms: `stacks-01TD` line 1605 (Def. 21.1, quasi-finite at `x`: affine neighbourhoods, finite type, quasi-finite at the prime); `stacks-02G3` line 3328 and lines 3345–3347 (the unramified points form an open set); `stacks-02G4` line 3333 (Def. 36.1); `stacks-02GF` line 3448 (Lemma 36.14 (1)⇔(3) for `f` locally of finite type); `stacks-02GI` line 3528 (Def. 37.1; openness at 3539–3540); `stacks-02GU` line 3626 (Lemma 37.15 (1)⇔(4): flat stalk map and `Ω_{X/S,x} = 0`, for `f` locally of finite presentation); `stacks-01WM` line 4879 (Lemma 45.7, integral ⇔ affine and universally closed); `stacks-02JU` line 6106 (Lemma 53.1, equality when `S` is universally catenary).
- Étale Morphisms: `stacks-0258` line 541 (Def. 11.1; Convention 5's localization form is Lemma 11.2 (039L), line 562); `stacks-039S` line 943; `stacks-025N` line 953; `stacks-025P` line 976.
- More on Morphisms and Descent: `stacks-02LK` line 5984 (hypotheses `f` locally of finite type and `x` isolated in its fibre; (i)–(iii) and persistence 5992–5997); `stacks-02VN` Descent line 2792; `stacks-036W` line 3086.
- Fundamental Groups: `stacks-0BJH` line 2479; `stacks-0BMA` line 2503; `stacks-0BMB` line 2524 (hypotheses (1)–(5) at 2528–2532 are exactly those of `exists_etale_of_formallyUnramified_stalk_codimOne`; the proof's inputs at 2541–2563, namely 02LK, Descent 23.31/31.1, étale invariance of dimension, normality and regularity, 00H8, 0567, 0AFS, 00ON and 0BMA, are the README's §2.1 route); `stacks-0EA4` line 3019 (no quasi-finiteness, étaleness in codimension one assumed, as §2.3 says); `stacks-0ECD` line 3119.
- Discriminants: `stacks-0BJF` line 269.
- Algebra: `stacks-00O6` line 12409; `stacks-00OC` line 12552; `stacks-0AFS` line 12566; `stacks-00OF` line 12590; `stacks-00ON` line 12677; `stacks-00H8` line 4098 (`R ⊂ S` domains, `R` normal, `S` integral); `stacks-00NM` line 11885; `stacks-00NP` line 11920; `stacks-00NQ` line 11925; `stacks-00Q9` line 14138; `stacks-00UJ` line 18397; `stacks-00PL` line 13918; `stacks-0567` line 20195.
- SGA 1: `sga1` lines 8359–8364 (X 3.1, printed p. 212: quasi-finite dominant morphism of integral preschemes, `X` normal, `Y` regular and locally Noetherian, `Z ≠ X` of codimension one; matches §2.3) and lines 987–991 (I 9.5 (i), (ii)).

Each supports the sentence that cites it, with the hypotheses as restated.

**Library declarations opened at the pins.**

- Mathlib: `IsRegularLocalRing` (`RingTheory/RegularLocalRing/Defs.lean` 52: local, Noetherian, `spanFinrank = ringKrullDim`); `IsRegularRing` (ibid. 93); `Scheme.Hom.QuasiFiniteAt` (`AlgebraicGeometry/Morphisms/QuasiFinite.lean` 333, the stalk map is quasi-finite), `.quasiFiniteAt` (337) and `Scheme.Hom.quasiFiniteAt` (359); `Algebra.QuasiFiniteAt` (`RingTheory/QuasiFinite/Basic.lean` 368); `FormallyUnramified.stalkMap` (`AlgebraicGeometry/Morphisms/FormallyUnramified.lean` 148); `@[stacks 00Q9]` (`RingTheory/ZariskisMainTheorem.lean` 633); `@[stacks 00ON]` (`RingTheory/Ideal/KrullsHeightTheorem.lean` 483); `@[stacks 00H8]` (`RingTheory/IntegralClosure/GoingDown.lean` 48); `@[stacks 00UJ]` (`RingTheory/Etale/QuasiFinite.lean` 377).
- Tau Ceti: every declaration of R01's map, each elaborated with `#check @` (the 0BMA declaration `TauCeti.Algebra.etale_of_finiteNormal_of_ringKrullDim_eq_two` too) after building `TauCeti.AlgebraicGeometry.Morphisms.RamificationLocus`, `…ElementaryEtale.BaseChange`, `TauCeti.RingTheory.RegularLocalRing.Purity`, `…RegularLocalRing.Normal`, `TauCeti.AlgebraicGeometry.Scheme.Regular.Scheme`, `TauCeti.Examples.AlgebraicGeometry.Morphisms.RamificationLocus` and `TauCeti.RingTheory.Depth.AuslanderBuchsbaum`; also `ModuleCat.projectiveDimension_add_depth_eq_depth` (090V, `RingTheory/Depth/AuslanderBuchsbaum.lean` 148), also `TauCeti.globalDimension` and `TauCeti.globalDimension_le_iff_hasProjectiveDimensionLE` (`RingTheory/GlobalDimension.lean` 70, 90), `TauCeti.IsRegularLocalRing.of_hasProjectiveDimensionLE` (00OC, `RingTheory/RegularLocalRing/ProjectiveDimension.lean` 336), `TauCeti.isRegularLocalRing_iff_globalDimension_lt_top` (0AFS first sentence, 376), and `TauCeti.IsRegularRing.isIntegrallyClosed` (0567, `RingTheory/RegularLocalRing/Normal.lean` 55). No file opened contains `sorry`.

**Cross-roadmap citations resolved.**

- LocalPurity §2.1 at this head: README line 265 and `Suggested.lean` line 115 state `Algebra.etale_of_finiteNormal_of_isRegularLocalRing`, and Convention 5 is at line 118.
- SchemeAndStackFoundations at this head: §0.17 has `IsLocalRing.depth` (line 1142) and `isCohenMacaulay_iff_forall_satisfiesSerreS` (1173). §4.13 (line 5643) has *IsRegular.isNormal* (5649), 0AFS (5690–5694), `serre_normality_criterion`, and the consumer sentence naming this roadmap (5712).
- ModularCurves §4D on main: line 1165, and the bullet "locality and invariance under isomorphism and étale morphisms".
- AbhyankarLemma on main: lines 31, 80, 363, 375 cite §0.3, an id this head keeps.
- EnhancedDerivedSheaves E1.6 on main: lines 689 and 693.

The worker's `citations.md` lists nine names found nowhere. Six are this roadmap's own declared names: `Scheme.Hom.`-prefixed in the README per Convention 6, unprefixed in `Suggested.lean` (`ramificationLocus_eq_stacks` 82, `exists_etale_of_formallyUnramified_stalk_codimOne` 181, `etaleAt_of_unramifiedAt_codimOne` 198, `isEtaleAt_of_purity` 213, `…_maximal_ramificationLocus` 253, `…_maximal_branchLocus` 268). The other three: `etale_of_etaleAt_codimOne` is missing (R03); `Algebra.etale_of_finiteNormal_of_isRegularLocalRing` is LocalPurity's (resolved above); `Pcf.codim_eq_one_of_algebra` is in the external provenance repository.

**Ownership against open work.**

- Overlap with other open pull requests: #1854 carries a byte-identical copy of this folder and states its order, "#1101 → #1807 → this pull request". #1808 carries the later state, and #1807's description places that move after #1807.
- The only other open roadmap declaring a ramification locus is BelyiMaps (#767, #1791), which concerns maps of Riemann surfaces.
- PurityForFlatCohomology (#1840) consumes this roadmap and owns none of its objects; see R09 for its citation.
- Declared gaps: none (no readable `design/plan.json` and no `gap:` contract in the README).

**Adversarial table.** `k` is a field; "square map" is `(x, y) ↦ (u, v) = (x², y)` on `𝔸²_k` with `2 ≠ 0`; "Frobenius" is `t ↦ tᵖ` on `𝔸¹_k` in characteristic `p`; "quotient" is `𝔸² → Spec k[x², xy, y²]`.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 0BMB scheme form, `Suggested.lean` 181 | `t ↦ t²` at `t = 1`; at `t = 0`; square map at origin; `Spec 𝔽_p(t^{1/p}) → Spec 𝔽_p(t)` | `m_Y𝒪_X = (t−1)`, `κ` equal, `d = 1`, hypotheses hold, étale; at `0`, `Ω = k[t]dt/(2t)` ≠ 0, so `hunr` (at `x' = x`) fails and the map is not étale; `η_{V(x)} ⤳ 0` with `dim 1` and `Ω_η ≠ 0`, `hunr` false, `m_Y𝒪_X = (x², y) ≠ (x, y)`, not étale; dimensions `0`, `hpos` false, not étale | agrees with stacks-0BMB 2528–2533 on all four | none |
| 0BMB Stacks form, 198 | `𝔾_m ↪ 𝔸¹` at `t = 1`; `hqf` against 01TD | all hypotheses true, étale; `hqf` is the right side of Tau Ceti `exists_appLE_quasiFiniteAt_iff` (Stacks 01TD) | sound | none |
| 0BMB affine form, 213 | `k[u, v] → k[x, y]`, `u ↦ x²`, `v ↦ y`; `𝔮 = (x−1, y)` vs `(x, y)` | heights `2 = 2`; no height-one `P ⊆ (x−1, y)` contains `x`, so `2x` is a unit and `hunr` holds, `IsEtaleAt`; for `(x, y)`, `(x) ≤ 𝔮` has `Ω_{(x)} ≠ 0`, `hunr` false, not étale | sound | none |
| §2.2 `etale_of_etaleAt_codimOne` (absent) | `𝔽_p(t^{1/p})/𝔽_p(t)`; square map; `𝟙 Y` | `hgen` false (`Ω = L·du ≠ 0`), left side false, right side vacuously true; `hgen` true (separable, degree 2), left false, right false at `η_{V(x)}`; true ⇔ true | correct with `hgen`; absent from Lean | R03 |
| §2.2 route, *Needs:* | `dim 𝒪_{X,x} = dim 𝒪_{Y,f x}` for a finite dominant `f`, `Y` normal | square map at origin `2 = 2`, at `η_{V(x)}` `1 = 1`; supplied by the §2.3/Tau Ceti lemma, not by §2.1 | Needs incomplete | R05 |
| `ringKrullDim_stalk_eq_one_of_maximal_ramificationLocus`, 253 | square map; Frobenius; quotient; separable `Spec L → Spec K` | `R = V(x)`, `z = η_{V(x)}`, `dim = 1`; `R = 𝔸¹ = univ`, `hne` false (without it, `z = η` and `0 ≠ 1`); `R = {0}`, `dim 2`, excluded only because the cone point has embedding dimension `3 > 2`; `R = ∅`, vacuous | sound | R02 (restate on Tau Ceti's locus) |
| `ringKrullDim_stalk_eq_one_of_maximal_branchLocus`, 268 | square map; Frobenius | `B = V(u)`, `w = η_{V(u)}`, `dim 𝒪_{Y,w} = 1`; `B = 𝔸¹`, `w = η`, `dim 0`: `hne` needed, as README 343–344 says | sound | R02 |
| `ringKrullDim_stalk_eq_of_locallyQuasiFinite`, 232 | square map at origin and at `η_{V(x)}`; the pinned lemma | `2 = 2`; `1 = 1`; Tau Ceti `LocallyQuasiFinite.lean` 142 needs only `IsNormalScheme Y` | true; duplicate | R02 |
| `ramificationLocus_eq_nonEtaleLocus`, 241 | square map; closed immersion `Spec k → 𝔸¹` | `V(x) = V(x)`; `∅ ≠ {pt}`, but the immersion is not dominant, so excluded; Tau Ceti line 197 drops quasi-finiteness and normality of `X` | true; duplicate | R02 |
| §0.1 `unramifiedAt_iff_stalkMap`, `etaleAt_iff_stalkMap`, 41, 50 | closed immersion at `0`; Frobenius at `0`; `𝔾_m ↪ 𝔸¹` | unramified: true/true, false/false (`Ω = k[t]dt`); étale: immersion not flat (`t`-torsion), false/false; open immersion true/true | true; duplicate | R01, R02 |
| §0.1 `etaleAt_spec_iff`, `quasiFiniteAt_of_appLE` | `k[u] → k[x]`, `u ↦ x²`, `𝔮 = (x−1)`, `(x)`; `𝔸¹ → Spec k` at `(t)` | `IsEtaleAt` yes (`2x` unit) / no; fibre `𝔸¹`, `(t)` not isolated: both sides false | true; in Tau Ceti | R01 |
| §0.2 025P | `A = k[t]_(t)`, `C = A[s]/(s² − t − 1)`, `𝔮 = (t, s − 1)`; the cusp with `C = A` | both normal (`B` a DVR); both non-normal | true; Tau Ceti `Normal.lean` 164 | R01 |
| §0.3 0AFS, consumed | `k[x, y]_(x,y)` at `(x)` | `k[x, y]_(x)`: embedding dimension `1 = dim 1`, regular; Lean: `infer_instance` with Tau Ceti's instance | true; duplicate | R01, R02 |
| §0.4 loci and the seven API theorems, 61–127 | Probe 2 | each API theorem closes by `exact` of the same-named Tau Ceti lemma, so the three definitions agree definitionally with Tau Ceti's | duplicate | R02 |
| §0.4 Checks | closed immersion; Frobenius; square map | `Ω_{k/k[t]} = 0`, so `R = ∅`; not flat, so non-étale `= {pt}`; `Ω = k[t]dt`, so `R = 𝔸¹`; `Ω = k[x, y]dx/(2x dx)`, so `R = V(x)`, `B = V(u)` | correct; computed in Tau Ceti Examples | R01, R04 |
| §1.1 02LK, 036W | `t ↦ t²` at `0`; `k[x, y]/(xy) → k[x]` at origin; `g = 𝟙` | `U = S`, `V = X`, `κ(x) = κ(v) = k`; origin not isolated (fibre is the `y`-axis), hypothesis false; `f` étale ⇔ `f` étale, with Tau Ceti's LFP hypothesis holding in §2.1's use | true; in Tau Ceti | R01 |
| `globalDimension_le_iff_hasProjectiveDimensionLE`, 137 | Probe 2 | closes by `exact TauCeti.globalDimension_le_iff_hasProjectiveDimensionLE R n` (Tau Ceti's own proof is one `simp`) | padding; duplicate | R02 |
| Convention 3, stalkwise quasi-finite | `𝔸¹ → Spec k` at `(t)`; `Spec k[t]/(t²) → Spec k` | `k[t]_(t)` not quasi-finite over `k`; `k[t]/(t²)` quasi-finite | agrees with stacks-01TD 1617–1619 | none |

## Not verifiable

- O. Zariski (1958) and M. Nagata (1959) are cited only as the origin of the theorem, with no locator-bearing claim; not opened.
- The provenance repository was read only through its GitHub directory listings (R08); its declarations' statements were not re-read in this round.
- Ownership against open pull requests was checked through the sibling checkouts the brief provides and the `roadmaps grep` index; nothing else was fetched.

## Source issues

- **Misprint** in sga1 at Exposé X, remark after Théorème 3.1, printed page 212 (sga1 lines 8366–8367): the source says the condition `Z ≠ X` means the finite extension `R(Z)/R(X)` is separable; it should be the extension `R(X)/R(Y)` of function fields; affects nothing.
