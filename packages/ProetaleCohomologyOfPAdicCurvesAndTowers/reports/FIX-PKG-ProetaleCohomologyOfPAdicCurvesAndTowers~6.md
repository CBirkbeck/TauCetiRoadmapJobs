# FIX-PKG-ProetaleCohomologyOfPAdicCurvesAndTowers~6

This round repairs the four findings of `REV-PKG-ProetaleCohomologyOfPAdicCurvesAndTowers~5`. There is one review, so the finding ids are unqualified. All four were verified against the cached sources and the supplier texts, and all four are applied.

Files changed:
- `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/README.md`: §1.4 (one Prove bullet, three Checks), §4.3 (one Check), §4.8 (locators), §5.4 (one Check), Conventions (one sentence), §7.1 (statement, three new Checks, Needs line) and §7.2 (statement and route, two Checks).
- `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/sources.toml`: added the locator `§7.1.5` to the existing `CDN-CURVES` entry. No new key.

`Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged. No Lean name changed and no supplier gap was added.

## F01 (P1) — applied

Verified. In §1.4, `ι_HK^ϖ` is only a continuous linear map. The reviewer's witness is correct: on `K = ℚ_3`, `ϖ = 12`, `M = ℚ_3e₀ ⊕ ℚ_3e₁`, `φ = diag(1,3)`, `Ne₁ = e₀`, with `ι = 0`, both maps are `0` while `log_3(4)Ne₁ ≠ 0`.

Old → new (§1.4 Hyodo–Kato bullet): "differs unless `log_K(a)N_p = 0`" → equal exactly when `ι_HK^ϖ ∘ cN_p = 0`, `c = log_K(a)`. The proof is the factorization `exp(−cN_p) − 1 = −cN_p ∘ g(cN_p)` with `g(cN_p)` invertible. For injective maps, such as the Hyodo–Kato isomorphisms of §§4.3 and 5.2, the condition becomes `cN_p = 0`.

Other changes in §1.4:
- New Check: the zero-map negative control, plus the faithful case, where the difference at `e₁` is `−log_3(4)e₀`.
- Sign Check: now stated for an injective `ι_HK^3`.
- Degenerate Check: now requires `ϖ^♭ = p^♭`; it adds the `2·id` example and the `ϖ^♭ = εp^♭` case, where `ℓ_a = t` and `Ψ_ϖ(u) = u − t`.

The same pattern appeared in two other places:
- §4.3 unit-factor Check: the difference is nonzero because the model's Hyodo–Kato map is an isomorphism.
- §5.4 Check: "changing only one changes the map" was false for a Teichmüller `w`, which has `log_K(w) = 0`. It is now qualified and the Teichmüller exception is stated.

## F02 (P1) — applied

Verified. CDN20 lines 101–107 name the characters `det`, `Nrd` and the reciprocity character without their orientation. That reading contradicts the trivial diagonal (Conventions; EndoscopicTransferAndUnitaryTraceComparison §12.7: `|det(g)Nrd(d)^{−1}| = |w|`). STR08 Theorem 4.4, lines 381–390, gives `det(g)Nrd(b)^{−1}χ(τ)^{−1}`, with `rec` sending arithmetic Frobenius to a uniformizer.

Old → new (§7.1): "act through `ν_H = det, Nrd`, reciprocity" → `(g, b, w)` translates by `det(g)·Nrd(b)^{−1}·rec_F(w)`. The torsor is identified so that `G` acts by `det`, and `rec_F(τ) = χ_LT(τ)^{−1}` on inertia. "Factors through `Nrd`" is kept, and kept distinct from the translation character.

New §7.1 Checks:
- Central test: `9·9^{−1} = 1` with height change `0`; the unsigned version gives `81` and height change `4`.
- Weil orientation: `(ϖ, 1, Φ_geo)` preserves height zero.
- Sectors: the centre of `G` acts on `Z[ρ]` by `ω_ρ^{−1}`, which matches `LL(M)^*` in §§7.4–7.5.

The Conventions now state the dictionary, and §12.7 was added to the Needs line of §7.1. I rechecked the uses of these conventions in §7.2 (copy-index shift), §7.4 (transitivity through `Nrd`, `Nrd(S) ⊂ O_F^×`, central characters) and §7.7 (height shifts `2` and `1`). None depends on the sign, and all are consistent. Nothing is imported from ScholzeFunctorAndModpCohomologyOfTheLubinTateTower.

## F03 (P2) — applied

Verified. CDN20 Proposition A.1 proves node equality only for the "+" model, at lines 2108–2120, and extends the action to the "◦" model by functorial resolution at lines 2121–2122. CDN23 lines 1204–1210 draw the same distinction. TropicalAndBerkovichArithmetic §2.16 shows that a valence-two genus-zero point is not a node.

Old → new (§7.2 statement): "triangulation is the node set" → the semistable model `(M_{n,E}^ϖ)°` has a triangulation that contains and refines `Σ_an`, the extra vertices being genus-zero points of valence two.

New route:
1. The stable model `X_{n,E}^+` gives the generalized semistable model `(M_{n,E}^ϖ)^+`, whose triangulation equals `Σ_an`.
2. The action extends to `(M_{n,E}^ϖ)^+` by §§2.16–2.17.
3. Functorial resolution extends it to `(M_{n,E}^ϖ)°`.

New Check: a thickness-two node becomes two length-1 edges with one valence-two vertex; the total length `2` is preserved. The `n = 0` Check now notes that there the two triangulations coincide.

## F04 (P3) — applied

Verified. CDN-CURVES lines 4017–4021, printed p. 96, define `Ĵ`, and lines 4021–4028 give the `log_J` exact sequence. Line 4044 belongs to Remarque 7.8.

Old → new (§4.8): "line 4044" → "lines 4017–4021, printed p. 96" for the definition. "lines 4021–4028, printed p. 96" was added at the exact sequence. Théorème 7.9 is still cited for `ι_st`. The other locator in §4.8 (line 436 for the Kummer sequence) was rechecked and is correct (lines 436–438).

## Checks

- **Elaboration.** `lake env lean packages/ProetaleCohomologyOfPAdicCurvesAndTowers/Suggested.lean`, run from the content checkout: exit 0. The only output is `124:8: warning: declaration uses 'sorry'`. No `TauCeti.*` import, so nothing needed building.
- **Signatures.** I elaborated a scratch copy with `#check @name` for all 8 declarations (`flagSubspace`, `parabolic`, `parabolic_mono`, `translation`, `steinbergRelations`, `steinbergRelations_le_comap`, `generalizedSteinberg`, `generalizedSteinberg_isIrreducible`). Every type matches its README statement and no binder was lost; the last theorem keeps `Fact p.Prime`, `NontriviallyNormedField K`, `NormedAlgebra ℚ_[p] K`, `FiniteDimensional ℚ_[p] K`, `Field A` and `CharZero A ∨ CharP A p`. Nothing changed.
- **Dependency check:**

```text
depcheck: 206 roadmaps, 1918 edges, 0 problem(s)
```

  There is no UPWARD, CYCLE or moved line.
- **Citation resolver.** Its two leads are unchanged: ModpRepresentationsOfGL2OverLocalFields §0.3 (a supplier) and PadicLocalLanglandsForGL2QpPartII §4.1 (a consumer). Both are board packages and the review resolved both. No Lean name is unresolved.
- **Ownership.** No new construction was introduced. The infinite-level component dictionary is §7.1's own, and it was checked against EndoscopicTransferAndUnitaryTraceComparison §§12.2, 12.7, 12.11 and 12.14 and TropicalAndBerkovichArithmetic §§2.16–2.17, read at their open heads with `roadmaps show`.
- **Gate failures.** None were listed.

## Adversarial pass (new or changed statements)

| Statement | Instances | Computed values | Result |
| --- | --- | --- | --- |
| §1.4 criterion `ι∘(exp(−cN)−1)=0 ⇔ ι∘cN=0` | `ι=0`; `ι=id`, `Ne₁=e₀`, `c=log_3 4`; `c=0` (Teichmüller `a`); nilpotence 3 with `ι(e₂)=1`, `ι(e₁)=ι(e₀)=0` | zero map: both sides `0`. `id`: LHS at `e₁` is `−ce₀`, RHS is `ce₀`, both `≠0`. `c=0`: both `0`. Order 3: `ι∘N=0` and `ι(exp(−cN)e₂−e₂)=ι(−ce₁+c²e₀/2)=0`. Variant `ι(e₁)=1`: both sides give `−c`, resp. `c`, `≠0`. | holds; injective case gives `cN=0` |
| `g(x)=Σ(−x)^k/(k+1)!` | `x=cN`, `N²=0` | `exp(−cN)−1=−cN`, `g(cN)=1−cN/2`, and `−cN(1−cN/2)=−cN` | factorization correct |
| §1.4 roots Check | `ϖ=p`, `ϖ^♭=p^♭`; `ϖ^♭=εp^♭` | `a^♭=1`, `ℓ_a=0`, `Ψ=id`. `a^♭=ε`, `ℓ_a=log[ε]+log_K(1)=t`, `ι_ϖ(Ψ(u))=ι_p(u)+t−t=ι_p(u)` | consistent with the Hyodo–Kato bullet |
| §1.4 detection Check, `φ`-compatibility | `φ=diag(1,3)`, `Ne₁=e₀` | `Nφe₁=3e₀`, `3φNe₁=3e₀`; `Nφe₀=0` | valid `(φ,N)`-module |
| §4.3 Check sign | `ι^{(p)}(e₁)=ι(e₁−log_3(4)e₀)` | difference `−log_3(4)ι(e₀)`, of valuation `1` times a nonzero vector | sign corrected to `−` |
| §5.4 Check | `w` Teichmüller; `w=4` over `ℚ_3` | `log_K(w)=0`, so `ι^{ϖw}=ι^ϖ`. `log_3 4≠0`: on `b(e₁+ue₀)` the change is `b·log_3(4)ι(e₀)≠0` | qualified; horizontality `D(e₁+ue₀)=e₀−e₀=0` |
| §7.1 dictionary, centre | `n=2`, `(3I₂,3)`; general `(z,z)` | `9·9⁻¹=1`, height `2−2=0`. `z^n z^{−n}=1`. Unsigned: `81`, height `4` | trivial diagonal |
| §7.1 Weil orientation | `n=1`, `(ϖ,1,Φ_geo)`; `(ϖ,1,1)` | `v(ϖ·rec_F(Φ_geo))=1−1=0`, preserved. `(ϖ,1,1)`: `v=1`, moved. Geometric `rec^{−1}`: `v=2` | agrees with §12.7 Checks |
| §7.1 inertia | STR08 (i)+(ii) | the `H⁰` characters `ω(det)ω(Nrd)^{−1}ω(χ^{−1})` match `ω∘rec`, so `rec(τ)=χ_LT(τ)^{−1}` | consistent with Lubin–Tate theory (arithmetic Artin map `u↦[u^{−1}]`) |
| §7.1 sectors | `φ∈Hom_Ǧ(ρ,Z)`, `z` central | `(zφ)(v)=z_G φ(v)=z_Ǧ^{−1}φ(v)=φ(z^{−1}v)=ω_ρ(z)^{−1}φ(v)` | equals the central character of `LL(M)^*` |
| §7.2 node refinement | `n=0`; thickness 2; thickness `h` | `n=0`: all nodes `xy=ϖ`, valence `q+1≥3`, sets equal. `h=2`: vertices `2→3`, edges `1→2`, length `2=1+1`. General `h`: `h−1` new valence-two genus-0 vertices | refined, not equal |
| §7.2 stabilizer Check (unchanged, rechecked) | `(v,i)` at level 0 | stabilizer `{g: gv=v, v(det g) even}=ϖ^ℤGL₂(O_F)` | correct |

## For the maintainer

- No Lean name, section number or heading changed; consumers of §§1.4, 4.8, 7.1 and 7.2 need no update.
- §7.1 now gives `π₀` of the infinite-level towers with the character `det·Nrd^{−1}·rec_F`, with `rec_F` sending arithmetic Frobenius to a uniformizer, under the supplier's §12.7 conventions. ScholzeFunctorAndModpCohomologyOfTheLubinTateTower §0.2 and the PadicLocalLanglandsForGL2QpPartII package import §7.1. If either restates the orientation, it should use this dictionary or name its conversion to a right action.
- §7.2 now asserts node equality for the generalized model `(M_{n,E}^ϖ)^+` and refinement for the semistable model `(M_{n,E}^ϖ)°`. §7.7 and its consumers use the semistable model, which is unchanged in substance.
- Ownership against open pull requests was checked through the `roadmaps` tools for the suppliers touched here (EndoscopicTransferAndUnitaryTraceComparison and TropicalAndBerkovichArithmetic at their open heads); nothing new is owned.
