# FIX-DESIGN-DynamicalDegreesOfRationalMaps~10: repair report

This round settles `REV-DESIGN-DynamicalDegreesOfRationalMaps~9`. The review has three findings, all P3. I checked each one against the cached source texts and against the suppliers at their current heads, and all three are right. F02 and F03 are applied as asked. F01 is applied with a more precise statement of where each Truong locator applies, because the setting the review suggested is wider than the source's.

## F01 (P3) — applied differently

Old → new: in §4.4, "truong2020 Theorem 1.1 (1), lines 143–158" becomes "truong2020 Lemma 4.5, lines 999–1003" with its setting, plus "the proof of Theorem 5.3, lines 1104–1106". The Theorem 1.1 (1) locator moves to §5.1. `plan.json` targets 4.4 and 5.1 change to match. In `sources.toml`, `truong2020` gains "Lemma 4.5; Theorem 5.3" and "§5.1". The References line for `truong2020` changes to match.

Verification, in `truong2020`:
- Lines 150–158 (item 1) of Theorem 1.1, whose header is lines 143–149): for smooth `X`, a regular `π` and a hyperplane class, a limit of `n`-th roots of degrees exists and does not depend on the choices. There is no inequality, so the item supports §5.1 (existence of `λ_k`) and not §4.4.
- Lines 999–1003 (Lemma 4.5): for dominant correspondences between irreducible projective manifolds, `(f ∘ g)^*(ω_X^p) ≤ C·deg(f^*(ω_X^p))·g^*(ω_Y^p)` in `A^p(Z)`, with `C` independent of `f` and `g`. Intersecting with a complete-intersection class gives an inequality of the shape §4.4 states.
- Lines 1104–1106 (proof of Theorem 5.3): `deg′_p(f^{n+m}) ≤ C·deg′_p(f^n)·deg′_p(f^m)`, for the iterates of one correspondence.

Why the review's text was changed: it said both items hold "for correspondences of smooth projective varieties over an algebraically closed field". Two parts of that are inaccurate:
- Lemma 4.5 sits in §4 of the paper, which opens (lines 761–763) by assuming an algebraically closed field of characteristic zero.
- The Theorem 5.3 inequality is for iterates of one correspondence, not for a composite of two different ones. It lies in §5.1, where `X` is smooth (line 1032), over the paper's field of any characteristic (lines 9, 143–144).

The README now says each of these. Neither source item states the explicit constant `(d − k + 1)^k/(L_2^d)`, so the locator says "with an unspecified constant".

Pattern search: I checked every other `truong2020` citation against the text.
- Scope's Theorem 1.1(5) (lines 176–181, the spectral description) and Theorem 1.1(4) (lines 169–175, the product formula): correct.
- Scope, lines 77–89 and 143–145: correct.
- §1.4 and §4.3, §6.3 at lines 1529–1533: correct.
- §5.3, Theorem 1.1 (2) at lines 159–164 (birational invariance): correct.
- §6.3, §6.4 at lines 1542–1544 (the Cremona map): correct.

`plan.json` target 4.4 also lacked the README's `silverman2014 (3), line 387`. I added it, since that locator field was being rewritten anyway.

## F02 (P3) — applied

Old → new:
- In the §3.1 field-extension item, "For every projective `K`-scheme `X`" becomes "For every proper `K`-scheme `X`".
- In Scope, "§3.1 proves, for projective `X`" becomes "for proper `X`".
- In `plan.json` target 3.1:
  - the hypothesis "X projective (for the field-extension item) or proper over K" becomes "X proper over K";
  - the statement and the `isNef_baseChange_iff` API entry change "for every projective K-scheme" to "for every proper K-scheme".

Verification: each step needs only properness.
- **Forward direction.** AlgebraicModuliForArithmeticGeometryPartII §1.5, read at its open head, sets up `f : X → S` proper over a Noetherian `S`. It says that "Nefness is preserved by base change T → S of Noetherian schemes".
- **Field-extension compatibility.** CyclotomicClassGroupsAndStickelberger §4.3, read at its open head, defines the numerical intersection "for a proper k-scheme X" and lists field-extension compatibility among its properties.
- **Component formula.** §2.1 assumes only that `X` is proper over `K`.
- **Definition of nefness.** The definition of nef in §3.1 is already for proper `K`-schemes.

The consumers are unaffected. The reduction item of §3.1 applies the result to the projective `Ṽ` over `K'`, and §§4.3 and 5.3 apply it to projective varieties; a weaker hypothesis keeps all of them. The Scope phrase "approximation of nef real classes on a projective scheme" refers to the ample-approximation item. That item assumes an ample `H` on a proper scheme, which makes the scheme projective, so it is correct and unchanged.

## F03 (P3) — applied

Old → new:
- §2.3, after "using additivity (CyclotomicClassGroupsAndStickelberger §4.3", now reads "; stacks-varieties Lemma 45.5, tag 0BER, line 4778; dangfavre2021 §1.3, lines 436–443, for real classes as polarizations)".
- §3.1, after the sentence defining nef real classes, now reads "(cutkosky2015 §2.2, lines 274–287, for nef and ample real classes on a complete variety over an arbitrary field)".
- `sources.toml` already lists §2.3 under `stacks-varieties` and `dangfavre2021`, and §3.1 under `cutkosky2015`, so it does not change.

Verification:
- `stacks-varieties` line 4778 is Lemma 45.5 (tag 0BER), which gives additivity in each slot.
- `dangfavre2021` lines 436–443 define `deg_{k,ω}` for a big and nef class `ω ∈ N¹(X)`.
- `cutkosky2015` lines 274–287 define effective, ample and nef ℝ-divisors on a complete variety over any field, with the nef and ample cones.

I added the words "on a complete variety" because Cutkosky's §2.2 works in that setting (line 274).

Pattern search: I compared, for every `### k.n` subsection, the source ids in the README with those in the `plan.json` locator, using a script over both files. Before the edits, only §2.3 and §3.1 had no source id. Afterwards, no subsection lacks one, and no `plan.json` source is missing from its README subsection.

## Adversarial pass on the changed text

| Statement | Instances tried | Values on each side | Result; change |
| --- | --- | --- | --- |
| §3.1 field extension, now for proper `X` | `ℙ¹_ℂ` over `ℝ`, `K' = ℂ`, `L = O(1)` and `O(−1)` | `X_ℂ = ℙ¹_ℂ ⊔ ℙ¹_ℂ`; `(O(1)·X) = 2 = 1 + 1`, nef on both sides; `(O(−1)·X) = −2 = −1 − 1`, nef on neither | holds; none |
| same | inseparable extension: `C = V(x² + ty²) ⊆ ℙ²` over `K = 𝔽_2(t)`, `K' = K(√t)`, `L = O(1)` | `C_{K'}` is the double line, `m = 2`; `(O(1)·C) = 2` (from `χ_K(O_C(n)) = 2n + 1`) `= 2·(O(1)·ℓ) = 2·1` | holds; the multiplicity of §2.1 is needed |
| same | `X` proper and not projective, e.g. a complete non-projective threefold over `ℂ`, with `K' = ℂ(t)` | forward: §1.5 needs only proper over Noetherian bases. Converse: an integral curve `C` stays integral over `K'` (`ℂ` is algebraically closed), `m = 1`, and `(L·C) = (L_{K'}·C_{K'})` | holds; none |
| same | `dim X = 0` (`X = Spec L`, `L/K` finite); `K' = K` | no integral curves on `X` or `X_{K'}`: every `L` is nef on both sides; `K' = K` gives the identity | holds (vacuous); none |
| §4.4 locator (statement unchanged) | `z ↦ z²` twice on `ℙ¹`, `d = k = 1`; Truong's shape with `C = 1` | `deg_1(f∘f) = 4`; `C·2·2 = 4`; the README constant is `(1/1)·2·2 = 4` | consistent; none |
| §5.1 locator (statement unchanged) | `z ↦ z²` on `ℙ¹` (smooth, hyperplane class); Cremona on `ℙ²` | `(2^n)^{1/n} = 2`; `2, 1, 2, 1, …`, limit `1` | consistent with Theorem 1.1 (1) and the §5.1 Checks; none |
| §2.3 additivity locator | `(O(1,0) + O(0,1))²` on `ℙ¹ × ℙ¹` | additivity: `0 + 2·1 + 0 = 2`; direct: the `n_1n_2` coefficient of `(n_1 + n_2 + 1)²` is `2` | holds; none |
| §2.3 polarization locator | `ω = O(1,0) + O(0,1)`, nef with `(ω²) = 2 > 0` | big and nef in the sense of `dangfavre2021` line 436; real polarization here | agrees; none |
| §3.1 nef-class locator | the class `A` on `E × E` (§3.1 Checks) | degrees `2, 1, 3 + 2√2 ≥ 0` on `F_1, F_2, Δ`: nef in Cutkosky's sense (line 282) and in §2.3's | agrees; none |

None of the changed lines touches a Check or a worked example. The objects in them (the field-extension item, and the locators of §§2.3, 3.1, 4.4, 5.1) were recomputed above against the existing Checks of §§2.3, 3.1, 4.4 and 5.1, and none of those Checks changes.

## Checks

- **Dependency check** (full output):

  ```text
  candidate: DynamicalDegreesOfRationalMaps is not in the merge order yet; checked as if placed after ArakelovGeometryAndAbelianHeightsPartII (the intake inserts it when its design is accepted)
  depcheck: 245 roadmaps, 2239 edges, 0 problem(s)
  ```

  There is no UPWARD or CYCLE line. This round adds no cross-roadmap citation and no supplier.
- **Citation resolver** (`roadmaps resolve` on the README): no cross-roadmap citation or Lean name is found nowhere.
- **House style:** a search of the README for LaTeX delimiters, process words and machine paths found nothing.
- **Validity of the edited files:** `plan.json` parses as JSON and keeps its one-space indentation; `sources.toml` parses as TOML.
- **Lean:** the design stage has no `Suggested.lean`. No Lean command was run, and no `#check` comparison applies.
- **Ownership:** this round adds no new construction or target, so ownership is unchanged. The earlier searches of main and the open heads stand.
- **Missing sources:** none. Every locator used is in the cached texts of `truong2020`, `stacks-varieties`, `dangfavre2021` and `cutkosky2015`. No `needs-references.toml` was written.

## Notes for the maintainer

- No name that another roadmap cites has changed, and no section ids have moved.
- Possible source issue in `truong2020`: lines 761–763 restrict all of §4 (including Lemma 4.5) to an algebraically closed field of characteristic zero. The paper claims arbitrary characteristic (lines 7, 9), and §5 reuses §4's arguments (line 1123). The README reports the hypothesis as the source states it.
