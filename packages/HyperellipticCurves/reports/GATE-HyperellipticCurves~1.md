# GATE-HyperellipticCurves~1 — answers to the review of `deedd7d`

One review (CBirkbeck, 2026-11-02T09:51:09Z) with findings F01–F25, numbered H01–H25 in order.
Edits are in `TauCetiRoadmap/HyperellipticCurves/README.md` and
`TauCetiRoadmap/HyperellipticCurves/Suggested.lean`, commit `6bf698ac` (not pushed). The text of
F25 is truncated in the review itself, so H25 answers the visible claim.

## H01 (CBirkbeck) — applied

Confirmed at the pin: `discr_C` and `discr_of_degree_eq_one` give `1`, so `formDiscr 1 2 = 1` while `2² · discr 2 = 4`. `Suggested.lean` `formDiscr_eq_of_natDegree_eq_pred`: `(hn : 1 ≤ n)` → `(hn : 2 ≤ n)`. README convention 2 and 0.1 now say `n ≥ 2` and record `disc_1 = 1` as a separate convention, with this instance as the negative control.

## H02 (CBirkbeck) — applied

Tau Ceti's `IsHyperellipticFunctionField` (`Hyperelliptic/Basic.lean`) has no geometric condition, and `genus_eq_of_sq_eq` gives genus 2 for `y² = x⁵ − t` over `𝔽₅(t)`, whose genus over `k̄` is 0. In README 0.4 the single converse becomes (a) a regular-model converse in all cases and (b) the smooth-model converse, which holds iff `twoChartModel` of `F` is smooth over `k` (automatic over a perfect field). The `𝔽₅(t)` field is kept as the negative control.

## H03 (CBirkbeck) — applied

README 0.6: the degree criterion now carries `2 ≠ 0`. In characteristic 2, a point at infinity is a Weierstrass point iff `h_{g+1} = 0`, and it is rational iff `f_{2g+2}` is a square. `y² + y = x⁵` over `𝔽₂` (`h₃ = f₆ = 0`, `4f + h² = 1` of degree 0) is the negative control. The Lean `numRationalWeierstrassPoints_eq` already had `(h2 : (2 : k) ≠ 0)`.

## H04 (CBirkbeck) — applied

Checked: `a² = 1`, and `x ↦ −1/x̄` has no fixed point since `|x|² = −1` has no solution. README 1.5 now constructs the general twist as a smooth projective curve `C'` with a degree-2 map to the genus-0 curve `C'/ι`. It is the curve of a `Model k g` iff `C'/ι ≅ ℙ¹_k`, iff the image of the cocycle in `H¹(k, PGL₂)` is trivial. The `y² = x⁸ + 1` cocycle is the negative control.

## H05 (CBirkbeck) — applied

Recomputed: `#C(𝔽₁₁)` is `16` for `y² = x⁵ − 1` and `3` for `y² = x⁵ − 2`, so `a₁ = 4` against `−9`, which are not negatives of each other. README 1.5: "`Aut(C) = ⟨ι⟩` implies …" → "`Aut(C_{k^{sep}}) = ⟨ι⟩` implies …". The `x⁵ − 2` twist is kept as a non-quadratic negative control.

## H06 (CBirkbeck) — applied

README convention 8 and 2.3 now say:
- the stored `igusa_clebsch_inv` is a function of the Igusa point;
- `J(W_min)`, and therefore the stored `igusa_inv`, is an invariant of the `ℚ`-isomorphism class only.

Witness: 3125.a.3125.1 and its quadratic twist by 3 have the same point, but `v₃(J₁₀(W_min))` is `0` and `10`. The twist scales `J_{2k}` by `9^k`. Steps are multiples of 10 (3.1), and the twist by a ramified character cannot have good reduction.

## H07 (CBirkbeck) — applied

README 2.5: the triple `(g₁, g₂, g₃)` determines the Igusa point when `char k ≠ 2`, in each of the three branches (normalise `J₂`, `J₄` or `J₆` to 1; `J₈` is then forced). In characteristic 2, `J₈` is free. `[0:0:0:0:1]` and `[0:0:0:1:1]` both give `(0, 0, 0)`, now a Check, and there the Igusa point itself is the classifying invariant (2.4).

## H08 (CBirkbeck) — applied

`(diag(1, π^{−m}), π^{−m(g+1)}, 0)` gives `f(π^m x)`, as stated. README 3.1 now uses `(1, π^{−m}, 0)`, which gives `f' = π^{2m} f` and `h' = π^m h`, with the review's example (`π² x⁵ + π` at `m = 1`).

## H09 (CBirkbeck) — applied

Verified:
- `v(Δ) = 12` for both equations.
- Both are minimal by DDMM Corollary 1.24 (after the integral inversion `x ↦ 1/x` for `f'`, the leading coefficient becomes `−12`, a unit).
- An exhaustive search of `PGL₂(𝔽₁₁)` finds no element sending `0 ↦ ∞` and `{1, 2, 3}` onto `{0, 1, 2}`.

README 3.3 now proves uniqueness up to `𝒢_1(R)` only in genus 1 (Silverman VII.1.3 (d)), records the genus-2 counterexample, and keeps only the uniqueness of `v(Δ_min)`. The minimal regular model is deferred to StableReduction Layer 5. Same pattern fixed in "Not owned here" (README "*set* of minimal equations … not a single `𝒢_g(ℤ)`-orbit") and in the Lean docstring of `Δ_eq_of_isGlobalMinimal`.

## H10 (CBirkbeck) — applied differently

The defect is real: at `g = 1` the step `2(2g+1) = 6` gives `m = 2` where `obstructionExponentAt` (Tau Ceti `MinimalModel/ObstructionExponent.lean`, factor 12) gives `1`.

**Repair.** Rather than writing `m = 2 · obstructionExponentAt`, README 3.1 now uses the exact step `N_g = gcd(4(2g+1), (2g+1)(2g+2)) = 2(2g+1) · gcd(2, g+1)`. Every multiple occurs, since `v(e)` and `v(det M)` vary independently. Then `N_1 = 12`, so `m` is exactly `obstructionExponentAt` and the genus-1 defect class is exactly `weierstrassDefectClass`; `y² = x³ − 5⁴x` is the Check.

**3.4 restated with that step.**
- The defect class is model-independent: `𝔍' = 𝔍 · (e)^{−2}(det M)^{g+1}` for even `g`, and `𝔍 · (e)^{−1}(det M)^{(g+1)/2}` for odd `g`.
- If a global minimal model exists, the class is trivial.
- Existence over a principal ideal domain.
- The converse for even `g`: scalar triples shift the Steinitz classes so that both are trivial.
- At `g = 1`, Tau Ceti's theorem.
- For odd `g ≥ 3`, the converse only under the extra Steinitz-class hypothesis the argument needs.

The unconditional Dedekind iff was dropped.

## H11 (CBirkbeck) — applied

Arithmetic genus `Σ gᵢ + #nodes − #components + 1`: two `ℙ¹` meeting at three nodes give `2`, a triangle of lines gives `1`. README 3.7 type list: "three lines" → "two smooth rational curves meeting at three nodes". The last three types are now genus-1/genus-1, genus-1/nodal rational and nodal rational/nodal rational, meeting at one node, each of genus 2. The list no longer pairs descriptions with Liu's numerals: Liu 1993 could not be read from a legal source (the sources service found none), and this fix does not depend on its text.

## H12 (CBirkbeck) — applied

Checked: `disc(x⁵ − x + 1) = 2869 = 19·151` (prime to 7), so the curve has good reduction; for `7f`, `ν_ℛ = 1` is odd. README 4.3 now separates two statements:
- (a) `𝒢_g(K)` transports the arithmetic data (picture with its `G_K`-action, `v(c_f)` and so every `ν`, the signs `ε`), which makes the 4.4–4.12 invariants invariants of the curve;
- (b) only Theorem 1.8 (3), (6), (7), (8) descend to bare equivalence.

## H13 (CBirkbeck) — applied

DDMM Definition 1.12 (arXiv 1808.02936v2, read via the sources service) sets `ε_𝔰 = 0` on clusters that are neither even nor cotwins. README convention 12 and 4.2 now follow it:
- `ε_𝔰` is a sign only for even clusters and cotwins, and restricts to a character on `G_𝔰`;
- conjugate transport is stated;
- `γ̃_𝔰` is defined with its order (Theorem 1.19).

The good quintic now gives `0 ⊖ 0 = 0`.

## H14 (CBirkbeck) — applied

README 4.8: `c = #(coker(H₁ → Hom(H₁, ℤ)))^{Frob}`, the invariants of the cokernel, following DDMM Lemma 2.22 and Remark 2.23. The `[2]`, `Frob = −1` example (2 against 1) is the negative control.

## H15 (CBirkbeck) — applied

README 5.4: toric factor `∏_{A/Frob}(1 − ε_𝔰(Frob^{f_𝔰}) T^{f_𝔰}) / (1 − ε_ℛ(Frob) T)^{[ℛ übereven]}`. For three split twins this gives `(1 − T)²`, of degree 2. README 4.12 drops the loop product and keeps `w = (−1)^{a_+}` (DDMM Theorem 2.20), with `a_+` counted with the same relation. For three split twins `a_+ = 2` and `w = +1`.

## H16 (CBirkbeck) — applied

README 4.13 now states DDMM Theorem 1.29 with its hypotheses: `c_i g_i` with `g_i` monic and integral, `c₁c₂` a square, congruence modulo `π^{d+1}`, the semistable clause, and `|k| > deg g₁` for the minimal discriminant. Recomputed: `#C(𝔽₇)` is `7` and `9` for the review's pair; `49 · 147 = 7⁴ · 3` is not a square.

## H17 (CBirkbeck) — applied

Confirmed: the Galois group of `x⁴ + 1` is the normal Klein four subgroup, and the resolvent cubic `x³ − 4x` splits, so `ℚ(J[2]) = ℚ`. Changes:
- README 5.1 now carries `g ≥ 2` and says why (the action is faithful), with the genus-1 quartic as negative control.
- Lean `twoTorsionField` docstring: "The two-torsion field of the Jacobian…" → "The splitting field of the Weierstrass form…". It is `k(J[2])` only for `g ≥ 2` and characteristic `≠ 2`, and the genus-1 and genus-0 cases are stated.

## H18 (CBirkbeck) — applied

Verified `4f + h² = (x³ + 2x² − x − 1)² + 4x²(x + 1)²` coefficient by coefficient. The second summand vanishes only at `x = 0, −1`, where the first is `1`. Worked example 169.a.169.1: "two components" → "**one** component", with the `Y = y/x³` gluing argument and the parity contrast against a positive quartic.

## H19 (CBirkbeck) — applied

`ζ ↦ ζ⁷ = ζ²` fixes no primitive fifth root of unity. Worked examples: "`Aut = C₁₀`" over `𝔽₇` → "`Aut(C_{𝔽̄₇}) = C₁₀` but `Aut(C) = C₂`". The `𝔽₁₁` and `𝔽₅` lines are kept.

## H20 (CBirkbeck) — applied

`TauCetiRoadmap/HyperellipticCurves/Suggested.lean` now opens with `module`, its imports are `public import Mathlib` followed by `public import` of the same five `TauCeti.*` modules, and the declarations sit in an `@[expose] public section`, so they stay public and their bodies unfold for consumers. The targeted build now ends with no warning other than `declaration uses 'sorry'`, and the gate accepts the imports (`imports=0 … no-import-mathlib=0`); no `set_option` was added. On main, `TauCetiRoadmap/TypeAHeckeAlgebras/Suggested.lean` already uses the module header with `public import`, and every pinned Mathlib and Tau Ceti file is a module.

## H21 (CBirkbeck) — applied

README 4.1: `clusterPicture f` now requires `f` separable **of positive degree**, with the constant `1` (empty `ℛ`) as the reason. The Lean `ClusterPicture` structure is unchanged; its fields are consistent for every nonempty `X`.

## H22 (CBirkbeck) — applied

Confirmed: `Hyperelliptic/Finite.lean` has `[NeZero (2 : k)]` in its `variable` block. README 1.4 now gives finiteness in all characteristics through StableReduction Layer 3 ("a stable geometric fibre has a finite abstract automorphism group"; a smooth curve of genus `≥ 2` over `k̄` is stable). The Tau Ceti theorem is kept only for `char ≠ 2`, with `y² + y = x⁵` over `𝔽̄₂` explaining why. The prerequisites and the "Consumed" list (StableReduction Layer 3 added; the Tau Ceti finiteness marked `NeZero (2 : k)`) are updated to match.

## H23 (CBirkbeck) — applied

README introduction and convention 1, plus the Lean module docstring, `ofWeierstrass` docstring and the Layer 0.5 section title: "the genus-1 case **is** `WeierstrassCurve`" → "`WeierstrassCurve` is the genus-1 sub-case with `f` monic cubic, `deg h ≤ 1`". `y² = −(x⁴ + 1)` over `ℝ` is named as a genus-1 model outside the bridge.

## H24 (CBirkbeck) — applied

Lean `IsGlobalMinimal`: "`IsIntegral ℤ W` and `|Δ|` minimal" → `IsGlobalMinimal O W := ∀ v : HeightOneSpectrum O, IsMinimal (Localization.AtPrime v.asIdeal) W`, over a Dedekind `O` with fraction field `K`, the shape of Tau Ceti's `WeierstrassCurve.IsGlobalMinimal`. It needs the Tau Ceti imports `TauCeti.RingTheory.Localization.AtPrime` and `TauCeti.RingTheory.DedekindDomain.LocalizationAtPrime`. Added `IsGlobalMinimal.isIntegral`, and `exists_isGlobalMinimal` is now the PID headline `[IsPrincipalIdealRing O]`. `Δ_eq_of_isGlobalMinimal`, `minimalDiscriminant` and `minimalDiscriminant_spec` use `IsGlobalMinimal ℤ`. README 3.4 names all four declarations.

## H25 (CBirkbeck) — applied

The finding is cut off at its location line, so this answers its title. README 3.7 now confines Liu's minimal-extension and Namikawa–Ueno tables to a complete discrete valuation ring with algebraically closed residue field. Over a general `R` they are applied after base change to the completed strict henselisation, with the rational component group taken as the Galois invariants. If the truncated text claimed more, it needs restating.

## Adversarial pass on changed statements

| Statement | Instances tried | Values | Result | Change |
|---|---|---|---|---|
| `formDiscr_eq_of_natDegree_eq_pred` (`2 ≤ n`) | n=1,G=2; n=2,G=bX+c; n=3,G=aX²+bX+c | 1 vs 4 (excluded); b² = b²·1; a²b²−4a³c = a²(b²−4ac) | holds for n≥2 | hn: 1≤n → 2≤n |
| `IsGlobalMinimal.isIntegral` | O a field (empty spectrum); O=ℤ | vacuous premise, integrality over K trivial; ℤ = ∩ ℤ_(p) | holds | new |
| `exists_isGlobalMinimal` (PID) | O field; O=ℤ, g=0,2 | vacuous; v(Δ) ∈ ℕ at finitely many p, CRT patch | holds | PID generality |
| `Δ_eq_of_isGlobalMinimal` | ratio of two global minimal Δ | p-adic unit ∀p ⇒ ±1; e^{−4(2g+1)}det^{(2g+1)(2g+2)} > 0 | equal | hypotheses → `IsGlobalMinimal ℤ` |
| step `N_g` (3.1) | g=1,2,3 | gcd(12,12)=12, gcd(20,30)=10, gcd(28,56)=28; y²=x³−5⁴x: 12/12=1 | matches Tau Ceti at g=1 | new |
| defect class independence | g even / odd | 𝔍'=𝔍(e)^{−2}(det)^{g+1}; 𝔍(e)^{−1}(det)^{(g+1)/2} | principal ratio | new |
| even-g converse | classes α=[A], β=[B], −2α+(g+1)β=0, g+1=2k+1 | α=(g+1)α′, β=2α′, shift σ=−α′ kills both | holds | new |
| char-2 infinity criterion | y²+y=x⁵/𝔽₂ | h₃=f₆=0 ⇒ T²=0, ι: T↦T+h₃ fixes | rational W-point | new |
| twist has model iff split quotient | y²=x⁸+1/ℝ | x↦−1/x̄: \|x\|²=−1 no solution | no model | new |
| geometric Aut ⇒ quadratic twists | y²=x⁵−c/𝔽₁₁ | 16, 3 points | x⁵−2 not quadratic | premise geometric |
| absolute invariants determine point (char≠2) | 3 branches | J₂=1 ⇒ J₁₀=1/g₁, J₄=g₂/g₁, J₆=g₃/g₁; J₄=1 ⇒ J₁₀ up to sign = λ=−1; J₆=1 ⇒ J₁₀ up to ω = cube-root scaling | holds; char 2: J₈ free | char ≠ 2 |
| stable genus-2 types | 7 types | 2, 1+1−1+1, 0+2−1+1, 0+3−2+1, 2+1−2+1, 1+2−2+1, 0+3−2+1 = 2 each; triangle 0+3−3+1=1 | all genus 2 | IV corrected |
| toric Euler factor | three split twins; good quintic | (1−T)³/(1−T)=(1−T)², deg 2; ε_ℛ=0 ⇒ divisor 1 | deg = toric rank | relation added |
| root number | three split twins | a₊=3−1=2, w=+1 | matches lattice | formula replaced |
| Tamagawa | [2] on ℤ, Frob=−1 | (ℤ/2)^F=2; coker on invariants=1 | invariants of coker | formula fixed |
| local constancy | f₁=49g, f₂=147g over ℚ₇ | 7, 9 points; 49·147=7⁴·3 non-square | excluded by square condition | hypotheses added |
| 2-torsion field | y²=x⁴+1, g=1 | ℚ(ζ₈) vs ℚ | g≥2 needed | g ≥ 2 |
| real components | 169.a.169.1 | Y→+1 at +∞, −1 at −∞ on upper sheet | 1 component | value fixed |
| 𝔽₇ automorphisms | y²=x⁵−1 | ζ↦ζ² fixes only 1 | Aut(C)=C₂ | qualifier |

## Signatures

The changed declarations were checked mechanically: temporary `#check @name` lines were added to `Suggested.lean` for `formDiscr_eq_of_natDegree_eq_pred`, `IsGlobalMinimal`, `IsGlobalMinimal.isIntegral`, `exists_isGlobalMinimal`, `Δ_eq_of_isGlobalMinimal`, `minimalDiscriminant`, `minimalDiscriminant_spec` and `twoTorsionField`, elaborated once with the targeted build, and then removed. Each elaborated type carries exactly the binders its README statement names: `2 ≤ n`; `[IsDedekindDomain O] [IsFractionRing O K]`; `[IsPrincipalIdealRing O]` on the existence theorem; `IsGlobalMinimal ℤ` on the ℚ statements. No section binder was lost. The other declarations are unchanged from the worker's `signatures.md`.

## Ownership and citations

- **New supplier cited:** StableReduction Layer 3, on main and already a consumed roadmap.
- **Tau Ceti files checked at the pin:** `Hyperelliptic/Finite.lean`, `MinimalModel/ObstructionExponent.lean`, `RingTheory/Localization/AtPrime.lean` and `RingTheory/DedekindDomain/LocalizationAtPrime.lean`.
- **Ownership:** no new carrier was introduced. The genus-g global-minimality predicate is this roadmap's, modelled on Tau Ceti's elliptic one. Ownership was not re-searched against open pull requests.
- **DDMM:** read from arXiv 1808.02936v2 through the sources service. Because this job may not edit a `sources.toml`, the roadmap has none, so DDMM is cited by its theorem numbers only.
- **Liu 1993:** no legal source was found. The H11 repair does not depend on its text, so no `needs-references.toml` entry was left.

## Build and gate

- `lake build TauCetiRoadmap.HyperellipticCurves.Suggested`: `Build completed successfully (9102 jobs)`. Every warning is `declaration uses 'sorry'`; the module-system import warning no longer appears (see H20).
- Depcheck: `depcheck: 204 roadmaps, 1526 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved lines. The README is unchanged by the module-header repair.
- Gate (`--base origin/main`, on the commit adding the module header): `gate HyperellipticCurves: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
