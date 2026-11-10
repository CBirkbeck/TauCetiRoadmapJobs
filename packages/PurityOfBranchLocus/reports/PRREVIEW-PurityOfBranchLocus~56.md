# Review of PurityOfBranchLocus (pull request #1807 at d1900d4)

**Verdict:** accepted

Incremental re-review of the 78 lines changed since a1ae267 (README.md 75, Suggested.lean 3, a docstring sentence only). The three findings of the previous review are repaired, the repairs introduce no new problem, and the gate passes. No finding remains.

## Previous findings (r55, at a1ae267)

- R01 — repaired: README lines 16–25, 53–58 and 159–164 now read "for a dominant morphism of integral schemes, locally of finite type, onto a locally Noetherian normal scheme"; Convention 5 adds "the closed immersion is not dominant".
- R02 — repaired: the target table has rows for 0CXF, 00MT and 00LS (`ModuleCat.exists_projectiveResolution_finite`, `ModuleCat.exists_projectiveResolution_finite_free_minimal`, `ChainComplex.liftToAugmented`); the §0.3 Content cell and the consumer bullet name the resolutions.
- R03 — repaired: §2.2 opens "(*API*; derived from SGA 1, Exposé X, Théorème 3.1, printed p. 212)", the route gives the derivation, and the alignment row reads "58.21.4 (0BMB); SGA 1 X 3.1 | API (derived)".

## Verified sound

**Gate and dependency check.**
- The worker's gate at d1900d4 passes every check, including `build=0`.
- My standalone run with `--base origin/main` gives 0 for every check except `outside-folder=26`: the README and Suggested.lean of the 13 other folders the brief names as this pull request's own. The `git diff --stat origin/main...HEAD` with the 14 folders excluded is empty.
- The folder holds README.md, Suggested.lean and metadata.toml.
- Dependency check:

```text
depcheck: 234 roadmaps, 2264 edges, 0 problem(s)
```

- No gaps are declared (no readable `design/plan.json`, no `gap:` contract).

**Elaboration.** `lake env lean TauCetiRoadmap/PurityOfBranchLocus/Suggested.lean` exits 0 with six `declaration uses sorry` warnings (lines 40, 58, 75, 92, 106, 119) and nothing else. The diff changes no declaration: only the module docstring (lines 16–17) gained the hypotheses of the dimension lemma. The six elaborated signatures in `signatures.md` are those the previous review compared with the README; no binder changed. Imports, `set_option`, `lemma` and sorry'd data are as before (none offending). The padding probe of the previous review stands, since no statement changed.

**The changed passages, each checked at the pins (Tau Ceti `2fd255d99`, Mathlib `1b1ccf4b0`).** Paths under `TauCeti/`.

- Summary and Scope, "unramified at `x`" for `f` locally of finite type, "étale at `x`" for `f` locally of finite presentation: `Scheme.Hom.unramifiedAt_iff_stalkMap` (`AlgebraicGeometry/Morphisms/StalkMap.lean` 201) assumes `[LocallyOfFiniteType f]`; `Scheme.Hom.etaleAt_iff_stalkMap` (222) assumes `[LocallyOfFinitePresentation f]`.
- Convention 3, "identifies Stacks' affine-chart form of quasi-finiteness at `x` with the form above": `Scheme.Hom.exists_appLE_quasiFiniteAt_iff` (`StalkMap.lean` 418) has no finite-type hypothesis on `f`, and its right-hand side is exactly `(∃ W, x ∈ W ∧ LocallyOfFiniteType (W.ι ≫ f)) ∧ f.QuasiFiniteAt x`.
- "Elementary étale localization of a morphism locally of finite type at a point where it is quasi-finite": `Scheme.Hom.exists_elementaryEtale_finite_of_isolated` (`…/ElementaryEtale/Basic.lean` 70) takes `[LocallyOfFiniteType f]` and `hx : f.QuasiFiniteAt x`.
- "Equality of local dimensions for a dominant locally quasi-finite morphism of integral schemes, locally of finite type, onto a normal scheme" (Summary, Dependencies, the `Suggested.lean` docstring): `Scheme.Hom.ringKrullDim_stalk_eq_of_locallyQuasiFinite` (`…/LocallyQuasiFinite.lean` 142) assumes `IsIntegral X`, `IsIntegral Y`, `IsDominant f`, `LocallyOfFiniteType f`, `LocallyQuasiFinite f`, `IsNormalScheme Y`. No Noetherian hypothesis, as the README says.
- "Equality of the loci for a dominant morphism of integral schemes, locally of finite type, onto a locally Noetherian normal scheme": `Scheme.Hom.ramificationLocus_eq_nonEtaleLocus` (`…/RamificationLocus.lean` 197) assumes `IsLocallyNoetherian Y`, both integral, `IsDominant f`, `LocallyOfFiniteType f`, `IsNormalScheme Y`.
- New target-table rows; a scratch file with `#check @…` elaborates all four names with no error, and each file has zero `sorry`:
  - `ModuleCat.exists_projectiveResolution_finite` (`Algebra/Category/ModuleCat/Projective/FiniteResolution.lean` 73): `[Ring R] [IsNoetherianRing R]`, `[Module.Finite R M]`, `HasProjectiveDimensionLE M n` ⇒ a `ProjectiveResolution` with finite terms, zero above `n`. The README's description matches.
  - `ModuleCat.exists_projectiveResolution_finite_free_minimal` (`…/Projective/MinimalResolution/ChainComplex.lean` 82): `[CommRing R] [IsLocalRing R] [IsNoetherianRing R]`; terms finite and free, zero above `n`, `range d ≤ 𝔪 • ⊤`. Matches.
  - `ChainComplex.liftToAugmented` (`Algebra/Homology/HomologicalComplex/Augmented.lean` 60, `@[stacks 00LS]`): source degreewise projective, target exact with epimorphic augmentation; no exactness of the source. "Only the target complex is assumed exact" is correct.
  - Mathlib `Module.free_of_flat_of_isLocalRing`: finite flat over a local ring is free.
- The consumer these rows serve: DeformationAndDerivedPatchingAlgebra README (open head) lines 13 and 80 cite §0.3 for finite free resolutions zero above a projective-dimension bound and their minimization with differentials in `𝔪` times the target. Both now resolve to a row whose declaration states exactly that.

**Sources (the seeded sample where it falls in the diff).**
- §2.2: `sga1` lines 8359–8364 (Exposé X, Théorème 3.1; line 8355 is the running head of printed p. 212). Quasi-finite dominant `f` of integral schemes, `X` normal, `Y` regular locally Noetherian, `Z` the non-étale = ramified locus (with the reference to I 9.5 (ii) at 8361–8362), and `Z ≠ X` ⇒ `dim 𝒪_{X,z} = 1` at generic points of components. The README's derivation uses exactly these clauses.
- `sga1` lines 987–991 (I, Théorème 9.5 (ii)): over a normal `A`, étale ⇔ injective and unramified; this supports "be a ramified point".
- §2.1 and §2.3 statements are untouched; their locators stand as read in the previous review (`stacks-0BMB` 2524–2533, `sga1` 8355–8364).
- The README flags no locator as unverified.

**Cross-roadmap citations and overlaps.** The diff adds no cross-roadmap citation. `citations.md` lists the same ten names as before (six own headline names, LocalPurity's `Algebra.etale_of_finiteNormal_of_isRegularLocalRing`, three provenance names), all resolved in the previous review. `overlaps.md` reports no dropped id in either direction; #1808 and #1854 carry older copies of this folder and the description's merge-order block places this pull request first. Ownership against open pull requests is unchanged: the diff adds no owned object.

**Adversarial table.** Notation: `k` a field with `2 ≠ 0`; σ is `(x, y) ↦ (x², y)` on `𝔸²_k`; ι is `Spec k → 𝔸¹_k` at `0`.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| Prose "loci agree for a dominant morphism of integral schemes, locally of finite type, onto a locally Noetherian normal scheme" (README 22–24, 57–58, 161–164) | ι; σ; `Spec ℤ[i] → Spec ℤ` | ι: `R = ∅`, non-étale locus `{pt}`, but ι is not dominant, so excluded (Convention 5 says so). σ: `R = V(x)` = non-étale locus. `ℤ[i]`: both `{(1+i)}` | sound | repaired (r55 R01) |
| Prose "local dimensions equal for a dominant locally quasi-finite morphism of integral schemes, locally of finite type, onto a normal scheme" (README 21–22, 501–503; `Suggested.lean` 16–17) | `Spec k ⊔ 𝔸¹ → 𝔸¹`; σ at the origin and at `η_{V(x)}`; `𝔾_m ⊂ 𝔸¹` | first: source not integral, excluded (`0 ≠ 1` at the isolated point). σ: `2 = 2`, `1 = 1`. Open immersion: `1 = 1`, `0 = 0` | sound | repaired (r55 R01) |
| Convention 3, new example `Spec ℚ ⟶ Spec ℤ` | the one point | stalk map `ℤ_(0) = ℚ → ℚ` is the identity, `Ω = 0`, formally unramified; the only open containing the point is `Spec ℚ`, and `ℚ` is not a finitely generated `ℤ`-algebra; stalk form true, Stacks form false | sound | none |
| Convention 5, example ι with "ramification locus empty, non-étale locus its point" | ι | `Ω_{k/k[t]} = 0`; `k` is not flat over `k[t]_{(t)}` (`t` is a zero divisor on `k`); `∅ ≠ {pt}` | sound | none |
| §2.2 derivation from SGA 1 X 3.1 (README 391–395) | σ; `𝟙_Y`; `Spec ℤ[i] → Spec ℤ`; inseparable `𝔽_p(t^{1/p})/𝔽_p(t)` | σ: `Z = V(x) ≠ X`, `z = η_{V(x)}` has `dim 1` and `Ω_z ≠ 0`, so the right side fails, as the theorem needs. `𝟙`: `Z = ∅`. `ℤ[i]`: `Z = {(1+i)}`, `dim 1`, ramified. Inseparable: `Z = X`, hgen false, 3.1 gives nothing and the statement is excluded | sound | repaired (r55 R03) |
| Table rows 0CXF / 00MT / 00LS | `M = k` over a DVR `(A, t)`, `n = 1`; `M = 0`; `A = k` | DVR: `0 → A → A → k` with `d = t`, finite free, zero above 1, `range d = tA ≤ 𝔪 • A`. `M = 0`: the zero resolution, all clauses hold. Field: `𝔪 = 0`, `d = 0`, `F₀ = M` | sound | repaired (r55 R02) |
| §2.1 stalk form, `Suggested.lean` 40 | — | carried from r55 (row 1: `t ↦ t²` at `t = 1`: étale; at `t = 0`: hunr false; σ at the origin: hunr false at `η_{V(x)}`; the quotient singularity: hreg false; fields: hpos false) | sound | untouched |
| §2.1 Stacks form, 58 | — | carried from r55 (row 2: `𝔾_m ⊂ 𝔸¹` with a non-finite-type summand added; étale) | sound | untouched |
| §2.1 affine form, 75 | — | carried from r55 (row 3: `k[u, v] → k[x, y]` at `(x−1, y)`: étale; at `(x, y)`: hunr false at `(x)`; at `0`: hpos false) | sound | untouched |
| §2.2, 92 | — | carried from r55 (row 4: inseparable: hgen false; σ: false ⇔ false; quotient singularity excluded by regularity; `ℤ[i]`: false ⇔ false; `𝟙`: true ⇔ true) | sound | statement untouched; locator added |
| §2.3 ramification locus, 106 | — | carried from r55 (row 5: σ: `dim 1` at `η_{V(x)}`; `(xⁿ, yⁿ)`: two maximal points of `dim 1`; Frobenius: hne false, `dim 0` without it) | sound | untouched |
| §2.3 branch locus, 119 | — | carried from r55 (row 6: σ: `B = V(u)`, `dim 1`; `ℤ[i]`: `B = {(2)}`, `dim 1`; Frobenius: hne needed) | sound | untouched |
| §2.1 and §2.2 routes, Convention 3 (quasi-finiteness), Checks and Examples | — | carried from r55 (rows 9–11, 14, 15) | sound | untouched |

**Remarks needing no change** (untouched text, carried from the previous review): `[IsLocallyNoetherian X]` in the stalk form follows from finite type over `Y`; `[IsDominant f]` in §2.2 follows from `hgen`; Mathlib's fpqc descent instance is listed in the contract but used by no *Needs:* line.

## Not verifiable

- O. Zariski (1958) and M. Nagata (1959) are cited only as the theorem's origin, with no locator-bearing claim; not opened.
- The provenance repository was not re-read this round; the diff does not touch the Provenance section.

## Source issues

- **Gap** in stacks-0BMB at Lemma 58.21.4, proof, pp. 54–55: the source applies the induction hypothesis at every point other than `x`, including the generic point, where the dimension is 0 and hypothesis (4) fails; it should handle the generic point by openness of the unramified locus at a codimension-one specialization; affects the proof.
- **Misprint** in sga1 at Exposé X, remark after Théorème 3.1, printed p. 212: the source says `Z ≠ X` means the extension `R(Z)/R(X)` is separable; it should be the function-field extension `R(X)/R(Y)`; affects nothing.
