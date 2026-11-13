# PORT-KloostermanSheavesAndBesselIsocrystals

## Result

- Branch `roadmap/kloosterman-sheaves-and-bessel-isocrystals`, head commit
  `8199100f0d6044099e98e56a2b0edb93c0921478` ("KloostermanSheavesAndBesselIsocrystals: roadmap (README,
  Suggested.lean, metadata)"), on top of `45f58db`. Files: `TauCetiRoadmap/KloostermanSheavesAndBesselIsocrystals/`
  `README.md` (2493 lines, 12 layers, 70 `**Checks.**` blocks), `Suggested.lean` (182 lines), `metadata.toml`
  (`topic = "math.NT"`). Nothing outside the folder changed.
- Build, `lake build TauCetiRoadmap.KloostermanSheavesAndBesselIsocrystals.Suggested`:
  `Build completed successfully (18239 jobs).` Five warnings, all `declaration uses 'sorry'` (lines 68, 135,
  147, 158, 171), nothing else.
- Gate: `gate KloostermanSheavesAndBesselIsocrystals: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0
  sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0
  statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0
  layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check (`gate --depcheck … --movable`), complete output:

  ```
  depcheck: 225 roadmaps, 1998 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or `moved:` line.

## Which text was ported

The board copy `packages/KloostermanSheavesAndBesselIsocrystals/README.md` and its `review.json` are the round-2
state (the first submission after FIX~2; `review.json` is REV~2, needs_changes, 16 findings, 10 blocking). The
reviews REV~3 to REV~7 in `reports/` were made on later heads of the package's fix pull request in the jobs
repository, and the last of them (REV~7) has five P3 findings and nothing blocking. That pull request's head
(`2531294`, FIX~8) applies those five notes. I fetched `README.md`, `Suggested.lean`, `metadata.toml`,
`sources.toml` and the FIX~7, FIX~8 reports at that head read-only (GitHub contents API, no writes) and ported that
text; porting the board copy would have dropped eight rounds of repairs. I checked that REV~7's notes are in it:
the §1.2 product clause for ULA, the four page ranges, §§RD.3.47, RD.5.101, RD.6.4, RD.6.25 in the supplier
contract, the normalized periodic datum with (c) or (c′), and no `IsAdicComplete` binder on
`signed_dwork_congruence`.

## Draft pull request body

This roadmap builds the Kloosterman sheaves of Heinloth, Ngô and Yun for a split reductive group in three
coefficient theories (`ℓ`-adic sheaves, algebraic `D`-modules in characteristic zero and arithmetic `D`-modules
with Frobenius), after proving the geometric Satake equivalence, universal local acyclicity and hyperbolic
localization for the last two. It identifies the de Rham Kloosterman connection with the Frenkel–Gross
connection through the Bessel oper slice and critical-level localization at the two-point level, compares it
with the rigid eigenvalue by relative cohomology over a mixed-characteristic discrete valuation ring (including
the quasi-minuscule middle-image theorem that replaces an incorrect affineness step of Xu–Zhu), and transports
Frobenius to obtain the `H`-valued Bessel F-isocrystal `Be_H†`, the `p`-adic companion of `Kl_H`. From its explicit
shape it derives the Frobenius at zero, generic ordinarity of Newton points for every `H`, the geometric and
arithmetic monodromy of `Be_H†` and `Kl_H` (with the exceptional `SO_{2n+1}` and `G₂` groups at `p = 2`), the
Gross–Reeder simple-wild parameter at `∞` and adjoint rigidity at every prime, and the Heinloth–Ngô–Yun
functoriality conjecture. A 2-adic branch built on a signed refinement of Dwork's congruences and Tsuzuki's
minimal-slope theorem proves `Be_{2n+1}† ≅ Be†_{SO_{2n+1},Std}` at `p = 2`. Tau Ceti wants it because it is the
reductive-group extension of the scalar Kloosterman theory (the rigid Kloosterman F-isocrystal, the `ℓ`-adic
Kloosterman sheaf and their moments are imported from PadicDifferentialEquationsAndRigidCohomology,
CongruenceSpectralGap and KloostermanMomentsAndPotentialAutomorphy), and because
GlobalShtukasAndFunctionFieldLanglandsPartII consumes its eigenobject, Bessel companion and all-prime adjoint
rigidity as the Kloosterman anchor of generic Ramanujan. `Suggested.lean` states what is statable at the pins: the
three exponential-sum identities (Carlitz's `U_n(a) − q = R_{2n+1}(a)` in characteristic two for the trace
character, its Gauss-sum analogue in odd characteristic and the convolution identity in every characteristic), the
everywhere ordinarity of the orthogonal sums on trace functions in `ℂ_p`, and the signed 2-adic Dwork congruence;
its docstring names every other headline and the carrier it lacks.

## Roadmaps this one depends on that are still pull requests

PadicDifferentialEquationsAndRigidCohomology, CongruenceSpectralGap, CharacterSumsOverFiniteFields,
HypergeometricMotives, GlobalShtukasAndFunctionFieldLanglands, BunGAndNewtonStrata, MotivesAndAlgebraicCycles,
FormalConnectionsOpers, SpringerResolutionAndCharacteristicCycles, DeligneWeightsAndPurity. Two suppliers are
board packages earlier in the merge order and not yet roadmap pull requests: KloostermanMomentsAndPotentialAutomorphy
and PadicDifferentialEquationsAndRigidCohomologyPartII. On main: ReductiveGroups, ReductiveGroupsPartII,
AffineLieAlgebras, EtaleCohomologyFoundations, and OrthogonalSpinGroups (under `Completed/`). No citation uses an
id that only an open revision defines.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already satisfied the acceptance-test rule: five headline theorems and the
six simple definitions they need (`dworkBlock`, `kloostermanSum`, `orthogonalSum`, `quadraticCharIn`,
`quadraticHypergeometricSum`, `traceChar`), no sorry'd data, no padding. Changes to the file: a `module` line
before the single `import Mathlib` (without it the toolchain prints a module-system advisory warning, so the build
would not have `sorry` as its only warning; open roadmap pull requests use the same header), the Layer 11 section
title aligned with the README heading, and one docstring sentence: type `A` and `C` ordinarity on trace functions
was described as "supplied by" KloostermanMomentsAndPotentialAutomorphy, but that is a requested supplier gap, so it
now says the README takes it from that roadmap. No headline statable at the pins is missing: the scalar
(type `A`, `C`) trace-function ordinarity belongs to the scalar supplier, and the remaining headlines need
F-isocrystals on curves, `ℓ`-adic local systems, arithmetic `D`-modules, Newton points of `H`-valued Frobenius
classes or differential Galois groups, none of which exists at the pins.

Binder check: I appended `#check @name` for all 11 declarations, and for the 22 Mathlib declarations the README
cites, to the module, built it once and then restored the file. The file has no `variable` block, so no binder
can be lost. Each elaborated type matches its README statement, including `signed_dwork_congruence`'s hypotheses
for any discrete valuation ring of mixed characteristic `(0, 2)` and `orthogonalSum_ordinary`'s `Type`-valued
`F` and `L`. All 22 Mathlib names exist at `1b1ccf4`. Nothing changed as a result.

## Supplier replacements and duplication removals

- PadicDifferentialEquationsAndRigidCohomology maps its former target RD.6.64 to §RD.2.52 (neutral Tannakian
  recognition theorem). The five citations (Tau Ceti contract, RD.6 contract bullet, §6.1 statement and *Needs:*,
  Layer 6 dependencies) now cite §RD.2.52. All other 63 RD ids exist at the supplier's head (`457e49f`).
- PadicDifferentialEquationsAndRigidCohomologyPartII: "MS.4" is now §MS.4.6, *The specified-map theorem on curves*,
  which is exactly the lift of an isomorphism of maximal-slope quotients of irreducible objects (Tsuzuki,
  Theorem 1.3) that §10.6 uses. It is present under that id both on the board copy and at the package's open fix
  head.
- HypergeometricMotives §4.2 (`katzExpSum`) is Katz's exponential sum. Its README treats equal numbers of upper and
  lower characters; its Lean definition is total in both lengths. The trace sum of §9.1 is that sum when `n = m`
  (at `t = a^{−1}`). Scope and ownership now defers equal-length finite hypergeometric sums to it, §9.1 identifies
  its `n = m` case with it, a supplier contract and the Layer 9 dependency were added, and Scope records that
  `quadraticHypergeometricSum` is the case of `N` trivial upper and one quadratic lower character. No restatement
  was deleted: the unequal-length (Kloosterman and Bessel type) sums, which are what §§9.2–11.2 use, are owned
  here.
- `kloostermanSum` stays as the local copy of CongruenceSpectralGap's `hyperKloosterman` (same sum, arguments
  reordered), because `Suggested.lean` cannot import another roadmap's module; Scope already says so.
- No other duplication found. I searched by object on main, at the 218 open heads given and in the board packages:
  the Frenkel–Gross connection, Bessel F-isocrystals, Heinloth–Ngô–Yun sheaves, the arithmetic `D`-module Satake
  equivalence, ULA and hyperbolic localization for arithmetic `D`-modules, Miyatani's hypergeometric modules, simple
  wild parameters, the signed Dwork congruences, the orthogonal sums and the Carlitz identity. The other hits are
  this roadmap's consumer, `ℓ`-adic or v-stack versions of ULA and hyperbolic localization, the Carlitz *module*,
  and an unrelated use of "Dwork congruence". PadicDifferentialEquationsAndRigidCohomology's scope already says
  that the reductive-group extension of its Kloosterman F-isocrystal is this roadmap's.

## Fixes a mathematician would flag (from the reread)

1. **The coefficient ring cannot have residue field `k`.** `K` contains both `π` (`π^{p−1} = −p`) and `c_p` (`c_p² = p`),
   so it contains `π^{(p−1)/2}/c_p`, a square root of `−1`. For `p ≡ 3` mod `4` this generates the unramified
   quadratic extension of `ℚ_p`. At `p = q = 3`, for instance, the residue field is at least `𝔽₉`. The Conventions
   and §0.1 now require only that the residue field be a finite extension of `k`, and §0.1 gains this as a Check
   (with `p = 5` as the contrast). The Layer 3 introduction now notes that its Frobenius-forgetting comparisons use
   `π` but not `c_p`, so they can run over `W(k)[π]` (residue field `k`, since `x^{p−1} + p` is Eisenstein) and then
   extend by coefficient extension.
2. **"Replace `π` by `−π`" is undefined at `p = 2`.** The supplier (§RD.6.46) fixes `π = −2` as the only Dwork
   parameter at `p = 2`, and `−π = 2` fails `π^{p−1} = −p`. The Conventions now restrict the substitution to odd `p`
   and note that at `p = 2` `ψ = ψ^{−1}`, so the comparison keeps `π`. §8.1's identification with §RD.6.95 says the
   same.
3. **The proof route of identity (iii) at `p = 2` covered only the trace character.** The statement and the Lean
   are for every nontrivial character. I added the scaling step: for `ψ(c·)` one has `R_k(a) ↦ R_k(c^k a)` and
   `U_N(a) ↦ U_N(c^{2N} a)`, so both sides move to `c^{2N} a`, whereas the two sides of (i) move by different powers,
   which is why (i) needs the trace character. Checked numerically over `𝔽₄` and `𝔽₈` with `c ≠ 1`.
4. **The Tau Ceti contract said "no … Bessel, isocrystal … declaration exists at the pin".** Tau Ceti has analytic
   Bessel functions (`TauCeti/Analysis/SpecialFunctions/BesselI.lean`), and Mathlib has `Isocrystal`
   (`Mathlib/RingTheory/WittVector/Isocrystal.lean`, Frobenius-semilinear spaces over `K(p, k)`). The sentence now
   says precisely what is absent.
5. **OrthogonalSpinGroups was described as supplying split orthogonal groups, spin groups and central maps.** Its
   Layers 0–1 are groups of points over a field, Mathlib's spin group and the spinor norm. The contract now says so
   and sends the split group schemes `SO_N`, `Sp_{2n}`, `G₂` to ReductiveGroups Layer 9, which is already a supplier.
6. **Downstream consumers.** The bullet "Roadmaps on exponential sums and on `G₂`-monodromy use …" named no
   roadmap, and I found none, so I removed it. The GlobalShtukasAndFunctionFieldLanglandsPartII bullet now lists
   the sections that roadmap actually cites (§§0.2–0.3, 1.4–1.6, 1.8, 4.1–4.2, 6.6, 11.5) and says it uses the
   former labels.
7. Smaller fixes: the Summary wrote the raw sum as `Kl_{2n+1}`, which is the sheaf notation; it now uses `R_{2n+1}`
   and lists all three kinds of end theorem. A §11.1 Check spoke of "the total Lean expression", and Checks may
   not claim Lean counterparts, so it now describes the defining expression.

The former-numbering table (`KB.k` labels) is kept: GlobalShtukasAndFunctionFieldLanglandsPartII cites
`§KB.0 affine-depth`, `§KB.1 eigenobject` and the others, and every label it cites has a row.

## Adversarial pass

Exact computations: sums in `ℤ[ζ_p]` over explicitly built `𝔽_{p^k}`, ordinarity via Newton's identities and
`(1 − ζ)`-adic valuations, Dwork data in `ℚ` with 2-adic valuations. The scripts are in the job's scratch
`tools/`.

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| Coefficients: residue field of `R` is `k` | `p = q = 3`; `p = 5`; `p = 2` | `(π/c₃)² = −3/3 = −1`, `−1` not a square mod 3 ⇒ residue field ⊇ `𝔽₉`; `p = 5`: `2² ≡ −1`, stays in `ℚ₅`; `p = 2`: `ℚ₂(√2)` residue `𝔽₂` | false as stated | Conventions, §0.1, Layer 3 intro; Check added |
| Rank-one dictionary (`ε = −1`) | `q = p`, `θ = exp(π(t − t^p))` | `θ′/θ = π(1 − pt^{p−1})` = requirement for `d − π dt`; for `d + π dt` the requirement `π(pt^{p−1} − 1)` differs by `2π(1 − pt^{p−1})` | sound | none |
| "replace `π` by `−π`" for §RD.6.95 | `p = 2`; `p = 3` | `p = 2`: `π¹ = −2` ⇒ `π = −2`, `(−π)¹ = 2 ≠ −2`; `ψ(1) = −1 = ψ^{−1}(1)`. `p = 3`: `(−π)² = −3` ✓ | undefined at `p = 2` | Conventions, §8.1 |
| Normalized trace witness | `q = 3, a = 1`; `q = 2, a = 1` | `R₂(1) = ζ + ζ² = −1`, trace `1/√3`, `√3 ∉ ℚ₃(√−3)`; `R₂(1) = 1`: `−1/√2` vs `1` vs `−1/2` | sound | none |
| Half twist | `q = 4, d = 2` | `c₄^{−2} = 1/4`, square `1/16 = 4^{−2}` = Frobenius of `(1)` | sound | none |
| §4.3 residue relation | `SL₂`, `C(0) = diag(c^{−1}, c)`, `c² = q` | `N C(0) = c E₁₂`, `q C(0) N = q c^{−1} E₁₂ = c E₁₂` | sound | none |
| §4.4 rank one | `A = −a` | `δC = a(1 − q) C` ⇒ `C = x^{−(q−1)a}` | sound | none |
| `kloostermanSum` | `k = 0, 1, 2, 3` over `𝔽₂`; `k = 0` over `𝔽₃` | `k = 0`: empty tuple, value `[a = 1]`; `𝔽₂`, `a = 1`: `−1, 1, −1` for `k = 1, 2, 3`; same formula as `hyperKloosterman` | sound | none |
| `orthogonalSum` | `𝔽₃`, `n = 1`; `n = 0`; brute force vs elimination, `𝔽₂…𝔽₇`, `n = 1, 2` | `U₁(1) = 1 = R₂(1)²`, `U₁(2) = 4 = R₂(2)²`; `n = 0` gives the `n = 1` expression (`4` at `a = 2`); the two evaluations agree on every instance | sound | Check reworded |
| `quadraticHypergeometricSum`, `quadraticCharIn`, `traceChar` | `b = 0`; `𝔽₃`; `𝔽₄` | `b⁻¹ = 0` ⇒ `ρ(0) = 0` ⇒ sum `0`; `ρ` on `𝔽₃`: `0, 1, −1`; `𝔽₄` traces `0, 0, 1, 1`, character `1, 1, −1, −1` | sound | none |
| (i) `orthogonalSum_sub_card_eq_kloostermanSum` | `𝔽₂, 𝔽₄, 𝔽₈`, `n = 1, 2, 3`, all `a`; controls | `a = 1`: `𝔽₂`: `−1 = −1` (×3); `𝔽₄`: `5 = 5`, `21 = 21`, `85 = 85`; `𝔽₈`: `17 = 17`, `−151 = −151`, `713 = 713`. Control `ψ(ωx)` on `𝔽₄`: `U₁ − 4 = −3` vs `R₃ = 5`. `n = 0` on `𝔽₄`: `5` vs `R₁(1) = 1`. `ψ₀ = 1`: `U − Q = (Q−1)^{2n} − Q ≠ (Q−1)^{2n} = R` | sound; `hψ₀`, `hn` needed | none |
| (ii) `gaussSum_mul_orthogonalSum_sub_card` | `𝔽₃, 𝔽₅, 𝔽₇, 𝔽₉`, `n = 1, 2` (`n = 3` on `𝔽₃`), two characters, all `a` | `𝔽₃`: `g = −1 − 2ζ = −i√3`, `g(U₁ − 3) = 2 + 4ζ = 2i√3 = H₃(4)`; `𝔽₉`: `g = 3`, `48 = 48`; `𝔽₅`: `−6 + 3ζ² + 3ζ³` both sides. Without `hF`, `𝔽₂`: `g = −1`, `H(0) = 0`, LHS `1 ≠ 0` | sound; `hF` needed | none |
| (iii) `orthogonalSum_sub_card_eq_convolution` | all seven fields, `N = 2, 3`, two characters, all `a`; `N = 1` | `𝔽₇`, `N = 3`: `−496 = −496`; `𝔽₅`, `N = 3`: `−14 + 35ζ² + 35ζ³` both sides; `𝔽₄`, `c ≠ 1`, `N = 2`: `−11 = −11`. `N = 1`: both sides `R₂(a)² − Q` (tautology) | sound; route at `p = 2` incomplete | route completed; `hN` kept (P3 note below) |
| identities, total | — | 305 instances (controls excluded from the failure count), 0 failures | sound | none |
| `orthogonalSum_ordinary` | `𝔽₂` (`n = 1, 2`), `𝔽₄` (`a = 1, ω`), `𝔽₃` (`n = 1, 2`; `a = 1, 2`), `𝔽₉`, `𝔽₅` (`a = 1, 2`), `𝔽₇` (`a = 3`) | `𝔽₂, n = 1`: power sums `−1, 5, 17`, coefficient valuations `0, 0, 1, 3`, slopes `0, 1, 2`; `𝔽₂, n = 2`: `−1, 21, −151, 657, 2049`, slopes `0…4`; `𝔽₄`, `𝔽₉`: slopes `0, 2, 4` = `i·v(|F|)`; all 11 match | sound | none |
| `signed_dwork_congruence` | `R = ℤ_(2)` (not complete), `K = ℚ`: `F`, `G`, alternating pair at `r = 3, 5`; `s ≤ 3`, `m ≤ 2`, `N ≤ 40`; control `F` with `u ≡ 1` | hypotheses: 0 violations (`i < 4`, `n < 6`, `s, m < 4`); conclusion: 360/358 nonzero coefficients, 0 violations; least valuation `0` for `F` (one failure with `2^{s+1}`), `1` for `G`; control violates (c) 48 times | sound; `2^s` sharp | none |
| §8.5 boundary constant | direct chart counts: `n = 3` over `𝔽₂, 𝔽₄, 𝔽₃`; `n = 4` over `𝔽₂, 𝔽₃` | chart sums `3`; `37, 5, 5`; `13, 4`; `7`; `13, 40` = `S_n + Q^{n−1} − Q`; printed `(Q−1)Q^{n−2}` gives `5`; `7, 34` at `n = 4` | sound; source misprint confirmed | none |
| §8.3, §9.4, §11.5 Checks | `𝔽₂`, `n = 3`; `𝔽₃`, `n = 2`; `𝔽₂`, `n = 2` | `T_{SO₈} = 7/8`, `T_{SO₇} = −1/8`; `U₂(1) = 7`, `T_{SO₅} = 4/9`; `T_{SO₃} = −1/2`, `K₂ = −1/√2`, unshifted `1/4` vs `T_{SO₅} = −1/4` | sound | none |
| §11.2 difference of toric sums | general | `#{z : z² = w} = 1 + ρ(w)` ⇒ `S(f₂) − S(f₁) = Σ ρ(w) ψ(Σx − w + aw/∏x) = H_{2n+1}(a)` | sound | none |
| §6.5 negative control | `𝔽₅((t))`, `u⁴ = t`, `z⁵ − z = u^{−2}` | `v(uz²) = 1`, `v(u(2z + 1)) = 3` ⇒ `D₁ = D₂ = C₅`; break `2·5/20 = 1/2`; `b(Ad) = 2(1/4 + 1/4) = 1` | sound | none |
| §6.3 bound, §10.1 Check | `G₂`; `r = 3` | `14/6 < 3`; `B(4)/B(2) = (2¹²/24³)/(2⁶/2³) = 1/27 ≡ −1 (mod 4)` | sound | none |
| Supplier ids | 64 RD ids, MS.4, KM §§1.1–2.6, CS, CSG, GS, Springer, DWP, BunG, Motives, main roadmaps | RD.6.64 → RD.2.52 at the supplier; the rest present | one remapped id | citations updated |
| Pin claims | Tau Ceti `2fd255d`, Mathlib `1b1ccf4` | four Tau Ceti declarations present with the stated content; `BesselI.lean` and `WittVector/Isocrystal.lean` exist; no Kloosterman or Hasse–Davenport | one inaccurate absence claim | reworded |

P3 note: `hN : 2 ≤ N` in `orthogonalSum_sub_card_eq_convolution` is not needed for truth (at `N = 1` both sides are
`R₂(a)² − |F|`), but the proof route (§9.4, which needs a positive-rank `Be†_{2N−2}`) uses it. Kept.

## Unresolved

- The eleven supplier gaps stand as the package states them: scalar-kloosterman-ordinarity
  (KloostermanMomentsAndPotentialAutomorphy); relative-level-geometry and cuspidal-newton-bound
  (GlobalShtukasAndFunctionFieldLanglands); principal-sl2-subgroups (ReductiveGroups); critical-center-rational-forms
  (AffineLieAlgebras); arithmetic-d-module-operations, dense-convergence-detection, formal-slope-comparison,
  companion-monodromy, toric-exponential-sum-hodge-bound and toric-exponential-sum-ordinarity
  (PadicDifferentialEquationsAndRigidCohomology). I grepped each supplier at its current head and found none of
  them filled. For principal-sl2-subgroups, FormalConnectionsOpers F4 constructs the principal `sl₂` and the
  exponents, but not the classification of subgroups containing it or the inner-automorphism theorem, so the gap
  stays with ReductiveGroups.
- `roadmaps resolve` reports one lead, "KloostermanMomentsAndPotentialAutomorphy §2.6 found nowhere". It is a
  false positive: that roadmap is a board package (merge order 312, before this roadmap's 369) with
  `### 2.6 The Bessel connection dictionary`, both in the board copy and at its open fix head. The same holds for
  PadicDifferentialEquationsAndRigidCohomologyPartII §MS.4.6.
- PotentialAutomorphyDworkMotivesPartII (board package) lists this roadmap as a consumer of its §§3.1–3.3 hypergeometric
  sheaves. This roadmap does not cite them: those are `ℓ`-adic sheaves of type `(n, n)`, and §9 here builds
  `p`-adic (Miyatani) hypergeometric objects, mostly of type `n > m`. That consumer line is that roadmap's to correct.
- The board copy of this package and its `review.json` are stale relative to the text ported here (see "Which
  text was ported"); the worker may want to sync the board.
- Ownership against open pull requests was checked against the 218 heads the brief lists, through
  `roadmaps grep`, and against the board packages.
- No text read during the job contained an instruction to change how I work. The board index file suggests
  `gh api` reads; I used only read-only GitHub API reads, to fetch the reviewed package head, the fix heads of the
  two board-package suppliers and one pull-request description for style.


Pull request: #2289 (roadmap/kloosterman-sheaves-and-bessel-isocrystals at 8199100)
