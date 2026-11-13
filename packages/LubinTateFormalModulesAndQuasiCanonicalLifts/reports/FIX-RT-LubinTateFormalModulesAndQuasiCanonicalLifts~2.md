# FIX-RT-LubinTateFormalModulesAndQuasiCanonicalLifts~2

Two red-team reviews (2a, 2b) of the head `281d0dd`; nine findings, none overlapping. Every finding
was checked against the sources, the supplier text at its open head and the pinned libraries before
any edit. Files changed: `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md`,
`packages/LubinTateFormalModulesAndQuasiCanonicalLifts/Suggested.lean`,
`packages/LubinTateFormalModulesAndQuasiCanonicalLifts/sources.toml`. No `gaps` entry was needed.

## RT-LubinTateFormalModulesAndQuasiCanonicalLifts~2a/F01 (P2) — applied

Verified: EndoscopicTransferAndUnitaryTraceComparison §10.2 (open head) takes every `β` in
`GL_n(O_r)diag(ϖ,1,…,1)GL_n(O_r)`, its Checks treat connected height `k < n`, and it claims
`R_β ≅ O_r[[T₁,…,T_(n−1)]]` for all of them. Scope, contract and §3.6 now restrict the comparison
to connected `H_β`, via `BarsottiTate.equivFormalLieGroup` (§R07.1.13, added to *Needs*). New Check:
`β = diag(ϖ,1)` gives one parameter against `O_r`.

## RT-LubinTateFormalModulesAndQuasiCanonicalLifts~2a/F02 (P2) — applied

Witness verified: over unramified quadratic `K/ℚ₃`, `m = 2`, both `3^ℤexp(9O_K)` and
`3^ℤexp(27ℤ₃⊕3ℤ₃α)` contain `3` and have index `72`. §2.5 route reordered: uniformizers are norms;
the `K̂^ur` comparison gives the unit formula; the kernel is `π^ℤU(K,m)`; then
`localArtinMap_eq_zero_iff`. The witness is now a Check.

## RT-LubinTateFormalModulesAndQuasiCanonicalLifts~2a/F03 (P3) — applied differently

§3.3 Checks, keeping `I = 0`: (A) coboundary `(1+ε)X` over `𝔽₂[ε]`, `Δ = εXY`,
`δ₂ = εX²`; (B) `y²+txy+y=x³`, where I computed `[2] ≡ tz²+z⁴+… mod 2`. The proposed third
Check (`[2]+εX` over `ℤ₂`) also breaks additivity. It is replaced by the ramified `ℚ₂(√2)` example
`δ_π = εX`, which isolates the tangent condition.

## RT-LubinTateFormalModulesAndQuasiCanonicalLifts~2b/F01 (P3) — applied differently

The pinned declarations were confirmed (`Naturality.lean` lines 62, 88, 181; `Height/Basic.lean`
lines 200, 316). The §0.1 API bullet was deleted, not restated, because library results belong in
Scope. Scope, both contracts, the `LT.0/formal-log` row, §0.3, the §§0.1, 0.3, 4.1, 4.3 *Needs*
and §4.3 (`coeff_one_injective`) now cite Tau Ceti.

## RT-LubinTateFormalModulesAndQuasiCanonicalLifts~2b/F02 (P3) — applied

Verified: Y95 Proposition 4 (lines 305–310) is a four-way equivalence. G86 gives the dichotomy
(lines 198–201) and Proposition 5.3(2) gives only the quotient (lines 205–209). The §6.4 locator
now cites G86 p.325 for exactly these, in the README's notation. Y95 is dropped there, and `"6.4"`
is removed from Y95's `cited_for`.

## RT-LubinTateFormalModulesAndQuasiCanonicalLifts~2b/F03 (P3) — applied

In §5.3, the Check "The zero map corresponds to `a = 0`" became a Check on the direction of the
inclusion. For `L₁ = T`, `L₂ = p⁻¹T` the set is `p⁻¹ℤ_p ∋ 1` (the quotient isogeny `g_(L₂)`). With
the inclusion reversed it would be `pℤ_p ∌ 1`. The element `a = p⁻¹` is the isomorphism induced by
`[p]`.

## RT-LubinTateFormalModulesAndQuasiCanonicalLifts~2b/F04 (P3) — applied

In the `finrank_adjoin_primitive_lubinTate_root` docstring, "Primitive-root presentation of the
supplied Lubin–Tate fields … compared with RelativeFarguesFontaine §2.5" became "Degree and
splitting of the Lubin–Tate division fields (LT65, Theorem 2, pp.383–384; README §2.3)". The rest
of the docstring is unchanged.

## RT-LubinTateFormalModulesAndQuasiCanonicalLifts~2b/F05 (P3) — applied

Verified: `TauCeti.ClassFieldTheory.artinMap` is stated for `K : Type` (`ArtinMap.lean:106`). The
section `variable {K : Type} …` is deleted. The degree theorem now carries `{K : Type*}` and the
five instances. The norm-group theorem carries `{K : Type}` and the same instances, with a docstring
sentence giving the reason. The From Tau Ceti contract records the universe of `artinMap`.

## RT-LubinTateFormalModulesAndQuasiCanonicalLifts~2b/F06 (P3) — applied differently

Verified: BKO21 line 516 (§4, p.954) defines `Θ_n` and `Ψ_n`; formal point sums are
Definition 5.4 and Theorem 5.5(ii) (p.959). §9.1 follows the review. §8.3 cites §4 p.954 and §2
pp.947–948 but omits the proposed "§5.0.2 for `Ψ_s ⊂ Ψ′_(s+1)`", which §8.3 never states. The
BKO21 locator in `sources.toml` is updated.

## Checks run

- **Elaboration.** `lake env lean packages/LubinTateFormalModulesAndQuasiCanonicalLifts/Suggested.lean`
  ran from the content checkout and exited `0`. The only output was seven `declaration uses 'sorry'`
  warnings, at lines 86, 104, 135, 153, 176, 196 and 221.
- **Signatures.** I put `#check @name` for all nine declarations in one scratch file, elaborated it
  once, and compared each elaborated type with its README statement.
  - `finrank_adjoin_primitive_lubinTate_root` is now `∀ {K : Type u_1} [Field K] [ValuativeRel K]
    [TopologicalSpace K] [IsNonarchimedeanLocalField K] [CharZero K] …`.
  - `artinMap_fixes_lubinTate_roots_iff` is `∀ {K : Type} …` with the same five instances.
  - The other seven types are unchanged from the supplied listing, and no binder was lost.
- **Dependency check.** Exact output:

  ```text
  depcheck: 239 roadmaps, 2176 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line. All suppliers named are earlier in the merge order
  or on main. The only new supplier edge is §3.6 → FiniteFlatGroupsAndIntegralPadicHodgeTheory
  §R07.1.13, which was already a supplier of Layer 3.
- **Citations.** `roadmaps resolve` on the README reports no cross-roadmap citation and no Lean name
  found nowhere. Every Tau Ceti name I introduced was opened at the pin `2fd255d`:
  - `TauCeti.FormalGroupHom.subst_log`, `TauCeti.FormalGroupHom.coeff_one_injective` and
    `FormalGroup.subst_zsmulSeries_log` (`Logarithm/Naturality.lean`);
  - `FormalGroup.height` and `TauCeti.FormalGroupHom.height_eq` (`Height/Basic.lean`);
  - `FormalGroup.exp` and `FormalGroup.subst_toPowerSeries_log` (`Logarithm/Basic.lean`);
  - `TauCeti.ClassFieldTheory.localArtinMap_eq_zero_iff` (`ClassFieldTheory/Local/Reciprocity.lean:139`).
- **Ownership.** No new construction was added. The connected comparison and the norm-group route
  stay owned here. The supplier §10.2 was read at its open head.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §3.6 comparison with supplier §10.2 | `n=1`; `n=2` with `β` of slopes `1/2,1/2`; `n=2`, `β=diag(ϖ,1)`; `n=3`, `β=diag(ϖ,1,1)` | supplier params `0,1,1,2`; params of the formal completion `0,1,0,0` | agrees only for connected `H_β`; restriction added |
| §2.5 route, step 1 | `ℚ_p`, `ζ_(p^m)−1`; `p=2`, `m=1,2` | `N(1−ζ)=Φ_(p^m)(1)=p`; `ℚ₂(t₁)=ℚ₂`; `N(i−1)=2` | uniformizer is a norm |
| §2.5 route, step 3 | `ℚ₃`, `m=1`, `u=−1, 4`; `m=0` | `[−1]` moves `μ₃`, `[4]` fixes it; index `2=(3−1)·3⁰`; `m=0`: `Kˣ` | kernel `π^ℤU(K,m)` |
| §2.5 new Check | unram. `K/ℚ₃`, `m=2` | indices `72` and `72`; `exp(3α)≡1+3α mod 9 ∉ U(K,2)` | degree does not determine `N` |
| §3.3 Check A | `𝔽₂[ε]`, `h=(1+ε)X` | law `X+Y+(1+ε)XY`, `[2]=(1+ε)X²`; for `ψ` with zero linear term the `XY` coefficient is `2c₂=0` | coboundary only with linear `ψ` |
| §3.3 Check B | `y²+txy+y=x³`, `t=ε` vs `0` | `[2]` over `ℤ[t]`: `2z−tz²−7z⁴−6tz⁵…`, `z⁴` coefficient `−2−3−2`; mod 2: `tz²+z⁴+…`; `#E₀(𝔽₂)=3`; `Δ=t³−27` | nonzero class; `z²` is the §3.5 coordinate |
| §3.3 Check C | `ℚ₂(√2)`, `O_K/2=𝔽₂[x]/(x²)` | `[π]=εX+X²` vs `X²`; coboundary `εψ(X²)` of order `≥2` | tangent condition needed (`h=1`, `dim=0`) |
| §5.3 Check | `ℤ_p`, `T`, `p⁻¹T` | `p⁻¹ℤ_p` vs reversed `pℤ_p`; `1∈`, `1∉` | direction pinned; agrees with Check 3 |
| §4.3 "endomorphism with linear coefficient `sp` is `[sp]`" | `O→K` injective | both have `coeff 1 = sp` over `K` | `coeff_one_injective` |
| §0.3 `ℓ_G(φ(x)) = c·ℓ_F(x)` | additive group over `ℤ₃`, `φ=2X`, `x=3` | `subst_log`: `2X = 2·X`; `6 = 2·3` | unchanged |
| §0.1 Checks against Tau Ceti height | `𝔾_m` and `𝔾_a` over `𝔽_p` | `height_𝔾ₘ = 1`, `height_𝔾ₐ = ⊤` | agree |
| Lean, degree theorem | `K : Type 1` | now admitted (`Type u_1`) | generality restored |

## Notes for the maintainer

- No Lean name changed. No section, layer or target id was dropped or renumbered.
- The former-numbering row `LT.0/formal-log` now points to Tau Ceti `FormalGroup.log` and
  `TauCeti.FormalGroupHom.subst_log`, so roadmaps citing that title still resolve.
- The BordismFormalGroups contract no longer lists the logarithm, `[n]_F` or the height. These are
  taken from the pinned Tau Ceti declarations.
- Supplier text: EndoscopicTransferAndUnitaryTraceComparison §10.2 states
  `R_β ≅ O_r[[T₁,…,T_(n−1)]]` for non-connected `H_β` too. That is consistent with Serre–Tate, but
  this roadmap now compares only the connected `H_β`.
