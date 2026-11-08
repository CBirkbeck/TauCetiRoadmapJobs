# GATE-AbelianVarietiesOverFiniteFields~1: answers to human review

There was one comment to answer: CBirkbeck, 2026-11-06T14:21:17Z, "External formalisations to consult".
It makes eight distinct points, numbered H01–H08 in the order they appear. All edits are in
`TauCetiRoadmap/AbelianVarietiesOverFiniteFields/README.md`, and `Suggested.lean` is unchanged. Commit
`d632deb5` ("AbelianVarietiesOverFiniteFields: review repairs (pinned provenance section;
K-isomorphism citation in 1.2; 7.2 without Weil bound)"), not pushed.

Every pointer was read at a fixed commit:

- formal-arithmetic-geometry/weil-conjectures ("W2") at `55abf461d4688270382c9c982ac08a279e41c00b`;
- AxiomMath/Weil at `27cdb2049be62ee2911429b47f54774078450e32`.

Both were read through public GitHub raw and API pages.

## H01 (CBirkbeck) — applied

New `## Provenance` section before `## References` (README lines 2248–2295). It follows the precedent of `PrimitivePrimeDivisors` "Provenance" and `CFSGBasicProperties` "Existing formalizations" on main.

- It lists the W2 and AxiomMath/Weil files as commit-pinned links, each mapped to the milestone it informs.
- It treats them as proof sources rather than specifications, and states that adapted proofs keep the Apache-2.0 attribution. The licence of AxiomMath/Weil, W2 and AxiomMath/Stacks was checked as `Apache-2.0` (spdx) through the GitHub API.
- It notes that neither repository uses Tau Ceti's `AbelianVariety K`, so each statement is compared with the milestone before it is transported.

AxiomMath/Stacks is not listed: its purity, trace-formula and proper-base-change material maps to no milestone owned here. That material is reached only through DWP.1, which is consumed.

## H02 (CBirkbeck) — answered

This roadmap defines no scheme-level object and proves no purity statement. The Weil estimate `|α_i| = √q` is consumed from DWP.1 §1.4 (supplier contracts, README line 302). After the 7.2 repair (H04), its only use in a milestone is 1.3, which needs the modulus for `IsWeilPolynomial q P_A` (README line 519). So the choice of purity route (Weil II with the Fourier–Deligne transform) belongs to the DWP.1 supplier and does not affect any statement here.

## H03 (CBirkbeck) — applied differently

The overlap is not only scheme-level and Jacobian inputs:

- W2's `ZetaLinearAlgebra/WeilNumbers.lean` overlaps §1.0's Weil-number predicate, which is owned here.
- AxiomMath/Weil's point-count file overlaps the model-independence step of 1.2, also owned here.

The Provenance introduction states the overlap as "scheme-level inputs (most of them consumed from the suppliers; the rest are steps of 1.2 and 7.2) and the Weil-number predicate of §1.0".

## H04 (CBirkbeck) — applied differently

Most of the pointers were verified; one is corrected.

- **Verified:** `TateModule.lean` `nonempty_linearEquiv_tateModule` gives `T_ℓ A ≃ₗ[ℤ_[ℓ]] (Fin (2 * dim A) → ℤ_[ℓ])`.
- **Verified:** `RationalTateModule.lean` `bijective_rationalTateModuleGaloisMap_frobenius_sub_id` gives `σ − 1` bijective on `V_ℓ A`, with `[Fintype K]` and `(ℓ : K) ≠ 0`. Here `σ` is the arithmetic Frobenius of `Gal(K̄/K)`, not the endomorphism `π_A`; the README states that DWP.1 §1.1 makes the identification.
- **Verified:** `Isogeny.lean` `isIsogeny_npow_id` and `isogenyDegree_npow_id` give `[n]` an isogeny of degree `n^{2g}` for `n > 0`.
- **Corrected:** `A(K̄)[n] ≅ (ℤ/n)^{2g}` is in none of the three named files. It is in `AlgebraicGeometry/AbelianVariety/Torsion.lean` `nonempty_addEquiv_torsionBy` (`IsAlgClosed K`, `0 < n`, `¬ p ∣ n`), and the README links that file.

Checking the proof structure also exposed a needless dependency, now repaired. W2 obtains `σ − 1` bijective over a finite field without the Weil bound, whereas 7.2 cited DWP.1 §1.4 for this step. In 7.2 (README lines 1176–1177):

- old: "no root of `P_A` is `1`, since `|α_i| = √q > 1`, DWP.1 §1.4"
- new: "`det(π_A − 1 ∣ V_ℓ A) = (−1)^{2g} P_A(1) = P_A(1)` by A6.11, and `P_A(1) = #A(K) ≥ 1` by 1.2"

DWP.1 §1.4 is removed from 7.2's *Needs:* line.

## H05 (CBirkbeck) — disputed

`WeilConjectures/AlgebraicGeometry/Picard/Jacobian.lean` at `55abf46` (read in full, three segments) states neither `P_J = P_C` nor `Pic ≅ ℤ × J`. Its end theorem is `exists_jacobian_of_geometricallyConnected`:

- input: a proper smooth geometrically connected curve over any field, with no rational point;
- output: a proper, smooth, geometrically integral group of relative dimension the arithmetic genus, representing `Pic⁰`.

Three other W2 files also lack both statements:

- `AbelianVariety/Jacobian.lean`: `IsJacobian` and `exists_isJacobian`, over a separably closed field.
- `Picard/DegreePoints.lean`: `theorem_of_the_base`, a clopen decomposition of the Picard scheme indexed by `ℤ`, over a separably closed field, with set bijections only.
- `Picard/RationalPoint.lean`: the normalized Picard functor only.

Provenance therefore cites the file only for the Jacobian construction of JacobianChallenge Layer E, and says that 1.5's `P_{Jac C} = P_F` is not stated in it.

## H06 (CBirkbeck) — applied differently

The pointers lead to different things than the comment describes:

- **`ZetaLinearAlgebra/WeilNumbers.lean`:** `IsWeilNumber (q : ℕ) (w : ℝ) α` is element-level: `IsIntegral ℚ α` and every complex embedding has absolute value `q^{w/2}`. The only polynomial form is `isWeilNumber_iff`, through the minimal polynomial. There are no product, factor or finiteness lemmas.
- **`WeilFactorization.lean`:** its polynomial predicate is on reversed factors, with roots of modulus `q^{−i/2}`.
- **`Reciprocity.lean`:** `C_det_mul_P_rev_of_pairing` is trace-datum (Poincaré-duality) reciprocity, not the `α ↦ q/α` symmetry of `P_A` from 1.3 and Part II F0.2.

Provenance records these differences of convention. Convention witness at `q = 5`, `α = 1 + 2i`:

- `|α| = 5^{1/2}`, so `α` has weight 1, which is §1.0's convention for `P`;
- `L = 1 − 2T + 5T²` has roots `1/(1 ± 2i)` of modulus `5^{−1/2}`, the `q^{−i/2}` form with `i = 1`.

## H07 (CBirkbeck) — applied

**Frobenius file.** The file is at `Weil/Defs/AlgebraicGeometry/Frobenius.lean`. It defines `frobeniusOver` as a morphism over `Spec κ`, and `eq_frobeniusOver_left` characterizes it as the identity on points and the `q`-th power on sections. Naturality and product compatibility are not in that file; 1.1 takes naturality from SchemeAndStackFoundations §0.29. Provenance cites the file for the scheme Frobenius that DWP.1 §1.1 starts from.

**Point-count file.** `Weil/Defs/AlgebraicGeometry/EtaleCohomology/Trace/FieldValuedPointCount.lean` counts points over Mathlib's model `FiniteField.Extension k p n` and compares it to other extensions through `FiniteField.algEquivExtension`. Following that pointer exposed a wrong citation in 1.2 (README lines 483–487 and 492):

- 1.2 cited `FiniteField.algEquivOfCardEq` for "any two degree-`r` extensions of `K` are `K`-isomorphic".
- At the pin, the elaborated `#check` shows that declaration returns only `K ≃ₐ[ZMod p] K'`, which need not fix `K`.
- The citation is now `FiniteField.algEquivExtension`, which returns `l ≃ₐ[k] FiniteField.Extension k p n` given `Module.finrank k l = n`.
- Both names were added to the Mathlib supplier contract (README line 190).
- A negative-control Check was added to 1.2: for `𝔽₄ ⊂ 𝔽₁₆`, squaring sends `ω` to `ω + 1`. It is an isomorphism of fields of equal size but not a `K`-isomorphism.

## H08 (CBirkbeck) — answered

This is consistent with what was checked:

- **AxiomMath/Weil at `27cdb20`:** the complete recursive tree listing (`truncated: false`) has no path containing `AbelianVariet`, `Jacobian`, `Isogen`, `TateModule`, `Honda`, `Polariz` or `Endomorph`.
- **W2 at `55abf46`:** the 22 files of `WeilConjectures/AlgebraicGeometry/AbelianVariety/` contain none of these topics. W2's full tree (an 8.7 MB listing) was not searched exhaustively.

In this roadmap these items are consumed (AS Tate, Part II F3.2, A4.1 `dualPairing`, A3/A6) or owned in Layers 3 and 8–10. So Provenance maps nothing to Layers 2–4 or 8–11.

## Build

`lake build TauCetiRoadmap.AbelianVarietiesOverFiniteFields.Suggested`: exit 0, "Build completed successfully (8957 jobs)". The only warnings are the four expected `declaration uses 'sorry'`, at lines 38, 89, 115 and 148. `Suggested.lean` is byte-identical to `e6d7112`.

## Gate

Summary line:

    gate AbelianVarietiesOverFiniteFields: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL
      depcheck: NOT IN ORDER: AbelianVarietiesOverFiniteFields (insert it after its last supplier)

The only failure is `NOT IN ORDER`. The roadmap is absent from `ORDER.txt` (0 occurrences), so it is at the design stage, which the brief says is not a defect. The README at `e6d7112`, before these edits, gives the identical depcheck line. Direction check (`gate --depcheck … --movable`), complete output:

    NOT IN ORDER: AbelianVarietiesOverFiniteFields (insert it after its last supplier)
    depcheck: 239 roadmaps, 2344 edges, 1 problem(s)

There is no UPWARD, CYCLE or `moved:` line. `roadmaps resolve` on the edited README reports "Cross-roadmap citations found nowhere: None", and neither new Mathlib name is flagged.

## Signature check (`#check @name`)

I put `#check @` lines for all 15 declarations, plus `FiniteField.algEquivExtension`, `FiniteField.algEquivOfCardEq` and `WeierstrassCurve.frobeniusTrace`, temporarily at the end of `Suggested.lean`. I elaborated them in one build of the module and then restored the file.

Every elaborated type matches its README statement:

- **`waterhouse`:** `[Field K] [Finite K]`, `p.Prime`, `[CharP K p]`, `0 < r`, `Nat.card K = p ^ r`, then the five-case disjunction.
- **`weakEquiv_iff_one_mem`, `isGorenstein_iff_forall_invertible`, `finite_pic`:** each carries `[Module.Finite ℚ E] [IsReduced E]` and `IsOrder E Λ`.
- **`traceDual` and `IsGorenstein`:** both carry `[Module.Finite ℚ E]`.
- **`colon`, `multiplierRing`, `IsInvertible`, `WeakEquiv`:** these need only `[CommRing E]`, as their ring-only definitions require.

No binder was lost and nothing changed.

## Adversarial pass on the changed statements

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| 7.2: `π_A − 1` is bijective on `V_ℓ A`, since `det = P_A(1) = #A(K) ≥ 1` | `g = 0` | det on the zero space is 1; `P = 1`; `#A(K) = 1` | holds | new route |
| (same) | `1.5.ac`, `π − 1 = 2i` on `ℤ[i]` | det `[[0,−2],[2,0]]` = 4; `P(1) = 4`; `#E(𝔽₅) = 4` | holds | — |
| (same) | `1.2.ac`, `π − 1 = i` | det 1; `P(1) = 1`; `#E(𝔽₂) = 1` | holds | — |
| (same) | scalar `π = −3` over `𝔽₉` | det `(−4)I₂` = 16; `P(1) = (1 + 3)² = 16` | holds | — |
| (same) | wrong sign model `(−1)^g`, with `g = 1` | gives −4, but `#E(𝔽₅) = 4` | excluded: the dimension is `2g` | — |
| 1.2: a degree-`r` extension `L` of `K` is `K`-isomorphic to the model (`algEquivExtension`) | `r = 1`, `L = K` | `K ≃ₐ[K] Extension K p 1`; `NeZero r` holds because `finrank ≥ 1` | holds | citation fixed |
| (same) | negative case: `algEquivOfCardEq` | its type is `K ≃ₐ[ZMod p] K'` (from `#check`) | not a `K`-map | negative Check added |
| New Check: `𝔽₄ ⊂ 𝔽₁₆` | `ω² + ω + 1 = 0` in characteristic 2 | `ω² = ω + 1 ≠ ω`; squaring is injective on a finite field, so bijective | not `K`-linear | — |
| Provenance: Weil weight convention | `q = 5`, `α = 1 + 2i` | `|α|² = 5`, so weight 1; the roots of `L` have modulus `5^{−1/2}` | agrees with §1.0 and 1.3 | — |
| Provenance: `[n]` has degree `n^{2g}` | `E`, `n = 2`; `g = 0` | 4 = 2²; 1 = n⁰ | agrees with the 1.7 Check | — |
| Provenance: `A(K̄)[n] ≅ (ℤ/n)^{2g}` needs `p ∤ n` | `n = p = 2`, `1.2.ac` | `E[2](K̄) = 0 ≠ (ℤ/2)²` | the hypothesis is needed (matches the 6.1 Check) | — |
| Provenance: `σ − 1` versus `σ⁻¹ − 1` | `π = 1 + 2i` | `σ⁻¹ − 1 = −σ⁻¹(σ − 1)`; norm of `(1 − 2i)/5 − 1` is `4/5 ≠ 0` | bijectivity agrees for both | — |

## Ownership, sources, untrusted text

- **Ownership:** the edits add no construction, carrier or target. Provenance claims no ownership, so no ownership search was needed. Every citation in it is to a supplier already in the contracts (DWP.1, A4.1, JacobianChallenge Layer E, Part II F0.2, SchemeAndStackFoundations §0.29).
- **Sources:** the repositories are cited by commit URL and file path, and no passage was copied. `sources.toml` is outside this job's editable files, so no manifest entry was added. No text was missing, and `needs-references.toml` was not written.
- **Untrusted text:** the comment contains no instructions to run commands or act outside the job, so nothing suspicious is quoted.
