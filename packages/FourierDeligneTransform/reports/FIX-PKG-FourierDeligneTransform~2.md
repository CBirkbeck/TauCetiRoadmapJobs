# FIX-PKG-FourierDeligneTransform~2

One review (REV-PKG-FourierDeligneTransform), three findings, all verified correct and repaired in `packages/FourierDeligneTransform/README.md`. `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged.

## F01 (P2) — applied

Verified: ESDE Theorem 7.3.8 (4) (ESDE lines 7307–7312) states the trace identity for elementary `ℱ` only, and `ℱ = Λ_{𝔸¹}` refutes the unscoped clause (`NFT_ψ(Λ) = 0`, trace `0`; `−𝔉_ψ(1)(0') = −q`).

§5.3: "over `𝔽_q` the trace function of `NFT_ψ(ℱ)` is `−𝔉_ψ(t_ℱ)`" → "over `𝔽_q`, for elementary `ℱ`, …", with the reason (`R⁰pr'_!`, `R²pr'_!` vanish; §3.8 with `r = 1`; three signs multiply to `−1`) and the locator. Two Checks added: the `j_!ℒ_χ` trace agreement and the `Λ` negative control. The suggested Check's "`t_{FT(Λ[1])} = −𝔉_ψ(1)`" has the wrong sign; the Check now states `t_{FT(Λ)} = −𝔉_ψ(1)` and `t_{FT(Λ[1])} = 𝔉_ψ(1)`, because `FT(Λ[1]) = σ'_*Λ(−1)` has trace `+q` at `0'`.

Pattern: no other statement in the README gives a trace identity for `NFT_ψ`. §5.5 applies `NFT_ψ` only to lisse sheaves whose breaks at `∞` all exceed `1`. Those are Fourier, hence elementary. The ESDE locator was widened to lines 7235–7312 and its label written "Theorem 7.3.8", as the source has it.

## F02 (P3) — applied

Verified: LefschetzPencilsAndVanishingCycles §1.1 (at the head of its open pull request) defines quasi-unipotence and states Grothendieck's theorem for ℓ-adic representations only. Layer 5 also admits finite fields `Λ`.

§5.6, last sentence → the input is now stated as "eigenvalues of a generator `σ` of `I/P` are roots of unity of order prime to `p`". For `E` and `ℚ̄_ℓ` it comes from §1.1, after descending to a finite `E`. For a finite `Λ` it holds because `GL(V)` is finite. The common argument follows: Frobenius-stable generalized eigenspaces and kernels of `(u − 1)^j` over `𝔽_Q`, then Kummer graded pieces. The supplier contract and the Dependencies line now restrict §1.1 to `E` and `ℚ̄_ℓ`.

Pattern: ArithmeticGaloisRepresentations §3.1, used in §5.1, states finite wild image for discrete coefficients as well as ℓ-adic ones (its "Finite wild image" clause (a)), so it is not affected. No other ℓ-adic-only input is used with finite `Λ`.

## F03 (P3) — applied differently

§5.2 gains an `**API.**` list and one Check:
1. The types do not depend on `ψ`. The (T2) object of `(s', F')` for `ψ(c·)` is the `ψ`-object of `(c s', F')`, by §2.5's `ℒ_ψ(c f) ≅ ℒ_{ψ(c·)}(f)`.
2. `[−1]^*` preserves the types and sends `s'` to `−s'`.
3. `D` preserves the types and sends `(s', F')` to `(−s', F'^∨(1))`.
4. Base extension: pullback to a finite Galois `k'` is a direct sum of simple objects of the same type.

The Check computes these parameters on `ℒ_ψ(x)[1]`.

The suggested bullet for an arbitrary finite `k'` was narrowed to Galois `k'`. Clifford's theorem needs a normal subgroup. For non-Galois `k'` and modular `Λ`, the restriction of `F` can fail to be semisimple, and then `j_*` of it can acquire punctual constituents. Over a finite `k` every finite extension is Galois, so nothing is lost there.

## Checks run

- Elaboration: `lake env lean packages/FourierDeligneTransform/Suggested.lean`, run from the content checkout. It exits `0` with empty output in 9.9 s. The file is unchanged and declares no named declaration, so the `#check @name` comparison is vacuous: nothing to compare, nothing changed.
- Direction check (`gate --depcheck … --movable`):

      depcheck: 240 roadmaps, 2436 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve` on the edited README: "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None." Lean names outside TauCetiRoadmap were not checked by the tool on this host. The review verified them at the pins, and no library name was added.
- Gate failures: none were listed for this job.

## Adversarial pass on the changed statements

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §5.3 trace of `NFT_ψ` for elementary `ℱ` | `Λ_{𝔸¹}` (not elementary) | `Rpr'_!ℒ_ψ(xx') = σ'_*Λ(−1)[−2]`, `NFT = 0`, trace `0`; `−𝔉(1)(0') = −q` | fails without hypothesis | hypothesis added; negative-control Check |
| same | `i_{0*}Λ` (punctual section, Elem(1) fails) | `R⁰pr'_! = Λ_{A'}`, `NFT = 0`, trace `0`; `−𝔉(δ_0) = −1` everywhere | fails; Elem(1) needed | covered by the hypothesis |
| same | `j_!ℒ_χ`, `χ` nontrivial | `x' ≠ 0`: `χ^{−1}(x')(−g)` vs `−Σ_{x≠0}χ(x)ψ(xx') = −χ^{−1}(x')g`; `x' = 0`: `0` vs `−Σχ = 0` | holds | Check added |
| same | `ℒ_ψ(x²)`, `𝔽_3`, `ψ(1) = ω` | `x' = 0`: `−(1 + 2ω)`, and `(1+2ω)² = −3`; `x' = 1`: `−(ψ(0)+ψ(2)+ψ(0)) = −(2+ω²)` vs `ψ(−1/4)·(−(1+2ω)) = −ω²(1+2ω) = −(ω²+2)` | holds | none |
| sign chain `t_{NFT} = −𝔉(t_ℱ)` | symbolic | `t_{FT(ℱ[1])} = (−1)^1 𝔉(−t_ℱ) = 𝔉(t_ℱ) = −t_{NFT}` | holds | stated in README |
| Reviewer's Check `t_{FT(Λ[1])} = −𝔉(1)` | `𝔸¹_{𝔽_q}` | `FT(Λ[1]) = σ'_*Λ(−1)`, trace `+q` at `0'` `= 𝔉(1)(0')`; `t_{FT(Λ)} = −q = −𝔉(1)(0')` | reviewer's sign wrong | corrected in Check |
| §5.6 tame ⇒ extension of twisted Kummer modules, finite `Λ` | `Λ = 𝔽_3`, `k = 𝔽_5`, quadratic Kummer | `α = −1`, `α^5 = α` with `Q = 5`; itself Kummer | holds | — |
| same | `Λ = 𝔽_7`, `k = 𝔽_5`, `σ` of order `3` | `α^5 = α² ≠ α`; with `Q = 25`, `α^{25} = α`, `μ_3 ⊂ 𝔽_25`; over `𝔽_5` the rep is 2-dimensional induced, splitting over `𝔽_25` | extension of `k` needed | stated |
| same | `Λ = 𝔽_3`, `p = 5`, `ρ(σ) = [[1,1],[0,1]]` (order `ℓ`) | `u^5 = u²`, `u^5 − 1 = 2(u − 1)`, `2` a unit; `ker(u−1) = ⟨e_1⟩` is `φ`-stable; `φ = diag(1,2)` gives `φuφ^{−1} = u²` | holds; graded pieces unramified | — |
| same, ℓ-adic | `ρ(σ)^{m'}` unipotent, `m' = [I : I_1P]` | `m'` is an index in `∏_{ℓ'≠p} ℤ_{ℓ'}`, prime to `p`, so `α` has order prime to `p` | holds | — |
| §5.2 API: `ψ(c·)` | `ℒ_ψ(x)[1]`, `p = 3`, `c = 2` | `ℒ_ψ(x) = ℒ_{ψ(2·)}(2x)`, so (T2) for `ψ(2·)` at `2 = c^{−1}`; rule gives `ψ`-object at `2·2 = 1` | holds | Check added |
| same, vs §3.2 | `FT_{ψ(c·)} = [c]^*FT_ψ` on `i_{s*}F` | `[c]^*ℒ_ψ(s x') = ℒ_ψ(x' · cs)`: (T2') for `ψ` at `cs`, i.e. for `ψ(c·)` at `s` | consistent | — |
| §5.2 API: `[−1]^*` | `δ_a`; `ℒ_ψ(x)[1]`; FT | `δ_{−a}`; `ℒ_ψ(−x)[1]` at `−1`; `[−1]^*FT(δ_a) = ℒ_ψ(−ax')[1] = FT(δ_{−a})` | holds | — |
| §5.2 API: `D` | `δ_a`; `ℒ_ψ(x)[1]`; `j_!ℒ_χ[1]` | `δ_a`; `ℒ_ψ(−x)(1)[1]`, (T2) at `−1` with `Λ(1)`; `j_{!*}ℒ_{χ^{−1}}(1)[1]`, (T3) | holds | — |
| §5.2 API: Galois base extension | `i_{s*}Λ`, `k(s) = 𝔽_{q²}`, `k' = 𝔽_{q²}`; `F = Ind ℒ_χ` with `χ ≠ χ^q` | `δ_{s_1} ⊕ δ_{s_2}`; `j_{!*}ℒ_χ[1] ⊕ j_{!*}ℒ_{χ^q}[1]` | holds | restricted to Galois `k'` |

## For the maintainer

- No name that another roadmap cites changed, and no section was renumbered. No new target, supplier gap or source was added. The four declared gaps are unchanged.
- The edits introduce no new constructions, so no ownership question arises. The cited LefschetzPencilsAndVanishingCycles §1.1 and ArithmeticGaloisRepresentations §3.1 were read at the heads of their open pull requests. The section ids are unchanged there.
- Clifford's theorem and the Baire-category descent of `ℚ̄_ℓ`-representations to a finite `E` are cited as standard facts without a manifest entry.
- The `#check` comparison is vacuous: `Suggested.lean` declares no named declaration.
