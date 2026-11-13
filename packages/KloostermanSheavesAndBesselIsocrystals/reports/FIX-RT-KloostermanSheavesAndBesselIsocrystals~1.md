# FIX-RT-KloostermanSheavesAndBesselIsocrystals~1

Repair of red-team round 1 (passes a and b). Fifteen findings: thirteen applied (two of them differently),
one disputed, none not actionable.

## RT-KloostermanSheavesAndBesselIsocrystals~1a/F01 (P1) — applied

§1.3: "equivalent to the category of `σ`-semilinear representations of `H(L) ⋊ ℤ`" → the full subcategory
whose restriction to `H(L)` is algebraic (XZ Proposition 3.6.5(ii), Theorem 3.6.7(ii), XZ lines 1650–1656,
1688–1693), with `σ = id_L`; Rep(H) is the direct sums of weight-zero `IC_μ` (XZ §3.6.8, (3.6.8.1)). New Check:
the valuation character of `𝔾_m(L)` is excluded.

## RT-KloostermanSheavesAndBesselIsocrystals~1a/F02 (P2) — applied

§1.3: "both equivalences are compatible ... on characteristic polynomials" → the arithmetic equivalence is
compared on Frobenius characteristic polynomials of normalized `IC_μ` stalk cohomology, the de Rham one on
graded dimensions only. New Check (PGL₂, minuscule `μ`: one-dimensional stalk in degree `−1`, Frobenius `c_q^{−1}`
in the arithmetic and ℓ-adic theories, none in de Rham). No other passage attaches Frobenius to a de Rham object.

## RT-KloostermanSheavesAndBesselIsocrystals~1a/F03 (P2) — applied

§2.2: "match when `P_h(λφ) = λ^h P_h(φ)` equals `P̌_h(N + xE)`" → `φ` matches `E` when `P_h(φ) = P̌_h(N + xE)`; then
`λφ` matches `N + λ^h xE`, since `P̌_h(N + cxE) = c P̌_h(N + xE)` (conjugation by `ρ(t)`, `t^h = c`). Locator adds XZ
(4.4.1.1)–(4.4.1.2) (XZ lines 2229–2233, 2296–2299). New A₁ Check at `λ = 2`: `4 = 4`, versus `4 = 1`.

## RT-KloostermanSheavesAndBesselIsocrystals~1a/F04 (P1) — applied

Conventions and §0.1: `R` (residue field `k`, contains `π`, e.g. `W(k)[π]`, fraction field `K₀`) now differs from the
coefficient field `K ⊇ K₀` containing `c_p`, whose residue field may exceed `k` (XZ §2.3.1, line 626; §3.6.8, line 1695).
Layer 3 is constructed over `R`, `K₀` and then extended to `K`. New Check `p = q = 3`: `K = ℚ₃(√−3, i)`, residue field `𝔽₉`.

## RT-KloostermanSheavesAndBesselIsocrystals~1a/F05 (P2) — applied differently

Conventions and §8.1: "replace `π` by `−π`" → `−π` for odd `p`; at `p = 2` keep `π = −2`. The suggested repair through
a Taylor isomorphism for `x ↦ −x` is not a Frobenius-lift comparison; instead `L_π ≅ E_{−π}` by multiplication by
`exp(2πt) = exp(−4t)` (radius `2`, value `1` at `0`, intertwines both multipliers). New §8.1 Check.

## RT-KloostermanSheavesAndBesselIsocrystals~1a/F06 (P2) — disputed

§11.2 is not a headline. It is Xu–Zhu Lemma 5.4.3, stated inside the proof of Theorem 5.4.2(ii) (XZ lines 2945–2951);
its statement concerns only the explicit Laurent polynomial `f_d`, none of the roadmap's objects; its proof uses
nothing the roadmap builds, only gap:toric-exponential-sum-hodge-bound, gap:toric-exponential-sum-ordinarity and a
lattice-point count. The README Summary names the end theorems as the exponential-sum identities and the
ordinarity of the orthogonal Frobenius eigenvalues; the latter, the consequence of §11.2 for the roadmap's objects,
is already stated as `orthogonalSum_ordinary`. Adding `toricSum` would be an intermediate lemma in the acceptance
test, which the Suggested.lean rules exclude. The README keeps §11.2 as an owned target with its Checks.

## RT-KloostermanSheavesAndBesselIsocrystals~1a/F07 (P2) — applied

Scope, a new "From TauCetiRoadmap.HypergeometricMotives" contract, §9.1 text and *Needs*, Layer 9 Dependencies:
for `n = m` the trace sum is `katzExpSum` of HypergeometricMotives §4.2 with `t = a^{−1}`, characters lifted by norm,
`ψ ∘ Tr`; unequal lengths stay here. New Check: over `𝔽₅`, `a = 2`, `t = a^{−1}` gives `√5 = H`, `t = a` gives `−√5`.

## RT-KloostermanSheavesAndBesselIsocrystals~1a/F08 (P3) — applied

§6.1 Check: the `Std ⊗ Std` of `SL₂` control → `H = SO₈` with monodromy `G₂`: `Std₈|G₂ = Std₇ ⊕ 1`, the generated
category has a nontrivial rank-7 object, the literal image of `Rep(SO₈)` none (nontrivial constituents have
dimension `≥ 8`). The old example is recorded as an empty test (`Sym² ⊕ 1` already splits in `Rep(SL₂)`).

## RT-KloostermanSheavesAndBesselIsocrystals~1a/F09 (P3) — applied

Layer 0 Examples: "For `G = 𝔾_m` all level data are trivial" → `V = 0`, `Ω = ℤ`, `Bun_G(0,2)` one point with trivial
automorphisms per degree, `Bun_G(1,2)` a copy of `𝔾_m` per degree, matching `T̃ × V = T̃`; with trivial tame
character the eigenvalue is constant.

## RT-KloostermanSheavesAndBesselIsocrystals~1a/F10 (P3) — applied

From Tau Ceti: "No Kloosterman, Bessel, isocrystal or Hecke-eigensheaf declaration exists" → neither pin has a
Kloosterman sum, F-isocrystal on a curve, Bessel F-isocrystal or Hecke eigensheaf; Tau Ceti's `Real.besselI`
(BesselI.lean:81), Mathlib's `Complex.besselJ` and `WittVector.Isocrystal` are named and distinguished. Both
library names were checked at the pins.

## RT-KloostermanSheavesAndBesselIsocrystals~1a/F11 (P1) — applied

§6.3: "the finite solvable subgroups of `PGL₂`" now has an owner: lift to `SL₂(K̄)`, embed the field of entries
into `ℂ`, apply McKaySkewGroup §0.2 (on main): cyclic, dihedral, `A₄`, `S₄`, `A₅`; finite `p`-subgroups cyclic
unless `p = 2`. New contract, scope line, *Needs* (with §RD.6.51), Layer 6 Dependencies; Check: `SL(2,𝔽₃) → A₄ ⊃ V₄`.

## RT-KloostermanSheavesAndBesselIsocrystals~1a/F12 (P1) — applied

§7.5: "semisimple Chebotarev" → ArithmeticGaloisRepresentations §5.13 recognition (ℓ ≠ p, geometric Frobenius),
with semisimplicity proved: pure ⇒ geometrically semisimple; no geometric adjoint invariants, via the `L`-function
shared with `Be†_{H,Lie H}` (`H²_c = 0`); so arithmetic monodromy is reductive. New contract, *Needs*, Layer 7
Dependencies; unipotent countermodel Check.

## RT-KloostermanSheavesAndBesselIsocrystals~1a/F13 (P1) — applied

New gap:log-newton-semicontinuity (supplier PadicDifferentialEquationsAndRigidCohomology, §§RD.3.43, RD.5.101):
semicontinuity including specialization to the log boundary, and the log slope filtration on a constant-polygon
open (XZ lines 2936–2940, 3030). Added to plan.json `gaps`, the contracts, the scope list, §5.3 and §10.5 *Needs*,
Layers 5 and 10 Dependencies; §5.3 Check with residue `E₁₂`.

## RT-KloostermanSheavesAndBesselIsocrystals~1b/F01 (P3) — applied

`orthogonalSum_sub_card_eq_convolution` deleted from Suggested.lean, along with its README name. §11.1(iii) is now
for `N ≥ 1` with the elementary route (substitution `u = a/∏y`, `Σ_v R_{2N−2}(v) = 1`), which also reduces (i) and (ii)
to `n = 1`. §11.5 no longer lists (iii). Module docstring updated. Checked numerically over `𝔽₃`, `𝔽₅`, `𝔽₇`, `N = 1, 2`.

## RT-KloostermanSheavesAndBesselIsocrystals~1b/F02 (P2) — applied

§6.4: "contradicting Swan `1`" now proved in place: gap:formal-slope-comparison bounds irregularity by
`(2n+1)·1/(2n+1) = 1`; irregularity = Swan (§RD.6.52); nonzero by §6.2. No use of §8.1, so the
§6.4 → §8.1 → §7.4 → §6.4 cycle is gone. *Needs* gains the gap and §§RD.1.17–RD.1.19, RD.6.52; `SL₃` Check added.

## Checks run

- **Elaboration.** `lake env lean packages/KloostermanSheavesAndBesselIsocrystals/Suggested.lean` (from the content
  checkout): no errors; four `declaration uses 'sorry'` warnings (lines 66, 133, 145, 158), one per theorem. No
  `TauCeti.*` import, so nothing was built.
- **Signatures.** A scratch file with `#check @name` for all ten declarations (six definitions, four theorems) was
  elaborated once. Every elaborated type matches its README statement; there are no section `variable`s, so no
  binder can be lost. The only change is the deletion of `orthogonalSum_sub_card_eq_convolution`.
- **Dependency check** (`gate --depcheck ... --movable`): `depcheck: 239 roadmaps, 2177 edges, 0 problem(s)`. No
  UPWARD, CYCLE or `moved:` line.
- **Citation resolver** (`roadmaps resolve`): the only lead is the known false positive "KloostermanMomentsAndPotentialAutomorphy
  §2.6: no roadmap ... on main or in an open pull request"; that roadmap is a board package (merge order 310)
  whose README has §2.6 (*The Bessel connection dictionary*), §1.1 and §1.3. No Lean name is found nowhere.
- **Numerical checks** (exact characters over `ℂ`): identity (iii) for `N = 1, 2` over `𝔽₃`, `𝔽₅`, `𝔽₇`, all `a`; the
  §9.1 `𝔽₅` Check (`H(2) = √5`, `katzExpSum` at `t = 3` is `√5`, at `t = 2` is `−√5`).

## Adversarial pass on the new and changed statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions/§0.1 coefficient split | `p = q = 3`; `p = 5`; `p = 2` | `(π/c₃)² = −1`, `2` not a square in `𝔽₃` ⇒ residue `𝔽₉`; at `p = 5` `±i ∈ ℚ₅`; at `p = 2` `π = −2 ∈ ℚ₂`, `ℚ₂(√2)` residue `𝔽₂` | old datum empty at `p ≡ 3 (4)`, `s` odd; new one exists for all `p, s` | applied |
| `R = W(k)[π]` residue field | `x^{p−1} + p` Eisenstein | `v(π) = 1/(p−1)`, `e = p − 1`, `f = 1` | residue `k` | stated |
| Rank-one dictionary `p = 2` | `π = −2`, `q = 2^s` | `g′ = 2πg` ⇒ `g = exp(−4t)`; radius: `v(4t) > 1` ⇔ `|t| < 2`; multipliers: both exponents `πt^q + πt`; odd `p`: `v(2π) = 1/(p−1)`, radius `1` open | `L_π ≅ E_{−π}` only at `p = 2` | applied |
| §1.3 algebraicity | `H = 𝔾_m`, `t ↦ ϖ^{v(t)}` vs `t ↦ t^m` | units ↦ `1`, `ϖ ↦ ϖ`; `t^m = 1` on `1 + ϖ` forces `m = 0`, then `ϖ ↦ 1 ≠ ϖ` | excluded | Check added |
| §1.3 de Rham compatibility | PGL₂ minuscule | `Gr_μ ≅ ℙ¹`, stalk dim `1` in degree `−1`; arithmetic/ℓ-adic Frobenius `c_q^{−1}` | dimension-only for de Rham | applied |
| §2.2 matching | A₁, `λ = 2`; SL₂ × SL₃ | `P₂(2φ) = 4`, `P̌₂(N + 4xE) = 4`, `P̌₂(N + xE) = 1`; scales `4, 8` | consistent with §2.7 `Be_H(λ)` | applied |
| §0 torus example | `G = 𝔾_m` | `Aut` of marked line bundle `1`, unmarked `𝔾_m`; `(𝔾_m × 𝔾_m)/𝔾_m ≅ 𝔾_m` per degree; `Ω = ℤ` | matches §0.3 big cells | applied |
| §6.1 Check | `SO₈ ⊃ G₂`; `SL₂` | ranks `7 + 1`; min nontrivial `SO₈` rep `8`; `Std ⊗ Std = 3 + 1` in both models | SO₈ discriminates, SL₂ does not | applied |
| §6.3 finite subgroups | inverse images; Sylow subgroups | `24 → 12` (`A₄`), `48 → 24` (`S₄`), `120 → 60` (`A₅`), `4n → 2n`; Sylow-3 of `A₄, S₄, A₅` = `C₃`, Sylow-5 of `A₅` = `C₅`; odd subgroups of `D_n` cyclic | noncyclic `p`-subgroups only at `p = 2` | applied |
| §6.4 Swan 1 | `SL₃`, `p` odd; `SL_{2n+1}` | bound `3·(1/3) = 1`; integer, `> 0` by §6.2; a descended object would give even `0` or `≥ 2` | no use of §8.1 | applied |
| §7.5 semisimplicity | rank-2 unipotent on a point; `H` almost simple | unipotent: polys `(1−T)²` both, adjoint geometric invariants `4`; Kloosterman: `(Lie H)^{G_geo} = 0` (Kostant, exponents `≥ 1`) ⇒ `H²_c = 0`, `L` polynomial ⇒ ℓ-adic `H²_c = 0` (weights `2` vs `≤ 1`) | `R_u(G_arith)` trivial | applied |
| gap:log-newton-semicontinuity | SL₂ standard at `0` | residue `E₁₂ ≠ 0`; fibre slopes `(−1/2, 1/2)`; generic polygon on or below that (semicontinuity) and on or above `ρ` (§5.2) ⇒ `(−1/2, 1/2)` | §RD.3.43 alone does not reach `0` | gap added |
| §9.1 `n = m` identification | `𝔽₃`, `a = 2`; `𝔽₅`, `a = 2` | `𝔽₃`: both `i√3` (`a = a^{−1}`); `𝔽₅`: `H = ρ(a−1)√5 = √5`, `t = 3`: `ρ(3)ρ(3)√5 = √5`, `t = 2`: `ρ(2)ρ(4)√5 = −√5` (computed) | `t = a^{−1}` forced | applied |
| §11.1(iii) | `N = 1` (`R₀ = [v = 1]`), `N = 2`; `𝔽₂, 𝔽₃, 𝔽₅, 𝔽₇` | `𝔽₂`, `N = 1`: `1 − 2 = (1 − 2)·1`; `Σ_v R_{2N−2}(v) = (−1)^{2N−2} = 1`; numerical check over `𝔽₃, 𝔽₅, 𝔽₇` passes | true for `N ≥ 1`, every nontrivial `ψ`, every field | applied; Lean deleted |
| Reduction of (i), (ii) to `n = 1` | convolution of raw sums | `R_j ⋆ R_k = R_{j+k}`; `H₃(4u) ⋆ R_{2n−2} = H_{2n+1}(4a)` (variables `3 + (2n−2)`) | consistent with §11.1 | stated |

## Ownership and suppliers

- McKaySkewGroup is on main (merge order 315); its §0.2 states the classification at `SL₂(ℂ)`. This roadmap owns only
  the transport to `PGL₂(K̄)` inside §6.3.
- ArithmeticGaloisRepresentations (open new roadmap, merge order 59) §5.13 *Recognition* at its current head:
  continuous representations of `G_{K_C,C}`, equal polynomials at the closed points of `U`, conclusion on
  semisimplifications, and isomorphism when semisimple.
- HypergeometricMotives (open new roadmap, merge order 103) §4.2 defines `katzExpSum` (Suggested.lean line 650),
  for equal lengths in its README; only the identification for `n = m` is consumed.
- gap:log-newton-semicontinuity is assigned to PadicDifferentialEquationsAndRigidCohomology (open, merge order 121),
  which owns §RD.3.43 (convergent semicontinuity only) and §RD.5.101 (log-isocrystals, no semicontinuity) at its head.
- All four suppliers precede this roadmap (366); the depcheck confirms this. Ownership against open pull requests:
  searched by object with `roadmaps grep` and the supplied checkouts (the finite `SL₂` classification, recognition
  by Frobenius polynomials, Katz's exponential sum, log Newton semicontinuity, Gaitsgory's central sheaves); no
  other owner found.

## For the maintainer

- The open pull request of this same roadmap on the content repository already carries independent repairs of F04,
  F05, F07 and F10. The board text now makes the same mathematical corrections in compatible form (F04 here also
  separates `R` from the coefficient field, as Xu–Zhu §2.3.1 does). That text also cites §RD.2.52 and §MS.4.6
  where this one cites §RD.6.64 (mapped by its owner to §RD.2.52) and MS.4; no finding asked for those changes.
  The two texts should be reconciled when the package is exported.
- No name that other roadmaps cite was renamed. One Lean declaration was deleted:
  `orthogonalSum_sub_card_eq_convolution`. A search of main, the open heads and the board packages found no
  citation of it.
  GlobalShtukasAndFunctionFieldLanglandsPartII cites the old `KB.k` labels, which the mapping table still covers.
- GlobalShtukasAndFunctionFieldLanglandsPartII §4.0 imports from §KB.1 (*eigenobject*) the principal unipotent
  monodromy of the ℓ-adic `Kl_H` at `0` (HNY Theorem 1(2)). §1.6 here does not state it; its proof needs
  Gaitsgory's central sheaves over a finite field, and a search of main and the open heads found no owner (only
  a mixed-characteristic variant in GeometricSatakeAndFusionPartII). The §7.5 repair avoids this input. The
  consumer may need another source for it.
- No `needs-references.toml` request: every source used is in the cache or settled.
