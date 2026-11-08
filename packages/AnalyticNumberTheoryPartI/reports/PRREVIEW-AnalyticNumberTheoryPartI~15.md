# Review of AnalyticNumberTheoryPartI (pull request #1126 at 6d2ce47)

**Verdict:** needs changes

One P3 finding, in the worked example this head adds to §2.44. Both findings of the previous report are repaired.

This is an incremental re-review of the 6 README lines changed since ecf6111. `Suggested.lean` is byte-identical to that head (blob `7637d3c` at both). Paths are relative to `TauCetiRoadmap/AnalyticNumberTheoryPartI/`. `tsimerman2018` is the publisher's open PDF of [64] (Annals 187 (2018), 379–390).

## R01 (P3) — §2.44's new witness misrounds `Re L′/L(1,χ̄)`, so its two addends do not sum to the stated total

**Location.** `README.md:2110` (§2.44, a line this head adds): "`L′/L(0,χ)=0.647790−0.088336i` and `L′/L(1,χ̄)=0.157864+0.088336i`, whose sum is the real number `−log 5+γ+log(2π)=0.805655` on both sides."

**Claim.**
- The real part of `L′/L(1,χ̄)` is `0.15786454`, which rounds to `0.157865`, not `0.157864`.
- As printed, the two addends sum to `0.647790+0.157864=0.805654`. The line says the sum is `0.805655`.
- The other four printed values are correctly rounded: `0.647790`, `0.088336` (twice), `0.805655` and `0.176672`.
- The example's purpose is that the reader can add the two numbers and recover the right-hand side. As printed, they cannot.

**Witness.** Lerch's formula `ζ′(0,a)=log Γ(a)−½log 2π` and `Σχ(a)=0` give `L′/L(0,χ)=−log 5+Σ_a χ(a)log Γ(a/5)/L(0,χ)=0.6477902834−0.0883361326i`. The functional equation then gives `L′/L(1,χ̄)=0.8056548189−L′/L(0,χ)=0.1578645354+0.0883361326i`. A direct Euler–Maclaurin computation of `L(s,χ̄)` near 1 gives the same value to 9 decimals.

**Repair.** Write `L′/L(1,χ̄)=0.157865+0.088336i`. Tested on the same `χ`: `0.647790+0.157865=0.805655`, which is `−log 5+γ+log 2π=0.8056548` rounded. The sentence's remaining values are unchanged.

## Previous findings

- R01 — repaired: `README.md:1745`: "differentiating the logarithm of the Artin functional equation `Λ_ρ(s)=w_ρΛ_(ρ̄)(1−s)` of §2.44 bounds `L′/L(0,ρ)+L′/L(1,ρ̄)` by `O_g(log f_ρ)` (the source prints `ρ` at both points; the two sums differ by `2i·Im L′/L(1,ρ)`…".
- R02 — repaired: `README.md:2264`: "where the count `m^(o_g(1))` of ideals of norm `m` in a CM field of degree `2g` is used just before Proposition 2.2". This matches §3.3's own `a_K(m)`, with `n` kept for the degree.

## Verified sound

**Gate, build and form.**
- Gate re-run at this head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. The worker's run on this head also records `build=0`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AnalyticNumberTheoryPartI'` is empty. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.
- `lake env lean …/Suggested.lean` exits 0. Its output is exactly 62 lines, all ``declaration uses `sorry` ``.
- One-tactic probe, re-run on a scratch copy. Each of the 62 `  sorry` tactic lines became `first | (simp <;> done) | rfl | infer_instance | (norm_num <;> done) | trivial | decide`. The output has exactly 62 errors, one on each probe line (diffed), and no other error or warning. Nothing closes, so nothing is padding.
- Binders: the file is unchanged since the previous review. `signatures.md` lists 112 declarations, 0 flagged with a dropped binder. The `#check @name` pass of the earlier rounds still applies; it was not re-run.
- Dependency check: `depcheck: 239 roadmaps, 2356 edges, 0 problem(s)`, exit 0, with no UPWARD, CYCLE or moved line. ORDER.txt has ZerosOfLFunctions at 48, this roadmap at 49 and AnalyticNumberTheoryPartII at 50.
- Overlaps file: no other open pull request changes this roadmap, no id is dropped, and nothing is defined only by an open revision. The changed lines introduce no object, no supplier citation and no Lean name. The citations file's 10 leads are the same `Suggested.lean` names as in earlier rounds.

**Changed passages, against the source text.**

| README line | Section | Change | Checked against | Result |
| --- | --- | --- | --- | --- |
| 1745 | 2.22 | locator paraphrase now pairs `ρ` at 0 with `ρ̄` at 1 | `tsimerman2018` lines 212 and 223–224: p.384, log-differentiation of the Artin functional equation, which prints `ρ` at both points. Log-differentiating `Λ_ρ(s)=w_ρΛ_(ρ̄)(1−s)` gives `L′/L(0,ρ)+L′/L(1,ρ̄)=−log f_ρ−d(Γ_R′/Γ_R(1)+Γ_R′/Γ_R(2))`. `L′/L(1,ρ̄)=conj L′/L(1,ρ)`, so the two sums differ by `2i·Im L′/L(1,ρ)`. "of §2.44" resolves to `README.md:2104`, which imports exactly that equation. The prose reference is not a *Needs:* edge: §2.22 still needs §2.22a only | correct; previous R01 repaired |
| 2110 | 2.44 | new worked example | `χ∈F(E)` by §2.6 (`README.md:1411`): `E=ℚ(ζ₅)` is its own normal closure, and `χ(c)=χ(−1)=χ(4)=−1`. Also `[E:ℚ]=4=2g`, `f_χ=5` (§2.2's "over ℚ a primitive character gives its positive conductor") and `d=1`. `L(0,χ)=−B_(1,χ)=−(1/5)(1+2i−3i−4)=(3+i)/5`. Gamma constant `−(Γ_R′/Γ_R(1)+Γ_R′/Γ_R(2))=γ+log 2π`. Values in row K | one digit misrounded: R01 |
| 2264 | 3.3 | `n` → `m` for the norm | `tsimerman2018` lines 117 and 147–151: p.382 has the count of ideals of a given norm, just before Proposition 2.2. Lines 121–122 give `E` CM with `[E₀:ℚ]=g`, so degree `2g` | correct; previous R02 repaired |

**Dependents of the changed sections.** No section was renumbered or restated, so every citing line still resolves:
- §2.31 (`:1912`) and the proof-route checks (`:2203`, `:2209`) cite §2.44 and §3.3–3.4.
- §3.27 (`:3064`) needs §3.3 and §3.4.
- Nothing outside §2.22 itself cites §2.22.

The §2.44 example agrees with §2.22 on the field both use. As an Artin representation of `Gal(ℚ(ζ₅)/ℚ)`, `Ind η` for `η` of `ℚ(ζ₅)/ℚ(√5)` is `χ⊕χ̄`. So §2.22's `ℓ₀+ℓ₁` should be twice §2.44's sum: `2·0.8056548=1.6113096`, which is the value of the previous report's row H for `g=2, Q=25`. Also `Q=D_E/D_F=125/5=25=f_χ f_χ̄`.

**Seeded sample.** Of the 15 sampled targets, only §3.27 ("Uniform bounded-norm ideal count", `:3056`) cites a changed section. The other 14 do not fall in the changed passages or their dependents: 0.5 (`:237`), 0.24 (`:669`), 2.1a (`:1216`), 2.2 (`:1286`), 2.3 (`:1338`), 2.26 (`:1800`), 2.36 (`:1965`), 2.37 (`:1975`), 2.45 (`:2116`; its *Needs:* does not include §2.44), 3.5 (`:2276`), 3.6 (`:2301`), 3.13 (`:2415`), 3.16 (`:2455`) and 3.19 (`:2523`). §§2.2–2.3 were read only to check the new §2.44 example against their normalisation. The README flags no locator as unverified (`grep -i unverified` is empty).
- §3.27, locator "[64], 2.2, p. 382": the ideal count is at `tsimerman2018` lines 147–148, on printed page 382 (line 117). There it is stated for a CM field of degree `2g`. §3.27 states it for every number field of degree `2g`, which §3.3 and §3.4 prove with no CM hypothesis: `a_E(n)≤d_(2g)(n)≤C(g,ε)n^ε`. The number of ideals of norm at most `X` is at most `Σ_(m≤X)C m^ε≤C X^(1+ε)`, uniformly in `E`. Hypotheses, page and statement agree. Values in row L.

**Adversarial table.** Rows K, K′, L and H″ are new, computed in scratch scripts. Hurwitz zeta values come from Euler–Maclaurin (40 terms, 10 Bernoulli corrections; checked against `ζ(2)` and `ζ(0,a)=1/2−a`). Derivatives use five-point differences at `h=0.02, 0.01, 0.005`, which agree to `10⁻⁹`. `L′(0,χ)` was also computed independently from Lerch's formula. All other rows are carried from the previous report (at ecf6111) for statements this head leaves untouched.

| # | Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- | --- |
| K | §2.44 example, `E=ℚ(ζ₅)`, `χ(2)=i` | `ρ̄` and `ρ` pairings | `L(0,χ)=0.6000000+0.2000000i=(3+i)/5`. `L′/L(0,χ)=0.6477902834−0.0883361326i` (Lerch and Euler–Maclaurin agree). `L′/L(1,χ̄)=0.1578645354+0.0883361326i`. `ρ̄` sum `0.8056548189+0i` against `−log 5+γ+log 2π=0.8056548189`. `ρ` sum `0.8056548−0.1766723i`. Printed `0.157864`; correct rounding `0.157865` | identity holds; R01 (one digit) |
| K′ | §2.44 identity, other odd characters | order-6 `χ` mod 7 (`χ(3)=e^(πi/3)`, `g=3`); quadratic `χ₋₇`; `χ₋₄` | mod 7: `L(0)=4/7+(2√3/7)i`; `ρ̄` sum `0.4691826` against `−log 7+γ+log 2π=0.4691826`; `ρ` sum `0.4691826−0.4888703i`. `χ₋₇` (self-dual): both pairings `0.4691826`, `L(0)=1`. `χ₋₄`: both `1.0287984=−log 4+γ+log 2π` | holds; the pairing matters exactly when `χ≠χ̄` |
| H″ | §2.22 vs §2.44 on `ℚ(ζ₅)/ℚ(√5)` | `Ind η=χ⊕χ̄` | `2×0.8056548=1.6113096` against prev. row H `ℓ₀+ℓ₁=1.6113096=−log 25+2(γ+log 2π)` | consistent |
| L | §3.27 `#{𝔞: N𝔞=n}≤C(g,ε)n^ε`, sum `O(X^(1+ε))` | `ℤ[i]` (`g=1`), `ε=1/2`, `X=1000` | `max a(m)/m^½=1.0≤1.7321` (row C′ constant). `a(5)=2`, `a(25)=3`, `a(65)=4=d₂(65)`. Ideals of norm `≤1000`: `787≤Σd₂=7069≤1.7321·Σm^½=36543` | holds |
| J | §3.3 `a_K(m)≤d_n(m)` | `ℚ(i)`, cubic subfield of `ℚ(ζ₇)`, `ℚ(ζ₇)`; `m≤3000` | 0 violations; `a(25)=3=d₂(25)`, `a(13)=3=d₃(13)`, `a(29)=6=d₆(29)` | holds (prev. row J; statement untouched, locator R02 repaired) |
| H′ | §2.22 source paraphrase | `χ` odd quartic mod 5 | now pairs `ρ̄` at 1: `0.805655` real, as in row K | repaired (prev. row H′) |
| G | §2.17a `L_f(1,η)=κ_E/κ_F` | `ℚ(i)/ℚ`; `ℚ(√5)/ℚ`; `ℚ(ζ₅)/ℚ(√5)` | `π/4`; `0.43040894`; `0.78956835=\|L(1,χ)\|²` (recomputed this round: `\|0.8648063+0.2041531i\|²=0.7895684`) | holds (prev. row G) |
| H | §2.22 `ℓ₀+ℓ₁=−log Q+g(γ+log 2π)` | `ℚ(i)`, `ℚ(√−3)`, `ℚ(ζ₅)/ℚ(√5)` | `1.0287984`, `1.3164804`, `1.6113096` on both sides | holds (prev. row H) |
| I | §2.46 | six discriminants | `κD^(±0.1)` within `[0.1479, 6.4405]` | consistent (prev. row I) |
| C′ | §3.4 `d_n(m)≤C_(n,ε)m^ε` | `(2,1/2)` | route constant `1.7321`, attained at `m=12` | holds (prev. row C′) |
| A | §0.11b | `η=0.1, 0.01` | `−0.558964, −0.575344` against `−γ` | holds (prev. row A) |
| B, B′ | §1.8a | `d=log 30`, `s=2+i` | agreement `1.1·10⁻¹⁴`; `F(s)=0.3763046204−0.1484734538i` both sides | holds (prev. rows B, B′) |
| D, E, F | §1.8a citation, §0.14 citation, [116] paths | Lean statement; `CompletedXi.lean`; 29 paths | as stated; `ξ(2)=π/6`; 29/29 exist | holds (prev. rows D–F) |
| 1–5 | §§0.3, 0.5, 0.25, 0.11d, 0.26a | `x=59, 1000, 10⁵, 10⁶, 10⁸` | e.g. §0.5: `16.2438<17<19.7924`, `155.2433<168<176.2001` | holds (prev. rows 1–5) |
| 6–11 | §§0.14, 0.33, 0.1, 0.34c, 0.9, 0.6 | as before | e.g. `ξ(0)=1/2`; `L(1,χ₋₄)log 4=1.0888` | holds (prev. rows 6–11) |
| 12–18 | §§1.2, 1.5, 1.7, 1.8, 1.8a, 1.9 | as before | e.g. §1.5 error `3.687` against `56.55` | holds (prev. rows 12–18) |
| 19–27 | §§2.2a, 2.3a, 2.8, 2.9, 2.9a, digamma, 2.10, 2.11, 2.16 | as before | e.g. §2.9a 12 inequalities, least margin `0.000184`; root number of `χ₋₄` is `1` | holds (prev. rows 19–27) |
| 29–36 | §§3.5, 3.34, 3.13, 3.24a, 3.23a, 3.2, 2.15, 2.3a | as before | e.g. §3.13 `216341` against `205606.6`; §2.15 `0.4304≤2.1874` | holds (prev. rows 29–36) |

**Library declarations.** The changed lines name no Mathlib, Tau Ceti or PrimeNumberTheoremAnd declaration. §2.44's *Needs:* line, which this head does not touch, names `Complex.Gammaℝ`. It was checked in the earlier rounds.

**Remarks on untouched text (no change requested).**
- `README.md:2124` (§2.45) cites [64] twice for overlapping ranges.
- [73] (Thorner–Zaman) still has no entry in the roadmap's `sources.toml`.

## Not verifiable

- [73] (Thorner–Zaman, Algebra & Number Theory 11 (2017)): printed pp.1140–1141 and the published `(2-n)` equation numbering. Only arXiv:1604.01750v2 was read, in the earlier rounds; the sources service refuses the MSP PDF. No changed line depends on a [73] locator beyond what the earlier round checked.
- The earlier list (Jutila, Serre, Neukirch, Rosser–Schoenfeld 1962, Koukoulopoulos, Iwaniec–Kowalski, Montgomery–Vaughan, Titchmarsh, Friedlander–Iwaniec 2018 as uncertified, Kadiri 2005) concerns untouched passages and stands.

## Source issues

- **Misprint** in tsimerman2018 at proof of Corollary 3.3, printed page 384: the source says log-differentiating the Artin functional equation bounds `L′/L(1,ρ)+L′/L(0,ρ)`; it should be `L′/L(0,ρ)+L′/L(1,ρ̄)`, since the two sums differ by `2i·Im L′/L(1,ρ)`; affects nothing.
