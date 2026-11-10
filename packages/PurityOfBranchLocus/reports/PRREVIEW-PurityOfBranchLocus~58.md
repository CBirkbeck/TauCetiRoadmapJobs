# Review of PurityOfBranchLocus (pull request #1807 at afdd14a)

**Verdict:** accepted

This is an incremental re-review of 0 changed lines since 953b278.
- `git diff 953b278 afdd14a -- TauCetiRoadmap/PurityOfBranchLocus lake-manifest.json lean-toolchain` is empty, so neither the folder nor the pins have moved.
- The commits since then change only four of this pull request's own other folders: BordismFormalGroups, ClassifyingSpaces, RigidAnalyticGeometry and TopologicalKTheory.
- This README and Suggested.lean mention none of those four. None of them mentions this roadmap; the only hits for `PurityOfBranchLocus` are its own namespace lines in Suggested.lean.
- None of the diff's lines mentions purity, the branch locus or 0BMB.

No finding remains, new or carried.

## Previous findings

The previous review (r57, at 953b278) raised no finding, so there is nothing to account for. The repairs of r55's R01–R03, already confirmed by r56 and r57, are still in place at this head:
- r55 R01: README 22–24 and 161–163 still restrict the equality of the loci to "a dominant morphism of integral schemes, locally of finite type, onto a locally Noetherian normal scheme".
- r55 R02: the table rows for 0CXF, 00MT and 00LS are still at README 100–102.
- r55 R03: §2.2 still opens "(*API*; derived from SGA 1, Exposé X, Théorème 3.1, printed p. 212)" at README 374–375.

## Verified sound

**Gate.**
- The worker's gate at afdd14a passes every check (`build=0`, `depcheck=0`, `stray-files=0`, `statement-hygiene=0`).
- My own run, `gate … PurityOfBranchLocus --base origin/main`, gives 0 for every check except `outside-folder=26`.
- Those 26 files are the README and Suggested.lean of the 13 other folders the brief names as this pull request's own. `git diff --name-only origin/main...HEAD` touches exactly 14 folders with 2 files each.
- The `git diff --stat` with all 14 folders excluded is empty (exit 0).
- The folder holds README.md, Suggested.lean and metadata.toml.

**Dependency check.** Output:

```text
depcheck: 236 roadmaps, 2134 edges, 0 problem(s)
```

- The only cross-roadmap supplier is LocalPurity §2.1. LocalPurity is on main and is one of this pull request's own folders, unchanged since 953b278.
- At this head, `TauCetiRoadmap/LocalPurity/README.md` line 695 is the heading "### 2.1 Purity for regular local rings".
- Its Suggested.lean line 45 declares `Algebra.etale_of_finiteNormal_of_isRegularLocalRing` with exactly the contract of README 266–270: `[IsRegularLocalRing A]`, `2 ≤ ringKrullDim A`, `[Module.Finite A B]`, `[Module.IsTorsionFree A B]`, normal localizations, and étale at primes not over `maximalIdeal A`.
- LocalPurity names this roadmap only as a consumer (README 863), so there is no cycle. No gaps are declared.

**Elaboration.**
- `lake env lean TauCetiRoadmap/PurityOfBranchLocus/Suggested.lean` exits 0. The only output is six `declaration uses sorry` warnings, at lines 40, 58, 75, 92, 106 and 119.
- I put `#check @` for all six declarations and eight supplier declarations in one scratch copy and elaborated it once. Every elaborated binder matches its README statement:
  - §2.1 stalk form: `IsLocallyNoetherian X/Y`, `LocallyOfFiniteType f`, the stalk `IsDomain`/`IsIntegrallyClosed`/`IsRegularLocalRing`, `hqf`, `hdim`, `hpos`, `hunr`.
  - §2.1 Stacks form: the open-neighbourhood forms of Convention 3.
  - Affine form: `IsNoetherianRing R`, `Algebra.FiniteType R S`.
  - §2.2: `IsFinite`, `IsDominant`, `hgen`.
  - §2.3: `LocallyOfFiniteType`, `LocallyQuasiFinite`, `IsDominant`, `hne`.
- No binder was lost and nothing needed changing.
- The file has a single `import Mathlib` plus three `TauCeti.*` modules, all with object files at the pin. There is no `set_option`, no `lemma` and no sorry'd data.
- Padding probe: no statement changed, and the pins have not moved. I grepped both pins for `0BMB` and `zariskiNagata`. The hits are docstrings plus three declarations, none of them 0BMB itself:
  - Tau Ceti's dimension ≤ 2 case (`RingTheory/RegularLocalRing/Purity.lean` 87), which the README cites as a supplier.
  - `Algebra.IsEtaleAt.of_isUnramifiedAt_of_height_le` (`RingTheory/Unramified/Normal.lean` 78), the affine unramified-over-normal criterion.
  - `Algebra.IsUnramifiedAt.of_forall_height_eq_one` (same file, 128).

  So no headline closes in one library step.

**Library declarations opened at the pins** (elaborated with `#check @`, or read in the file):
- Tau Ceti, `AlgebraicGeometry/Morphisms/RamificationLocus.lean`:
  - `isClosed_ramificationLocus` 179 (`[LocallyOfFiniteType f]`)
  - `ramificationLocus_eq_nonEtaleLocus` 197 (`[IsLocallyNoetherian Y] [IsIntegral X] [IsIntegral Y] [IsDominant f] [LocallyOfFiniteType f] [IsNormalScheme Y]`, matching README 247–248)
  - `isClosed_branchLocus` 217 (`[UniversallyClosed f] [LocallyOfFiniteType f]`)
- Tau Ceti, `…/LocallyQuasiFinite.lean` 142: `ringKrullDim_stalk_eq_of_locallyQuasiFinite` (`IsIntegral X/Y`, dominant, finite type, locally quasi-finite, `IsNormalScheme Y`).
- Tau Ceti, `…/StalkMap.lean`:
  - `unramifiedAt_iff_stalkMap` 201 (`[LocallyOfFiniteType f]`)
  - `exists_etale_of_formallyUnramified_stalkMap_of_ringKrullDim_le` 324 (`[IsLocallyNoetherian Y] [LocallyOfFiniteType f]`, normal target stalk, dimension inequality)
- Tau Ceti, `RingTheory/Unramified/Normal.lean` 78 and 128, and `RingTheory/Etale/Locus.lean` 128.
- Mathlib: `FormallyUnramified.stalkMap` (`Morphisms/FormallyUnramified.lean` 148) and `Scheme.Hom.quasiFiniteAt` (`Morphisms/QuasiFinite.lean` 359).
- The other 25 names in the supplier contracts are unchanged at unmoved pins. r57 resolved them, with file and line.

**Sources (the seeded sample).** None of the three targets is in a changed passage. I re-read each one at its locator:
- **§2.1 "Purity of the branch locus".**
  - `stacks-0BMB` line 2524 is the heading of Lemma 21.4 (0BMB), on printed p. 54.
  - Lines 2526–2533 give the hypotheses: locally Noetherian `X`, `Y`; `𝒪_{X,x}` normal; `𝒪_{Y,y}` regular; quasi-finite at `x`; `dim 𝒪_{X,x} = dim 𝒪_{Y,y} ≥ 1`; unramified at every `x' ⤳ x` with `dim 𝒪_{X,x'} = 1`. The conclusion is étale at `x`.
  - This is README 287–292 and the Lean statement at line 40. The tag's `x' ⤳ x` includes `x' = x`, which is what Check 1 (README 354–359) relies on.
- **§2.2 "The global corollary".**
  - It is marked *API*, derived from SGA 1 X 3.1. `sga1` line 8355 is the running head of printed p. 212.
  - Lines 8359–8364 state Théorème 3.1: `f` quasi-finite and dominant between integral schemes, `X` normal, `Y` regular and locally Noetherian, `Z` the non-étale locus. If `Z ≠ X`, then `dim 𝒪_{X,z} = 1` at the generic point of every component.
  - README 391–395 uses exactly these clauses. `sga1` lines 987–991 (I 9.5 (ii)) support "ramified point".
- **§2.3 "Purity of the ramification and branch loci".** README 420–424 restates `sga1` 8359–8364 with the same hypotheses and the same `Z ≠ X` clause. Lean requires `LocallyOfFiniteType` and `LocallyQuasiFinite`, matching SGA's quasi-finite, which includes finite type.
- The README flags no locator as unverified.

**Cross-roadmap citations and overlaps.**
- `citations.md` lists no unresolved cross-roadmap citation. Its ten Lean names are:
  - the six names Suggested.lean declares, in the namespace of Convention 6;
  - LocalPurity's 0BMA name, resolved above;
  - the three `Pcf.*` provenance names, which belong to an external repository and prescribe nothing.
- `overlaps.md` reports no dropped id in either direction.
- #1808 and #1854 both carry this folder. Their copies differ from this head: 956 and 839 diff lines against the README, and 116 and 294 against Suggested.lean. The description's merge-order block orders them: "`PurityOfBranchLocus`: **this pull request** → #1808 → #1854".
- SchemeAndStackFoundations at this head (README 5473 and 7162) cites "PurityOfBranchLocus §§0.3 and 2.1". §0.3 resolves through the former-section table (README 86), and §2.1 is a heading (README 285).
- The description sentence "PurityOfBranchLocus maps each former §0.3 target to its Tau Ceti or Mathlib declaration" matches README 90–114.
- No owned object has changed, so ownership against open pull requests stands as checked in r55.

**Adversarial table.** No statement changed, so every row is carried from r57, and through it from r56 and r55. I recomputed the values of every row this round. Notation: `k` is a field with `2 ≠ 0`, and σ is `(x, y) ↦ (x², y)` on `𝔸²_k`.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| §2.1 stalk form, `Suggested.lean` 40 | `k[u] → k[t]`, `u ↦ t²`, at `t = 1` and `t = 0`; `(x, y, z) ↦ (x², y, z)` at `P = (1, 0, 0)`; σ at the origin; `𝔸² → Spec k[x², xy, y²]`; a field extension | `t = 1`: dims `1 = 1`; `Ω_{(t−1)} = 0` since `2t` is a unit; free of rank 2, so étale. `t = 0`: `Ω_{(t)} = k[t]_{(t)}/(2t) ≅ k ≠ 0` at `x` itself, so hunr fails. `P`: dims `3 = 3`; the closed set `V(x)` misses `P` (`x(P) = 1`), so it contains no generization of `P`; étale. σ: hunr fails at `η_{V(x)}`, where `Ω = k[x,y]_{(x)}/(2x) ≠ 0`. Quotient: the target is an `A₁` singularity, so hreg fails; the fibre over the origin has length 3, so the map is not étale. Field: `dim 0`, so hpos fails | sound | carried (r57 row 1) |
| §2.1 Stacks form, 58 | `𝔾_m ⊂ 𝔸¹` with a non-finite-type summand added | the summand lies outside the chosen `U`; étale at `x` | sound | carried (r57 row 2) |
| §2.1 affine form, 75 | `k[u] → k[t]`, `u ↦ t²`, at `(t−1)`, `(t)`, `0` | `(t−1)`: heights `1 = 1`, unramified, so étale. `(t)`: `Ω_{(t)} ≠ 0`, so hunr fails. `0`: height 0, so hpos fails | sound | carried (r57 row 3) |
| §2.2, 92 | `𝟙_{Spec k}`; σ; `Spec ℤ[i] → Spec ℤ`; `𝔽_p(t^{1/p})/𝔽_p(t)` | `𝟙`: true ⇔ true (no point of dimension 1). σ: false ⇔ false (at `η_{V(x)}`). `ℤ[i]`: hgen holds on `D(2)`; `Ω_{(1+i)} = ℤ[i]/(1+i)² ≠ 0`, so false ⇔ false. Inseparable: hgen fails, since the only open is the point and the map is not étale | sound | carried (r57 row 4) |
| §2.3 ramification locus, 106 | σ; `(xⁿ, yⁿ)`; `ℤ[i]`; Frobenius `t ↦ tᵖ` | σ: `R = V(x)`, dimension 1 at `η_{V(x)}`. `(xⁿ, yⁿ)`: Jacobian `n² xⁿ⁻¹ yⁿ⁻¹`, `R = V(xy)`, two maximal points of dimension 1; the origin is not maximal. `ℤ[i]`: `R = {(1+i)}`, dimension 1. Frobenius: `d(tᵖ) = 0`, so `Ω = k[t]dt` is free of rank 1, `R = univ` and hne fails; without hne the generic point gives dimension 0 ≠ 1 | sound | carried (r57 row 5) |
| §2.3 branch locus, 119 | σ; `ℤ[i]`; Frobenius | σ: `B = V(u)`, dimension 1. `ℤ[i]`: `B = {(2)}`, `dim ℤ_{(2)} = 1`. Frobenius: `B = univ`, maximal point `η_Y` of dimension 0, so hne is needed | sound | carried (r57 row 6) |
| Prose "loci agree for a dominant morphism of integral schemes, locally of finite type, onto a locally Noetherian normal scheme" | origin `↪ 𝔸¹_k`; σ; `ℤ[i]` | closed immersion: `∅ ≠ {pt}`, but it is not dominant, so it is excluded. σ: `V(x) = V(x)`. `ℤ[i]`: `{(1+i)}` on both sides. The pinned binders (`RamificationLocus.lean` 197) match the prose | sound | carried (r57 row 7) |
| Prose "local dimensions equal for a dominant locally quasi-finite morphism of integral schemes, locally of finite type, onto a normal scheme" | `Spec k ⊔ 𝔸¹ → 𝔸¹`; σ; `𝔾_m ⊂ 𝔸¹` | first: not integral, so excluded. σ: `2 = 2` and `1 = 1`. `𝔾_m`: `1 = 1` and `0 = 0` | sound | carried (r57 row 8) |
| Convention 3, `Spec ℚ ⟶ Spec ℤ` | the one point | the stalk map `ℤ_{(0)} = ℚ → ℚ` is the identity (formally unramified), but `ℚ` is not a finitely generated `ℤ`-algebra, so the two forms differ | sound | carried (r57 row 9) |
| Convention 5, origin `↪ 𝔸¹_k` | the one point | `Ω_{k/k[t]} = 0`; `k` has `t`-torsion, so it is not flat over `k[t]_{(t)}`; `∅ ≠ {pt}` | sound | carried (r57 row 10) |
| §2.2 derivation from SGA 1 X 3.1 | σ; `𝟙`; `ℤ[i]`; inseparable | σ: `Z = V(x) ≠ X`, component of dimension 1, ramified there; `𝟙`: `Z = ∅`; `ℤ[i]`: `Z = {(1+i)}`; inseparable: `Z = X`, so the clause does not apply | sound | carried (r57 row 11) |
| Rows 0CXF / 00MT / 00LS | `k` over a DVR, `n = 1`; `M = 0`; `A = k` | `0 → R →ϖ R → k → 0` has finite free terms vanishing above degree 1, and `ϖ ∈ 𝔪`, so it is minimal; `M = 0` gives the zero resolution; `A = k` is its own resolution | sound | carried (r57 row 12) |

**Remarks needing no change** (on untouched text, carried from r57, plus one new remark):
- In the stalk form, `[IsLocallyNoetherian X]` follows from finite type over `Y`.
- In §2.2, `[IsDominant f]` follows from `hgen`: an étale map is open, and generizations lift along flat maps.
- Mathlib's fpqc descent instance is listed in the contract (README 184–185), but no *Needs:* line uses it.
- New this round: the `𝔮 = 0` step of the §2.1 route (README 332–336) uses openness of the unramified locus. Tau Ceti's `Algebra.IsUnramifiedAt.of_forall_height_eq_one` (`RingTheory/Unramified/Normal.lean` 128) gives the same conclusion directly. Either route is valid.

## Not verifiable

- O. Zariski (1958) and M. Nagata (1959) are cited only as the theorem's origin, with no locator-bearing claim, so I did not open them.
- I did not re-read the provenance repository. The Provenance section is unchanged and prescribes nothing.

## Source issues

- **Gap** in stacks-0BMB at Lemma 58.21.4, proof, printed pp. 54–55: the source applies the induction hypothesis at every point other than `x`, including the generic point, where the dimension is 0 and hypothesis (4) fails; it should treat the generic point separately, by openness of the unramified locus at a codimension-one specialization; affects the proof.
- **Misprint** in sga1 at Exposé X, remark after Théorème 3.1, printed p. 212: the source says `Z ≠ X` means the extension `R(Z)/R(X)` is separable; it should be the function-field extension `R(X)/R(Y)`; affects nothing.
