# Review of GrothendieckNotesLemmas (pull request #1431 at af8284b)

**Verdict:** needs changes

This is an incremental re-review of the 97 lines that changed since `cded50d`, in `README.md` and
`Suggested.lean`. The pins are unchanged: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`.

- All five findings of the previous review are repaired.
- The gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates with
  31 `sorry` warnings and nothing else.
- One new finding, P3, so nothing blocks: the repair of R02 added a Tau Ceti contract line that
  states an existence theorem as if it held for every linear map.

## R01 (P3) — The contract line for `TauCeti.exists_linearMap_apply_eq_iff_forall_smul_eq_zero` drops the existential

**Location.**

- `TauCetiRoadmap/GrothendieckNotesLemmas/README.md` lines 202–204, the contract line: "a linear
  map into an injective module sends `a` to `x` exactly when every scalar killing `a` kills `x`,
  used by 2.8."
- The same file, lines 533–534, the 2.8 route: "extends `r ↦ x` to a linear map `R → M`".

**Claim.**

- The pinned theorem is an existence statement: `(∃ f : M →ₗ[S] Q, f a = x) ↔ ∀ s, s • a = 0 →
  s • x = 0`. Its Tau Ceti docstring says such a map "can send" `a` to `x`.
- The contract line drops the existential. Read as written, it is a claim about every linear map
  into an injective module, and that claim is false.
- The 2.8 route then calls the injective module `M`. In the supplier declaration, `M` is the source
  module and the injective module is `Q`, which is also its name in 2.8's Lean signature.

**Witness.** Tau Ceti `Algebra/Module/Injective/Hom.lean` lines 77–83. Take the zero map `ℤ → ℚ`
(`ℚ` is injective over `ℤ`), `a = 1`, `x = 1`. Only `s = 0` kills `1`, so the condition holds,
yet the zero map sends `1` to `0 ≠ 1`.

**Repair.**

- README 202–204: write "(`TauCeti/Algebra/Module/Injective/Hom.lean`): for `a : M` and `x` in
  an injective module `Q`, some linear map `M → Q` sends `a` to `x` exactly when every scalar
  killing `a` kills `x`, used by 2.8."
- README 526–527: name the module, "a module `Q` is injective if and only if it is divisible".
- README 533–534: write "extends `r ↦ x` to a linear map `f : R → Q`, and `x = r • f 1`".

Tested on the instance above: the repaired line asserts only that some map works, and the
inclusion `ℤ → ℚ` sends `1` to `1`. In 2.8, for `Q = ℚ ⁄ ℤ`, `r = 2` and `x = 1 ⁄ 3`, the
extension has `f 1 = 1 ⁄ 6` and `2 • (1 ⁄ 6) = 1 ⁄ 3`. A scratch proof of 2.8's forward direction
from the Tau Ceti theorem, with `M := R` and `a := r`, elaborates with no error (see Verified
sound).

## Previous findings

- R01 — repaired: `Suggested.lean` no longer declares `mul_pow_prime_of_commute_commutatorElement`, and its docstring (lines 38–41) lists 1.7 among four two-line consequences. README 1.7 (334–340), *Needs*, contract (144) and How to read (226–227) updated.
- R02 — repaired: 2.3 (437–442) names `Module.finitePresentation_of_finite`, `Module.FinitePresentation.fg_ker` and `Shrink.linearEquiv`, also in the contract (156). 2.8 (532–537) and Layer 2 Dependencies name the Tau Ceti theorem. The contract wording is this report's R01.
- R03 — repaired: Scope 40–45 leaves the finite-field Hasse multiplicity criterion and `hasseDeriv k (f ^ q) = 0` to CharacterSumsOverFiniteFields §4.1, and says how 1.3 differs (every commutative ring of characteristic `p`).
- R04 — repaired: 5.2 (766–769) is "the `2 × 2` Cauchy–Binet formula, Tau Ceti's `Matrix.pairMinor_mul` … with no `Fintype` or `LinearOrder`, which doubles the sum over `i < j`". It is in the *Needs* line, the contract (210–211) and Layer 5 Dependencies.
- R05 — repaired: 2.1's third Check (411–414) reads "some power `R ^ A`, for an index set `A` depending on `R`, is not flat although `R` is."

## Verified sound

**Gate and build.**

- The worker's gate at this head and a rerun both report every check at `0` and `OK`.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds only
  `README.md`, `Suggested.lean` and `metadata.toml`.
- `lake env lean` on `Suggested.lean` gives 31 "declaration uses `sorry`" warnings and nothing
  else (32 before, less the deleted 1.7 declaration).
- Dependency check (`--movable`, candidate merge order): `depcheck: 245 roadmaps, 2465 edges, 0
  problem(s)`. There is no UPWARD, CYCLE or `moved:` line. The roadmap consumes no other roadmap
  and declares no gaps.

**Signatures.** A scratch copy of `Suggested.lean` with `#check @name` for all 31 declarations
elaborates with no error. The only Lean change at this head is the deletion of the 1.7 declaration
and two docstrings (the header and 2.3). The 2.3 signature is unchanged
(`[Ring R] [Small.{v} R]`, modules in `Type v`) and matches the worker's `signatures.md`.

**One-tactic probe.** The 2.3 signature does not close by
`first | rfl | infer_instance | simp | aesop | grind | exact?`, since `exact?` fails. Its route
takes eight lines (below), so it is not padding. The other 30 Lean statements are unchanged, and
the previous review's probe on them at the same pins stands.

**Library declarations opened at the pins** (the ones this change adds, each with `#check @`):

- Mathlib `Nat.Prime.dvd_choose_self` (`Data/Nat/Choose/Dvd.lean` line 38): `k ≠ 0 → k < p → p ∣ p.choose k`.
- Mathlib `Module.finitePresentation_of_finite` (`Algebra/Module/FinitePresentation.lean` line 119): `[Ring R] [IsNoetherianRing R] [Module.Finite R M]`.
- Mathlib `Module.FinitePresentation.fg_ker` (same file, line 192): `[Ring R]`, `Module.Finite R M`, `N` finitely presented, `l` surjective, so `ker l` is finitely generated.
- Mathlib `Shrink.linearEquiv` (`Algebra/Module/Shrink.lean` line 30).
- Tau Ceti `TauCeti.exists_linearMap_apply_eq_iff_forall_smul_eq_zero` (`Algebra/Module/Injective/Hom.lean` line 79): `[Ring S] [Small.{v} S] [Module.Injective S Q]`.
- Tau Ceti `Matrix.pairMinor_mul` (`LinearAlgebra/Matrix/Minor.lean` line 127): `[Fintype l] [LinearOrder l]`, a sum over `ij.1 < ij.2`. Its module was built with `lake build TauCeti.LinearAlgebra.Matrix.Minor`.
- Tau Ceti `Commute.mul_pow_eq_pow_mul_pow_mul_commutatorElement_pow_choose_two` (`GroupTheory/Commutator.lean` line 96). No odd-prime corollary exists in that file or elsewhere in Tau Ceti.
- Mathlib `FieldTheory/Finite/Basic.lean` line 459: `expand K q f = f ^ q` over a finite field. This supports the Scope sentence "`f ^ q = expand q f`".

**Routes proved in a scratch probe** (importing the three Tau Ceti modules), with no `sorry`:

- 1.7: the exact former signature closes in two tactics, `obtain ⟨m, hm⟩ := hp.dvd_choose_self …`
  and a `rw` with the class-two formula at `n = p`, as README 336–338 says.
- 2.3: forward by `Module.finitePresentation_of_finite R M`. Converse by `fg_ker` on
  `(Shrink.linearEquiv R (R ⧸ I)).symm ∘ₗ I.mkQ`, whose kernel is `I`. This is the README route.
- 2.8 forward: from the Tau Ceti theorem with `M := R` and `a := r`. Over a domain only `s = 0`
  kills `r ≠ 0`, and `x = r • f 1`.
- 5.2 against `Matrix.pairMinor_mul`: for rows `a = (1, 2, 3)`, `b = (0, 1, 4)` and columns
  `c = (2, 0, 1)`, `d = (1, 1, 1)`, `decide` gives `pairMinor (g * h) (0, 1) (0, 1) = 1` and
  5.2's ordered sum `= 2`.

**Cross-roadmap citations resolved.** `roadmaps resolve` reports none missing.

- CharacterSumsOverFiniteFields §4.1, read at its open head (README lines 1278–1287). It states the
  criterion as an iff for nonzero `f` over a finite field `F` with `q = Nat.card F`, together with
  `hasseDeriv k (f^q) = 0` for `0 < k < q`.
  - It is earlier in the merge order (line 154, against 398 here) and does not cite this roadmap.
  - The Scope parenthetical gives the criterion's forward direction. The ownership boundary is
    unambiguous.
- ArithmeticInterpolationDeterminants (README lines 37 and 105) now agrees with this Scope on the
  Hasse split.
- No roadmap on main or at an open head cites the deleted name
  `mul_pow_prime_of_commute_commutatorElement`. PCurvature's citations of §3.2 (lines 125, 254,
  339) are untouched.
- The worker's overlap report and a rerun agree: no open pull request changes this roadmap, and no
  cited id is dropped.

**Ownership.** The change adds citations only and no new owned object. The previous review's
by-object search over main and the open heads stands for the untouched targets.

**Sources (the seeded sample where the change touches it).**

- 2.1 Check: `chase1960` line 139, Theorem 2.1, printed p. 460. Its condition (b) (line 141) is
  that the product of any family of copies of `R` is flat, and (d) (line 144) that finitely
  generated left ideals are finitely related. The Check now claims exactly what the theorem gives.
- 1.7 now rests on the two pinned declarations above, as 2.5 does.
- 2.8's locator ("own statements in this generality; Mathlib's `Module.Baer.of_divisible` is the
  case of `ℤ`") is unchanged.
- The other sampled targets (1.1, 1.4, 1.5, 1.6, 2.2, 2.4, 2.6, 2.10, 2.11, 3.2, 5.3, 5.4) are
  untouched; the previous review checked them at their locators (Stacks 059K, 031K and 00PF; own
  statements recomputed).

**Adversarial table.** The rows for changed statements were computed at this head. Rows marked
"r8" are carried from the previous review at `cded50d`, whose statements this change leaves
untouched.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.7 (README only) `(u v)^p = u^p v^p`, odd `p` | p = 3, 5, 2; abelian G; Heisenberg mod 3; Q₈; scratch proof | `C(3,2) = 3`, `C(5,2) = 10 = 5·2`, `C(2,2) = 1` and `2 < p` fails at p = 2. Abelian: `d = 1`, true for every p. Heisenberg over ZMod 3: corners `6 ≡ 0 ≡ 9`. Q₈: `d = −1`, `(ij)² = −1 ≠ 1 = i²j²`. Two-tactic proof closes | true | none |
| 2.1 Chase Check | `R = k[x, y₁, y₂, …] ⁄ (x yᵢ)` | `ann(x) = (y₁, y₂, …)` not f.g., so `(x)` is not finitely related: (d) fails, so (b) fails for some `R ^ A`; `chase1960` lines 151–152 index `A` by the relation module | true | none |
| 2.3 Noetherian ↔ f.g. ⇒ f.p. | ℤ; `k[x₁, x₂, …]`, `I = (xᵢ)`; probe | ℤ: both sides true. `R ⧸ I ≅ k` is f.g.; `fg_ker` would make `I` f.g., so `k` is not f.p.: both sides false. Probe closes from the named declarations; `exact?` fails | true | none |
| 2.8 forward route | ℚ⁄ℤ, r = 2, x = 1⁄3; ℤ⁄4 over itself, r = 2, x = 1 | `f 1 = 1⁄6`, `2 • 1⁄6 = 1⁄3`. Over ℤ⁄4, `s = 2` kills `r = 2` but `2 • 1 = 2 ≠ 0`: no `f`, and `2 •` has image `{0, 2}`; the domain hypothesis is used exactly there | true | R01 (wording) |
| Contract line `exists_linearMap…` | zero map ℤ → ℚ, a = x = 1; inclusion | as worded (every map): `0 ↦ 0 ≠ 1` while only `s = 0` kills 1, false. Existential: inclusion `1 ↦ 1`, true | false as worded | R01 |
| 5.2 against `pairMinor_mul` | the 3-index instance above; a = c = (1,0), b = d = (0,1); s = ∅; one index | `Σac = 5`, `Σbd = 5`, `Σad = 6`, `Σbc = 4`: `25 − 24 = 1`; ordered sum `2`. Second: `1` and `2`. Empty: `0 = 0`. One index: left `0`, right `2(acbd − adbc) = 0` | true, factor `2` as stated | none |
| Scope: `hasseDeriv k (f^q) = 0` from 1.3 | 𝔽₃, f = X + 1; 𝔽₄, f = X; 𝔽₂(t), f = tX | `f³ = X³ + 1 = expand 3 f`; `hasseDeriv 1, 2` give `3X², 3X = 0`; `hasseDeriv 3 = 1` (k = q excluded). `C(4,k) = 4, 6, 4`, all `0` in characteristic 2. `(tX)² = t²X² ≠ tX² = expand 2 (tX)`: needs `𝔽_q` | true | none |
| r8: 1.1 | n = 0; e = 0; (2,1,6); (2,2,6); p = 4 | `C(0,k) = 0`; `1 ∣ n`; `C(6,1) = 6` even; `C(6,2) = 15` odd; `C(4,2) = 6`, `4 ∤ 6` | true | none |
| r8: 1.2 | a = 0; (3,1); (2,2); k = p^a | `C(0,0) = 1`; `1,2,1 ≡ 1,−1,1`; `1,3,3,1` odd; `C(2,3) = 0` | true | none |
| r8: 1.3 | ZMod 3, X³, X⁴; k = p^e | `3X² = 3X = 0`; `4X³ = X³ ≠ 0`; `hasseDeriv 3 X³ = 1` | true | none |
| r8: 1.4 | ZMod 2, f = g = X, k = 1, 2 | `X² = X²·1`; k = 2: `1` vs `0` | true | none |
| r8: 1.5 | ℤ, a = 1, q = X + 1; a = 0; zero ring | `q(1) = 2`, quotient `ℤ⁄2`; `(X+1) − X = 1`; both sides true | true | none |
| r8: 1.6 | n = 0, 2, 3; from 1 | `1`; `2 − 1 = 1`; `3 − 3 + 1 = 1`; `[[2,3],[3,6]]` gives `3` | true | none |
| r8: 1.8 | ⊥; wreath (𝔄₅×𝔄₅)⋊C₂; ⟨(12)⟩ ≤ 𝔖₃ | order 3600 perfect; `⁅𝔖₃,𝔖₃⁆ = 𝔄₃` | true | none |
| r8: 2.1 `prod_iff` | ℤ × ℤ⁄2; ι = ∅ | `ℤ⁄2 ⊗ (2·) = 0`; `Π_∅ = 0` flat | true | none |
| r8: 2.2 | M = R; M = ℚ, `ℤ⁄2ⁿ` | identity; `Π (ℚ ⊗ ℤ⁄2ⁿ) = 0`, `ℚ ⊗ Π ≠ 0` | true | none |
| r8: 2.4 | ℤ, `2•`, ℤ² | `(2,4)` in, `(2,3)` out | true | none |
| r8: 2.5 | ℤ⁄4, (2); ℤ, (p) | `I² = 0`; `ℤ_p` uncountable | true | none |
| r8: 2.6 | k → k[t] → k; T = S; k[t]⁄(t²) | `k dt → 0`; isomorphism; `t dt ↦ 0`, `H¹ = (t²)⁄(t⁴)` | true | none |
| r8: 2.7 | ℤ ⊆ ℚ, x = 1, 2; ℤ², (1,2) | `1⁄2 ∉ ℤ`; `x = 2·1` excluded; `(3⁄2, 3) ∉ ℤ²` | true | none |
| r8: 2.8 statement | ℚ⁄ℤ; ℤ; ℤ⁄4 | `2·` misses 1 in ℤ; `(2) → ℤ⁄2`, `2 ↦ 1` has no extension | true | none |
| r8: 2.9 | ℤ, (2), a = 3; p = (4); ℤ[i], (5) | `3` acts as 1; `2·2 = 0`; `(2 ± i)` over `(5)` | true | none |
| r8: 2.10 | ℚ⁄ℤ, t = 6; t = 0; k[x,y], t = x | `ℤ⁄6`; `ℚ⁄ℤ ≇ ℤ`; `Ext²(k, A) = k` | true | none |
| r8: 2.11 | ℤ⁄12; ℤ; ℚ⁄ℤ; k[x,y]⁄(x) | length 3; infinite chains for the others | true | none |
| r8: 3.1 | n = 0, −1, −2 on ℚ[x, x⁻¹] | `D1 = 0`; `−x⁻²`; `−2x⁻³` | true | none |
| r8: 3.2 | k[x], a = x; u = x | identity; `−x⁻¹ = (D − x⁻¹Dx)1` | true | none |
| r8: 4.1 | ℚ × [0,1]; f = x − y | not locally compact; `curry f 1 0 = 1` | true | none |
| r8: 4.2 | Spec ℤ, {(0)}; Sierpiński | no W at (0); `{1}` open, `{0}` not stable | true | none |
| r8: 5.1 | finite group; {1, a, b} left zeros; (ℤ⁄n, ·) | no right zero; `aM ∩ bM = ∅`; `0` right zero | true | none |
| r8: 5.3 | `[[1,0],[0,0]]`, `[[0,0],[1,1]]`; (2),(0); 𝔽₂ | `(P−Q)² = 1`, trace `0`; `8 ≠ 2`; `1 = 1 − 0` | true | none |
| r8: 5.4 | (ℕ, ·); Multiplicative ℕ; {1, e} | `0·2 = 0·3`; `1 = 3 − 2`, `−2 = 0 − 2`; `e·e = e·1` | true | none |
| r8: 5.5 | k[X]; `kᵖ` vs 0 over 𝔽̄_p; L × L over 𝔽_p(t) | `tr X = λ`; `p·a = 0`; `Tr_{L⁄k} = 0` | true | none |
| r8: Conventions | 1.3, 1.4, 1.6, 1.7, 2.9, 4.1, 5.2 | `3X² = 0`; `hasseDeriv 2 X² = 1`; `[[1,1],[1,2]]`; corner `−1`; `√(4) = (2)`; `curry f 1 0 = 1`; `2 = 2` | consistent | none |

**Checks of the changed passages.**

- 1.7's three Checks (344–354) are unchanged, and they still apply to the README-only statement
  (rows above).
- The rewritten 2.1 Check is the R05 row.
- The 5.2 Checks agree with the `pairMinor_mul` comparison: the first Check's value `2` is twice
  the increasing-pair value `1`.

**Headline theorems.**

- All 28 targets are statable at the pins. 25 are stated, in 31 declarations.
- 1.7, 2.5, 2.11 and the finite-product form of 2.1 are named in the docstring (lines 38–46) as
  two-line consequences of the pins.
- 4.1's homeomorphism is named as the bundling of its two continuity theorems.
- There is no stand-in, no `set_option` and no sorried data.

**Remarks.**

- The pull request description still says "Three statements that follow from the pins in two
  lines". At this head there are four. The description is not a roadmap file, so this is not a
  finding.
- Untouched text: Layer 1 Dependencies (385–388) lists only some of the Mathlib inputs (not
  `IsCoprime` or `Nat.Prime.dvd_choose_self`). It reads as a summary, and the *Needs* lines are
  complete.

## Not verifiable

- Avron–Seiler–Simon 1994, Theorem 4.1 (`ass1994`): settled as uncertified (paywalled). The matrix
  identity of 5.3 was recomputed in the previous review.
- Lang, *Algebra*, XVII Corollary 3.8 (5.5's closest source): Springer, with no legal open copy.
- Lucas 1878 (1.1, 1.2), not reread this round. The cached `lucas1878` is still a JSTOR "Client
  Challenge" page (`lucas1878` line 5), not the paper, although the manifest records it as
  certified. Lucas's theorem was checked against Mathlib's `Choose.choose_modEq_prod_range_choose`
  in the previous review.

## Source issues

- none
