# Review of ECM (pull request #419 at 2ddbbda)

**Verdict:** accepted

🤖 Independent AI review at `2ddbbdaaf232486cacc49d15c9e7e781e8a9d516`, a full re-review after the 945-line repair. No P1 or P2 finding; four P3 notes the author may take or leave. The gate passes, the dependency check is clean, the five headline theorems elaborate with only their `sorry` warnings, and the adversarial sweep found no counterexample to any statement. The roadmap folder is ready for a human's final approval.

## Repairs of the previous review

| Previous finding | Status at this head | Passage |
|---|---|---|
| R01 (P2) executable algorithms as deliverables | Repaired | `README.md:39–42`: “Out of scope altogether: … any procedure, search or implementation. The roadmap states mathematics about scalar multiples, coordinate pairs and finite products”. No target defines a ladder, schedule, recovery or search; Layers 4 and 6 state scalar-multiple relations and divisibility theorems only. |
| R02 (P2) no headline theorems in `Suggested.lean` | Repaired | `Suggested.lean:84–160` states `double_coordinates`, `diffAdd_coordinates`, `coordinates_cross_eq_zero_iff`, `isElliptic_model_suyama_iff`, `prime_dvd_gcd_of_card_dvd` on native points of `(model A B).toAffine.Point`, each with `sorry`, with the hypotheses the previous review asked for. |
| R03 (P3) generic inputs re-owned instead of cited | Repaired | `README.md:89–93` cites `addOrderOf_dvd_iff_nsmul_eq_zero`, `addOrderOf_dvd_natCard`, `Prime.dvd_prod_iff`; `README.md:80` cites `X_eq_iff`; the product-divisibility target now reads “the empty list included … *Needs:* 6.2; Mathlib `Prime.dvd_prod_iff`” (`README.md:460–466`). |
| R04 (P3) no claim-level locators | Repaired, with the precision notes R01–R02 below | Every target carries a locator: Montgomery §10.3.1 eq. (10.3.1.1) p. 260 and p. 261, EFD entries, Zimmermann §1. No `sources.toml`: none of the 125 roadmap folders on main carries one, so its absence is the repository's convention, not a defect. |
| R05 (P3) Checks, `*Needs:*`, layer structure, Lean names | Repaired | Every definition has three or more computed Checks (`model` four, `Pair` three, `coordinates` three, `double` four, `diffAdd` three, Suyama four); every target has a `*Needs:*` line; each layer ends with Examples and Dependencies; the Lean names `model`, `Pair`, `Pair.map`, `coordinates`, `double`, `diffAdd`, `suyamaA`, `suyamaB` are the README's names. |

## R01 (P3) — Zimmermann reference: missing co-author and pagination of the copy read

**Location:** `README.md:547–549` and `README.md:386`. Quote: “P. Zimmermann, *20 years of ECM*, ANTS VII … read in the author's submitted version: §1, p. 3”.

**Claim:** The paper has two authors and the author-page copy carries the published pagination, so the locator “p. 3” does not match the text a reader will find.

**Witness:** `zimmermann2006 line 125` prints the running head “P. Zimmermann and B. Dodson”; `zimmermann2006 line 82` prints “20 Years of ECM 527” at the top of the page carrying Suyama's parametrization (`zimmermann2006 lines 116–123`), and §1.1 “Why does ECM work?” begins at `zimmermann2006 line 131` on the same printed page 527.

**Repair:** Cite “P. Zimmermann and B. Dodson, *20 years of ECM*, ANTS VII, LNCS 4076 (2006), 525–542: §1, p. 527 (Suyama's parametrization); §1.1, pp. 527–528”, and use the same locator at 5.1, 6.4 and in the `prime_dvd_gcd_of_card_dvd` docstring (`Suggested.lean:152–153`). The mathematics cited (u = σ² − 5, v = 4σ, x₀ = u³, z₀ = v³, a = (v − u)³(3u + v)/(4u³v) − 2, b = u/z₀, y₀ = (σ² − 1)(σ² − 25)(σ⁴ − 25)) is exactly what the README restates, so only the bibliographic data changes.

## R02 (P3) — Cache-line locators and the five-page Lenstra locator

**Location:** `README.md:257` (“efd line 166”), `README.md:284` (“efd line 247”), `README.md:386` (“zimmermann2006 lines 94–102”), `README.md:481–482` and `README.md:554–555` (“Lenstra 1987, §2”).

**Claim:** Line numbers into a text extraction that no manifest records are not reproducible by a reader of the README; and “§2” of Lenstra spans pp. 663–667, while the statement cited (reduction of the arithmetic modulo a prime divisor and the gcd that detects it) sits at numbered items.

**Witness:** My EFD extraction happens to put `dbl-1987-m-3` at line 166 and `dadd-1987-m-3` at line 247, but my extraction of the Zimmermann–Dodson copy puts Suyama's parametrization at lines 116–123, not 94–102. In Lenstra, the reduction-compatible addition is item (2.2) at `lenstra1987 line 616` (printed p. 664), multiplication (2.3) at `lenstra1987 line 654` (p. 665), and the one-curve factoring step (2.4) at `lenstra1987 line 680` (pp. 665–666).

**Repair:** Keep the entry names (`dbl-1987-m-3`, `dadd-1987-m-3`) and the Montgomery page they cite, and drop the “line N” locators; cite Lenstra as “(2.2)–(2.3), pp. 664–665” at 6.1 and 6.4 and as “(2.4), pp. 665–666” where stage 1 is meant. No statement changes.

## R03 (P3) — Stage-2 detection is neither stated nor accounted for in the module docstring

**Location:** `Suggested.lean:17–20` and `README.md:503–509`. Quote: “The other README targets (the `Projectivization`-valued `x`-coordinate map and its fibres, the ladder recurrences, compatibility with ring homomorphisms, the gcd classification and batching) are library API and supporting results”.

**Claim:** Target 6.5 (stage-2 detection at a prime divisor: if raw pairs over `ZMod n` reduce to representatives of the coordinate pairs of `[iw]Q` and `[j]Q` with `[q]Q = 0`, `q = iw ± j`, then `p` divides the gcd of their cross difference with `n`) is statable with the file's own definitions, on exactly the carriers of `prime_dvd_gcd_of_card_dvd`, yet it is neither stated nor named in the docstring's list of targets left to the README.

**Witness:** `prime_dvd_gcd_of_card_dvd` (`Suggested.lean:154–159`) already quantifies over `R : Pair (ZMod n)`, `ZMod.castHom hpn (ZMod p)` and `coordinates A B (m • P)`; the stage-2 statement needs only two such pairs, two integers `i, j`, the hypothesis `(i * w + j) • Q = 0 ∨ (i * w - j) • Q = 0` and the conclusion `p ∣ Nat.gcd (R₁.x * R₂.z - R₂.x * R₁.z).val n`.

**Repair:** Either state it as a sixth theorem (the stage-2 counterpart of the stage-1 headline, with the hypothesis on `[iw ± j]Q` rather than on `addOrderOf P ∣ Mq`, which is derived in the README) and name it among the end theorems of the Summary, or add 6.5 to the docstring's list of results left to the README. The README's designation of five end theorems is the author's; this note does not block.

## R04 (P3) — Two wording nits

**Location:** `README.md:206` and `README.md:396`.

**Claim and witness:** (a) “Its second field vanishes exactly at infinity” needs `B ≠ 0`, which the sentence attaches only to its second clause: for `B = 0` every affine native point of `y'² = x'³` (all points but the cusp) has coordinate pair `(x', 0)`. The Conventions' standing hypothesis covers it, but the neighbouring bullet states its `B ≠ 0` explicitly. (b) “the point of the Montgomery curve with `y = 1`” is not unique: `B y² = x³ + A x² + x` at `y = 1` is a cubic in `x`; the point meant is `(u³/v³, 1)`.

**Repair:** “For `B ≠ 0`, its second field vanishes exactly at infinity and its first field exactly at `T₀`”; “the projective `x`-coordinate of the point `(u³/v³, 1)` of the Montgomery curve”.

## Verified sound

**Repository and gate.** The reviewed head is `2ddbbda`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ECM'` is empty: nothing outside the folder changes. The folder holds `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.NT"`); no stray file. The worker's gate at this head reports every check at 0 and `build=0 OK`. `lake env lean` on `TauCetiRoadmap/ECM/Suggested.lean` exits 0 with exactly five `declaration uses 'sorry'` warnings (lines 84, 99, 114, 140, 154) and nothing else. The file has one `import Mathlib`, no `set_option`, no `lemma`, no `#check`, no sorried data, one proved `example` (the discriminant identity, which pins the sign convention of a kept definition). The dependency check returned exactly:

```text
depcheck: 189 roadmaps, 1159 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line; ECM is at line 209 of the merge order and names no other roadmap as supplier (`README.md:106–108`). The elliptic-curves roadmap named under scope is on main (`TauCetiRoadmap/EllipticCurves/README.md`, quadraticity of degree in Layer 1 at line 530, Hasse in Layer 3), and nothing here needs it. The README's cross-roadmap citations and backticked Lean names resolve (worker: none found nowhere); the 13 elaborated signatures lose no section binder (checked against `signatures.md` and the README statements of each headline: generality equal in every case, `DecidableEq K` the only extra binder, required by Mathlib's addition on points).

**Pins and declarations opened.** Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, as in `lake-manifest.json`.

| Pinned location | What it says, and what the README assumes of it |
|---|---|
| `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean:100–131, 230, 366` | `b₂`, `b₄`, `b₆`, `b₈`, `Δ`; `map`; `IsElliptic` asks `IsUnit Δ`. Substituting `(0, AB, 0, B², 0)` gives `16 B⁶ (A² − 4)` (kernel-checked by the file's `example`). |
| `Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Basic.lean:149, 211` | `Equation`, `Nonsingular`, as cited at 1.2. |
| `Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean:477, 626, 653, 664, 806, 647` | `Point` is `zero` or `some x y h` with `h : Nonsingular`; `Neg`; `[DecidableEq F]` in scope for `Add` and `AddCommGroup`; no `IsElliptic` premise; `X_eq_iff`: equal `x` iff equal or negatives. |
| `Mathlib/LinearAlgebra/Projectivization/Basic.lean:60, 110` | `mk` needs `v ≠ 0`; `mk_eq_mk_iff` is equality up to a unit. |
| `Mathlib/Data/ZMod/Basic.lean:89, 331, 513, 519` | `val_natCast`; `castHom (h : m ∣ n) R [CharP R m]`; `intCast_zmod_eq_zero_iff_dvd`; `natCast_eq_zero_iff`. |
| `Mathlib/GroupTheory/OrderOfElement.lean:276, 1195` | `orderOf_dvd_iff_pow_eq_one` and `orderOf_dvd_natCard` with their additive versions. |
| `Mathlib/Data/List/Prime.lean:28` | `Prime.dvd_prod_iff` over a commutative monoid with zero. |
| `Mathlib/Algebra/GCDMonoid/FinsetLemmas.lean:33, 39` | `lcm_eq_prod` (pairwise coprime naturals), `factorization_lcm`. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean:73, 86–88` | `pointCount`; `pointCount_eq_card_point` needs `Finite {p : F × F // Equation}` and `IsElliptic`, as the README says. |

Neither Mathlib nor Tau Ceti contains the strings “Montgomery” or “Suyama”.

**Ownership.** `roadmaps grep` over the 418 open heads and main for Montgomery curves, Suyama, Kummer line, differential addition, elliptic-curve factorization and x-only arithmetic returns only unrelated hits (Kummer line bundles in p-adic roadmaps, “vertex-only” in graph theory). `ComputationalNumberTheory` (open head) owns factor presentations and Pocklington/AKS primality, not Montgomery arithmetic. No `Suggested.lean` elsewhere declares a `TauCetiRoadmap.ECM.*` name. ECM is the owner of its objects; its generic inputs are cited, not restated.

**Sources and the seeded sample.** All four cited texts were read through the sources service from legal copies: `montgomery1987` (AMS Math. Comp. open archive PDF), `efd` (hyperelliptic.org, author page), `zimmermann2006` (author's page copy; the HAL copy is image-only and OCR is unavailable here), `lenstra1987` (institutional copy at pages.cs.wisc.edu).

| Target | Locator read | Result |
|---|---|---|
| 1.1 monic model | `montgomery1987 line 874`: eq. (10.3.1.1) `By² = x³ + Ax² + x` on printed p. 260 (page header at line 885 is 261, so line 874 is p. 260) | Supported; the monic change of variables is the README's own, elementary. |
| 1.2 Montgomery equation | No external locator claimed; algebraic | `(B²y)² = B⁴y²` and `(Bx)³ + AB(Bx)² + B²(Bx) = B³(x³ + Ax² + x)`: the equivalence holds iff `B ≠ 0`, as stated. |
| 2.1 raw pairs | Mathlib `Projectivization.mk_eq_mk_iff` at pin | Supported. |
| 2.2 coordinate pair | Definition, `Suggested.lean:56–58` | Matches README (infinity ↦ `(1, 0)`, `(x', y') ↦ (x', B)`). |
| 2.3 fibres | `X_eq_iff` at `Point.lean:647` | Affine case supported; infinity case is the README's own (cross difference `B ≠ 0`). |
| 3.1 doubling | `montgomery1987 lines 908–909` (p. 261, duplication display with `(A + 2)/4`); `efd line 166` entry `dbl-1987-m-3`, formulas lines 180–186, assumption `4*a24 = a+2` line 172 | `X3 = AA·BB`, `Z3 = C·(BB + a24·C)` times `D` is `(D U V, C(D V + N C))`: exact match. |
| 3.2 differential addition | `montgomery1987 lines 905–906` (p. 261, addition display); `efd line 247` entry `dadd-1987-m-3`, formulas lines 259–266 | `X5 = Z1·(DA + CB)²`, `Z5 = X1·(DA − CB)²` with `(X1 : Z1)` the difference: exact match. The exceptional set is not stated in either source; verified by computation below. |
| 4.1 ladder relations | `montgomery1987 lines 913–915` (p. 261, binary method from `(mP, (m+1)P)`) | Supported. |
| 4.2 cross-difference criterion | README's own, from `X_eq_iff` | Verified by computation below. |
| 5.1 Suyama | `zimmermann2006 lines 116–123` (published p. 527): `u = σ² − 5`, `v = 4σ`, `x₀ = u³`, `z₀ = v³`, `a = (v − u)³(3u + v)/(4u³v) − 2`, `b = u/z₀`, `y₀ = (σ² − 1)(σ² − 25)(σ⁴ − 25)` | Matches `suyamaA`, `suyamaB`; the README's closed form of `B` follows from `b y₀²/v⁶`. Page locator wrong (R01). |
| 6.1 reduction | `ZMod.castHom` at pin; `lenstra1987 lines 613–622` (item (2.2), p. 664: reduction `P ↦ P_p` and `R_p = P_p + Q_p`) | Supported; locator loose (R02). |
| 6.2 gcd classification | Mathlib `natCast_eq_zero_iff`; `lenstra1987 lines 625–633` (gcd not 1 or n gives a divisor) | Supported. |
| 6.3 finite products | `Prime.dvd_prod_iff` at pin | Supported, empty list included. |
| 6.4 stage-1 detection | `lenstra1987 lines 654–661` (item (2.3), p. 665: `R_p = k·P_p`), `zimmermann2006 lines 142–146` (p. 527, stage 1 finds `p` when the group order is `B₁`-smooth) | Supported as a conditional divisibility statement. |
| 6.5 stage-2 detection | README's own from 4.2 and 6.3 | Verified by computation below. |

**Adversarial computations.** A script in my scratch directory implements Mathlib's chord-and-tangent law on the nonsingular points of the monic model `y² = x³ + ABx² + B²x` over `𝔽_p` (checking that every sum lands in the smooth locus and that the group order annihilates every point) and compares it with `double`, `diffAdd` and `coordinates` as defined in `Suggested.lean`. Sweep: `p ∈ {3, 5, 7, 11, 13}`, every `A`, every `B ≠ 0`, singular models (`A² = 4`) included; both scalings `(N, D) = (A + 2, 4)` and `((A + 2)/4, 1)`.

| Count | Value |
|---|---|
| models | 334 (68 singular) |
| doublings (nonzero output and representation of `P + P`) | 7832 |
| differential additions (representation of `P + Q` and the exact exceptional iff) | 51464 |
| cross-difference instances (`m, n ∈ [−#E, #E]`, both directions of the iff) | 3141676 |
| Suyama parameters (criterion vs `Δ ≠ 0`, closed form of `B`, `4N = (A + 2)D`, `(x, 1)` on the curve) | 176 over `p ≤ 37` |
| failures | 0 |

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 discriminant `16B⁶(A² − 4)` | ℚ, `(0,1)`, `(2,1)`, `(0,0)` | `−64`, `0`, `0`; `b₂ = 4AB`, `b₄ = 2B²`, `b₆ = 0`, `b₈ = −B⁴`, `Δ = −b₂²b₈ − 8b₄³ = 16A²B⁶ − 64B⁶` | Equal; kernel-checked by the file's `example` | none |
| 1.1 field criterion | 𝔽₂ `(0,1)`; zero ring | `16 = 0` so `Δ = 0`; zero ring: `0` is a unit, `model` is elliptic | Over a field `2 ≠ 0` is needed and stated; over the zero ring the unit criterion is the honest one | none |
| 1.1 `T₀ = (0,0)` nonsingular, order 2 | `B = 1, 2` over 𝔽₇; `B = 0` | `∂x' = −B²` = `6, 3`; for `B = 0` the point is the cusp | Needs `B ≠ 0`, stated | none |
| 1.1 model equality | `(A,B)` and `(−A,−B)` over ℤ | `AB = AB`, `B² = B²` | Both give the same model; domain needed for “up to sign” (in `ℤ/8`, `B = 1, 3` have `B² = 1`) | none, stated over a domain |
| 1.1 group over 𝔽₇, 𝔽₅ | `y² = x³ + x` | 𝔽₇: affine `(0,0),(1,±3),(3,±3),(5,±2)`, 8 points, `(3,3)` has multiples `(3,3),(1,4),(5,5),(0,0),(5,2),(1,3),(3,4),∞`; 𝔽₅: `(0,0),(2,0),(3,0)`, 4 points | Check values exact | none |
| 1.2 equation transport | 𝔽₇, `(A,B) = (0,2)`, `(1,1)` | `2·1 = 1 + 1`; `(2,4)`: `16 ≡ 2`, `8 + 8 ≡ 2` | Equal | none |
| 1.2 `B = 0` failure | `A = 0`, `(1,0)` | model: `0 = 0`; Montgomery: `0 = 2` | Equivalence fails exactly as the Check says | none |
| 2.1 relation on `(0,0)` | `(1,0)`, `(0,1)` through `(0,0)` | all cross products `0`, but `1·1 − 0·0 = 1` | Non-transitive once `(0,0)` admitted | none |
| 2.1 unit scaling over a ring | `ZMod 15`, `(1,1)·5` | `(5,5)` reduces to `(0,0)` mod 5 | Unit needed | none |
| 2.2 `coordinates` | 𝔽₇ `(0,1)`: `(1,3)`, `∞`, `(0,0)`, `(1,4)`; `(0,2)`: `(2,4)` | `(1,1)`, `(1,0)`, `(0,1)`, `(1,1)`; `(2,2)` representing `1` | Negation-invariant; wrong `(x',1)` would give `2` | R04(a) wording |
| 2.3 fibres | 𝔽₇, eight points | projective values `(1:0),(0:1),(1:1),(3:1),(5:1)`; `(2:1)` absent since `2³ + 2 = 3 ∉ {0,1,2,4}` | Five fibres, sizes 1,1,2,2,2 | none |
| 2.3 infinity fibre | `O` vs `T₀` | cross `1·1 − 0·0 = 1` | Not identified | none |
| 3.1 `double`, conventions | ℚ `(2,1)`, `N = 2, D = 4`; `N = −2` | `U = 9, V = 1, C = 8`: `(36, 160)`, `x = 9/40 = (4−1)²/(4·2·5)`; `(36, −96)`, cross `−9216` | Plus-two convention pinned | none |
| 3.1 `double` on `𝔽₇` | `(1,1)`, `(1,0)`, `(0,1)` | `(0,4)` ~ `T₀ = 2·(1,3)`; `(4,0)`; `(4,0)` | Equal to `coordinates (P+P)` | none |
| 3.1 nonvanishing at `x = ±1` | `x = 1`: `Z₂ = N C²`; `x = −1`: `Z₂ = 4Z²C(D − N)` | `N = 0 ⟺ A = −2`, `D = N ⟺ A = 2`; in each case `x = ∓1` is the singular point `(x(x ∓ 1)²)` | Zero output only off the native points; the “no hypothesis on A” claim holds | none |
| 3.1 singular model, native points | 68 singular models in sweep, e.g. 𝔽₇ `A = 2, B = 1`: 6 native points | all 0 failures | Claim at `README.md:53–55` holds | none |
| 3.1 `D = 0` | any pair | `N = 0`, output `(0,0)` | `D ≠ 0` needed | none |
| 3.1 homogeneity | `(2,1)·3` | `(2916, 12960) = 81·(36, 160)` | degree 4 | none |
| 3.2 `diffAdd` generic | 𝔽₇ `P=(3,3)`, `Q=(1,3)` | `P − Q = (5,5)`, `P + Q = (3,4)`; `a = 0, b = 4`, output `(16, 80) ≡ (2, 3)`, `2·3⁻¹ = 3` | Equal | none |
| 3.2 exceptional `T₀` | `P=(1,3)`, `Q=(1,4)` | `P − Q = 2P = (0,0)`, `a = b = 0`, output `(0,0)` | Exceptional as stated | none |
| 3.2 exceptional `O` | `P = Q` | `a = b`, output `(0·(2a)², 1·0) = (0,0)` | Exceptional as stated | none |
| 3.2 non-distinguished 2-torsion | 𝔽₅ `T = (2,0)`, `Q = O` | `a = 3, b = 1`, output `(16, 8) ≡ (1, 3)`, `3⁻¹ = 2 = x(T)` | Non-exceptional, as stated | none |
| 3.2 `a = b = 0` analysis | `x_P = x_Q = −1` or `= 1` | forces `P = ±Q`, and `x(2P) = (x² − 1)²/(…) = 0`, so `P − Q ∈ {O, T₀}` | The iff holds in both directions | none |
| 3.2 `P + Q = O` | `Q = −P`, `2P ∉ {O, T₀}` | `a = b`, output `(Z_S·4(X² − Z²)², 0)` with `x_P ≠ ±1` | Represents infinity, nonzero | none |
| Layer 3 example mod 35 | `double 2 4 (22,1)` | `(933156, 170720) ≡ (21, 25)`; mod 5 `(1,0)`; mod 7 `(0,4)`; `gcd(25,35) = 5` | Equal | none |
| 4.1 odd step | `[2]P=(1,4)`, `P=(3,3)` | `a = 4, b = 0`, output `(16, 48) ≡ (2, 6)`, `2·6⁻¹ = 5 = x([3]P)` | Equal | none |
| 4.1 `P = T₀` | pairs `(0,1),(1,0),(0,1)` | `a = 1, b = −1`, output `(0,0)` while `[1]T₀ + [0]T₀ = T₀` | Odd step needs `P ≠ T₀`, as stated | none |
| 4.1 mod 35 | `diffAdd (21,25) (22,1) (22,1)` | `a = 966, b = −92`; `874 ≡ −1`, `1058 ≡ 8`; output `(1, 22·64) ≡ (1, 8)`, `gcd(8,35) = 1` | Equal; mod 5 `(1,3)` ~ `2 = x([3](2,0))`, mod 7 `(1,1)` ~ `1 = x([3](1,3))` | none |
| 4.2 criterion | 𝔽₇ `Q=(3,3)`: `(5,3)`, `(3,1)`, `(0,0)` | `x = 5,5`, cross `0`, `[8]Q = 0`; `x = 5,3`, cross `2`, `[2]Q, [4]Q ≠ 0`; cross `0`, `[0]Q = 0` | Both directions | none |
| 4.2 no `2 ≠ 0` | char 2 reasoning | `coordinates` and `X_eq_iff` are characteristic-free | Hypothesis-free statement is right | none |
| 4.2 representation `q = iw ± j` | `w = 6`: `13, 17, 15`; `w = 2`: `q = 2` | `2·6+1`, `3·6−1`, `2·6+3` (`j = w/2` needed); `1·2 + 0` (`j = 0` needed) | Both boundary values needed, both allowed | none |
| 5.1 `suyamaA`, `suyamaB` | 𝔽₁₃ `σ = 2`; 𝔽₇ `σ = 2`; 𝔽₁₁ `σ = 2`; ℚ `σ = 5, 6` | `(u,v,A,B) = (12,8,8,5)`; `(6,1,2,0)`; `(10,8,2,9)`; `A = −2, B = 0`; all five factors nonzero (`35, 27, 11, 299, 41`) | Check values exact | none |
| 5.1 criterion vs `Δ` | 176 parameters, `p ≤ 37` | `Δ = 16B⁶(A² − 4)` nonzero iff product nonzero, 0 failures; admissible `σ` over 𝔽₇: none; over 𝔽₁₃: `2, 4, 9, 11` | Equal | none |
| 5.1 linear factors | symbolic | `v − u = −(σ−5)(σ+1)`, `v + u = (σ+5)(σ−1)`, `3u + v = (3σ−5)(σ+3)`, `v − 3u = −(3σ+5)(σ−3)` | Exact; `A² − 4 ≠ 0 ⟺ (σ²−1)(σ²−9)(σ²−25)(9σ²−25) ≠ 0`, `B ≠ 0 ⟺ (σ²−1)(σ²−25)(σ²+5) ≠ 0` given `σ² ≠ 5` | none |
| 5.1 `B` closed form, `4N = (A+2)D` | 176 parameters | `B = u(σ²−1)²(σ²−25)²(σ⁴−25)²/v⁹`, `4N − (A+2)D = 0`, 0 failures | Equal | none |
| 5.1 characteristic 3 | symbolic | `9σ² − 25 = −1`, `σ² − 9 = σ²` | Reduces as stated | none |
| 6.1 reduction | `(22,1)` mod 35 | mod 5 `(2,1)`, mod 7 `(1,1)`; `3 − 5 ≡ 33 ↦ 3, 5`; ℕ gives `0` | Equal | none |
| 6.1 `castHom` existence | `35 → 5`, `9 → 3`, `35 → 3` | `5 ∣ 35`, `3 ∣ 9`, `3 ∤ 35` | As stated | none |
| 6.2 gcd outcomes | `n = 35`: `t = 25, 0, 1`; `n = 9`: `t = 3` | `5, 35, 1`; `3` | Three outcomes; prime power limitation | none |
| 6.2 for `n = 0` | `ZMod 0 = ℤ` | `val = natAbs`, `gcd(natAbs t, 0) = natAbs t`, cast is the integer cast | Statement survives the junk case | none |
| 6.3 products | `[3,5]`, `[]`, `[1,5]`, `[0]` mod 15 | gcds `15, 1, 5, 15`; leaf gcds `3,5`; none; `1,5`; `15` | As stated | none |
| 6.4 `prime_dvd_gcd_of_card_dvd` | `n = 35`, `R = (21,25)`, `m = 2`; `m = 4` | 𝔽₅: `[2](2,0) = O`, `castHom 25 = 0`, `5 ∣ gcd(25,35)`; 𝔽₇: order of `(1,3)` is 4 (`(1,3),(0,0),(1,4),O`), `7 ∤ 5`; `double (21,25) ≡ (9, 0)`, `gcd(0,35) = 35` | True; inconclusive case as stated | none |
| 6.4 infinite-group junk | `Nat.card = 0` | `0 ∣ m` forces `m = 0`, `0 • P = 0` | No vacuity | none |
| 6.4 `M(B₁)` | `B₁ = 0..6, 10` | `1,1,2,6,12,60,60`; `2520 = 8·9·5·7`, `16 ∤ 2520` | As stated | none |
| 6.5 stage-2 instance | 𝔽₇ `P = (1,4)`, `M = 2`, `q = 2`, `w = 2` | `Q = [2]P = (0,0) ≠ 0`, `4 ∤ 2`, `4 ∣ 4`; `[2]Q = [0]Q = O`, cross `0` | As stated | R03 |
| 6.5 products | empty product | `1`, `gcd = 1` | As stated | none |
| Layer 6 example | `m = 2, 3, 4` on `(22,1)` mod 35 | `gcd = 5, 1, 35` | Three outcomes on one curve | none |

**Headline theorems and padding.** The README names five end theorems (`README.md:12–14`); all five are stated in `Suggested.lean` at the README's generality with native points as carriers. The `simp` probe on a scratch copy leaves all five open (`unsolved goals` at lines 89, 105, 143; `simp made no progress` at 119, 160), so none is padding; no declaration restates a definition, mirrors a Check or computes a value. Every definition in the file is used by a stated theorem (`Pair.map` by `prime_dvd_gcd_of_card_dvd`). The one declaration the docstring does not account for is 6.5 (R03).

## Not verifiable

- None of the cited texts was unavailable. The HAL copy of Zimmermann–Dodson is image-only and OCR is not installed on this worker; the author's-page copy has a text layer and was used instead, under the same key. The worker's `needs-references.toml` entries recorded during the first fetch attempts were superseded by successful fetches, and the file was removed.

## Source issues

- none
