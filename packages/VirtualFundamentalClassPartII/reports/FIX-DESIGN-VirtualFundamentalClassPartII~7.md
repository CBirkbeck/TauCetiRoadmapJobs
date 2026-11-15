# FIX-DESIGN-VirtualFundamentalClassPartII~7

Findings of REV-DESIGN-VirtualFundamentalClassPartII~6 (three, all P3). Each was checked against the
cited source lines, the roadmap's own conventions and VirtualFundamentalClass at its open head; all
three hold and are applied.

## F01 (P3) — applied

Verified: behrend-fantechi1997 Definition 3.7 runs over lines 906–917, and its fourth condition
(line 916) asks only that `U → M` be a local immersion. VirtualFundamentalClass §§3.4, 5.1 (`U ↪ M`)
and §9.1 ("local closed embeddings") use closed ones.

Old (Convention 2): "… closed immersion of `U` into a smooth affine scheme (behrend-fantechi1997
Definition 3.7, lines 906–915; …)". New: chart pair of finite type with a closed immersion
(VirtualFundamentalClass §§3.4, 5.1, 9.1); Definition 3.7 (lines 906–917) allows any local immersion
(line 916); the closed ones cover `X`, since an affine scheme of finite type is closed in some `𝔸^n`.
`sources.toml`: "lines 906–915" → "lines 906–917; …line 916…".

Pattern: no other passage of the README or `plan.json` cites Definition 3.7. 8.2's route already
uses a closed immersion `U → W`, so no statement changes.

I did not adopt the reviewer's wording "closed immersions suffice". The closed charts cover `X`, but
they are not closed under the product of local embeddings. For `X = BG`, `U = U′ = Spec k`, the
product chart `G = U ×_X U′ → M × M′` is unramified but not a closed immersion when `|G| > 1`. The
new text claims only that the closed charts cover `X` and are the ones the supplier uses.

## F02 (P3) — applied

Verified. With frames `e_1` on the chart through `0₁` and `e_2` on the chart through `0₂`:
- if `e_1 = t^n·e_2`, the section `e_1` (extended as `t^n·e_2`) has divisor `n·[0₂]`;
- if `e_2 = t^n·e_1`, the divisor is `n·[0₁] = −n·[0₂]`, because `div(t) = [0₁] + [0₂]` (2.3, second
  Check).

Old (6.2, fourth Check): "glued by `t^n` on the overlap". New: names the charts `U_1 ∋ 0₁`,
`U_2 ∋ 0₂`, fixes `e_1 = t^n·e_2`, and gives the section with divisor `n·[0₂]`. It also records the
opposite gluing as a sign witness, `n·[0₁] = −n·[0₂]`. The `plan.json` test `doubledOrigin_class` is
changed to match.

Pattern: no other line bundle on `L` is glued anywhere in the roadmap.

## F03 (P3) — applied

Verified. Take `ℳ = Spec k` and `U = ⊔_ℕ Spec k`. Pulling back `[Spec k]` gives an infinite sum, which
is not in a free abelian group. `U` is not quasi-compact, so it is not a stack of Convention 1.
vistoli1989 line 887 puts every scheme of its §3 at finite type.

Old → new:
- 2.1: "étale surjection `U → ℳ` from a scheme" → "from a scheme `U` of finite type over `k` (one
  exists, …)". It now also says that `U ×_ℳ U` is a scheme of finite type, because the diagonal is
  representable by schemes and quasi-compact. Locator is now "lines 887 and 953–957".
- 2.1: new non-example Check (the infinite atlas).
- 3.1, fourth API bullet: same hypothesis added.
- `plan.json`: the 2.1 statement, its locator, the new test `infiniteAtlas_excluded` (non-example),
  and the 3.1 `flatPullback.descent` statement are changed to match.

Pattern, the same construction elsewhere:
- 2.2: the sheaf `W_* → Z_*` is now stated on the étale site of `ℳ` formed by schemes of finite type
  over `k` (vistoli1989 lines 887, 953–959).
- `sources.toml`: the vistoli1989 `cited_for` for 2.1–2.2 now records line 887.
- 3.5's route ("étale descent of cycles (2.1)") is covered by the new hypothesis, since a
  quasi-separated algebraic space of finite type has an atlas of finite type. No edit there.
- The multiplicity in 2.1 and `ord` in 2.2 are local at a generic point and need no finiteness. No
  edit there.

## Checks run

**Dependency check:**

    candidate: VirtualFundamentalClassPartII is not in the merge order yet; checked as if placed after StableReductionPartII (the intake inserts it when its design is accepted)
    depcheck: 245 roadmaps, 2230 edges, 0 problem(s)

No UPWARD or CYCLE line.

**Other mechanical checks:**
- `plan.json` parses as JSON and `sources.toml` as TOML.
- 33 targets and 128 tests (127 + 1). For every target, the number of README Checks equals the
  number of `plan.json` tests (script).
- No LaTeX delimiters, machine paths or process words in the README (grep).

**Not run:** there is no `Suggested.lean` at the design stage, so there was no elaboration and no
`#check` pass.

**Gate failures:** none were listed.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Convention 2: closed charts cover `X` | `X = BG`; `X = ∅`; `X` affine of finite type `k[x_1..x_n]/I` | `Spec k → BG` closed in `𝔸⁰`; no chart needed; `U = X` closed in `𝔸^n` | holds | new text |
| Convention 2: closed charts not closed under products | `BG`, `U = U′ = Spec k`, `|G| = 2` | `U ×_{BG} U′ = G`, two points → one point of `M × M′`: unramified, not a closed immersion | the reviewer's "suffice" is too strong; not claimed | wording |
| 6.2 `𝓛_n`, `e_1 = t^n e_2` | `n = 0`; `n = 1`; `n = −1` | `0`; `[0₂] ↦ −1` under `A_0(L) → ℤ` (coefficient of `0₁` minus that of `0₂`), nonzero; `−[0₂]`, a pole of order 1 at `0₂` | holds | none further |
| 6.2 opposite gluing | `e_2 = t^n e_1`, `n = 1` | divisor `[0₁] = −[0₂]` by `div(t) = [0₁] + [0₂]` | sign flips, as stated | new text |
| 6.2 obstruction theory | `E = [𝓛_n^∨ --0--> Ω_L]` | `h⁰ = Ω_L`; `h^{−1}(E) → h^{−1}(L_L) = 0` onto; rank `1 − 1 = 0`; `Ob = 𝓛_n` | holds | none |
| 2.1 descent, finite-type `U` | `ℳ = Spec k`, `U = ⊔_ℕ Spec k`; `ℳ = BG`, `U = Spec k`; `ℳ = [𝔸¹/μ₂]`, `U = 𝔸¹` | infinite sum, excluded; `U ×_ℳ U = G`, finite, `[BG] ↦ [Spec k]`; `[Bμ₂] ↦ [0]`, pulls back to `μ₂ × {0}` equally | holds with the hypothesis | R03 |
| 2.1 `U ×_ℳ U` of finite type | `BG`; `L` with doubled origin, `U = 𝔸¹ ⊔ 𝔸¹` | `G`, finite; `𝔸¹ ⊔ 𝔾_m ⊔ 𝔾_m ⊔ 𝔸¹`, finite type | holds | new clause |
| 2.1 new Check, reducedness and dimension | `𝒱 = Bμ₂ ⊂ [𝔸¹/μ₂]`, `U = 𝔸¹` | `𝒱 ×_ℳ U = {0}` reduced, dimension `0 = dim Bμ₂` | holds | none |
| 3.1 descent bullet | `π : Spec k → BG` | `π^*[BG] = [Spec k]`, matches 3.1's first Check | holds | hypothesis added |

## Ownership, sources, overlaps

- No new object, target or supplier was introduced, so no new ownership question arises.
- No source was fetched. The cited lines were read in the cached texts: behrend-fantechi1997 lines
  906–917; vistoli1989 lines 887–894 and 945–971.
- No `needs-references.toml` was written.
- `scratch/overlaps.md` was not changed by this round's edits. No section, layer or target id was
  renumbered or dropped.

## For the maintainer

- No name that other roadmaps cite changed.
- The README and `plan.json` changes are confined to Convention 2, 2.1, 2.2, 3.1 and 6.2.
