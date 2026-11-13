# FIX-PKG-KloostermanSheavesAndBesselIsocrystals~8

Findings of `REV-PKG-KloostermanSheavesAndBesselIsocrystals~7` (five, all P3). Every finding was verified
against XZ, the supplier's head and the pinned Mathlib before it was applied.

## F01 (P3) — applied

§1.2: "and under external products over products of smooth bases by the tensor comparison" →
"prove that for a smooth `k`-scheme `S` and every `M` on a realizable `Y`, `pr₁^+M` on `Y × S` is ULA over `S`
through `pr₂` (2.8.3(i) with the base changes of Definition 2.8.2, p. 21); on an ind-scheme read on finite-type
supports (2.8.3(iv), p. 21; Remark 2.8.4, p. 22)", naming its consumers (XZ §3.2.2, p. 28; proof of 3.2.5(i), p. 29).
New Check: `j_!K` versus `pr₁^+(j_!K)`.

Evidence: XZ line 999–1007 (Proposition 2.8.3) has no external-product clause. The proof of 3.2.5(i)
(XZ lines 1363–1367) and §3.2.2 (line 1315) use only pullbacks from `Gr × Gr` or `Gr`. The smoothness proof
of 4.1.5(i) (line 1865) uses ULA of `IC_V` via §3.2.2. The new clause follows from 2.8.3(i): `M` is ULA over
`Spec k`. By Definition 2.8.2, its pullback to `Y × S′` is then LA over `S′` for every smooth `S′`, which
includes every `S′ → S`. The ind-scheme sentence was added because `Gr × X` is an ind-scheme (XZ line 1022).
Pattern: "external product" occurs at §1.1 (an operation, correct) and §1.3 (fusion off the diagonal, XZ 3.2.5,
correct); no other ULA claim on products.

## F02 (P3) — applied

Five page ranges: §1.5 "§4.1.2, (4.1.2.1)–(4.1.2.4), pp. 38–39" → "p. 38". §8.2 "§5.3.6, (5.3.6.1)–(5.3.6.4),
pp. 60–61" → "p. 60". §8.5 "Proposition 5.3.5 (pp. 59–60)" → "(p. 59)", twice. §9.1 "Theorem 5.2.2 and §5.2.3,
pp. 56–57" → "p. 57".

Evidence: XZ page markers at lines 1774/1821 (§4.1.2 is lines 1779–1815), 2803/2871 (§5.3.6 to (5.3.6.5) is lines
2805–2869), 2743/2803 (Proposition 5.3.5 and proof are lines 2774–2802), and 2618/2678 (Theorem 5.2.2 at line 2620,
§5.2.3 at lines 2630–2645).

Pattern: I checked every other Xu–Zhu `pp.` range in the README against the page markers: §§0.1, 0.3, 1.2, 1.3, 1.4,
1.6, 1.7, 2.x, 3.1, 3.3, 3.5, 4.4, 5.x, 6.x, 7.1, 7.3, 8.3, 9.2, 10.1–10.6, 11.2, 11.3 (items located in the
cached text, page from the nearest marker). They all agree. The new locators added by F01 (p. 21, pp. 21–22,
p. 28, p. 29) are also checked.

## F03 (P3) — applied

Supplier contract, From TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology:
- RD.3 bullet gains "unit-root F-isocrystals, all of whose pointwise Frobenius slopes are zero (§RD.3.47)".
- RD.5 gains "convergent log-isocrystals on a smooth pair with a strict normal crossings divisor, with their residues
  along its components (§RD.5.101)".
- RD.6 gains "the `L`-function of an overconvergent F-isocrystal … and its rationality … (§§RD.6.4, RD.6.25)".

Evidence: all four headings exist at the supplier's open head ("RD.3.47 Unit-root F-isocrystals", "RD.5.101
Convergent log-isocrystals on a smooth pair", "RD.6.4 The `L`-function of an overconvergent F-isocrystal",
"RD.6.25 Rationality of `L`-functions…"). The descriptions follow what those sections state.

Pattern: I extracted every `RD.x.y` cited outside the contract, with ranges expanded, and set it against the
contract. Exactly these four were missing, and none is missing now.

## F04 (P3) — applied

§10.1: "A *normalized periodic* datum adds `B⁽ⁱ⁾(0) = 1` and …" → "is a family satisfying (a), (b) and either (c) or,
for `p = 2`, (c′), together with `B⁽ⁱ⁾(0) = 1` and `B⁽ⁱ⁺ʳ⁾ = B⁽ⁱ⁾` …; it is *ordinary* or *signed* according as (c) or
(c′) is used". §10.2(iii) and §10.3 now read "ordinary or signed". The §10.1 API bullet now reads "(a), (b) and (c)
or (c′)". The last §10.1 Check gains the instance.

Evidence: XZ line 3060 (Theorem A.5(ii) "under (i) or (i′)") and line 3077 (A.6 uses the hypotheses of A.5(ii)).
I recomputed `F` at `r = 3` and `r = 5`. It satisfies (a), (b) and (c′) with `u(i, 1, m) = (−1)^m` for `s, m < 4`,
`a < 2`, `n < 6`. It fails (c) in 12 cases, all at `s = 1`, `m` odd. `G` satisfies (c). So §10.3 now covers the
series that §10.4 feeds it.

## F05 (P3) — applied

`Suggested.lean`: removed `[IsAdicComplete (IsLocalRing.maximalIdeal R) R]` from `signed_dwork_congruence`, and the
docstring now reads "a discrete valuation ring … complete or not". §10.2 gains: "(i) and (ii) … hold for every
discrete valuation ring of mixed characteristic `(0, p)`, complete or not … completeness is used only in (iii)",
with the reduction to `R̂`. It also gains a Check over `ℤ_(2)`.

Proof: the hypotheses over `R` hold over `R̂`. The quotient of a coefficient by `2^s B⁽ˢ⁺¹⁾(m)` lies in `K`
(`B ≠ 0`, characteristic 0) and in `R̂`, and `K ∩ R̂ = R` because `v̂` restricts to `v`.

Numerical check over `ℤ_(2)`, `K = ℚ`, `s ≤ 3`, `m ≤ 2`, `N ≤ 40`, 492 coefficients per datum:
- the constant `F` at `r = 3, 5`: 0 violations, least valuation 0 (the bound `2^s` is sharp);
- the alternating pair at `n = 1, 2`: 0 violations.

## Checks

- `lake env lean packages/KloostermanSheavesAndBesselIsocrystals/Suggested.lean` (from the content checkout): exit 0.
  The output is five `declaration uses 'sorry'` warnings, at lines 66, 133, 145, 156 and 169, and nothing else.
- `#check @name` for all 11 declarations in one scratch file, elaborated once. Every type matches its README
  statement. The only change is `signed_dwork_congruence`, which now has one instance fewer
  (`IsAdicComplete` gone) and matches §10.2(ii)'s new generality (any DVR of mixed characteristic `(0, 2)`).
  No declaration has lost a needed binder.
- Dependency check, complete output:

  ```
  depcheck: 223 roadmaps, 1983 edges, 0 problem(s)
  ```

  It shows no UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve`: one lead, "KloostermanMomentsAndPotentialAutomorphy §2.6 found nowhere". It is a false
  positive: this is a board package at order 310 (this roadmap is at 366), and its `### 2.6 The Bessel connection
  dictionary` is at line 747 of its README.
- Ownership: no new object was introduced. The new contract lines cite existing supplier sections.
  `design/plan.json` gaps are unchanged.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §1.2 product clause | `S = Spec k` | `pr₁^+M = M`, which is 2.8.3(i) | holds | none |
| §1.2 product clause | `Y = 𝔸¹`, `M = j_!K`, `S = 𝔸¹` | not ULA over `id`; `pr₁^+M` ULA over `pr₂` | holds; shows ULA depends on the morphism | Check added |
| §1.2 product clause | consumers `A ⊠ L_X[1]` on `Gr × X` (XZ 1315); `A₁ ⊠ A₂` on `(Gr × Gr) × X²` (XZ 1363) | both are `pr₁^+` of an object on `Gr`, `Gr × Gr` | covered; ind-scheme via 2.8.3(iv), Remark 2.8.4 | ind-scheme clause |
| §10.1 definition | `B = 1` | (a), (b), (c) hold; period 1 | ordinary datum | none |
| §10.1 definition | `F`, `r = 3`: `B(4)/B(2)` | `1/27 ≡ −1 (mod 4)` against `B(0)/B(0) = 1` | (c) fails; (c′) holds with `u = −1` | instance in Check |
| §10.1 definition | `F`, `r = 3, 5`, `s, m < 4`, `n < 6` | (c′) violations 0; (c) violations 12 | signed datum | none |
| §10.1 definition | `G`, `r = 3, 5` | (c) violations 0; (b) violations 0 | ordinary datum | none |
| §10.2(ii) / Lean, incomplete `R` | `ℤ_(2)`, constant `F` (`r = 3, 5`), alternating pair (`n = 1, 2`) | 4 × 492 quotients, all with `v₂ ≥ 0`; least `0` (constant `F`) | holds without completeness; `2^s` sharp | binder removed |
| `K ∩ R̂ = R` | `x ∈ K` with `v̂(x) ≥ 0` | `v̂∣_K = v`, so `v(x) ≥ 0` | holds for every DVR (`R → R̂` injective by Krull) | none |
| Supplier contract RD.6.25 | `E = O_X` | `Z(𝔾_m, t) = (1 − t)/(1 − qt)` at the supplier | consistent with what §§11.2 and 11.5 consume | none |

## Maintainer notes

- No name that another roadmap cites changed. `signed_dwork_congruence` keeps its name, and its signature is weaker
  in hypotheses only.
- No supplier gap was added or changed.
- No suspicious instruction was found in the review text.
