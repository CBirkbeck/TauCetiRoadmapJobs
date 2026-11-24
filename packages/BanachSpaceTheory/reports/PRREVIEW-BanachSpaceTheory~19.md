# Review of BanachSpaceTheory (pull request #1854 at 2f1f33b)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 3925 changed lines since `2c2bcf5`. The revised README was read in full against the README at the merge base, the pinned Mathlib and Tau Ceti, and the cached sources, and `Suggested.lean` was elaborated; no statement was found false, no layer or item of `main` is removed, and the three findings of the previous review are repaired. Accepted, with five small corrections and no format note, none blocking. One point is left for the human reviewers: the most-cited textbook could not be read.

## C01 — Two pointers in B7 refer to text that §7.1 does not contain

A reader of the first Check of §7.1 (`README.md:1922`, "For reflexive `E` the density is equality, since `J_E` is onto") looks for a density statement and finds none: the README on `main` phrased trace duality as density of `J_E ∘ S` in the unit ball of `L(E, E**)`, and the head states it as an equality of suprema (`:1907–1912`). The Examples line of B7 (`:2068`) likewise lists "`c₀` for trace duality", but `c₀` appears nowhere in §7.1.

The Check would read: "For reflexive `E` the supremum over the unit ball of `L(E)` is the supremum over the unit ball of `L(E, E**)`, since `J_E` is onto." For the Examples line, either drop `c₀` or add the Check it promises (`c₀` has the metric approximation property by §4.2, so §7.1 gives the equality with finite-rank `S`).

## C02 — The build guide omits that B4.0 uses §5.4 and §7.1

"How to read the build" ends "B4 and B5 need B1–B3. B6 needs B5, and B7 needs B1, B4 and B6" (`README.md:61–62`), from which a reader plans B4 before B5 and B7. B4.0's own *Needs:* line (`:927–929`) and the Dependencies of B4 (`:1191–1192`) name §5.4's signed Riesz–Markov–Kakutani representation and §7.1's local reflexivity, and §7.1's trace duality in turn needs B4.0 (`:1931`).

There is no cycle between items: local reflexivity and the signed representation are pinned (`LinearIsometry.exists_continuousLinearMap_of_doubleDual`, `TauCeti.RealRMK.integral_rieszMeasure_posPart_sub_integral_rieszMeasure_negPart`) and neither uses B4. One added sentence in the guide would say so: "B4.0 also uses §5.4's signed Riesz representation and §7.1's local reflexivity, both realised in Tau Ceti; §7.1's trace duality then uses B4.0."

## C03 — The description does not say how this revision is ordered with pull request #3027

The description says the pull request "does not depend on any other open pull request". Pull request #3027 also changes `TauCetiRoadmap/BanachSpaceTheory/README.md`: on the text of `main` it adds an item B7.HermitianNorms after John's theorem, a clause in the conventions, and three references (John 1948, Gaudron 2008, Chen–Moriwaki). This revision rewrites the same passages, so the two heads conflict and whichever merges second loses or duplicates text unless it is rebased.

The description would add one sentence, for example: "Pull request #3027 adds the item B7.HermitianNorms to this README as it is on main; it is rebased on this revision, which carries the item under its id into B7 after §7.2." The reverse order is equally sound; the point is that one is stated.

## C04 — The description's list of statements that differ from main is incomplete

Under "Statements whose content differs from main" the description lists five changes for BanachSpaceTheory. The head changes the hypotheses of several further items, each to what the pinned declaration proves, and a reader comparing with `main` is not told:

- §1.1 identifies `(E/F)*` with `Fᗮ` and `F*` with `E*/Fᗮ` for every subspace `F` (`README.md:100`); `main` required `F` closed. The pin agrees (`Submodule.quotientDualEquivAnnihilator`, `Analysis/Normed/Module/Dual/Quotient.lean:38`, any `S`).
- §2.3 states "reflexive iff the closed unit ball is weakly compact" for normed spaces (`:320`), and §2.1 forbids a completeness hypothesis (`:277`); `main` said Banach space in the first and was silent in the second.
- §6.2 states Grothendieck's theorem as `π₁(T) ≤ 16 ‖T‖` for every measure and every inner product space, with `8` over `ℝ` as a remark (`:1844–1847`); `main` had `κ_𝕜 ‖T‖` into a Hilbert space.
- §7.1 defines the Banach–Mazur distance for all spaces of equal dimension and restricts only "`d = 1` iff isometric" to nonzero spaces (`:1878–1881`); `main` defined it for nonzero spaces.

Adding these four lines to that list would make it complete.

## C05 — `dvoretzky` carries the hypothesis `ε < 1`, which the statement does not need

In `Suggested.lean:288–292` the infinite-dimensional corollary assumes `hε' : ε < 1`, while `dvoretzky_finite` (`:279`) and the README (§7.3, `:2002–2006`) take every `ε > 0`. The statement holds without it: for `ε ≥ 1` the map `T = 0` satisfies `(1 − ε)‖x‖ ≤ 0 = ‖T x‖ ≤ (1 + ε)‖x‖`. An implementer who derives `dvoretzky` from `dvoretzky_finite` never uses the bound. Dropping `hε'` makes the two statements and the README agree.

## Previous findings

- R01 (the pinned Riesz–Markov–Kakutani theorem credited with a total-mass identity) — repaired: B4.0 now reads "The two measures are finite because `K` is compact … Their total masses add up to `‖Λ‖`: by `RealRMK.integral_rieszMeasure` at `1`, `TauCeti.RealRMK.posPart_apply_of_nonneg` and `TauCeti.RealRMK.negPart_apply`" (`README.md:813–818`); both declarations opened at the pin (`MeasureTheory/Integral/RieszMarkovKakutani/Signed.lean:188,211`).
- R02 (`0 ≤ C` missing in the compact-space inequality) — repaired: "a bilinear `B` on `C(K, 𝕜) × C(L, 𝕜)` with `0 ≤ C` and `‖B(f, g)‖ ≤ C ‖f‖ ‖g‖`" (`:1832`); the Scope sentence about "families of bilinear forms" is gone.
- R03 (Garling–Gordon without a locator) — repaired: "(Garling–Gordon 1971; Pietsch, *Eigenvalues and s-Numbers*, 1987, 1.7.17)" at `:1962`, in *Needs:* (`:1998`), in References (`:2240–2241`) and in the docstring of `garling_gordon`.

## Verified sound

| Statement | Instances tried | Values computed (left / right) | Result | Change |
|---|---|---|---|---|
| §2.3 reflexive iff ball weakly compact, normed `E` | pin `WeakCompact.lean:99`, context `:39` | no `CompleteSpace`; `E` only seminormed; README "no completeness" agrees | holds | none |
| §2.3 Clarkson, `2 ≤ p`, and second inequality | `f = g`; `p = q = 2` | `2ᵖ‖f‖ᵖ ≤ 2^(p−1)·2‖f‖ᵖ` equality; second: `2^q‖f‖^q = 2(2‖f‖ᵖ)^(q−1)` since `p(q−1) = q` | holds | none |
| §2.3 uniform-convexity estimate | `f = −g`; pin `Lp/UniformConvex.lean:101` | `δ2ᵖ ≤ 2ᵖ + 2δη` for small `δ`; pinned statement identical | holds | none |
| §2.4 Krein–Šmulian | pin `KreinSmulian.lean:272` | `[CompleteSpace E]`, `Convex ℝ C`, balls `closedBall 0 r` for all `r`: as README | holds | none |
| §2.5 Bishop–Phelps and support points | zero space; `C = ∅`; pin `BishopPhelps.lean:243,282,319` | zero space: `g = 0` attains at `0`; `[Nontrivial E]`, nonempty bounded only for functionals, as README | holds | none |
| §2.6 Gantmacher, `T*` | identity of `ℓ²`; pin `WeaklyCompact.lean:179,190,304` | weakly compact, not compact; adjoint criterion needs `[CompleteSpace F]`, README has `F` Banach | holds | none |
| §3.2 definitions, James's basis criterion | pin `Bases/Reflexive.lean:49,60,199` | shrinking = dense span of coordinates; bounded partial sums ⇒ conditional `HasSum`; iff as README | holds | none |
| §3.3 multiplier bound; summing basis | pin `Unconditional.lean:207`; `x = ((−1)^k/(k+1))` | `4K‖a‖∞`; `aₙ = (−1)ⁿ(1/(n+1)+1/(n+2))`, `Σ|aₙ| = ∞` | holds | none |
| §3.4 bounded completeness, Schur | pin `Lp/Basis.lean:84`, `Lp/Schur.lean:155` | `p ≠ ⊤` only; weak ⇒ norm convergence in `ℓ¹` for countably generated filters | holds | none |
| §3.5 Bellman estimate at `p = 2` | `Φ₂ = x² − y²` | `(1/1)(x² − y²) ≤ x² − y²` equality; midpoint: `t ↦ (x+t)² − (y+εt)²` affine | holds at `p = 2` | none |
| §4.4 nuclear norm; §4.5 Checks | identity of `ℓ²ₙ`; `diag(1/j²)` | `ν = n`, operator norm `1`; `Σ 1/j² = π²/6` | holds | none |
| B4.0 MAP ⇒ `‖Θ_X u‖ = ‖u‖π` | `X = 𝕜`; general estimate | `|⟨u,S⟩ − ⟨u,T⟩| = |Σ (T(Fxᵢ − xᵢ))(fᵢ)| ≤ δΣ‖fᵢ‖`; `‖S‖ ≤ 1+ε`; at `𝕜` no loss | holds | none |
| B4.0 total masses of `μ⁺, μ⁻` | `K = {a,b}`, `Λf = f(a) − 2f(b)` | `posPart 1 = 1`, `negPart 1 = 2`, sum `3 = ‖Λ‖` at `(1,−1)` | holds | none |
| B4.0 Krawtchouk table | `n = 3, 4` | `|K₂(j)| = 5,1,3 ≤ 5`; `|K₃(j)| = 14,4,6,0 ≤ 14`; `K₄(1) = 5 − 10 = −5` | holds | none |
| B4.1 parameters | `j = 1, 2` | `n₂ = 2³² = 2⁸·2²⁴`; `n₃ = 2¹⁰²⁴ ≥ 2¹⁶·2²⁷² = 2²⁸⁸` | holds | none |
| §5.1 separability of `ℓ²(S)` | vanneerven22 line 5692 (p. 107) | rational / Gaussian-rational finite combinations dense: supports the README's sentence | holds | none |
| §5.2 classification locators | vanneerven22 lines 5701, 5716 | Corollary 3.23 on p. 107, Theorem 3.25 on p. 108 | holds | none |
| `exists_unique_vectorMeasure_regular` (§5.4) | `K = ∅`; `φ = δ₀ − δ₁`; vanneerven22 line 6566 (p. 127) | `μ = 0` unique; `‖φ‖ = 2 = |μ|([0,1])` at `1 − 2t`; source gives `‖μ‖ = ‖φ‖` | holds | none |
| `banach_stone` (§5.5) | `(a,b) ↦ (b,−a)` on `𝕜²`; garridojaramillo02 lines 161, 193 | `h = (1,−1)`, `φ` transposition; Theorems 2 and 4 as cited, real case | holds | none |
| `exists_lpDualEquiv`, `exists_lpInftyDualEquiv` (§5.6) | `μ = ∞·δ_a`; `μ = 0`; vanneerven22 lines 6796, 6855 | `L¹ = 0`, `L∞ = 𝕜`: no equivalence, σ-finite present; Remark 4.5 drops σ-finiteness for `1 < p < ∞` | holds | none |
| `isCompact_closure_toWeakSpace_lp_one_iff` | `S = ∅`; `δ_a`, `S = {n·1}`; `n·1_[0,1/n]` | both sides true; unbounded, integral condition holds; `∫_[0,1/n] fₙ = 1`, not uniformly integrable | holds | none |
| B6.Cotype2 type/cotype exclusion | `(y,y)`; `(y,…,y)`, `n = 16`, `p = 4` | `R₂ = √2‖y‖`; `4‖y‖ ≤ 2^(1/4)·2‖y‖ ≈ 2.38‖y‖` false | holds | none |
| `cotype2_summing_bound` | `n = 0`; `C ≤ 0`; `Y = ℝ`, `n = 1` | `0 ≤ 0`; `Y = 0` forces `U = 0`; `π₂ = 1 = R₂`, `K ≥ 1` possible | holds | none |
| §6.2 compact-space form | `K = ∅`, `C = −1`; pin `Grothendieck.lean:157` | excluded by `0 ≤ C`; pin has `hC : 0 ≤ C`, `[NormalSpace]`, constant `16` | holds | none |
| `summingENorm_one_le_of_lp_one` | `Tf = ∫f`; inclusion `C[0,1] → L¹` | `π₁ = ‖T‖ = 1 ≤ 16`; `Σ‖fᵢ‖₁ ≤ sup_t Σ|fᵢ(t)|`, `π₁(ι) ≤ 1` | holds | none |
| `banachMazurDist_euclideanSpace_le_sqrt` | `n = 0, 1`; pin `BanachMazur.lean` | infimum of `‖T‖‖T⁻¹‖`: `0 ≤ 0`; `1 ≤ 1` | holds | none |
| §7.1 local reflexivity, every `ε > 0` | pin `LocalReflexivity.lean:228` | `hε : 0 < ε` only; two-sided bounds, `g(Tv) = ιv(g)`, `T(Jx) = x` | holds | none |
| §7.1 trace duality (restricted) | `E = 𝕜`; rank one; Enflo's space | `|u|` both sides; `‖f‖‖x‖` both sides; reflexive: full supremum, finite-rank supremum smaller | holds | C01 |
| `dvoretzky_finite`, `dvoretzky` (§7.3) | `k = 0, 1`; `ε ≥ 1`; `n = 4` | trivial; `N = 1`; `T = 0` works; `log 2 = 0.693 ≥ 0.462` | holds | C05 |
| `kadec_snobar`, `garling_gordon` | `F = ⊥`; `M = ⊤`; `M = ker f` | `P = 0`, `0 ≤ 0`; `P = 0`, `0 ≤ ε`; `‖P‖ = ‖x₀‖ < 1 + ε` | holds | none |
| `james`, reflexivity corollary | `A = ∅` excluded; `c₀` cube; `ℓ¹` | supremum `1` attained only at `1 ∉ c₀`; `|f(x)| < 1` on the ball | holds | none |

- Source locators read against the cached texts: 17 (van Neerven 11, Garrido–Jaramillo 2, Yosida–Hewitt 3 at lines 265, 287, 319, Heil Theorem 7.6 at line 2446, p. 54); also Pisier Definition 9.6 (pisier12gt line 1591), AFJS p. 3 (afjs94 lines 123–137), Bekka–de la Harpe–Valette C.5 (bdlhv08 lines 14611–14620, p. 383). All match.
- Library declarations opened at the pin: 31 in Tau Ceti (files and lines in the rows above and in C02, C04), none missing; the 41 *In Tau Ceti:* lines name 188 declarations, as the description says.
- Cross-roadmap citations resolved on main: PDE §1.1 (A1) (`TauCetiRoadmap/PDE/README.md:677`), AmenableGroups Layer 7 (`:885`), PseudodifferentialOperators Layer 5 and §5.4 (`:870, :1280`), OperatorIdeals OI-A01, OI-A25–OI-A28, OI-B29–OI-B30; SelfAdjointSpectralTheory at this head cites only §5.4 (`:604–619, :1925–1927`).
- README at the merge base against the head, layer by layer: B1–B7 and B4.C, B4.0, B4.1, B5.LocalHaarDual, B6.Cotype2 keep their ids and subjects; no item is removed. Proof routes shortened only where the pin realises the item (the real Grothendieck inequality). Trace duality is narrowed, as the description states.
- Automatic checks: every check passes at this head. Dependency check: `depcheck: 132 roadmaps, 1469 edges, 0 problem(s)`, no UPWARD or CYCLE line. No change outside the pull request's own folders.
- Lean: `lake env lean` on `Suggested.lean` exits with 24 `declaration uses sorry` warnings and nothing else; single `import Mathlib` plus six existing `TauCeti.*` modules, no `set_option`, no sorry'd data. The statements are unchanged since the head the previous review probed (only section labels changed), so its `#check @` comparison and one-tactic probe stand; the two declarations without `[CompleteSpace E]` need none (reflexive spaces are complete; `kadec_snobar` and `garling_gordon` hold for normed spaces).
- Headline theorems: James, Grothendieck's two approximation theorems, Enflo, Argyros–Haydon, Riesz for `C(K)`, the `Lᵖ` dualities, Dunford–Pettis, Banach–Stone, the cotype-2 bound, Grothendieck's theorem, John, Kadec–Snobar, Garling–Gordon, Dvoretzky are stated; the four not statable are named in the module docstring with the missing carrier. No headline is already in the pinned libraries (searched by object: duals of `Lp`, duals of `C(K)`, Hilbert-basis cardinality, the named theorems).
- Overlap check: read BochnerSpaces, VonNeumannAlgebras, SchattenClassesAndSchurMultipliers (open), SNumbers, VariationalMethods, BanachAlgebras (main); the reflexive-target density theorem of B4.0 is shared with BochnerSpaces §7 and SchattenClassesAndSchurMultipliers, both of which cite BanachSpaceTheory B4.0 as owner; nothing else shared. Pull request #3027 changes this README (C03).

Source independence: changed passages only; 8 passages compared with 7 sources (vanneerven22, garridojaramillo02, heil97, yosidahewitt52, bdlhv08, pisier12gt, afjs94), none shared; largest share albiackalton06, about 12 of 80 locator-bearing lines, text not readable; contents not compared: the diff adds, removes and reorders no layer.

Research link: B4.0 and B4.1 state Enflo (1973) and Argyros–Haydon (2009, scalar-plus-compact); B6 is Grothendieck's theorem as surveyed by Pisier (2011); B7 is the local theory of John and Dvoretzky. SNumbers, BanachAlgebras A8 and SelfAdjointSpectralTheory consume them. Rests on the README's sources and its downstream-consumers section.

## Not verifiable

- `megginson98` (§§1.2, 2.1–2.5, 3.2, 4.2): uncertified, no text in the cache; cited by theorem number only.
- `albiackalton06` (§§3.5, 5.7, 6.1, 6.2, 7.1–7.3): uncertified, no text in the cache.
- `conway90` Chapter I, Proposition 4.14 (§5.2), `ryan02` Proposition 4.6 (§4.5), `hewittross63` Theorem 12.18 (B5.LocalHaarDual), `garlinggordon71` and Pietsch 1.7.17 (§7.2), `enflo73` §§1–4 (B4.0): uncertified or without a readable copy.
- Pisier, *Factorization of Linear Operators and Geometry of Banach Spaces*, §3 (B6.Cotype2): no text in the cache.

## Source issues

- none

## For the human reviewers

- Not tested: Albiac–Kalton, *Topics in Banach Space Theory* has the largest share of the README's locators (about 12 of 80 lines) and is recorded as uncertified with no readable text; wording and arrangement were not compared with it.
