# FIX-PKG-ModularityAndLanglandsExtensionsPartII~10

Findings of REV-PKG-ModularityAndLanglandsExtensionsPartII~9 (four, all P3). Only
`packages/ModularityAndLanglandsExtensionsPartII/README.md` changed; `Suggested.lean`, `metadata.toml`,
`sources.toml` and `design/plan.json` are unchanged.

## F01 (P3) — applied

Verified against nt21 Theorem 2.24 (line 1952: the conclusion is only `(σ_n ∘ i_2)(𝒞) ⊂ i_n(ℰ_n(τ̄_n)_{ℂ_p})`), line 1966 (`δ_n` non-critical but not necessarily numerically non-critical) and Corollary 2.28 (lines 2088–2107: classicality at `z′_2` needs its conditions (2), (3)).
§1.1 third Check: "taking `z_2` any classical point recovers (2) … content is non-classical points" → at `z_2` the conclusion is weaker than (2); at another classical `z′_2` only a point of `ℰ_n` with pseudocharacter `Sym^{n−1}`; classicality needs §1.4's hypotheses on `z′_2`; for `n = 3`, ratio `−1` not covered.
Same pattern, Layer 1 Examples: the first bullet ("non-CM … refinement `n`-regular and non-critical") omitted §1.4's local Zariski-closure conditions at both points, numerical non-criticality of `χ_2`, and non-criticality of every triangulation at `z′_2`. It now lists all five conditions of nt21 Corollary 2.28. The second bullet now says that `n`-regularity of `χ′_2` (not every hypothesis) excludes ratio `±1` at `n = 3`. §2.4, the only consumer of §1.4, was reread: its hypotheses match nt21 Theorem 2.33. No change there.

## F02 (P3) — applied

Verified: `μ(x)μ(cx) = μ(N_{E/F}x) = ε_{E/F}(N_{E/F}x) = 1`, since `ε_{E/F}` is trivial on norms; at a complex place `(z/|z|)(z̄/|z|) = 1`.
§5.5 third Check: "`μ μ^c = 1` … is not required" → "`μ μ^c = 1` … follows from the statement" with the computation, plus: a conjugate-orthogonal character (`μ|_{𝔸_F^×} = 1`) also satisfies it, so the restriction to `𝔸_F^×` is what distinguishes the two signs. No other occurrence of `μ μ^c` or "not required" in the README.

## F03 (P3) — applied

Each locator was checked against the page markers of the cached texts (pages are the PDF pages, which agree with the printed headers, for example nt26 line 1664 "36 JAMES NEWTON…"):
- §12.6: nt26 Proposition 4.9 runs lines 1643–1672, and the p. 36 marker is at line 1663. "p. 35" → "pp. 35–36".
- §12.7: the proof of Theorem 4.1 runs lines 1581–1706, and the p. 37 marker is at line 1707. "pp. 34–37" → "pp. 34–36".
- §9.1: reductions (6)–(11) are at nt21b lines 239–255, after the p. 6 marker at line 237. "pp. 5–6" → "p. 6".

Pattern sweep: a script checked the page of every cited heading in nt21, nt21b, nt26, th24, at20, ct17, ct15 and bk05. I then read every flagged "proof of" range by hand. Two more ranges overshot by a page:
- §9.7: the nt21b `p = 2` component argument runs lines 783–857 (p. 18 marker at line 816, p. 19 marker at line 864). "pp. 17–19" → "pp. 17–18", which now parallels the `p > 2` range "pp. 12–13" (lines 570–621).
- §9.6: the nt21b proof of Proposition 2.8 runs lines 858–907. "proof, pp. 17–19" → "pp. 18–19", which now parallels §9.5's "proof, pp. 14–17" (lines 624–781).

The other flagged ranges were confirmed correct:
- nt21 Proposition 7.4: the passages on pp. 86–88 (lines 4217, 4253, 4290).
- nt21 Lemma 2.35: proof on p. 53.
- nt21 Theorem 7.6: pp. 90–91.
- nt26 Theorem 3.2: final step on p. 25.
- nt26 Theorem 4.1: reductions (10)–(16) on pp. 26–27.
- nt26 Proposition 6.1: the claim on pp. 46–48 and the square root on p. 47 (line 2185).
- th24 Theorem 7.6: p. 45 and pp. 46–47.

## F04 (P3) — applied

Summary table, Layer 14 row: "… holomorphy of `L(s, Sym^n f)` in level one" → "… in level one and, away from the level, for non-CM newforms of weight at least `2`". This matches §14.5, the Summary paragraph and the Layer 14 introduction, which already named both statements.

## Checks

- **Elaboration:** `lake env lean packages/ModularityAndLanglandsExtensionsPartII/Suggested.lean`, run from the content checkout, exits 0. The output is two warnings, "declaration uses `sorry`", at lines 98 and 117. No `TauCeti.*` module needed building (the `Satake` object file is present).
- **Signatures:** all four declarations were `#check @`-ed in one scratch file and elaborated once. The types are identical to `scratch/signatures.md`: `[NeZero N]`, `1 ≤ n`, `2 ≤ k`, `¬HasQuadraticSelfTwist f`, the Satake hypotheses (and `¬p ∣ N` in §14.5) are all present. Nothing changed, and they agree with README §§14.4–14.5.
- **Dependency check:** `depcheck: 239 roadmaps, 2280 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **`roadmaps resolve`:** no citation and no Lean name found nowhere.
- **Style:** a scan of the edited text found no LaTeX delimiters, process words or machine paths.

## Adversarial pass on the changed statements

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §1.1 Check 3 (new), at `z_2` | `z′_2 = z_2` | conclusion: `(σ_n ∘ i_2)(z_2) ∈ i_n(ℰ_n)`; (2): `= i_n(γ_n(π_n, χ_n))`, which is classical | the conclusion is strictly weaker, as now stated |
| §1.1 Check 3, ratio `−1` | `n = 3`, classical `z′_2` with `α/β = −1` | `(α/β)² = 1`, so not 3-regular, so §1.4's non-critical branch fails. On an ordinary component `v(α) = 0 ≠ k − 1 = v(β)`, so `α/β ≠ −1`, and the ordinary branch never meets such a point | "not covered" holds |
| Layer 1 Examples, bullet 1 | non-CM form with split ordinary local representation at `p` | local image in a torus, whose Zariski closure does not contain `SL_2`, so Corollary 2.28 (3) fails. The old bullet admitted this point; the new one excludes it | repaired |
| Layer 1 Examples, bullet 2 | `n = 3` | `(χ_1/χ_2)^i ≠ 1` for `i = 1, 2` iff ratio `≠ ±1` | holds |
| §5.5 Check 3 | split place `v`, `x = (a, b) ∈ F_v^× × F_v^×`, `cx = (b, a)`; complex `z = i`; conjugate-orthogonal `μ` | `x · cx = (ab, ab)`, the image of `N x = ab`, so `μ(x)μ(cx) = ε_{E/F,v}(ab) = 1` (`v` split); `(i/1)(−i/1) = 1`; with `μ|_{𝔸_F^×} = 1`, `μ(N x) = 1` | `μ μ^c = 1` always; it does not separate the two signs |
| §5.5 Check 3, `μ²` | `x ∈ 𝔸_F^×` | `μ(x)² = ε_{E/F}(x)² = 1` | holds |
| F03 locators | page markers | nt26 1643/1663/1672 → pp. 35–36; 1581/1706/1707 → pp. 34–36; nt21b 237/239/255 → p. 6; 783/816/857 → pp. 17–18; 858/864/907 → pp. 18–19 | repaired |
| F04 row | §14.5 hypotheses | `k ≥ 2`, non-CM (no quadratic self-twist), factors at `p ∣ N` omitted | row now agrees |

## Ownership and overlaps

No new target, carrier or supplier was introduced, so no ownership question arises. No cross-roadmap citation changed. No name that other roadmaps cite changed.

## For the maintainer

Nothing outside this package is affected. The review's "For the human reviewers" items (the Kazhdan–Lusztig ownership in SmoothRepresentationsOfLocalGroupsPartII, the arrangement of Layers 11–13, the licences, and nt26's published pagination) were left as they are, as instructed.
