# FIX-RT-QuasiRiemannHypothesis~2: repair of red-team round 2 (passes a and b)

Files changed: `packages/QuasiRiemannHypothesis/README.md`, `packages/QuasiRiemannHypothesis/Suggested.lean`
(module docstring only), `packages/QuasiRiemannHypothesis/sources.toml` (locators only). `design/plan.json`
is unchanged (`"gaps": []`; no supplier gap was needed). Nine findings, settled in seven sections:
the two pairs of overlapping findings (the bullet of §6.2, and the source's coinages) are settled once.

## RT-QuasiRiemannHypothesis~2b/F01 (P1) — applied differently

§6.2 primitivity axiom: "the conductor of `χ_𝔞 χ_𝔟` is `𝔞𝔟`" → "the primitive character inducing
`χ_𝔞 χ̄_𝔟` has conductor `𝔞𝔟`", citing `goldmakherlouvel2013` Def. 1 with its §2 verification (p. 5) and
`bgl2014` Lemma 2.3 (p. 7), plus a sentence saying the conjugate matters only for `n ≥ 3`. The reviewer's
`n = 3` witness went into the Checks of §6.3, not §6.2, because 2a/F02 and 2b/F02 forbid §6.2 to use §6.3.

Verification. `bgl2014` line 305 (Lemma 2.3) states the conductor for `χ^j_(𝔟₁) χ̄^j_(𝔟₂)`. The
verification in `goldmakherlouvel2013` (lines 199–230) evaluates the product at `(x)` as the symbol of
`x_a/x_b`, a quotient, which is `χ_𝔞 χ̄_𝔟`. The cached text is an extraction in which overbars can be
lost, so the README does not claim that the printed Definition 1 has a misprint. It cites the definition
"read with the conjugate that its verification computes". Witness, recomputed: `K = F`, `𝔠 = (9)`,
`𝔞 = (−2)`, `𝔟 = (7)`.
- `−2 − 7 = −9 ∈ 9𝓞`, so the two ideals lie in one ray class.
- `x_a/x_b ≡ 1 (mod λ⁴)` is a cube in `F_λ`, so `χ_𝔞 χ̄_𝔟` is unramified at `λ` and tame of exponent `1`
  at `(2)`, `π` and `π̄`. Its conductor is `(14)`.
- `χ_𝔞 χ_𝔟` is the cubic symbol of `14 w λ^(2k) h³`. A unit cube is `≡ ±1 (mod λ³)`, and the extension is
  unramified only if `3 ∣ v_λ` and the unit part is `≡ ±1 (mod λ³)`. Here `14 ≡ 5 (mod λ³)`, with
  `v_λ(5+1) = 2`, `v_λ(5+ω) = v_λ(5+ω²) = 1` and `v_λ(5−1) = v_λ(5−ω) = v_λ(5−ω²) = 0`. So `λ` divides
  the conductor of `χ_𝔞 χ_𝔟`.

Same pattern elsewhere:
- §6.4 already uses `χ̄` (`bgl2014` Lemma 2.2/2.3 for `χ^j_(𝔟₁) χ̄^j_(𝔟₂)`). Its remark that
  `χ̄^(n/2) = χ^(n/2)` is still true and stays.
- The first Check of §6.2 now notes that `χ₃χ₇ = χ₃χ̄₇` because the values are real.
- The trivial-family Check of §6.2 and the `ℚ(i)` fourth-order Check are unchanged: both concern real
  values.

## RT-QuasiRiemannHypothesis~2a/F02, RT-QuasiRiemannHypothesis~2b/F02 (P3) — applied

The bullet "The Fisher–Friedberg characters of §6.3 form an `n`-th order Hecke family" was deleted from
§6.2. A new last bullet of §6.3 states the same thing with `G = R_𝔠` and `[·]` the projection: the
reciprocity law is `bgl2014` Lemma 2.1, and the primitivity axiom, for `χ_𝔞 χ̄_𝔟`, is Lemma 2.3 at `j = 1`.
§6.2 now uses nothing of §6.3. Its remaining mention of Fisher–Friedberg refers to the source's §2 family
at `n = 2`. §6.3 still needs §§2.1, 6.2, and §6.4 still needs §§6.2–6.3.

## RT-QuasiRiemannHypothesis~2a/F03 (P3) — applied differently

In §10.6 the name `E*` (which §1.3 uses for `min(β* − σ₀ − ω, σ)`) became `ε_b = 10⁻⁶`; `ϵ₀` was not
used because `ε₀` already appears in §§7.3 and 10.3. The text now lists every loss and states
`ε_c = 12ε + ε_r + ε_n + ε_H ≤ 15ε_b` (`openai2026quasiRH` p. 75, lines 3376–3386). The bound becomes
`13 + 30 + 3 = 46`, citing p. 83 (lines 3751–3754). A new Check shows the wrong reading `ε_c = ε_b`, which
gives `18`. The `*Needs:*` line adds §§7.2, 10.3–10.4. The reviewer's repair credited `ε_c` to the row
count alone; its other three terms (`12ε`, `ε_n` and `ε_H`) were missing.

## RT-QuasiRiemannHypothesis~2a/F04, RT-QuasiRiemannHypothesis~2b/F04 (P3) — applied

In "Not owned here", "compensated probe … two moment inductions", "finite correlations", "masked
primitive Poisson summation" and "quadratic–cubic norm estimate" were replaced by descriptions:
- a second probe for §1.3 at `(7/8, s − 11/16)`;
- Gauss sums of the sextic symbol modulo prime powers and complete correlation sums of two sextic
  symbols (Lemmas 13.2–13.4);
- a mean-value bound for a bilinear form in quadratic and cubic symbols (Lemma 14.2);
- Poisson summation for a primitive character over the elements prime to a fixed ideal (Lemma 17.5).

In Downstream consumers, "by the compensated probe" became "by the second probe of Part II". The Lean
module docstring said "low and high estimates", but no "high estimate" is defined in the README; it now
says "its low estimate and its comparison with the Mellin integral". A grep for
`compensat|masked|quadratic–cubic|marked` finds nothing.

## RT-QuasiRiemannHypothesis~2a/F05 (P3) — applied

The §1.1 Check said: "`riemannZeta_ne_zero_of_one_le_re` off `s = 1`, and order `−1` at `s = 1`, where
Mathlib's value is junk". It now says that on `Re s > 1`, `ζ` is analytic (`differentiableAt_riemannZeta`)
and nonzero (`riemannZeta_ne_zero_of_one_le_re`), so its order is `0`. The point `s = 1` has `Re s = 1`
and enters only for `σ < 1`, where the order `−1` is what counts. At the pin the lemma has no `s ≠ 1`
hypothesis (`NumberTheory/LSeries/Nonvanishing.lean:417`). `differentiableAt_riemannZeta` was added to
"From Mathlib".

## RT-QuasiRiemannHypothesis~2a/F01 (P3) — applied

In Conventions, "with covolume `1` (§4.4)" → "(§3.5)". §3.5 proves both self-duality and covolume `1`;
its Check gives `(2/√3)(√3/2) = 1`. No other citation of §4.4 is about self-duality (grep `self-dual`:
lines 48, 191, 395 and the heading of §3.5, all pointing at Layer 3).

## RT-QuasiRiemannHypothesis~2b/F03 (P3) — applied

On main, LFunctions Layer 7 (its README line 1443) covers only *nontrivial* primitive characters.

Edits:
- Line 89 and the LFunctions contract now read "for a nontrivial primitive `ψ` … no statement for the
  trivial character".
- §5.5 Check at `σ₀ = 1`: the hypothesis holds by the Euler product on `Re s > 1`.
- §11.1 route: `Re ρ > θ` is excluded by the hypothesis, read through §1.1. The *Needs:* line replaces
  Layer 7 and `LFunction_ne_zero_of_one_le_re` by `differentiableAt_LFunction`, `LFunction_modOne_eq`
  and `riemannZeta_one_ne_zero`.

The same citation appeared in three more places, all repaired:
- §10.7 route: "zero-free right of `1` (Euler product and LFunctions Layer 7)" → the Euler product on
  `Re s > 1`, which is also the hypothesis of §1.3. Its *Needs:* line drops Layer 7.
- §7.2 Check: `Re s > 1` comes from the Euler product and `Re s = 1` from Layer 7, whose hypothesis the
  nonprincipal members of `𝒳` meet.
- Layer 11 Dependencies now lists LFunctions Layer 5.

## Checks

- **Elaboration.** `lake env lean packages/QuasiRiemannHypothesis/Suggested.lean`, run from the content
  checkout, exits 0. It reports 10 `declaration uses 'sorry'` warnings (lines 81, 95, 104, 111, 123,
  133, 145, 157, 171, 179) and no errors. No TauCeti module had to be built (the object file of
  `TauCeti.NumberTheory.LFunctions.Hecke.Basic` was present).
- **Signatures.** I put `#check @name` for all 11 declarations in one scratch file and elaborated it
  once. Each type agrees with `signatures.md` and with its README statement, up to name qualification;
  no binder changed. Only the module docstring of `Suggested.lean` changed.
- **Dependency check.**

```text
depcheck: 261 roadmaps, 2603 edges, 0 problem(s)
```

  It reports no UPWARD, CYCLE or `moved:` line. The reviews' run counted 2607 edges; the drop is
  consistent with the removed citations of LFunctions Layer 7, but the tool does not show which edges
  went.
- **Citations.** `roadmaps resolve` on the README finds no cross-roadmap citation and no Lean name that
  is unresolved.
- **Ownership.** No new object or target was introduced. The Hecke family, the Fisher–Friedberg
  characters and the loss budget were already owned here, and the open pull requests were not searched
  again. No source passage was copied, and the new descriptions do not reuse the source's lemma titles.

## Adversarial pass on the changed statements

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| §6.2 axiom (conjugate) | `ℚ`, `(4)`, `(3,7)`; `(3,5)`; trivial family | `21`; `60` (two classes); `1·1̄` conductor `(1) ≠ 𝔞𝔟` | holds; `n = 2` unchanged |
| §6.2 axiom, `n = 3` | `F`, `(9)`, `(−2)`, `(7)` | `χχ̄`: `(14)`; `χχ`: `λ ∣` conductor | conjugate needed |
| §6.3 family bullet | `j = 1 < n = 3`; `[𝔞] = [𝔟]` | Lemma 2.3 hypotheses met; `C` in `μ_n` since `𝔟` prime to `𝔠𝔞` | holds |
| §6.3 new Check | `14 mod λ³`; six units | `5`; valuations `2, 1, 1, 0, 0, 0`; `−9 ∈ 9𝓞` | as stated |
| §10.6 budget | `ε_c`; total; wrong `ε_c = ε_b` | `12+3 = 15`; `13+30+3 = 46`; `4.6·10⁻⁵ < 2.08·10⁻⁴`; `18` | holds |
| §1.1 ζ Check | `s = 2`; `s = 1`; `s = 1 + i` | order `0` (`ζ(2) = 1.645`); order `−1`, `Re = 1`; outside | holds |
| §5.5 Check `σ₀ = 1` | trivial `ψ` of `F`, `Re s > 1` | `ζ_F ≠ 0` (Euler product) | holds without Layer 7 |
| §7.2 Check | `𝒳` nonprincipal; zero heights `≤ 3jT₁` | finitely many zeros, `M_j < 1` | holds |
| §10.7 route | `ζ_F` in the primitive family | pole at `1` has `Re = 1`, not `> 1` | hypothesis of §1.3 met |
| §11.1 route | `N = 1`, `ρ = 1`; `K = ℚ(i)` trivial, `Re ρ = 1` | `ζ(1) ≈ −0.977 ≠ 0`; order `≤ 0` by hypothesis (`θ < 1`) | holds |
| Not owned list | `C(7/8)` | `7/8 − 11/16 = 3/16` | agrees with Layer 1 Examples |

## Sources

`sources.toml` gained locators only:
- `openai2026quasiRH`: `§10.5, p. 75`, and Part II, Sections 12–20, pp. 85–196, with Lemmas 13.2–13.4
  (pp. 89–90), 14.2 (p. 94) and 17.5 (p. 120);
- `goldmakherlouvel2013`: `§2, pp. 3-5`.

No new work is cited, and `needs-references.toml` was not written.

## For the maintainer

No name or id that another roadmap cites changed: the sections keep their numbers and no Lean name
changed. One target moved between §6.2 and §6.3: the claim that the Fisher–Friedberg characters form a
family. `overlaps.md` lists no roadmap that cites an id of this one. If a later
QuasiRiemannHypothesisPartII consumes §6.2, it must use the conjugate form of the primitivity axiom.
