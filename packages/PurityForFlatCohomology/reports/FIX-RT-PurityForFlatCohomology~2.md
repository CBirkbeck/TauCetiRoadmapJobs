# FIX-RT-PurityForFlatCohomology~2: red-team round 2 (reviews 2a and 2b) repaired

All nine findings were verified against the sources, the pinned libraries and PrismaticCohomology at its
open head, and all nine hold. All nine are applied; one (2b/F04) is applied as asked plus a contract
deletion the finding left conditional. Only `packages/PurityForFlatCohomology/README.md` changed;
`Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are untouched.

## RT-PurityForFlatCohomology~2a/F01 (P2) — applied

Verified: §0.2's local-to-global bullet ended "by §0.3" (the geometric-stalk identification) while §0.3's
*Needs* listed §0.2, an internal cycle. Old → new: the stalk clause is removed from §0.2 (a pointer to §0.3
remains); §0.3 now states the order of proof (absolute continuity, then supported continuity from the
support triangle by the five lemma) and then a separate **stalk formula** target with its hypotheses
(quasi-compact `U → X`, finitely presented `F` or `𝒢^a`), route and locator ([C19] proof of Theorem 6.1,
p. 13). The neighbourhood Check moved to §0.3 and a discriminating Check (`X = Z = Spec ℚ`, `μ_2`: stalk
`0`, value `ℚ^×/ℚ^{×2} ≠ 0`) was added. The other citations of the stalk formula (§7.1 route, §8.5 route)
already read "§§0.2–0.3" and stay correct.

## RT-PurityForFlatCohomology~2a/F02 (P3) — applied

Verified at the pin: `Order.krullDim_eq_bot` (`Mathlib/Order/KrullDimension.lean:609`) gives `⊥` for an
empty poset; `ringKrullDim_eq_zero_of_field`. Old → new (§0.1 Check): "its dimension is `0`" → "its Krull
dimension is `⊥` … while `ringKrullDim K = 0`", noting that the dimension-zero characterisation is about
`ringKrullDim K`. Consistent with the zero-ring Check (`⊥`).

## RT-PurityForFlatCohomology~2a/F03 (P2) — applied

Verified: `AlgebraicGeometry.Scheme.IsQuasiAffine` extends `CompactSpace`
(`Mathlib/AlgebraicGeometry/QuasiAffine.lean:34`); for `R = k[x_1, x_2, …]_{(x_1, x_2, …)}` the prime
`(x_1, …, x_n)R` lies in `D(x_{n+1})` and in none of `D(x_1), …, D(x_n)`, so `⋃ D(x_i)` has no finite
subcover. Old → new (§7.11): "every quasi-affine `X` such as `Spec R` and `puncturedSpectrum R`" → "every
quasi-compact open subscheme of an affine scheme: `Spec R` for every `R`, and `puncturedSpectrum R`
whenever it is quasi-compact, for instance `R` Noetherian (§0.1)"; the infinite-variable ring added as a
negative Check, `k⟦x, y⟧` as the positive control. Every consumer of §7.11 (§§7.12, 7.13, 8.10, Scope,
Convention 7) applies it to Noetherian `R` or to affine `X`, so none changes.

## RT-PurityForFlatCohomology~2a/F04 (P3) — applied

Verified: `lake-manifest.json` records Mathlib `f6090c70…` and Tau Ceti `358314d4…`, and both package
checkouts have those HEADs. Old → new: the two "Pinned at" hashes replaced. Every declaration named in the
Mathlib and Tau Ceti contracts was re-located at those pins (`fppfTopology`, `cohomologyPresheaf`,
`localCohomology`, `IsRegularLocalRing`, `IsWeaklyRegular`, `functorToContAction`, `fontaineTheta`,
`PreTilt`, `IsAzumaya`, `LineBundleClass`, `cartierDual`, `pointsFppfSheaf`,
`gradedAlgebraQuotientPiece`, `IsRegularLocalRing.isDomain`, the torus and multiplicative-type
categories); `Suggested.lean` elaborates against them (below).

## RT-PurityForFlatCohomology~2b/F01 (P2) — applied

Verified: PrismaticCohomology §2.0 at its open head ("Arc descent for the comparisons") names no Lean
declaration; `roadmaps grep` for the seven names matches nothing on main or in any open pull request. The
mathematics cited is there (the arc, `arc_p` and formal arc sites, the perfectoid basis, covers by products
of `p`-complete rank-one valuation rings with algebraically closed fraction fields, the `arc_p` sheaf
property, the henselian comparison, BS22 Proposition 8.10). Old → new: the contract's name list replaced
by that prose with "[CS24] Lemma 2.2.3, p. 19" for the valuation-ring covers (verified: CS24 line 764,
after the page-19 marker at 739); §5.3 *Needs* reads "the perfectoid basis of the formal arc site,
acyclicity of `𝒪`"; §5.9 reads "covers by products of valuation rings; [CS24] Lemma 2.2.3, p. 19".

## RT-PurityForFlatCohomology~2b/F02 (P3) — applied

Verified: CS24 line 3758 (Remark 7.2.4) follows the page-90 marker at line 3757. Old → new (§7.9 Check):
"[CS24] p. 89 uses an elliptic curve" → "[CS24] Remark 7.2.4, p. 90, uses an elliptic curve".

## RT-PurityForFlatCohomology~2b/F03 (P3) — applied

Verified: the five numbers were lines of the operator's extraction. Old → new: §2.3 "footnote 13 (CS24
line 997)" → "footnote 13, p. 24" (line 997 follows the page-24 marker at 958); the four "(text line …)"
and "(line …)" parentheses in Source corrections deleted, the printed pages kept. No other extraction line
number remains in the README (grep for `line <digits>`).

## RT-PurityForFlatCohomology~2b/F04 (P3) — applied

Verified: Convention 1 fixes `IsWeaklyRegular`; `IsRegular` adds `top_ne_smul`
(`Mathlib/RingTheory/Regular/RegularSequence.lean:146–147`); `Suggested.lean` uses only
`IsWeaklyRegular`; no README target uses the nonzero-quotient condition (the only two occurrences were §4.2
*Needs* and the contract). Old → new: §4.2 *Needs* cites `IsWeaklyRegular` (Convention 1); the contract
bullet keeps `IsWeaklyRegular` and `Ideal.ofList` and says the stronger `IsRegular` is used nowhere.

## RT-PurityForFlatCohomology~2b/F05 (P3) — applied

Verified: the §1.8 Checks tested the definition only through the isomorphism and empty-open cases. Added
the Check `f : Spec ℂ → Spec ℝ`: `ℂ ⊗_ℝ ℂ ≅ ℂ × ℂ`, rank `2` preserved, connectedness lost, not full
(`Hom_ℝ(Spec ℝ, Spec ℂ) = ∅` against two maps `Spec ℂ → Spec ℂ ⊔ Spec ℂ` after pullback), so pullback along
a faithfully flat map need not be an equivalence.

## Adversarial pass on the statements added or changed

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| §0.3 stalk formula | `X = Z = Spec ℚ`, `μ_2`, point over `ℚ^s`; `Z = ∅`; strictly henselian DVR `R`, `Z = {𝔪}`, `𝔾_m`, `j = 1`, point at `𝔪` and point at the generic point | stalk `H¹(ℚ^s, μ_2) = 0` vs value `ℚ^×/ℚ^{×2} ∋ [−1] ≠ 0`; `ℋ^j_∅ = 0 = H^j_∅`; `H¹_𝔪(R, 𝔾_m) = K^×/R^× = ℤ` at the closed point, `Z_x̄ = ∅` so `0` at the generic point | holds; Zariski-stalk wrong model excluded by the new Check |
| §0.3 order of proof (supported from absolute + triangle) | `Z_0 = X_0`; `Z_0 = ∅` | triangle `RΓ_X → RΓ → 0`: supported = absolute; `RΓ_∅ = fib(id) = 0` both sides | holds |
| §0.3 quasi-compactness Check | `X = Spec k[x_1, x_2, …]_{(x_i)}`, `Z = {𝔪}` | `U ×_X X′` not quasi-compact for affine `X′` (same witness as §7.11) | hypothesis kept |
| §0.1 field Check | `K = 𝔽_2`; zero ring | `krullDim ∅ = ⊥`, `ringKrullDim 𝔽_2 = 0`; zero ring: carrier `∅`, `ringKrullDim = ⊥` | corrected to `⊥` vs `0` |
| §7.11 hypothesis | `Spec R` any `R`; `k⟦x, y⟧`; `k[x_1, x_2, …]_{(x_i)}`; `k⟦x, y, z⟧` | `𝒪` ample on affines; `D(x) ∪ D(y)` quasi-compact; `⋃ D(x_i)` no finite subcover (`(x_1,…,x_n)R` missed by first `n` opens); punctured 3-fold quasi-affine | hypothesis added, negative Check added |
| §1.8 `ℂ/ℝ` Check | `f : Spec ℂ → Spec ℝ`, cover `Spec ℂ → Spec ℝ` | `ℂ ⊗_ℝ ℂ ≅ ℂ × ℂ` (two idempotents `(1 ± i⊗i)/2`); Hom sets `0` before, `2` after | Check added |
| §4.2 *Needs* `IsWeaklyRegular` | `A = k`, `m = 1`, `f_1 = 1`; `k⟦x, y⟧`, `(x, y)` | `1` is a nonzerodivisor, `B = 0`, statement vacuous but stated; `(x, y)` weakly regular and regular, `B = k` | matches Convention 1 |
| PrismaticCohomology §2.0 contract | `𝒪_C`; `Spf ℤ_p` | `𝒪_C → ∏ V_j` with `V_j` `p`-complete rank-one, algebraically closed fraction fields (Lemma 2.2.3, p. 19); identity cover | prose contract, no invented names |
| Locators (2b/F02, 2b/F03) | footnote 13; Remark 7.2.4 | line 997 after marker 958 (p. 24); line 3758 after marker 3757 (p. 90) | pages corrected |
| Pins (2a/F04) | manifest vs checkouts | `f6090c70…` = Mathlib HEAD; `358314d4…` = Tau Ceti HEAD | hashes corrected |

## Checks

- `lake env lean …/packages/PurityForFlatCohomology/Suggested.lean` (run from the content checkout, on
  the file with the module-system header described under "Worker check repair" below): exit 0, seven
  "declaration uses `sorry`" warnings (lines 135, 146, 159, 172, 182, 189, 201), no error, no other
  warning. Both `TauCeti.*` imports had their object files.
- `#check @name` for all 12 declarations in a scratch copy of the module-form file: elaborated types
  identical to `signatures.md` and to the pre-repair run (diff empty); every binder (`IsNoetherianRing`,
  `IsAlgClosed`, `FiniteDimensional`, `Module.Finite`, `Module.IsReflexive`, `IsRegularLocalRing`)
  present. No declaration of the Lean file changed this round; only its header did.
- `roadmaps resolve`: Lean names found nowhere: none. One cross-roadmap lead remains,
  "PerfectoidQuotientsPartII §§Q5.2" (README line 104): PerfectoidQuotientsPartII is a supplier earlier in
  the merge order whose folder the resolver does not index; not raised by either review, left as is.
- Dependency check:
  `depcheck: 238 roadmaps, 2201 edges, 0 problem(s)` — no UPWARD, CYCLE or moved line.
- Every Lean name of `Suggested.lean` appears in the README; no README name of this roadmap's own is
  undeclared.

## Worker check repair

The worker's build logged, twice, the warning that `Suggested.lean` imports `Mathlib` from package
`mathlib`, which is designed for the module system, and suggested adding `module`. Repaired in place
with the header form used on main (for instance `TauCetiRoadmap/CoboundaryExpansion/Suggested.lean`):
the file now begins `module`, then `public import Mathlib`, `public import
TauCeti.AlgebraicGeometry.LineBundle.Class`, `public import TauCeti.RingTheory.RegularLocalRing.Basic`,
and `@[expose] public section` is placed after the `universe u v` line and before the namespace. The
docstring, the universe line and every declaration are untouched (their line numbers moved down by four).
Re-elaboration and the `#check` comparison are recorded under "Checks" above. The README, `metadata.toml`,
`sources.toml` and `design/plan.json` are as they were after the finding repairs.

## Notes for the maintainer

- No gate failures were listed for this round.
- Names other roadmaps cite: none changed. The stalk formula moved from §0.2 to §0.3 inside this
  roadmap; the §7.1 and §8.5 routes already cited "§§0.2–0.3".
- Ownership against open pull requests: PrismaticCohomology was read at its open head (#1057 per
  `roadmaps show`); no other ownership question arose this round.
- Suspicious text: none in the reviews.
