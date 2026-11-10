# Review of PurityOfBranchLocus (pull request #1807 at a1ae267)

**Verdict:** needs changes

This is a full review. Since 9d475e2 the folder changed by 1037 lines: README.md has 768 lines of churn and Suggested.lean 269. Pins are unchanged: Mathlib `1b1ccf4b0`, Tau Ceti `2fd255d99`, `v4.36.0-rc2`.

All ten findings of the previous review are repaired; the details are under "Previous findings". Three new findings remain. One is P2: three prose sentences describe two Tau Ceti lemmas without their hypotheses, and Convention 5's own example refutes one of them. Two are P3: a gap in the old → new mapping, and a missing locator on §2.2.

## R01 (P2) — Prose states two Tau Ceti lemmas without their hypotheses; Convention 5's own example refutes it

- **Location.** `TauCetiRoadmap/PurityOfBranchLocus/README.md`:
  - lines 19–21: "equality of local dimensions for a dominant locally quasi-finite morphism onto a normal scheme, the equality of the ramification and non-étale loci over a normal base";
  - lines 52–53: "`Scheme.Hom.ramificationLocus_eq_nonEtaleLocus` over a normal base";
  - lines 146–148: "the closed immersion of the origin into `𝔸¹_k` is unramified and not flat) and agree over a normal base".
- **Claim.** These sentences say that the ramification and non-étale loci agree over any normal base, and that local dimensions agree for any dominant locally quasi-finite morphism onto a normal scheme. Both claims are false as written. The pinned lemmas need `X` and `Y` integral and `f` dominant and locally of finite type. The supplier contract (lines 220–224, 232–234) states those hypotheses correctly; the Summary, Scope and Convention 5 drop them.
- **Witness.**
  - Loci: line 147's `ι : Spec k → 𝔸¹_k` has `Ω = 0`, so the ramification locus is `∅`; it is not flat, so the non-étale locus is `{pt}`.
  - Dimensions: for `Spec k ⊔ 𝔸¹ → 𝔸¹`, the isolated point has `0 ≠ 1`.
  - Pins: `RamificationLocus.lean` 197 and `LocallyQuasiFinite.lean` 142 assume `IsIntegral` and `IsDominant`.
- **Repair.**
  - Lines 20–21, 52–53 and 147–148: write "for a dominant morphism of integral schemes, locally of finite type, onto a locally Noetherian normal scheme".
  - Line 19: write "for a dominant locally quasi-finite morphism of integral schemes, locally of finite type, onto a normal scheme".
  - Tested: `ι` is not dominant, and `Spec k ⊔ 𝔸¹` is not integral, so both are excluded. The square map `(x, y) ↦ (x², y)` still satisfies both, with `R = N = V(x)` and dimensions `2 = 2`, `1 = 1`.

## R02 (P3) — The old → new mapping of §0.3 omits the resolution interfaces that DeformationAndDerivedPatchingAlgebra cites

- **Location.**
  - README line 80, the §0.3 row: "global dimension, Auslander–Buchsbaum, Serre's characterization of regular local rings, 0AFS | Tau Ceti, by target in the next table";
  - the target table, lines 87–107;
  - Downstream consumers, lines 508–511.
- **Claim.** On main, §0.3 also planned three interfaces. This README maps none of them:
  - augmented finite free resolutions of a finite module, zero above a projective-dimension bound (Stacks 0CXF);
  - their minimization (00MT);
  - the Koszul comparison (00LS).

  An open roadmap cites §0.3 for the first two. After the merge, its citation resolves to a table with no owner for them. The consumer sentence also omits them.
- **Witness.** DeformationAndDerivedPatchingAlgebra README (open head) line 80: "§0.3 supplies … augmented finite free resolutions of every finite module … and their minimization … (Stacks tags 0CXF, 00MT)". Main's §0.3 planned both; neither table maps them.
- **Repair.** Add three rows to the target table:
  - *finite free resolution of length ≤ n* (0CXF) → `TauCeti.exists_finiteProjectiveResolution_of_hasProjectiveDimensionLE` (`Algebra/Category/ModuleCat/CartanMap/ProjectiveDimension.lean`). Its terms are finite projective, hence free over a local ring by Mathlib's `Module.free_of_flat_of_isLocalRing`.
  - *minimal finite resolution* (00MT) → `TauCeti.exists_minimal_finiteProjectiveResolution_of_hasProjectiveDimensionLE` (`Algebra/Category/ModuleCat/Projective/MinimalResolution/Basic.lean`).
  - *Koszul comparison* (00LS) → internal to 00OA, now `TauCeti.finrank_cotangentSpace_le_projectiveDimension_quotient_maximalIdeal`.

  Then add "finite free and minimal resolutions" to the §0.3 Content cell and to the consumer bullet. Both declarations exist at the pin with zero `sorry` in their files.

## R03 (P3) — §2.2 has no source locator, although SGA 1 X 3.1 supports it

- **Location.**
  - README line 359: "Prove `Scheme.Hom.etale_of_etaleAt_codimOne` (*API*)";
  - the Stacks-alignment row at line 495 ("— | API").
- **Claim.** Every theorem carries a locator, and §2.2 carries none. It is a direct consequence of SGA 1, Exposé X, Théorème 3.1, which §2.3 already cites.
- **Witness.** `sga1` lines 8359–8364 (p. 212) cover a quasi-finite dominant `f` with `X` normal and `Y` regular. For the finite `f` of §2.2, `hgen` gives `Z ≠ X`. A generic point of a nonempty `Z` then has dimension one and is ramified, contradicting the right-hand side.
- **Repair.**
  - At line 359, write "(*API*; derived from SGA 1, Exposé X, Théorème 3.1, printed p. 212)".
  - In the alignment row, put "SGA 1 X 3.1" with class "API (derived)", as for §2.3.

## Previous findings (r54, at 9d475e2)

- **R01 — repaired.** Layers 0–1 and the two §2.3 auxiliaries are gone. Lines 14–22 now read "Everything else the proofs use is at the pins: … Tau Ceti has the equivalence of the stalkwise and Stacks forms…". *This roadmap owns* (lines 39–43) lists only 0BMB, §2.2 and §2.3. A `From Tau Ceti` contract is at lines 182–249.
- **R02 — repaired.** `Suggested.lean` now declares six theorems, and none restates a pinned declaration. The §2.3 statements use `f.ramificationLocus` and `f.branchLocus` from `TauCeti.AlgebraicGeometry.Morphisms.RamificationLocus`, with fully qualified `TauCeti.AlgebraicGeometry.IsRegular`.
- **R03 — repaired.** `etale_of_etaleAt_codimOne` is at `Suggested.lean` line 91, with `hgen : ∃ U : X.Opens, genericPoint X ∈ U ∧ Etale (U.ι ≫ f)`. README line 362 uses the same form.
- **R04 — repaired.** No `test_` name occurs in either file.
- **R05 — repaired.** Lines 378–382: "*Needs:* §2.1; Tau Ceti `Scheme.Hom.ringKrullDim_stalk_eq_of_locallyQuasiFinite`, … Mathlib … `AlgebraicGeometry.FormallyUnramified.stalkMap`, `Scheme.Hom.quasiFiniteAt`". Lines 370–371 now say "a finite morphism is locally of finite type and locally quasi-finite".
- **R06 — repaired.** All required headings are present: Exact supplier contracts (154), How to read the build (257), Examples (455), Dependencies (476) and Downstream consumers (498).
- **R07 — repaired.** `Suggested.lean` line 7 is "# Purity of the branch locus: target signatures", and lines 9–13 add "Every headline is statable at the pins."
- **R08 — repaired.** Line 518 now pins commit `9a20b3f…` under `lean/Pcf/`, the commit Tau Ceti cites (`RamificationLocus.lean` lines 80–81). The names are namespace-qualified. All three files and all three names exist at that commit (checked below).
- **R09 — repaired** for every id it listed: the table at lines 87–107 maps each id with its pinned owner. R02 above is about §0.3 content that was cited by description, not by id.
- **R10 — repaired.** SchemeAndStackFoundations is no longer cited. The 00OC and 0AFS declarations and `IsRegular.isNormal` are now cited at the pin (lines 63–68, 236–249).

## Verified sound

**Gate and dependency check.**
- The worker's gate at a1ae267 passes every check, including `build=0`.
- My standalone gate run with `--base origin/main` gives 0 for every check except `outside-folder=26`. Those 26 are the README and Suggested.lean of the 13 other folders that the brief names as this pull request's own. The `git diff --stat origin/main...HEAD` with the 14 folders excluded is empty, and `lake-manifest.json` and `lean-toolchain` are unchanged.
- The folder holds README.md, Suggested.lean and metadata.toml (`topic = "math.AG"`).
- Dependency check:

```text
depcheck: 234 roadmaps, 2264 edges, 0 problem(s)
```

- The only roadmap supplier is LocalPurity, which is on main. At this head it names this roadmap only as a consumer (its README line 861), so there is no cycle. No gaps are declared: there is no readable `design/plan.json` and no `gap:` contract.

**Elaboration and signatures.**
- `lake env lean TauCetiRoadmap/PurityOfBranchLocus/Suggested.lean` exits 0 with six `declaration uses sorry` warnings (lines 39, 57, 74, 91, 105, 118) and nothing else.
- I compared the six elaborated types in `signatures.md` binder by binder with README §§2.1–2.3. Every hypothesis of the prose is a binder of the declaration itself; no section binder is lost. The only section variable is `{X Y : Scheme.{u}}`, and every theorem mentions it.
- Imports: `import Mathlib` plus three `TauCeti.*` modules, all used. There is no `set_option`, no `lemma`, and no sorry'd data.

**One-tactic padding probe** (scratch copy). In each of the six theorems I replaced `sorry` with `first | rfl | (simp; done) | infer_instance`. All six fail, with errors at lines 48, 67, 83, 97, 111 and 124. Purity in dimension ≥ 3 is not at the pin: a grep of both pins for 0BMB/0BMA finds only the dimension ≤ 2 cases (`RegularLocalRing/Purity.lean` 74, 87). No declaration restates a definition, mirrors a Check or treats a boundary case.

**Headline theorems.** These are the README's headlines:
- 0BMB in stalk, Stacks and affine forms;
- the global corollary;
- SGA 1 X 3.1 for the ramification locus;
- the classical branch-locus form.

All six are statable at the pins and all six are stated. The module docstring's "every headline is statable" is correct.

**Library declarations opened at the pins (71).** A scratch file with 68 `#check @…` lines elaborates with no error on any of them. Its single error was my own namespace slip in an extra `example`; the instance itself is at `Mathlib/AlgebraicGeometry/Morphisms/LocalFlatDescent.lean` 48. Every cited Tau Ceti file has zero `sorry`. Tau Ceti, paths under `TauCeti/`:
- `AlgebraicGeometry/Morphisms/StalkMap.lean`: 136, 201, 222, 290, 303, 324, 363, 376, 389, 401, 418, 509.
- `…/RamificationLocus.lean`: the loci at 104, 111 and 116; then 170, 179, 185, 189, 197, 217, 225, 233, 241.
- `…/LocallyQuasiFinite.lean` 107, 142; `…/Etale/Stalk.lean` 46; `Scheme/Regular/LocalRing.lean` 113.
- `…/ElementaryEtale/Basic.lean` 70; `…/ElementaryEtale/BaseChange.lean` 44.
- `RingTheory/Etale/Normal.lean` 164; `RegularLocalRing/Purity.lean` 88; `RegularLocalRing/Basic.lean` 164, 235; `RegularLocalRing/Normal.lean` 55.
- `RegularLocalRing/ProjectiveDimension.lean`: 222, 336, 376, 392, 415, 441.
- `Scheme/Regular/Scheme.lean` 68, 175; `Scheme/Normal.lean` 84.
- `RingTheory/GlobalDimension.lean` 70, 90, 108, 141; `CohenMacaulay/Resolution.lean` 116; `Depth/AuslanderBuchsbaum.lean` 148, 184; `RegularLocalRing/Free.lean` 93.
- For R02: `Algebra/Category/ModuleCat/CartanMap/ProjectiveDimension.lean` 49 and `…/Projective/MinimalResolution/Basic.lean` 108.

Mathlib:
- `Morphisms/QuasiFinite.lean` 72, 91 (finite ⇒ locally quasi-finite), 333, 359;
- `UnderlyingMap.lean` 216; `Finite.lean` 41, 121; `FormallyUnramified.lean` 148; `Noetherian.lean` 236; `LocalFlatDescent.lean` 48;
- `RegularLocalRing/Defs.lean` 94; `IntegralClosure/GoingDown.lean` 48 (`@[stacks 00H8]`, for an integral extension of an integrally closed domain by a domain); `Ideal/KrullsHeightTheorem.lean` 483 (`@[stacks 00ON]`); `Etale/QuasiFinite.lean` 377 (`@[stacks 00UJ]`);
- `Regular/Free.lean` 35 (hypotheses: finitely presented, Jacobson radical, regular element, as line 94 says); `LocalProperties/ProjectiveDimension.lean` 64; `LocalRing/Module.lean` 299.

Every hypothesis list in the supplier contract matches the pinned statement. Two contract descriptions differ from their pinned statements:
- `isClosed_branchLocus` is stated at the pin for `[UniversallyClosed f] [LocallyOfFiniteType f]`, and README line 231 says so.
- The 02LK statement includes residue-field isomorphisms and the uniqueness of `v`, as lines 208–213 say.

**Sources: seeded sample and every locator.**
- §2.1: `stacks-0BMB` lines 2524–2533 (Lemma 58.21.4). Hypotheses (1)–(5) match `Suggested.lean` lines 39–47. The Lean adds global finite type, and the Stacks form at line 57 removes it again.
- §2.3: `sga1` lines 8355–8364 (Exposé X, Théorème 3.1, printed p. 212). It states 3.1 for `f` quasi-finite and dominant between integral schemes, `X` normal, `Y` regular and locally Noetherian, `Z` the non-étale (= ramified) locus, and `Z ≠ X` ⇒ `dim 𝒪_{X,z} = 1` at the generic points of `Z`. The README's form is more general (locally quasi-finite plus locally of finite type, pointwise). The branch-locus form is derived in the route.
- §2.2: no locator (R03). The derivation from `sga1` 8359–8364 checks.
- Others, each read at its line:
  - `stacks-0BMA` 2503; `stacks-0BJH` 2479 and its proof's discriminant description at 2494–2496, as Convention 5 says; `stacks-0EA4` 3019–3033 ("attributed to Gabber" at 3024–3026); `stacks-0ECD` 3119; `stacks-0BJF` 269.
  - `stacks-01TD` 1605 (Def. 29.21.1); `stacks-02G4` 3333 (29.36.1); `stacks-02GI` 3528 (29.37.1); `stacks-02GU` 3626; `stacks-01WM` 4879.
  - `stacks-033I` 392; `stacks-02IT` 496 (clause (2)); `stacks-0569` 514; `stacks-02LK` 5984; `stacks-02VN` 2792; `stacks-036W` 3086; `stacks-025P` 976; `stacks-039S` 943; `stacks-025N` 953.
  - `stacks-00OC` 12552; `stacks-0AFS` 12566–12567 (both sentences); `stacks-00NS` 11947; `stacks-00NT` 11954; `stacks-00NG` 11802; `stacks-00O6` 12409; `stacks-065T` 12449; `stacks-00O8` 12462; `stacks-00O7` 12478; `stacks-00OA` 12494; `stacks-00OB` 12543; `stacks-090V` 12602; `stacks-0567` 20195; `stacks-00NP` 11920; `stacks-0CXF` 12372; `stacks-00MT` 11464.
  - `sga1` 987–991 (I 9.5).
- The README flags no locator as unverified.

**Provenance (read-only through GitHub).** At commit `9a20b3f351446d64e6015d704198bc71c7002008` of `tdupu/pcfawd-formalization`:
- `lean/Pcf/Stacks/Purity/` holds `Tag0BMA.lean`, `Tag0BMBScheme.lean` and `Tag0BMBSchemeAPI.lean`;
- they declare, respectively, `Pcf.Stacks.zariskiNagataPurity`, `Pcf.Stacks.isStacksEtaleAt_of_zariskiNagataPurity` and `Pcf.Stacks.exists_etale_of_zariskiNagataPurity`.

**Cross-roadmap citations resolved.**
- LocalPurity at this head:
  - §2.1 is at its README line 693, with `Algebra.etale_of_finiteNormal_of_isRegularLocalRing` at its `Suggested.lean` line 45: `2 ≤ ringKrullDim A`, `[Module.Finite A B] [Module.IsTorsionFree A B]`, normal at every prime, étale at primes not over `𝔪`.
  - Convention 5 is at its line 116.
  - These agree with README lines 251–255, and the §2.1 route meets every hypothesis (rows 9–10 below).
- AbhyankarLemma (main) §3.3 (line 333) cites §0.3 for 0AFS, at lines 31, 363 and 375. This is mapped, and line 500 says so.
- ArtinAlgebras (main) cites `TauCetiRoadmap.PurityOfBranchLocus.globalDimension`, `…_le_iff` and `…_le_iff_hasProjectiveDimensionLE` at lines 218–220. All three are mapped. Its `Suggested.lean` does not import this module.
- AdicCoefficientsAndComparisonsPartII (open), lines 16 and 151–153: `free_of_isCohenMacaulay` and `auslander_buchsbaum` are mapped.
- EnhancedDerivedSheaves (open, its first pull request), line 157: `isRegularLocalRing_of_projectiveDimension_residueField` is mapped. Its `Suggested.lean` line 3 imports `TauCetiRoadmap.PurityOfBranchLocus.Suggested`. That import is that roadmap's own form defect, not this folder's.
- CrystallineCohomology, LefschetzPencilsAndVanishingCycles and FiniteFlatGroupsAndIntegralPadicHodgeTheory cite §§0.1, 2.1–2.2. §0.1 is mapped, and §§2.1–2.2 keep their numbers.
- DeformationAndDerivedPatchingAlgebra: R02.
- `citations.md` lists ten names found nowhere:
  - six are this roadmap's own headline names, prefixed under Convention 6;
  - one is LocalPurity's (resolved);
  - three are the provenance names (resolved above).

**Ownership and overlaps.**
- `roadmaps grep` for 0BMB, Zariski–Nagata and X 3.1 finds only consumers of this roadmap. No roadmap on main or in an open pull request owns a second 0BMB or a second ramification or branch locus; the loci are Tau Ceti's.
- `overlaps.md`: #1808 and #1854 carry older copies of this folder. The pull request's merge-order block fixes the order: this pull request, then #1808, then #1854. No dropped ids are reported. PurityForFlatCohomology (closest in vocabulary) owns flat-cohomology purity, a different object.

**Adversarial table.** Notation:
- `k` is a field with `2 ≠ 0` unless stated;
- σ is `(x, y) ↦ (u, v) = (x², y)` on `𝔸²_k`;
- q is `𝔸² → Spec k[x², xy, y²]`;
- F is `t ↦ tᵖ` on `𝔸¹` in characteristic `p`;
- ι is `Spec k → 𝔸¹` at `0`.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| §2.1 stalk form, `Suggested.lean` 39 | `t ↦ t²` at `t = 1` and at `t = 0`; σ at the origin; q at the origin; `𝔽_p(t^{1/p})/𝔽_p(t)`; `𝔸³`, `(x², y, z)` at `(1, 0, 0)` | `t = 1`: dims `1 = 1`, `Ω_x = 0` (`2t` a unit), hunr true; étale. `t = 0`: `Ω_x = k ≠ 0`, hunr false at `x' = x`; not étale. σ: `2 = 2`, `Ω ≠ 0` at `η_{V(x)}`, hunr false; not étale. q: embedding dimension `3 > 2`, hreg false, all else true; not étale. Fields: `dim 0`, hpos false; not étale. `𝔸³`: `3 = 3`, every height-one prime through `P` avoids `x`, hunr true; étale | sound | none |
| §2.1 Stacks form, 57 | `𝔾_m ⊂ 𝔸¹` at `t = 1`, with a summand that is not of finite type added to `X` | hqf with `U = 𝔾_m`; each `x' ⤳ x` lies in `U`, so hunr holds with `U = 𝔾_m`; restriction to `U` is of finite type; étale | sound | none |
| §2.1 affine form, 74 | `k[u, v] → k[x, y]` at `𝔮 = (x−1, y)`, `(x, y)` and `0` | `(x−1, y)`: heights `2 = 2`, `x ∉ q'` for every `q' ≤ 𝔮`, hunr true, `IsEtaleAt`. `(x, y)`: `q' = (x)` has height 1 and `Ω_{(x)} = S_{(x)}/(2x) ≠ 0`, hunr false, not étale. `0`: height 0, hpos false | sound | none |
| §2.2, 91 | inseparable `Spec 𝔽_p(t^{1/p}) → Spec 𝔽_p(t)`; σ; q; `ℤ[i]/ℤ`; `𝟙_Y`; `(xⁿ, yⁿ)` | Inseparable: hgen false, left false, right vacuously true. σ: hgen true (`D(x) ∋ η`), left false, right false at `η_{V(x)}`. q: hgen and right true, left false at `0`. `ℤ[i]`: `Ω = ℤ[i]/(2i)` supported at `(1+i)`, left false, right false. `𝟙`: true ⇔ true. `(xⁿ, yⁿ)`: false ⇔ false at the axes | sound | R03 (locator) |
| §2.3 ramification locus, 105 | σ; `(xⁿ, yⁿ)`; `ℤ[i]`; F; q; separable field extension | σ: `R = V(x)`, maximal `z = η_{V(x)}`, `dim 1`; the origin is in `R` and not maximal. `(xⁿ, yⁿ)`: `R = V(xy)`, two maximal points, each `dim 1`. `ℤ[i]`: `R = {(1+i)}`, `dim 1`. F: `R = 𝔸¹`, hne false; without hne, `z = η` with `dim 0 ≠ 1`. q: `R = {0}`, `dim 2`, excluded by hreg. Separable: `R = ∅` | sound | none |
| §2.3 branch locus, 118 | σ; `ℤ[i]`; F; σ restricted to `𝔸² ∖ {(0,1)}` (not closed) | σ: `B = V(u)`, `w = η_{V(u)}`, `dim 1`. `ℤ[i]`: `B = {(2)}`, `dim 1`. F: `B = 𝔸¹`, `w = η`, `dim 0`, so hne is needed. Restriction: `B = V(u) ∖ {(0,1)}`, maximal point `η_{V(u)}`, `dim 1` | sound | none |
| Prose "loci agree over a normal base", README 20–21, 52–53, 147–148 | ι | base normal; `R = ∅` (`Ω = 0`), non-étale locus `= {pt}` (not flat); `∅ ≠ {pt}`. The pin needs `IsDominant`, `IsIntegral` | false as written | R01 |
| Prose "local dimensions equal … onto a normal scheme", README 19–20 | `Spec k ⊔ 𝔸¹ → 𝔸¹` | dominant, locally quasi-finite, of finite type, `Y` normal; isolated point: `0 ≠ 1`. The pin needs `IsIntegral X` | false as written | R01 |
| §2.1 route, `d ≥ 2`, through LocalPurity §2.1 | σ at the origin: `A = k[u, v]_{(u,v)}`, `B = k[x, y]_{(x,y)}`; the step at `𝔮 = 0` | `B` finite, `A → B` injective (`2 = 2`), torsion free, `2 ≤ dim A`. hpunct fails at `(x)`, consistent with non-étaleness. At `𝔮 = 0`: `k(x, y)/k(x², y)` has degree 2 and is separable, so étale at 0; Stacks' proof applies induction here with `dim 0` (Source issues) | sound | none |
| §2.1 route, `d = 1` | `t ↦ t²` at `t = 1` | `𝒪_Y` a DVR (`dim 1`); hunr at `x` itself; I 9.5 lemma with `1 ≤ 1`; étale | sound | none |
| §2.2 route, dimension input | σ at the origin and at `η_{V(x)}` | `2 = 2` and `1 = 1` by `ringKrullDim_stalk_eq_of_locallyQuasiFinite`, through `IsRegular.isNormal`; `η_X` is the only point of `dim 0` | sound | none |
| §2.2 against SGA 1 X 3.1 | `f` finite dominant, `Z` the non-étale locus | hgen ⇒ `Z ≠ X`; if `Z ≠ ∅`, a generic point of `Z` has `dim 1` and is ramified, contradicting the right side | supported, uncited | R03 |
| Old → new tables, README 76–107 | 19 former ids and their citers | all 19 owners `#check` at the pins; the ArtinAlgebras, AbhyankarLemma, AdicCoefficients and EnhancedDerivedSheaves citations are mapped; DeformationAndDerivedPatchingAlgebra's 0CXF/00MT resolutions are unmapped | partial | R02 |
| Convention 3, quasi-finiteness at a point | `𝔸¹ → Spec k` at `(t)`; `Spec k[t]/(t²) → Spec k` | first: the fibre is 1-dimensional, both forms false; second: both true; agrees with `stacks-01TD` 1605 and Tau Ceti `exists_appLE_quasiFiniteAt_iff` | sound | none |
| §2.1 Checks (4), §2.2 Checks (4), §2.3 Checks (4), Examples (3) | each evaluated against the theorems of its section | every value above agrees with its Check; no Check refutes a theorem | sound | none |

**Remarks needing no change.**
- `[IsLocallyNoetherian X]` in the stalk form follows from finite type over `Y`.
- `[IsDominant f]` in §2.2 follows from `hgen`: étale maps are open, so `f(η_X) = η_Y`.
- Mathlib's fpqc descent instance (line 169) is listed but no *Needs:* line uses it.

## Not verifiable

- O. Zariski (1958) and M. Nagata (1959) are cited only as the theorem's origin, with no locator-bearing claim; I did not open them. The Nagata entry gives no page range, which I could not confirm.
- I read the provenance repository only through GitHub listings and raw files at the pinned commit.

## Source issues

- **Gap** in stacks-0BMB at Lemma 58.21.4, proof, pp. 54–55 (lines 2553–2559): the source applies the induction hypothesis at every point other than `x`, including the generic point, where the dimension is 0 and hypothesis (4) fails; it should handle the generic point by openness of the unramified locus at a codimension-one specialization; affects the proof.
- **Misprint** in sga1 at Exposé X, remark after Théorème 3.1, printed p. 212 (lines 8366–8367): the source says `Z ≠ X` means the extension `R(Z)/R(X)` is separable; it should be the function-field extension `R(X)/R(Y)`; affects nothing.
