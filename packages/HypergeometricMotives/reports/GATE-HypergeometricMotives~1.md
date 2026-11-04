# GATE-HypergeometricMotives~1: answers to the review of `cea276d`

One review (CBirkbeck, 2026-11-02T18:56:51Z) with fifteen findings F01–F15, numbered H01–H15 below in
the order they appear. Repairs are committed on the pull-request branch as `702cd244` and `08f6be1a`
("HypergeometricMotives: review repairs (block-form zigzag heights, missing hypotheses, Greene sign,
Ono, headline-only Lean)"); nothing is pushed.

## H01 (CBirkbeck) — applied

`recordedHeights` collapsed repeated parameters. It is now the block form, in
`TauCetiRoadmap/HypergeometricMotives/Suggested.lean` (Layer 2):
`P.α.map fun a => P.Z (rep a) - 1` → `P.α.toFinset.val.bind fun a => (Multiset.range (P.α.count a)).map fun j => P.Z (rep a) - 1 - j`.
In `README.md`, 2.1 now states the walk with multiplicity and the block form ("the height before
the block of copies of `a` is `Z(rep a) − c`") in place of "`ht (i+1) = Z(L i)`"; 2.2 defines
`recordedHeights` by the block form; 2.3 and the Conventions "Zigzag and Hodge vector" row use the
same multiset, with the witness `A2.2_B1.1` → heights `0, 1`, `w = 1`, `(1, 1)`. Recomputed: the
block form equals the walk on all 1161 cyclotomic data with entries `≤ 10`, at most three entries
in `A` and `d ≤ 6`; on that set the laws of 2.3–2.8 (max/min formula, parity, `δ ≥ 0`, `δ = −m`,
odd weight ⇒ even degree, palindromic Hodge vector, weight 0 ⟺ interlacing) have no failure. The
review's five refuting instances now give `{0,1}`, `{0,1,2,3}`, `{−1,0}`, `{0,0,1,1}`,
`{−2,−1,−1,0,0,1,1,2}`, as stated.

## H02 (CBirkbeck) — applied

`katzSum_shift` now carries `(ht : t ≠ 0)`, and README 4.6 says "for `μ ∈ ZMod 𝔮` and `t ∈ Fˣ`";
the source states the identity for `t ∈ 𝔽_q^×` (`bcm2015` lines 470–472). Recomputed over `𝔽_5`,
`a = {0}`, `b = {2}`, `μ = 1`: at `t = 2` both sides are `−2.2361` (the printed `ω(t)^μ` gives
`+2.2361`); at `t = 0` the right side is `−0.559` and the left side `0`. Both are now README 4.6
Checks.

## H03 (CBirkbeck) — applied

The Hasse–Davenport product relation is now cited to `ClassicalArithmeticCompletion` 7.29 (on main,
`TauCetiRoadmap/ClassicalArithmeticCompletion/README.md`, "### 7.29 The Hasse–Davenport product
relation") in the supplier contract *From TauCetiRoadmap.ClassicalArithmeticCompletion*, in 4.7's
proof and *Needs:* line, in *How to read the build*, and in *Explicit scope exclusions* (old: "No
Hasse–Davenport … (they are `CharacterSumsOverFiniteFields` 3.3–3.4 …)"). `CharacterSumsOverFiniteFields`
3.4 at its open head is the duplication consequence and its own contract names 7.29 for the full
formula (its README lines 145–148, 937); that roadmap is now cited only for Gross–Koblitz and the
`p`-adic Gamma function (6.4, 6.5) under *Not owned here*.

## H04 (CBirkbeck) — applied

Ono's theorem is now stated: `legendreFamily lam : WeierstrassCurve F := ⟨0, -(1 + lam), 0, lam, 0⟩`
and `legendre_point_count`, for `Odd (card F)`, `lam ≠ 0`, `lam ≠ 1`, a generator `ω` and a
primitive `ψ`: `Nat.card (legendreFamily lam).toAffine.Point = q + 1 − (−1)^((q−1)/2) · H_q({𝔮/2, 𝔮/2}, {0, 0} | lam)`.
Recomputed for every `λ ≠ 0, 1` at `p ∈ {5, 7, 11, 13, 17}` with no failure (e.g. `q = 5`, `λ = 2`:
`8 = 6 − (−2)`; `q = 7`, `λ = 3`: `4 = 8 − (−1)·(−4)`, while dropping the sign gives `12`). README
6.1 names both declarations and keeps the identification with `EllipticLegendreCharacterInterfaces`
0.1 in prose; the module docstring's "Ono's theorem 6.1 has no declaration here" is gone.

## H05 (CBirkbeck) — applied

`frobeniusTrace_integral` now carries `(hf : 0 < f)`. At the pin `GaloisField p 0` is `ZMod p` with
prefactor `1`; for `A2.2_B4`, `t = 2`, `p = 3`, `f = 0` the value is `H_3 = −2/3` (recomputed through
the gamma form), and at `f = 1` it is `3 · (−2/3) = −2`. The definition's docstring and README 5.1
say the value at `f = 0` is not `a_1`, with this instance as a Check. `frobeniusTrace_swap`, the
other statement reading `frobeniusTrace … f`, is deleted under H13.

## H06 (CBirkbeck) — applied

`frobeniusPolynomial_int_of_isPure` now carries `(ht : t ≠ 0) (hp : D.IsGood t p)`, and README 5.5
(ii) says so with the reason: at a wild prime the traces are unconstrained `Classical.epsilon`
values, and purity alone does not give integrality (`Λ = {(3 ± 4i)/5}` has rational power sums,
absolute values `1` and non-integral elements). `frobeniusPolynomial_of_isPure`,
`abs_coeff_frobeniusPolynomial_le`, `local_functional_equation` and `local_sign_eq_one_of_odd_weight`
follow from `Λ` alone and are unchanged.

## H07 (CBirkbeck) — applied

`polyDiscriminant` and the definitions built on it (`determinantConstant`, `determinantDiscriminant`)
are deleted from `Suggested.lean`; the README's recipe (Conventions row and 5.8) is written with
Mathlib's `Polynomial.discr` (`Mathlib/RingTheory/Polynomial/Resultant/Basic.lean` line 935, with
`discr_of_degree_eq_two` at line 957), which is listed under *From Mathlib*. The 5.8 Checks compute
`Polynomial.discr (X² + 1) = −4` and `Polynomial.discr (X² + X + 1) = −3`.

## H08 (CBirkbeck) — applied

`qian2021` line 628 states Lemma 3.4 for one representation into `GL_n(ℤ[ζ_N])`, proved by
reference to Beukers–Heckman Theorem 3.5. README 3.4 now attributes the field form to this
roadmap's generalisation of Beukers–Heckman Theorem 3.5 (old: "the field form is Qian Lemma 3.4"),
3.4 (iv) cites Qian only for the order `g_0 g_1 g_∞ = 1` and the companion normal form `BA⁻¹`, and
the *References* entry for Qian says the same.

## H09 (CBirkbeck) — applied

`rrv2022` lines 1171–1175 (arXiv 2109.00027v1) give `h^± = (h^{w/2,w/2} ± (−1)^{w/2} σ)/2`. The
Conventions row "Archimedean shifts" and README 5.7 now say that `σ` is the LMFDB's `sig`
(`h⁺ − h⁻ = σ`) and that Roberts–Rodriguez-Villegas' signature is `σ_RRV = (−1)^{w/2} σ`; a 5.7 Check
computes `h = (2, 6, 2)`, `w = 2`, `σ = 2`: `h⁺ = 4`, `h⁻ = 2` in both conventions once
`σ_RRV = −2`. `archimedeanShifts` is not in the Lean file (H13), so the definition lives in the README
only.

## H10 (CBirkbeck) — applied

`Suggested.lean` line 1: `import Mathlib` → `module` followed by `import Mathlib` (the form already
used by `TauCetiRoadmap/TypeAHeckeAlgebras/Suggested.lean` on main). The build now prints only the
`declaration uses 'sorry'` warnings and no Lake module-system warning; the gate's `imports` and
`no-import-mathlib` checks stay at 0. Committed as `08f6be1a`.

## H11 (CBirkbeck) — applied

`README.md` now has the house sections in order: `## Scope and ownership` (with *Owned here* and
*Not owned here*), `## Conventions` (the former *Pinned conventions* table), `## Exact supplier
contracts` with `### From Mathlib`, `### From Tau Ceti` and one `### From TauCetiRoadmap.<X>` per
supplier, `## How to read the build`, the six layers, `## Downstream consumers` (replacing
*Ordering*) and `## References`. *Prerequisites:* lines are `*Needs:*` lines (61 of them); every
definition has a `**Checks.**` list with a non-example; every layer ends with `### Examples` and
`### Dependencies` (3.6's `bhSignatureDefect` gained its Checks: `α = {1/2}`, `β = {0}` gives `1`;
`A2.2.2.2_B1.1.1.1` gives `0`; `A30_B5.3.2.1` gives `8 = d`); LMFDB knowl and Sage module ids are quoted strings ("hgm.defining_parameters",
"sage.modular.hypergeometric_motive"), not backticked names.

## H12 (CBirkbeck) — applied

`../Chebotarev/README.md` → `../../Completed/Chebotarev/README.md` (supplier contract and 4.4) and
`../PolynomialGaloisGroups/README.md` → `../../Completed/PolynomialGaloisGroups/README.md` (supplier
contract and 5.12). The other relative links resolve on main or name roadmaps earlier in the merge
order (`DeligneWeightsAndPurity`, `EllipticLegendreCharacterInterfaces`, `LFunctions`,
`MotivesAndAlgebraicCycles`).

## H13 (CBirkbeck) — applied

`Suggested.lean` is now the acceptance test: 55 theorems (48 with `sorry`, the rest bridge proofs
the definitions need) and the definitions they read, 966 lines. Deleted: the five non-vacuity
constructors, every acceptance-value theorem (`gammaMultiset_dworkDatum`, `hodgeVector_dworkDatum`,
`frobeniusTrace_*Datum`, `frobeniusPolynomial_dworkDatum`, `tameLocalDegree_tameDatum`), every
boundary or one-tactic statement the review lists (`rep_mem_Ioc`, `rep_zero`, `Z_one`,
`gaussSumPow_zero`, `bezout_transpose`, `bezout_swap`, `isGood_iff`, `swap_swap`, `degree_swap`,
`toParameters_swap`, `coeff_zero_frobeniusPolynomial`, `newtonPolygonFn_zero`, `M_pos`, `gamma_swap`,
`M_swap`, `type_swap`, `hodgeTwist_swap`, …) and the definitions no headline reads (`shift`, `Q`,
`hOne`, `monodromyModL`, `hodgePolygon`, `specialHodgeVector`, `IsBad`, `newtonPolygonFn`,
`IsOrdinary`, `archimedeanShifts`, `tameLocalDegree`, `conductor`, `frobeniusGaloisGroup`, the
discriminant definitions). Kept are the headlines the review lists, plus three it counted as not
statable that are: `exists_invariantForm` (Beukers–Heckman 4.3: a nondegenerate invariant Hermitian
form exists and every invariant Hermitian form is a real multiple of it) and
`signature_invariantForm` (Theorem 4.5/Corollary 4.7, quantified over every nondegenerate invariant
Hermitian `S`, reading `Matrix.IsHermitian.eigenvalues`), and `legendre_point_count` (H04). Each of
these now appears in README 3.5, 3.6 and 6.1. The module docstring is "Hypergeometric motives over
`ℚ`: target signatures" and names the headlines not statable at the pins (Katz's identification
6.4, Fedorov's theorem, the sign `ε_p = (−1)^d χ_Disc(p)`, the card of 5.13, Beukers–Cohen–Mellit
Theorem 1.5) with the missing carrier of each. Also changed: `greeneF_eq_katzSum` (H15),
`cubic_point_count` now states Corollary 1.7 at every `q` coprime to `6` with `H_q` the gamma-form
value `cubicDatum.frobeniusSum F (27 * lam)` (previously only for `3 ∣ q − 1`), and
`frobeniusSum_primitiveData` now carries `ρ ∣ q − 1`, the hypothesis README 4.11 states.

## H14 (CBirkbeck) — applied

`weight_eq_sSup_sub_sInf` now carries `(hd : 0 < P.degree)`; README 2.3 states the identity for
`d > 0` with the empty pair (`0` against `0 − 0 − 1 = −1`) as the reason. With the block form it holds
on all 1161 data above. The same pattern was repaired in 2.8: `weight_eq_zero_iff_interlace` already
carried `0 < degree`, and the README statement now says so.

## H15 (CBirkbeck) — applied

`greeneF_eq_katzSum` no longer has `∃ c, (c = 1 ∨ c = -1) ∧ …`; the factor is
`(ω ^ (∑ j, b j)) (-1)`, i.e. `ω(−1)^{b_1 + ⋯ + b_n}`. README 4.12 says the sign comes from the
factors `B_j(−1)` of Greene's binomial coefficients, `(−1)^{∑ b_j}` for odd `q` and `1` for even
`q`. Recomputed: over `𝔽_5, 𝔽_7, 𝔽_11, 𝔽_13` (`n = 1`) and `𝔽_5, 𝔽_7` (`n = 2`), all disjoint
parameters and every `x ∈ Fˣ` with `S_q ≠ 0`, the ratio is `ω(−1)^{∑ b_j}` in all 22526 cases; the
old README's "`c = −1`" was the odd-`b` case.

## Build

`lake build TauCetiRoadmap.HypergeometricMotives.Suggested`: "Build completed successfully (8954
jobs)", with 47 `declaration uses 'sorry'` warnings and no other warning or error (the Lake
`module` warning is gone, H10).

## Gate

`gate HypergeometricMotives: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL`

The one failure is `depcheck: NOT IN ORDER: HypergeometricMotives (insert it after its last supplier)`:
the roadmap is not in the merge order yet, which the brief treats as the design stage, not a defect.

Dependency check (`gate --depcheck … --movable`):

```
NOT IN ORDER: HypergeometricMotives (insert it after its last supplier)
depcheck: 204 roadmaps, 1600 edges, 1 problem(s)
```

No UPWARD or CYCLE line.

## Signature check

`#check @name` for every declaration of the new `Suggested.lean`, in one scratch file elaborated
once with `lake env lean` (no error). Each elaborated type was compared with its README statement;
the section binders that matter are present: the Levelt theorems carry `hp hq hpd hqd`
(`levelt_rigidity_field`, `levelt_irreducible_field`), every Layer 4 and Layer 6 statement carries
`{F} [Field F] [Fintype F] [DecidableEq F]`, `katzSum_shift` carries `ht`, `frobeniusTrace_integral`
carries `ht hf hp`, `frobeniusPolynomial_int_of_isPure` carries `ht hp`, `frobeniusSum_primitiveData`
carries `hp hρ ht`, `weight_eq_sSup_sub_sInf` carries `hd`. The eight dropped-binder leads of the
earlier transcript belonged to deleted declarations.

## Adversarial pass on changed statements

| Statement | Instances | Values | Result |
|---|---|---|---|
| `recordedHeights` (block form) | `A2.2_B1.1`; `A2.2.2.2_B1.1.1.1`; `A2.2_B4`; `A4.2.2_B3.1.1`; `A6.4.4.3_B12.2.2.2.1`; `A10.6.3.2_B14.1.1.1`; 1161 data | `{0,1}`; `{0..3}`; `{−1,0}`; `{0,0,1,1}`; `{−2,−1,−1,0,0,1,1,2}`; `{−1,0,0,1,1,1,2,2,3}` = walk; 1161/1161 equal | holds |
| `weight_eq_sSup_sub_sInf` | `A2.2_B1.1`; empty pair | `2 − 0 − 1 = 1 = w`; `0` vs `−1` | needs `d > 0`: added |
| `even_weight_iff`, `two_mul_hodgeTwist`, `hodgeTwist_eq_neg_minHeight`, `even_degree_of_odd_weight`, `hodgeNumber_symm`, `weight_eq_zero_iff_interlace` | 1161 data; `A2.2_B1.1` | no failure; `w = 1`, `m_A + m_B = 2`, `δ = 0`; `A2.2_B4`: `δ = 1 = −(−1)`; `A6.4.4.3_B12.2.2.2.1`: `δ = 2 = −(−2)` | holds |
| `katzSum_shift` | `𝔽_5`, `a={0}`, `b={2}`, `μ=1`, `t = 2`, `t = 0` | `−2.2361 = −2.2361`; `0 ≠ −0.559` | `t ≠ 0` added |
| `greeneF_eq_katzSum` | 22526 cases; `b = (3)`, `(1)`, `(2)` | ratio `ω(−1)^{∑b}`; `−1, −1, +1` | holds |
| `legendre_point_count` | `p ∈ {5,7,11,13,17}`, all `λ ≠ 0,1`; `q = 7`, `λ = 3` | 0 failures; `4 = 8 − (−1)(−4)`; without sign `12` | holds; `λ = 1` singular, excluded |
| `cubic_point_count` | `q = 5`, `λ = 1, 2, 4`; `q = 11` all admissible `λ` | `9, 3, 6` = `6 − H_5(· | 27λ)`; all equal | holds at `q ≢ 1 (mod 3)` through the gamma form |
| `frobeniusTrace_integral` | `A2.2_B4`, `t = 2`, `p = 3`, `f = 0, 1`; `A6.4.4.3_B12.2.2.2.1`, `p = 7` | `−2/3`; `−2`; `49 · (−6/49) = −6` | `0 < f` added |
| `frobeniusPolynomial_int_of_isPure` | `Λ = {(3 ± 4i)/5}`; `A2.2_B1.1`, `p = 5` | power sums rational, elements not integral; `Λ = {−1 ± 2i}`, `F_5 = 1 + 2T + 5T² ∈ ℤ[T]` | `t ≠ 0`, good `p` added |
| `local_functional_equation` | `A2.2_B1.1`, `p = 5`, `k = 0, 1, 2` | `5 = 5`, `10 = 10`, `25 = 25` with `ε = 1` | holds |
| `frobeniusSum_primitiveData` | README 4.11 hypotheses | README has `r ∣ q − 1`, Lean had none | `ρ ∣ q − 1` added |
| `signature_invariantForm` | `A2.2_B1.1`; `α = {1/2}`, `β = {0}`; `d = 0` | defect `|−1 + 1| = 0`, signature `(1,1)`; defect `1`, definite; `0 = 0` | holds |
| `exists_invariantForm` | `α = {1/2}`, `β = {0}`; zero matrix | `h_∞ = (−1)`, `h_0 = (1)`, every real `1×1` form invariant; zero excluded by `det ≠ 0` | holds |
| `hypergeometricSum` non-stable pair (README 4.5 Check) | `α = {1/4}`, `β = {0}`, `q = 5` | `0, −1, i, −i` at `t = 1..4` | not rational, as stated |

## Ownership, sources and other notes

- Ownership: the constructions kept are this roadmap's own (hypergeometric data, zigzag, Levelt
  matrices of a datum, finite hypergeometric sums); the Hasse–Davenport relation is consumed from
  `ClassicalArithmeticCompletion` 7.29, the companion matrix from its 2.46/2.60, the Legendre model
  from `EllipticLegendreCharacterInterfaces` 0.1, Gross–Koblitz from `CharacterSumsOverFiniteFields`
  6.4–6.5. No declaration of `Suggested.lean` reuses a fully qualified name of another roadmap.
- Sources read through the sources service this run: `bcm2015` (arXiv 1505.02900v2), `qian2021`
  (arXiv 2104.09761v1), `rrv2022` (arXiv 2109.00027v1). The roadmap folder has no `sources.toml`,
  and this job may edit only `README.md` and `Suggested.lean`, so no manifest entry was written;
  nothing was added to `needs-references.toml`.
- Nothing in the review text was an instruction to act outside the job.
