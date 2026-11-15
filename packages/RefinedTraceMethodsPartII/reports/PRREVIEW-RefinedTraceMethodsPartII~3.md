# Review of RefinedTraceMethodsPartII (pull request #2410 at 004cc58)

**Verdict:** accepted

## Previous findings

- R01 — repaired: "over a perfectoid ring P mapping onto S, the absolute Nygaard filtration of `S[x]/x^e` agrees with the relative one over the perfect prism `(A_inf(P), (d))` … (PrismaticCohomologyPartII §§3.15, 4.19, 4.30)". §4.30 is also added to the §7.2 *Needs*, the Layer 7 Dependencies and the supplier contract (line 145).
- R02 — repaired: "(sulyma-slopes Theorem 1.1 and Remark 1.3, lines 43 and 52; bouis-motivic Theorem 3.9 with Corollary 3.2, lines 263 and 157)".

## Verified sound

| Target | Instances | Values computed (roadmap side / check side) | Result |
|---|---|---|---|
| §7.2 Nygaard step (R01) | `(A_inf(P),(d))`, R = `S[x]/x^e` over Ā = P | §4.30(1): `Fil_NΔ_R{n} ≃ Fil_N F*(Δ_{R/A}{n})` for animated R over Ā; §3.15 gives `gr^n_N Δ^{(1)} ≃ Fil_n^conj Δ̄{n}` | holds |
| §7.2 perfect-prism hypothesis | perfectoid P versus Breuil–Kisin `(𝔖,E)` | φ is bijective on `A_inf(P) = W(P^♭)`, so §4.30(1) applies. For a non-perfect prism §4.30 gives only the map | holds |
| §7.2 degree bound | m = 0, 1, m ≥ 2 | L = dx (free, degree 0) plus flat degree-1 part; `∧^mL` is in homological degrees [m−1, m], so `∧^mL[−m]` is in cohomological degrees [0,1] | holds |
| §7.2 char p specialisation | k perfect, d = p | `(W(k),(p))` is perfect; §4.30(1) gives the crystalline Nygaard filtration, which agrees with the §4.23 route | holds |
| §7.2 syntomic form, bouis locator (R02) | any R (Cor. 3.2), perfectoid R with i ≥ 1 (Thm 3.9) | Cor. 3.2: relative `ℤ_p(i)^mot ≃` relative BMS syntomic. Thm 3.9: `≃ (W_{ei}/V_eW_i)[−1]`. Composite = README statement, with i ≥ 1 | holds |
| §7.2 syntomic form, degenerate | e = 1; i = 0 | `fib(ℤ_p(i)(R) → ℤ_p(i)(R)) = 0` = `W_i/V_1W_i`; for i = 0, étale `ℤ_p` is nil-invariant and `W_0 = 0` | holds |
| §7.2 syntomic form, 𝔽₂ | e = 2, i = 1 | `(1+x𝔽₂)[−1]` = ℤ/2[−1]; `W_{{1,2}}(𝔽₂)/V_2W_1 = ℤ/4 / 2ℤ/4 = ℤ/2` | holds |
| §7.2 syntomic form, O_C | e = 2, i = 1, p odd and p = 2 | p odd: `W_{{1,2}} = O_C × O_C`, V_2 hits the 2-factor, quotient O_C. p = 2: `W_2(O_C)/V(O_C) = O_C`. Relative `G_m^∧ = 1+xO_C ≅ O_C` | holds |
| §1.3 (sample, cited by changed *Needs*) | (a,b,r,p) = (2,3,0,2), m′ = 1, 5 | ℓ vanishes at 1, 2, 4 and ℓ(8) = 1, so s = 3 and h = min{3,1} = 1. ℓ(5) = 1, so s = 0. Total 1 = #T(2,3,0) | holds |
| §3.4 (sample) | R = 𝔽_p, n = 2 | `π_0 = A_inf/(d·d̃_2) = ℤ_p/p³ = W_3`, against hn-cusp line 304 `W(k)[t,x]/(tx−p, p^u t)` in degree 0 = `W_{u+1}` | holds |
| §7.1 (sample) | 𝔽_p, e = 2, n = 1; k = 1 with p = 2 and p odd | n = 1: `ΣTHH(𝔽_p)` with π_1 = 𝔽_p. p odd: `V_{2,1}` is a unit, cofibre 0. p = 2: V is ℤ/2 → ℤ/4, ×2, cofibre π_0 = ℤ/2 | holds |

The rows for statements and headline theorems that the diff does not touch stand as in the previous review, of 8f5975b.

- Source locators checked against the text: 12 locators in 5 sources. bouis-motivic lines 157–162 and 263–268; hesselholt-axes line 41; hn-cusp lines 43–57 and 294–311; riggenbach-double lines 507, 517 and 668; riggenbach-trunc lines 575 and 889. The sampled targets §1.3, §3.4 and §7.1 are cited by the changed *Needs* line, and all three were checked. The other twelve sampled targets lie outside the changed passages.
- Cross-roadmap citations resolved: 25. All 23 PrismaticCohomologyPartII ids on line 145 exist at its open head (§§3.6, 3.9, 3.10, 3.15, 3.19, 3.20, 3.24, 4.4–4.10, 4.17–4.19, 4.22, 4.23, 4.25, 4.29, 4.30, 4.31). CrystallineCohomology Layer CR.2 and DerivedDeRhamCohomology Layer 5 are now on main and also resolve. The notation `(d)` is defined at README line 136.
- Gate re-run at this head: every check passes. Dependency check: `depcheck: 236 roadmaps, 2241 edges, 0 problem(s)`. Nothing changed outside the folder.
- Elaboration: `lake env lean` on Suggested.lean gives three `sorry` warnings (lines 63, 71, 79) and nothing else. Suggested.lean is unchanged since e827f77, and its six elaborated signatures match the earlier `#check @` comparison.
- Declared gaps `bigwitt-ptypical-decomposition` and `perfect-homotopy-invariance`: the diff does not touch them.
- Pull request text: the title, the summary block and the prose agree with this head. The diff adds no supplier roadmap (PrismaticCohomologyPartII already was one) and removes no section or declaration. Remark: the generated `depends-on` block still lists CrystallineCohomology and DerivedDeRhamCohomology as open, though both are now on main.

Overlap check: read RefinedTraceMethods, PrismaticCohomologyPartII and PrismaticCohomologyPartIII (open), and CrystallineCohomology, DerivedDeRhamCohomology and PerfectoidQuotients (main); the third list is empty. The diff adds one object, the comparison of absolute and relative Nygaard filtrations over a perfect prism. Its owner is PrismaticCohomologyPartII §4.30, and this roadmap only cites it. PerfectoidQuotients owns nothing that this roadmap states. The other shared objects and their owners are as in the previous review.

Source independence: changed passages only. 3 passages compared with 4 sources (bouis-motivic, riggenbach-trunc, sulyma-slopes, amm-perfectoid). The longest common run is 5 tokens, the forced formula `R[x]/(x^e),(x)` (bouis-motivic line 159). Otherwise nothing is shared beyond 4-word stock phrases ("concentrated in odd degrees"). The contents were not compared again, because no layer was added, removed or reordered.

## Not verifiable

- None in the changed passages. larsen-mixed and bach-hypersurfaces remain settled as uncertified.

## Source issues

- none

## For the human reviewers

- none
