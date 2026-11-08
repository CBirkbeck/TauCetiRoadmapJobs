# Review of GrothendieckNotesLemmas (pull request #1431 at e8702ce)

**Verdict:** accepted

This is an incremental re-review of the 11 lines that changed since `af8284b`. All of them are in
`README.md`: the Tau Ceti contract line for
`TauCeti.exists_linearMap_apply_eq_iff_forall_smul_eq_zero` (lines 202–205) and the statement and
route of 2.8 (lines 527–535). `Suggested.lean` and `metadata.toml` are byte-identical to
`af8284b`. The pins are unchanged: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`.

- The one finding of the previous review is repaired, and the repair introduces no new problem.
- The gate passes and the dependency check reports no problem. `Suggested.lean` elaborates with
  31 `sorry` warnings and nothing else.
- This report has no findings.

## Previous findings

- R01 — repaired: README lines 203–205 now read "for `a : M` and `x` in an injective module `Q`, some linear map `M → Q` sends `a` to `x` exactly when every scalar killing `a` kills `x`". Line 527 names the module `Q`, and lines 534–535 read "extends `r ↦ x` to a linear map `f : R → Q`, and `x = r • f 1`".

## Verified sound

**Gate and build.**

- The worker's gate at this head passes with every check at `0`, `build=0` included. My rerun
  with `--base origin/main` also reports every scanner and depcheck at `0` and ends `OK`.
- Nothing changed outside the folder: `git diff --stat origin/main...HEAD` restricted to other
  paths is empty. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.
- `lake env lean` on `TauCetiRoadmap/GrothendieckNotesLemmas/Suggested.lean` exits with code 0.
  Its output is 31 "declaration uses `sorry`" warnings and nothing else, the same as at `af8284b`.
- Dependency check (`--movable`, candidate merge order): `depcheck: 238 roadmaps, 2424 edges, 0
  problem(s)`. There is no UPWARD, CYCLE or `moved:` line. The roadmap consumes no other roadmap
  and declares no gaps.

**The repaired contract line against the pinned declaration.**

- `#check @TauCeti.exists_linearMap_apply_eq_iff_forall_smul_eq_zero` (Tau Ceti
  `Algebra/Module/Injective/Hom.lean` line 79) gives this type: `[Ring S]`, `M` in any universe,
  `Q : Type v`, `[Small.{v} S] [Module.Injective S Q]`, and `(∃ f, f a = x) ↔ ∀ s, s • a = 0 →
  s • x = 0`.
- The README line now carries the existential and gives `M` and `Q` the roles they have in the
  declaration.
- The `Small` hypothesis is a universe condition. 2.8 carries it in both its prose and its Lean
  signature.

**The repaired 2.8 route, proved in a scratch probe.** A scratch file imports `Mathlib`,
`TauCeti.Algebra.Module.Injective.Hom` and `TauCeti.Algebra.Module.Injective.PrincipalIdealRing`.
It proves the following, with no `sorry` and no error:

- The converse direction, exactly as lines 532–535 describe it. The Tau Ceti theorem is applied
  with `M := R` and `a := r`. Over a domain, `s • r = 0` forces `s = 0`. The witness is `f 1`,
  and `r • f 1 = f (r • 1) = f r = x`.
- The full equivalence, with the binders of `Module.injective_iff_forall_smul_surjective`. The
  forward direction is the item above. The backward direction is
  `(Module.Baer.of_surjective_smul h).injective`.
- `Module.Injective.quotient`, with its binders: the quotient of a divisible module is divisible,
  via `Submodule.mkQ_surjective`.

This is the route the README states. Each of the two statements takes more than one tactic: about
ten lines for the equivalence and four more for the quotient.

**Library declarations opened at the pins** (for the changed passages):

- Tau Ceti `Module.Baer.of_surjective_smul` (`Algebra/Module/Injective/PrincipalIdealRing.lean`
  line 38): `[Ring R] [IsPrincipalIdealRing R]`.
- Mathlib `Module.Baer.injective` and `Module.Baer.of_injective` (`Algebra/Module/Injective.lean`
  lines 402 and 407; the latter needs `[Small.{v} R]`).
- Mathlib `Module.Baer.of_divisible` (`Algebra/Category/Grp/Injective.lean` line 35:
  `[DivisibleBy A ℤ] : Module.Baer ℤ A`). This supports the 2.8 locator "Mathlib's
  `Module.Baer.of_divisible` is the case of `ℤ`".
- The Tau Ceti theorem above.

**Signatures.** `Suggested.lean` is unchanged. The 2.8 entries of the worker's `signatures.md`
(lines 115–126) match the README prose. Both statements take a commutative domain that is a
principal ideal ring, `[Small.{v} R]` and `Q : Type v`, and "divisible" is `∀ r ≠ 0`, `r • ·`
surjective. The previous review's `#check @` pass over all 31 declarations stands.

**Citations and overlaps.**

- `roadmaps overlaps` (rerun) finds no open pull request that changes this roadmap, no cited id
  that is dropped, and no id that only an open revision defines.
- The change renames no heading and no id.
- No roadmap on main or at an open head cites §2.8. The citing roadmaps (PCurvature §3.2,
  ArithmeticInterpolationDeterminants §§1.3–1.4) cite untouched sections.
- The worker's `citations.md` lists no unresolved cross-roadmap citation. Its 29 "Lean names
  found nowhere" are this roadmap's own declarations, and the gate's `readme-ids-missing=0`
  confirms that `Suggested.lean` declares each one.
- Ownership: the change adds no owned object. A by-object search of main and the open heads for
  "injective iff divisible" turns up only Mathlib's `ℤ` case cited by other roadmaps (for example
  InductionRestrictionPartII line 262, `AddCommGrpCat.injective_of_divisible`). No second owner of
  the principal-ideal-domain statement exists.

**Sources.**

- The seeded sample (1.1, 1.6, 1.7, 1.8, 2.1, 2.3, 2.5, 2.10, 2.11, 3.2, 4.2, 5.1, 5.3, 5.4, 5.5)
  does not fall in the changed passages. The checks of the previous reviews at the same text
  stand.
- The README flags no locator as unverified.
- The 2.8 locator was checked above.

**Adversarial table.** The first three rows are new and were computed at this head. The rows
marked "r9" are carried from the previous review at `af8284b`, whose statements this change leaves
untouched. Some of those rows were computed at `cded50d` and carried by r9.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Contract line `exists_linearMap…` (repaired) | zero map and inclusion `ℤ → ℚ`, `a = x = 1`; `M = Q = ℤ ⁄ 4`, `a = 2`, `x = 1`; `M = ℤ ⁄ 2`, `Q = ℚ ⁄ ℤ`, `a = 1`, `x = 1 ⁄ 2` and `x = 1 ⁄ 3` | Only `s = 0` kills `1 ∈ ℤ`, and the inclusion gives `1 ↦ 1`, so both sides are true. The zero map is no longer a counterexample, because the claim is now "some map". `ℤ ⁄ 4`: `s = 2` kills `a = 2` but `2 • 1 = 2 ≠ 0`, and `f 2 = 2 f 1 ∈ {0, 2}`, so both sides are false. `ℤ ⁄ 2`: `1 ↦ 1 ⁄ 2` exists and even `s` kills `1 ⁄ 2`, so both sides are true. With `x = 1 ⁄ 3`, `2 • 1 ⁄ 3 = 2 ⁄ 3 ≠ 0`, so both sides are false | true | none |
| 2.8 route, converse (repaired) | `Q = ℚ ⁄ ℤ`, `r = 2`, `x = 1 ⁄ 3`; `R = Q = ℤ ⁄ 4`, `r = 2`, `x = 1`; scratch proof | `f 1 = 1 ⁄ 6` gives `2 • 1 ⁄ 6 = 1 ⁄ 3`, and so does `f 1 = 2 ⁄ 3`, since `4 ⁄ 3 ≡ 1 ⁄ 3`: `f` is not unique, as the existential allows. In `ℤ ⁄ 4`, `s = 2` kills `r = 2`, the condition fails at `x = 1`, and `2 •` has image `{0, 2}`. The domain hypothesis is used exactly at "only `s = 0` kills `r`". Proof closes | true | none |
| 2.8 statements (Lean, unchanged), proved by the README route | `probe_iff` and `probe_quotient` with the Suggested.lean binders; `ℚ → ℚ ⁄ ℤ` | Both elaborate with no `sorry`. `ℚ ⁄ ℤ` is divisible: `n • (q ⁄ n) = q` | true | none |
| r9: 1.7 (README only) `(u v)^p = u^p v^p`, odd `p` | p = 3, 5, 2; abelian G; Heisenberg mod 3; Q₈ | `C(3,2) = 3`, `C(5,2) = 10`, `C(2,2) = 1` and `2 < p` fails at p = 2. Abelian: `d = 1`. Heisenberg over ZMod 3: corners `6 ≡ 0 ≡ 9`. Q₈: `(ij)² = −1 ≠ 1 = i²j²` | true | none |
| r9: 2.1 Chase Check | `R = k[x, y₁, y₂, …] ⁄ (x yᵢ)` | `ann(x) = (y₁, y₂, …)` is not f.g., so (d) fails and (b) fails for some `R ^ A` | true | none |
| r9: 2.3 Noetherian ↔ f.g. ⇒ f.p. | ℤ; `k[x₁, x₂, …]`, `I = (xᵢ)` | ℤ: both sides true. `R ⧸ I ≅ k` is f.g. but not f.p.: both sides false | true | none |
| r9: 5.2 against `pairMinor_mul` | rows `(1,2,3)`, `(0,1,4)`, columns `(2,0,1)`, `(1,1,1)`; empty and one index | `25 − 24 = 1`, ordered sum `2`; empty `0 = 0`; one index `0 = 0` | true, factor `2` as stated | none |
| r9: Scope `hasseDeriv k (f^q) = 0` | 𝔽₃, `X + 1`; 𝔽₄, `X`; 𝔽₂(t), `tX` | `3X² = 3X = 0`; `C(4,k) ≡ 0` for `0 < k < 4`; `(tX)² ≠ expand 2 (tX)` | true | none |
| r9: 1.1 | n = 0; e = 0; (2,1,6); (2,2,6); p = 4 | `C(0,k) = 0`; `1 ∣ n`; `C(6,1) = 6` even; `C(6,2) = 15` odd; `4 ∤ C(4,2) = 6` | true | none |
| r9: 1.2 | a = 0; (3,1); (2,2); k = p^a | `C(0,0) = 1`; `1,2,1 ≡ 1,−1,1`; `1,3,3,1` odd; `C(2,3) = 0` | true | none |
| r9: 1.3 | ZMod 3, X³, X⁴; k = p^e | `3X² = 3X = 0`; `4X³ = X³ ≠ 0`; `hasseDeriv 3 X³ = 1` | true | none |
| r9: 1.4 | ZMod 2, f = g = X, k = 1, 2 | `X² = X²·1`; k = 2: `1` vs `0` | true | none |
| r9: 1.5 | ℤ, a = 1, q = X + 1; a = 0; zero ring | `q(1) = 2`, quotient `ℤ⁄2`; `(X+1) − X = 1`; both sides true | true | none |
| r9: 1.6 | n = 0, 2, 3 | `1`; `2 − 1 = 1`; `3 − 3 + 1 = 1`; `[[2,3],[3,6]]` gives `3` | true | none |
| r9: 1.8 | ⊥; (𝔄₅×𝔄₅)⋊C₂; ⟨(12)⟩ ≤ 𝔖₃ | order 3600 perfect; `⁅𝔖₃,𝔖₃⁆ = 𝔄₃` | true | none |
| r9: 2.1 `prod_iff` | ℤ × ℤ⁄2; ι = ∅ | `ℤ⁄2 ⊗ (2·) = 0`; `Π_∅ = 0` flat | true | none |
| r9: 2.2 | M = R; M = ℚ, `ℤ⁄2ⁿ` | identity; `Π (ℚ ⊗ ℤ⁄2ⁿ) = 0`, `ℚ ⊗ Π ≠ 0` | true | none |
| r9: 2.4 | ℤ, `2•`, ℤ² | `(2,4)` in, `(2,3)` out | true | none |
| r9: 2.5 | ℤ⁄4, (2); ℤ, (p) | `I² = 0`; `ℤ_p` uncountable | true | none |
| r9: 2.6 | k → k[t] → k; T = S; k[t]⁄(t²) | `k dt → 0`; isomorphism; `t dt ↦ 0`, `H¹ = (t²)⁄(t⁴)` | true | none |
| r9: 2.7 | ℤ ⊆ ℚ, x = 1, 2; ℤ², (1,2) | `1⁄2 ∉ ℤ`; `x = 2·1` excluded; `(3⁄2, 3) ∉ ℤ²` | true | none |
| r9: 2.8 Checks | ℚ⁄ℤ; ℤ; ℤ⁄4 | `2·` misses 1 in ℤ; `(2) → ℤ⁄2`, `2 ↦ 1` has no extension | true | none |
| r9: 2.9 | ℤ, (2), a = 3; p = (4); ℤ[i], (5) | `3` acts as 1; `2·2 = 0`; `(2 ± i)` over `(5)` | true | none |
| r9: 2.10 | ℚ⁄ℤ, t = 6; t = 0; k[x,y], t = x | `ℤ⁄6`; `ℚ⁄ℤ ≇ ℤ`; `Ext²(k, A) = k` | true | none |
| r9: 2.11 | ℤ⁄12; ℤ; ℚ⁄ℤ; k[x,y]⁄(x) | length 3; infinite chains for the others | true | none |
| r9: 3.1 | n = 0, −1, −2 on ℚ[x, x⁻¹] | `D1 = 0`; `−x⁻²`; `−2x⁻³` | true | none |
| r9: 3.2 | k[x], a = x; u = x | identity; `−x⁻¹ = (D − x⁻¹Dx)1` | true | none |
| r9: 4.1 | ℚ × [0,1]; f = x − y | not locally compact; `curry f 1 0 = 1` | true | none |
| r9: 4.2 | Spec ℤ, {(0)}; Sierpiński | no W at (0); `{1}` open, `{0}` not stable | true | none |
| r9: 5.1 | finite group; {1, a, b} left zeros; (ℤ⁄n, ·) | no right zero; `aM ∩ bM = ∅`; `0` right zero | true | none |
| r9: 5.3 | `[[1,0],[0,0]]`, `[[0,0],[1,1]]`; (2),(0); 𝔽₂ | `(P−Q)² = 1`, trace `0`; `8 ≠ 2`; `1 = 1 − 0` | true | none |
| r9: 5.4 | (ℕ, ·); Multiplicative ℕ; {1, e} | `0·2 = 0·3`; `1 = 3 − 2`; `e·e = e·1` | true | none |
| r9: 5.5 | k[X]; `kᵖ` vs 0 over 𝔽̄_p; L × L over 𝔽_p(t) | `tr X = λ`; `p·a = 0`; `Tr_{L⁄k} = 0` | true | none |
| r9: Conventions | 1.3, 1.4, 1.6, 1.7, 2.9, 4.1, 5.2 | `3X² = 0`; `hasseDeriv 2 X² = 1`; `[[1,1],[1,2]]`; corner `−1`; `√(4) = (2)`; `curry f 1 0 = 1`; `2 = 2` | consistent | none |

**Checks of the changed passages.**

- 2.8's three Checks (lines 542–547) are unchanged. They agree with the repaired route: the
  `ℤ ⁄ 4` Check is the instance on which the domain step fails (row 2).
- The Layer 2 example "2.8 over `k[t]`" (line 623) is unchanged and still consistent.

**Headline theorems.** The change touches no headline.

- All 28 targets are statable at the pins. 25 are stated, in 31 declarations.
- 1.7, 2.5, 2.11 and the finite-product form of 2.1 are named in the docstring as two-line
  consequences of the pins.
- There is no stand-in, no `set_option` and no sorried data.
- The 2.8 probe above shows the two 2.8 statements are not one-tactic closes, so they are not
  padding.

**Remarks** (no change requested):

- README line 535 is 120 characters, the only line over 100 in the file. Markdown renders it the
  same, and no house rule covers line length.
- 2.8's *Needs* line (untouched) still lists Mathlib `Module.Baer.of_injective`, which the route
  as now written does not use. Listing an extra input blocks nothing.
- The pull request description still says "Three statements that follow from the pins in two
  lines". There are four. The description is not a roadmap file.

## Not verifiable

- Avron–Seiler–Simon 1994, Theorem 4.1 (`ass1994`): settled as uncertified (paywalled). The matrix
  identity of 5.3 was recomputed in earlier reviews.
- Lang, *Algebra*, XVII Corollary 3.8 (the closest source for 5.5): Springer, with no legal open
  copy.
- Lucas 1878 (1.1, 1.2): the cached `lucas1878` is a JSTOR "Client Challenge" page (`lucas1878`
  line 5), not the paper, although the manifest records it as certified. Lucas's theorem was
  checked against Mathlib's `Choose.choose_modEq_prod_range_choose` in an earlier review. Neither
  target is in the changed passages.

## Source issues

- none
