# FIX-DESIGN-StackPointsAndResidualGerbes~3

Findings of `REV-DESIGN-StackPointsAndResidualGerbes~2` (five findings, one review), settled on the
mathematics. Files edited: `packages/StackPointsAndResidualGerbes/design/README.md`,
`packages/StackPointsAndResidualGerbes/design/plan.json`, `packages/StackPointsAndResidualGerbes/sources.toml`.

## F01 (P2) — applied

The finding is right. README 6.3 and the `plan.json` API `neutral_iff` used to read "neutral iff it has an object over
`Spec κ(x)`, iff … iff `𝒵_x ≃ BG_x` for a representative defined over `κ(x)`". They now read "neutral iff
some representative has `κ(x) → k` an isomorphism (then `𝒵_x ≃ BG_x` for it), iff some representative
`Spec κ(x) → 𝒳` induces the identity of `κ(x)`, that is, comes from a section", followed by one sentence
saying that an object over `Spec κ(x)` is a section only when it induces the identity. I added the
reviewer's witness as a fifth 6.3 Check, and to `plan.json` as the test `object_not_section`.

Verification of the witness (recomputed):
- `K = ℚ(t)` and `A = (t, −1)`. The tame residue at `t = 0` is `(−1)^{v(t)v(−1)} t^{v(−1)} (−1)^{−v(t)} = −1`
  mod squares, and `−1 ∉ ℚ^{×2}`. So `[A] ≠ 0` and the gerbe of trivialisations `𝒵 = [P/GL₂]` has no
  section.
- `σ : t ↦ t²` gives `A ⊗_{K,σ} K = (t², −1) ≅ M₂(K)`. So `(K², M₂(K) ≅ σ^*A)` is an object over `Spec K`
  lying over `Spec σ`.
- `𝒵` has affine diagonal (a quotient of an affine scheme by `GL₂`), so it is decent. It is smooth over
  `K` (a gerbe, 2.3) and has one point, so it is its own residual gerbe with `κ = K`.
- `σ` is not surjective (`t ∉ ℚ(t²)`), so by the first statement of 6.3 `BG_y → 𝒵` is not an equivalence.
  Consistently, 6.2 gives `σ^*𝒵 ≃ B𝔾_m`, which is neutral.

Repairing the pattern ("object over a field" read as "section"):
- 5.3 Check `[Spec ℂ/(ℤ/4)]_ℝ`: it now says why an object over `Spec ℝ` lies over the identity (`ℝ` has
  no other endomorphism). The value is unchanged.
- The worked example on zero-dimensional DM stacks: "a representative over `K`" is now a representative
  `x` with `p ∘ x = id`. A finite type representative has `k` finite over `K` through `p`, so `K → k` is an
  isomorphism.
- Already correct, left as they are: 1.2's API and Check ("morphisms over `Spec k`"), 6.4 and Layer 7
  (`p ∘ x = id`).

## F02 (P3) — applied differently

The finding is right: gap:stack-morphism-permanence does not contain descent of isomorphisms.

The suggested repair (descent through gap:isomorphism-fpqc-local-spaces after base change along a flat
`Spec k' → 𝒵_x`) is correct. But the step needs no descent at all, so citing that gap would put 6.3
behind a supplier gap it does not need.

The new route uses only 2.1:
1. If `BG_x → 𝒵_x` is an equivalence, then `BG_x → 𝒵_x → 𝒵_x^♭` is a gerbe (invariance under
   equivalences).
2. Uniqueness of the base gives `Spec k = (BG_x)^♭ ≅ 𝒵_x^♭` under `BG_x`.
3. This isomorphism is the given `Spec k → 𝒵_x^♭`, because `BG_x → 𝒵_x^♭` factors through `Spec k`
   uniquely.

The backward direction is the base change of 6.2.

Changes:
- README 6.3 *Needs:* the line ending "gap:stack-morphism-permanence (fppf descent of isomorphisms along
  `𝒵_x → 𝒵_x^♭`)" now ends at "6.2". This route and the rest of 6.3 (`R_x = G_x`, neutrality) use no
  permanence property.
- `plan.json` 6.3: gap:stack-morphism-permanence is dropped from the prerequisites. The `equiv_iff` API
  now names the route.
- The gap's `neededBy` loses 6.3.

Checked on these instances:
- `[Spec ℂ/(ℤ/4)]_ℝ` at `ℂ`: the bases would be `Spec ℂ ≅ Spec ℝ`, which is false, and indeed the map is
  not an equivalence.
- `B(ℤ/2)_ℝ`: the identity.
- `Spec ℚ(t)/ℤ`: neither side holds.
- The F01 witness at `y`: `σ` is not an isomorphism, so neither side holds.

## F03 (P3) — applied

The finding is right: stacks-06RD line 1486, Lemma 101.17.5. SchemeAndStackFoundations §1.20 on main
only defines locally Noetherian stacks with independence of the atlas.

**The needs sentence.** It now ends, in both files, with "…; and that an algebraic stack locally of
finite type over a locally Noetherian algebraic stack is locally Noetherian (Lemma 101.17.5)".

**The same pattern elsewhere.** The sentence also omitted Lemmas 100.3.1 and 100.3.3 (stacks-04XE lines
111–120 and 224–244): representability and `RepresentableProperty P` can be checked after one fppf base
change from an algebraic space. Both lemmas are inside the cited range, and 0.2 and 0.3 use them
(Lemma 100.8.4 at lines 726–727; Lemma 100.9.4 at lines 794–795). That clause is now in the sentence too.

**Needs parentheticals updated** (each now names the clause it uses):
- 0.2: Lemmas 100.3.1 and 100.3.3, replacing "descent along `W → 𝒴`".
- 0.3: fppf-locality on the target.
- 0.5: Lemma 101.17.5.
- 6.4: Lemma 101.17.5, alongside cancellation.
- 7.2: a new citation of the gap. 7.2's finite-dimensionality uses "`𝒳` locally of finite type over `k`
  is locally Noetherian".
- Layer 7 Dependencies.

In `plan.json`, 7.2 gets the prerequisite and the gap's `neededBy` gains 7.2.

## F04 (P3) — applied

The finding is right: SchemeAndStackFoundations §1.9 on main defines `LocallySeparatedSpace f`
(diagonal an immersion), and stacks-06RD lines 1675–1681 give the cases (2) and (5).

Changes:
- **Convention 3** used to read "inertia/diagonal quasi-compact = `RepresentableProperty`
  `QuasiCompactSpace`". It now reads "inertia/diagonal quasi-compact, quasi-separated or locally
  separated = `RepresentableProperty` of `QuasiCompactSpace`, `QuasiSeparatedSpace`,
  `LocallySeparatedSpace`". The three are stable under base change and fppf local on the target
  (stacks-04XE lines 142–206, items (1), (2), (31)).
- The §1.9 supplier contract now lists `LocallySeparatedSpace`.
- 1.4's *Needs*, Layer 1 Dependencies and the `plan.json` prerequisites of 1.4 now include §1.9.
- The 1.4 Check on `𝔸¹_k/ℤ` now shows that both hypotheses fail. The diagonal pulls back to
  `⊔_ℤ 𝔸¹ → 𝔸²`, which is not quasi-compact. Its image, the lines `y = x + n`, is dense in `𝔸²` in
  characteristic 0 (`f(x, x + n) = 0` for all `n` forces `f = 0`) and misses the generic point, so it is
  not locally closed. The `plan.json` test was updated to match.

## F05 (P3) — applied

The finding is right. On main, §1.21 states `quotientStack_algebraic` for groupoid schemes (README
lines 2965–2968), while `R = u ×_𝒳 u` is only an algebraic space.

Witness: `𝒳 = BG` with `G = 𝔸¹_k/ℤ` (characteristic 0). At the trivial torsor `u ×_𝒳 u = G` is not a
scheme, while `[Spec k/G]` is algebraic by Lemma 97.18.3 (stacks-criteria lines 1509–1514).

Changes:
- In 2.3, 3.2, 4.1, 4.2 and 4.4, the quotient is now §1.21's `Stack.quotient` (groupoid objects in fppf
  sheaves). Its algebraicity is attributed to gap:flat-groupoid-quotients (Theorem 97.17.2, and Lemma
  97.18.3 for 2.3), stated in each *Needs*.
- 4.4: "closed subscheme of `u ×_𝒳 U`" now reads "closed subspace of the algebraic space `u ×_𝒳 U`".
- The §1.21 supplier contract now says that `quotientStack_algebraic` covers groupoid schemes, and that
  groupoids in algebraic spaces are the gap's.

## Checks

- **Dependency gate** (after all edits), no UPWARD or CYCLE line:
  ```
  candidate: StackPointsAndResidualGerbes is not in the merge order yet; checked as if placed after AlgebraicModuliForArithmeticGeometry (the intake inserts it when its design is accepted)
  depcheck: 244 roadmaps, 2393 edges, 0 problem(s)
  ```
- **`roadmaps resolve`** on the README: no cross-roadmap citation and no Lean name found nowhere.
- **Files parse:** `plan.json` parses as JSON and `sources.toml` as TOML.
- **README against `plan.json`**, by script: the gap slugs in every *Needs* line agree with the
  prerequisites for all 38 targets, and every gap's `neededBy` equals the set of README subsections
  citing it.
  - One mismatch was there before this round and is unrelated: `plan.json` 0.2 lists §1.20, which
    README 0.2's *Needs* line does not.
  - Counts: 38 targets, 129 tests (one added) and 15 gaps.
- **Suggested.lean:** there is none at the design stage, so there was nothing to elaborate and no
  `#check` scratch file to run.
- **Style:** a grep of the added README lines finds no process words, LaTeX delimiters or machine paths.
- **Sources:** no new source. `sources.toml` `cited_for` was extended:
  - stacks-04XE: §100.3, for Convention 3 and the gap;
  - stacks-06RD: Lemma 101.17.5, for 6.4, 7.2 and the gap;
  - stacks-criteria: targets 2.3, 3.2, 4.1, 4.2 and 4.4.
- **Ownership:** no new object or construction was introduced; the quaternion gerbe is a Check, not a
  target. `scratch/overlaps.md` lists no open pull request that changes this roadmap and no dropped id.
- **Gate failures:** none listed for this round.

## Adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 6.3 `BG_x → 𝒵_x` equivalence ⇒ `Spec k → 𝒵^♭` iso (base route) | `[Spec ℂ/(ℤ/4)]_ℝ` at `ℂ`; `B(ℤ/2)_ℝ`; `Spec ℚ(t)/ℤ`; F01 witness at `y` | bases `Spec ℂ` vs `Spec ℝ`: not iso, not equivalence; `Spec ℝ = Spec ℝ`: both hold; `Spec ℚ(t) → X` not iso, `G_x = 1`, `Spec ℚ(t) ≠ X`; `Spec σ` not iso, `B𝔾_m ≄ 𝒵` | holds | new route, no descent |
| 6.3 neutral ⇔ rep with `κ(x) → k` iso ⇔ rep over `κ(x)` inducing id | `B(ℤ/2)_ℝ`; `[Spec ℂ/(ℤ/4)]_ℝ`; `𝔸¹_ℚ` at `t²+1` with `t ↦ ±i`; F01 witness | all true / all false (`H¹` lifts `{0,2} ↦ 0`) / `κ → ℚ(i)` is id or conjugation, both iso, neutral / all false, `σ` not onto | holds | clause "object over `Spec κ(x)`" deleted |
| 6.3 "object over `Spec κ(x)` ⇒ section" | F01 witness | `∂_t(t,−1) = −1 ≠ 1` in `ℚ^×/ℚ^{×2}`; `(t², −1)` split | false | Check added |
| 5.3 Check: `[Spec ℂ/(ℤ/4)]_ℝ` has no real object | absolute objects over `Spec ℝ` | `End(ℝ) = {id}`; lifts in `Hom(ℤ/2, ℤ/4) = {0, 2}` reduce to `0 ≠ [Spec ℂ]` | holds | reason stated |
| Worked example: representative with `p ∘ x = id` | `K = K̄`, closed point, finite type rep `Spec k` | `k` finitely generated field over `K` ⇒ finite ⇒ `K → k` iso | holds | stated |
| Lemma 101.17.5 clause | `Bμ_p/𝔽_p(t)` (lft over a field); `[Spec k[x₀,x₁,…]/𝔾_m]` | atlas `Spec 𝔽_p(t)` Noetherian; not lft and not locally Noetherian (no conflict) | holds | in gap |
| Lemmas 100.3.1/100.3.3 clause | 0.2 (4)⇒(1) with `P` = monomorphism; 0.3 with immersions | `V = W ×_𝒴 𝒳` space ⇒ `f` representable; `V → W` mono ⇒ `f` mono (item (29), line 201) | holds | in gap |
| Conv. 3 locally separated | `B𝔾_m`; `B(𝔸¹/ℤ)` char 0 | affine diagonal ⇒ qs and locally separated, `G_x = 𝔾_m` scheme; diagonal pulls back to `⊔_ℤ 𝔸¹ → 𝔸²`, not qc, image dense without generic point | holds; hypothesis needed | Conv. 3, 1.4 Check |
| `[u/(u ×_𝒳 u)]` algebraic (4.1) | `BG`, `G = 𝔸¹/ℤ`; `[𝔸¹/𝔾_m]` at `0` | `u ×_𝒳 u = G`, not a scheme; `R = 𝔾_m`, a scheme | only the gap covers both | attribution moved |
| 2.3 `[U/G]` algebraic | `U` an algebraic space, `G` a flat lfp group space | Lemma 97.18.3 (line 1509), no scheme hypothesis | holds | attribution moved |
| 4.4 `R'` a closed sub-object | `F = u ×_𝒳 U` | `F` is an algebraic space; `R' = p⁻¹(Z)` is a closed subspace | wording fixed | "subspace" |

## Notes for the maintainer

- **No name changes.** No name, section or target id changed, and no other roadmap cites anything that
  moved. The README is 1657 lines.
- **gap:stack-morphism-permanence grew.** It is announced to SchemeAndStackFoundations §1.20, and its
  `needs` sentence now includes two more clauses: Lemmas 100.3.1/100.3.3 and Lemma 101.17.5. Its
  `neededBy` dropped 6.3 and gained 7.2.
- **Locally quasi-finite morphisms of algebraic spaces** were not raised and are not changed. They are
  used in Convention 3 (quasi-DM, through gap:stack-separation-axioms) and in 1.4 (6). Their carrier is
  presumably §1.8's generic `Spaces.EtaleLocal`, but the pinned Mathlib proves only Zariski locality of
  `AlgebraicGeometry.LocallyQuasiFinite` (`HasRingHomProperty`, `Morphisms/QuasiFinite.lean:77`). A
  later review may ask who supplies étale locality.
- **No suspicious instructions** were found in the review text or the supplier READMEs.
