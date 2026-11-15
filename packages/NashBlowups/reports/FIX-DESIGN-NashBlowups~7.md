# FIX-DESIGN-NashBlowups~7: repair of the design review

Review settled: `REV-DESIGN-NashBlowups~6`. It has two findings, both P3.

Files edited:
- `packages/NashBlowups/design/README.md`
- `packages/NashBlowups/design/plan.json`

`packages/NashBlowups/sources.toml` is unchanged: no source was added and no `cited_for` changed. There is no
`Suggested.lean` at the design stage. The review's "For the human reviewers" section (licence of `alperModuli`,
share of `nashModificationNotes2024`) lists no finding, so nothing was changed because of it.

## REV-DESIGN-NashBlowups~6/F01 (P3) — applied

Verified. Take `d = 0` and `X = Spec k`, which is in the Setting (§2.1 Check, §1.1 Check 2):
- the only point is both closed and generic;
- `Spec k → X_sm` is the identity, so it sends the generic point to the generic point;
- `Spec k` is normal and Noetherian, so the hypotheses of §6.2 hold and the lift is the identity of `X̄* = X`.

For `d ≥ 1`, every irreducible component has dimension `d ≥ 1`, so its generic point is not closed. A closed
point is therefore never generic.

Old → new: §6.2 Check 3, "A closed point `Spec k → X_sm` does not map …", becomes "For `d ≥ 1` and a closed
point `x ∈ X_sm`, the morphism `Spec κ(x) → X_sm` does not map …". The Check adds the reason and the `d = 0`
witness. `Spec κ(x)` replaces `Spec k` so that no rational point is presumed. `plan.json` test 6.2
`lift_closed_point` is reworded the same way.

Pattern: I checked every other non-example and degenerate test in `plan.json` (66 tests) and every "closed
point" and "excluded" Check in the README. Each other exclusion is about a fixed scheme, not about every `X` in
the Setting, and each holds:
- §0.1 `Spec k → 𝔸¹`;
- §1.3 `Spec k →` origin of `𝔸¹` with `O ⊕ O/(x)`;
- §2.4 `Spec k →` cusp point, where `h⁻¹(X_sm) = ∅` because the cusp point is singular.

## REV-DESIGN-NashBlowups~6/F02 (P3) — applied

Verified at the pin (Tau Ceti `2fd255d`, equal to the plan's baseline and to `lake-manifest.json`) and against
SchemeAndStackFoundations on main (`1a19c9f`):

| Former SchemeAndStackFoundations name | Pinned declaration (file, line) | SASF records it at |
|---|---|---|
| `dimension_theory_finiteType`, `topologicalKrullDimAt_eq_stalk` (§0.7) | `TauCeti.AlgebraicGeometry.topologicalKrullDimAt_eq_ringKrullDim_stalk_add_toNat_trdeg_residueField` (`TauCeti/AlgebraicGeometry/Scheme/LocalDimension.lean:105`), `…_eq_iSup_toNat_trdeg_residueField` (`:168`), `topologicalKrullDim_closure_singleton_eq_toNat_trdeg_residueField` (`:76`); all for `X` locally of finite type over a field | README lines 1060–1073 |
| `bijective_of_depth` (§0.17) | `LinearMap.bijective_of_depth` (`TauCeti/RingTheory/Depth/Bijectivity.lean:120`): `[IsNoetherianRing R]`, arbitrary `M`, `N`; docstring "no finite-source hypothesis is needed" | line 1788 |
| `universalHomeomorphism_criteria` (§0.23) | `TauCeti.AlgebraicGeometry.isUniversalHomeomorphism_iff_isIntegralHom_universallyInjective_surjective` (`TauCeti/AlgebraicGeometry/Morphisms/UniversalHomeomorphism.lean:162`) | lines 2184–2187 |
| `IsNormalScheme`, `IsNormalScheme.isDiscreteValuationRing_stalk` (§0.30) | `TauCeti.AlgebraicGeometry.IsNormalScheme` (`TauCeti/AlgebraicGeometry/Scheme/Normal.lean:84`), `.isDiscreteValuationRing_stalk` (`:203`, locally Noetherian, coheight one), `isNormalScheme_iff_forall_affineOpens` (`:153`) | lines 2687–2694 |
| `IsModification` (§4.11) | `TauCeti.AlgebraicGeometry.IsModification` (`TauCeti/AlgebraicGeometry/Morphisms/Modification/Basic.lean:53`) | line 6826 |
| `serre_normality_criterion` (§4.13) | `TauCeti.forall_isDomain_and_isIntegrallyClosed_iff_satisfiesSerreR_one_and_satisfiesSerreS_two` (`TauCeti/RingTheory/SerreCondition/Normal.lean:214`, `[IsNoetherianRing R]`) | lines 7016–7021 |
| *IsRegular.isNormal* | `TauCeti.AlgebraicGeometry.IsRegular.isNormal` (`TauCeti/AlgebraicGeometry/Scheme/Regular/Scheme.lean:175`, instance) | lines 2697, 6962 |

Two names are not pinned:
- `IsModification.Witness` is SchemeAndStackFoundations' own name (README line 6839, in code); Tau Ceti has no
  `Witness`.
- `field_extension_descent` (§0.11, line 1372) and `regularLocus_eq_smoothLocus` (§4.13, line 6987) remain
  SchemeAndStackFoundations targets.

Old → new:
- **From Tau Ceti.** Six new bullets give the pinned names, files, hypotheses and the recording section. The
  depth bullet states "over a Noetherian ring `R` … arbitrary modules … no finiteness of `M`", so "with `M`
  finite" is dropped and the Noetherian hypothesis is added.
- **SchemeAndStackFoundations contract.** It keeps §0.11 `field_extension_descent`, §4.11
  `IsModification.Witness` (now in code) and §4.13 `regularLocus_eq_smoothLocus`. One bullet says that the
  section citations elsewhere in this roadmap denote the pinned declarations.
- **Scope.** The text now says the same.
- **Body.**
  - §0.6: the statement and *Needs* name Tau Ceti `IsNormalScheme` and `isNormalScheme_iff_forall_affineOpens`.
  - §5.3 step 4: now "Tau Ceti's `LinearMap.bijective_of_depth` over the Noetherian ring `R`".
  - §5.3 *Needs*: names the three pinned declarations.
- **`plan.json`.**
  - 0.6 and 5.3 gain these `tauceti:` prerequisites.
  - The SchemeAndStackFoundations supplier `what` is rewritten.

Pattern: section-only citations (§§0.7, 0.17, 0.23, 0.30, 4.11, 4.13 in §§0.3, 1.1, 2.2, 2.3, 4.4, 5.3 and the
Dependencies) stay. SchemeAndStackFoundations' own convention says that citations of these sections resolve to
the pinned declarations, and the contract now says so. No italic name of this README now belongs to another
roadmap. The script lists 51 italic declaration names, all of this roadmap's own.

No statement of this roadmap changes. In §5.3 step 4 the map is `ψ : ⊕_{α∈A} R e_α → F_*R`, and the hypotheses
of the pinned lemma were rechecked prime by prime:
- `R = O_{X,x}` is Noetherian.
- At `Q = 0` and at height-one primes, `ψ_Q` is bijective (steps 2 and 3).
- At height `≥ 2`, `depth (⊕ R e_α)_Q = depth R_Q ≥ min(2, ht Q) = 2` by `(S_2)` (Serre's criterion, `R` normal).
- `Ass_R(F_*R) = {0}` because `F_*R ≅ R^{1/p}` is torsion-free.
- Neither finiteness of the source nor of `F_*R` is required.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §6.2 Check 3 (new) | `d = 0`, `X = Spec k`; `d = 0`, `X = Spec k₁ ⊔ Spec k₂` (separable `k_i/k`); `d = 1`, `X = 𝔸¹`, `x = 0`; `d = 2`, `X = 𝔸²`; `X = ∅` | point = generic point, identity, lift `id_X̄*`, hypotheses hold; each closed point is a component, its inclusion maps generic to generic, lift is the inclusion into `X̄* = X`; `dim {η}⁻ = 1 ≠ 0 = dim {0}⁻`, so `0` not generic, hypothesis fails; same with `dim 2`; no closed point, Check vacuous | `d ≥ 1` needed and sufficient | applied |
| §6.2 Check 3, quotient | `x ∈ X_sm`, `h = Spec κ(x) → X` | `h*Ω = Ω ⊗ κ(x)`, dimension `d`; the rank-`d` quotient is an isomorphism; factorisation through `ν⁻¹(X_sm) ≅ X_sm` and `η` iso there | factors, as stated | none |
| `LinearMap.bijective_of_depth` contract | `R = k[x,y]_{(x,y)}`: the identity of `R`; the quotient `R → R/(x)`; the identity of a free module of infinite rank | every localisation bijective, conclusion bijective; at `Q = (x)` the localisation `R_Q → κ(Q)` is not bijective and `depth R_Q = 1 < 2`, so the hypothesis fails, and indeed the map is not injective; hypothesis holds with no finiteness of `M`, which the pinned statement allows | sound, Noetherian added | applied |
| Serre's criterion contract | `k[x,y,z]/(xy − z²)`; `k[x,y]/(x², xy)`; cusp `k[t², t³]` | `(R_1)`, `(S_2)` both hold, normal; `(S_1)` fails at `(x,y)` (embedded prime), not normal; `(R_1)` fails at the cusp (not a DVR), not normal | sound, Noetherian stated | applied |
| `IsModification` contract | `Bl₀𝔸² → 𝔸²`; cusp normalisation `𝔸¹ → C₀`; closed immersion `{0} → 𝔸¹` | proper, iso over `𝔸² ∖ 0`, preimage dense: yes; finite hence proper, iso off `0`: yes; no dense `U` with dense preimage over which iso: not a modification | sound | applied |
| Universal-homeomorphism contract | `Spec 𝔽_p(t^{1/p}) → Spec 𝔽_p(t)`; `𝔸¹ ⊔ 𝔸¹ → 𝔸¹`; `Spec k[ε]/(ε²) → Spec k` | integral, universally injective (purely inseparable), surjective: yes; not injective: no; nil kernel surjection: yes | sound | applied |
| Local dimension contract | `X = 𝔸²`, `x = 0`; `x = η`; `X = 𝔸² ⊔ 𝔸¹`, `x ∈ 𝔸¹` | `2 + 0 = 2`; `0 + 2 = 2`; `1 + 0 = 1`, the supremum over components through `x` is `1`, not `2` | sound | applied |
| `IsNormalScheme` contract | `Spec ℚ(i) × ℚ(i)` (§0.6 Check 1); node `xy = 0` | every stalk a field, normal, not integral; stalk at the node is not a domain, not normal | sound | applied |

## Checks run

**Dependency check**:

```
candidate: NashBlowups is not in the merge order yet; checked as if placed after DeformationAndDerivedPatchingAlgebra (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2232 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line. The supplier set is unchanged. SchemeAndStackFoundations stays a
supplier, for §0.11, the §4.11 witness and §4.13 `regularLocus_eq_smoothLocus`, and it is on main.

**`roadmaps resolve` on the README**: no cross-roadmap citation and no Lean name found nowhere. The tool does not
check pinned Lean names on this host, so I checked every new Tau Ceti name by hand:
- each name, its file, its line and its enclosing namespace (`TauCeti.AlgebraicGeometry`, `LinearMap`, `TauCeti`)
  is at the pin, as listed in the F02 table;
- `plan.json` still parses.

**Suggested.lean `#check` comparison**: not applicable. There is no `Suggested.lean` at the design stage, and no
Lean command was run.

**Ownership**: no object moved between roadmaps. The pinned declarations are Tau Ceti's, and
SchemeAndStackFoundations only records them. The overlap file lists:
- no open pull request changing this roadmap;
- no id this roadmap cites that an open pull request drops;
- no revision-only id.

## For the maintainer

- No name that another roadmap cites changed. No target, section or id of this roadmap moved. No Lean name of this
  roadmap was added or deleted.
- The contracts now name pinned Tau Ceti declarations instead of the SchemeAndStackFoundations aliases. Section
  citations of SchemeAndStackFoundations remain, per that roadmap's mapping.
- No suspicious instruction was found in the review text.
