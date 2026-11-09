# Review of GrothendieckNotesLemmas (pull request #1431 at ea4f7b2)

**Verdict:** needs changes

This is an incremental re-review of the 22 lines that changed since `e8702ce`. All of them are in
`README.md`: the third Check of 2.1 (lines 412–415), a new paragraph "Not a target: arbitrary
products" closing 2.1 (lines 417–422), and two Stacks tags added to the references (lines
896–897). `Suggested.lean` and `metadata.toml` are byte-identical to `e8702ce`. The pins are
unchanged: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`. Nothing changed outside the folder against
`origin/main`.

- The previous report had no findings, so there is nothing to carry.
- The new locators are right: Stacks Tags 05CV, 05CY and 05CZ and Chase's Theorem 2.1 say what the
  README says they say, and the ring example of the Check is correct.
- Two P3 defects in the new paragraph: it restates, with its proof route, the arbitrary-product
  theorem that DirectSummandsAndBigCohenMacaulay §5.2 already states, without naming that owner
  (R01); and the Chase citation lost its theorem number (R02). Neither blocks.

## R01 (P3) — the arbitrary-product theorem has an owner the paragraph does not name

**Location.** `TauCetiRoadmap/GrothendieckNotesLemmas/README.md` lines 417–422: "Not a target:
arbitrary products. For a commutative ring `R`, every product of flat `R`-modules is flat if and
only if … `R` is coherent … The direction from coherence is 2.2 applied to the finitely generated
ideals; stating the theorem needs coherent rings, which this roadmap does not define."

**Claim.** The paragraph states the theorem (Chase's equivalence and its Noetherian case) and
sketches its proof as if no roadmap stated it, and the Scope section's "Left to other roadmaps"
list does not name an owner. DirectSummandsAndBigCohenMacaulay §5.2, "Products of flat modules over
a Noetherian ring are flat", states it as a target for a Noetherian, "more generally a coherent",
ring, with the same route (finitely generated ideals are finitely presented, tensor with a finitely
presented module commutes with products) and the same Chase negative control, and its first Check
says the finite case is Tau Ceti's `Module.Flat.pi`. That roadmap is earlier in the merge order
(line 216 of the candidate order; this roadmap is line 399), so naming it is a downward citation.
The README's house shape puts every "left to roadmap X" statement in Scope, by section.

**Witness.** `TauCetiRoadmap/DirectSummandsAndBigCohenMacaulay/README.md` at the head of its
pull request, lines 992–1006: the heading "### 5.2 Products of flat modules over a Noetherian
ring are flat", the statement "Let R be a Noetherian ring (more generally a coherent ring) …
Then ∏ M_i is flat", and the Check "For I finite this is Tau Ceti's Module.Flat.pi".

**Repair.** Add to Scope, "Left to other roadmaps", the bullet: "*Products of flat modules over
a Noetherian ring, more generally a coherent ring, for an arbitrary index set*:
DirectSummandsAndBigCohenMacaulay, §5.2. Target 2.1 is the finite case." Then replace the last
sentence of the 2.1 paragraph (from "The direction from coherence" to "does not define.") by
"The theorem for arbitrary index sets is DirectSummandsAndBigCohenMacaulay, §5.2, listed under
Scope; its route is 2.2 applied to the finitely generated ideals." I checked that §5.2 at that
head covers both the Noetherian case the paragraph cites from Tag 05CY and the coherent case,
and that its route is the one the paragraph describes.

## R02 (P3) — the Chase citation lost its theorem number

**Location.** `TauCetiRoadmap/GrothendieckNotesLemmas/README.md` line 419: "(Chase 1960;
Stacks, Tag 05CZ)". At `e8702ce` the same claim was cited as "Chase 1960, Theorem 2.1".

**Claim.** Chase 1960 is a 17-page paper; the claim it is cited for is its Theorem 2.1, and the
change dropped the locator. The parallel Stacks locator is exact, so the claim is still located,
but the primary citation no longer is.

**Witness.** `chase1960` lines 139–144: "Theorem 2.1. For any ring R the following statements are
equivalent", with (a) products of flat modules flat, (b) products of copies of `R` flat, (d)
finitely generated left ideals finitely related. Stacks, Tag 05CZ, attributes the proposition
to that theorem (Stacks algebra text, lines 10145–10146).

**Repair.** Write "(Chase 1960, Theorem 2.1; Stacks, Tag 05CZ)". The repaired sentence of R01
should carry the same locator; applying R01 with it closes R02.

## Previous findings

- The previous report (at `e8702ce`) accepted with no findings; there is nothing to carry.

## Verified sound

**Gate and build.**

- The worker's gate at this head passes with every check at `0`, `build=0` included. My rerun
  with `--base origin/main --build` reports every scanner, depcheck and the build at `0` and
  ends `OK`.
- `git diff --stat origin/main...HEAD` restricted to paths outside the folder is empty; the
  long list of files in the change summary is the merge of `main` into the branch, and none of
  them differs from `origin/main` (`f3729839`). The folder holds only `README.md`,
  `Suggested.lean` and `metadata.toml`.
- `lake env lean` on `TauCetiRoadmap/GrothendieckNotesLemmas/Suggested.lean` exits with code 0.
  Its output is 31 "declaration uses `sorry`" warnings and nothing else, as at `e8702ce`.
- Dependency check (`--movable`, candidate merge order): `depcheck: 239 roadmaps, 2321 edges, 0
  problem(s)`. No UPWARD, CYCLE or `moved:` line. The roadmap consumes no other roadmap and
  declares no gaps.

**The changed locators, against the texts.**

- Stacks, Definition 90.1, Tag 05CV (algebra text lines 10095–10100): a ring is coherent exactly
  when every finitely generated ideal is finitely presented. This is the definition the paragraph
  gives at line 419.
- Stacks, Lemma 90.5, Tag 05CY (line 10142): a Noetherian ring is coherent. This is what the
  reference entry at line 896 says, and what "in particular … over a Noetherian ring" uses.
- Stacks, Proposition 90.6, Tag 05CZ (lines 10145–10150): for a ring `R`, (1) coherent, (2) every
  product of flat modules flat, (3) `R ^ A` flat for every set `A` are equivalent; attributed to
  Chase, Theorem 2.1. This is the three-way equivalence of lines 417–419 and the Check's "some
  power `R ^ A` … is not flat" (the contrapositive of (3) ⇒ (1)). Its proof of (1) ⇒ (2) (lines
  10151–10159) tests flatness on finitely generated ideals and commutes the tensor product with
  the product by Proposition 89.3, which is Tag 059K, this roadmap's 2.2: the route sentence at
  lines 421–422 is correct (R01 asks only that it be attributed).
- Chase, Theorem 2.1 (`chase1960` lines 139–144): statements (a), (b), (d) are (2), (3), (1) of
  Tag 05CZ, for a possibly noncommutative ring with left and right modules; the README's
  commutative restriction is a special case.
- Stacks, Proposition 89.3, Tag 059K (line 9878), cited by 2.2 (untouched), is the proposition
  the 05CZ proof uses, so the cross-reference "2.2 applied to the finitely generated ideals" is
  consistent with the source.

**The Check's ring example, computed.** In `k[x, y₁, y₂, …]`, `x f` lies in `(x yᵢ)` exactly
when every monomial of `f` is divisible by some `yᵢ`, so in `R` the annihilator of `x` is
`(y₁, y₂, …)`. It is not finitely generated: modulo `(y₁, …, yₙ)` the ring is
`k[x, yₙ₊₁, …] ⁄ (x yᵢ)`, in which `yₙ₊₁ ≠ 0`. The ideal `(x)` is `R ⁄ ann(x)` as a module, and a
cyclic module `R ⁄ I` is finitely presented exactly when `I` is finitely generated (Stacks, Lemma
5.3 (5), the kernel of a surjection from a finite module onto a finitely presented one is finite),
so `(x)` is finitely generated and not finitely presented, `R` is not coherent, and Tag 05CZ gives
a set `A` with `R ^ A` not flat. The negative control that the infinitely many `yᵢ` are used: with
one variable `y`, `k[x, y] ⁄ (x y)` has `ann(x) = (y)`, is Noetherian, hence coherent, and every
`R ^ A` is flat.

**Ownership and overlaps.**

- `roadmaps overlaps` (worker's run) finds no open pull request that changes this roadmap, no
  cited id that is dropped, and no id that only an open revision defines. The change renames no
  heading and no id.
- Coherent rings exist at neither pin: Mathlib `1b1ccf4b` has no coherent-ring class (the only
  hit is `CompactlyCoherentSpace`, a topological notion), and Tau Ceti `2fd255d9` has
  pseudocoherent modules (`Algebra/Module/PseudoCoherent/`) but no coherent ring. So the
  paragraph's "which this roadmap does not define" cannot be answered by a pin citation; R01
  answers it with the roadmap owner.
- A by-object search of main and the open heads for "coherent ring", "05CZ" and "Chase" finds the
  owner of the arbitrary-product theorem (R01) and two roadmaps that cite Chase's Theorem 2.1 for
  the coherence condition alone: RepresentationTheory/ArtinAlgebras §1.3 on main (line 512) and
  HermitianKTheoryOfPoincareCategories (line 919). Neither states the product theorem. The finite
  case, target 2.1, has no second owner: DirectSummandsAndBigCohenMacaulay §5.2 names it as Tau
  Ceti's `Module.Flat.pi`, as 2.1 does.
- The worker's `citations.md` lists no unresolved cross-roadmap citation; its 29 "Lean names
  found nowhere" are this roadmap's own declarations, and the gate's `readme-ids-missing=0`
  confirms that `Suggested.lean` declares each one.

**Sources and the sample.** The seeded sample (1.1, 1.2, 1.3, 1.5, 1.8, 2.3, 2.7, 2.8, 2.10,
3.2, 4.1, 4.2, 5.1, 5.2, 5.5) does not fall in the changed passages; the checks of the previous
reviews at the same text stand. The README flags no locator as unverified. The 2.1 locators were
checked above.

**Signatures and headlines.** `Suggested.lean` is unchanged, so the previous review's `#check @`
pass over all 31 declarations stands, and the worker's `signatures.md` reports none with a lost
section binder. The change touches no headline: all 28 targets are statable at the pins, 25 are
stated in 31 declarations, and 1.7, 2.5, 2.11 and the finite-product form of 2.1 are named in
the module docstring (lines 39–45) as two-line consequences of the pins. There is no stand-in,
no `set_option` and no sorried data.

**Adversarial table.** The first three rows are new and were computed at this head. The rows
marked "r10" are carried from the previous review at `e8702ce`, whose statements this change
leaves untouched (that review carried most of them from r9).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 2.1 Check, the ring `k[x, y₁, y₂, …] ⁄ (x yᵢ)` (changed) | `k = 𝔽₂` and `k = ℚ`; one variable `y` instead of infinitely many | `x · yᵢ = 0`, `x · f ≠ 0` for `f = 1` or `f = x`, so `ann(x) = (y₁, y₂, …)`; modulo `(y₁, …, yₙ)`, `yₙ₊₁ ≠ 0`, so not finitely generated, independent of `k`. One variable: `ann(x) = (y)`, `R` Noetherian, coherent, every `R ^ A` flat, so the Check's conclusion fails there and the infinite family is used | true | none |
| 2.1 "Not a target" equivalence and its special case (changed) | zero ring; `ℤ`; a valuation ring; `R ^ A` for `A` finite | Zero ring: the only ideal is `0`, finitely presented, coherent, every product is `0`, flat. `ℤ`: Noetherian, so coherent (05CY), `Π_A ℤ` flat (05CZ). Valuation ring: coherent without Noetherian (Stacks, Tag 0EWV), so "in particular … Noetherian" is a strict special case as written. `A` finite: `R ^ A` flat over every `R`, so (3) has content only for infinite `A`, consistent with the Check | true; owner unnamed (R01), Chase locator (R02) | R01, R02 |
| References lines 896–897 (changed) | the two tag descriptions against the text | 05CY is Lemma 90.5 "A Noetherian ring is a coherent ring" (line 10142); 05CZ is Proposition 90.6, the three-way equivalence (lines 10145–10150) | true | none |
| r10: contract line `exists_linearMap…` | `ℤ → ℚ`, `a = x = 1`; `ℤ ⁄ 4`, `a = 2`, `x = 1`; `ℤ ⁄ 2 → ℚ ⁄ ℤ`, `x = 1 ⁄ 2`, `1 ⁄ 3` | both sides true; both false (`2 • 1 = 2 ≠ 0`); true; false (`2 ⁄ 3 ≠ 0`) | true | none |
| r10: 2.8 route, converse | `ℚ ⁄ ℤ`, `r = 2`, `x = 1 ⁄ 3`; `ℤ ⁄ 4`, `r = 2`, `x = 1` | `f 1 = 1 ⁄ 6` or `2 ⁄ 3` both work; in `ℤ ⁄ 4`, `s = 2` kills `r`, `2 •` has image `{0, 2}` | true | none |
| r10: 2.8 statements (Lean) | scratch proofs with the file's binders; `ℚ → ℚ ⁄ ℤ` | both close without `sorry`; `n • (q ⁄ n) = q` | true | none |
| r10: 1.7 `(u v)^p = u^p v^p`, odd `p` | p = 3, 5, 2; abelian; Heisenberg mod 3; Q₈ | `C(3,2) = 3`, `C(5,2) = 10`, `C(2,2) = 1`; `d = 1`; corners `6 ≡ 0 ≡ 9`; `(ij)² = −1 ≠ 1` | true | none |
| r10: 2.1 Chase Check (previous form) | `R = k[x, y₁, y₂, …] ⁄ (x yᵢ)` | `ann(x) = (y₁, y₂, …)` not f.g.; some `R ^ A` not flat | true | superseded by row 1 |
| r10: 2.3 | ℤ; `k[x₁, x₂, …]`, `I = (xᵢ)` | both true; `R ⧸ I ≅ k` f.g. not f.p.: both false | true | none |
| r10: 5.2 against `pairMinor_mul` | rows `(1,2,3)`, `(0,1,4)`, columns `(2,0,1)`, `(1,1,1)`; empty; one index | `25 − 24 = 1`, ordered sum `2`; `0 = 0`; `0 = 0` | true, factor `2` | none |
| r10: Scope `hasseDeriv k (f^q) = 0` | 𝔽₃, `X + 1`; 𝔽₄, `X`; 𝔽₂(t), `tX` | `3X² = 3X = 0`; `C(4,k) ≡ 0`; `(tX)² ≠ expand 2 (tX)` | true | none |
| r10: 1.1 | n = 0; e = 0; (2,1,6); (2,2,6); p = 4 | `C(0,k) = 0`; `1 ∣ n`; `6` even; `15` odd; `4 ∤ 6` | true | none |
| r10: 1.2 | a = 0; (3,1); (2,2); k = p^a | `1`; `1,2,1 ≡ 1,−1,1`; `1,3,3,1` odd; `C(2,3) = 0` | true | none |
| r10: 1.3 | ZMod 3, X³, X⁴; k = p^e | `3X² = 0`; `4X³ = X³ ≠ 0`; `hasseDeriv 3 X³ = 1` | true | none |
| r10: 1.4 | ZMod 2, f = g = X, k = 1, 2 | `X² = X²·1`; `1` vs `0` | true | none |
| r10: 1.5 | ℤ, a = 1, q = X + 1; a = 0; zero ring | `q(1) = 2`, `ℤ⁄2`; `(X+1) − X = 1`; both true | true | none |
| r10: 1.6 | n = 0, 2, 3 | `1`; `1`; `1`; `[[2,3],[3,6]]` gives `3` | true | none |
| r10: 1.8 | ⊥; (𝔄₅×𝔄₅)⋊C₂; ⟨(12)⟩ ≤ 𝔖₃ | order 3600 perfect; `⁅𝔖₃,𝔖₃⁆ = 𝔄₃` | true | none |
| r10: 2.1 `prod_iff` | ℤ × ℤ⁄2; ι = ∅ | `ℤ⁄2 ⊗ (2·) = 0`; `Π_∅ = 0` flat | true | none |
| r10: 2.2 | M = R; M = ℚ, `ℤ⁄2ⁿ` | identity; `Π (ℚ ⊗ ℤ⁄2ⁿ) = 0`, `ℚ ⊗ Π ≠ 0` | true | none |
| r10: 2.4 | ℤ, `2•`, ℤ² | `(2,4)` in, `(2,3)` out | true | none |
| r10: 2.5 | ℤ⁄4, (2); ℤ, (p) | `I² = 0`; `ℤ_p` uncountable | true | none |
| r10: 2.6 | k → k[t] → k; T = S; k[t]⁄(t²) | `k dt → 0`; isomorphism; `H¹ = (t²)⁄(t⁴)` | true | none |
| r10: 2.7 | ℤ ⊆ ℚ, x = 1, 2; ℤ², (1,2) | `1⁄2 ∉ ℤ`; `x = 2·1` excluded; `(3⁄2, 3) ∉ ℤ²` | true | none |
| r10: 2.8 Checks | ℚ⁄ℤ; ℤ; ℤ⁄4 | `2·` misses 1 in ℤ; `(2) → ℤ⁄2`, `2 ↦ 1` no extension | true | none |
| r10: 2.9 | ℤ, (2), a = 3; p = (4); ℤ[i], (5) | `3` acts as 1; `2·2 = 0`; `(2 ± i)` over `(5)` | true | none |
| r10: 2.10 | ℚ⁄ℤ, t = 6; t = 0; k[x,y], t = x | `ℤ⁄6`; `ℚ⁄ℤ ≇ ℤ`; `Ext²(k, A) = k` | true | none |
| r10: 2.11 | ℤ⁄12; ℤ; ℚ⁄ℤ; k[x,y]⁄(x) | length 3; infinite chains otherwise | true | none |
| r10: 3.1 | n = 0, −1, −2 on ℚ[x, x⁻¹] | `D1 = 0`; `−x⁻²`; `−2x⁻³` | true | none |
| r10: 3.2 | k[x], a = x; u = x | identity; `−x⁻¹ = (D − x⁻¹Dx)1` | true | none |
| r10: 4.1 | ℚ × [0,1]; f = x − y | not locally compact; `curry f 1 0 = 1` | true | none |
| r10: 4.2 | Spec ℤ, {(0)}; Sierpiński | no W at (0); `{1}` open, `{0}` not stable | true | none |
| r10: 5.1 | finite group; {1, a, b}; (ℤ⁄n, ·) | no right zero; `aM ∩ bM = ∅`; `0` right zero | true | none |
| r10: 5.3 | `[[1,0],[0,0]]`, `[[0,0],[1,1]]`; (2),(0); 𝔽₂ | `(P−Q)² = 1`, trace `0`; `8 ≠ 2`; `1 = 1 − 0` | true | none |
| r10: 5.4 | (ℕ, ·); Multiplicative ℕ; {1, e} | `0·2 = 0·3`; `1 = 3 − 2`; `e·e = e·1` | true | none |
| r10: 5.5 | k[X]; `kᵖ` vs 0 over 𝔽̄_p; L × L over 𝔽_p(t) | `tr X = λ`; `p·a = 0`; `Tr_{L⁄k} = 0` | true | none |
| r10: Conventions | 1.3, 1.4, 1.6, 1.7, 2.9, 4.1, 5.2 | `3X² = 0`; `hasseDeriv 2 X² = 1`; `[[1,1],[1,2]]`; corner `−1`; `√(4) = (2)`; `curry f 1 0 = 1`; `2 = 2` | consistent | none |

**Checks of the changed passages.** 2.1's three Checks (lines 408–415) agree with its statement
and with the "Not a target" paragraph: the first two are instances of `Module.Flat.prod_iff` and
the finite-product form, the third is the instance on which the arbitrary-product theorem's
coherence hypothesis fails (row 1). The Layer 2 Examples and Dependencies are untouched and still
consistent with 2.1.

**Remarks on untouched text** (no change requested; the previous review passed it):

- 2.8's *Needs* line still lists Mathlib `Module.Baer.of_injective`, which the stated route does
  not use.
- The pull request description still says "Three statements that follow from the pins in two
  lines"; the docstring names four. The description is not a roadmap file.

## Not verifiable

- Avron–Seiler–Simon 1994, Theorem 4.1 (`ass1994`): settled as uncertified (paywalled). The matrix
  identity of 5.3 was recomputed in earlier reviews; the target is untouched.
- Lang, *Algebra*, XVII Corollary 3.8 (the closest source for 5.5): Springer, with no legal open
  copy; untouched.
- Lucas 1878 (1.1, 1.2): the cached `lucas1878` is a JSTOR challenge page, not the paper; Lucas's
  theorem was checked against Mathlib's `Choose.choose_modEq_prod_range_choose` in an earlier
  review; both targets are untouched.

## Source issues

- none
