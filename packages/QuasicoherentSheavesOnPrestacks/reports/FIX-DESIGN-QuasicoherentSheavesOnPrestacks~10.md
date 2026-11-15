# FIX-DESIGN-QuasicoherentSheavesOnPrestacks~10

Repair of the round-10 review of the QuasicoherentSheavesOnPrestacks design (two findings, both P3). Files changed: `packages/QuasicoherentSheavesOnPrestacks/design/README.md`, `packages/QuasicoherentSheavesOnPrestacks/design/plan.json` and `packages/QuasicoherentSheavesOnPrestacks/sources.toml` (two Stacks tags added to the existing `Stacks` entry; no new key). The design has no `Suggested.lean`, so no Lean file was changed or elaborated.

## F01 (P3) — applied differently

Old → new: Conventions (Universes) gains "Unqualified 'small' means u-small and 'large' means not u-small; '(u+1)-small' is always written out", a witness, and a list of where supplier statements are used in the universe u+1. "small" → "(u+1)-small" in 2.1, 2.3, 2.4, 3.1 (two places), 3.3(b), Conventions, the 2.3 proof route, and 1.2 and 3.1 supplier uses. Plan mirrored.

Verified. The finding is right. `Mod_ℤ` has u-small colimits only: a coproduct C of K copies of ℤ, for K in the universe u+1 and not u-small, would have `π₀ Map(C, ℚ/ℤ) = ∏_K ℚ/ℤ`, which is not u-small. But `D∞(ℤ)` is locally u-small. Meanwhile 2.4's route takes a `Pts(X)^op`-indexed colimit, which is (u+1)-small and not u-small for `X = ⨿_K Spec ℤ`. So "small" was used in two senses.

How the repair differs, and why. The suggested convention ("unqualified 'small' means u-small inside `Mod_A` and `QCoh(X)`, and (u+1)-small for prestacks, sheaves and `Ĉat∞`") keeps two meanings for one word, decided by context. That is the defect the finding names. The repair gives the word one meaning (u-small), writes "(u+1)-small" wherever that is meant, and adds the five places the review lists. It also fixes the same pattern at six more places:

- Conventions: "every small colimit of corepresentable functors is a prestack" → "(u+1)-small".
- 2.3 proof route: "closed under limits in `Ĉat∞`" → "closed under (u+1)-small limits".
- 3.1: "the ∞-category of test rings is small" (in the universe u+1) → "(u+1)-small".
- 1.2 proof route: "`derivedFamily` over the small ∞-categories obtained after fixing a universe" → "applied in the universe u+1 over the (u+1)-small `CAlg^cn`".
- Supplier contracts, EnhancedDerivedSheaves E0.3–E0.8: straightening "applied in the universe u+1 over the (u+1)-small T".
- PresentableInfinityCategories §4.4.2: the localization is used "in the universe u+1".

Every other unqualified "small" was checked and means u-small. These are: 1.1 (θ), 1.2–1.3 (`Mod_A`), 2.3 inside `QCoh(X)`, 4.2, 5.4, 6.1, 8.2–8.3, the `Ind` and t-structure supplier lines, and "presentability for small colimits of affines" in the Scope and Layer 2 introductions, which matches 2.3's "u-small colimit of affines". In the plan, every "small" is now qualified: 1.1, 2.1, 2.3 (statement and two API entries), 2.4 (statement and API), 3.1 (statement and API), 3.3, 4.2, 6.2, 8.2 (two places) and the §4.4.2 supplier entry.

## F02 (P3) — applied

Old → new: 6.2(b) "the same holds when the diagonal is quasi-affine" → the same holds for a hypercomplete fpqc sheaf whose diagonal base changes are quasi-affine schemes `h_Z` and which has a flat fpqc surjection `p : Spec A → X`. A doubled-plane Check is added, 2.5 joins *Needs*, and the plan is mirrored.

Verified. The finding is right. The old clause applied "the same" definition, and that definition requires p to be affine, which a quasi-affine diagonal does not give. 4.1 defines only affine morphisms. On the plane with doubled origin, the base change of `U ⊔ U′ → h_Z` along U is `U ⊔ (𝔸² ∖ 0) → U`, which is not affine. The repaired hypothesis is SAG Definition 9.1.0.1 (SAG line 26462), with faithful flatness as in SAG Definition 6.3.3.7 and Example 6.3.3.6 (SAG lines 18327–18351), specialised to `CRing`. SAG Proposition 9.1.3.1 and Corollary 9.1.3.2 (SAG lines 26667–26696) are its source, and are already cited at the claim.

Difference from the suggested text, wording only. Requiring each base change of p to be quasi-affine is redundant. `Spec R ×_X Spec A ≃ Spec(R ⊗_ℤ A) ×_{X×X} X` is quasi-affine by the diagonal hypothesis (SAG Proposition 9.1.1.1, SAG line 26502). So the README states that consequence and requires only flatness over R, which is equivalent to the suggested condition.

The new Check cites two Stacks results, both read through the sources service: Descent, Lemma 35.13.7, tag 023Q (schemes are fpqc sheaves), and Morphisms of Schemes, Lemma 29.13.6, tag 02JR (a quasi-compact immersion is quasi-affine). Both are recorded in the existing `Stacks` manifest entry and in References.

Same pattern searched in the rest of the design. No other passage uses "quasi-affine" or applies "geometric" outside the affine-diagonal definition: 6.4 and 7.1 use "geometric" in the affine sense only. The 6.2 proof route already treated the quasi-affine terms of the Čech nerve through 5.3 and §2.18.

## Checks run

Dependency gate (exact output):

```
candidate: QuasicoherentSheavesOnPrestacks is not in the merge order yet; checked as if placed after HabiroCohomologyFoundations (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2236 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line.

- README and plan agreement. A script compared every README *Needs* line with the plan's `target:` prerequisites, over 33 targets. All agree once the README's "6.1 and 6.3" and "6.1, 6.2 and 6.3" are read as lists. No prerequisite is at or after its own target, and 2.5 → 6.2 points backwards. `plan.json` parses as JSON and is serialized in its existing format.
- Style scan of the changed lines: no LaTeX delimiters, process words, machine paths or pull-request numbers.
- Lean: no `Suggested.lean` at the design stage, so no `#check` pass was possible or needed.
- Sources: Stacks Morphisms of Schemes and Descent were fetched through the sources service into a scratch copy of the manifest, so the recorded `Stacks` file (Derived Categories of Schemes) keeps its url and sha256. The real entry was updated by hand: locator, version note and `cited_for` gains "6.2". There is no new key and no reference request.
- Ownership: no new object, construction or cross-roadmap citation was added. Both repairs only make existing statements of this roadmap precise.

## Adversarial pass (new or changed statements)

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| Conventions: small = u-small, `Mod_A` and `QCoh(X)` have small colimits | `Mod_ℤ`, K not u-small; `QCoh(⨿_K Spec ℤ)` | coproduct of K copies of ℤ would give `π₀Map(C, ℚ/ℤ) = ∏_K ℚ/ℤ` of cardinality `≥ |K|`, not u-small, while `D∞(ℤ)` is locally u-small, so no such coproduct exists; `∏_K D∞(ℤ)` has componentwise u-small colimits | holds; "small" for `QCoh(X)` must be u-small |
| Conventions: every (u+1)-small colimit of corepresentables is a prestack | `⨿_K Spec ℤ`; `Pts(X)^op`-colimit | value at A is K, a (u+1)-set, in `Ŝ`; `Pts(X)` (u+1)-small | holds; u-small would not cover the 2.1 co-Yoneda colimit |
| 2.1 (u+1)-small limits and colimits pointwise | product over K of `Spec ℤ`; empty colimit | `Spec ℤ` (final), computed in `Ŝ`; ∅ | holds |
| 2.3 QCoh carries (u+1)-small colimits to limits | `⨿_K Spec ℤ`; `X = ∅`; `BΓ × Spec k` | `∏_K D∞(ℤ)`, (u+1)-small limit in `Ĉat∞`; terminal category = zero category; `Fun(BΓ, Mod_k)` | holds; with only u-small colimits the case `⨿_K` and 2.4's route over `Pts(X)^op` were uncovered |
| 2.3 route: stable categories with small colimits closed under (u+1)-small limits in `Ĉat∞` | `∏_K D∞(ℤ)` | stable, u-small colimits componentwise; not locally u-small, so not presentable, as 2.3 does not claim | holds |
| 2.4 `u_!` preserves (u+1)-small colimits | `u = ι`, `⨿_K Spec ℤ` | `ι_!(⨿_K Spec ℤ) = ⨿_K Spec ι(ℤ)` (left adjoint); `ι_! ∅ = ∅` | holds |
| 3.1 universal property, target with (u+1)-small limits | `F = QCoh` into `CAlg(Ĉat∞)`; target `S` (u-small spaces) | `CAlg(Ĉat∞)` has (u+1)-small limits and QCoh preserves them (2.3), restriction `Mod` a hypercomplete sheaf (3.2), giving 3.3(a); for `S`, the right Kan extension along Yoneda would need limits over `Pts(X)`, which are (u+1)-small and need not exist in `S` | holds; the (u+1)-small hypothesis is needed (SAG Proposition 1.3.1.7, SAG line 4184, in the universe u+1) |
| 3.3(b) (u+1)-small colimits of sheaves | `L(⨿_K Spec ℤ)` | `QCoh = ∏_K D∞(ℤ)` by (a) and 2.3 | holds |
| 6.2(b) classical quasi-affine clause | doubled plane Z over k | diagonal base change along `U × U′`: `U ∩ U′ = 𝔸² ∖ 0`, quasi-affine, not affine; every diagonal base change a quasi-compact immersion into `Spec R`, quasi-affine (02JR); p's base change along U: `U ⊔ (𝔸² ∖ 0) → U`, flat, surjective, not affine; heart = pairs of modules on U, U′ glued on `𝔸² ∖ 0` = `QCoh(Z)` | covered, conclusion holds by 5.3 |
| same | `Z = 𝔸² ∖ 0` (separated) | diagonal base changes closed immersions, affine; `D(x) ⊔ D(y) → Z` affine, flat, surjective | geometric as well; both clauses agree |
| same | `X = h_∅ = Spec 0` | diagonal an equivalence; `p = id`; `QCoh = 0`, heart 0 | holds (degenerate) |
| same | line with ℕ origins (not quasi-compact, not quasi-separated); `BE` for an elliptic curve E | the line is not quasi-compact, so no fpqc surjection from an affine onto it; for `BE`, the diagonal fibre E is proper of dimension 1, not quasi-affine | both excluded by the hypotheses |
| same: `Spec R ×_X Spec A ≃ Spec(R ⊗_ℤ A) ×_{X×X} X` | `X = h_Z`, R, A fields over k | the fibre product of two points over Z is the base change of `Δ_Z` along `(a, b)`, the locus where a and b agree | holds; product of affines in `PreStk_CRing` is `Spec` of `⊗_ℤ` |
| same: hypercompleteness | classical X with quasi-affine diagonal | path spaces of `X(R)` are values of `h_Z`, discrete, so `X(R)` is 1-truncated, hence hypercomplete in the fpqc ∞-topos (HTT Lemma 6.5.2.9) | the hypothesis is automatic classically, kept for uniformity with the geometric case |

## For the maintainer

- No name that another roadmap cites changed. No target was added, removed or renumbered. The 6.2 target gains a Check and the prerequisite 2.5 in both files.
- `sources.toml`: the `Stacks` entry's locator now also lists 02JR (Morphisms of Schemes, Lemma 29.13.6) and 023Q (Descent, Lemma 35.13.7). Its version note records the Descent chapter as read through the sources service, and `cited_for` gains 6.2. The recorded file (Derived Categories of Schemes) and its sha256 are unchanged.
- Nothing in the review was suspicious, and nothing in it was an instruction.
