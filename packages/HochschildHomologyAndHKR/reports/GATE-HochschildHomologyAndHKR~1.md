# GATE-HochschildHomologyAndHKR~1: answers to the review of 2026-11-19 (kim-em)

One review with nine points: six requested changes (H01–H06) and three smaller points (H07–H09).
All edits are in `TauCetiRoadmap/HochschildHomologyAndHKR/README.md` and
`TauCetiRoadmap/HochschildHomologyAndHKR/Suggested.lean`, commit `e98ebdbe` on top of `8f5af44`
(not pushed). Line numbers below are at `e98ebdbe`.

## H01 (kim-em) — applied

The gap is closed in this roadmap. `gap:smooth-hkr-antisymmetrisation` is deleted everywhere: the old
§6.4(d), the *Needs* of §§6.4 and 7.6, the Layer 6 and 7 Dependencies, and the RefinedTraceMethods
contract bullet. A new Layer 9 (README line 1836) holds §9.1, "The homological HKR theorem":
`ε^cl_n : Ω^n_{R/k} → HH_n(R,R)` is an isomorphism for every smooth `R` over every `k`, with no
projectivity assumed. It is stated in Lean as `homological_hkr` (`Suggested.lean` line 313). The
old §7.6 moves unchanged to §9.2 and now uses §9.1.

The route follows the review's outline, with one difference. Étale base change is imported, not
planned again: RefinedTraceMethods §1.8 ("Étale base change (Weibel–Geller)", at its head
`c0f6d0f4`) already states `HH_*(B/k) ≅ B ⊗_A HH_*(A/k)` for `k`-flat `A → B` étale, and §6.3
carries it to the classical complex. The proof then goes through
`Algebra.Smooth.exists_span_eq_top_isStandardSmooth`,
`RingHom.IsStandardSmooth.exists_etale_mvPolynomial`, `Algebra.Etale.of_isLocalizationAway`,
`KaehlerDifferential.tensorKaehlerEquivOfFormallyEtale`, `ExteriorAlgebra.baseChangeEquiv` and
`bijective_of_isLocalized_span`; each was checked with `#check` at the Mathlib pin.

§9.1 cannot stay in Layer 6, and §9.2 cannot stay in Layer 7: both would then depend forward on
§8.4. That is why they form a new last layer. Layer 7 is retitled "Polyvector fields and the HKR
maps", and the overview, the guide to the layers, the Scope and ownership section and the
Generality paragraph are updated to match.

The review's alternative, keeping the gap and writing the pull-request number of
RefinedTraceMethods into the contract, is not applied (see H04). RefinedTraceMethods is still a
supplier, now through its §§1.1, 1.8 and 1.9, which exist at its head. It comes immediately before
this roadmap in the merge order (`ORDER.txt` lines 358–359).

## H02 (kim-em) — applied

`Suggested.lean` now has two new definitions with real bodies, both right after `detCochain`:

- `hkrMap k R n : ⋀[R]^n (Derivation k R R) →ₗ[R] (Fin n → R) →ₘₗ[k] R` (line 234). It is `τ_n`
  of README §7.4 (`exteriorPower.pairingDual` after `⋀^n` of
  `(KaehlerDifferential.linearMapEquivDerivation k R).symm`), followed by evaluation on
  `dr₁ ∧ ⋯ ∧ dr_n`.
- `normalizedHKRMap k R n [Invertible (n.factorial : k)]` (line 257). It is `hkrMap` multiplied by
  the image of `⅟(n! : k)` in `R`.

A proved `example` (line 247) shows `hkrMap k R n (ιMulti R n D) = detCochain k R D`. It pins the
index convention: row `i` is `(D₁(r_i),…,D_n(r_i))`.

The cocycle property is not a separate Lean theorem, because it is an API fact. It is stated for
every commutative `R` in §7.5's prose. It also enters a new headline, `normalized_hkr` (line 367).
That theorem is §9.2(4): for `R` smooth and `k`-projective and `n!` invertible, every
`normalizedHKRMap k R n ξ` is a cocycle, and `ξ ↦ [·]` is a `k`-linear isomorphism onto
`HH^n(R,R)`.

The meaning of "`n!` invertible" is stated in §7.5 (README line 1541 ff.): `(n! : k)` has an
inverse, `Invertible (n.factorial : k)`, as over a field of characteristic `0` or of characteristic
greater than `n`. `README §7.5` names both maps in backticks, and §9.2(4) names `normalized_hkr`.

## H03 (kim-em) — applied differently

§7.5 is not split. Instead its *Needs* line (README line 1566) is itemised, which is the other
option the review offered:

- the two maps, their value on pure wedges, the cocycle property, the cases `n ≤ 1` and
  injectivity need §§1.2, 1.5, 2.2, 7.4;
- the expansion in cup products needs §5.1;
- the class identity needs §§5.1, 5.2, 6.2;
- the evaluation formulas need §§6.4(a), 7.1.

§1.5 is added as requested. §5.2 is added too, since the class identity needs the cup product of
a cocycle with a coboundary to be a coboundary; the old line lacked it.

## H04 (kim-em) — disputed

The README cites roadmaps by name and section only. It contains no pull-request number (`grep '#[0-9]'`
finds none), and the gate's `prnum` check is 0. Writing PR numbers into the contracts would break
this convention: a citation names the roadmap and its section, never a pull-request number, even
for a roadmap that is still a pull request.

The review itself shows why: the two PR numbers it lists for KTheoryFiniteLocalFields and
EulerSystemsAndKolyvaginSystems went stale when those roadmaps merged on 17 November. Both are now
on main at `890b66d`.

That RefinedTraceMethods is still open is a merge-order fact. It is recorded in `ORDER.txt`
(RefinedTraceMethods at line 358, this roadmap at 359) and goes in the pull-request description.
After H01 the open dependency is on statements that exist at its head (§§1.1, 1.8, 1.9), not on
an unwritten one.

## H05 (kim-em) — applied

Every line-only locator now carries a section, statement or printed-page locator as well. About
40 citations changed, for example:

- `Ginz05 line 752` → `Ginz05 §4.2, line 752`
- `Ginz05 lines 963–966` → `Ginz05 §5.1, lines 963–966`
- `HKR62 lines 284–298 and 352–364` → `HKR62 §4, pp. 389 and 391, lines 284–298 and 352–364`
- `AV20 lines 237–243` → `AV20 proof of Lemma 3.5, p. 6, lines 237–243`

HKR62 printed page = PDF page + 382 (journal pp. 383–408). Ginz05 sections come from its numbered
subsections, and AV20 from its statement numbers and pages.

References (README line 2682) now opens with one sentence saying what `line N` counts: the
`pdftotext -layout` lines of the AMS PDF for HKR62, and of arXiv:math/0506603v1 and
arXiv:1710.06039v1. The HKR62 and AV20 entries also gained page numbers.

## H06 (kim-em) — applied

Scope and ownership (README line 2075) now has three sentences on the boundary:

- Quasi-free algebras, defined by lifting along square-zero extensions and characterised over a
  field by the vanishing of `Ext²` over `Aᵉ`, are CyclicHomologyLieHomologyAndQuasiFreeAlgebras
  Layer 4's.
- The comparison point is §3.6, which classifies `k`-split square-zero extensions by
  `HH²(A,M)`; §4.4 identifies this with `Ext²` for `k`-projective `A`.
- Over a field every square-zero extension is `k`-split, and every `A` is `k`-projective.

Nothing is owned twice. That roadmap (Layer 4.1, read through `roadmaps show`) states quasi-freeness
through `Ext²` and projective dimension, not the `HH²` classification of extensions, and it cites
nothing here. It is not in the merge order and is not a supplier. The depcheck reports no problem
for the mention.

## H07 (kim-em) — disputed

Downstream consumers lists the roadmaps that build on this one. No roadmap on main or among the 355
open roadmap pull requests plans the Rizzardo–Van den Bergh construction:
`roadmaps grep -i 'Rizzardo'` has no hit. Naming it would list a consumer that nobody builds, and
it would add a citation to a work the roadmap does not otherwise use and the source manifest does
not record.

What such a construction needs from this roadmap is now declared: the normalised top-degree cocycle
`normalizedHKRMap` (H02), its class through `normalized_hkr`, and the Jacobian form in §8.5. A
roadmap that plans the construction can cite §§7.5, 8.5 and 9.2 directly.

## H08 (kim-em) — applied

The first Check of §9.2 (old §7.6; README line 1938) was: "the theorem is then HKR62 Theorem 5.2
when `k` is perfect". It now says:

- for `k` a field, the theorem holds for every smooth algebra, perfect field or not;
- HKR62 Theorem 5.2 (p. 395, line 548) proves it for a regular affine algebra, a finitely
  generated regular domain (HKR62 §2, p. 384, lines 85–87), over a perfect field;
- a new witness is added: for the smooth `𝔽₂(u)[x]` over the imperfect field `𝔽₂(u)`, neither
  HKR62 nor Ginz05 applies, while this theorem does.

The same pattern in the overview (README lines 31–32) is repaired. "Over a perfect field the
theorem is the original one" becomes "contains the original one … for regular affine domains",
because HKR62's affine algebras are domains, while a smooth algebra (`k × k`, for example) need not
be one.

## H09 (kim-em) — applied

The instance comes from Mathlib's `IsScalarTower.opposite_mid` (from `SMulCommClass k A A`), found
by `show_term infer_instance` in a scratch file. It is now recorded in two places:

- the module docstring of `Suggested.lean` (line 23), with the identity
  `(c • op b) • x = x (c b) = c (x b)`;
- README Conventions (line 115), next to `Semiring.toOppositeModule`, and in the Mathlib contract
  (line 2382).

## Build

`lake build TauCetiRoadmap.HochschildHomologyAndHKR.Suggested` → `Build completed successfully
(18268 jobs)`. There are 10 `declaration uses 'sorry'` warnings, one for each sorried theorem, and
no errors. The new definitions `hkrMap` and `normalizedHKRMap` and the `example` elaborate with
real proofs.

## Gate

`gate HochschildHomologyAndHKR: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

Depcheck (`gate --depcheck … --movable --pr 2447`): `depcheck: 199 roadmaps, 2188 edges, 0 problem(s)`.
There is no UPWARD or CYCLE line.

`roadmaps resolve README.md`: no cross-roadmap citation and no Lean name of this roadmap found
nowhere. That tool did not check Mathlib or Tau Ceti names on this host. Every Mathlib name the
edits add was checked instead with `#check` against the pinned Mathlib, through `lake env lean`
on a scratch file: `Algebra.Smooth.exists_span_eq_top_isStandardSmooth`,
`RingHom.IsStandardSmooth.exists_etale_mvPolynomial`, `Algebra.Etale.of_isLocalizationAway`,
`KaehlerDifferential.tensorKaehlerEquivOfFormallyEtale`, `ExteriorAlgebra.baseChangeEquiv`,
`bijective_of_isLocalized_span`, `isLocalizedModule_iff_isBaseChange`,
`LinearMap.compAlternatingMap`, `AlternatingMap.toMultilinearMap`, `IsScalarTower.opposite_mid`,
`Algebra.Smooth.flat`, `exteriorPower.map`, `exteriorPower.pairingDual_ιMulti_ιMulti` and
`KaehlerDifferential.span_range_derivation`.

## Elaborated signatures

All 18 declarations were checked with `#check @…` in one scratch copy of the file, elaborated once.
Every declaration carries its binders explicitly; the file has no section `variable`s, so nothing
was lost. Each type matches its README statement:

- `hkrMap`: `(n : ℕ) → ⋀[R]^n (Derivation k R R) →ₗ[R] (Fin n → R) →ₘₗ[k] R`.
- `normalizedHKRMap`: the same type, with `[Invertible ↑n.factorial]` (the coercion into `k`).
- `homological_hkr`: `[Algebra.Smooth k R]` only.
- `normalized_hkr`: `[Algebra.Smooth k R] [Module.Projective k R] … [Invertible ↑n.factorial]`.

The four existing headlines that moved or were reworded (`cohomological_hkr_hom_kaehler`,
`cohomological_hkr`, and the README references of `homological_hkr_mvPolynomial` and
`detCochain_sub_factorial_smul_cupDerivations_mem`) have unchanged types.

## Ownership

- **Étale base change of `HH`.** Owned by RefinedTraceMethods §1.8; imported, with a new contract
  bullet that states what is assumed: the isomorphism is the `B`-linear extension of the induced
  map, and nothing of its derived or cyclic clauses is used.
- **The smooth homological HKR theorem with the map named (§9.1).** KTheoryFiniteLocalFields §4.0
  (on main) states an isomorphism on derived chains without naming the map. RefinedTraceMethods
  §1.9 names `ε_n` but proves only `π_n ε_n = n!` and degree one; its §1.10 HKR filtration
  identifies graded pieces, not `ε`. This roadmap therefore owns the classical, named statement.
  Scope and ownership records it as a kept variant, together with §8.4.
- **The HKR maps, `normalized_hkr` and the instance names.** Nothing like them exists at the pins:
  a grep for HKR, Hochschild–Kostant–Rosenberg and antisymmetrisation in Mathlib and Tau Ceti
  finds no matching declaration.
- **Open pull requests.** Checked against the open roadmap pull requests listed in the brief
  through `roadmaps grep`/`show`.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `hkrMap` on pure wedges = `detCochain` | `k[x,y]`, `(x,y)` and `(y,x)`; `n = 0`; `n = 1`; `k = 0` | `det[[1,0],[0,1]] = 1`, `det[[0,1],[1,0]] = −1`; `n = 0`: empty det `1`; `n = 1`: `D(r)`; all zero over `k = 0` | holds; proved in Lean by `example` | none |
| `hkrMap` takes values in `Z^n` for every commutative `R` | `𝔽₂[x,y]`, `∂_x ∧ ∂_y` | `⟨∂_x,∂_y⟩ = δ(∂_x∂_y)`, a nonzero cocycle with class `0` (§7.5 Check) | holds | none |
| `hkrMap` injective when `Ω¹` is finite projective | `k[x,y]`, `n = 2` | `τ₂(∂_x∧∂_y)(dx∧dy) = 1`, and `T²` is free of rank 1 | holds | route written in §7.5 |
| `normalizedHKRMap`, `n!` invertible | `n = 2`, `k ⊇ ℚ`, `k[x,y]`; `n = 0`; wrong scaling by `n!` | value `1/2` at `(x,y)`; class `(1/2)·2[∂_x∪∂_y] = [∂_x∪∂_y]`; `n = 0`: equals `hkrMap`; scaling by `n!` gives class `4[∂_x∪∂_y] ≠ [∂_x∪∂_y]` over `ℚ` | holds; the wrong variant is excluded by `normalized_hkr` | none |
| `homological_hkr` (§9.1) | `k = 0`; `n = 0`; `ℤ[1/2]/ℤ`; `k × k`; `𝔽₂[x,y]`, `n = 2`; negative control `k[x]/(x²)` | `n = 0`: `r₀ ↦ [r₀]`, the identity of `R`; `ℤ[1/2]`: `b_n = 1, 0` alternately, `HH_n = 0 = Ω^n` for `n ≥ 1`; `k×k`: `Ω¹ = 0`, `HH_n = 0`; `𝔽₂[x,y]`: `ε₂(dx∧dy)` nonzero though `π₂ε₂ = 0`; `k[x]/(x²)`: `Ω² = 0`, `HH₂ ≠ 0` | holds; the negative control is excluded by smoothness | added (H01) |
| §9.1 step (a), étale base change | `k[x] → k` (not étale) | `k ⊗_{k[x]} HH₁(k[x]) ≅ k`, `HH₁(k) = 0` | the étale hypothesis is needed | Check added |
| §9.1 step (c), localisation | `k[x,x⁻¹]` | `b(x⁻¹⊗x⊗x⁻¹) = 1⊗x⁻¹ − x⁻¹⊗1 + x⁻²⊗x`, `x⁻¹⊗1 = b(x⁻¹⊗1⊗1)`, so `[1⊗x⁻¹] = −[x⁻²⊗x]`, matching `d(x⁻¹) = −x⁻²dx` | holds | Check added |
| §9.1 step (b), local structure | `R = 0` (`s = ∅`); `d = 0` (`R[1/x]` étale over `k`) | zero ring: both sides `0`; `d = 0`: §8.4 with `m = 0` | holds | none |
| `normalized_hkr` (§9.2(4)) | `n = 0`, `n = 1`, `n = 2` over `ℚ[x,y]` | `Φ⁰ = id`; `Φ¹(D) = D`; `[Φ²(∂_x∧∂_y)] = [∂_x∪∂_y] = Ψ₂(∂_x∧∂_y)` | holds | added (H02) |
| §9.2 first Check (H08) | `𝔽₂(u)[x]` over `𝔽₂(u)`, `𝔽₂[x,y]`, `ℂ` | `𝔽₂(u)` is imperfect (`u` is not a square), so HKR62 5.2 does not apply, nor does 5.3 (not a field), nor Ginz05 (characteristic 2) | wording repaired | changed |
| Overview "contains the original one … for regular affine domains" | `k × k` over a perfect `k` | smooth but not a domain, hence not covered by HKR62's affine algebras (HKR62 §2, p. 384) | holds | changed |
| §7.5 itemised *Needs* | definition vs class identity | the definition needs §§1.2, 1.5, 2.2, 7.4; the class identity uses cup with a coboundary, so it needs §5.2 | §5.2 was missing | added |
| H06 scope sentence | `k` a field vs `k = ℤ` | over a field every surjection of vector spaces splits and every `A` is free; over `ℤ`, `ℤ/4 → ℤ/2` is not `ℤ`-split | holds as stated, restricted to fields | added |
| H09 instance identity | `(c • op b) • x` | `x·(c b) = c(x b)` by `mul_smul_comm` | holds | documented |

## Sources

No new source is cited. The added locators use the cached HKR62, Ginz05 and AV20 extractions
(`HKR62` page markers: PDF page `p` = printed page `382 + p`). Nothing was added to
`needs-references.toml`.

## Untrusted text

The review text contained no instructions beyond its mathematical requests; nothing suspicious to
quote.
