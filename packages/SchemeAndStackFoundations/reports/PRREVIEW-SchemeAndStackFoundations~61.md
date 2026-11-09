# Review of SchemeAndStackFoundations (pull request #1276 at b06bd13)

**Verdict:** needs changes

This is a full review of the folder at b06bd13, with the previous findings checked first. This head repairs r57's R01, R02, R05, R06, R07 and R08. It does not repair R03 (pins) or R04 (description).

Two findings are blocking (P2):

- R01: r57's R01 was repaired only for henselization. Tau Ceti at `2fd255d9`, the pin the README names, already builds most of Layer 0 and parts of Layers 1, 4 and 5. `Suggested.lean` still restates them, and the README still specifies them as targets.
- R02: §0.13's recognition criterion for the henselization assumes its own conclusion.

Eight findings are P3.

## R01 (P2) — Tau Ceti at `2fd255d9` already builds most of Layer 0 and parts of Layers 1, 4 and 5; they are restated as targets

**Location.**

- `README.md:419`: "**From Tau Ceti** (`2fd255d9`, the pin in `lake-manifest.json`)".
- The affected sections: §§0.3, 0.5, 0.10, 0.16–0.17, 0.20–0.21, 0.23, 0.27, 0.29–0.30, 1.3, 4.1, 4.11, 4.13 and 5.1.
- `Suggested.lean:75–381`, `:394–414`, `:917–925`, `:1068`, `:1101–1113` and `:1295–1324`.

**Claim.** These sections plan the objects below as targets, and `Suggested.lean` declares them, with no citation of an existing implementation.

**Witness.** `TauCeti/RingTheory/Japanese.lean:125` at `2fd255d9` defines `TauCeti.Ring.IsJapanese` with exactly the body of `Suggested.lean:142`. `TauCeti/RingTheory/Flat/Annihilator.lean:67,82` proves `Suggested.lean:275,282` under the same hypotheses. `STATUS.md` in this folder already lists §0.30 as complete.

**Repair.** This is r57 R01's repair applied to the rest of the roadmap. It comes due with R03's merge of `origin/main`: at this head's pin `358314d4` none of these files exist, so `Suggested.lean` can import them only after the merge.

1. **`Suggested.lean`.**
   - Delete the declarations in the table below.
   - Delete outright those that Tau Ceti proves: `Proj.isPullback_baseChange`, `FlatAnnihilator.*`, the `NormalSchemes` theorems, `exists_regularSystem_of_quotient` and `Formal.resolution_of_curves`.
   - Restate the remaining headlines on Tau Ceti's carriers by importing the modules. For example, state `Ring.IsNagata.of_complete_local` on `TauCeti.Ring.IsNagata`, `alteration_theorem` with `TauCeti.AlgebraicGeometry.IsRegular`, `artinBootstrap` on `TauCeti.AlgebraicGeometry.Spaces.IsAlgebraicSpace`, and `CH_coprod` on `TauCeti.AlgebraicGeometry.Chow.RatEquiv`.
2. **README.**
   - List these objects under "Already stated or built elsewhere" and in the Tau Ceti contract.
   - Reduce each section to what `2fd255d9` lacks, as §§0.12–0.14 now do.
   - Drop the §0.29 bullet of the module docstring, which says "no Frobenius endomorphism of a scheme". Cite `AlgebraicGeometry.Scheme.frobenius` (`Frobenius/Basic.lean:98`), `isIso_relativeFrobenius` for étale maps (`Frobenius/Etale.lean:107`) and `finrank_relativeFrobenius_of_smoothOfRelativeDimension` (`Frobenius/Smooth.lean:97`).
3. **Inventory.** Search Tau Ceti at `2fd255d9` by object for every remaining Layer 0–5 definition. The table records what this review found; it is not a complete inventory.

All paths in the table are under `TauCeti/` at `2fd255d9`. Lines in the first column are lines of `Suggested.lean`.

| `Suggested.lean` declaration | Tau Ceti at `2fd255d9` |
|---|---|
| `Proj.isPullback_baseChange` (75) | `AlgebraicGeometry.Proj.isPullback_baseChange`, `AlgebraicGeometry/ProjectiveSpectrum/BaseChange.lean:178`, proved with no finite generation |
| `PseudoCoherence.IsPseudoCoherentModule` (92) and `PseudoCoherence.IsPseudoCoherentSheaf` (99) | `Huber.IsPseudoCoherentOver R M ⊤` (`Algebra/Module/PseudoCoherent/Basic.lean:89`) and `IsPseudoCoherent` (`AlgebraicGeometry/Modules/PseudoCoherent/Basic.lean:81`, Zariski-local finite free resolutions) |
| `Ring.IsJapanese` (142) and `Ring.IsNagata` (149) | `TauCeti.Ring.IsJapanese` (`RingTheory/Japanese.lean:125`) and `TauCeti.Ring.IsNagata` (`RingTheory/Nagata.lean:65`) |
| `Excellence.GeometricallyRegular` (170), `Excellence.RegularAlgebraMap` (176), `Excellence.regularLocus` (181) and `Excellence.IsGRing` (185) | `TauCeti.Excellence.*`, in `RingTheory/RegularLocalRing/`: `GeometricallyRegular.lean:70`, `RegularAlgebraMap.lean:54`, `Locus.lean:61`, `GRing.lean:57` |
| `FlatAnnihilator.annihilator_flat_baseChange` (275) and `FlatAnnihilator.element_annihilator_flat_baseChange` (282) | `TauCeti.annihilator_flat_baseChange` and `TauCeti.element_annihilator_flat_baseChange`, `RingTheory/Flat/Annihilator.lean:67, 82` |
| `NormalSchemes.IsNormalScheme` (299) and `NormalSchemes.IsNormalScheme.isDiscreteValuationRing_stalk` (310) | `TauCeti.AlgebraicGeometry.IsNormalScheme`, `AlgebraicGeometry/Scheme/Normal.lean:84, 203`; `IsNormalScheme.isReduced` is at `:177` |
| `NormalSchemes.coheight_eq_one_of_coheight_apply_eq_one` (319), `NormalSchemes.coheight_apply_eq_one` (327), `NormalSchemes.coheight_apply_eq_one_of_isNormalScheme` (335), `NormalSchemes.codimensionOneMap` (342) and `NormalSchemes.codimensionOneMap_surjective` (349) | `AlgebraicGeometry/Morphisms/CodimensionOne/Basic.lean:72, 91, 105`, `FiniteType.lean:103` and `Normal.lean:99` |
| `NormalSchemes.ramificationIdxAt` (356) and `NormalSchemes.ramificationIdxAt_comp` (363) | `AlgebraicGeometry/Morphisms/RamificationIdx/Basic.lean:74` and `RamificationIdx/Normal.lean:60` (`ramificationIdxAt_comp_of_coheight_eq_one`) |
| `NormalSchemes.exists_regularSystem_of_quotient` (375) | `RingTheory/RegularLocalRing/Quotient.lean:98` |
| `SchemePresheaf` (394), `Spaces.RepresentableDiagonal` (401), `Spaces.EtaleAtlas` (406) and `Spaces.IsAlgebraicSpace` (412) | `TauCeti.AlgebraicGeometry.SchemePresheaf` and `TauCeti.AlgebraicGeometry.Spaces.*`, `AlgebraicGeometry/AlgebraicSpace/Basic.lean:68, 74, 113, 195` |
| `Formal.IsThickening` (917) and `Formal.IsFirstOrderThickening` (922) | `AlgebraicGeometry/Morphisms/Thickening.lean:69, 147` |
| `Formal.IsModification` (1068) | `AlgebraicGeometry/Morphisms/Modification/Basic.lean:53` |
| `Formal.IsRegular` (1101) and `Formal.resolution_of_curves` (1108) | `AlgebraicGeometry/Scheme/Regular/Scheme.lean:68`; `isRegular_normalization_fromSpecStalk_genericPoint` (`AlgebraicGeometry/Normalization/Regular.lean:112`) and `isModification_fromNormalization_fromSpecStalk_genericPoint` (`Normalization/Modification.lean:59`) |
| `Chow.cyclesOfDimension` (1295), `Chow.RatEquiv` (1305) and `Chow.ChowGroup` (1318) | `TauCeti.AlgebraicGeometry.Chow.*`, `AlgebraicGeometry/Chow/Basic.lean:86, 257, 295` |

The README also specifies, with no citation, several targets that Tau Ceti already has at `2fd255d9`:

- **§0.10.** `IsLocalRing.IsUnibranch` and `IsLocalRing.IsGeometricallyUnibranch` (`RingTheory/LocalRing/Unibranch.lean:57, 110`), and `Scheme.IsGeometricallyUnibranchAt` and `IsGeometricallyUnibranch` (`AlgebraicGeometry/Scheme/Unibranch.lean:43, 54`). The strict henselization is `TauCeti.StrictHenselization.algebra` (`RingTheory/StrictHenselization/Algebra.lean:75`), which PurityForFlatCohomology already cites.
- **§0.16.** `IsUniversallyCatenary` (`RingTheory/UniversallyCatenary.lean:56`).
- **§0.17.** Cohen–Macaulay modules (`RingTheory/CohenMacaulay/Basic.lean:67`).
- **§0.23.** `IsUniversalHomeomorphism` (`AlgebraicGeometry/Morphisms/UniversalHomeomorphism.lean:64`).
- **§0.29.** `SchemeCharP` (`AlgebraicGeometry/Scheme/Characteristic.lean:43`) and Frobenius.

**Tested on the refuting instance.** After the repair:

- `TauCeti.Ring.IsJapanese` and `TauCeti.annihilator_flat_baseChange` are the only definition of Japanese rings and the only statement of the flat annihilator formula. `TauCeti.Henselization.algebra` already plays that role for the henselization.
- The deleted strands also remove R10's §0.27 inconsistency: `README.md:1747–1748` says that `Suggested.lean` carries `element_annihilator_flat_baseChange`, but the *Lean:* line at `:1789` omits it.

## R02 (P2) — §0.13 *henselization_recognition*: the hypothesis "S is initial among such" is the conclusion

**Location.** `README.md:1057–1059`: "a flat ind-étale `R`-algebra `S` with `R/I ≅ S/IS` such that `(S, IS)` is henselian and `S` is initial among such is `R^h`".

**Claim.** This is a criterion that recognises the henselization.

**Witness.**

- `R^h` meets every other hypothesis: Tau Ceti `indEtale`, `quotient_bijective` and `henselian`.
- `R^h` is initial among all henselian pairs under `(R, I)` (`existsUnique_lift`), so uniqueness of initial objects alone gives the statement.
- Clausen–Mathew–Morrow 2021, Remark 3.19 (arXiv 1803.10897v2, p. 22, line 911), assumes no initiality.

**Repair.** Replace the statement with: "let `S` be an ind-étale `R`-algebra such that `R/I → S/IS` is bijective and `(S, IS)` is henselian. Then the `R`-algebra map `R^h → S` of `existsUnique_lift` is an isomorphism (Clausen–Mathew–Morrow 2021, Remark 3.19, p. 22)."

- Drop "flat": it is Tau Ceti's `IndEtale.flat`.
- Add a negative-control Check: for `(ℤ, (5))` and `S = ℤ`, `S` is ind-étale and `S/5S = 𝔽_5`, but `T² + 1` has the simple root `2` mod `5` and no root in `ℤ`. So the henselian hypothesis cannot be dropped.

**Tested on the refuting instance.**

- For `S = R^h` the repaired statement yields the identity.
- For `S = ℤ` over `(ℤ, (5))` its hypothesis fails, as it must.
- The criterion now has content: by §0.13's *IndEtale.comp*, `ℤ_{(5)}^h` (ind-étale over `ℤ`) is the henselization of `(ℤ, (5))`.

## R03 (P3) — The README names pins `1b1ccf4b`/`2fd255d9`; `lake-manifest.json` at this head pins `f6090c70`/`358314d4`

Carried from r54 R01 and r57 R03: not repaired.

**Location.** `README.md:378`, `:419`; `lake-manifest.json`.

**Witness.** `lake-manifest.json` pins `358314d4…` (Tau Ceti) and `f6090c70…` (Mathlib). `origin/main` (`34f48ff`) pins `2fd255d9…`/`1b1ccf4b…`. At `358314d4`, `TauCeti/RingTheory/Henselization/` does not exist, so every `TauCeti.Henselization.*` citation at `README.md:172–194` and `:442–455` fails at this head's pin.

**Repair.** Merge `origin/main`, then rerun the push gate and the targeted build. R01's repair comes due at the same merge.

**Tested.** After the merge the manifest names the two hashes that the README states, and the henselization citations resolve.

## R04 (P3) — The pull-request description describes a §4.10A this head lacks and states no order with the four conflicting heads

Carried from r54 R02 and r57 R04: not repaired.

**Location.** The pull-request description.

**Witness.**

- It promises "New section 4.10A … from a compatible polarized adic system" and "README-only". This head has no §4.10A, puts polarized algebraization out of scope (`README.md:74–75`, `:5524–5526`), and changes `Suggested.lean`.
- `scratch/overlaps.md`: #1656, #1807, #1808 and #1854 conflict with this head.

**Repair.** Rewrite the description so that it says what the branch does against main: the README rewrite, the `Suggested.lean` reduction and henselization moved to Tau Ceti. Add one line per conflicting pull request saying which side rebases. No file change.

**Tested.** A description that names the four pull requests with an order, and no §4.10A, matches this head.

## R05 (P3) — Padding: `Formal.strictTransform_supportComparison_affine`

**Location.** `Suggested.lean:1060–1064`; *Lean:* line at `README.md:5634`.

**Witness.** It closes in six lines from Mathlib's `Ideal.exists_pow_le_of_le_radical_of_fg`, with `Submodule.mem_annihilator_span_singleton` and `Ideal.pow_mem_pow`; the proof elaborated on a scratch copy. It is an affine helper for strict transforms, not a headline.

**Repair.** Delete it from `Suggested.lean`. In `README.md:5634`, set the name in italics and remove it from the *Lean:* line; §4.11 keeps the statement.

**Tested.** The scratch proof elaborates with no diagnostic. The other 59 sorried declarations refused the one-tactic probe.

## R06 (P3) — Locators in the seeded sample

All in `stacks-project` book.pdf.

- **§0.10 (`README.md:925–926`).** `isUnibranch_iff_irreducible_henselization` cites Lemma 15.108.5, which is the strict-henselization criterion (06DM, p. 1511, line 71973–71980). The henselization criterion is Lemma 15.108.3 (0BQ0), p. 1509, line 71875–71880. **Repair:** cite 0BQ0 for the first statement and 06DM for the second.
- **§2.20 (`README.md:4283`).** "Definition 48.28.1 (0E2S)": 0E2S is the section tag (line 197826). The definition is 0E2T, p. 4153 (line 197836). **Repair:** "(0E2T)".
- **§2.20 (`README.md:4280`).** "Stacks, Chapter 36, the section on relatively perfect objects" is not a locator. The definition is 36.35.1 (0DI0), p. 3155 (line 149761). **Repair:** cite it.
- **§1.7 (`README.md:2236–2239`).** `points_ofScheme`, `points_atlas_surjective` and `points_pullback` carry no locator. They are Lemmas 66.4.2 (03BV), 66.4.4 (03H5) with 66.4.6 (03BX), and 66.4.3 (03H4), pp. 5297–5299 (lines 253461, 253481, 253514, 253467). **Repair:** add these locators.

**Tested.** Each repaired tag is printed at the cited line, with the statement the README makes.

## R07 (P3) — §1.7: the equivalence of field-valued points is stated the wrong way round

**Location.** `README.md:2233–2234`: "two being equivalent when they factor through a common `Spec K''`".

**Witness.** Stacks (line 253442–253453, p. 5297): `(Spec K, p)` and `(Spec L, q)` are equivalent when there are field extensions `K → Ω` and `L → Ω` such that `p` and `q` agree in `F(Spec Ω)`. This is a common extension, not a common point through which both factor.

**Repair.** Use the Stacks wording. Keep the Check "`|h_{Spec L}|` is one point" (`README.md:2245`) as its test.

**Tested.** For `L/K` quadratic with conjugation `σ`, the points `id` and `Spec σ` of `h_{Spec L}` agree after `Ω = L` with the embeddings `id` and `σ`, since `σ² = id`. So `|h_{Spec L}|` is one point.

## R08 (P3) — §2.16: the `X_{k^s}` clause states nothing and is not in the cited section

**Location.** `README.md:3901–3903`: "for `X` a smooth curve over a field `k` the cohomology of `𝔾_m` on `X_{k^s}` with its Galois action (Stacks, … Theorem 59.68.5 (03RH))".

**Witness.** Section 59.68 (03RH) fixes an algebraically closed `k` (line 232955, p. 4874). The clause names no group and gives no value.

**Repair.** Either state the computation over `k̄`, or cut the clause. Over `k̄` it reads: `H^q(X_{k̄}, 𝔾_m) = 0` for `q ≥ 2`, `H¹ = Pic(X_{k̄})`, with the action of `Gal(k^s/k) = Aut(k̄/k)`. The ground-field consequences then belong to §2.15's Hochschild–Serre.

**Tested.** The repaired statement is Theorem 59.68.5 and Lemma 59.68.4 (lines 233016, 233008, p. 4875) applied to `X_{k̄}`.

## R09 (P3) — §4.3 Checks use names that no target defines

**Location.** `README.md:5182–5192`: "`vanishingSubterminal a b ha` has a point …"; "`point_functor` requires every value inhabited".

**Witness.** `vanishingSubterminal` occurs only at `README.md:5182, 5186`, and `point_functor` only at `:5192`. Neither is a §4.2–4.3 definition or a `Suggested.lean` declaration.

**Repair.** In the Check, describe the functor in prose: the subfunctor of the point with a point at `A` exactly when `a_A = 0` or `b_A = 0`. Replace `point_functor` by "the one-point functor".

**Tested.** The H1 failure at `k[ε₁, ε₂]` (`a ↦ ε₁`, `b ↦ ε₂`, empty fibre product over two singletons) needs neither name.

## R10 (P3) — Tau Ceti contract: `quotientBaseChangeEquiv` has no Noetherian hypothesis

**Location.** `README.md:446–448`: "`isNoetherianRing`, `faithfullyFlat_adicCompletion`, `quotientBaseChangeEquiv` … with no Noetherian hypothesis except in the last three".

**Witness.** `TauCeti/RingTheory/Henselization/BaseChange.lean:33` at `2fd255d9` has only the variables `{R : Type u} [CommRing R] (I J : Ideal R)`, and its docstring (line 16) says "no Noetherian hypothesis".

**Repair.** Write "except in `isNoetherianRing` and `faithfullyFlat_adicCompletion`".

**Tested.** `Noetherian.lean:62, 72` carry `[IsNoetherianRing R]`, and `BaseChange.lean` does not.

## Previous findings (r57)

- **R01 (henselization), repaired.** `Suggested.lean` no longer declares a `Henselization` strand. `README.md:172–194` and `:442–455` cite Tau Ceti. I checked all 27 cited `TauCeti.Henselization.*` names at `2fd255d9`, for example `existsUnique_lift` at `Lift.lean:130`, `bijective_algebraMap_of_henselianRing` at `:155`, `indEtale` at `IndEtale.lean:47` and `quotientBaseChangeEquiv` at `BaseChange.lean:89`. I also checked `TauCeti.Algebra.IndEtale` (`Etale/IndEtale.lean:68`) and the eleven henselian-pair names (`Henselian/Section.lean:159`, `Quotient.lean:34`, `Product.lean:113`, `DirectLimit.lean:50`, `Radical.lean:34`, `Ideal.lean:41, 100`, `Idempotent.lean:170`, `Etale.lean:106`). Only R10's hypothesis remark is wrong. The same defect remains elsewhere (R01 above).
- **R02 (thickening gloss), repaired.** `README.md:5054–5058` now quotes 00IL, 0EGG and 00IM. All three are on p. 498, lines 23745, 23748 and 23767, and match. The new §4.1 Check covers `A = k[x₁, x₂, …]/(x₁, x₂², …)`.
- **R03 (pins), not repaired.** Carried as R03.
- **R04 (description), not repaired.** Carried as R04.
- **R05 (padding), repaired.** All five strands are deleted, and their names are italic at `README.md:483`, `:1591`, `:1857`, `:1975`, `:3708` and `:6155`.
- **R06 (§0.30 → §4.13 edge), repaired.** *IsNormalScheme.of_isRegular* is in §4.13 (`:5673`, with 00NP and 0567 checked). §4.13's *Needs:* lists §0.30 (`:5700`), and `:2055` "No later layer" is true.
- **R07 (locators), repaired.** 09E1 is p. 887 (line 41960), 0CK0 p. 1946 (line 92799) and 02WS p. 5275 (line 252351). §3.2 now cites 0E3B and 0AYY and points to §3.6.
- **R08 (§3.6 Milne), repaired.**
  - Milne III: Theorem 1.6 is on p. 88, Remark 1.4 on p. 86, Remark 1.11 on p. 90, and Propositions 1.13–1.14 on p. 90 (`milne-av` lines 3501, 3582, 3647, 3666, 3677; PDF page = printed + 6).
  - Stacks 0BA0 (1) is on p. 3930 (line 187167) and 0C1A on p. 4447 (line 211591).
  - Poonen–Stoll §2 is on pp. 1113–1114 (`poonen-stoll-1999` lines 163–222; torsor, `k`-points and `t_x`). Index and period are defined on p. 1126 (line 661).
  - "The class of `Pic^1` has order the period" is derived from §2 in one line rather than stated there. That is acceptable.

## Verified sound

### Gate, dependency check, elaboration and signatures

- **Gate.** The worker's gate at b06bd13 reports every counter 0 and `OK`.
- **Dependency check.** The requested `--depcheck` prints `depcheck: 239 roadmaps, 2324 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. The roadmap is on main and is not in `ORDER.txt`.
- **Suppliers.** AlgebraicVectorBundles, StableReduction, JacobianChallenge, ClassFieldTheory, ProfiniteCohomology, QuadraticFormInvariants and GrothendieckEulerForms are all on main. ModularCurves, AlgebraicCurves and EtaleCohomologyFoundations are cited only as consumers or comparison owners.
- **Changes outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SchemeAndStackFoundations'` is empty. `PROGRESS.md`, `STATUS.md` and `metadata.toml` are main's generated files.
- **Elaboration.** `lake env lean …/Suggested.lean` exits 0 in 1m19s, with 60 `declaration uses sorry` warnings and no other diagnostic.
- **Padding probe.** A scratch copy with every `sorry` replaced by `first | rfl | (simp; done) | infer_instance | trivial | exact fun _ => trivial` produced 60 errors out of 60, so no declaration closes in one tactic. R05 is the targeted six-line proof.
- **Signatures.** A `#check @name` file for all 136 declarations, importing the built module, elaborated with 0 errors. I compared the elaborated types with the README for these declarations: `artinBootstrap`, `torsorRepresentability`, `grothendieck_existence`, `grothendieck_existence_fullyFaithful`, `algebraize_hom`, `alteration_theorem`, `semistable_alteration_theorem`, `weil_bound`, `unibranch_finite_components`, `IsQuasiExcellentRing.isNagata`, `codimensionOneMap` and `isAffine_of_H1_vanishing`.
  - Every standing binder is present, for example `[IsLocallyNoetherian X]`, `[IsTrait R]`, `[Finite k]` and `[QuasiCompact f]`.
  - Artin's bootstrap matches Stacks 04S6 (3) (line 291663, p. 6097), which has no diagonal hypothesis. Its `ha`, `hflat` and `hsurj` encode "representable by algebraic spaces, flat, locally of finite presentation, surjective".
  - Nothing was changed.

### Seeded sample: Stacks numbers, tags and pages in `stacks-project` book.pdf (book line numbers)

- **§0.9.** 01YW, 01YX (p. 2757), 01YZ, 0CUF, 01S7, 01Z7, 01Z9, 07RN, 01ZA, 01ZM, 01XT. The properties match their lemmas one by one: flat 04AI, smooth 0C0C, étale 07RP, proper 081F, finite 01ZO, closed immersion 01ZP, open immersion 0EUU, isomorphism 081E (lines 131701–132389).
- **§0.10.** 0BPZ (p. 1508; the definition matches, line 71815), 04GP, 04GQ, 03RV, 04MF. 15.108.5 is R06.
- **§0.11.** 02KH (flat base change, qcqs `f`), 02L5, 02L7, 02KU, 02KZ, 02L1, 02VL, 02VN, 02V5, 02G7, 02G8, 02GE, 02GF. Bhatt–Ma–Patakfalvi–Schwede–Tucker–Waldron–Witaszek, Convention 4.1 (arXiv 2012.15801v3, line 1547, p. 35) defines `X⁺` as the limit over finite covers inside a fixed `\overline{K(X)}`, matching the README.
- **§0.12–0.14.** 0A02 (p. 1225), 0A03, 0AGV (p. 1226), 04GV (p. 858; the statement matches line 40597–40601), 07QY (p. 1626, henselian G-ring), 07QR, 07PX, 0DYE (p. 1227, with `V(J) = V(IB)`), 0H7Q (pp. 1227–1228), 09XI (pp. 1220–1221; all five conditions as in `README.md:1085–1090`), 09XK (p. 1222), 0FWU (p. 1224), 0D4A, 09ZL, 04GG, 0H74 (p. 1229). Bhatt–Scholze 2014, Proposition 2.3.3 (4) (`bhatt-scholze-2014` line 518) is the ind-étale composition. Clausen–Mathew–Morrow, Remark 3.19 (p. 22) is R02.
- **§0.27.** 07T8 is Lemma 10.40.4, which gives both the element and the finite-module statements (line 25077–25079). 00DF is Lemma 10.12.10.
- **§1.7.** 03BU, 03BY, 03BZ (pp. 5297–5300); `opensEquiv` matches 03BZ (1). The rest is R06 and R07.
- **§2.7.** 0A39 (Section 20.21), 0G71–0G73 (Lemmas 20.34.5–20.34.7, under 0G6Y), 0954 (line 192332), 0955, 0957, 0AM0, 0A6T, 0AVZ, 0BUW.
- **§2.8.** Boxer–Calegari–Gee–Pilloni (arXiv 1812.09269v3 and the author copy): §3.9.5 is on pp. 63–64 (line 3092), Theorem 3.9.6 on p. 64 (line 3111; hypotheses (1) codimension and (2) affine strata maps, maximal CM `F`), Remark 3.9.7 on p. 64.
- **§2.16.** 03R8 (Proposition 59.67.4), 03R9, 03RC, 03RF, 03RG (`K/k` of transcendence degree 1, with no finite generation), 03RI–03RM, 0DHM, 0DHP. The Lean Tsen statement (`K` algebraic over `k(t)`) is 03RG at `q = 2`. The `X_{k^s}` clause is R08.
- **§2.20.** 0E2D, 0E2F, 0E2G, 0E2U, 0E2V, 0E2W, 0E2X, 0E2Y, 0E2Z, 0DI2, 0BV8, 0C0Z, 0C10, 0AWQ, 0E9W, 0C08, 0E9Z, 0BRT, 0FVU, 0E31, 0A9D. The definition of the pair (`ξ : Δ_*O_X → L pr₁^*K|_W`) matches line 197836–197843. The tags are R06.
- **§4.3.** All 18 tags hold, with their numbers: 06GT, 06GS, 06IH, 06HW, 06IG, 06J2, 06J9, 06HY, 0D3G, 06J6, 06JA, 06HX, 06J4, 06J7, 06JI, 06II, 06IJ, 06IC (pp. 6532–6571).
- **§4.8–4.9.** 0AIZ, 0AMC, 0GBA, 087X (Lemma 30.23.2), 0881, 087W, 0880. 02O5, 0897, 02OB, 02OC (the formal-functions isomorphism, line 125255–125260), 087U, 02OD (locally Noetherian `Y`; the README's "Noetherian" is narrower but not false), 03H0 (Stein factorization, locally Noetherian base).
- **§4.20.** de Jong 1996 is uncertified; the statements were checked mathematically (table). The Lean `semistable_alteration_theorem` and `IsStrictSemistablePair` match the README's prose, including the exact boundary equality.
- **§5.8.** 02UO (Section 42.66, p. 3845) states only the proper smooth case with locally free `R^i f_*E` and `T_{X/Y}`, as the README says. Fulton is not verifiable.

### Library and cross-roadmap checks

- **Tau Ceti at `2fd255d9`.** I opened 27 henselization names, 7 `IndEtale` names and 11 henselian-pair names (R01 of r57), plus 30 declarations in R01's table and the five README-only items under it.
- **Mathlib at `f6090c70`.** `IsAdicComplete.henselianRing` (`RingTheory/Henselian.lean:154`), `Ideal.exists_pow_le_of_le_radical_of_fg`, `Submodule.mem_annihilator_span_singleton` and `Ideal.pow_mem_pow`, used in R05.
- **Unresolved-name leads.** `scratch/citations.md` reports no cross-roadmap citation found nowhere. Of its 147 Lean-name leads, 81 are declared in `Suggested.lean`. The other 66 are proposed names in strands that `Suggested.lean` does not carry (`Stack.*`, `Mbar.*`, `Groupoid.*` and so on), as Convention 5 allows, and the gate's `readme-ids-missing` is 0.
- **Overlaps.**
  - `scratch/overlaps.md` lists no dropped id and no id that only an open revision defines.
  - Of the closest open roadmaps, EtaleDualityAndPerverseSheavesPartII declares two gaps on this roadmap: `gap:henselian-quasi-excellent-catenary` at §0.21 and `gap:elkik-finite-algebra-completion` at §0.14.
  - AlgebraicModuliForArithmeticGeometryPartII declares `gap:relative-exceptional-degree-witnesses` and `gap:projective-nef-big-criterion`.
  - These are consumer contracts, which the intake routes to this roadmap's job; they are not findings here.
  - No object is owned by both this roadmap and another open roadmap that I read: AdicCoefficientsAndComparisonsPartII, PurityForFlatCohomology, EtaleDualityAndPerverseSheavesPartII and AlgebraicModuliForArithmeticGeometryPartII.

### Headline theorems

The headlines in the Summary (`README.md:16–22`) are:

- **Stated in `Suggested.lean`.** Artin's bootstrap (`Groups.artinBootstrap`), Grothendieck existence (`Formal.grothendieck_existence` and `_fullyFaithful`), algebraization (`Formal.algebraize_hom`), de Jong (`DeJong.alteration_theorem` and `semistable_alteration_theorem`) and the Weil bound (`weil_bound`).
- **Named as not statable in the module docstring, with the missing carrier.** Keel–Mori, coherent duality, the Brauer class, the Picard torsors, Schlessinger, GRR and Hodge index.

The docstring's §0.29 bullet is false at `2fd255d9` (R01).

### Adversarial table

| Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|
| §0.9 spreading out (01ZM, 07RP) | `S = Spec ℤ`, `X_η = Spec ℚ[x]/(x²−2)` | discriminant of `x² − 2` is `8`: the model `ℤ[1/2][x]/(x²−2)` is étale over `D(2)` | Pass |
| §0.10 unibranch vs `A^h` (0BQ0) and geometric vs `A^sh` (06DM) | node `y² = x²(x+1)`; `ℝ[x,y]/(x²+y²)` | node: 2 points over the origin, 2 minimal primes of `A^h`. `ℝ`-cone: 1 point with residue field `ℂ`, so unibranch, `A^h` has 1 minimal prime and `A^sh` has 2 (`x ± iy`) | Pass; locator R06 |
| §0.10 Check, eventually constant `A ⊂ 𝔽₂^ℕ` | `q : A → 𝔽₂` | `m∞` misses `e_j` for large `j`, so it is not f.g.; `{m∞}` is closed and every neighbourhood contains all but finitely many points, so it is not open | Pass |
| §0.11 `field_extension_descent` (02KH) | `X = ℙ¹_k`, `k' = k(t)` | `Γ(X_{k'}, O) = k' = k ⊗_k k'` | Pass |
| §0.12 pair Checks | `(ℤ[i,1/2],(2+i))`; `(ℤ[√2,1/2],(5))` | `N(2+i) = 5`, residue field `𝔽_5`; squares mod 5 are `{1,4}`, so `2` is not a square and the residue field is `𝔽_25` | Pass |
| §0.12 `henselization_padic` | `i ∈ ℤ_5` | `−1 ≡ 2² mod 5`, so `i ∈ ℤ_{(5)}^h`; `ℤ_{(5)}^h` is countable and `ℤ_5` is not | Pass |
| §0.13 integrality Check | `R = ℤ_{(p)}`, `R' = R[T]`, `X² − X + pT` | `(2X−1)² = 1 − 4pT`: even `T`-degree against degree 1, so there is no root; also for `p = 2` (`1 − 8T`) | Pass |
| §0.13 coprime product | `(ℤ,(6))`; `(2) ∩ (4)` | `(2)+(3) = ℤ` gives a product; `(2)+(4) = (2) ≠ ℤ` and `√(4) = (2)` give `ℤ_{(2)}^h` | Pass |
| §0.13 *henselization_recognition* | `S = R^h`; `S = ℤ` over `(ℤ,(5))` | `R^h` satisfies all hypotheses and is initial by `existsUnique_lift`, so the stated form is tautological; for `S = ℤ`, `T² + 1` has the simple root `2` mod 5 and no root in `ℤ`, so it is not henselian | **R02** |
| §0.14 permanence failure (0FWU) | `ℤ_p ⊗_ℤ ℤ_p` | `A/pA = 𝔽_p`, yet `Spec A` is disconnected, so the pair is not henselian | Pass |
| §0.27 flat annihilator | `ℤ/4 → ℤ/2`, `m = 2`; `ℤ/4 → (ℤ/4)²` | `(2)·ℤ/2 = 0` against `Ann(1⊗2) = Ann(0) = ℤ/2`, which fails without flatness; `(2)×(2)` on both sides | Pass |
| §1.7 points | `h_{Spec L}`, `L/K` quadratic | `Spec σ` equals `id` after `Ω = L` (`σ² = id`), so there is 1 point | Pass; wording R07 |
| §2.7 non-Noetherian Check | `A = k[x_j]/(x_j^{j+2})`, `a = x₀`, `n = 3` | `x₂³ ∈ I³`, `x₂⁴ = 0` but `x₀x₂³ ≠ 0`, so native `H⁰ = 0` against geometric `H⁰ = A` | Pass |
| §2.7 `𝔸¹`, `Z = {0}` | `O` | `0 → H⁰_Z → k[t] → k[t,t⁻¹] → H¹_Z → 0`: `H⁰_Z = 0`, `H¹_Z = k[t,t⁻¹]/k[t]` | Pass |
| §2.8 Cousin Checks | DVR; `k[x,y]/(xy,y²)` | `R → K → K/R` exact; `y ↦ 0` in `Γ(D(x)) = k[x,x⁻¹]`, so the augmentation is not injective | Pass |
| §2.16 Tsen (Lean) | `K = k(t)` | `Br(k(t)) = 0` (03RG, `q = 2`) | Pass |
| §2.16 nodal cubic descent | `ℙ¹ → C` | `H¹(C, ℤ/n) = coker(ℤ/n → (ℤ/n)²) = ℤ/n` | Pass; clause R08 |
| §2.20 Checks | `k[x,y]/(x,y)²`; `ℙ¹`; nodal cubic | socle dimension 2, so `ω` needs 2 generators; `deg O(−2) = −2 = 2·0−2`; `deg ω = 0 = 2·1−2` | Pass |
| §4.3 H1 failure | `Λ = k[[a,b]]`, `k[ε₁,ε₂]` | `F(A') = F(A'') = pt`, `F(A'×_k A'') = ∅` | Pass |
| §4.3 tangent of `ℤ_p[[x]]` | `k = 𝔽_p` | `|T| = p` against `|(m/m²)^∨| = p²` | Pass |
| §4.3 differential direction | `t ↦ u²`; `t ↦ u` | `(aε)² = 0`, so 0; identity, so not 0 | Pass |
| §4.8 completion functor | multiplication by `t` on `k[[t]]` | injective, but zero mod `t` | Pass |
| §4.9 Stein / Zariski | blow-up of `𝔸²` at `0` | `f_*O = O`, fibre `ℙ¹` connected | Pass |
| §4.20 inseparable trait extension | `t ↦ u^p` over perfect `k` | `[k((u)):k((t))] = p`, purely inseparable; base change `k[[v]][u]/((u−v)^p)` has reduction `k[[v]]` | Pass |
| §4.20 semistability tests | `xy−p`, `xy−p²`, `x²−p` | regular SNC; singular node; special fibre `𝔽_p[x]/(x²)` nonreduced. A duplicated component `(x)·(x)` fails the codimension clause: `1 ≠ 0 + 2` | Pass |
| `semistable_alteration_theorem` | `X = Spec K` over `R`, `Z = ∅` | `X_s = ∅`; take `X̄₁ = Spec R`, `H = ∅`; `{closed point} = (range j)ᶜ` | Pass |
| `alteration_theorem` | `𝔸¹_k`, `Z = V(t)` | `X̄₁ = ℙ¹`, `B = {0, ∞}` SNC, equal to `(range j)ᶜ ∪ j(φ⁻¹Z)` | Pass |
| `artinBootstrap` | `F = h_X`, `a = 𝟙` | pullbacks `h_T`; flat and LFP hold; 04S6 (3) | Pass |
| `grothendieck_existence` / `algebraize_hom` | `A = k[[t]]`, `X = Spec A`, `Y = 𝔸¹_A` | `F_n = A/t^{n+1}`, `M = A`; compatible `a_n` give `a ∈ A`; `a₀ = 0, a₁ = 1` excluded by `hcompat` | Pass |
| `weil_bound` | `ℙ¹/𝔽₂`; `y²=x³−x/𝔽₃`; `y²=x³+x+1/𝔽₅` | `|3−3| = 0 ≤ 0`; `|4−4| = 0 ≤ 2√3`; 9 points, `|9−6| = 3 ≤ 2√5 ≈ 4.47` | Pass |
| §5.8 Checks | smooth divisor `D`; `ℙ²`, `d = −3` | `ch(O − O(−D)) = 1 − e^{−D}`; `C(−1,2) = 1 = h²(O(−3))` | Pass |
| §3.6 conic | `x²+y²+z² = 0/ℝ` | `Pic = 2ℤ`, `Pic_{X/ℝ}(ℝ) = ℤ`, cokernel `ℤ/2 = Br(ℝ)` | Pass |
| R01 sample | `Ring.IsJapanese` against `TauCeti.Ring.IsJapanese` | same binders and conclusion `Module.Finite R (integralClosure R L)` | **R01** |
| R05 | `strictTransform_supportComparison_affine` | six-line proof elaborates | **R05** |
| R10 | `quotientBaseChangeEquiv` | binders `(I J : Ideal R)` only | **R10** |

## Not verifiable

- **de Jong 1996, Hartshorne 1977 and Fulton 1998.** de Jong and Hartshorne are settled as uncertified in the manifest; I found no legal text of Fulton in the cache. Their statements were checked mathematically only (table).
- **Klevdal–Patrikis 2024 (§0.9), Couveignes 2019 and Česnavičius 2020 (§0.10).** No legal text was in the cache, and this review edits no manifest, so I did not fetch them.
- **Grothendieck, Brauer I/II (§2.22).** I did not check them in this round.
- **Elaboration at `2fd255d9`/`1b1ccf4b`.** The only Lean commands allowed run in this worktree, which has the old pins. Whether `Suggested.lean` elaborates against main's pins is untested (R03).
- **Sections outside the sample and the change set.** About 40 subsections were read only where a finding or a headline led there. Ownership against open pull requests was checked through `roadmaps overlaps` and the READMEs of the four closest open roadmaps, not through every open README.

## Source issues

- **Misprint** in stacks-project at Definition 37.2.1 (04EX)(4), p. 3179: the source says an `n`th order thickening has `X` a closed subscheme of `X`; it should be a closed subscheme of `X′`; affects nothing.
- **Misprint** in stacks-project at the paragraph after Definition 37.2.1 (04EX), p. 3179: the source says "nth order thinking"; it should be "nth order thickening"; affects nothing.
- **Misprint** in stacks-project at Example 15.11.14 (0FWU), p. 1224: the source says "if (A, pA) where henselian"; it should be "were henselian"; affects nothing.
- **Misprint** in stacks-project at Section 42.66 (02UO), p. 3845: the source says "the Grothendieck-Riemann-Roch theorem say"; it should be "says"; affects nothing.
- **Misprint** in milne-av at Chapter III, Remark 1.11, p. 90: the source repeats "that" ("known … that that the image"); it should be a single "that"; affects nothing.
