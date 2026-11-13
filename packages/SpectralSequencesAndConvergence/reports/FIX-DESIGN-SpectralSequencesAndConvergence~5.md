# Repair round 5 of the SpectralSequencesAndConvergence design

Review settled: REV-DESIGN-SpectralSequencesAndConvergence~4 (two findings: R01 P2, R02 P3).
Files edited: `packages/SpectralSequencesAndConvergence/design/README.md` and
`packages/SpectralSequencesAndConvergence/design/plan.json`. `sources.toml` is unchanged: the new
locators (stacks-012K Definition 24.9 (1), tag 012U; helle-rognes2024 Definition 2.7) are already
covered by its `locator` and `cited_for` entries. No `Suggested.lean` exists at the design stage.

## REV-DESIGN-SpectralSequencesAndConvergence~4/R01 (P2) — applied

5.2: "converges weakly at `(p, n − p)` iff (24.6.1), (24.6.2) are equalities" → the inclusion
`Zᵗ/B_∞ ↪ E_∞` of 4.3 is an isomorphism iff (24.6.1) is an equality, the projection
`Zᵗ/B_∞ ↠ gr^p H^n` iff (24.6.2) is; equalities throughout `I` make these comparisons the `β` of
3.2 (Stacks' notion). New fourth Check: the reviewer's complex. Plan 5.2 likewise, new test.

Verified before editing. The complex `K^{−1} = ℤ`, `K^0 = ℤ^(ℕ) ⊕ ℤ`, `d(x) = (0, x)`,
`F^p K^0 = K^0` (`p ≤ 0`), `0` (`p ≥ 1`), `F^p K^{−1} = 0`: the filtration is by subcomplexes
(`d(F^p K^{−1}) = 0`); `gr^0 K = K^0` in degree `0`, all other `gr^p K = 0`, so
`E_1^{0,0} = E_∞^{0,0} = ℤ^(ℕ) ⊕ ℤ` and all differentials vanish; `H^0 = K^0/(0 ⊕ ℤ) = ℤ^(ℕ)`,
`H^{−1} = ker d = 0`; `F^p H^0 = H^0` for `p ≤ 0` (`H^0(F^pK) = K^0 ↠ H^0`), `0` for `p ≥ 1`.
`ℤ^(ℕ) ⊕ ℤ ≅ ℤ^(ℕ ⊔ 1) ≅ ℤ^(ℕ)`, so 3.2's structure (arbitrary `β`) exists in `I = ℤ`, and is
strong by 3.4 (finite filtration). Stacks (24.6.2) at `p = n = 0` (stacks-012K line 3098–3102):
left side `⋃_r (F^0K^0 ∩ d(F^{1−r}K^{−1}) + F^1K^0) = 0`, right side
`Im(d) ∩ F^0K^0 + F^1K^0 = 0 ⊕ ℤ`. The "only if" half was false.

The dictionary the new statement uses was computed, not assumed. With `G_t = F^{−t}` and classical
`p = −q − 1` (Conventions), 4.3's `Zᵗ = ker(δ : H^n(F^p/F^{p+1}) → H^{n+1}(F^{p+1}))` is the image of
`H^n(F^pK) → H^n(gr^pK)`, i.e. the image in `E_1` of `Ker(d) ∩ F^pK^n + F^{p+1}K^n`, the left side
of (24.6.1); `Bᵗ = im(δ : H^{n−1}(K/F^p) → H^n(gr^pK))` sends `[ȳ]` with `dy ∈ F^pK^n` to
`[dy]`, the image of `Im(d) ∩ F^pK^n + F^{p+1}K^n`, the right side of (24.6.2). Both sides of each
inclusion contain the classical `B_1` (`d(F^pK^{n−1}) + F^{p+1}K^n`) and lie in `Z_1`, so by the
order isomorphism of 1.1 equality at Stacks' `E_0` level is equality in `E_1`. The classical
assignment `(a, b) ↦ (−b − 1, a + b)` of 5.1 is onto `ℤ × ℤ` (`(s, n) ↦ (n + s + 1, −s − 1)`), so
3.2's clause "`gr^s H^n = 0` off the image" is vacuous and the comparisons are a complete `β`.

## REV-DESIGN-SpectralSequencesAndConvergence~4/R02 (P3) — applied

Mathlib contract: "instances `AB5`, `AB4Star`, `EnoughProjectives` for `ModuleCat R`" → `AB5`,
`AB4Star` for `ModuleCat.{u} R`, `R : Type u` only; `EnoughProjectives` under `Small.{v} R`;
`CountableAB4Star` from `AB4Star`, sequential exactness from `AB5` by `AB5OfSize_shrink`. 7.2:
"`ModuleCat R` (for `Small R`)" → "`ModuleCat.{u} R` for `R : Type u`"; plan api likewise.

Verified at the pin: `Mathlib/Algebra/Category/ModuleCat/AB.lean` line 28 (`variable (R : Type u)`),
30 (`AB5 (ModuleCat.{u} R)`), 38 (`AB4Star (ModuleCat.{u} R)`); a grep of the pinned Mathlib and
Tau Ceti finds no other `AB5`/`AB4Star` instance for `ModuleCat`. `ModuleCat/Projective.lean`
line 60 (`EnoughProjectives (ModuleCat.{v} R)` under `[Small.{v} R]`).
`GrothendieckAxioms/Basic.lean`: `AB4Star := AB4StarOfSize.{v}` (99), shrink to `.{0}` (108–110),
`CountableAB4Star` from `AB4StarOfSize.{0}` (129); `AB5 := AB5OfSize.{v, v}` (152),
`AB5OfSize_shrink` (166) is a lemma, not an instance, so for `u > 0` it is needed to reach
`HasExactColimitsOfShape ℕ`. The repair is as asked: every `ModuleCat.{v} R` with `Small.{v} R` is
equivalent to modules over `Shrink.{v} R : Type v`, so no mathematics is lost.

## The same pattern elsewhere

R01 (the abstract `β` of 3.2 identified with Stacks' canonical comparison). Every occurrence of
"weak", "if and only if", "iff" and "24.6" in the README and every `plan.json` string was read.

- Conventions, convergence dictionary: "*Weak convergence* means isomorphisms … (stacks-012K
  'weakly converges')" equated the two notions. Now: given isomorphisms as in helle-rognes2024
  Definition 2.7 (line 94–96, "there are isomorphisms"); Stacks' notion (line 3131–3136) asks the
  canonical comparison to be an isomorphism, is the structure of 5.2 with those `β`, and is strictly
  stronger (5.2, fourth Check).
- 3.2's locator now says Stacks' isomorphisms are the canonical comparisons of its Lemma 24.6; plan
  3.2's statement says "given isomorphisms β …, not required to be canonical" and its locator
  carries the same clause. No forward edge is added (3.2's *Needs:* is unchanged).
- Read and unchanged, as the reviewer also found: 4.3's first Check, 4.4's third Check and 5.4's
  second Check conclude that weak convergence fails where `E_∞^{0,0} = ℤ` and `gr^0 H^0 = 0`, so no
  isomorphism of any kind exists; 4.4, 4.5, 5.3, 5.4 state convergence through the comparisons of
  4.3; 3.3–3.6 and 7.4–7.5 use only the existence of `β`, which is what they need.

R02 (module-category instances cited at a generality the pin lacks). Every `ModuleCat` occurrence
was read; four further places rely on the `AB5`/`AB4Star` instances:

- 5.4 bullet "For complexes of modules (`ModuleCat R` is `AB5`)" → `ModuleCat.{u} R` over
  `R : Type u`, exact sequential colimits by the `AB5` instance and `AB5OfSize_shrink`, containing
  Tau Ceti's `CochainComplex.exists_mem_range_filtrationAbutmentFiltrationι` in that universe (the
  Tau Ceti theorem, `Filtered/Exhaustive.lean` line 96, is for `ModuleCat R` at any universe).
  5.4's first Check and plan test `modules_instance` likewise.
- 7.4 bullet "On `ModuleCat R` these are Helle–Rognes's statements" → `ModuleCat.{u} R` with
  `R : Type u`, naming the instances that give 7.4's hypotheses on `C`.
- 7.5 bullet "For `ModuleCat R` this contains DGFloer Layer 1 item 3's complete convergence" →
  `ModuleCat.{u} R` with `R : Type u` (it needs 7.4's hypotheses).
- *Needs:* lines of 5.4, 7.2 and 7.4 name the module instances (and `AB5OfSize_shrink`) for their
  module bullets; plan prerequisites add `mathlib:CategoryTheory.AB5` and
  `mathlib:CategoryTheory.AB5OfSize_shrink` (5.4, 7.4) and `mathlib:CategoryTheory.AB4Star` (7.2).
- Unchanged: 7.1's bullet (lim, lim¹ on `ModuleCat R` need only countable products, which
  `ModuleCat.hasLimits`, `ModuleCat/Limits.lean` line 140, gives at every universe); Checks in
  `ModuleCat ℤ` and `ModuleCat k` (abelian structure only); the AlgebraicTopology contract line.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 5.2: inclusion iso iff (24.6.1) equality | `×2` complex at `(1, 0)` and `(0, 0)`; 1.4's `ℓ`-adic complex at `(0, 0)` | `(1,0)`: `Zᵗ = K^1 = ℤ = Z_∞`; `(0,0)`: `Zᵗ = 0 + F^1K^0 = 0 = Z_2 = ker(×2)`; 1.4 complex: `Zᵗ = Ker(d) ∩ F^0K^0 = 0 = ⋂_r ℓ^{r−1}ℤ = Z_∞` | both sides true in all three |
| 5.2: projection iso iff (24.6.2) equality | `×2` at `(1, 0)`; non-exhaustive complex of 4.3; reviewer's complex | `Bᵗ = 2ℤ = B_2`, `E_∞ = ℤ/2 ≅ gr^1H^1`; `Bᵗ = ℤ ≠ 0 = B_∞`, projection `ℤ ↠ 0`; `Bᵗ = 0 ⊕ ℤ ≠ 0`, projection `ℤ^(ℕ) ⊕ ℤ ↠ ℤ^(ℕ)` with kernel `ℤ` | true/true; false/false; false/false |
| 5.2: equalities in `I` ⇒ `β` of 3.2 | classical assignment; `I = ∅`; zero complex | `(s, n)` has preimage `(n + s + 1, −s − 1)`; `I = ∅` vacuous; all objects `0`, comparisons `0 ≅ 0` | holds |
| 5.2 fourth Check | the complex above | `E_1^{0,0} = ℤ^(ℕ) ⊕ ℤ`, `H^0 = ℤ^(ℕ)`, `F^0 = H^0`, `F^1 = 0`; abstract `β` exists; (24.6.2): `0 ⊊ 0 ⊕ ℤ` | weak (strong) structure exists, comparison not iso |
| 5.2 old "iff" (removed) | same complex | 3.2-weak convergence holds, (24.6.2) strict | "only if" refuted |
| Conventions: Stacks' weak convergence strictly stronger | Stacks ⇒ 3.2: take `β` = comparisons; converse: fourth Check | as above | holds |
| R02 contract: `AB5`, `AB4Star` only at `ModuleCat.{u} R`, `R : Type u` | `ModuleCat.{0} ℤ`; `ModuleCat.{1} ℤ` | instances at AB.lean 30, 38 apply to the first; no instance for the second (grep of both pins) | holds |
| `CountableAB4Star` from `AB4Star` | `ModuleCat.{u} R` | `AB4StarOfSize.{u}` → `.{0}` (Basic 108) → `CountableAB4Star` (129), `HasProducts.{0}` from `hasLimits` | holds |
| Exact sequential colimits from `AB5` | `u = 0`; `u = 1` | `u = 0`: `AB5OfSize.{0,0}.ofShape ℕ`; `u = 1`: `AB5OfSize_shrink` with `w = w′ = 0`, `w₂ = w₂′ = 1` gives `AB5OfSize.{0,0}`, `ℕ` filtered | holds |
| 7.2 module bullet | `R = ℤ`, `u = 0`; `R : Type 1`, `u = 1` | `Small.{u} R` (`R : Type u`), `EnoughProjectives` (Projective 60), countable products, so 7.2's first claim gives lim-acyclic epimorphic towers; `CountableAB4Star` as above | holds |
| 5.4 module bullet and first Check | `ModuleCat.{u} R`, `R : Type u` | 5.4's hypothesis `HasColimitsOfShape ℕ`, `HasExactColimitsOfShape ℕ` as above; exhaustive by submodules = every element in a step | holds |
| 7.4 module bullet, 7.5 module bullet | `ModuleCat.{u} R`, `R : Type u` | countable products (`hasLimits`), countable coproducts (`hasColimitsOfSize`), `CountableAB4Star`, exact `ℕ`-colimits, lim-acyclic epimorphic towers (7.2) | hypotheses of 7.4 hold |

## Checks

- Dependency check, verbatim:

      candidate: SpectralSequencesAndConvergence is not in the merge order yet; checked as if placed after StableHomotopyKTheory (the intake inserts it when its design is accepted)
      depcheck: 227 roadmaps, 2053 edges, 0 problem(s)

  No UPWARD or CYCLE line.
- README *Needs:* lines against plan `target:` prerequisites (script over all 31 sections):
  0 mismatches. `plan.json` parses.
- `roadmaps resolve` on the edited README: no cross-roadmap citation and no Lean name found
  nowhere. The new Mathlib names `AB4Star` (`GrothendieckAxioms/Basic.lean` line 99) and
  `AB5OfSize_shrink` (line 166) were located at the pin by hand.
- No LaTeX delimiters, no line over 100 characters, no process words added.
- `#check` comparison of `Suggested.lean`: not applicable (design stage, no `Suggested.lean`).
- Gate failures: none were listed for this round.

## For the maintainer

- No section, layer or target number changed, and no Lean name other roadmaps cite changed.
- No new construction is introduced, so no new ownership question arises from the edits.
- **Lead, not acted on (outside these findings' scope).** 7.2's definition "lim-acyclic epimorphic
  towers" overlaps Tau Ceti's `TauCeti.IsReplete` (`TauCeti/CategoryTheory/Limits/Replete.lean`
  line 91: for every tower of epimorphisms the projection of every limit cone to `F 0` is an
  epimorphism; `TauCeti.IsReplete.epi_π_app` gives every projection). In an abelian category
  with countable products the two are equivalent: lim-acyclicity gives repleteness directly, and
  conversely for an epimorphic tower `f_n : F_{n+1} ↠ F_n` let `T = ∏ F_n` and
  `P_n = F_n ⊕ T` with transitions `(a, t) ↦ (f_n a + π_n t, t)` (epimorphisms by the snake lemma).
  Repleteness makes `lim P → T` an epimorphism, and the `F`-components `a` of `lim P` satisfy
  `(1 − s) ∘ a = (lim P → T)`, so `1 − s` is an epimorphism and `lim¹ = 0`. Moreover
  `TauCeti.IsReplete.countableAB4Star` (line 357) makes the `CountableAB4Star` hypothesis of 7.3–7.5
  redundant once repleteness is assumed. Repleteness of topoi is planned by
  SchemeAndStackFoundations §2.17, and CrystallineCohomology §E2.2 plans `IsReplete.derived_limits`
  on replete topoi. A later revision could state 7.2 through `TauCeti.IsReplete` and cite these
  roadmaps. That would change the hypotheses of 7.2–7.5 and the Summary, which goes beyond this
  round's findings.
- The universe restriction of R02 follows the pinned instances. Mathematically, `CountableAB4Star`
  and lim-acyclic epimorphic towers hold for every `ModuleCat.{v} R`. A route through Tau Ceti's
  `TauCeti.IsReplete.of_reflectsEpimorphisms` along the forgetful functor to types would give them
  at every universe, but that route was not checked at the pin.
- Ownership against open pull requests: the 216 sibling roadmaps were not searched again, because
  no construction was added; the repleteness lead above was searched with `roadmaps grep`.
