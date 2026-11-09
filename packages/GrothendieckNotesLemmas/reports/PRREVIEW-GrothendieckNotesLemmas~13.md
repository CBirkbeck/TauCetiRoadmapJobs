# Review of GrothendieckNotesLemmas (pull request #1431 at 17362a4)

**Verdict:** accepted

This is an incremental re-review of the 10 lines that changed since `ea4f7b2`, all in
`TauCetiRoadmap/GrothendieckNotesLemmas/README.md`: a new bullet in Scope, "Left to other
roadmaps" (lines 71–72), and the rewritten closing paragraph of 2.1 (lines 419–424). They are
exactly the repairs the previous review asked for in R01 and R02, applied with the wording it
proposed. `Suggested.lean` and `metadata.toml` are byte-identical to `ea4f7b2`; the pins are
unchanged; nothing changed outside the folder against `origin/main`. No finding remains, new or
carried.

## Previous findings

- R01 — repaired: Scope lines 71–72 now read "*Products of flat modules over a Noetherian ring,
  more generally a coherent ring, for an arbitrary index set*: DirectSummandsAndBigCohenMacaulay,
  §5.2. Target 2.1 is the finite case." and 2.1 lines 422–424 end "The theorem for arbitrary index
  sets is DirectSummandsAndBigCohenMacaulay, §5.2, listed under Scope; its route is 2.2 applied to
  the finitely generated ideals." The owner, its section and the finite-case remark resolve at the
  owner's head (below); the citation is downward; the proof route is no longer stated as this
  roadmap's own.
- R02 — repaired: line 421 reads "(Chase 1960, Theorem 2.1; Stacks, Tag 05CZ)". `chase1960` line
  139 is "Theorem 2.1", with (a) products of flat modules flat, (b) products of copies of `R`
  flat, (d) finitely generated left ideals finitely related, the equivalence the sentence cites.

## Verified sound

**Gate and build.**

- The worker's gate at this head passes with every check at `0`, `build=0` included. My rerun of
  the text scanners and the dependency check (`--base origin/main`) reports every check at `0`
  and ends `OK`.
- `lake env lean` on `TauCetiRoadmap/GrothendieckNotesLemmas/Suggested.lean` exits with code 0;
  its output is 31 "declaration uses `sorry`" warnings and nothing else, as at `ea4f7b2`.
- `git diff --stat origin/main...HEAD` restricted to paths outside the folder is empty; the long
  list in the change summary is the merge of `main` into the branch. The folder holds only
  `README.md`, `Suggested.lean` and `metadata.toml`.
- Dependency check (`--movable`, candidate merge order): `depcheck: 238 roadmaps, 2310 edges, 0
  problem(s)`. No UPWARD, CYCLE or `moved:` line. The new citation is the roadmap's only
  cross-roadmap reference to a roadmap still in a pull request; it is a Scope deferral, not a
  `*Needs:*` edge, and the roadmap declares no gaps.

**The new citation, resolved at the owner's head.** DirectSummandsAndBigCohenMacaulay is not on
main; at the head of its pull request (`17190d1`), `TauCetiRoadmap/DirectSummandsAndBigCohenMacaulay/README.md`
line 992 is the heading "### 5.2 Products of flat modules over a Noetherian ring are flat"; line
994 states it for a Noetherian ring, "more generally a coherent ring", and any family of flat
modules; line 996 cites Chase, Theorem 2.1, p. 460; line 1004 is the Check "For I finite this is
Tau Ceti's `Module.Flat.pi`"; line 1005 says the Noetherian hypothesis is used exactly in the
finite presentation of ideals, which is the route the 2.1 paragraph attributes to it. The
candidate merge order lists DirectSummandsAndBigCohenMacaulay at line 216 and this roadmap at
line 399, so the citation is downward. The new Scope bullet sits in the "Left to other roadmaps"
list (which begins at line 38), between the Cauchy–Binet and the integer-valued-polynomial
bullets, which is where the house shape puts deferrals.

**The locators of the changed lines, against the texts.**

- Chase, Theorem 2.1: `chase1960` lines 139–144, as under R02.
- Stacks, Tag 05CZ, Proposition 90.6 (cached algebra text lines 10145–10150): (1) coherent, (2)
  every product of flat modules flat, (3) `R ^ A` flat for every set `A`, attributed at lines
  10145–10146 to Chase, Theorem 2.1. Its proof (lines 10151–10159) tests flatness on finitely
  generated ideals and commutes the tensor product with the product by Proposition 89.3, Tag 059K
  (line 9878), which is this roadmap's 2.2: "its route is 2.2 applied to the finitely generated
  ideals" is what the source does.
- Stacks, Tag 05CY, Lemma 90.5 (line 10142): a Noetherian ring is coherent, which is what "in
  particular … over a Noetherian ring" uses.
- Stacks, Tag 05CV, Definition 90.1 (line 10095): coherence as every finitely generated ideal
  finitely presented, the gloss at lines 420–421.

**Ownership and overlaps.** `roadmaps overlaps` (the worker's run against the index of
2026-11-09) finds no open pull request that changes this roadmap, no cited id that an open pull
request drops and no id that only an open revision defines; the closest roadmaps in vocabulary
(ArithmeticInterpolationDeterminants, SemisimpleAlgebras) share no object with the changed
passage. A by-object search of main and the 461 open heads for "Tag 05CZ" and "Chase" finds the
owner named above and two roadmaps that cite Chase for the coherence condition alone
(HermitianKTheoryOfPoincareCategories line 919, and RepresentationTheory/ArtinAlgebras on main as
found by the previous review); neither states the product theorem. The finite case, target 2.1,
has one owner: this roadmap, with its direction from the factors Tau Ceti's `Module.Flat.pi`, as
the owner's own Check says. The worker's `citations.md` lists no unresolved cross-roadmap citation;
its 29 "Lean names found nowhere" are this roadmap's own declarations, which the gate's
`readme-ids-missing=0` confirms `Suggested.lean` declares.

**Sources and the sample.** The seeded sample (1.1, 1.2, 1.4, 1.5, 1.7, 2.3, 2.5, 2.8, 2.9, 2.10,
2.11, 3.1, 3.2, 4.1, 5.5) does not fall in the changed passages; the previous reviews checked each
at the same text and those checks stand. The README flags no locator as unverified.

**Signatures and headlines.** `Suggested.lean` is unchanged, so the previous `#check @` pass over
all 31 declarations stands; the worker's `signatures.md` reports none with a lost section binder.
The change touches no headline: all 28 targets are statable at the pins, 25 are stated, and 1.7,
2.5, 2.11 and the finite-product form of 2.1 are named in the module docstring as two-line
consequences of the pins. No stand-in, no `set_option`, no sorried data.

**Adversarial table.** The first two rows were recomputed at this head for the changed passages.
The rows marked "r11" are carried from the previous review at `ea4f7b2` (itself carrying most of
them from r10), whose statements this change leaves untouched.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Scope bullet lines 71–72 (changed): the arbitrary-index theorem is DSBCM §5.2 and 2.1 is its finite case | `ι` finite over a commutative semiring (2.1); `ι = ℕ` over `ℤ`; `ι = ℕ` over `k[x, y₁, y₂, …] ⁄ (x yᵢ)` | 2.1: `Π_ι M i` flat iff each `M i` flat, by `directSum_iff` along `linearEquivFunOnFintype`; `Π_ℕ ℤ` flat since `ℤ` Noetherian (05CY ⇒ 05CZ (1)⇒(2)), which §5.2 states and 2.1 does not; the non-coherent ring: some `R ^ A` not flat (05CZ (3)⇒(1) contrapositive), so the bullet's "more generally a coherent ring" is the exact hypothesis of §5.2 line 994 | true, one owner, downward | none |
| 2.1 closing paragraph lines 419–424 (changed) | zero ring; `ℤ`; a valuation ring; `A` finite | zero ring: coherent, every product `0`, flat; `ℤ`: coherent, `Π_A ℤ` flat; valuation ring: coherent and not Noetherian, so "in particular … Noetherian" is a strict special case; `A` finite: `R ^ A` flat over every `R`, so (3) has content only for infinite `A`, consistent with 2.1's third Check. Route: 05CZ's proof uses Tag 059K = 2.2 on finitely generated ideals, as the sentence says | true | none |
| r11: 2.1 Check, the ring `k[x, y₁, y₂, …] ⁄ (x yᵢ)` | `k = 𝔽₂`, `ℚ`; one variable `y` | `ann(x) = (y₁, y₂, …)` not f.g.; one variable: Noetherian, every `R ^ A` flat | true | none |
| r11: References lines 897–899 | the tag descriptions | 05CY = Lemma 90.5 (line 10142); 05CZ = Proposition 90.6 (lines 10145–10150) | true | none |
| r11: contract line `exists_linearMap…` | `ℤ → ℚ`, `a = x = 1`; `ℤ ⁄ 4`, `a = 2`, `x = 1`; `ℤ ⁄ 2 → ℚ ⁄ ℤ`, `x = 1 ⁄ 2`, `1 ⁄ 3` | both sides true; both false (`2 • 1 = 2 ≠ 0`); true; false (`2 ⁄ 3 ≠ 0`) | true | none |
| r11: 2.8 route, converse | `ℚ ⁄ ℤ`, `r = 2`, `x = 1 ⁄ 3`; `ℤ ⁄ 4`, `r = 2`, `x = 1` | `f 1 = 1 ⁄ 6` or `2 ⁄ 3` both work; in `ℤ ⁄ 4`, `s = 2` kills `r`, `2 •` has image `{0, 2}` | true | none |
| r11: 2.8 statements (Lean) | scratch proofs with the file's binders; `ℚ → ℚ ⁄ ℤ` | both close without `sorry`; `n • (q ⁄ n) = q` | true | none |
| r11: 1.7 `(u v)^p = u^p v^p`, odd `p` | p = 3, 5, 2; abelian; Heisenberg mod 3; Q₈ | `C(3,2) = 3`, `C(5,2) = 10`, `C(2,2) = 1`; `d = 1`; corners `6 ≡ 0 ≡ 9`; `(ij)² = −1 ≠ 1` | true | none |
| r11: 2.3 | ℤ; `k[x₁, x₂, …]`, `I = (xᵢ)` | both true; `R ⧸ I ≅ k` f.g. not f.p.: both false | true | none |
| r11: 5.2 against `pairMinor_mul` | rows `(1,2,3)`, `(0,1,4)`, columns `(2,0,1)`, `(1,1,1)`; empty; one index | `25 − 24 = 1`, ordered sum `2`; `0 = 0`; `0 = 0` | true, factor `2` | none |
| r11: Scope `hasseDeriv k (f^q) = 0` | 𝔽₃, `X + 1`; 𝔽₄, `X`; 𝔽₂(t), `tX` | `3X² = 3X = 0`; `C(4,k) ≡ 0`; `(tX)² ≠ expand 2 (tX)` | true | none |
| r11: 1.1 | n = 0; e = 0; (2,1,6); (2,2,6); p = 4 | `C(0,k) = 0`; `1 ∣ n`; `6` even; `15` odd; `4 ∤ 6` | true | none |
| r11: 1.2 | a = 0; (3,1); (2,2); k = p^a | `1`; `1,2,1 ≡ 1,−1,1`; `1,3,3,1` odd; `C(2,3) = 0` | true | none |
| r11: 1.3 | ZMod 3, X³, X⁴; k = p^e | `3X² = 0`; `4X³ = X³ ≠ 0`; `hasseDeriv 3 X³ = 1` | true | none |
| r11: 1.4 | ZMod 2, f = g = X, k = 1, 2 | `X² = X²·1`; `1` vs `0` | true | none |
| r11: 1.5 | ℤ, a = 1, q = X + 1; a = 0; zero ring | `q(1) = 2`, `ℤ⁄2`; `(X+1) − X = 1`; both true | true | none |
| r11: 1.6 | n = 0, 2, 3 | `1`; `1`; `1`; `[[2,3],[3,6]]` gives `3` | true | none |
| r11: 1.8 | ⊥; (𝔄₅×𝔄₅)⋊C₂; ⟨(12)⟩ ≤ 𝔖₃ | order 3600 perfect; `⁅𝔖₃,𝔖₃⁆ = 𝔄₃` | true | none |
| r11: 2.1 `prod_iff` | ℤ × ℤ⁄2; ι = ∅ | `ℤ⁄2 ⊗ (2·) = 0`; `Π_∅ = 0` flat | true | none |
| r11: 2.2 | M = R; M = ℚ, `ℤ⁄2ⁿ` | identity; `Π (ℚ ⊗ ℤ⁄2ⁿ) = 0`, `ℚ ⊗ Π ≠ 0` | true | none |
| r11: 2.4 | ℤ, `2•`, ℤ² | `(2,4)` in, `(2,3)` out | true | none |
| r11: 2.5 | ℤ⁄4, (2); ℤ, (p) | `I² = 0`; `ℤ_p` uncountable | true | none |
| r11: 2.6 | k → k[t] → k; T = S; k[t]⁄(t²) | `k dt → 0`; isomorphism; `H¹ = (t²)⁄(t⁴)` | true | none |
| r11: 2.7 | ℤ ⊆ ℚ, x = 1, 2; ℤ², (1,2) | `1⁄2 ∉ ℤ`; `x = 2·1` excluded; `(3⁄2, 3) ∉ ℤ²` | true | none |
| r11: 2.8 Checks | ℚ⁄ℤ; ℤ; ℤ⁄4 | `2·` misses 1 in ℤ; `(2) → ℤ⁄2`, `2 ↦ 1` no extension | true | none |
| r11: 2.9 | ℤ, (2), a = 3; p = (4); ℤ[i], (5) | `3` acts as 1; `2·2 = 0`; `(2 ± i)` over `(5)` | true | none |
| r11: 2.10 | ℚ⁄ℤ, t = 6; t = 0; k[x,y], t = x | `ℤ⁄6`; `ℚ⁄ℤ ≇ ℤ`; `Ext²(k, A) = k` | true | none |
| r11: 2.11 | ℤ⁄12; ℤ; ℚ⁄ℤ; k[x,y]⁄(x) | length 3; infinite chains otherwise | true | none |
| r11: 3.1 | n = 0, −1, −2 on ℚ[x, x⁻¹] | `D1 = 0`; `−x⁻²`; `−2x⁻³` | true | none |
| r11: 3.2 | k[x], a = x; u = x | identity; `−x⁻¹ = (D − x⁻¹Dx)1` | true | none |
| r11: 4.1 | ℚ × [0,1]; f = x − y | not locally compact; `curry f 1 0 = 1` | true | none |
| r11: 4.2 | Spec ℤ, {(0)}; Sierpiński | no W at (0); `{1}` open, `{0}` not stable | true | none |
| r11: 5.1 | finite group; {1, a, b}; (ℤ⁄n, ·) | no right zero; `aM ∩ bM = ∅`; `0` right zero | true | none |
| r11: 5.3 | `[[1,0],[0,0]]`, `[[0,0],[1,1]]`; (2),(0); 𝔽₂ | `(P−Q)² = 1`, trace `0`; `8 ≠ 2`; `1 = 1 − 0` | true | none |
| r11: 5.4 | (ℕ, ·); Multiplicative ℕ; {1, e} | `0·2 = 0·3`; `1 = 3 − 2`; `e·e = e·1` | true | none |
| r11: 5.5 | k[X]; `kᵖ` vs 0 over 𝔽̄_p; L × L over 𝔽_p(t) | `tr X = λ`; `p·a = 0`; `Tr_{L⁄k} = 0` | true | none |
| r11: Conventions | 1.3, 1.4, 1.6, 1.7, 2.9, 4.1, 5.2 | `3X² = 0`; `hasseDeriv 2 X² = 1`; `[[1,1],[1,2]]`; corner `−1`; `√(4) = (2)`; `curry f 1 0 = 1`; `2 = 2` | consistent | none |

**Checks of the changed passages.** 2.1's three Checks (lines 410–417) are untouched and still
agree with its statement and with the rewritten paragraph: the third Check's ring is the instance
on which the owner's coherence hypothesis fails, and the paragraph now says where that hypothesis
is a target. The Layer 2 Examples and Dependencies are unchanged and consistent with 2.1.

**Remarks on untouched text** (no change requested; earlier reviews passed it):

- 2.8's *Needs* line still lists Mathlib `Module.Baer.of_injective`, which the stated route does
  not use.
- The pull request description says "Three statements that follow from the pins in two lines";
  the docstring names four. The description is not a roadmap file.

## Not verifiable

- Avron–Seiler–Simon 1994, Theorem 4.1 (`ass1994`): settled as uncertified (paywalled); the
  matrix identity of 5.3 was recomputed in earlier reviews; the target is untouched.
- Lang, *Algebra*, XVII Corollary 3.8 (the closest source for 5.5): Springer, no legal open copy;
  untouched.
- Lucas 1878 (1.1, 1.2): the cached `lucas1878` is a JSTOR challenge page, not the paper; Lucas's
  theorem was checked against Mathlib's `Choose.choose_modEq_prod_range_choose` in an earlier
  review; both targets are untouched.

## Source issues

- none
