# Review of AlgebraicCurves (pull request #1807 at c8821a4)

**Verdict:** accepted

🤖 Independent AI review. This is an incremental re-review of 0 changed lines since `27be4b9`. There are no findings. Acceptance means ready for a human's final approval, not approval or merge by the AI.

The folder, `lake-manifest.json` and `lean-toolchain` are unchanged. The six intervening file changes belong to BordismFormalGroups, ClassifyingSpaces, RigidAnalyticGeometry and TopologicalKTheory, all explicitly within this pull request's scope. AlgebraicCurves cites none of those four; no added or deleted sibling line mentions AlgebraicCurves or its three roadmap suppliers. The diff excluding all fourteen authorized folders is empty. I did not repeat the full mathematical review of unchanged text.

## Previous findings

[PRREVIEW-AlgebraicCurves~59](PRREVIEW-AlgebraicCurves~59.md) raised no findings. Its four historical repairs from review ~57 remain unchanged; the passages were reopened:

- R01 — repaired: `TauCetiRoadmap/AlgebraicCurves/README.md:2036–2047` retains independence of p-th powers over the fixed field and the finite-generation hypothesis before invoking the separating-basis theorem.
- R02 — repaired: `TauCetiRoadmap/AlgebraicCurves/README.md:1629–1634` retains residue zero but non-exactness of x^(−p−1) dx, contrasted with the exact form x^(−p) dx.
- R03 — repaired: `TauCetiRoadmap/AlgebraicCurves/README.md:1239,1252,1281,2010` retains the geometrically reduced criterion and `PrimeSpectrum.isHomeomorph_comap_of_isPurelyInseparable`.
- R04 — repaired: `TauCetiRoadmap/AlgebraicCurves/Suggested.lean:27–28` says “genus invariance under separable algebraic constant extension, finite or not”.

## Verified sound

### Gate, scope and elaboration

- The worker's PR-aware gate at `c8821a4` passes every check, including `build=0`, `depcheck=0`, `outside-folder=0` and `statement-hygiene=0`.
- The standalone rerun reports `outside-folder=26` and zero on every other scanner. This is the same scope false positive recorded in review ~59: the 26 files are the README and Suggested.lean of the thirteen other authorized folders. The independently checked excluded diff is empty. This does not constitute an unauthorized edit or a failing check for this folder under the brief's express exception.
- Because the standalone gate stops at that scope check, I separately ran `lake build TauCetiRoadmap.AlgebraicCurves.Suggested`: success, with only the two admitted-target warnings.
- Direct elaboration of `TauCetiRoadmap/AlgebraicCurves/Suggested.lean` succeeds, with only `declaration uses 'sorry'` at lines 80 and 104.
- I elaborated one scratch copy containing `#check @name` for both declarations. All four fields, five algebra structures, two scalar towers, algebraic-closure instance, exactness, compositum equality and both genus bounds remain in the general signature. The perfect-field corollary retains perfectness, function-field and exactness hypotheses and genus at least two. Both match README §11.4; no binder changed or disappeared.
- The worktree was clean before review; no pull-request file was edited.

The dependency check, run with the prescribed content, merge order and PR arguments, printed exactly:

```text
depcheck: 236 roadmaps, 2159 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line.

### Citations, pins and ownership

The content main is `5fc1aa8f`; the Tau Ceti pin is `2fd255d997` and the Mathlib pin is `1b1ccf4b`. The pins are unchanged since the preceding review.

All three roadmap supplier contracts at `TauCetiRoadmap/AlgebraicCurves/README.md:267–285` were reopened against main:

| Contract | Resolved passage | Result |
|---|---|---|
| JacobianChallenge A–B | `TauCetiRoadmap/JacobianChallenge/README.md:111,135` | Divisors, sheaves, coherent cohomology, Riemann–Roch and Serre duality are present. |
| JacobianChallenge E–F | `TauCetiRoadmap/JacobianChallenge/README.md:332,448` | Abelian varieties and the pointed Abel–Jacobi/Albanese property are present; the application is over algebraically closed constants. |
| FormalLaurentPuiseux L1–L3 | `TauCetiRoadmap/FormalLaurentPuiseux/README.md:70,112,140` | Substitution, continuous derivations and residue transformation are present in arbitrary characteristic; only primitive existence is restricted to characteristic zero. |
| LocalFieldsRamification Layer 3 | `Completed/LocalFieldsRamification/README.md:878,1022` | Herbrand/upper numbering and abelian Hasse–Arf are present, with the finite-residue-field boundary retained by AlgebraicCurves §8.9. |
| SchemeAndStackFoundations §4.15 (consumer) | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:5538` | Stable pointed curves remain here; this is not a supplier edge. |

The citation resolver reports zero unresolved cross-roadmap citations and zero unresolved roadmap Lean names against main and the indexed 439 open heads. It explicitly does not check pinned library names on its host; that is not used as library evidence here. The unchanged remaining consumer citations and their ownership audit are carried from review ~59.

Four pinned declarations were reopened for the two headlines:

| Declaration | File and line at the pin | Comparison |
|---|---|---|
| `TauCeti.finite_algEquiv_of_two_le_genus` | `TauCeti/FieldTheory/FunctionField/Automorphism/HigherGenus.lean:124`, standing binder at 57 | Requires algebraically closed constants and injective gap casts; strictly more restrictive than either proposed headline. |
| `TauCeti.genus_eq_genus_of_constantCompositum_eq_top` | `TauCeti/FieldTheory/FunctionField/ConstantExtension/Genus/Basic.lean:273`, separability binder at 267 | Confirms the retained separable algebraic constant-extension statement. |
| `TauCeti.constantCompositum` | `TauCeti/FieldTheory/FunctionField/GeometricDegree.lean:115` | The actual intermediate field generated by the image of the upper constants, not arbitrary data. |
| `AlgEquiv.fintype` | `Mathlib/FieldTheory/Fixed.lean:323` | Requires finite dimension over the constant field; it does not prove either transcendence-degree-one target. |

The other library and one-tactic padding checks are inherited from review ~59 because both statements and pins are identical. Its `simp`, `infer_instance` and `exact?` probes did not close either headline; I do not claim those probes were rerun.

The overlap evidence still lists #1808 and #1854 as conflicting revisions of this folder. The PR description's `merge-order` block explicitly orders this PR → #1808 → #1854 and requires rebasing. There are no reported dropped cited IDs, revision-only IDs, or dropped IDs consumed elsewhere. The repeated `roadmaps grep` ownership search finds these revisions of AlgebraicCurves, not a new independent owner of its general function-field finiteness theorem. The broader unchanged ownership audit, including GroupActionsOnRiemannSurfaces §4.3, is inherited from review ~59.

### Headlines and seeded sample

The unchanged headline inventory is: the function-field characterization; product formula, Riemann's theorem and rational genus; Riemann–Roch; finite class number and Clifford; Hurwitz genus formula; constant-extension invariance, non-increase and genus drop; tensor-domain criterion; Hilbert's different formula; Kähler dimension, Weil comparison and residues; elliptic, hyperelliptic and plane genera; automorphism finiteness and the tame Hurwitz bound; the curve/function-field anti-equivalence and genus comparison. The module docstring at `TauCetiRoadmap/AlgebraicCurves/Suggested.lean:15–44` names the pinned results. Its two remaining headlines are exactly general automorphism finiteness with positive geometric genus and the perfect-field corollary. No headline or carrier changed.

All fifteen of this round's seeded targets (§§0.1, 2.2, 3.1, 4.3, 5.4, 6.1, 6.2, 6.4, 8.1, 8.5, 8.10, 10.4, 11.1, 11.4, 11.6) are untouched. Accordingly, no new locator audit was triggered by the incremental diff. Prior source verification and uncertified statuses are inherited, not represented as fresh reading. The tables retain all 29 displayed rows from review ~59, including its two grouped historical rows; ten supplemental computations below make the present sample explicit. There are zero changed statements requiring new adversarial rows.

### Adversarial table: carried evidence

Each row in the next two tables cites [review ~59](PRREVIEW-AlgebraicCurves~59.md), “Adversarial table”, by its original row label. These are carried computations, not computations claimed to have been rerun. The grouped S and C rows are retained at exactly the granularity in that report.

| # / provenance | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| ~59 T1 | §0.1 predicate | `k(X)` with `x = X² + 1`; `k(X, Y)`; `ℚ(i)/ℚ`; `ℂ(X)/ℝ` | `X` is a root of `T² − (s − 1)` over `k(s)`, irreducible, so `[k(X) : k(s)] = 2`. `trdeg k(X,Y) = 2` and `trdeg ℚ(i) = 0`: both fail. `[ℂ(X) : ℝ(X)] = 2`: holds with constants `ℂ ≠ ℝ` | holds | none |
| ~59 T2 | §3.2 product formula, `Cl⁰` | `div X` on `k(X)`; `ℂ(X)/ℝ`; `y² = x³ − x / ℚ` | `1 − 1 = 0`; `2 − 2 = 0`. A function in `L(P − O)` would have a single simple pole, so `[F : ℚ(f)] = 1` and `F` would be rational: `ℓ(P − O) = 0`. On `ℂ(X)/ℝ`, `ℓ(0) = 2`, so "principal iff `ℓ = 1`" needs exactness, which the Layer 3 convention supplies | holds | none |
| ~59 T3 | §3.5 `k(X)` at divisor level | `f = (X² + 1)/X`; `L(2P_∞)`; `D = P_X − P_∞` | `ord_∞ f = 1 − 2 = −1`, `ord_{P_X} f = −1`, so `deg (f)_∞ = 2 = max(2, 1)`. Basis `1, X, X²`, so `ℓ = 3`. `div X⁻¹ + D = 0`, so `L(D) = k·X⁻¹` | holds | none |
| ~59 T4 | §4.2 quotient dimensions | `P_{X²+1}` over `ℚ`; `F ∩ A_F(nP_∞)` | `dim 𝔪⁻¹/𝔪⁰ = 1 · 2 = 2`; the intersection is `L(nP_∞)` of dimension `n + 1` | holds | none |
| ~59 T5 | §4.4 Riemann–Roch, uniqueness | `k(X)`, `W = −2P_∞`, `D = nP_∞`; `W₀ = 0` | For `n ≥ −1`: `n + 1 = n + 1 − 0 + ℓ(−(n+2)P_∞) = n + 1 + 0`. For `n = −2`: `0 = −1 + ℓ(0) = 0`. For `W₀ = 0` at `D = 0`: `1 ≠ 0 + 1 − 0 + 1 = 2` | holds | none |
| ~59 T6 | §5.1 regime `deg D ≥ 2g − 1` | `D = W`; `g = 0`; `y² = x³ − x` | `ℓ(W) = g ≠ g − 1`; at `g = 0`, `0 ≠ −1`. `(x)_∞ = 2O` and `(y)_∞ = 3O`, with `n = 2, 3 ≥ 2g = 2` | holds | none |
| ~59 T7 | §5.6 class number | `y² = x³ − x / 𝔽₃`; `𝔽₂(x)` | `x³ − x ≡ 0` on `𝔽₃`, so the points are `(0,0), (1,0), (2,0), O` and `h = 4 = 3 + 1 − 0`. Degree-1 places of `𝔽₂(x)` are `0, 1, ∞`; the only irreducible quadratic is `x² + x + 1` | holds | none |
| ~59 T8 | §6.1 `e`, `f` | `y² = x`; `ℝ(x) ⊂ ℂ(x)` | Over `P_x`, `ord_{P′}(x) = 2 = e`. Over `P_{x−1}`, `y = ±1`: `e = f = 1`, `r = 2`, `efr = 2`. At `∞`: `e = 1`, `f = 2` | holds | none |
| ~59 T9 | §7.2 Dedekind | `y² = x³ − x` (char `≠ 2`); `y² + y = x³ / 𝔽₂` | Four tame branch places with `d = 1 = e − 1`, so `2g − 2 = 2(−2) + 4 = 0`. Artin–Schreier with pole order `m = 3`: `d = (2 − 1)(3 + 1) = 4 ≥ e = 2`, and `2(−2) + 4 = 0` | holds | none |
| ~59 T10 | §8.11 inseparable steps, genus bounds | `t = y^p` over `𝔽_p(s)`; `y² = x³ − x / ℚ` | At `(t − s)` the residue extension is `k(s^{1/p})/k`, so `f = p`, `e = 1`. At `(t)`, `ord_{(y)} t = p`, so `e = p`. Riemann: `(2−1)(3−1) = 2`. Plane bound: `n = 3`, `(x)_∞ = 2O ≤ 3O`, `½ · 2 · 1 = 1 = g` | holds | none |
| ~59 T11 | §10.1 elliptic fields | `y² = x³ − x`; `y² = x³ + a / 𝔽₂(a)`; `y² = x³ − t / 𝔽₃(t)` | `Δ = −16(4(−1)³ + 0) = 64`. `3(−2) + 2·2 + 2·1 = 0`; `b₆ = 4a = 0`, `Δ = a₃⁴ = 0`; over `k(√a)`, `u = v/x` gives `u² = x`, `v = u³`. For `x³ − t`, the derivative is `0`, `Δ = −27b₆² = 0`, and `2(−2) + (3 + 1) = 0` gives `g = 1` | holds | none |
| ~59 T12 | §10.5 smooth plane curves | Klein quartic; cubic; conic; nodal cubic | `g = 3·2/2 = 3`, then `1`, then `0`. For `y² = x²(x + 1)`, `t = y/x` gives `x = t² − 1`: rational, `g = 0 ≠ 1` | holds | none |
| ~59 T13 | §11.3 Weierstrass weights | `y² = x⁵ − 1`; Klein quartic; `y³ + y = x⁴ / 𝔽̄₃` | `6 · 1 = 6 = 2³ − 2`; `24 = 3³ − 3`. Semigroup `⟨3, 4⟩` has gaps `{1, 2, 5}`, `5 − 2 = 3 ≡ 0`. The pin assumes exactly this gap injectivity | holds | none |
| ~59 T14 | §11.5 Hurwitz bound | `(2,3,7)`, `(2,3,8)`; `y² = x⁶ − 1` | `−2 + ½ + ⅔ + 6/7 = 1/42`; `−2 + ½ + ⅔ + 7/8 = 1/24`. `(iy/x³)² = x⁻⁶ − 1`; the reduced group is `D₆` of order 12, so `\|Aut\| = 24 ≤ 84` | holds | none |
| ~59 T15 | §11.6 Hermitian translations | `q = 41, 37, 64`; `q = 3` | `(y + a^q x + b)^q + (y + a^q x + b) − (x + a)^{q+1} = b^q + b − a^{q+1}`, with `q² · q = q³` pairs. `68921 > 68796`, `50653 < 55860`, `262144 > 169260`. `\|PGU₃(3)\| = 27 · 28 · 8 = 6048` | holds | none |

| # / provenance | Statement | Values computed there | Result |
|---|---|---|---|
| ~59 N1 | §8.1 item 1 converse | `y^p = a + bx^p`: `z^p = 0`, `[F : kF^p] = p²`; perfect closure of `𝔽_p(t)`: no separating element | holds |
| ~59 N2 | §8.1 item 2 forward | `e = (1⊗1 + i⊗i)/2`, `e² = e` in `ℂ(x) ⊗_ℝ ℂ` | holds |
| ~59 N3 | §8.1 item 2 converse | `F ⊗_ℝ ℝ` is a domain with `i ∉ ℝ`: algebraic closure load-bearing | holds |
| ~59 N4 | §11.4 step 1 | `ℂ(x) ⊗_ℝ ℂ ≅ ℂ(x)²`: two primes without exactness | holds |
| ~59 N5 | §11.4 step 3 opening | `y² = (x³ − t)(x² − 1) / 𝔽₃(t)`: `g = 2`, `g′ = 1` | holds |
| ~59 N6 | §11.4 `p`-th-power lemma | `det[[1,1],[t^p, t^p+1]] = 1 = 1^p` | holds |
| ~59 N7 | §11.4 use of the Mathlib lemma | `y^p` field: `y^p − bx^p − a = 0` breaks `H` | consistent |
| ~59 N8 | §11.4 perfect-closure Check | `r(t + a) = r(t)` for infinitely many `a`, so `u ∈ 𝔽̄_p` | holds |
| ~59 N9 | §9.2 residue Check | `p = 3`: `d(cx⁻³) = 0`; `p = 5`: `x⁻⁵dx = d(x⁻⁴)` | holds |
| ~59 N10 | `Suggested.lean` line 27 | `[Algebra.IsSeparable k k′]` only at `Genus/Basic.lean:267` | agrees |
| ~59 S1–S8 | §§0.2, 0.3, 1.2, 7.4, 8.4, 8.10, 9.3, 10.2 | e.g. S4 `2 = −4 + 6`; S5 `2·2 ≤ 2 + 2`; S6 `e = lcm(2,3) = 6`; S8 `div x = 2P₀ − 2O` | hold |
| ~59 C1 | General headline (Lean line 80) | `y² = (x³−t)(x²−1)`: `g′ = 1`, `\|Aut\| ≤ 12`; `y⁵ − y = ax⁵`: `g′ = 0`, infinite | true |
| ~59 C2 | Perfect corollary (Lean line 104) | Hermitian `g = 3`, `\|PGU₃(3)\| = 6048`; `y² = x⁵ − 1 / ℚ`: `g = 2` | true |
| ~59 C5–C25 | §§11.4 step 2, 2.3, 6.3, 1.1, 3.1, 3.4, 4.1, 4.2, 5.1, 5.2, 5.7, 6.1, 7.2, 8.7, Layer 6, 8.1/12B.0, 10.1, 8.11, 11.6 | as listed there: e.g. C10 `2n − 2(n+1) + 1 = −1`, C19 Hilbert sum `4 = d`, C21 fierce `V₄` sum `3`, `d = 2`, C25 `68921 > 68796` | hold |

### Supplemental sample computations

These small calculations expose the present sample's cases without reopening the full review of unchanged targets.

| Statement | Instances | Computed values on both sides | Result | Change |
|---|---|---|---|---|
| §2.2 place/prime dictionary | ℚ(X), primes X and X²+1, infinity | ord₀(X)=1 and adic order=1; both multiplicative valuations give exp(−1); residue degree at X²+1 is 2=dimℚ ℚ[X]/(X²+1); ord∞(X)=−1 excludes infinity from the affine chart | agrees | none |
| §3.1 divisors | X and X⁻¹; constant i over ℝ | (P₀−P∞)+(P∞−P₀)=0=div(1); div(i)=0 although i∉ℝ, so exactness is necessary for the stated equivalence | agrees | none |
| §4.3 canonical class | ℚ(X), η=dX | div η=−2P∞; deg=−2=2·0−2; div(Xη)=P₀−3P∞=(P₀−P∞)−2P∞; regular differential dimension=0=g | agrees | none |
| §5.4 gaps | genus-one point; infinity on y²=x⁵−1 over ℚ | gaps {1}, count 1=g; semigroup ⟨2,5⟩ misses exactly {1,3}, count 2=g and maximum 3=2g−1 | agrees | none |
| §6.2 conorm | quadratic constant extension of k(x); x=y² in characteristic zero | 2·deg(P∞′)=2=2·deg(P∞); Con(P₀)=2P₀′ so 1·2=2·1; geometric degrees are respectively 1 and 2 | agrees | none |
| §6.4 Kummer | over ℚ, y²=x at x=1; y²=x²(x−1) at x=0 | first: T²−1=(T−1)(T+1), two places each e=f=1; second: reduction T² has multiplicity 2, but z=y/x gives z²=x−1 and e=1,f=2, so e is not that multiplicity without monogenicity | agrees in these instances | none |
| §8.5 genus drop | y²=x³−t over 𝔽₃(t), then a³=t | after a, x−a=u² and y=u³; g′=0≤1=g; normalization quotient k[u]/k[u²,u³] has missing monomial u, dimension δ=1, so 1=0+1 | agrees | none |
| §8.10 composita | x^(1/2), x^(1/3), characteristic prime to 6; square roots at x=4 | e=6=lcm(2,3); over ℂ four places give 4·1=4; over ℚ two places with residue degree 2 give 2·2=4 | agrees | none |
| §10.4 hyperelliptic genus | y²=x⁵−1 and y²=x⁶−1 in characteristic zero | (5−1)/2=2=(6−2)/2; in both cases Hurwitz gives 2·2−2=2=−4+6; infinity ramifies only in the odd-degree case | agrees | none |
| §11.1 small-genus automorphisms | 𝔽₂(x); y²=x³−x over 𝔽₃ | #PGL₂(𝔽₂)=(4−1)(4−2)/(2−1)=6=2(2²−1); elliptic points are O,(0,0),(1,0),(2,0), hence translation group order 4=h | agrees | none |

§0.1 is covered by carried T1; §6.1 by T8; §8.1 by N1–N3; §11.4 and both Lean headlines by C1–C2 and N4–N8; §11.6 by T15. Every current sampled target thus has computed values displayed.

Untouched-text remark, not a finding under the incremental rules: the first Check of §6.4 has coincident factors T−b and T+b in characteristic 2; x=y² then has one place with e=2,f=1, rather than the two places described there.

### Inherited source evidence

Review ~59's readable-source audit records Fulton2008 line 3997 for the smooth-plane genus formula and line 4124 for canonical adjoints. Its ten-row pinned-declaration audit and Stichtenoth docstring locator cross-checks remain evidence for unchanged text, with their original limitations. No source passage has been copied, no source manifest has been edited, and no fresh source issue was discovered in this incremental review.

## Not verifiable

- `Stichtenoth2009` remains settled as uncertified. Most locators in this round's unchanged seeded targets refer to it; pinned docstrings corroborate some numbering but do not certify the book's text, printed pages or hypotheses. No new access was requested.
- Also settled as uncertified and retained by locator only: `Hartshorne1977`, `Serre1979`, `Deuring1973`, `Goldschmidt2003`, `Rosen2002`, `VillaSalvador2006`, `Roquette1970`, `Stichtenoth1973a`, `Stichtenoth1973b` and `Liu2002`. The supplied cache/status inventory and prior review are the access record for this unchanged review scope; none was refetched.
- This report does not claim a fresh full source or ownership audit of the 0-line diff. It carries the preceding accepted review's unchanged evidence and records the fresh gate, build, elaboration, signatures, supplier and overlap checks above.

## Source issues

- none
