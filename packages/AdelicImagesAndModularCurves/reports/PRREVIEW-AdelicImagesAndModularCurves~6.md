# Review of AdelicImagesAndModularCurves (pull request #1727 at e4f956a)

**Verdict:** accepted

This was an incremental re-review of the 104 lines that changed since 07264a8. Both findings of the previous review are repaired, the repairs introduced no new defect, and no finding remains. The gate passes. The new mathematics in 6.4 (the explicit functions `τ`, `σ` on `X₀(21)` and `X₀(27)`, their cusp orders, the two relations and the substitutions) was recomputed exactly. A slip in Ligozat's table (4.2.4) turned up and is recorded under Source issues. The README already works around it.

## Previous findings

- R01 — repaired: `README.md:2693–2716`, `2817–2818`: “two modular functions `τ, σ` for `Γ₀(N)`, Fricke's functions of Ligozat's §4.1, given here by formulas in eta quotients”; `σ := u − u ∘ W₂₁`; Check “`σ(z₀) = −σ(z₀) = 0`”. Degree counts replace the `j(z)`, `j(Nz)` step.
- R02 — repaired: `README.md:1576–1579`, `2006–2012`, `2045–2056`: “With CM, some member of `adelicImage E` is commensurable with some member of `adelicImage E'` exactly when `End(E_{K̄}) = End(E'_{K̄})` … when they agree not every pair is (the last Check)”. The description uses the same quantifiers.

## Verified sound

**What changed and how it was checked.** The diff touches nine places in `README.md` and nothing else:
- the MC2 contract line (`364–370`) and the supplier-table row (`515`);
- the 3.3 Invariance bullet (`1573–1580`);
- the 4.5 Isogenous-curves bullet (`2005–2017`) and a new rejection Check (`2045–2056`);
- the 6.4 `X₀(21)`/`X₀(27)` model targets (`2692–2732`), the 6.4 *Needs:* line (`2789–2793`) and three new 6.4 Checks (`2817–2830`);
- the Ligozat reference (`3324–3326`).

`Suggested.lean` is unchanged since 07264a8. Nothing outside the folder changed: `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AdelicImagesAndModularCurves'` is empty.

**Gate, dependency check, elaboration.**
- The gate, rerun at this head, prints `… depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, every count `0`. The targeted build is the worker's (`build=0`).
- The dependency check printed `depcheck: 233 roadmaps, 2263 edges, 0 problem(s)`: no UPWARD or CYCLE line. Positions in the merge order: ModularCurvesPartII 71, this roadmap 357. ModularForms and AlgebraicCurves are on main. The new citations (MC2 §§8.2, 9.3) point earlier.
- `lake env lean TauCetiRoadmap/AdelicImagesAndModularCurves/Suggested.lean` gives 25 `declaration uses 'sorry'` warnings and no other output.
- The worker's signature list flags one lead, the same as last round: `adelicTateModule` omits `[CharZero F] [IsSepClosed K]`. The carrier needs neither, and `finrank_adelicTateModule` carries both.
- The one-tactic probe and the headline list are carried from the review at 07264a8, since the Lean file is unchanged: all 25 probe sites fail, and the docstring names the headlines that are not statable.

**Adversarial pass.**

New rows, for the statements this diff changes. All values were computed this round: “exact” means exact power-series arithmetic over `ℚ` to `q⁴⁹`.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 3.3, 4.5 without CM: every member commensurable with every member | open `H`, `H'` in `GL₂(Ẑ)` (4.4) | `[H : H ∩ H'] ≤ [GL₂(Ẑ) : H'] < ∞`, both ways | holds |
| 4.5 with CM, orders agree, some pair | `E = E' : y² = x³ − x`, `φ = [2]`; general `A ∈ (F ⊗ 𝔸_f)ˣ` | `A = 2I` commutes, `ρ_{E'} = ρ_E`; `A` commutes with `C_𝒪(ẑ)`, so both members contain `ρ_E(G_{KF})` with index `≤ 2` | holds |
| 4.5 new Check: not every pair | `g_ℓ = [[1,1],[0,1]]`, `𝒪 ⊗ ℤ_ℓ = {[[x,−y],[y,x]]}` | `g² = [[1,2],[0,1]]` needs `y = 0`, `−y = 2`: impossible for every `ℓ`, `ℓ = 2` included; `[N : C] = 2`, so `g_ℓ ∉ N_𝒪(ℤ_ℓ)`; `[H : H ∩ gHg⁻¹] ≥ 2^k` | holds |
| 4.5 orders differ, no pair | `x³ − x → x³ − 11x − 14` | multiplier rings `ℤ₂[i]`, `ℤ₂[2i]`, discriminants `−4`, `−16` | holds |
| 6.4 `τ` at `N = 21` (MF §0.2 criterion) | `r = (3:2, 7:2, 1:−2, 21:−2)` | `Σδr = −24`, `Σ(21/δ)r = −24`, `m = 1`; orders at `∞, 0, 1/3, 1/7`: `−1, −1, 1, 1`; `q⁻¹ + 2 + 5q + 8q²` (exact); `W₂₁` constant `7·3/21 = 1` | holds |
| 6.4 `u`, `u ∘ W₂₁` | `r = (3:3, 7:1, 1:−1, 21:−3)`; image `(3:1, 7:3, 1:−3, 21:−1)` | `Σδr = −48, 0`; `m = 1/49, 49`; orders of `u`: `−2, 0, 2, 0`; constant `7^{3/2}3^{1/2}/21^{1/2} = 7`; `u = q⁻² + q⁻¹ + 2 + 0·q`, `u∘W = 7 + 21q + 63q²` (exact) | holds |
| 6.4 `σ² = F₂₁(τ)` | `σ = u − u∘W` | `σ = q⁻² + q⁻¹ − 5 − 21q − 61q²`; `σ²` from `q⁻⁴` to `q⁰`: `1, 2, −9, −52, −139`; `σ² − F₂₁(τ) = 0` (exact) | holds |
| 6.4 `F₂₁` against Ligozat | table (4.2.4), row 21, p. 44 | `(a, b, c, d, e) = (1, −6, −17, −6, 1)` on the printed page | agrees |
| 6.4 `N = 21` substitution | README formulas against Ligozat (4.2.5), p. 45 | `(2y+x+21)/(2(x−5)) + 3/2 = (y+2x+3)/(x−5)`; `9/4 + 10 − 61/4 = −3`; `y² + xy − x³ + 4x + 1` reduces to `0` mod `σ² − F₂₁(τ)` | holds |
| Check `σ(i/√21) = 0` | `q = e^{−2π/√21} = 0.253827` | `τ(z₀) = 8.169090`, `(3 + 2√7 + √(33+12√7))/2 = 8.169090`, `σ(z₀) ≈ 6·10⁻¹⁵`; real roots `8.169, 0.122, −0.586, −1.704` | holds |
| Check invariants and Jacobian | `F₂₁`; `[1,0,0,−4,−1]` | `I = 193`, `J = 1150`; `c₄ = 193`, `c₆ = 575`; `27I = 5211`, `27J = 31050 = 54c₆`; `x = 5` gives `y ∈ {8, −13}`, `y + 2x + 3 = 21, 0` | holds |
| Identification with Ligozat's `τ, σ` at `N = 21` | `τ_L = τ + b`, `σ_L = cσ` | leading terms `q⁻¹`, `q⁻²` (§4.1(i), p. 41), so `c = 1`; `F₂₁(T + b)` has `T³`-coefficient `−6 + 4b`, so `b = 0` | holds |
| 6.4 `τ` at `N = 27` | `r = (9:3, 1:−3)`, factor `9` | `Σδr = 24`, `Σ(27/δ)r = −72`, `m = 27²`; orders at `0, ∞, 1/9, 2/9, 1/3, 2/3`: `−3, 1, 1, 1, 0, 0`; `9q + 27q² + 81q³` (exact) | holds |
| 6.4 `σ` at `N = 27` | `r = (3:4, 1:−3, 9:−1)`, factor `3` | `Σδr = 0`, `Σ(27/δ)r = −48`, `m = 9`; orders `−2, 0, 0, 0, 1, 1`; `3 + 9q + 27q² + 54q³` (exact); not on `Γ₀(9)`: `Σ(9/δ)r = −16` | holds |
| 6.4 `X₀(27)` relation and models | `σ³ − 9τ² − 27τ − 27` | `0` (exact); `gcd(3, 2) = 1`; `(3τ+4)² + (3τ+4) = 9τ² + 27τ + 20 = σ³ − 7`; `(24τ+36)² − (4σ)³ + 432 = 0`; Ligozat (4.2.5) row 27: `τ = (y + 1/2)/3 − 3/2`, so `y = 3τ + 4`; (4.2.7)(iii): `dσ/(6τ+9) = dx/(2y+1)` | holds |
| Check `N = 27` points | `q = 0`; `τ = −3` | `(3, 4)`: `20 = 20`; `(3, −5)`: `20 = 20`, `σ³ = 27 = 81 − 81 + 27`; cusp-order sums `−3+1+1+1 = 0`, `−2+1+1 = 0` | holds |
| “the form of the row `N = 27` of (4.2.4)” | rows of the second list at `q = 0` | `20: 25 = 25`, `24: 36 = 36`, `32: 16 = 16`, `36: 9 = 9`, `27: 9 ≠ −432` | README wording correct; source slip (below) |

Carried from the review at 07264a8 (same values, statements untouched; the rows for 4.5 isogenous curves and 6.4 Fricke's functions are replaced above):

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 0.3 exceptional preimages | `G_{A₄}(5)`; `G_{S₄}(13)` | `480/48 = 10`, det `{1, 4}`; `2184/24 = 91`, `13 ≡ −3 mod 8` | holds |
| 0.3 Cartan orders | `N = 13`, `15` | `26208/336 = 78`, `26208/288 = 91`; `192`, `64` | holds |
| 0.2 level of `±H` | `{g ∈ Γ(2) : g₁₁ ≡ 1 mod 4}` | levels `4`, `2` | holds |
| 1.2 genus | `Γ₀(11)`, `Γ₀(13)`, `Γ₀(26)`, `Γ₀(22)`, `Γ₀(23)` | `1`, `0`, `2`, `2`, `2` | holds |
| 1.3 cusps | `Γ₁(11)`, `Γ₁(13)`, `Γ₀(9)`, `X_arith(5)` | `(10, 5, {1⁵, 5})`; `(12, 6, {1⁶, 6})`; `(4, 2, {1, 1, 2})`; `(12, 2, {1, 1, 2, 4, 4})` | holds |
| 1.4 comparison | `Γ(2)`; `Γ₁(3)` | `1 + 6/12 − 3/2 = 0`; degree `4`, not `8` | holds |
| 2.1 normaliser of `C_s(2^k)` | `k = 1, 2, 3` | `6, 32, 128` against `2, 8, 32` | holds |
| 2.2 `ℓ = 2` | lifts of `S`, `T` to `SL₂(ℤ/8)`; index-two subgroups of `GL₂(ℤ/8)` | all generate 384 elements; 7 subgroups, 4 onto `GL₂(ℤ/4)` | holds |
| 2.2 lifting route | `ℓ = 5`; `ℓ = 3` | `c = 10 ≡ 0`; `[[1, 1], [−3, −2]]³ = I` | holds |
| 2.4 commutators | `[diag(a,1), u_y]`, `[s, t]` | `[[1, (a−1)y], [0, 1]]`; `[[1, −1], [1, 0]]` | holds |
| 2.6 twists | `S_χ`; `Γ₀(3)` with `ψ·(χ_q ∘ det)` | `−I ∈ H₁ ⟺ −I ∈ H₂`; `ψ(−I) = −1` | holds |
| 2.7 isogeny orbits | `⊤` at `N = 2`; `Γ₀(9)` | `{(1,1,1), (2,1,1)}`; one fixed cyclic subgroup of order 9 | holds |
| 2.8 Gassmann | `C_s⁺(13)`, `C_ns⁺(13)` | indices `91 ≠ 78` | hypothesis discriminates |
| 3.4 level and entanglement | `Γ₀(2) ×_{ℤ/2} Γ₀(3)` | level `6`, index `24`, entanglement `2` | holds |
| 3.6 torsion growth | degrees `< 24` | 16 degrees remain | holds |
| 4.3, 4.4 steps | `K = ℚ(ζ₇)`, `ℓ = 7`; `ℓ' < ℓ₀ ≤ ℓ` | image in `SL₂(𝔽₇)`; `ℓ ∤ ℓ'^a(ℓ'² − 1)` | holds |
| 5.1 components | `X(5)`; `det⁻¹(ker mod 3)` | `4 × 60 = 240`; total degree `2` | holds |
| 5.2 fine case | `Γ₁(3)` | `diag(1, −1)` fixes `e₁`, twist fixes `e₂` | holds |
| 5.3 `C_ns⁺(13)` | 13 discriminants | `(D/13) = −1` for `−7, −8, −11, −19, −28, −67, −163` | holds |
| 5.4 bounds and BELOV step | Abramovich; `ℓ = 5`, `7` | `ℓ ≥ 914`; `PGL₂(𝔽₅) ≅ S₅`; `168 ≠ 60` | holds |
| 5.5 fibre product | `Γ₀(2) ∩ Γ₀(3)` | `12 = ψ(6)`; twisted `24 ≠ 12` | holds |
| 5.8 bound | `X₀(11)` | `p + 1 > 2√p`, places `⊆ {∞, 2, 3, 11}` | holds |
| 6.1–6.3 | `ℤ[i]`; `11.a`, `14.a`, `15.a`; `y² = x³ − x` | degrees `2`, `5`; `25`, `18`, `16`; `3` against `2` | holds |
| 6.4 `X₁(N)` cusps and models | `N = 14, 15, 16, 18`; Reichert (v), (vii) | `(12, 6)`, `(16, 4)`, `(14, 6)`, `(16, 6)`; disc identities; six points each | holds |
| 6.4 genus-one models | four Weierstrass equations | `Δ = −28, −15, 3969, −19683` | holds |
| 6.4 `N = 25` | `{±1, ±7}` | index `5`; 14 cusps, 5 rational | holds |
| 6.5 class sizes | products of trees | degrees in and out of Kenku's set as listed | holds |
| 7.3 Mitchell, `ℓ = 5` | `|Sp₄(𝔽₅)| = 9360000` | indices `325, 300, 9750, 6500` | holds |
| `mazur_torsion`, `mem_commutator_iff` | `ℤ/16`, `(ℤ/2)³`; `GL₂(𝔽₂)` | excluded up to isomorphism; 3 elements with `x³ = 1` | holds |

**Source sample in the changed passages.** Of the seeded targets, only 3.3 and 6.4 fall in the changed text. The others are untouched and carry the previous review's verification.
- 3.3 now cites only 4.5, and was checked above.
- 6.4 was checked against Ligozat's printed pages, rendered from the cached scan:
  - §4.1 (i)–(ii), p. 41: `σ = q⁻² + O(q⁻¹)`, `τ = q⁻¹ + O(1)` at `N = 21`; `σ = 3 + 9q + O(q²)`, `τ = 9q + O(q²)` at `N = 27`. These equal the README's leading terms.
  - (F_N), Lemma 4.1.1 and its Corollary, p. 42 (ligozat1975 lines 1269–1289).
  - Table (4.2.4), p. 44: row 21 is `(1, −6, −17, −6, 1)`; row 27 is `(0, 1, 0, 0, −432)`.
  - (4.2.5), p. 45: rows 21 and 27, which equal the README's substitutions.
  - Table (4.2.6), p. 45: rows 21 `(1, 0, 0, −4, −1)` and 27 `(0, 1, 0, 0, −7)`.
  - (4.2.7)(iii), p. 45.

  Every locator in the 6.4 header and the reference entry is at the page stated.

**Supplier citations resolved this round.**
- ModularCurvesPartII, at the head of its open pull request:
  - §8.2 (`gammaZeroRationalFunctionField`: the function field of `X₀(N)_K` is `K(j(q), j(q^N))` for `N` invertible in `K`, so for `K = ℚ` and `K = ℂ`; `qExpansionFricke` sends `j(q^d)` to `j(q^{N/d})`).
  - §9.3, second paragraph: the cyclic-quotient involution of `X₀(N)_K` acts on the function field by `qExpansionFricke`, is defined over `K` and carries `∞` to `0`.
  - §6.1 (`compactModularUniformization`).
- ModularForms §0.2 on main (l.397: `η(−1/τ) = √(−iτ)η(τ)`; l.446–466: the Γ₀(N) criterion with `χ(d) = ((−1)^k m/d)` and the cusp-order formula at l.454, in the local parameter of width `N/gcd(d², N)`).
- AlgebraicCurves 12C on main (l.1610).
- The analytic eta quotients enter `ℂ(X₀(N))` through 5.1, which is on 6.4's *Needs:* line and whose genus bullet (`README.md:2089–2091`) consumes MC2 §6.1.
- The rationality step (“linearly independent over `ℚ` stay so over `ℂ`”) is the right lemma: a `ℂ`-relation `f·Q(j, j_N) = P(j, j_N)` among series in `ℚ((q))` has a rational solution with `Q(j, j_N) ≠ 0`.

**Ownership.** No other roadmap identifies `X₀(21)` with `y² + xy = x³ − 4x − 1` or `X₀(27)` with `y² + y = x³ − 7`, or uses the eta quotients of the route. I searched main and the open heads by object with `roadmaps grep` (`x³ − 4x − 1`, `x³ − 7`, `η(9z)`, `η(21z)`, `T⁴ − 6T³ − 17T²`). SatoTateGroups (its README l.2859) names `y² + y = x³ − 7` as the CM class `27.a` only. Overlaps: none listed.

**Remarks on untouched text (no change asked).**
- The tool-generated `depends-on` block of the description does not list ModularCurvesPartII, a supplier still in an open pull request. It is earlier in the merge order, so the dependency check is clean.
- The board manifest's `ligozat1975` locator does not mention table (4.2.4), p. 44, which the README now cites.

## Not verifiable

- Fricke 1922 (the source of Ligozat's functions and table (4.2.4)): not read. The README's route no longer depends on it, since every relation it uses was recomputed above.
- Carried unchanged from the previous review, none touched by this diff:
  - Prasad–Rajan 2003 Cor. 4 is paywalled.
  - Serre, *Abelian ℓ-adic representations*, is a book.
  - Mitchell 1914 and Bray–Holt–Roney-Dougal 2013 were not fetched.
  - Kenku 1982, Mazur 1978, Lang–Trotter 1976, Zywina 2010/2015, Chen 1998, de Smit–Edixhoven 2000, Baran 2014, Balakrishnan–Dogra–Müller–Tuitman–Vonk 2019, Banwait–Cremona 2014, Clark–Cook–Stankewicz 2013, Abramovich 1996, Khare–Wintenberger 2009, Serre 1987, Sutherland 2016/2021, Jones 2010 and the Experiment. Math. Lemma 2.11 were not fetched.
  - `kubert1976` is waived.
  - The LMFDB data of worked examples 5–9 were not checked against the database.
- The previous review's item on ligozat1975 line 1264 (garbled `q`-expansions at `N = 27`) is resolved: the printed p. 41 reads `σ = 3 + 9q + O(q²)`, `τ = 9q + O(q²)`.

## Source issues

- **Error** in ligozat1975 at (F_N), p. 42, with table (4.2.4), row `N = 27`, p. 44: the source says `σ² = F₂₇(τ)` with row `(0, 1, 0, 0, −432)`, i.e. `σ² = τ³ − 432`, false for its own `σ = 3 + O(q)`, `τ = 9q + O(q²)`; it should be `σ³ = 9τ² + 27τ + 27`, as its (4.2.5) and (4.2.7)(iii) force, with `Y² = X³ − 432` for `X = 4σ`, `Y = 24τ + 36`; affects nothing.
