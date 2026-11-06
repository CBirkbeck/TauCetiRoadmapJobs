# GATE-HypergeometricMotives~2: answers to the comment on `f847e92`

There is one comment (CBirkbeck, 2026-11-06T14:21:16Z, "External formalisations to consult"). It makes eight
distinct points, numbered H01–H08 below in the order they appear. The repairs are committed on the
pull-request branch as `4c29b232` ("HypergeometricMotives: review repairs (provenance section,
even-multiplicity symplectic sign, DWP Frobenius-module suppliers)"). Nothing is pushed.

Every file and declaration named below was read in AxiomMath/Weil at `27cdb2049be62ee2911429b47f54774078450e32`
(Lean v4.34.0-rc2) and formal-arithmetic-geometry/weil-conjectures at
`55abf461d4688270382c9c982ac08a279e41c00b` (Lean v4.33.1). Both commits resolve on GitHub. Both
`LICENSE` files are Apache-2.0. This repository pins Lean v4.36.0-rc2.

## H01 (CBirkbeck) — applied

The README had no pointer to existing formalisations. The repository's porting guidance asks a roadmap that develops the same mathematics independently to cite such work in a clearly secondary section. A new `## Provenance` section now sits in `TauCetiRoadmap/HypergeometricMotives/README.md` between *Downstream consumers* and *References*. It is marked secondary and prescribes nothing. It records the Apache-2.0 licence, the different Lean/Mathlib pins, and that an adapted proof is coordinated with the authors and keeps the attribution. It maps each overlapping Layer 5 target to a file at a pinned commit link (details under H04–H08).

## H02 (CBirkbeck) — answered

This roadmap does not prove purity. 5.0 derives 5.5's purity and self-duality hypotheses for the realization from Katz Theorems 8.4.2 and 8.8.1–8.8.2 and from `DeligneWeightsAndPurity` §4.3, so the purity route is that supplier's choice and nothing here fixes one. For the record, that supplier at its open head does not plan the Fourier–Deligne route the comment names. It reaches smooth projective purity (§4.3) by Weil I's route: Rosati, symplectic tensor powers, Lefschetz pencils and dimension induction (DWP.1–DWP.4). It then develops Weil II through local monodromy, curve square improvement and dévissage (DWP.5–DWP.9), with no Fourier transform: its README has no match for "Fourier" or "Laumon". If the Fourier–Deligne route is wanted, that belongs in `DeligneWeightsAndPurity` (or a Part II of it), not here. AxiomMath/Stacks (purity, trace formula, proper base change) overlaps only supplier material (`DeligneWeightsAndPurity`, `EtaleCohomologyFoundations`), so the Provenance section does not list it.

## H03 (CBirkbeck) — answered

Confirmed. Neither repository contains `gaussSum`, `jacobiSum`, Hasse–Davenport, Stickelberger, Levelt, companion or Bézout matrices of hypergeometric data, or a Hodge-number zigzag. The `zigzag`, `companion` and `cyclotomic` hits in weil-conjectures are homological zigzag modules and prose, not these objects. So Layers 1–4 and 6 have no counterpart there, and the Provenance section says so in its opening paragraph.

## H04 (CBirkbeck) — applied

The Provenance section now lists these files:

- Weil `Defs/.../Trace/ZetaSeries.lean`: `PowerSeries.subst` into `PowerSeries.exp ℚ`, exponent `+∑` against 5.2's `−∑`, and `AlgebraicGeometry.eq_zetaSeries_iff`.
- Weil `RingTheory/PowerSeries/Fatou.lean`: `PowerSeries.exists_int_coprime_mul_eq_of_rat`. Applied to `1 + ∑ a_{p^e} T^e`, it gives an alternative to the ℓ-adic pole argument of 5.5 (ii).
- weil-conjectures `ZetaLinearAlgebra/Fatou.lean` with `NormalizedGauss.lean`.
- weil-conjectures `ZetaLinearAlgebra/DetTrace.lean` (`LinearMap.inv_charpolyRev_eq_exp`, `det(1 − tF)⁻¹ = exp(∑ Tr(Fⁿ)tⁿ/n)`) and `CharpolyRevExpand.lean`. Of the two, `DetTrace.lean` matches 5.5 (i) more closely. `CharpolyRevExpand.lean` treats the product over a finite direct image.

Inside Tau Ceti, the endomorphism form is owned by the supplier `DeligneWeightsAndPurity` 0.10. 5.5 now names that route alongside Newton's identities: "(i) follows from Newton's identities of 5.2 … or from the determinant–trace identity … of `DeligneWeightsAndPurity` 0.10 (ii)". Its *Needs:* line gains "`DeligneWeightsAndPurity` 0.10 (route for (i))". Fatou's lemma is not at the pins (no match in the pinned Mathlib `RingTheory`/`Algebra` or in Tau Ceti), so it is recorded in Provenance only and not made a route input.

## H05 (CBirkbeck) — applied differently

The bare multiset `Λ ⊂ ℂ` stays the carrier of `IsPure`/`IsSelfDual` and of the five 5.5 headlines. These are statable at the pins, and a Frobenius-module carrier is not. Within Tau Ceti, the counterpart of weil-conjectures' `FrobeniusModule` layer is the allowed supplier `DeligneWeightsAndPurity` Layer DWP.0: 0.9 (subobjects and quotients), 0.10, 0.15 (Tate twists) and 0.16 (equivariant pairings). These are now imported by section rather than adopted from the external repository:

- the contract *From TauCetiRoadmap.DeligneWeightsAndPurity* now names 0.9, 0.10, 0.15 and 0.16;
- a *Not owned here* bullet "Frobenius-module linear algebra" is added;
- the first 5.0 API bullet now says these sections supply the Frobenius-module steps of the purity and self-duality derivation;
- 5.0's *Needs:* changes from "`DeligneWeightsAndPurity` §4.3" to "§§0.9, 0.15, 0.16, 4.3".

The Provenance entry for `FrobeniusModule.lean` and `FrobeniusModule/` says that `Λ` is the eigenvalue multiset of such a module read in `ℂ`.

## H06 (CBirkbeck) — applied

Both functional-equation files are now in Provenance, each with what it proves:

- Weil's `Weil.coeff_zero_eq_sign_mul_pow` computes the sign.
- weil-conjectures' `TraceDatum.roots_map_charpolyRev_rev` gives only the root correspondence `z ↦ (qⁿz)⁻¹`, the self-duality half of `local_functional_equation`, and does not compute `ε_p`.

One detail of the comment is wrong. `WeilConjectures/ZetaLinearAlgebra/FunctionalEquation.lean` contains no `sorry` at `55abf46` (zero occurrences as a term). Its docstring, line 32, only says the file does not close the `sorry` of `WeilConjectures.Statement`.

## H07 (CBirkbeck) — applied

Comparing against Weil's `coeff_zero_eq_sign_mul_pow` showed that our symplectic-sign hypothesis was narrower than needed. Weil's odd case asks only that every square root of `qⁿ` have even multiplicity. Ours asked that no `λ` square to `p^w`, which is satisfied only when both multiplicities are zero.

- **Lean** (`Suggested.lean`, `local_sign_eq_one_of_odd_weight`): `(hfix : ∀ z ∈ Λ, z ^ 2 ≠ (p : ℂ) ^ D.weight)` → `(hfix : ∀ z : ℂ, z ^ 2 = (p : ℂ) ^ D.weight → Even (Λ.count z))`. The docstring was rewritten to match.
- **README 5.5:** "no `λ ∈ Λ` has `λ² = p^w`" → "each of the two square roots `±p^{w/2}` … occurs in `Λ` with even multiplicity", with the pairing proof.
- **New Check:** `{√5, √5, −√5, −√5}` gives `F = 1 − 10T² + 25T⁴` and `ε = +1`, yet the old proviso excludes it. `{√5, √5}` is a second such instance.
- **Realization claim:** "ε_p = 1 because the pairing is alternating" now has a named route. `DeligneWeightsAndPurity` 0.16 (iii) gives a perfect alternating pairing on the generalized eigenspace of `±p^{w/2}`, and Tau Ceti's `LinearMap.BilinForm.IsAlt.even_finrank` (pin `2fd255d`, `TauCeti/LinearAlgebra/BilinearForm/SymplecticBasis.lean` line 365) makes it even-dimensional. That declaration is added to *From Tau Ceti* and to 5.5's *Needs:*.

## H08 (CBirkbeck) — applied

`WeilSheaf/LisseExtension.lean` and `WeilSheaf/MiddleExtension.lean` of weil-conjectures are in Provenance. They treat lisse Weil sheaves on an arbitrary smooth curve over a finite field, extension across a point with trivial local monodromy, and the identification of a lisse sheaf with `j_* j^*` of its restriction to a dense open. Nothing in them is specific to `𝔾_m ∖ {1}` or to a hypergeometric sheaf, and the entry says so. "W2 only" holds for middle extensions. Weil does have lisse ℓ-adic sheaves, but only as coefficient systems in its duality files (via Stacks' `lisseSheaf`), with no middle extension.

## Ownership against open work

- **`EtaleDualityAndPerverseSheaves` §8.1** (open, head read through `roadmaps show`) states the general alternating-similitude determinant `det φ = c^{b/2}` with even self-paired multiplicities (`form_similitude_det_alt`). It is later in the merge order (`ORDER.txt` line 96, this roadmap line 91), so it is not cited as a supplier. 5.5's realization step uses only the two inputs that §8.1 itself consumes, `DeligneWeightsAndPurity` 0.16 and `LinearMap.BilinForm.IsAlt.even_finrank`, at the hypergeometric instance. The *Not owned here* bullet claims only that instance and the hypergeometric `ε_p`, not the general parity statement. No notion moves down beyond what 5.5 already targeted.
- **`DeligneWeightsAndPurity` 0.16** says that self-pairing parity and signs are outside its scope.
- **Other similar text:** `roadmaps grep` finds related remarks in `AbelianVarietiesOverFiniteFields` and `CurvesOverFiniteFields` (open, not in this roadmap's supplier list); they are not cited.
- **Name clashes:** no declaration of `Suggested.lean` takes another roadmap's fully qualified name.

## Adversarial pass on changed statements

The table writes `c = p^w`, `a = count(+√c)` and `b = count(−√c)`.

| Statement | Instance | Computed | Result | Change |
|---|---|---|---|---|
| `local_sign_eq_one_of_odd_weight` (new `hfix`) | `Λ = ∅`, `d = 0` | LHS `(−1)⁰·1 = 1`, RHS `p⁰ = 1` | holds | — |
| same | `Λ = {−1 ± 2i}`, `p = 5`, `w = 1` (`A2.2_B1.1`, `t = 2`) | `a = b = 0`; `∏ = 5`; LHS `5`, RHS `5^{1·2/2} = 5` | holds | — |
| same | `{√5, −√5}` | `a = b = 1` (odd), so excluded; LHS `−5`, RHS `5` | hypothesis needed | kept as negative Check |
| same | `{√5, √5, −√5, −√5}` | `a = b = 2`; `∏ = 25`; LHS `25`, RHS `5^{4/2} = 25`; `F = 1 − 10T² + 25T⁴` | holds; old hypothesis excluded it | new Check |
| same | `{√5, √5}`, `{−√5, −√5}` | `∏ = 5`; LHS `5` = RHS `5` | holds | in Check |
| same | `{i√5, −i√5}` (`a_p = 0`) | `(i√5)² = −5 ≠ 5`, so no fixed points; `∏ = 5`; LHS `5` = RHS | holds | — |
| same | `p = 2`, `w = 3`: `{2√2, −2√2}` / `{2√2, 2√2}` | first excluded (LHS `−8` ≠ RHS `8`); second LHS `8` = RHS `2^{3·2/2} = 8` | holds | — |
| same | `{√5}` (`d = 1`) | `a = 1`, excluded; LHS `−√5`, RHS `5^{⌊1/2⌋} = 1` | `ℕ` division is exact whenever `hfix` holds, since `d = 2k + 2a′ + 2b′` is even | — |
| same, `hw` | `w = 0`: `{1, 1}`, `{−1, −1}` | LHS `1` = RHS `1` | `hw` is not used by the multiset argument (it was not used under the old hypothesis either); P3 note, kept because the statement and its README route are the symplectic case | none |
| 5.5 realization route | abelian surface with `F = (1 − pT²)²`; supersingular elliptic curve `F = 1 + pT²` | eigenvalues `±√p`, each twice, under an alternating Weil pairing, so `ε = 1` and `coeff 4 · p⁰ = p² = ε p² coeff 0`; `±i√p` gives `coeff 2 = p = ε p` | consistent | route named |
| 5.5 (i) via DWP 0.10 | `Λ = {−1 ± 2i}` | `D = 1 + 2T + 5T²`, `−TD′/D = −2T − 6T² + …`, i.e. `a_5 = −2`, `a_25 = −6` (the 5.2 Check values) | consistent with 5.1/5.2 Checks | route added |
| Provenance: Weil sign lemma | odd `n`, even multiplicities; even `n` | `f(0) = (−1)^d ∏ μ = q^{nd/2}`, and for even `n`, `(−1)^{a}` times it (own computation: `(−1)^d ∏ = (−1)^{a+b}(−1)^b c^{d/2}`) | the README description matches the file's statement | — |

The README and Lean generality agree: both state even multiplicity of every square root of `p^w`.

## Signatures

I put `#check @name` for all 135 declarations after the edited `Suggested.lean` in one scratch file and elaborated it once. 134 elaborated types match the earlier signature file verbatim. The one that differs is `local_sign_eq_one_of_odd_weight`, whose new type ends `(∀ (z : ℂ), z ^ 2 = ↑p ^ D.weight → Even (Multiset.count z Λ)) → (-1) ^ D.degree * Λ.prod = ↑p ^ (D.weight * D.degree / 2)`, as intended.

The 10 "looks dropped" leads (`qm`, `gaussSumPow`, `katzSum`, `hypergeometricSum`, `greeneBinom`, `greeneF`, `gammaVectorSum`, `legendreFamily`, `cubicFamily`, `weightedTorusPoints`) are unchanged from `f847e92`. Each is a `def` that does not use the `[Fintype F]`, `[DecidableEq F]` or `[Field F]` section instance it was flagged for; every theorem that reads these defs carries the instances it needs in its own type. No change.

## Sources

No literature citation was added or changed, so `sources.toml` (which this job may not edit) and `needs-references.toml` are untouched. The external repositories are cited by pinned GitHub links in the Provenance section only. Nothing from them is copied.

## Build and gate

- `lake build TauCetiRoadmap.HypergeometricMotives.Suggested`: `Build completed successfully (8954 jobs).` The only warnings are the expected `declaration uses 'sorry'`.
- Gate on `4c29b232`: `gate HypergeometricMotives: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`): `depcheck: 239 roadmaps, 2344 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. It did not check names outside TauCetiRoadmap; `LinearMap.BilinForm.IsAlt.even_finrank` was checked by hand at the Tau Ceti pin (see H07).
