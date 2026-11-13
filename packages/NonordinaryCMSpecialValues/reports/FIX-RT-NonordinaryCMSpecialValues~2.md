# FIX-RT-NonordinaryCMSpecialValues~2: repair of red-team round 2 (passes a and b)

Eight findings, eight sections (no two findings are the same defect). Seven applied, one applied differently, none disputed.

## RT-NonordinaryCMSpecialValues~2a/F01 (P2) — applied

Right: at `ϑ = 0`, `0† = ε·0` for `ε = ±1`. §4.3 "every `ϑ` satisfies `ϑ† = ε_ϑ ϑ` for a unique `ε_ϑ`" → "every nonzero `ϑ` …; for `ϑ = 0` none is selected". The API bullet and the `iϑ` Check now assume `ϑ ≠ 0` (cancellation justified); a new Check covers the zero vector.

## RT-NonordinaryCMSpecialValues~2a/F02 (P2) — applied

Right: `ψ = φ³/N` satisfies `ψ((n)) = κ_K(n)n` and is conjugation-equivariant, but `ψ((3+2i)) = (−9+46i)/13`, of type `(2,−1)`. The `IsEquivariantTypeOneZero` docstring "Equivalently (Jia, Property 1) …" now reads "Among characters already of ideal type `(1,0)` … equivalent …", and names `φ³/N`. The Lean statement is unchanged. A new §0.1 Check gives the witness. README line 134 was already correct.

## RT-NonordinaryCMSpecialValues~2a/F03 (P2) — applied

Right: §3.3 used the total ramification of `F_n/H` at `p` (§3.5), while §3.5 needs §3.4, which needs §3.3. §3.3 is now "Splitting of p in the ring class fields" (three new Checks); the product decompositions, Shapiro factors, evaluation and augmentation move to a new §3.6 after §3.5, with a degree count; §5.6 *Needs* gains §3.6.

## RT-NonordinaryCMSpecialValues~2a/F04 (P3) — applied

Right: Completed/ArithmeticDirichletSeries/README.md line 237 (Layer 5) has ideal counts; line 257 (Layer 6, "6.1 Abel summation") has partial summation. "Layers 3 and 5 … partial summation" → "Layer 3, Layer 5 (ideal counts), Layer 6, 6.1 Abel summation" in the scope list, supplier contract, §6.2 *Needs* (route names Abel summation) and Layer 6 dependencies.

## RT-NonordinaryCMSpecialValues~2b/F01 (P1) — applied

Right: with ordinary `|·|`, `Σ_w |1+w|^{−s} = Σ_{x≡1(f)} N(x)^{−s/2}` halves the derivative; directly, `v_3(_aθ_E(α)) = 24/8 = 3`, so the norm generates `(3)^6`. §2.2 now `2 Σ χ(σ) log|σ(_az_f)| = …` (equivalently `log(uū)`), with the reason; Checks `∓12 log 3` → `∓6 log 3` (§§2.2, 2.3, 2.6); §2.3 states (15.6.5) with the `2`.

## RT-NonordinaryCMSpecialValues~2b/F02 (P3) — applied differently

Right: AnticyclotomicLocalUnits (lines 15, 104) and InertAnticyclotomicCMMainConjecture cite NCM.0–NCM.5; none was mapped. A "Former numbering" table follows "How to read the build". Two rows differ from the suggestion: NCM.2 → §§3.1–3.6 (2a/F03), and NCM.5 → §§6.1–6.4, 5.6, 5.7 without §6.5, since the former NCM.5 targets (design/README.md lines 578–637) exclude the parity dichotomy.

## RT-NonordinaryCMSpecialValues~2b/F03 (P3) — applied

Right: `b_ℓ` and its split convention are defined in §4.4, not §4.1. "`b_ℓ = 0` (§4.1)" → "`b_ℓ = 0` (by the definition of `b_ℓ` above)". No other `b_ℓ` reference points to §4.1. The remaining "§4.1" reference in that definition is to the isomorphism `Q_{>0}/N(K×) ≅ W`, which is in §4.1.

## RT-NonordinaryCMSpecialValues~2b/F04 (P3) — applied

Right: KATO04 line 5287 says "at least two prime divisors", and with `f = (3)(2+i)` the old two-case wording left `p^n f`, which has three prime divisors, uncovered. §2.2: "a unit when `f` has two prime divisors" → "at least two distinct prime divisors (… KATO04 lines 5286–5287)". §2.3 has the same wording for `p^n f`.

## Checks run

- Elaboration: `lake env lean packages/NonordinaryCMSpecialValues/Suggested.lean` from the content checkout printed exactly three warnings, "declaration uses `sorry`", at lines 134, 144 and 170 (the three headline theorems). There were no errors. No `TauCeti.*` module needed building.
- Signatures: I put `#check @name` for all ten named declarations in one scratch file (a copy of the module plus the checks) and elaborated it once. Every elaborated type matches the README statement and the worker's earlier transcript: `IsEquivariantTypeOneZero : … [IsCMField K] → (K →+* ℂ) → HeckeCharacter K → Prop`, and `centralValue_parity_dichotomy` keeps `[IsCMField K] [Algebra.IsQuadraticExtension ℚ K] [Fact p.Prime]`, `hp`, `hv`, `hφ`, `hφv`, `hν`, `hνac`, `hνv` and `hϖ`. No binder was lost. Nothing changed, because the only Lean edit is a docstring. `factPrime` is a local instance and was read in place.
- Dependency check, complete output: `depcheck: 239 roadmaps, 2171 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- Citation resolver (`roadmaps resolve` on the README): "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None."
- The added text contains no LaTeX delimiters, machine paths or process words. `design/plan.json` is unchanged, because no new supplier gap is needed. `sources.toml` is unchanged: the only new locators, KATO04 lines 5286–5287 and (3.8.2) on p.140, are in the cached KATO04.

## Adversarial pass on changed and added statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §2.2 Kronecker, ordinary `|·|` (old) | `Q(i)`, `f=(3)`, `a=(5)`, `χ=1` | left `−6 log 3` (valuation: `24·(1/8)=3`, `[K(3):K]=2`, norm `(3)^6`); right `24·(−(log 9)/4) = −12 log 3` | false by factor 2 | factor `2` added |
| §2.2 Kronecker (new) | same | `2·(−6 log 3) = −12 log 3`; `log(uū)` form: `Σ log(σu·conj σu) = −12 log 3` | true | — |
| §2.2 lattice-sum reason | `f=(3)`, `Σ_{x≡1(3)} |x|^{−s}` | each ideal of the trivial ray class has one generator `≡ 1` (units `±1,±i` distinct mod `3`); `∂_s N(x)^{−s/2} = ½ ∂_s N(x)^{−s}` | true | — |
| §2.2 sign (theta vs unit) | same | theta: `+6 log 3`; with factor `2`, `+12 ≠ −12` | inverse needed | Check updated |
| §2.3 finite-layer (15.6.5) with factor 2 | `χ` nontrivial, `K' ⊂ K(p^n f)`, `n ≥ n_f ≥ 1` | `Σχ(σ)log|σ((N(a)−σ_a)y)| = (N(a)−χ(a)⁻¹)Σχ(σ)log|σy|`; `|χ(a)|=1<N(a)` so nonzero; `L_{K,p^nf} = L_{K,pf}` | true | stated |
| §§2.2–2.3 unit when at least two prime divisors | `Q(i)`, `p=7`, `f=(3)(2+i)`; `f=(3)` | three primes: unit; one prime `(3)`: `v_3 = −3 ≠ 0`, not a unit | wording now covers 3 primes | "at least two" |
| §2.6 Check, units against theta | same as §2.2 | `−6 log 3`, `+6 log 3`; formula with `2` holds only for units | consistent with §2.2 | Check updated |
| §2.6 `E_r`, `r ≥ 1` | `Σ_{x≡1} x^{−r}|x|^{−s}` at `s=0` | `x^{−r} = ψ̄((x))N(x)^{−r}`, no `s/2` | no factor 2 there | none |
| §0.1 converse needs type | `ψ = φ³/N`, `x = 3+2i` | `x−1 = −i(1+i)³`; `ψ((n)) = κ(n)³n = κ(n)n`; `ψ((x)) = (−9+46i)/13 ≠ 3+2i` | witness valid | Check, docstring |
| §0.1 converse with type | `φ` type `(1,0)`, rational law | `φ(a)φ(ā) = φ((N a)) = N a`; `φN^{−1/2}` unitary, so `|φ(a)|² = N a`; hence `φ(ā) = conj φ(a)` | true | none |
| §4.3 `ε_ϑ` | `ϑ = 0`; `ϑ ≠ 0`; `iϑ` | `0 = ε·0` for `ε = ±1`; for `ϑ ≠ 0`, `ϑ†` is in the line, so `ε` is unique and `ε̄ε = 1`; `ε_{iϑ} = −ε_ϑ` | nonzero needed | "nonzero" + Check |
| §4.4 `b_ℓ` at split `ℓ` | `ℓ = 11` in `Q(√−7)` | `b_11 = 0` by definition (§4.4), `W̃ = 1` | reference fixed | none |
| §3.3 splitting | `Q(√−23)`, `p=5`; prime above `2`; `Q(√−7)` ray class mod `23`; ring class mod `5` | `(5)` principal: 3 places of `H`. `a²+ab+6b²=2` unsolvable, so `𝔮_2` is inert in `H` (`f=3`). `±5 ≢ 1 mod 23`, so `(5)` is not split in `K(23)`. Degree `6` over `K=H`, so ramified at `5` | true; ring class, not ray class | new Checks |
| §3.3 `[H L[r] : K]` | `r = 0`; `h_K = 3`, `l = 23` | `gcd(h_K, l^r) = 1`, so degree `h_K l^r`; `r=0` gives `H` | true | — |
| §3.6 decomposition | `Q(√−23)`, `p=5`, `n=0`, `r=0`; `n=1` | `[F_0:K] = 72`, local degree `24`, `72/24 = 3 = h_K` factors. `n=1`: `[F_1:H] ≤ #(O_K/25)× = 24·25 = 600`, local degree `600`, so one place per place of `H` | true | moved + Check |
| §3.6 `[M:HL[r]] = [F_n:H]` | `l=23`, `r=1`, `p=5` | `[M:K] = 3·24·23` (§3.2), `[HL[1]:K] = 3·23`, quotient `24` = local degree | one place over each | — |
| Layer 3 order | §3.4 → §3.3 (splitting only); §3.5 → §3.4; §3.6 → §§3.3, 3.5 | no section uses a later one | cycle removed | — |
| §6.2 *Needs* | ArithmeticDirichletSeries lines 237, 257 | Layer 5 = counts; 6.1 = Abel summation | locator fixed | — |
| NCM table | consumer ids `NCM.2/semilocal-splitting`, `NCM.2/inert-frobenius`, `NCM.3/twisted-root-sign`, `NCM.5/central-nonvanishing`, `NCM.5/unramified-cm-coefficients` | §§3.3/3.6, 3.4, 1.3, 6.4, 5.6, all inside the mapped rows | every cited id maps | table added |

## For the maintainer

- ModularIwasawaMainConjecturesPartII README line 312 (open head) already reads the Kronecker formulas of §§2.2–2.3 with the explicit factor `2` for the ordinary absolute value. The repaired §2.2 now agrees with that reading, so nothing there changes.
- Layer 3 now has six sections. §3.3 is renamed "Splitting of p in the ring class fields", and the semilocal character factors are §3.6. No roadmap on main or at an open head cites §3.3 by number or heading. AnticyclotomicLocalUnits and InertAnticyclotomicCMMainConjecture cite the NCM ids, which the new table maps (NCM.2 → §§3.1–3.6).
- The other open pull request of this roadmap carries the older text, which has its own NCM table (NCM.2 → §§3.1–3.5, NCM.3 → §§1.2–1.5). This package supersedes it, and the consumers' NCM ids remain valid through the table here.
- No Lean name changed; only the docstring of `IsEquivariantTypeOneZero` changed.
- Ownership: the repairs add no new construction. §3.6 is existing content moved after §3.5, and Abel summation is imported from ArithmeticDirichletSeries, which is on main. No supplier was added and no notion moved down.
- No text in the reviews or sibling files was treated as an instruction.
