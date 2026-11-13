# FIX-PKG-ProetaleCohomologyOfPAdicCurvesAndTowers~7

Nine findings, all verified against the cached sources, the pinned Mathlib and Tau Ceti, and the supplier roadmaps at their heads. Eight are applied and one is applied differently. Paths are relative to the package folder `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/`.

## F01 (P2) — applied differently

Confirmed. CDN-STEIN line 964 (§3.2.2) defines the overconvergent complex, which line 206 names `RΓ^BK_syn(X_C, ℚ_p(r))`. Line 1442 (§3.3.3) defines the crystalline one. Line 1454 gives `ι_BK`, line 1526 gives `ι_rig`, and lines 1198–1200 with 1224 give `β`. The README defined none of these.

The repair differs from the one proposed on one point. Breuil's ring `B̂_st^+` is not in PadicPeriodRings: PadicPeriodRings has no §0.6. It is PadicHodgeTheory §0.6 (*Breuil's completed semistable ring*), and that section is stated only for finite `K/ℚ_p`. Layer 5 uses a general discretely valued `K`, as CDN-STEIN line 316 does, so a new supplier gap is needed.

Changes in §5.4:
- The overconvergent complex is now explicitly identified as one object under its two source names, with its quasi-isomorphism to the `B̂_st^+`-version (CDN-STEIN (3.37)).
- New definitions: `r^PD_ϖ` and `RΓ^BK_syn(𝔛_{O_C}, ℚ_p(r))`.
- The maps `ι_BK`, `ι_rig` and `β` are named with their sources and targets.
- Two Checks added: the crystalline complex on `Spf O_K` (H⁰ = ℚ_p t; dropping `N = 0` would add `ℚ_p u`), and the sources and targets of the four maps.

Elsewhere:
- §5.5 now points to these maps.
- Needs and Layer 5 Dependencies now cite PadicHodgeTheory §0.6 and CrystallineCohomology §§CR.5.3–CR.5.4 (log crystalline cohomology over a divided-power base).
- Scope and supplier contracts are updated, including the monodromy normalization: Layer 5's `ϖ`-normalized `N` is `e·N` of PadicHodgeTheory §0.6.
- New gap `completed-semistable-ring-general-K` (supplier PadicHodgeTheory, §0.6), with the same slug in `design/plan.json` `gaps` and under the README's "Exact supplier contracts".

## F02 (P2) — applied

Confirmed: CDN-CURVES lines 3118, 2023–2035 and 3122–3129. §2.4 now states three definitions in its own words, with the source lines cited:
- the Kummer regulator (Lemme 5.4, lines 2461–2477; limit at lines 2485–2488), with the compatibility of `c_n` under `x ↦ x^ℓ` written out;
- `Symb_ℓ(Z^gen) = ℤ_ℓ ⊗̂ O(Z^gen)^×` for legs and ghost circles, with shorts using the affinoid group already defined;
- the localized symbols `Symb_ℓ(Y_S)`.

In the source the gluing relation reads `g_{i,j,n+1}^ℓ = g_{i,j,n}v_{i,n}/v_{j,n}`. The OCR at lines 3124 and 3150 drops the fraction bar. I checked the quotient form against the source's injectivity computation (lines 3159–3161), and the README records the derivation.

Same defect elsewhere: `I₂` and `I_{2,c}` were also used undefined (§0.1, §2.3, §2.4). They are now defined in §0.1 (CDN-CURVES §1.2.3, lines 772–775), and `Y_i`, `Y_{i,j}` are defined in §2.2.

New Check: on a Tate curve, the families with `u = v = 1` give exactly `H¹(Γ, ℤ_ℓ(1)) = ℤ_ℓ(1)`. This is the cokernel for the 6-cycle `Γ^{(2)}`.

## F03 (P2) — applied

Confirmed: `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md` line 31 lists "locally analytic generalised Steinberg representations" as not in that roadmap. "Orlik–Schraen" occurs in no roadmap (`roadmaps grep -i Orlik` returns only Orlik–Solomon and Orlik–Strauch). The bullet is deleted. Nothing in this roadmap uses a locally analytic Steinberg representation: the phrase "locally analytic" occurred only in that bullet.

## F04 (P3) — applied

Confirmed: `Module.Basis.flag` is at `Mathlib/LinearAlgebra/Basis/Flag.lean` line 40 and `Pi.basisFun` at `Mathlib/LinearAlgebra/StdBasis.lean` line 120. On a scratch file, `(Pi.basisFun K (Fin (d+1))).flag k.succ.castSucc` equals the former `flagSubspace K (d+1) (k+1)`, proved by `ext x; simp [Module.Basis.mem_flag_iff_repr_eq_zero, Fin.le_def, Submodule.mem_iInf]`. So the change keeps the definition's meaning.

Changes:
- `flagSubspace` is deleted from `Suggested.lean`. `parabolic` now uses `Module.Basis.flag` and is marked `noncomputable`, and its docstring is updated.
- README §0.3: the definition sentence cites Mathlib; the `flagSubspace` API bullet becomes a prose bullet on `parabolic` and the flag. The two flag Checks are restated: the `K⁰` Check is now `⊥ = ⊤`, and a `d = 0` case is added, where `parabolic K 0 J = GL₁(K)`.
- The Mathlib contract, the §0.3 Needs line and the Layer 0 Dependencies are updated.

## F05 (P3) — applied

Confirmed: Lemme 4.4 (CDN-CURVES line 2041) is the presentation of `Symb_ℓ(Y^gen)`. The residue isomorphism is Proposition 4.5 (lines 2051–2053). Both Checks (§2.4 and §3.3) now cite "Proposition 4.5, lines 2051–2053, with Lemme 4.2 for the residue of a unit"; these are the only two occurrences.

The §2.4 Check is now stated for the leg `Y_a^gen`, the object Proposition 4.5 is about. It records the unit factorisation (Corollaire 4.3), and that the factors `1 + T_iO_C[[T_i]]` are ℓ-divisible for ℓ ≠ p but not p-divisible.

## F06 (P3) — applied

Confirmed: `theorem simple_GL2Steinberg` is at `TauCeti/RepresentationTheory/CharacterTable/GL2/Boundary.lean` line 101, and `GL2Steinberg` at `.../GL2/Steinberg.lean` line 105; both are in namespace `TauCeti`. The Tau Ceti contract now records it as a near miss: the group is finite, the coefficients are `ℂ`, and the carrier is `FDRep ℂ (GL (Fin 2) F)`. "Generalized Steinberg representations" in that sentence is narrowed to "of p-adic groups".

## F07 (P3) — applied

Confirmed. The §0.1 definition paragraph now defines `H⁰(Γ, L) = ker(∂: L^S → L^{A_c})` and `H⁰_c(Γ, L) = ker(∂: L^{(S)} → L^{(A)})`. It cites CDN-CURVES Remarque 1.2(i), lines 731–736, whose conditions the README's graphs satisfy: every edge has an endpoint, and there are no vertex-less circles.

The annulus Check now says "third bullet" and prints `H⁰_c = 0` and `H⁰ = L`. I checked the other bullet references, in §0.3 and in the Layer 1 Examples: both are correct.

## F08 (P3) — applied

Confirmed: CDN-STEIN line 1920 cites [10, X, Theorem 4.11], which line 3254 identifies as Borel–Wallach.

`sources fetch --id BW00 ... 10.1090/surv/067` found no legal copy; the AMS ebook is paywalled. I recorded BW00 in `sources.toml` as `uncertified`, cited by locator, so the request it wrote to `needs-references.toml` is settled and that file is removed.

Changes:
- §0.4 now cites "BW00, Chapter X, Theorem 4.11, as cited at CDN-STEIN line 1920" and adds the step from `ℂ` to every characteristic-0 field. This uses `Sp_J(A) = Sp_J(ℚ) ⊗ A`, finite-dimensional `U`-invariants, and Schur plus Burnside over `ℂ`, which make the rational Hecke algebra map onto `End(Sp_J(ℚ)^U)`.
- References and the headline docstring are updated to match.

## F09 (P3) — applied

Confirmed.
- §6.3: all four `S₀` become `O_F^0`. The Layer 6 preamble now defines `k`, `q = p^f`, `F = W(k)[1/p]` and `O_F^0`, which Layer 6 used without defining them.
- §7.1: the Lubin–Tate level is written `M_{LT,m}^{(0)}`, using the supplier's `M_LT,m` (EndoscopicTransferAndUnitaryTraceComparison §12.3) rather than the proposed `LT_m`.
- Same defect elsewhere: §7.1 also used `n` for the Lubin–Tate rank while the Layer 7 preamble uses `n` for Drinfeld levels. The rank is renamed `h`, with `D_h` the division algebra of invariant `1/h`, in the statement and in all five Checks (`b^{−h}`, `h = 1`, `h = 2`, `ω(z^h)`).

## Checks run

- **Elaboration.** `lake env lean packages/ProetaleCohomologyOfPAdicCurvesAndTowers/Suggested.lean`, run from the content checkout: exit 0, one warning, `122:8: declaration uses 'sorry'` (the headline). The file has one `import Mathlib`, no `TauCeti.*` import, no `set_option` and no sorry'd data.
- **Signatures.** I ran `#check @name` on all 7 declarations in one scratch file: `parabolic`, `parabolic_mono`, `translation`, `steinbergRelations`, `steinbergRelations_le_comap`, `generalizedSteinberg`, `generalizedSteinberg_isIrreducible`. Each elaborated type matches its README statement, and no binder is lost. The headline keeps `Fact p.Prime`, `NontriviallyNormedField K`, `NormedAlgebra ℚ_[p] K`, `FiniteDimensional ℚ_[p] K`, `Field A` and `CharZero A ∨ CharP A p`. The only change is the deletion of `flagSubspace`.
- **Dependency check.** Output:

```text
depcheck: 209 roadmaps, 1925 edges, 0 problem(s)
```

  There is no UPWARD, CYCLE or `moved:` line. The new supplier PadicHodgeTheory is earlier in the merge order.
- **Citation resolver.** Two leads remain: ModpRepresentationsOfGL2OverLocalFields §0.3 and PadicLocalLanglandsForGL2QpPartII §4.1. Both are board packages and resolve there. It now finds no Lean name missing.
- **Ownership.** Ownership against open pull requests was checked with the `roadmaps` tools at their heads. `B̂_st^+` is owned by PadicHodgeTheory §0.6 (#1062 head) and log crystalline cohomology by CrystallineCohomology §§CR.5.3–CR.5.4 (#857 head); both are cited, not restated. No declaration of `Suggested.lean` takes a name declared by another roadmap.

## Adversarial pass (new or changed statements)

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| `H⁰`, `H⁰_c` and the §0.1 sequence | loop; one leg; two legs; segment with 2+2 legs | loop: `0→L→L→0→L→L→0`; one leg: `0→0→L→L→0→0→0`; two legs: `H⁰_c = 0`, `H⁰ = L`, `0→0→L→L²→L→0→0`; segment: `H⁰ = L` (diagonal), `H⁰_c = 0`, `L⁴`, `H¹_c = L³`, `H¹ = 0`, ranks `1−4+3 = 0` | exact in all four |
| `I₂`, `I_{2,c}` | Tate triangle; annulus graph | 6-cycle: `coker(L⁶→L⁶) = L`; annulus: `I_{2,c} = ∅`, `I₂` = 2 legs | consistent with §0.1 |
| `Symb_ℓ(Y) = lim A_{ℓ,n}/(C^×)^{ℓ^n}` | general; closed disc, ℓ ≠ p | `(f_n)` maps to zero iff each `f_n = h_n^{ℓ^n}`; disc gives `H¹_ét(D, μ_{ℓ^n}) = 0` | equivalent to the `(f_n)` form |
| Kummer regulator compatibility | torsor pushout | `y^{ℓ^{n+1}} = f ↦ (y^ℓ)^{ℓ^n} = f`; `c_n(f_{n+1}) = c_n(f_n)` since `f_{n+1}/f_n ∈ (C^×)^{ℓ^n}` | well defined |
| Localized-symbol relations | trivial families; `u = v = 1` on a Tate curve | `(a_{i,n+1}/a_{j,n+1})^ℓ = (a_i/a_j)(a_{i,n+1}^ℓ/a_{i,n})(a_{j,n}/a_{j,n+1}^ℓ)`; product form `v_iv_j` fails on the same family; `u = v = 1` gives `ℤ_ℓ(1)` | quotient form is correct |
| Leg Check (Prop 4.5) | ℓ ≠ p; ℓ = p | `(1+x)^{1/ℓ}` has `ℤ_p`-coefficients, so the factor is ℓ-divisible; `1+T₁` is not a p-th power in `1+T₁O_C[[T₁]]` | `ℤ_ℓ`; extra classes for ℓ = p |
| `parabolic` via `Module.Basis.flag` | `d = 0`; `d = 1`, `J = ∅`; `J` everything | `iInf` over `Fin 0` is `⊤`; `[[1,0],[1,1]]e₀ = e₀+e₁ ∉ Ke₀`; empty conditions give `⊤`; equality with the old definition proved by `simp` | unchanged |
| §0.4 base change | `J = Δ`; `d = 1`, `J = ∅`, `U = Γ(ϖ)`; `A` not embeddable in `ℂ` | `Sp_Δ^U = A`, simple; `dim Sp_1(ℚ)^U = q`, simple over `ℂ` and hence absolutely simple; the argument uses only `ℚ ⊂ A` | holds for every char-0 field |
| Overconvergent complex, `B_st^+` vs `B̂_st^+` | `X` a point, `r = 0` | both `N = 0, φ = 1` parts are `(B_cris^+)^{φ=1} = ℚ_p` | agree |
| Crystalline BK complex on `Spf O_K` | `r = 0`; `r = 1`; `N = 0` dropped | `r = 0`: `H⁰ = ℚ_p`; `r = 1`: `H⁰ = ℚ_p t`, `H¹ = 0`, matching `Spa(C)`; without `N = 0`, `u` with `φu = pu`, `θι(u) = 0` gives a second line | `N = 0` needed |
| `β`, `β̃` types | `r = 0` | `Ω^{−1} = 0`, `H⁰ = ℚ_p^{π₀} → C^{π₀}`, `ker = X^{−1}_st = (B_cris^+)^{φ=p^{−1}} = 0` | consistent with §5.5 |
| Gap `completed-semistable-ring-general-K` | `K = W(𝔽̄_p)[1/p]` (not finite over `ℚ_p`) | PadicHodgeTheory §0.6 opens with "For finite `K/ℚ_p`" | gap needed |
| Layer 6 `F`, `q = p^f` | `ℚ_p`; unramified `ℚ_{p²}`; `ℚ_p(√p)` | `f = 1, F = ℚ_p`; `f = 2, F = K`; `f = 1, F = ℚ_p`, `e = 2` | §6.3 `φ^f = q^s` consistent |
| §7.1 with `h` | `h = 1`; `h = 2`, `(3I₂, 3)`; diagonal `z` | `b^{−1}`, `D_1 = F`; `9·9^{−1} = 1`; `z^h·z^{−h} = 1` | unchanged values |

## For the maintainer

- New supplier gap: PadicHodgeTheory must extend §0.6 (*Breuil's completed semistable ring*) from finite `K/ℚ_p` to every complete discretely valued `K` of characteristic 0 with perfect residue field (`gap:completed-semistable-ring-general-K`).
- No Lean name that other roadmaps cite changed. `flagSubspace` was deleted; `roadmaps grep flagSubspace` shows no other roadmap using it.
- §7.1 now writes the Lubin–Tate rank as `h`. The section number and its content are unchanged, so the citation of §7.1 by ScholzeFunctorAndModpCohomologyOfTheLubinTateTower §0.2 still holds.
- BW00 is recorded as `uncertified` (a paywalled AMS monograph), cited by locator only, as CDN-STEIN cites it.
