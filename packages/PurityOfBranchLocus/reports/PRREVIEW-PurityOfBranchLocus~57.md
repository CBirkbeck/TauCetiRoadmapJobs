# Review of PurityOfBranchLocus (pull request #1807 at 953b278)

**Verdict:** accepted

This is an incremental re-review of 0 changed lines since d1900d4. `git diff d1900d4 953b278 -- TauCetiRoadmap/PurityOfBranchLocus` is empty, and `lake-manifest.json` and `lean-toolchain` are also unchanged, so the pins have not moved. The previous review accepted with no finding, and nothing in the folder has changed since. The other commits on the branch touch only six of this pull request's own other folders: BordismFormalGroups, CharacteristicClasses, GeneralizedCohomology, PadicFunctionalAnalysis, RigidAnalyticGeometry and TopologicalKTheory. This README cites none of them. No finding remains.

## Previous findings

The previous review (r56, at d1900d4) raised no findings. It accounted for r55's R01–R03 as repaired, and nothing has changed since to undo those repairs. The passages still read:

- r55 R01 — repaired: README lines 22–24 and 161–163 still say the loci agree "for a dominant morphism of integral schemes, locally of finite type, onto a locally Noetherian normal scheme". Line 163 adds "the closed immersion is not dominant".
- r55 R02 — repaired: the target table still has rows for 0CXF, 00MT and 00LS (README 100–102), naming `ModuleCat.exists_projectiveResolution_finite`, `ModuleCat.exists_projectiveResolution_finite_free_minimal` and `ChainComplex.liftToAugmented`.
- r55 R03 — repaired: §2.2 still opens "(*API*; derived from SGA 1, Exposé X, Théorème 3.1, printed p. 212)" (README 374–375), and the derivation is at 391–395.

## Verified sound

**Gate.**
- The worker's gate at 953b278 passes every check (`build=0`, `depcheck=0`, `stray-files=0`, `statement-hygiene=0`).
- My standalone run with `--base origin/main` gives 0 for every check except `outside-folder=26`. Those 26 files are the README and Suggested.lean of the 13 other folders the brief names as this pull request's own.
- `git diff --stat origin/main...HEAD` with the 14 folders excluded is empty (exit 0).
- The folder holds README.md, Suggested.lean and metadata.toml.

**Dependency check.** Output:

```text
depcheck: 228 roadmaps, 2110 edges, 0 problem(s)
```

- The only cross-roadmap supplier is LocalPurity §2.1, which is on main and is also one of this pull request's own folders.
- At the head, `TauCetiRoadmap/LocalPurity/README.md` line 695 is the heading "### 2.1 Purity for regular local rings", and its Suggested.lean line 45 declares `Algebra.etale_of_finiteNormal_of_isRegularLocalRing`.
- LocalPurity names this roadmap only as a consumer (README 863), so there is no cycle.
- No gaps are declared.

**Elaboration.**
- `lake env lean TauCetiRoadmap/PurityOfBranchLocus/Suggested.lean` exits 0. The only output is six `declaration uses sorry` warnings, at lines 40, 58, 75, 92, 106 and 119.
- I put `#check @` for all six declarations in one scratch copy and elaborated it once. Every binder in the README statements is present in the elaborated types: `IsLocallyNoetherian X/Y`, `LocallyOfFiniteType f`, the stalk `IsDomain`/`IsIntegrallyClosed`/`IsRegularLocalRing` in §2.1, `IsNoetherianRing R` and `Algebra.FiniteType R S` in the affine form, `IsFinite`/`IsDominant`/`hgen` in §2.2, and `LocallyQuasiFinite`/`IsDominant`/`hne` in §2.3. Nothing needed changing.
- One `import Mathlib` plus three `TauCeti.*` modules, all of which exist at the pin. No `set_option`, no `lemma`, no sorry'd data.
- The previous padding probe still applies, since no statement changed. Neither pin proves 0BMB in scheme form: grepping both for `0BMB` and `zariskiNagata` finds only docstring references and Tau Ceti's dimension ≤ 2 case (`RingTheory/RegularLocalRing/Purity.lean` 87–88), which the README cites as a supplier.

**Library declarations re-resolved at the pins** (33 names, paths under `TauCeti/`, all present):
- `AlgebraicGeometry/Morphisms/StalkMap.lean`:
  - `unramifiedAt_iff_stalkMap` 201 (`[LocallyOfFiniteType f]`), `etaleAt_iff_stalkMap` 222 (`[LocallyOfFinitePresentation f]`)
  - `etaleAt_spec_iff` 363, `unramifiedAt_spec_iff` 376, `quasiFiniteAt_spec_iff` 401, `quasiFiniteAt_of_appLE` 389, `exists_appLE_quasiFiniteAt_iff` 418, `formallyUnramified_stalkMap_specMap_iff` 136
  - `…_of_isDedekindDomain` 303, `…_of_ringKrullDim_le` 324, `exists_etale_of_etale_comp` 290, `Etale.of_comp_surjective` 509 (`[Flat g]`)
- `RingTheory/RegularLocalRing/Purity.lean` 88: the dimension ≤ 2 case.
- `…/ElementaryEtale/Basic.lean` 70 and `…/ElementaryEtale/BaseChange.lean` 44.
- `RingTheory/Etale/Normal.lean` 164.
- `…/Etale/Stalk.lean` 46, where the Noetherian stalk hypothesis is as the README says.
- `…/Scheme/Regular/LocalRing.lean` 113.
- `…/LocallyQuasiFinite.lean` 107 and 142.
- `…/RamificationLocus.lean`:
  - 170, 179 and 185
  - 189 (`ramificationLocus_subset_nonEtaleLocus`, no hypothesis)
  - 197 (`ramificationLocus_eq_nonEtaleLocus`: `[IsLocallyNoetherian Y] [IsIntegral X] [IsIntegral Y]` …)
  - 217 (`isClosed_branchLocus`: `[UniversallyClosed f] [LocallyOfFiniteType f]`)
  - 225, 233 and 241
- `RegularLocalRing/Basic.lean` 164 (instance `isDomain`) and 235.
- `RegularLocalRing/Normal.lean` 55 (instance `IsRegularRing.isIntegrallyClosed`).
- `RegularLocalRing/ProjectiveDimension.lean` 336, 376 and 441.
- `Scheme/Normal.lean` 84 (`IsNormalScheme`).
- `Scheme/Regular/Scheme.lean` 68 (`IsRegular extends IsLocallyNoetherian`) and 175 (`IsRegular.isNormal`).

**Sources (the seeded sample).** None of the three targets is in a changed passage. I re-read them anyway:
- **§2.1 "Purity of the branch locus".** `stacks-0BMB` lines 2524–2533 give the hypotheses: locally Noetherian `X`, `Y`; `𝒪_{X,x}` normal; `𝒪_{Y,y}` regular; quasi-finite at `x`; `dim 𝒪_{X,x} = dim 𝒪_{Y,y} ≥ 1`; unramified at every specialization `x' ⤳ x` with `dim 𝒪_{X,x'} = 1`. The conclusion is that `f` is étale at `x`. This matches README 287–292 and the Lean statement at line 40. The quantifier includes `x` itself when `d = 1` (Check 1, README 354–359).
- **§2.2 "The global corollary".** The README presents it as *API* derived from SGA 1 X 3.1. `sga1` line 8355 is the running head of printed p. 212, and lines 8359–8364 state 3.1: `f` quasi-finite and dominant between integral schemes, `X` normal, `Y` regular and locally Noetherian, `Z` the non-étale locus. If `Z ≠ X`, every generic point `z` of a component has `dim 𝒪_{X,z} = 1`. The derivation at README 391–395 uses exactly these clauses. `sga1` lines 987–991 (I 9.5 (ii)) support "ramified point".
- **§2.3 "Purity of the ramification and branch loci".** README 420–424 restates the same `sga1` 8359–8364, with the same hypotheses and the same `Z ≠ X` clause.
- The README flags no locator as unverified.

**Cross-roadmap citations and overlaps.**
- `citations.md` lists no unresolved cross-roadmap citation. It lists ten Lean names found nowhere: the six names this roadmap declares (in Suggested.lean, under the namespace of Convention 6), LocalPurity's 0BMA name (resolved above), and the three `Pcf.*` provenance names, which are in an external repository and prescribe nothing.
- `overlaps.md` reports no dropped id in either direction.
- #1808 and #1854 carry this folder and conflict with this pull request. The description's merge-order block orders them: "`PurityOfBranchLocus`: **this pull request** → #1808 → #1854".
- SchemeAndStackFoundations (README 5473, 7162) cites "PurityOfBranchLocus §§0.3 and 2.1". §0.3 resolves through the former-section table (README 86) and §2.1 is a heading (285).
- The description sentence "PurityOfBranchLocus maps each former §0.3 target to its Tau Ceti or Mathlib declaration" matches README 90–114.
- No owned object has changed, so ownership against open pull requests stands as checked in r55.

**Adversarial table.** No statement changed, so every row is carried from r56 (and through it from r55). I recomputed the values of the six headline rows this round. Notation: `k` is a field with `2 ≠ 0`; σ is `(x, y) ↦ (x², y)` on `𝔸²_k`.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| §2.1 stalk form, `Suggested.lean` 40 | `t ↦ t²` at `t = 1` and `t = 0`; `(x, y, z) ↦ (x², y, z)` at `P = (1, 0, 0)`; σ at the origin; `𝔸² → Spec k[x², xy, y²]`; a field extension | `t = 1`: dims `1 = 1`, `2t` a unit, so hunr holds and the map is étale. `t = 0`: `Ω ≠ 0` at the point itself, so hunr fails. `P`: dims `3 = 3`; the ramification locus `V(x)` contains no generization of `P` (since `x(P) = 1`), and `f` is free of rank 2 with `2x` a unit, so étale. σ: hunr fails at `η_{V(x)}`. Quotient: hreg fails. Field: hpos fails | sound | carried (r56 row 7, r55 row 1) |
| §2.1 Stacks form, 58 | `𝔾_m ⊂ 𝔸¹` with a non-finite-type summand added | the summand lies outside the chosen `U`; étale at `x` | sound | carried (r56 row 8) |
| §2.1 affine form, 75 | `k[u] → k[t]`, `u ↦ t²`, at `(t−1)`, `(t)`, `0` | `(t−1)`: heights `1 = 1`, unramified there, so étale. `(t)`: `Ω_{(t)} = k[t]_{(t)}/(2t) ≠ 0`, so hunr fails. `0`: height 0, so hpos fails | sound | carried (r56 row 9) |
| §2.2, 92 | `𝟙_{Spec k}`; σ; `Spec ℤ[i] → Spec ℤ`; `𝔽_p(t^{1/p})/𝔽_p(t)` | `𝟙`: true ⇔ true (no point of dimension 1). σ: false ⇔ false (at `η_{V(x)}`). `ℤ[i]`: hgen on `D(2)` (disc `−4` invertible); `Ω_{(1+i)} ≠ 0`, so false ⇔ false. Inseparable: hgen fails | sound | carried (r56 row 10) |
| §2.3 ramification locus, 106 | σ; `(xⁿ, yⁿ)`; `ℤ[i]`; Frobenius `t ↦ tᵖ` | σ: `R = V(x)`, dimension 1 at `η_{V(x)}`. `(xⁿ, yⁿ)`: `R = V(xy)`, two maximal points of dimension 1, origin not maximal. `ℤ[i]`: `R = {(1+i)}`, dimension 1. Frobenius: `Ω = k[t]dt` free, so `R = univ` and hne fails; without hne the generic point gives dimension 0 | sound | carried (r56 row 11) |
| §2.3 branch locus, 119 | σ; `ℤ[i]`; Frobenius | σ: `B = V(u)`, dimension 1. `ℤ[i]`: `B = {(2)}`, `dim ℤ_{(2)} = 1`. Frobenius: hne needed | sound | carried (r56 row 12) |
| Prose "loci agree for a dominant morphism of integral schemes, locally of finite type, onto a locally Noetherian normal scheme" | origin `↪ 𝔸¹_k`; σ; `ℤ[i]` | closed immersion: `∅ ≠ {pt}` but not dominant, so excluded. σ: `V(x) = V(x)`. `ℤ[i]`: `{(1+i)}` on both sides | sound | carried (r56 row 1) |
| Prose "local dimensions equal for a dominant locally quasi-finite morphism of integral schemes, locally of finite type, onto a normal scheme" | `Spec k ⊔ 𝔸¹ → 𝔸¹`; σ; `𝔾_m ⊂ 𝔸¹` | first: not integral, so excluded. σ: `2 = 2` and `1 = 1`. `𝔾_m`: `1 = 1` and `0 = 0` | sound | carried (r56 row 2) |
| Convention 3, `Spec ℚ ⟶ Spec ℤ` | the one point | stalk map is the identity of `ℚ` (formally unramified), but `ℚ` is not a finitely generated `ℤ`-algebra, so the two forms differ | sound | carried (r56 row 3) |
| Convention 5, origin `↪ 𝔸¹_k` | the one point | `Ω = 0`; `k` is not flat over `k[t]_{(t)}`; `∅ ≠ {pt}` | sound | carried (r56 row 4) |
| §2.2 derivation from SGA 1 X 3.1 | σ; `𝟙`; `ℤ[i]`; inseparable | as in r56 row 5 | sound | carried |
| Rows 0CXF / 00MT / 00LS | `k` over a DVR, `n = 1`; `M = 0`; `A = k` | as in r56 row 6 | sound | carried |

**Remarks needing no change** (untouched text, carried from r56): in the stalk form, `[IsLocallyNoetherian X]` follows from finite type over `Y`; in §2.2, `[IsDominant f]` follows from `hgen`; Mathlib's fpqc descent instance is listed in the contract (README 184–185) but no *Needs:* line uses it.

## Not verifiable

- O. Zariski (1958) and M. Nagata (1959) are cited only as the theorem's origin, with no locator-bearing claim, so I did not open them.
- I did not re-read the provenance repository. The Provenance section is unchanged and prescribes nothing.

## Source issues

- **Gap** in stacks-0BMB at Lemma 58.21.4, proof, pp. 54–55: the source applies the induction hypothesis at every point other than `x`, including the generic point, where the dimension is 0 and hypothesis (4) fails; it should handle the generic point by openness of the unramified locus at a codimension-one specialization; affects the proof.
- **Misprint** in sga1 at Exposé X, remark after Théorème 3.1, printed p. 212: the source says `Z ≠ X` means the extension `R(Z)/R(X)` is separable; it should be the function-field extension `R(X)/R(Y)`; affects nothing.
