# Review of AlgebraicCurves (pull request #1807 at 8f64f53)

**Verdict:** accepted

This is an incremental re-review of the 105 lines changed since 5048718. One commit touches this folder: README §8.1 items 1–2 and their *Needs:*, one §9.2 Check, §11.4 steps 1 and 3 with a new Check and the *Needs:*, the Rosenlicht reference, and line 27 of the `Suggested.lean` module docstring.

All four previous findings are repaired. The changed passages introduce no new defect, so this report raises no finding.

## Previous findings

- R01 — repaired: "the `p`-th powers of `E^G`-linearly independent elements of `E` are `E^G`-linearly independent … Since `F/k` is finitely generated (`TauCeti.IsFunctionField.essFiniteType`), Mathlib's `…_of_linearIndepOn_pow_of_essFiniteType` then gives a separating transcendence basis" (README lines 2036–2047, with a new Check at lines 2103–2110).
- R02 — repaired: "`x^{−p−1} dx` has residue `0` at `P_0` … and `x^{−p−1} dx` is not exact in `k((x))` … Its neighbour `x^{−p} dx = d(x^{1−p})` … is exact, of residue `0`" (README lines 1629–1634).
- R03 — repaired: item 1 cites `TauCeti.isGeometricallyReduced_of_separating` and its pinned converse. Item 2's converse is "a composite of pinned theorems". Step 1 cites `TauCeti.isDomain_tensorProduct_of_isIntegrallyClosedIn`, `separableClosure.isPurelyInseparable` and `PrimeSpectrum.isHomeomorph_comap_of_isPurelyInseparable`. Both *Needs:* lines list them (README lines 1237–1289 and 2004–2077).
- R04 — repaired: "genus invariance under separable algebraic constant extension, finite or not, `TauCeti.genus_eq_genus_of_constantCompositum_eq_top`" (`Suggested.lean` line 27).

## Verified sound

### The repairs, checked against the source and the pins

**R01 (§11.4 step 3).**

- *The lemma matches the source.* `Rosenlicht1955` lines 172–174 (p. 4) reduce the Lemma to one claim: a relation `∑ cᵢ fᵢ^p = 0` with `cᵢ` in the fixed field and not all zero makes the `fᵢ` dependent over the fixed field. That is MacLane's criterion, which is how the README now reads it.
- *The lemma is true for every group `G`.* If `e₁, …, eₙ` are independent over `E^G`, Artin's argument gives `σ₁, …, σₙ ∈ G` with `det(σⱼ(eᵢ)) ≠ 0`. Then `det(σⱼ(eᵢ^p)) = det(σⱼ(eᵢ))^p ≠ 0`, so the `p`-th powers are independent too.
- *Its use meets the Mathlib lemma's hypotheses.* `exists_isTranscendenceBasis_and_isSeparable_of_linearIndepOn_pow_of_essFiniteType` (`Mathlib/FieldTheory/SeparablyGenerated.lean:289`, variables at lines 44–46 and 189) needs four things, and step 3 supplies each:
  - `p` prime and `[ExpChar k p]`: from the new opening sentence, which makes `k` imperfect of characteristic `p`;
  - the hypothesis `H` over every `Finset`: from the lemma, with `E^G = k`;
  - `[Algebra.EssFiniteType k F]`: from `TauCeti.IsFunctionField.essFiniteType` (`TauCeti/FieldTheory/FunctionField/Basic.lean:93`).
- *The new opening sentence is correct.* Over a perfect `k`, `K/k` is separable, so the pinned `genus_eq_genus_of_constantCompositum_eq_top` (`Genus/Basic.lean:273`, variable `[Algebra.IsSeparable k k']` at line 267) gives `g′ = g ≥ 2`. Rosenlicht line 208 makes the same point.
- *The new Check is correct* (computed in row N8).

**R02 (§9.2 Check).** Computed in row N9, at `p = 3` and at `p = 5`.

**R03 (pinned inputs).** Each newly cited declaration was opened at the pin and its statement compared with the README's use:

| Declaration (file:line at the pin) | Statement at the pin | README use |
|---|---|---|
| `TauCeti.isGeometricallyReduced_of_separating` (`TauCeti/FieldTheory/Separable/Regular.lean:90`) | `Transcendental k x` and `[Algebra.IsSeparable k⟮x⟯ F]` give geometrically reduced | item 1 |
| `TauCeti.isDomain_tensorProduct_of_isGeometricallyReduced` (`Regular.lean:110`) | exact and geometrically reduced give `IsDomain (F ⊗[k] A)` for every domain `A` | item 2 |
| `TauCeti.isDomain_tensorProduct_of_separating` (`Regular.lean:142`) | its proof (lines 145–146) is exactly the composite of the two above | item 2, "as the composite of" |
| `TauCeti.exists_isTranscendenceBasis_and_isSeparable_of_isGeometricallyReduced` (`Separable/GeometricallyReduced.lean:105`) | needs `[Algebra.EssFiniteType k K]` | item 1, "which needs finite generation" |
| `TauCeti.IsFunctionField.exists_transcendental_and_isSeparable_adjoin_of_isGeometricallyReduced` (`FunctionField/SeparablyGenerated.lean:76`) | its singleton case through `Separable/TranscendenceDegreeOne.lean:83` | item 1 converse |
| `Algebra.IsGeometricallyReduced.of_isReduced_tensorProduct` (`TauCeti/RingTheory/TensorProduct/Reduced.lean:53`) | a Tau Ceti declaration, correctly listed in the Tau Ceti group of the *Needs:*; one algebraically closed `L` with `IsReduced (L ⊗[k] A)` suffices | item 2 converse |
| `TauCeti.algebraicClosure_eq_bot_of_isDomain_tensorProduct` (`TauCeti/FieldTheory/AlgebraicClosure.lean:72`) | `[IsAlgClosed L] [IsDomain (K ⊗[k] L)]` | item 2 converse |
| `TauCeti.algebraicClosure_eq_bot_iff_isIntegrallyClosedIn` (`FunctionField/ConstantField.lean:122`) | the iff | item 2 converse |
| `TauCeti.isDomain_tensorProduct_of_isIntegrallyClosedIn` (`AlgebraicClosure.lean:57`) | exactness and `[Algebra.IsSeparable k L]` give a domain | step 1, with `L = k^sep` |
| `separableClosure.isPurelyInseparable` (`Mathlib/FieldTheory/PurelyInseparable/Basic.lean:481`) | an instance, under `[Algebra.IsAlgebraic F E]` | step 1 |
| `PrimeSpectrum.isHomeomorph_comap_of_isPurelyInseparable` (`Mathlib/RingTheory/Spectrum/Prime/Homeomorph.lean:66`) | `Spec (R ⊗[k] K) → Spec R` is a homeomorphism for any `k`-algebra `R` | step 1, with `R = F ⊗[k] k^sep` over `k^sep` |

Step 1 departs from the previous review's suggestion, correctly. That review had pointed at `TauCeti.IsPurelyInseparable.isDomain_tensorProduct` (`PurelyInseparable/TensorProduct.lean:94`). That lemma assumes `IsReduced (R ⊗[K] L)`, which fails in the genus-drop case: §8.1's `y^p = a + b x^p` gives a nonzero nilpotent. The homeomorphism the head cites needs no reducedness and yields the unique prime that step 1 uses.

**R04.** The pin's docstring and variable block (`Genus/Basic.lean:265–275`) assume only `[Algebra.IsSeparable k k']`, with no `FiniteDimensional`. The module docstring now agrees.

### Gate, dependency check, elaboration

- The worker's gate at 8f64f53 (`gate.md`) passes every check, including `build=0` and `outside-folder=0`.
- My run of `gate … --base origin/main` reports `outside-folder=26` and nothing else. `git diff --name-only origin/main...HEAD` outside this folder lists exactly 26 files: the `README.md` and `Suggested.lean` of AlgebraicTopology, BordismFormalGroups, CharacteristicClasses, ClassifyingSpaces, ComplexKahlerGeometry, GeneralizedCohomology, LocalPurity, PadicFunctionalAnalysis, PurityOfBranchLocus, ReductiveGroups, RigidAnalyticGeometry, SchemeAndStackFoundations and TopologicalKTheory. The brief names all 13 as this pull request's own, so none is a finding.
- Dependency check output: `depcheck: 236 roadmaps, 2297 edges, 0 problem(s)`. There is no UPWARD and no CYCLE line. The changed text adds no cross-roadmap citation.
- `lake env lean TauCetiRoadmap/AlgebraicCurves/Suggested.lean` gives two warnings, `80:8` and `104:8` `declaration uses 'sorry'`, and nothing else.

### Names, signatures, padding

- **Names.** A scratch file of 15 `#check @…`, one for every name the diff newly backticks, elaborates with no error against `import Mathlib` and the eight Tau Ceti modules that hold them. Each elaborated type matches the README's description (table above).
- **Signatures.** `signatures.md` agrees with README §11.4 for both declarations:
  - the general theorem: `[IsAlgClosure k K]`, `hF`, `hex`, `hc`, `2 ≤ genus k F`, `0 < genus K F'`;
  - the corollary: `[PerfectField k]`, `hF`, `hex`, `hg`.

  The diff changes no Lean statement, and I made no change to the file.
- **Padding.** Both statements are unchanged since 5048718. The previous report's one-tactic probe stands: `infer_instance`, `simp` and `exact?` fail on both, and the pinned `TauCeti.finite_algEquiv_of_two_le_genus` needs `[IsAlgClosed k]`.

### Ownership and overlaps

- `roadmaps grep --readme-only` for the regular-extension objects (`isDomain_tensorProduct_of_separating`, `isGeometricallyReduced_of_separating`, "regular extension of `k`") and for the `p`-th-power criterion finds only AlgebraicCurves: this head, and the copies of the folder in #1808 and #1854. No other roadmap owns them.
- `overlaps.md` reports:
  - no id dropped either way;
  - none that only an open revision defines;
  - #1808 and #1854 conflict with this head, and the description's merge-order block fixes `AlgebraicCurves`: this pull request → #1808 → #1854.

### Consumers of the changed text

- 12B.0a (README lines 2197–2203) consumes "the equivalence of regularity with the tensor-domain condition", which item 2 now states.
- The conventions paragraph (lines 113–116) defines a regular field extension as generic separable generation plus exact constants, which agrees with item 2.
- The §8.11 example `y² = x³ − t` over `𝔽₃(t)` is called geometrically reduced; `x` is separating there (`F/k(x)` has degree 2 in characteristic 3), consistent with item 1's new equivalence.
- The Lean docstring (lines 67–72) agrees with steps 1 and 3.
- BelyiMaps' citation of "§8.1 item 2" still resolves.

### Seeded sample

None of the 15 sampled targets lies in a changed passage. On untouched text I checked:

- Stacks 09GI (§0.2) at `Stacks` line 379: the elements algebraic over `k` form a subfield. It supports the citation.
- The Checks of §§0.2, 0.3, 1.2, 7.4, 8.4, 8.10, 9.3 and 10.2, recomputed in rows S1–S8.
- The remaining sampled sections (§§1.1, 4.1, 5.1, 5.2, 6.1, 7.2, 10.1) are covered by carried rows C8, C11, C13, C14, C16, C17 and C23.

Stichtenoth numbering was cross-checked against the pinned Tau Ceti docstrings for:

- Def. 1.1.4 (`Place/Basic.lean:131`, `:435`), Thm. 1.1.6, Thm. 1.1.13, Cor. 1.1.16;
- Thm. 3.4.13, Cor. 3.4.14, Cor. 3.5.6, Prop. 3.7.3;
- Thm. 3.9.1, Cor. 3.9.3, Cor. 3.9.7;
- Thm. 4.3.2, Rem. 4.3.7;
- Def. 6.1.1, Prop. 6.1.2, Prop. 6.1.3, Prop. 6.1.6.

### Adversarial table

New rows, for every statement the diff changes:

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| N1 | §8.1 item 1 converse (a geometrically reduced function field has a separating element, given finite generation) | `𝔽_p(t)(x)`; `y^p = a + b x^p` over `𝔽_p(a,b)`; the perfect closure `E` of `𝔽_p(t)` over `𝔽_p` | `k̄ ⊗ k(x)` is a localization of `k̄[x]`, so reduced, and `x` is separating. For the second, `z = y − a^{1/p} − b^{1/p}x` has `z^p = 0`, `z ≠ 0`, and `[F : kF^p] = p² > p`: both sides false. For `E`, perfect `𝔽_p` makes it geometrically reduced, but `s^{1/p}` has degree `p` over `𝔽_p(s)` for every `s` | holds; finite generation is load-bearing | none |
| N2 | §8.1 item 2 forward (regular gives `F ⊗[k] A` a domain) | `A = k[s]`; `F = ℂ(x)` over `ℝ` with `A = ℂ`; `F = k(x)` | `F ⊗ k[s] = F[s]`, a domain. `e = (1⊗1 + i⊗i)/2` in `ℂ(x) ⊗_ℝ ℂ` has `e² = (2 + 2 i⊗i)/4 = e`, `e ≠ 0, 1`: not a domain, and exactness fails. `K ⊗ k(x) ⊂ K(x)` | holds | none |
| N3 | §8.1 item 2 converse (one algebraically closed `L`) | `L = ℂ`, `F = ℂ(x)/ℝ`; `L = ℝ`, same `F`; the `y^p` field with `L = k̄` | Idempotent `e`: the hypothesis and the conclusion both fail. `F ⊗_ℝ ℝ = F` is a domain, yet `i ∈ F` is algebraic over `ℝ` and not in `ℝ`: "algebraically closed" is load-bearing. Nilpotent `z`: not a domain, and no separating element | holds | none |
| N4 | §11.4 step 1 (one prime of `F ⊗[k] K`) | `y^p = a + b x^p`; `k = ℚ`; `ℂ(x)/ℝ` | `F ⊗ k^sep` is a field, `K/k^sep` is purely inseparable, so one prime, and `z^p = 0`: not reduced. Over `ℚ`, `k^sep = ℚ̄ = K` and `F ⊗ ℚ̄` is already a field. `ℂ(x) ⊗_ℝ ℂ ≅ ℂ(x) × ℂ(x)` has two primes when exactness fails | holds; exactness is load-bearing | none |
| N5 | §11.4 step 3 opening (`g′ = 1 < g` forces imperfect `k`) | `y² = x⁵ − 1` over `ℚ`; `y² = (x³ − t)(x² − 1)` over `𝔽₃(t)` | Over perfect `ℚ`, `g′ = g = 2`. Over imperfect `𝔽₃(t)`, `g = 2` and `g′ = 1` (`u = y/(x − τ)`, `u² = (x − τ)(x² − 1)`) | holds | none |
| N6 | §11.4 step-3 lemma (`p`-th powers stay independent over `E^G`) | `E = 𝔽_p(t)`, `G = ⟨t ↦ t + 1⟩`; trivial `G`; the perfect closure with translations | `(1, t)`, `σ ∈ {id, t ↦ t+1}`: `det[[1,1],[t,t+1]] = 1`; for `(1, t^p)`, `det[[1,1],[t^p,t^p+1]] = 1 = 1^p`. Trivial `G`: `E^G = E`. Perfect closure: `∑ cᵢfᵢ^p = (∑ cᵢ^{1/p}fᵢ)^p` | true for every `G` | none |
| N7 | §11.4 step 3, use of the Mathlib lemma | `F = k(x)` over imperfect `k`; the `y^p` field | `k(x)/k` is separable, `H` holds, and the basis is `{x}`. For the `y^p` field, `H` fails: `1, x, y` are independent but `y^p − b x^p − a = 0`, so no infinite automorphism group has fixed field `k` there | consistent | none |
| N8 | New §11.4 Check (perfect closure of `𝔽̄_p(t)`) | translations by `a ∈ 𝔽̄_p` | For invariant `u`, `u^{p^n} = r(t)` with `r(t + a) = r(t)` for infinitely many `a`, so `r` is constant and `u = r^{1/p^n} ∈ 𝔽̄_p`. `X^p − s` is irreducible over `𝔽̄_p(s)` with root `s^{1/p} ∈ E` | Check true; refutes the old wording | none |
| N9 | §9.2 Check (residue, not exactness) | `p = 3`, `p = 5` | `p = 3`: `x^{−4}dx` has residue 0, `d(cx^{−3}) = −3c x^{−4}dx = 0`, and `x^{−3}dx = d(x^{−2})` (`−2 = 1` in `𝔽₃`). `p = 5`: `x^{−6}dx` has residue 0, `d(cx^{−5}) = 0`, and `x^{−5}dx = d(x^{−4})` (`−4 = 1` in `𝔽₅`) | holds | none |
| N10 | `Suggested.lean` line 27 | the pin at `Genus/Basic.lean:267–275` | variable `[Algebra.IsSeparable k k']` only; docstring "finite or not" | agrees | none |

Sampled targets not covered by the carried rows (untouched text, computed this round):

| # | Statement | Instances | Values computed | Result |
|---|---|---|---|---|
| S1 | §0.2 constant field | `ℂ(x)/ℝ`; `ℚ(x)/ℚ` | `algebraicClosure = ℂ`, `[ℂ : ℝ] = 2`, not exact; `algebraicClosure = ℚ` | holds |
| S2 | §0.3 order function | `ord_{P_X}` on `k(X)` | `ord(X² + X) = ord(X) + ord(X + 1) = 1 + 0`; `ord(1/X) = −1`; `v(X) = exp(−1)` | holds |
| S3 | §1.2 orders on `k(x)` | `(X² + 1)/X³` over `ℚ` | `ord_∞ = 3 − 2 = 1 = −intDegree`; `1 − 3 + 1·2 = 0` | holds |
| S4 | §7.4 Hurwitz | `y² = x³ − x`; `y² = x⁵ − 1`; `y² + y = x³` over `𝔽₂` | 4 branch places: `0 = −4 + 4`. 6 branch places: `2 = −4 + 6`. `d_∞ = 4` gives `g = 1`; the tame `−3` is odd | holds |
| S5 | §8.4 Clifford | `y² + y = x⁵` over `𝔽₂`, `D = 2P_∞` | `g = (2−1)(5−1)/2 = 2`; `L(2P_∞) = ⟨1, x⟩` (`x` has a pole of order 2, `y` of order 5): `2·2 ≤ 2 + 2` | holds |
| S6 | §8.10 composita | `k(x^{1/2})`, `k(x^{1/3})`; `√x`, `√(x−1)` at `P_{x−4}` | `e = lcm(2,3) = 6`. Over `ℂ`, 4 places. Over `ℚ`, `√3 ∉ ℚ`, so `e·f·r = 1·2·2 = 4` | holds |
| S7 | §9.3 residue theorem | `y² = x³ − x`; `x dx/(x² + 1)` over `ℚ` | `(dx) = −4O + P₀ + P₁ + P₋₁ + O = div y`; residue `i/(2i) = 1/2`, trace `1`, plus `−1` at `∞`, gives `0` | holds |
| S8 | §10.2 compatibility | `y² = x³ − x` over `𝔽₃` | `x³ − x = 0` on `𝔽₃`, so the points are `(0,0), (1,0), (2,0), O`; `div x = 2P₀ − 2O`, so `P₀ − O` has order 2 | holds |

Rows carried from the previous report (PRREVIEW-AlgebraicCurves~57, at 5048718, statements untouched):

| # | Statement | Values computed there | Result |
|---|---|---|---|
| C1 | General headline (Lean line 80) | `k` algebraically closed: `g′ = g`; `y² = x⁵ − 1/𝔽₃(t)`: `g′ = 2`; `y² = (x³−t)(x²−1)`: `g′ = 1`, `|Aut| ≤ 12`; `y⁵ − y = ax⁵`: `g′ = 0`, infinite; `y² = x³ − 2/ℚ`: `g = 1` | true; both genus hypotheses load-bearing |
| C2 | Perfect corollary (Lean line 104) | Hermitian `y³ + y = x⁴`: `g = 3`, `|PGU₃(3)| = 6048`; `y² = x⁵ − 1/ℚ`: `g = 2` | true |
| C5 | §11.4 step 2, rigidity | `(P,σ) ↦ φ(σP) − φ(P) − φ(σP₀)`: `0` on `X × {e}` and at `(P₀, σ)` | holds |
| C6 | §2.3 S-integers | `𝒪_S = k[X]_(X)` with `T ∌ (X)`; `Set.integer {(X)} = k[X][1/X]` | holds |
| C7 | §6.3 fundamental identity | `y² = x/ℚ`: `1·2 = 2·1 = 2` | holds |
| C8 | §1.1 places | `𝔽₂`: `3 = 2 + 1` places of degree 1; `X² + X + 1` irreducible | holds |
| C9 | §3.1 divisors | `div i = 0` on `ℂ(x)/ℝ`; `deg P_{X²+1} = 2` | holds |
| C10 | §3.4 genus junk value | `2n − 2(n+1) + 1 = −1`; pinned genus `0` | holds |
| C11 | §4.1 filtration | `D = −P_∞`: `v(0) = 0 ≤ exp(−1)`; `v(1/X) = exp 1` | holds |
| C12 | §4.2 quotients | `dim 𝔪⁰/𝔪¹ = 2` at `P_{X²+1}`; `ℓ(nP_∞) = n + 1` | holds |
| C13 | §5.1 regime | `ℓ(W) = g ≠ g − 1`; `(x)_∞ = 2O`, `(y)_∞ = 3O` | holds |
| C14 | §5.2 genus zero | `x² + y² = −1/ℝ`: all places of even degree, so not rational | holds |
| C15 | §5.7 local components | `∑ ω_P(1) = 0`; completion `k((X))` | holds |
| C16 | §6.1 lying over | `y² = x`: `e = 2` at `P_x`; `ℂ(x)/ℝ(x)` at `P_∞`: `e = 1`, `f = 2` | holds |
| C17 | §7.2 Dedekind | `y² + y = x³/𝔽₂`: `d = 4 ≥ e = 2`; tame `d = e − 1 = 1` | holds |
| C19 | §8.7 Hilbert | `G₀…G₃ = ℤ/2`: sum `4 = d`; fierce `V₄`: `3 ≠ 2` | holds |
| C21 | Layer 6 restriction of Thm. 3.8.7 | fierce `V₄`: Hilbert sum `3`, `d = 2` | holds |
| C22 | §8.1/12B.0 order | items 1–2 → Layer 0 → 12B.0a–b → item 3: acyclic | holds |
| C23 | §10.1 characteristic 2 | `y² = x³ + a/𝔽₂(a)`: `2g − 2 = 0`, `Δ = 0`, cusp over `k(√a)` | holds |
| C24 | §8.11 plane bound | `g ≤ 1` for `y² = x³ − x` with `n = 3` | holds |
| C25 | §11.6 Hermitian bound | `q = 41, 37, 64`: `68921 > 68796`, `50653 < 55860`, `262144 > 169260` | holds |

Rows C3, C4, C18, C20 and C26 of the previous table were about statements this diff changes; rows N1–N10 replace them.

### Remarks on untouched text (no change requested)

- The untouched item-2 sentence on fraction-field maps does not cite `TauCeti.productMap_bijective_of_separating` (`TauCeti/FieldTheory/FunctionField/ConstantExtension/Regular.lean:59`). That pinned theorem gives `F ⊗[k] k′ ≅ F · k′` for every algebraic `k′/k` when `F` has exact constants and a separating element.
- The `From Mathlib` contract does not list the Mathlib names first consumed here (`separableClosure.isPurelyInseparable`, `PrimeSpectrum.isHomeomorph_comap_of_isPurelyInseparable`, `exists_isTranscendenceBasis_and_isSeparable_of_linearIndepOn_pow_of_essFiniteType`, `Algebra.IsGeometricallyReduced`). They are named in the layer *Needs:* lines, as `IsAlgClosure` and `IsLocalization` already were.
- For step 1, the same Mathlib file's `PrimeSpectrum.isHomeomorph_comap_tensorProductMap_of_isPurelyInseparable` (`Homeomorph.lean:72`) states the base-changed homeomorphism directly. The cited lemma together with the stated isomorphism proves the same step.

## Not verifiable

- `Stichtenoth2009` is settled as uncertified, so I did not read it. This covers the sampled locators of:
  - §0.2 (Cor. 1.1.16, Prop. 1.2.1(d)) and §0.3 (Def. 1.1.4, 1.1.9, 1.1.12; Thm. 1.1.6, 1.1.13);
  - §1.1 (Prop. 1.2.1, Thm. 1.2.2, Cor. 1.2.3), §4.1 (Def. 1.5.2–1.5.3);
  - §5.1 (Thm. 1.5.17, Prop. 1.6.6, Def. 1.6.10, Rem. 1.6.11, Prop. 1.6.12), §5.2 (Prop. 1.6.3, Rem. 1.6.4);
  - §6.1 (Def. 3.1.1, Prop. 3.1.4, Def. 3.1.5, Prop. 3.1.6–3.1.7), §7.2 (Thm. 3.5.1, Cor. 3.5.5);
  - §7.4 (Thm. 3.4.13, Cor. 3.4.14, Cor. 3.5.6–3.5.8, Prop. 3.7.3), §8.10 (Thm. 3.9.1, Cor. 3.9.3, 3.9.7);
  - §9.3 (Thm. 4.3.2, Rem. 4.3.7(c)), §10.1 (Def. 6.1.1, Prop. 6.1.2, 6.1.3, 6.1.6) and §10.2 (Prop. 6.1.6).

  The numbering is cross-checked against Tau Ceti docstrings only (see Seeded sample). No docstring at the pin cites Def. 1.1.9 or Def. 1.1.12. §1.2 and §8.4 carry no source locator; §8.4 cites the pinned theorem.
- These are also uncertified and cited by locator only: `Hartshorne1977`, `Goldschmidt2003`, `VillaSalvador2006`, `Deuring1973`, `Rosen2002`, `Serre1979`, `Roquette1970`, `Stichtenoth1973a`, `Stichtenoth1973b` and `Liu2002`.

## Source issues

- **Gap** in Rosenlicht1955 at §3, Lemma, p. 4: the source states separable generation over the fixed field for an arbitrary field, but its proof establishes only MacLane's `p`-th-power criterion; it should state that criterion, which yields a separating transcendence basis only for finitely generated extensions; affects nothing.
