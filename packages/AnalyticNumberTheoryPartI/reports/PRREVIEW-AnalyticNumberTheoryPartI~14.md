# Review of AnalyticNumberTheoryPartI (pull request #1126 at ecf6111)

**Verdict:** needs changes

Two P3 findings, both in lines this head rewrites. This is an incremental re-review of the 10 README lines changed since e2a37ca. `Suggested.lean` is byte-identical to that head (blob `7637d3c` at both). Paths are relative to `TauCetiRoadmap/AnalyticNumberTheoryPartI/`. `tsimerman2018` is the publisher's open PDF of [64] (Annals 187 (2018), 379–390), which is recorded in the roadmap's manifest. `thornerzaman2017` is arXiv:1604.01750v2 of [73], which this review read through a scratch manifest only.

## R01 (P3) — §2.22 restates Tsimerman's misprint: the functional equation pairs `ρ` at 0 with `ρ̄` at 1

**Location.** `README.md:1745` (§2.22; this head rewrites the line): "where differentiating the logarithm of the Artin functional equation bounds `L′/L(1,ρ)+L′/L(0,ρ)` by `O_g(log f_ρ)`".

**Claim.**
- `Λ(s,ρ)=W(ρ)Λ(1−s,ρ̄)` differentiates to `L′/L(0,ρ)+L′/L(1,ρ̄)=−log f_ρ−(gamma terms)`. That is the form this roadmap itself states in §2.44 (`README.md:2104`: "`L′_ρ(0)/L_ρ(0)+L′_(ρ̄)(1)/L_(ρ̄)(1)=−log f_ρ−d(…)`").
- With `ρ` at 1 instead, the sum changes by `2i·Im L′/L(1,ρ)`. The functional equation says nothing about that term.
- The source prints `ρ` at both points (`tsimerman2018` line 224). The new line copies that misprint.
- For self-dual `ρ`, such as the real character `η` of §2.22, the two forms agree. So §2.22's own identity is unaffected.

**Witness.** Take `χ` the odd quartic character mod 5 with `χ(2)=i`. It is a character of `Gal(ℚ(ζ₅)/ℚ)` with `f=5`.
- The `ρ̄` pairing gives `L′/L(0,χ)+L′/L(1,χ̄)=0.805655`, which equals `−log 5+γ+log 2π=0.805655`.
- The `ρ` pairing gives `0.805655−0.176672i`.

**Repair.** Replace the clause with: "where differentiating the logarithm of the Artin functional equation `Λ(s,ρ)=W(ρ)Λ(1−s,ρ̄)` gives `L′/L(0,ρ)+L′/L(1,ρ̄)=O_g(log f_ρ)` (the source prints `ρ` at both points; the two agree for self-dual `ρ`, such as `η`)". Tested on the same `χ`: the corrected sum is the real number `0.805655` that the functional equation predicts. For `η` of `ℚ(ζ₅)/ℚ(√5)` (self-dual, `g=2`, `Q=25`), `ℓ₀+ℓ₁=1.6113096` on both sides (row H).

## R02 (P3) — §3.3's new locator uses `n` for the norm, but the section uses `n` for the degree

**Location.** `README.md:2262` (§3.3; this head rewrites the line): "where the count `n^(o_g(1))` of ideals of norm `n` in a CM field of degree `2g` is used just before Proposition 2.2; … Count split prime-power exponents and compare with `d_n`."

**Claim.** §3.3 uses `n` for the degree of `K` and `m` for the norm. The same paragraph's `d_n` keeps `n` as the degree. Read in the section's notation, `n^(o_g(1))` would mean (degree)^(o(1)), which is not the count meant. The `n` in Tsimerman's text is the norm.

**Witness.**
- `README.md:2260`: "For a degree-`n` number field `K, n≥1`, let `a_K(m)` count nonzero integral ideals of `norm m`".
- `tsimerman2018` line 148: the `n` there is the norm of an ideal of `O_E`.

**Repair.** Write "the count `m^(o_g(1))` of ideals of norm `m` in a CM field of degree `2g`". Tested: §3.3 and §3.4 together give `a_E(m)≤d_(2g)(m)≤C_(2g,ε)m^ε`, which is that count in the section's notation. For `ℚ(i)` (`g=1`), `a(25)=3=d₂(25)` (row J).

## Previous findings

- R01 — repaired: `README.md:2270`: "See [64][R64], Elementary fixed-degree adapter for Tsimerman §2.2, p.382, using the small/large-prime split of the divisor bound". §2.2 is entirely on p.382 (`tsimerman2018` lines 117–151).

## Verified sound

**Gate, build and form.**
- Gate re-run at this head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. The worker's run records `build=0` as well.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AnalyticNumberTheoryPartI'` is empty.
- `lake env lean …/Suggested.lean` exits 0. Its output is exactly 62 lines, all ``declaration uses `sorry` ``.
- One-tactic probe, re-run on a scratch copy: each of the 62 `sorry` lines became `first | (simp <;> done) | rfl | infer_instance | (norm_num <;> done) | trivial | decide`. The errors fall on exactly the 62 probe lines (diffed). Nothing closes, so nothing is padding.
- Binders: the file is unchanged. `signatures.md` lists 112 declarations, 0 flagged with a dropped binder. The previous rounds' `#check @name` pass still applies; it was not re-run.
- Dependency check: `depcheck: 239 roadmaps, 2356 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. ORDER.txt has ZerosOfLFunctions at 48, this roadmap at 49 and AnalyticNumberTheoryPartII at 50.
- Overlaps tool: no other open pull request changes this roadmap, no id is dropped, and nothing is defined only by an open revision. The citations tool's 10 leads are the same `Suggested.lean` names as in the previous rounds.

**Changed passages, one by one, against the source text.**

| README line | Section | Locator now | Source text | Result |
| --- | --- | --- | --- | --- |
| 1652 | 2.17a | [64] proof of Cor. 3.3, p.384; [73] (2-1)–(2-7) | `tsimerman2018` p.384 header line 212. Brauer's theorem on induced characters and Brauer–Siegel give `L(1,ρ)=\|Disc(E)\|^(o_g(1))` at lines 227–230. `thornerzaman2017` (2.1)–(2.7) at lines 203–249: Hecke series and Euler product, `ζ_K`, completed `ξ(s,χ)` with `[s(s−1)]^δ(χ)`, gamma factor with `a(χ),b(χ)`, `a+b=n_K`, functional equation, trivial zeros. With `δ(η)=0` these give the holomorphy at 1 that §2.17a uses | correct |
| 1745 | 2.22 | [64] proof of Cor. 3.3, p.384; [73] (2-3)–(2-7), pp.1140–1141 | Log-differentiation of the Artin functional equation is at `tsimerman2018` lines 223–224. The gamma factor `π^(−(s+1)/2)Γ((s+1)/2)=Γ_R(s+1)` with `b(η)=g`, `a(η)=0` is (2.4) at `thornerzaman2017` line 231 | page correct; pairing R01 |
| 2132 | 2.46 | [64] §2.2, p.382 and proof of Cor. 3.3, p.384 | Brauer–Siegel for `\|Cl(E)\|/\|Cl(E₀)\|` at lines 131–137 (p.382). Brauer–Siegel for `L(1,ρ)` at lines 227–230 (p.384). §2.31e (README 1887) is above, as written | correct |
| 2262 | 3.3 | [64] §2.2, p.382, just before Prop. 2.2 | The `n^(o_g(1))` ideal count is at lines 147–148, and Proposition 2.2 at 149–151. `E` has degree `2g` (lines 121–122) | page correct; notation R02 |
| 2270 | 3.4 | [64] §2.2, p.382 | as above | correct (previous R01) |

**The other [64] locators, rechecked against the same text (untouched, all consistent).**
- §2.2 is p.382: lines 1929 and 3060.
- Theorem 3.2 is p.383: line 186.
- Corollary 3.3 is stated on p.383 (lines 203–205) and its proof runs over pp.383–384 (206–236): lines 1305, 1415, 1941, 2110, 2122.
- The Cauchy-circle step is on p.384 (lines 231–235): lines 1951, 2184, 2194.
- §2.44 (README 2104) states the correct `ρ̄` pairing. Its constant `−d(Γ_R′/Γ_R(1)+Γ_R′/Γ_R(2))=γ+log 2π` (`d=1`) matches the R01 witness `0.805655`.

**Seeded sample.** None of the 15 sampled targets (0.17, 0.23, 0.32, 2.10, 2.24, 2.27, 2.32, 2.33, 2.41, 3.2, 3.6, 3.11, 3.13, 3.21, 3.39; headings at README 566, 644, 849, 1528, 1780, 1810, 1923, 1933, 2037, 2246, 2299, 2373, 2413, 2570, 3276) contains a changed line. §2.32 is in the *Needs:* of the changed §2.46. Its [64] part ("2.2, p. 382; proof of Corollary 3.3, p. 384", line 1929) matches `tsimerman2018` lines 131–137 and 227–230. The README flags no locator as unverified (`grep -i unverified` is empty).

**Dependents of the changed sections.** No section was renumbered. The citing lines are B4 (`:161`, §2.17a), §2.50 (`:2186`, §2.46), the proof-route checks (`:2201`, §3.3–3.4) and §3.27 (`:3062`, §§3.3, 3.4). All still resolve. The changed lines are locators only, so no dependent statement changes.

**Ownership.** The changed lines introduce no object and no supplier citation. The links [R64] (`:3595`) and [R73] (`:3603`) resolve to the reference entries at `:3490` and `:3495`.

**Remarks on untouched text (no change requested).**
- `README.md:2122` (§2.45) cites [64] twice for overlapping ranges ("Proof of Corollary 3.3, p. 384; [64][R64], Theorem 3.2 and proof of Corollary 3.3, pp.383–384").
- [73] (Thorner–Zaman) has no entry in the roadmap's `sources.toml`. [64] now has one (`tsimerman2018`).

**Adversarial table.** Rows G–J and C′ are new, with values computed in scratch scripts. Hurwitz zeta values come from Euler–Maclaurin, `L(1,χ)` from `−q⁻¹Σχ(a)ψ(a/q)`, and derivatives from central differences with `h=10⁻⁴`. Rows A, B, B′, D–F and 1–36 are carried from the previous report (at e2a37ca) for statements this head leaves untouched. Row C there is replaced by C′, and row 28 by H.

| # | Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- | --- |
| G | §2.17a `L_f(1,η)=κ_E/κ_F` | `ℚ(i)/ℚ`; `ℚ(√5)/ℚ`; `ℚ(ζ₅)/ℚ(√5)` | `L(1,χ₋₄)=0.78539816=π/4=κ_(ℚ(i))/κ_ℚ`. `L(1,χ₅)=0.43040894=4logφ/(2√5)`. `κ_E=(2π)²·2logφ/(10√125)=0.33983728`, `κ_F=0.43040894`, ratio `0.78956835`, and `\|L(1,χ)\|²=0.78956835` for `χ` quartic mod 5. Wrong model (`w=4` replaced by `u=2` for `ℚ(i)`): `1.5708≠0.7854` | holds |
| H | §2.22 `ℓ₀+ℓ₁=−log Q+g(γ+log 2π)` | `ℚ(i)/ℚ` (`g=1,Q=4`); `ℚ(√−3)/ℚ` (`Q=3`); `ℚ(ζ₅)/ℚ(√5)` (`g=2`, `Q=125/5=25`) | `1.0287984` vs `1.0287984=γ+log(π/2)`; `1.3164804` vs `1.3164804`; `1.6113096` vs `1.6113096`. `L_f(0,η)=1/2, 1/3, 0.4`, all nonzero. Excluded `χ₈`: `L(0,χ₈)=3.6·10⁻¹⁵`. Wrong gamma sign for `ℚ(i)`: `−3.8014` | holds |
| H′ | §2.22 source paraphrase | `χ` odd quartic mod 5, `f=5` | `L′/L(0,χ)=0.647790−0.088336i`, `L′/L(1,χ)=0.157865−0.088336i`. `ρ̄` pairing `0.805655=−log 5+γ+log 2π`; `ρ` pairing `0.805655−0.176672i` | R01 |
| I | §2.46 `cD_K^(−ε)≤κ_K≤CD_K^ε`, `n=2`, `ε=0.1` | `D=−163, −9967, −99991, 5, 13, 99989` | `κ=0.246069` (`h=1.000000`), `1.227248` (`h=39.000000`), `2.036682` (`h=205.000000`), `0.430409`, `0.662735`, `0.604497`. `κD^0.1∈[0.4095, 6.4405]`, `κD^(−0.1)∈[0.1479, 0.6441]`. `n=1`: only `ℚ`, `κ=1` | consistent (asymptotic, ineffective statement) |
| J | §3.3 `a_K(m)≤d_n(m)` | `ℚ(i)` (`n=2`), cubic subfield of `ℚ(ζ₇)` (`n=3`), `ℚ(ζ₇)` (`n=6`); `m≤3000` | 0 violations in each. `ℚ(i)`: equality at 345 values of `m`, `a(5)=2=d₂(5)`, `a(25)=3=d₂(25)`, `a(9)=1<3`, `a(3)=0<2`. `n=3`: `a(13)=3=d₃(13)`, `a(2)=0`, `a(8)=1<10`. `n=6`: `a(29)=6=d₆(29)`, `a(7)=a(49)=1`, `a(8)=2<56` | holds |
| C′ | §3.4 `d_n(m)≤C_(n,ε)m^ε` | `(n,ε)=(2,1/2)` | Route constant: `p=2`: `sup(a+1)/2^(a/2)=1.5` (`a=2`); `p=3`: `1.1547` (`a=1`); product `1.7321`. `max d₂(m)/m^½` over `m≤3000` is `1.7321` at `m=12` | holds (also previous row C for `(3,1/2), (2,1/4)`) |
| A | §0.11b regularized limit | `η=0.1, 0.01`; `s−1=0.1i, 0.01+0.01i, −0.01` | `−0.558964, −0.575344` against `−γ=−0.577216`; quotient bounded near `−0.18755` | holds (prev. row A) |
| B | §1.8a consumer `φ_s` | `d=log 30`, `s=2+i` | transforms agree to `1.1·10⁻¹⁴`; integrable exactly for `ε<1` | holds (prev. row B) |
| B′ | §1.8a / ExplicitZetaBounds 7.3a | same data | `F(s)=0.3763046204−0.1484734538i` on both sides | holds (prev. row B′) |
| D | §1.8a `kadiri_thm_3_1_q1` citation | Lean statement at `127b50e` | transform, sign and normalization as stated | accurate (prev. row D) |
| E | §0.14 citation | `CompletedXi.lean` | `ξ(0)=1/2`, `ξ(2)=π/6=0.523599` | accurate (prev. row E) |
| F | [116] reference | 29 paths, 16 lines | 29/29 exist; 16/16 sections | holds (prev. row F) |
| 1 | §0.3 | `x=2,…,10⁵` | `θ=0.6931,…,99685.39` against `2.0002,…,100008.1` | holds (prev. row 1) |
| 2 | §0.5 | `x=59, 1000` | `16.2438<17<19.7924`; `155.2433<168<176.2001` | holds (prev. row 2) |
| 3 | §0.25 | `x=10⁸, 10⁶` | `1.7185<2`; `14.959≤27.631` | holds (prev. row 3) |
| 4 | §0.11d | `x=4` | `log 24=3.178054` on all three sides | holds (prev. row 4) |
| 5 | §0.26a | `x=10⁵` | `3.020734` against `3.020686` | holds (prev. row 5) |
| 6 | §0.14 | `s=0,1,2,−1` | `ξ(0)=ξ(1)=1/2`, `ξ(2)=ξ(−1)=π/6` | holds (prev. row 6) |
| 7 | §0.33 | `s=1` | `G(1)=γ`, `R(1)=0` against `1/ζ(1)=−1.0236` | holds (prev. row 7) |
| 8 | §0.1 comparison | `N=3, 4` | `log(4N)≤3 log N` iff `N≥2` | holds (prev. row 8) |
| 9 | §0.34c | `C=12, 15` | `0.7674>3/4`, `0.7467<3/4` | holds for `C≥C₀` (prev. row 9) |
| 10 | §0.9 | `χ₋₄, χ₋₃` | `L(1)log q=1.0888, 0.6642` | holds (prev. row 10) |
| 11 | §0.6 | `T=2` | only `q=1`; first zero `14.1347>2` | holds (prev. row 11) |
| 12 | §1.2 | `y=10⁵` | `M=−48` against `754.4` | consistent (prev. row 12) |
| 13 | §1.5 | `N=2`, `T=1,10,100` | error `3.687, 3.485, 1.145` against `56.55` | holds (prev. row 13) |
| 14 | §1.7 | `σ=4/5` | `QT^(1/2)≤QT^(3/5)` | holds (prev. row 14) |
| 15 | §1.8 | Gaussian | `Φ(1/2)=√π=1.7725` | holds (prev. row 15) |
| 16 | §1.8a critical-line form | `F=e^(−x²)` | `−1.380419` against `−1.380440` | holds (prev. row 16) |
| 17 | §1.8a Laplace form | `φ_s` | `Φ(z)=Φ_F(−z)`; `n⁻¹`-series `0` | holds (prev. row 17) |
| 18 | §1.9 | `χ₀` mod 2 | zero `2πi/log 2` outside `DirichletGRH` | holds (prev. row 18) |
| 19 | §2.2a | `ℚ(i)/ℚ`; `χ₈` | `a₂=2`; `a=3` | holds (prev. row 19) |
| 20 | §2.3a | `K=ℚ` | residues `−1` at 0, `+1` at 1 | holds (prev. row 20) |
| 21 | §2.8 | `ℚ(√−5)` | `a_[1](2)=0`, `a_[𝔭₂](2)=1` | holds (prev. row 21) |
| 22 | §2.9 | `ℚ(i)/ℚ` | `\|C\|/\|G\|=1/2`, `x≥4³⁵` | holds (prev. row 22) |
| 23 | §2.9a | 11 triples | 12 inequalities true (least margin `0.000184`) | holds (prev. row 23) |
| 24 | Zaman digamma Checks | 5 points | `δ(2,0)=−0.5772157`, `δ(1,0)=−1.9635100` | holds (prev. row 24) |
| 25 | §2.10 | `D=−20`, `𝔭₃` | `χ=−1` | holds (prev. row 25) |
| 26 | §2.11 | `χ₋₄` | Gauss sum `2i`, root number `1` | holds (prev. row 26) |
| 27 | §2.16 | `D=−4, −3` | `Λ_std(0)=Λ_std(1)=1, 1/√3` | holds (prev. row 27) |
| 29 | §3.5 | `x=4, 10` | `N₁(4)={2,3}`, `N₂(10)={35}` | holds (prev. row 29) |
| 30 | §3.34 | `x=10⁶`, `u=2` | `0.344299` against `ρ(2)=0.306853` | consistent (prev. row 30) |
| 31 | §3.13 | `X=10⁶` | `216341` against `205606.6` | consistent (prev. row 31) |
| 32 | §3.24a | `s=2` | `6.764520` against `6.762254` | holds (prev. row 32) |
| 33 | §3.23a | README values | six values match | holds (prev. row 33) |
| 34 | §3.2 | `N=24, 8` | `3>2.987`; `2>1.955` | holds (prev. row 34) |
| 35 | §2.15 | `ℚ(√5)` | `κ=0.4304≤2.1874` | holds (prev. row 35) |
| 36 | §2.3a shift clause | `ω\|·\|^u` | `Λ_H(ω\|·\|^u,s)=A^(−u/2)Λ_H(ω,s+u)` | holds (prev. row 36) |

**Library declarations.** The changed lines name no Mathlib, Tau Ceti or PrimeNumberTheoremAnd declaration other than §3.4's `d_apply_prime_pow` and `d_apply`. The previous report checked those at commit `127b50e`, and this head leaves them unchanged.

## Not verifiable

- [73] (Thorner–Zaman, Algebra & Number Theory 11 (2017)): the printed pages pp.1140–1141 and the published `(2-n)` equation style. Only arXiv:1604.01750v2 was read: its (2.1)–(2.7) are on its pp.5–6 (`thornerzaman2017` lines 203–249), with the content §§2.17a and 2.22 use. The sources service refused the MSP PDF at the [R73] link, since msp.org is in no licence class.
- The previous report's list (Jutila, Serre, Neukirch, Rosser–Schoenfeld 1962, Koukoulopoulos, Iwaniec–Kowalski, Montgomery–Vaughan, Titchmarsh, Friedlander–Iwaniec 2018 as uncertified, Kadiri 2005) concerns untouched passages and stands.

## Source issues

- **Misprint** in tsimerman2018 at proof of Corollary 3.3, printed page 384: the source says log-differentiating the Artin functional equation gives `L′/L(1,ρ)+L′/L(0,ρ)=O_g(log f_ρ)`; it should be `L′/L(0,ρ)+L′/L(1,ρ̄)=O_g(log f_ρ)`, the two sums differing by `2i·Im L′/L(1,ρ)`; affects nothing.
