<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17723#issuecomment-6904767556 -->
Red team round 2 pass b (claude) of 6c66881

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) "`𝒵_x ≃ BG_x` exactly when `κ(x) → k` is an isomorphism" is false as written

   **Location.** `packages/StackPointsAndResidualGerbes/Suggested.lean:30–32`: "the residual gerbe at
   a representative (6.2, 6.3): `𝒵_x ×_{κ(x)} k ≃ BG_x` for every representative `Spec k → 𝒳`, and
   `𝒵_x ≃ BG_x` exactly when `κ(x) → k` is an isomorphism"; and
   `packages/StackPointsAndResidualGerbes/README.md:1816–1817` (6.4, third Check): "`𝒵_x = Spec κ`
   while `BG_x = Spec k`".

   **Claim.** The stacks `𝒵_x` and `BG_x` are equivalent only when `κ(x) → k` is an isomorphism; and
   both formulas hold on every stack.

   **Witness.** `𝒳 = Spec κ`, `κ = ℚ(t)`, `k = ℚ(s)` with `s² = t`: `κ → k` has degree 2, yet
   `𝒵_x = Spec ℚ(t) ≅ Spec ℚ(s) = BG_x` (`G_x = 1`, `t ↦ s`). 6.3 (README:1747–1749) states the true
   form, for the canonical morphism. `κ(x)` exists only on decent stacks (5.3).

   **Repair.**

   - `Suggested.lean:30–32`, replace the bullet by: "the residual gerbe at a representative (6.2,
     6.3): on a decent stack, `𝒵_x ×_{κ(x)} k ≃ BG_x` for every representative `Spec k → 𝒳` of a point
     whose residual gerbe exists, and the canonical morphism `BG_x → 𝒵_x` is an equivalence exactly
     when `κ(x) → k` is an isomorphism;".
   - `README.md:1816–1817`, replace "`𝒵_x = Spec κ` while `BG_x = Spec k`" by "`Spec k → 𝒵_x^♭ = Spec κ`
     is not an isomorphism and the canonical `BG_x = Spec k → 𝒵_x = Spec κ` is not an equivalence
     (6.3); the two stacks can still be abstractly isomorphic, as for `κ = ℚ(t)`, `k = ℚ(√t)`".
   - Tested on the witness: the canonical morphism is `Spec ℚ(s) → Spec ℚ(t)`, of degree 2, not an
     equivalence, and `κ → k` is not an isomorphism: both sides of the repaired "exactly when" are
     false. For `k = κ` both are true.

2. **F02** (P3) three line locators in 5.1 name no source, after a different source id

   **Location.** `README.md:1455–1462`: "…Algebraic Stacks, Section 94.6, stacks-algebraic-stacks
   lines 106–112) … then `𝒳` is decent (lines 4699–4721, Lemma 101.48.3: …"; "(lines 4722–4731, Lemma
   101.48.4)"; "(lines 4732–4735, Lemma 101.48.5)".

   **Claim.** The three locators point into the text last named.

   **Witness.** The last source id before them is `stacks-algebraic-stacks`, whose text has 1319
   lines. The three lemmas stand at stacks-06RD lines 4699, 4722 and 4732.

   **Repair.** Write "(stacks-06RD lines 4699–4721, Lemma 101.48.3: …", "(stacks-06RD lines
   4722–4731, Lemma 101.48.4)" and "(stacks-06RD lines 4732–4735, Lemma 101.48.5)". Tested: stacks-06RD
   line 4699 reads "Lemma 48.3", line 4722 "Lemma 48.4", line 4732 "Lemma 48.5".

3. **F03** (P3) 4.5 cites Remark 101.51.3 for a statement the remark does not make

   **Location.** `README.md:1417–1419`: "and then `𝒵_x` is the reduced induced closed substack on
   `{x}` and `𝒵_x → 𝒳` is locally of finite type (stacks-06RD lines 4870–4878, Lemma 101.51.4; Remark
   101.51.3, lines 4866–4869)".

   **Claim.** Remark 101.51.3 supports the identification of `𝒵_x` with the reduced induced substack.

   **Witness.** stacks-06RD lines 4866–4869: the remark says only that the factorisation of Lemma
   101.51.2 is not known without quasi-compact inertia and that it holds at closed points. The
   identification is in the proof of Lemma 101.51.4 (lines 4874–4878). 4.5 does not state the
   remark's content.

   **Repair.** In line 1419 replace "Lemma 101.51.4; Remark 101.51.3, lines 4866–4869)" by "Lemma
   101.51.4 and its proof)". After the *Needs* line of 4.5 add: "The API consists of one fact: for
   `𝒳` locally Noetherian, `x` closed and `𝒴` reduced, a morphism `𝒴 → 𝒳` with `|f|(|𝒴|) ⊆ {x}`
   factors through `𝒵_x`, with no hypothesis on the inertia, by 0.5's factorisation through the
   reduced induced closed substack (stacks-06RD lines 4866–4869, Remark 101.51.3)." Tested: on
   `[𝔸¹/𝔾_m]`, `Spec k → 𝒳` at `0` factors through `B𝔾_m`; `Spec k[ε] → 𝔸¹`, `t ↦ ε`, is excluded by
   reducedness (0.5's third Check); on `U/G` of Example 100.11.6 (not locally Noetherian) `U → X` has
   image the closed point and does not factor through `Spec ℚ̄`: the identity of `U` would be `u ↦ h(u)·u₀`
   for a locally constant `h : U → G`, of finite image on the quasi-compact `U`, which is infinite.

One P2 (S01, a false "exactly when" in the headline list of `Suggested.lean`, repeated in one Check)
and two P3 (S02, S03, locators). No target of the README was refuted. All eleven findings of round
1 are repaired at this head and no repair introduced an error.

## Round 1 findings at this head

| Round 1 finding | Status | Witness at `6c66881` (`packages/StackPointsAndResidualGerbes/README.md`) |
|---|---|---|
| 1b/F01 (P1) `Stacks.QCoh` used as an abelian tensor category | repaired | lines 402–411: "What SchemeAndStackFoundations must provide (gap:qcoh-stacks-abelian-tensor): §1.22 must prove, for an algebraic stack `𝒳`, that `Stacks.QCoh 𝒳` is abelian…"; lines 685–687 "an abelian category containing `O_𝒳` by gap:qcoh-stacks-abelian-tensor"; line 1871 "the quasi-coherent module `i^* ℐ = ℐ/ℐ²`"; lines 104–105; slug present in `design/plan.json` (17 slugs on each side, same set). The cited Lemmas 96.15.1 (1), (2), (5), 96.11.2, 96.11.3, 96.12.5, 78.12.6 and Definition 96.6.1 were opened at the cited lines and say what the gap says. |
| 1a/F01 (P2) VirtualFundamentalClasses does not consume 0.3–0.5 | repaired | lines 54–62: "states, in its §1.2, closed substacks of Deligne–Mumford stacks of finite type over a field with their description on an étale presentation…"; lines 2068–2073. Checked against `packages/VirtualFundamentalClasses/README.md` §1.2 (line 508 on) and its boundary paragraph (lines 102–105): true. |
| 1a/F02 (P3) uncited pinned separable-point theorem | repaired | lines 295–299 and 1926–1930, *Needs* at line 1958; the declaration is at `TauCeti/AlgebraicGeometry/Morphisms/Smooth/SeparablePoint.lean:43` in namespace `AlgebraicGeometry`, with `[Smooth f] [Nonempty X]` as described. |
| 1a/F03 (P3) Lemma 68.13.7 unowned in 5.3 | repaired | lines 1532–1536: "By gap:decent-algebraic-spaces (Lemma 68.11.1) the point of the decent space `𝒵_x^♭` is represented by a monomorphism… (3.1), and 3.2 makes the monomorphism an isomorphism"; *Needs* line 1538 has 3.1, 3.2. |
| 1a/F04, 1b/F02 (P3) *Stacks.IsGerbe* versus the supplier's `IsGerbe` | repaired | line 989 "*Stacks.IsGerbeOverSomeSpace*"; lines 990–994; Check at lines 1024–1029. Recomputed: `IsGerbe(F, fppf)` = `relativeGerbe` to the final object `Spec ℤ`. |
| 1a/F05 (P3) framing direction in Convention 8 | repaired | lines 162–168: "§8.1 writes them `(τ, β : τ|_k ≅ x)` and §8.3's `FramedDeformation` writes them `(τ, α : x ≅ τ|_k)`"; agrees with the supplier's lines 9651 and 9727. |
| 1a/F06, 1b/F03 (P3) `𝔸¹_k/ℤ` cited to §1.12 | repaired | lines 950–959 "Let `G = 𝔾_{a,ℚ}/ℤ` over `ℚ`… (`translationQuotient_space`)"; lines 1388–1390. |
| 1b/F04 (P3) carriers in the smoothness of `[X/G]` | repaired | lines 1060–1063: "for a smooth morphism `X → Y` of algebraic spaces and a group algebraic space `G` over `Y`…"; Check at lines 1099–1102. |
| 1b/F05 (P3) manifest entry `rydh2015` | repaired | `sources.toml` has 24 entries, none `rydh2015`; each of the 24 ids occurs in the README. |

## Record of the adversarial pass

`Suggested.lean` declares nothing: `module`, `import Mathlib`, one docstring, an empty namespace.
There is no declaration row, no instance context and no `#check` comparison; no Lean was run. The
rows are the 38 README targets and the conventions.

| Statement | Instances tried | Values computed (hypothesis side / conclusion side) | Result | Change |
|---|---|---|---|---|
| Conv. 4 substacks | `Spec k ⊔ Spec k` | two open substacks, equivalent as stacks, different object sets | pins equality | none |
| Conv. 5, 8 action | `[𝔸¹/𝔾_m]` at 0, `τ = bε` | class `α⁻¹b`; `g·(τ,α) = (τ, αg⁻¹)` ↦ `gα⁻¹b`; in `β`-form `gβb` | weight `+1` both | none |
| 0.1 smooth-local `P` | `Bμ_p/𝔽_p`, atlas `𝔾_m` | `𝔾_m ×_{Bμ_p} Spec k` = total space `𝔾_m`, smooth; flat cover `μ_p` nonreduced | holds | none |
| 0.2 rigidity proof | `T → Spec k` mono, `V` affine étale chart; `Spec k → Spec k[ε]` | `V ×_T V = V ×_k V`, projection étale ⇒ `V/k` étale by descent along the fpqc `V → Spec k`; second: mono, not iso, target not a field | holds | none |
| 0.2 section of `X → Spec ℚ̄` | `U/G` of Example 100.11.6 | `s∘a = s∘b ⇒ a = psa = psb = b`; `U ×_X Spec ℚ̄ = G × Spec ℚ̄` discrete, `U` profinite | mono, not iso | none |
| 0.3 presentation bijection | `[𝔸¹/𝔾_m]`; `Spec k(t) → 𝔸¹` | invariant `{0}`, `𝔾_m`; `{η}` has non-closed complement | holds | none |
| 0.4 kernel in `QCoh` | origin of `𝔸¹`; `Spec(k × k)` | `i_*O_𝒵(T) = O(T ×_𝒳 𝒵)`: over the origin `k → k` iso, kernel 0, but `(t) ⊗ k = k·t`; split case `O(T₂)` on both sides | holds | none |
| 0.4 neighbourhoods | `𝔸¹`, `n = 0, 1, 2`; `k[ε]` | lengths 1, 2, 3; `ℐ² = 0`; `2(n+1) ≥ n+2` | holds | none |
| 0.5 reduced induced | `T` locally closed; `k[ε] → 𝔸¹` | `T̄ ∖ T = T̄ ∖ O` closed; image `{0}`, no factorisation | holds | none |
| 1.1 finite type points | `η ∈ 𝔸¹_k`; `Spec ℤ_(p)`; `Spec k(t) → Spec k → 𝒳` | `K` finite over `k[t]` forces `k[t]` a field; `ℚ = ℤ_(p)[1/p]`; cancellation gives `k(t)/k` of finite type, false | holds | none |
| 1.2 fibres | `Spec ℚ(i)`, `B(ℤ/2)_ℝ`, `𝔸¹_ℝ` | `σ∘id = id∘σ` with `a = σ, b = id`; 2 classes ↦ 1 point; `t²+1` missed | holds; agrees with the supplier's "common field extension" | none |
| 1.3 `G_x` | `Bμ_3/ℚ`; `Bμ_p` | `μ_3(ℚ) = 1`, `μ_3(ℚ(ζ₃)) = ℤ/3`; `μ_p(𝔽̄_p) = 1`, length `p` | holds | none |
| 1.4 scheme criteria | `𝔾_{a,ℚ}/ℤ`; `Bℤ`; `B𝔾_m` | diagonal `⊔_ℤ 𝔸¹ → 𝔸²` not qc, image dense without generic point; `G_x = ℤ_k`; affine diagonal | six cases = Lemma 101.19.1 (1)–(6) | none |
| 2.1 gerbes | `𝔸¹_k`; `B𝔾_{m,𝔽_p}`; `B𝔾_{m,ℤ}` | `0 ≠ 1` in a sheaf; no object over `ℚ`-schemes; both hold | holds | none |
| 2.2 section | `[𝔸¹/𝔾_m]`, section 1 | `Isom(1,1) = 1`, `[Spec k/1] ≠ 𝒳` | gerbe hypothesis needed | none |
| 2.3 smoothness | `Bμ_p`; `Spec 𝔽_p → Bμ_p` | smooth; fibre `μ_p` | holds | none |
| 2.4 inertia criterion | `[𝔸¹/𝔾_m]` | fibres `𝔾_m`, 1: a flat lfp separated group trivial on a dense open has trivial fibres | not a gerbe | none |
| 2.5 diagonal | `Spec k → B𝔾_m`; `Bℤ` | diagonal `e : Spec k → 𝔾_m` not flat; `Δ` pulls back to `⊔_ℤ Spec k` | holds | none |
| 2.6 dense open gerbe | `[Spec k[x₀,…]/𝔾_m]`; `[Spec k[ε]/𝔾_m]` | stabiliser `μ_{pⁱ}` on stratum `i`, trivial for `i = 0`; `Ann(ε) ∋ λ−1 ∉ εB` (`B/εB = k[λ^±]`) | holds; reducedness needed | none |
| 3.1, 3.2 | `U/G`; `Spec k → BG` | point flat (local rings of `U` are fields), closed immersion with non-finitely-generated ideal; `R = Spec ℚ̄`; second not mono | holds | none |
| 3.3, 3.4 | `Spec k[ε]`; `Spec ℚ(t)/ℤ`; pullback formula for a gerbe | `Spec k`; `ℤ × Spec ℚ(t)` not finite; `𝒵_y ×_𝒴 𝒳` smooth over `𝒵_y`, one point, mono | holds | none |
| 3.5 criterion | `BG → Spec k`, `G = ℤ/2, μ_p, 1`; non-lfp representative | 2 points vs 1; length `p` vs 1; equal; iso descends from a common `Ω` along the fpqc `Spec Ω × Spec Ω → Spec K × Spec K` | holds | none |
| 4.1 | `η ∈ 𝔸¹`; `Spec ℤ_(p)` | exists, not lft; `Spec ℚ` of finite type | three conditions = Lemma 101.18.7 | none |
| 4.2, 4.3, 4.4 | `Bμ_p`; `Bℤ`; `B(𝔾_a/ℤ)`; `Spec ℚ(t)/ℤ` | flat qf atlas; gerbe, inertia not qc; inertia qc, not qs; own residual gerbe | holds | none |
| 4.5 closed points | DVR; `U/G` | closed/open immersion; closed point, mono not a closed immersion | Noetherian hypothesis needed | S03 |
| 5.1 decency | glued `Spec k[x₁,…]`; `𝔸¹_ℚ/ℤ`; `U/G` | `D(x_{i₁}) ∪ … ∪ D(x_{iₙ})` misses `(x_{i₁},…,x_{iₙ})`; not decent; `G × Spec ℚ̄ → U` not qc | holds; Lemmas 101.48.2–5 read | S02 |
| 5.2 factorisation | id of `𝔸¹`; `k[ε]`; `Y/Γ` | image = closure; nonreduced; no section | hypotheses = Lemma 101.51.2 (1)–(4); 68.13.9 is the Noetherian case and 68.13.10 the decent one, as cited | none |
| 5.3 residue field | `[Spec ℂ/(ℤ/4)]_ℝ`; `𝔸¹_ℚ` | a real object is a `ℤ/4`-torsor lifting `Spec ℂ`; `Hom(ℤ/2, ℤ/4) = {0, 2}` ↦ 0 in `Hom(ℤ/2, ℤ/2)`; `κ = ℝ`; `ℚ(i)` | holds | none |
| 5.4 algebraicity | glued scheme; generic point of `𝔸¹`; `𝔸¹_ℚ/ℤ` | preimage of the other copy `⋃D(xᵢ)` not qc; `Spec k(t) → 𝔸¹` affine, not an immersion; `P(t+n) ≠ P(t)` in characteristic 0 | holds; `|𝒵 × T| ≅ |Z × T|` qc as `Z × T` is affine | none |
| 5.5 fppf image | `Spec κ(t) → Spec κ`; lfp point `Spec K`, cover `T → Spec K` lifting to `Spec k` | closed point of `T` has residue field finite over `κ(x)` and receives `k` over `κ(x)`, so `k` finite | iff holds in both directions | none |
| 6.1 | `Spec κ`, `k/κ` Galois; `BG` | `R_x = Γ × Spec k`, `G_x = 1`; `R_x = G` | holds | none |
| 6.2 base change | `BG_k`; `η ∈ 𝔸¹`; `[Spec ℂ/(ℤ/4)]` | three products `BG`, `Spec k`, `G`; `Spec K = B1`; stabiliser of `Spec ℂ` is the kernel `ℤ/2` | holds | none |
| 6.3 canonical `BG_x → 𝒵_x` | `κ = ℚ(t)`, `k = ℚ(√t)`; `(t, −1)/ℚ(t)` | degree 2, not an equivalence, although `Spec k ≅ Spec κ`; tame symbol at `t = 0` is `−1 ∉ ℚ^{×2}`, `(t², −1)` split | README statement holds; docstring form false | S01 |
| 6.4 rational points | `Bμ_p/𝔽_p(t)`; `Spec k[x₀,…]`; `U/G` over `ℚ̄` | `G_x` not smooth; origin lft, not lfp; `𝒵_x = Spec ℚ̄ = B1`, not closed | holds | S01 (Check) |
| 7.1 | `𝔸²`, `n = 1`; local Artinian `A`, `𝔪^{n+1} = 0` | length 3; `ℐA ⊆ 𝔪_A` so `(ℐA)^{n+1} = 0` | holds | none |
| 7.2 normal space | `[𝔸¹/𝔾_m]`; `[𝔸ⁿ/GLₙ]`; `BG` | `t` weight `−1`, `N_0` weight `+1`; standard representation; 0 | holds | none |
| 7.3 sequence | `Bμ_p`; `Bα_p`; `[𝔸¹/μ_p]`; cusp; `GLₙ/G_x` | `{1+aε} ≅ k`, framings add nothing since `μ_p(k[ε]) → μ_p(k) = 1`; `k[ε]/k^p ⊇ {aε}`, dimension 1 = `1 − 0`; `2 = 1 + 1`; `2 = 0 + 2`; `(n² − dim G) − (n² − dim Lie G)` | holds; equals `dim H^{-1}` of the co-Lie complex | none |
| 7.3 supplier sequence | `U → 𝒳 ← Spec k`, `W → BG_x ← Spec k` | `T_{U_x} → T_U ⊕ 0 → T_𝒳` exact at `T_U`; surjective by smoothness; `T_{U_x} → T_W` has kernel `Lie G_x`, handled by "the image of" | consistent with `framedTangent_exactSequence` | none |
| 7.4 quotient stacks | `SL₂` on quadrics at `uv`; `E × 𝔾_m`; `ℤ` on `(ℤ × 𝔸¹) ⊔ 𝔸¹` | swap has determinant `−bc = 1` and sends `uv ↦ −uv`; `d(b² − 4ac) = 2b\,db ≠ 0`; `B𝔾_m`; `N = ℚ·∂_t` | holds | none |
| Worked example | `Bℤ/K` | DM, finite type, one point, `G_x = ℤ` | diagonal hypothesis needed | none |

## Dependency check

```
depcheck: 237 roadmaps, 2233 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The roadmap is line 37 of `merge-order/ORDER.txt`, after
AlgebraicModuliForArithmeticGeometry (line 36); its three suppliers are on main. No notion was
moved down from a later roadmap.

## Verified sound

- **`Suggested.lean`**: 0 declarations, 57 lines read. `import Mathlib` only; no `set_option`, no
  `sorry`, no padding. Nine headlines listed as not statable; at the pins
  `TauCeti/AlgebraicGeometry/Stack/` holds only `Basic.lean` (`SchPseudofunctor`, line 37, a bare
  pseudofunctor type), and neither pin has an algebraic stack, inertia or `|𝒳|`. No headline is
  statable. Signatures were not elaborated: there is none.
- **Targets read**: 38 of 38, with all ten Conventions, the supplier contracts, every *Needs* line
  and Dependencies paragraph. The layer sentence at README:519–522 equals the union of the *Needs*
  lines of 7.1–7.4 (0.1, 0.2, 0.3, 0.4, 1.3, 2.2, 2.3, 3.4, 4.5, 6.4); no target needs a later one.
- **Pinned declarations**: 43 file:line locators opened at Mathlib `1b1ccf4b` and Tau Ceti
  `2fd255d9` (27 Mathlib, 16 Tau Ceti); every one holds the named declaration at the stated line,
  with the quoted hypotheses and the stated namespaces.
- **Source locators**: 162 line locators checked by script (the cited label stands at the cited
  line in every case, S02 apart); 58 statements read in full, among them Lemmas 100.7.1, 100.11.4,
  100.11.5, 100.11.7, 100.11.12, 100.11.14, 100.14.1, 101.4.15–16, 101.5.4, 101.17.8,
  101.18.1–7, 101.19.1–4, 101.28.6–15, 101.31.1–3, 101.48.2–5, 101.50.2–4, 101.51.1–4, Proposition
  101.29.1, Example 101.29.2, Example 100.11.6, Decent Spaces 68.13.7, 68.13.9–10, Sheaves on
  Stacks 96.11.2–3, 96.12.5, 96.15.1, Groupoids in Spaces 78.12.6, rydh2011 Theorems B.1–B.2,
  ahr2020 §1.5 and §3.1, alper-moduli Propositions 4.5.16 and 7.4.39 and Exercise 7.4.40.
- **Sibling citations**: 59 names in 18 sections of SchemeAndStackFoundations on main (§§1.7–1.9,
  1.12–1.23, 4.8, 4.12, 4.13), each found in the cited section, including the nine leads of the
  citation tool; 12 names of AlgebraicModuliForArithmeticGeometry §§4.1, 8.1, 8.3, with the
  reframing `α∘g` and the two framing directions; `packages/VirtualFundamentalClasses/README.md`
  §1.2.
- **Gaps**: 17 slugs in the README and in `design/plan.json`, the same set, each with a named
  supplier and section. Searched the suppliers on main for decent spaces, quasi-DM, Lemmas
  101.27.15, 35.18.1, 98.5.2 and residual gerbes: none present, so no gap asks for what exists.
- **Ownership against open work** (`roadmaps grep` on main and the open heads): residual gerbes,
  decent stacks, finite type points, monomorphisms of algebraic stacks, gerbes over stacks and the
  proposed names have no second owner; FunctionFieldArithmeticPartII and LanglandsParameterStacks
  only consume.
- **Checks**: 143 read in 38 blocks, every definition has at least three; 60 recomputed (table);
  none false or vacuous, the Check of S01 apart.
- **Policy**: the pull request changes only `packages/StackPointsAndResidualGerbes/` (7 files); no
  pull-request number, process narrative, `lemma`, `set_option` or algorithm; `sources.toml` has
  no local path.
- **Wording**: 15 passages set beside their sources (definitions 3.3, 4.1, 5.1; statements 2.6,
  5.2, 5.4; the proofs of 0.2, 4.3, 5.2 and 5.4; Checks on Examples 100.11.6 and 101.29.2; 7.2–7.4
  against ahr2020 §3.1; 6.2 against alper-moduli; the docstring of `Suggested.lean`). Longest shared
  run 7 words ("is flat and locally of finite presentation"), a forced phrase.
- **Arrangement**: Layers 1, 2, 4, 5 draw on Sections 18–19, 28–29, 31 and 48–51 of Morphisms of
  Algebraic Stacks, but Layer 3 (Properties, Section 11) stands between them, Layer 4 also takes
  101.18.7, 101.28.15 and 101.51.4, Layer 2 takes 101.33.7–8, and Layers 6–7 are not from that
  chapter. The order 2 → 3 → 4 → 5 is forced (3.4 needs 2.1–2.5; 4.1 needs 3.2–3.4; 5.2 needs
  4.2–4.4). In Layer 0, 0.1, 0.2, 0.3, 0.5 ↔ Properties §§7–10, forced by 0.3 ← 0.1, 0.2 and
  0.5 ← 0.1, 0.3, with 0.4 the roadmap's own.

Source independence: 15 passages compared with 6 sources, none shared; largest share Morphisms of Algebraic Stacks (stacks-06RD with stacks-06QB), 56 of 162 locators; contents compared with stacks-06RD: independent.

## Not verifiable

- lmb2000 (Chapter 11, Définition 11.2) and olsson2016 (Chapter 11): uncertified, cited by locator
  only; not read. No target rests on them.
- The Stacks lemmas cited only inside gap sentences for Chapters 72, 74, 79, 94 and 97 (72.10.8–9,
  74.11.15, 79.9.4, 79.10.3, 94.16.1, 97.17.1–2, 97.18.3) were checked for label and line, not
  statement against statement, in this pass.
- ReductiveGroups Layers 1, 3, 3A were not reopened in this pass; the README's description is
  unchanged since round 1.
- Elaborated signatures: none exist.

## Source issues

- **Misprint** in stacks-06RD at Lemma 101.48.2, proof, printed page 98: the source says the diagonal "is on known" to be quasi-compact; it should be "is only known"; affects nothing.
- **Misprint** in stacks-06RD at Lemma 101.51.2, proof, second paragraph, printed page 102: the source, having assumed the stack reduced with generic point, takes the dense open gerbe inside the primed closed substack; it should be inside the stack itself; affects nothing.
- **Gap** in stacks-06RD at Lemma 101.51.2, proof, third paragraph, printed page 102: the source says the base of a locally Noetherian gerbe is locally Noetherian by fppf descent, details omitted; it should cite descent along the smooth surjective gerbe morphism (Lemma 101.33.8); affects the proof.
- **Gap** in stacks-06RD at Lemma 101.19.2, printed page 36: the source omits the proof; it should compare two representatives over a common field extension by the base-change formula for the automorphism group; affects the proof.

## For the human reviewers

- **Licence.** `alper-moduli` is an author's draft of lecture notes dated 5 January 2026 (`sources.toml`, `licence_class = "author-page"`); nine line locators cite it, each beside a Stacks Project or ahr2020 locator.
- **Licence.** `sga3-vi-a` is read in the editors' online compilation of 13 October 2024 of the SMF re-edition (`sources.toml`); one locator, inside gap:homogeneous-quotient-scheme.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6c66881cd562574f7fff311022a423db7c102b25", "job": "RT-StackPointsAndResidualGerbes~2b", "model": "fable", "worker": "chris-x55"} -->
