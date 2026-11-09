# Review of GrothendieckNotesLemmas (pull request #1431 at 107b9ed)

**Verdict:** accepted

This is an incremental re-review of the 71 lines that changed since `17362a4`. The change removes
target 3.2 (the commutator of a derivation with a multiplication, and its conjugation by a unit)
together with its two declarations in `Suggested.lean`, leaves the two identities to PCurvature
§0.4 in Scope, and rewrites the Downstream paragraph to name ArithmeticInterpolationDeterminants.
No finding remains, new or carried.

## Previous findings

- The previous report (at `17362a4`) was an acceptance with no finding, so there is none to
  account for.

## Verified sound

**Gate and build.**

- The worker's gate at this head passes with every check at `0`, `build=0` included. My rerun
  (`--base origin/main`) reports every check at `0` and ends `OK`.
- `lake env lean` on `TauCetiRoadmap/GrothendieckNotesLemmas/Suggested.lean` exits with code 0;
  its output is 29 "declaration uses `sorry`" warnings and nothing else (31 at `17362a4`, less the
  two removed theorems).
- `git diff --stat origin/main...HEAD` restricted to paths outside the folder is empty. The folder
  holds only `README.md`, `Suggested.lean` and `metadata.toml`.
- Dependency check (`--movable`, candidate merge order): `depcheck: 236 roadmaps, 2262 edges, 0
  problem(s)`. No UPWARD, CYCLE or `moved:` line. The roadmap still consumes nothing from another
  roadmap and declares no gaps; the PCurvature citation is a Scope deferral, not a `*Needs:*` edge.

**The removal is complete and consistent (README and Lean).**

- `README.md` has 27 `### k.n` target headings (8 + 11 + 1 + 2 + 5), matching "Twenty-seven" in
  the Summary (line 3). The Layer 3 clause of the Summary, the build paragraph (lines 222–223 and
  231–232: no `3.1 → 3.2`, "smallest targets" without 3.2), the Mathlib contract line (line 174,
  without `LinearMap.mulLeft` and `Module.End`, which no remaining target uses), and the Layer 3
  Examples and Dependencies (lines 667–675) no longer mention 3.2.
- A search of both files for `3.2`, `lie_mulLeft`, `mulLeft` and `Module.End` finds only
  "ArithmeticStatisticsPartIV, §3.2" (line 61, another roadmap's section). No "(removed)" stub is
  left; the deferral is in Scope, where the house shape puts it.
- `Suggested.lean` has 29 theorems, and its module docstring lists 29 names (7 + 11 + 1 + 4 + 6);
  the 3.1 line reads "3.1, `Derivation.leibniz_zpow_units`." and the "another roadmap owns them"
  paragraph names PCurvature §0.4. The gate's `readme-ids-missing=0` confirms the README names no
  declaration the file lacks.
- The Layer 3 Dependencies line now equals 3.1's `*Needs:*` line. Opened at the pins: Mathlib
  `Derivation.leibniz_pow` (`Mathlib/RingTheory/Derivation/Basic.lean` line 140) and
  `Derivation.leibniz_zpow`, over a field `K` (line 511); Tau Ceti `Derivation.leibniz_prod`
  (`TauCeti/RingTheory/Derivation/Basic.lean` line 57).

**The new Scope deferral, resolved at the owner's head.** PCurvature is not on main; at the head
of its pull request (`12a50f4`), `TauCetiRoadmap/PCurvature/README.md` lists "the commutators of a
derivation with multiplications (0.4)" under "Owned here"; the heading "### 0.4 Commutators with
multiplications" states `lie_mulLeft` (`⁅D, mulLeft a⁆ = mulLeft (D a)` in `Module.End R A`) and
`mulLeft_mul_mul_mulLeft_inv` (`u ∘ D ∘ u⁻¹ = D − u⁻¹ D(u)`), with the *Needs* line Mathlib
`Derivation.leibniz`, `Derivation.leibniz_of_mul_eq_one` (pinned Mathlib,
`Mathlib/RingTheory/Derivation/Basic.lean` line 480), `LinearMap.mulLeft`, `Module.End`; its
Dependencies say "0.4 uses Mathlib only", and its `Suggested.lean` declares both theorems (lines
137 and 143) in its own namespace. So the two identities have one owner, that owner does not need
this roadmap's 3.1, and no fully qualified name is declared twice. The formulas in the Scope
bullet (lines 56–58) are the ones §0.4 states, sign and factor `u⁻¹` included.

**The dropped id.** `roadmaps grep` over main and the open heads for `GrothendieckNotesLemmas`
finds two citing roadmaps: ArithmeticInterpolationDeterminants (§§1.3–1.4 only) and
HomotopyTheoryOfCategories (a remark that this roadmap names it as an owner). Neither cites 3.2;
PCurvature at its head does not cite this roadmap at all. `roadmaps overlaps` lists no open pull
request that changes this roadmap and no dropped or revision-only id. No old → new numbering is
needed: 3.2 was the last target of its layer and nothing is renumbered.

**The new Downstream paragraph, resolved.** At the head of ArithmeticInterpolationDeterminants
(`e456394`), `TauCetiRoadmap/ArithmeticInterpolationDeterminants/README.md` lines 89–93 (Scope)
leave "the kernel of the Hasse derivatives of orders `0 < k < p^e` and their linearity over
`R[X^(p^e)]`" to "GrothendieckNotesLemmas §§1.3–1.4"; lines 332–337 quote §1.4
`Polynomial.hasseDeriv_expand_mul` with the hypothesis `k < p^e`; target 0.4 (line 472) uses it in
the coefficientwise route and line 489 lists it in *Needs* "for the coefficientwise route". This
is what lines 864–866 here say. The instance that route uses,
`hasseDeriv k (expand q g · X^i) = expand q g · hasseDeriv k (X^i)` for `k < q`, is 1.4 with the
second factor `X^i`, under 1.4's own hypothesis.

**Sources and the sample.** The seeded sample (1.1, 1.2, 1.7, 2.2, 2.4, 2.6, 2.7, 2.8, 2.9, 3.1,
4.2, 5.1, 5.2, 5.3, 5.5) does not fall in the changed passages: 3.1's statement, route, *Needs*
and Checks are byte-identical to `17362a4`, and the change adds no locator. The README flags no
locator as unverified. The one other changed hunk, in 2.8, is a re-wrap of an unchanged sentence.

**Signatures and headlines.** The elaborated types of all 29 declarations (the worker's
`#check @` output at this head) show none with a lost section binder; the 27 untouched ones are
those the previous `#check @` pass compared with the README, and `Derivation.leibniz_zpow_units`
elaborates as `(D : Derivation R A M) (u : Aˣ) (n : ℤ), D ↑(u ^ n) = n • ↑(u ^ (n - 1)) • D ↑u`
with `CommRing R`, `CommRing A`, `Algebra R A`, `Module A M`, `Module R M`, as 3.1 states. All 27
targets are statable at the pins; 23 are stated in full, 2.1 through `Module.Flat.prod_iff`, and
1.7, 2.5, 2.11 and the finite-product form of 2.1 are named in the docstring as two-line
consequences of the pins. No stand-in, no `set_option`, no sorried data, and the removal leaves no
padding behind (no declaration was added).

**Adversarial table.** The first five rows were computed at this head for the changed passages.
The rows marked "r13" are carried from the previous report at `17362a4` (which carries most of
them from earlier rounds); their statements are untouched. The previous report's row for 3.2 is
dropped with the target.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Scope bullet lines 56–58 (new): `⁅D, a⁆ = D a` and `u ∘ D ∘ u⁻¹ = D − u⁻¹ D u`, owned by PCurvature §0.4 | `k[x]`, `D = d⁄dx`, `a = x`, on `f`; `k[x, x⁻¹]`, `u = x`, on `1`; `u ∈ kˣ`; zero ring | `(x f)′ − x f′ = f = (D x) f`, reversed bracket gives `−f`; `x · D(x⁻¹) = −x⁻¹` and `(D − x⁻¹ · 1)(1) = −x⁻¹`, `D u` without `u⁻¹` would give `−1`; `D u = 0`, both sides `D`; `0 = 0` | true as written, identical to §0.4 at the owner's head | none |
| Summary line 3 and build paragraph lines 222–232 (changed) | heading count per layer; docstring name count | `8 + 11 + 1 + 2 + 5 = 27`; `7 + 11 + 1 + 4 + 6 = 29` names = 29 theorems; chains `1.1 → 1.3 → 1.4`, 2.8, 2.9 are the only in-layer edges in the *Needs* lines | consistent | none |
| Layer 3 Examples and Dependencies lines 667–675 (changed) | `k[x, x⁻¹]`, `u = x`, `n = 3, −1, 0` | `D(x³) = 3x²`; `D(x⁻¹) = −x⁻²`; `D 1 = 0 = 0 • x⁻¹ • 1`; the three named declarations exist at the pins (file and line above) | true | none |
| Downstream lines 864–866 (new): ArithmeticInterpolationDeterminants consumes 1.4 | `ZMod 2`, `e = 1`, `g = X`, `i = 1`, `k = 1`; `k = 2 = q` | `hasseDeriv 1 (X² · X) = 3X² = X² = X² · hasseDeriv 1 X`; at `k = 2`: `hasseDeriv 2 (X² · X) = 3X = X` vs `X² · 0 = 0`, excluded by `k < p ^ e` on both sides of the citation | true, hypotheses agree | none |
| 3.1 `Derivation.leibniz_zpow_units` (untouched; its layer changed) | `n = 0, −1, −2` on `ℚ[x, x⁻¹]`; `u = 2` | `0`; `−x⁻²`; `−2x⁻³`; `D 2 = 0` both sides | true | none |
| r13: 2.1 Scope bullet and closing paragraph | `ι` finite; `ι = ℕ` over `ℤ`; `k[x, y₁, y₂, …] ⁄ (x yᵢ)`; a valuation ring | finite: flat iff each factor flat; `Π_ℕ ℤ` flat; `ann(x)` not f.g., some `R ^ A` not flat; coherent, not Noetherian | true | none |
| r13: contract line `exists_linearMap…` | `ℤ → ℚ`, `a = x = 1`; `ℤ ⁄ 4`, `a = 2`, `x = 1` | both sides true; both false (`2 • 1 = 2 ≠ 0`) | true | none |
| r13: 2.8 statements and route | `ℚ ⁄ ℤ`, `r = 2`, `x = 1 ⁄ 3`; `ℤ`; `ℤ ⁄ 4` | `f 1 = 1 ⁄ 6` or `2 ⁄ 3`; `2·` misses `1`; `(2) → ℤ ⁄ 2`, `2 ↦ 1` has no extension | true | none |
| r13: 1.7 | p = 3, 5, 2; Heisenberg mod 3; Q₈ | `C(3,2) = 3`, `C(5,2) = 10`, `C(2,2) = 1`; corners `6 ≡ 0 ≡ 9`; `(ij)² = −1 ≠ 1` | true | none |
| r13: 2.3 | ℤ; `k[x₁, x₂, …]`, `I = (xᵢ)` | both true; `R ⧸ I ≅ k` f.g. not f.p.: both false | true | none |
| r13: 5.2 against `pairMinor_mul` | rows `(1,2,3)`, `(0,1,4)`, columns `(2,0,1)`, `(1,1,1)`; empty | `25 − 24 = 1`, ordered sum `2`; `0 = 0` | true, factor `2` | none |
| r13: 1.1 | n = 0; e = 0; (2,1,6); (2,2,6); p = 4 | `C(0,k) = 0`; `1 ∣ n`; `6` even; `15` odd; `4 ∤ 6` | true | none |
| r13: 1.2 | a = 0; (3,1); (2,2); k = p^a | `1`; `1,2,1 ≡ 1,−1,1`; `1,3,3,1` odd; `C(2,3) = 0` | true | none |
| r13: 1.3 | ZMod 3, X³, X⁴; k = p^e | `3X² = 0`; `4X³ = X³ ≠ 0`; `hasseDeriv 3 X³ = 1` | true | none |
| r13: 1.4 | ZMod 2, f = g = X, k = 1, 2 | `X² = X² · 1`; `1` vs `0` | true | none |
| r13: 1.5 | ℤ, a = 1, q = X + 1; a = 0; zero ring | `q(1) = 2`, `ℤ⁄2`; `(X+1) − X = 1`; both true | true | none |
| r13: 1.6 | n = 0, 2, 3 | `1`; `1`; `1`; `[[2,3],[3,6]]` gives `3` | true | none |
| r13: 1.8 | ⊥; (𝔄₅×𝔄₅)⋊C₂; ⟨(12)⟩ ≤ 𝔖₃ | order 3600 perfect; `⁅𝔖₃,𝔖₃⁆ = 𝔄₃` | true | none |
| r13: 2.1 `prod_iff` | ℤ × ℤ⁄2; ι = ∅ | `ℤ⁄2 ⊗ (2·) = 0`; `Π_∅ = 0` flat | true | none |
| r13: 2.2 | M = R; M = ℚ, `ℤ⁄2ⁿ` | identity; `Π (ℚ ⊗ ℤ⁄2ⁿ) = 0`, `ℚ ⊗ Π ≠ 0` | true | none |
| r13: 2.4 | ℤ, `2•`, ℤ² | `(2,4)` in, `(2,3)` out | true | none |
| r13: 2.5 | ℤ⁄4, (2); ℤ, (p) | `I² = 0`; `ℤ_p` uncountable | true | none |
| r13: 2.6 | k → k[t] → k; T = S; k[t]⁄(t²) | `k dt → 0`; isomorphism; `H¹ = (t²)⁄(t⁴)` | true | none |
| r13: 2.7 | ℤ ⊆ ℚ, x = 1, 2; ℤ², (1,2) | `1⁄2 ∉ ℤ`; `x = 2·1` excluded; `(3⁄2, 3) ∉ ℤ²` | true | none |
| r13: 2.9 | ℤ, (2), a = 3; p = (4); ℤ[i], (5) | `3` acts as 1; `2·2 = 0`; `(2 ± i)` over `(5)` | true | none |
| r13: 2.10 | ℚ⁄ℤ, t = 6; t = 0; k[x,y], t = x | `ℤ⁄6`; `ℚ⁄ℤ ≇ ℤ`; `Ext²(k, A) = k` | true | none |
| r13: 2.11 | ℤ⁄12; ℤ; ℚ⁄ℤ; k[x,y]⁄(x) | length 3; infinite chains otherwise | true | none |
| r13: 4.1 | ℚ × [0,1]; f = x − y | not locally compact; `curry f 1 0 = 1` | true | none |
| r13: 4.2 | Spec ℤ, {(0)}; Sierpiński | no W at (0); `{1}` open, `{0}` not stable | true | none |
| r13: 5.1 | finite group; {1, a, b}; (ℤ⁄n, ·) | no right zero; `aM ∩ bM = ∅`; `0` right zero | true | none |
| r13: 5.3 | `[[1,0],[0,0]]`, `[[0,0],[1,1]]`; (2),(0); 𝔽₂ | `(P−Q)² = 1`, trace `0`; `8 ≠ 2`; `1 = 1 − 0` | true | none |
| r13: 5.4 | (ℕ, ·); Multiplicative ℕ; {1, e} | `0·2 = 0·3`; `1 = 3 − 2`; `e·e = e·1` | true | none |
| r13: 5.5 | k[X]; `kᵖ` vs 0 over 𝔽̄_p; L × L over 𝔽_p(t) | `tr X = λ`; `p·a = 0`; `Tr_{L⁄k} = 0` | true | none |
| r13: Conventions | 1.3, 1.4, 1.6, 1.7, 2.9, 4.1, 5.2 | `3X² = 0`; `hasseDeriv 2 X² = 1`; `[[1,1],[1,2]]`; corner `−1`; `√(4) = (2)`; `curry f 1 0 = 1`; `2 = 2` | consistent | none |

**Ownership against open work.** Checked by object against main and the open heads through
`roadmaps grep` (`lie_mulLeft`, `mulLeft_mul_mul_mulLeft_inv`, `leibniz_zpow_units`): the two
commutator identities are declared only by PCurvature; `leibniz_zpow_units` only here. The pinned
Mathlib and Tau Ceti have neither commutator identity (the only `lie_mulLeft` hit in Tau Ceti is
`TauCeti.lie_mulLeft_mulLeft_mem_derivationLieAlgebra`, a Jordan-algebra statement about
`⁅L_a, L_b⁆`), so "PCurvature §0.4" rather than "Supplied at the pins" is the right place for the
deferral.

**Remark on untouched text** (no change requested; earlier reviews passed it):

- 3.1's *Needs* line lists Mathlib `Derivation.leibniz_zpow` and Tau Ceti
  `Derivation.leibniz_prod`, which the stated route does not use (they are the API the target
  extends); 2.8's *Needs* line likewise lists `Module.Baer.of_injective`.

## Not verifiable

- Avron–Seiler–Simon 1994, Theorem 4.1 (`ass1994`): settled as uncertified (paywalled); target
  5.3 is untouched.
- Lang, *Algebra*, XVII Corollary 3.8 (the closest source for 5.5): no legal open copy; untouched.
- Lucas 1878 (1.1, 1.2): the cached `lucas1878` is a challenge page, not the paper; both targets
  are untouched and were checked against Mathlib's Lucas theorem in an earlier review.

## Source issues

- none
