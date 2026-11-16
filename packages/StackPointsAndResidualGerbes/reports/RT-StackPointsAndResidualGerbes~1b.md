<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17723#issuecomment-6904084335 -->
Red team round 1 pass b (claude) of 389b5af

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) `Stacks.QCoh` is used as an abelian tensor category with a structure sheaf; SchemeAndStackFoundations §1.22 states none of that

   **Location.** `packages/StackPointsAndResidualGerbes/README.md:657–658`: "subobjects `ℐ → O_𝒳`
   in the abelian category `Stacks.QCoh 𝒳` of SchemeAndStackFoundations §1.22"; also lines 660
   (kernel of `O_𝒳 → i_* O_𝒵`), 671–675 (images, `ℐ^{⊗(n+1)}`, `ℐ·O_𝒴`), 1816–1817 and 1829
   ("coherent").

   **Claim.** §1.22 supplies an abelian category `Stacks.QCoh 𝒳` containing `O_𝒳`, with tensor
   products, images and kernels; 0.4, 7.1 and 7.2 are built on these.

   **Witness.** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:3797–3812` (main): §1.22 defines
   `Stacks.QCoh` and states only *QCoh.pullback*, *QCoh.presentationEquiv*, *QCoh.ofSpaceEquiv*,
   *QCoh.pushforward* and its adjunction. *QCoh.abelian* exists only in §1.11 (line 3165), for
   algebraic spaces. No tensor product, no `O_𝒳`, no coherent modules on stacks. The *Needs:* line
   of 0.4 (README:684–688) lists no gap for them, and no roadmap on main or open head owns them
   (searched `QCoh.*abelian`, `abelian.*Stacks\.QCoh`).

   **Repair.** Declare it as a gap and drop the one use of coherence.

   1. Add to the README under "From TauCetiRoadmap.SchemeAndStackFoundations", and to the `gaps`
      list of `design/plan.json` with supplier `SchemeAndStackFoundations`, section `§1.22`:

      > What SchemeAndStackFoundations must provide (gap:qcoh-stacks-abelian-tensor): §1.22 must
      > prove, for an algebraic stack `𝒳`, that `Stacks.QCoh 𝒳` is abelian, with kernels and
      > cokernels computed on a smooth presentation through *QCoh.presentationEquiv*, that it
      > contains the structure sheaf `O_𝒳`, and that the tensor product of two quasi-coherent
      > modules is quasi-coherent and commutes with *QCoh.pullback* (Stacks, Sheaves on Stacks,
      > Lemma 96.15.1 (1), (2) and (5), stacks-sheaves-on-stacks lines 1068–1077).

   2. README:657–658: replace "in the abelian category `Stacks.QCoh 𝒳` of SchemeAndStackFoundations
      §1.22" by "in `Stacks.QCoh 𝒳` (SchemeAndStackFoundations §1.22), an abelian category by
      gap:qcoh-stacks-abelian-tensor".
   3. Add `gap:qcoh-stacks-abelian-tensor (kernels, images, O_𝒳 and tensor powers in Stacks.QCoh)`
      to the *Needs:* lines of 0.4 (README:684) and 7.2 (README:1821), and to the Dependencies
      paragraphs of Layer 0 (README:776) and Layer 7 (README:1983).
   4. README:1816–1817: replace "the coherent sheaf `i^* ℐ = ℐ/ℐ²` on `BG_x`" by "the
      quasi-coherent module `i^* ℐ = ℐ/ℐ²` on `BG_x`, whose underlying vector space is
      finite-dimensional (first API bullet)". README:1828–1829: replace "finite-dimensional because
      `𝒳` is locally Noetherian and `ℐ` coherent" by "finite-dimensional: on a smooth chart
      `(U, u) → (𝒳, x)` it is `J/J² ⊗ k(u)` for an ideal `J` of the Noetherian local ring `O_{U,u}`
      (third bullet)". README:99–100: replace "because the ideal of a closed point is coherent" by
      "because the ideal of a closed point is finitely generated on a Noetherian smooth chart".

   Tested on the refuting instance: after the change every use of kernels, images, `O_𝒳` and tensor
   powers in 0.4, 7.1 and 7.2 points at the new gap, and coherence on stacks is no longer invoked.

2. **F02** (P3) `Stacks.IsGerbe` is a different notion from the supplier's `IsGerbe`

   **Location.** README:952–953: "Say that `𝒳` *is a gerbe* (*Stacks.IsGerbe*) when it is a gerbe
   over some algebraic space".

   **Claim.** The proposed name extends the supplier's vocabulary consistently (Convention 10).

   **Witness.** `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:1866`: `IsGerbe(F, J)`
   asks every object `U` of the site for a covering with nonempty fibres. `B𝔾_{m,𝔽_p}` on
   `(Scheme, fppf)` has empty fibre over `Spec ℚ` and every covering of it: not `IsGerbe`, yet
   *Stacks.IsGerbe*.

   **Repair.** Rename *Stacks.IsGerbe* to *Stacks.IsGerbeOverSomeSpace* at README:953, and add to
   the Checks of 2.1: "`B𝔾_m` over `𝔽_p` is a gerbe in this sense (over `Spec 𝔽_p`) and does not
   satisfy AlgebraicModuliForArithmeticGeometry §4.1's `IsGerbe` on `(Scheme.{u}, fppf)`, its fibre
   over `Spec ℚ` being empty fppf-locally; the absolute notion here is `relativeGerbe` over an
   algebraic space, not `IsGerbe` of the site."

3. **F03** (P3) SchemeAndStackFoundations §1.12 is cited for more than it states

   **Location.** README:918–919: "the non-separated group algebraic space `G = 𝔸¹_k/ℤ` over a field
   of characteristic zero (SchemeAndStackFoundations §1.12)"; repeated at README:1337.

   **Witness.** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:3181–3183`:
   `translationQuotient_space` is stated for `𝔸¹_ℚ/ℤ` only, as an algebraic space that is not a
   scheme and not quasi-separated; no group structure and no other field.

   **Repair.** README:918–919: "the non-separated group algebraic space `G = 𝔸¹_ℚ/ℤ`
   (SchemeAndStackFoundations §1.12's `translationQuotient_space`, with the group law induced from
   `𝔾_a`, the subgroup `ℤ ⊂ 𝔾_a(ℚ)` being normal)". README:1337: "`G = 𝔸¹_ℚ/ℤ`" in place of
   "`G = 𝔸¹_k/ℤ` in characteristic zero". README:920: "base change of `G → Spec ℚ`".

4. **F04** (P3) the smoothness theorem for `[X/G]` omits the carriers

   **Location.** README:1013–1015: "for `X → Y` smooth and `G` flat and locally of finite
   presentation over `Y` acting on `X` over `Y`, `[X/G] → Y` is smooth".

   **Witness.** stacks-06RD lines 3335–3337 (Lemma 101.33.7): `X → Y` is a smooth morphism of
   algebraic spaces and `G` a group algebraic space over `Y`. As written the README gives `X`, `Y`
   and `G` no type; `[X/G]` is not defined in §1.21 for a stack `X`.

   **Repair.** "that for a smooth morphism `X → Y` of algebraic spaces and a group algebraic space
   `G` over `Y`, flat and locally of finite presentation, acting on `X` over `Y`, the quotient stack
   `[X/G]` is smooth over `Y`, even when `G` is not smooth".

5. **F05** (P3) manifest entry for a work the README never cites

   **Location.** `packages/StackPointsAndResidualGerbes/sources.toml:89–103`, `id = "rydh2015"`
   (Noetherian approximation of algebraic spaces and stacks).

   **Witness.** `rydh2015` occurs nowhere in `packages/StackPointsAndResidualGerbes/README.md`
   (20 other ids occur); the entry has no `cited_for` field, which the manifest schema requires.

   **Repair.** Delete the `[[source]]` table `rydh2015` from `sources.toml`.

One blocking finding (R01, an unowned prerequisite written as if supplied) and four P3 findings.
No false statement was found among the 38 targets; every source locator, pinned declaration and
supplier name that was checked resolves, except as listed.

## Record of the adversarial pass

`Suggested.lean` declares nothing (empty namespace), so the table is of README targets. "L" is
the left side or hypothesis side computed, "R" the right.

| Target | Instances tried | Values computed | Result |
|---|---|---|---|
| 0.1 smooth-local `P` | `Bμ_p/𝔽_p`; `[Spec k[t]/(t²)/𝔾_m]` | atlas `𝔾_m` reduced, flat cover `μ_p` nonreduced; atlas nonreduced | consistent |
| 0.2 monomorphism ⇔ diagonal equivalence | `Spec k → BG`; `Spec ℂ → Spec ℝ`; `Spec k → Spec k[ε]` | `Spec k ×_{BG} Spec k = G`; 2 points; closed immersion, not iso | consistent; rigidity needs a field target |
| 0.2 rigidity proof | `T` mono over `k`, `V` affine étale chart | `V ×_T V = V ×_k V`, étale over `V` ⇒ `V/k` étale by fpqc descent | sound |
| 0.3 presentation bijection | `[𝔸¹/𝔾_m]` | invariant `{0}`, `𝔾_m` ↔ `B𝔾_m`, `Spec k` | consistent |
| 0.4 kernel in QCoh | origin of `𝔸¹`; `Spec(k×k)` | all-modules kernel: `(t)` over id, `0` over origin; pullback of `(t)` is `k·t`, dim 1; split case `O(T₂)` both sides | consistent; R01 |
| 0.4 indexing | `𝔸¹`, origin, `n = 0,1,2`; `k[ε]` | lengths 1,2,3; `𝒳^{[n]} = 𝒳` for `n ≥ 1` | consistent with Convention 6 |
| 0.5 reduced induced | `k[ε]`; `Spec k[ε] → 𝔸¹` | `Spec k`; image origin, no factorisation | consistent |
| 1.1 finite type points | generic point of `Spec ℤ_(p)`, of `𝔸¹_k`; `Spec ℚ̄ → Spec ℚ` | `ℚ = ℤ_(p)[1/p]` f.g.; `K ⊇ k[t]` f.g. ⇒ finite ⇒ `k[t]` a field, false; `[ℚ̄:ℚ] = ∞` | consistent |
| 1.2 fibres of `π₀𝒳(k) → |𝒳|` | `B(ℤ/2)_ℝ`; `Spec ℚ(i)`; `𝔸¹_ℝ` | 2 classes ↦ 1 point; `id`, `σ` identified through `a = σ, b = id`, not through one embedding; `t²+1` missed | consistent |
| 1.3 `G_x` | `Bμ_p`; `Bμ_3/ℚ` | `μ_p(𝔽̄_p) = 1`, scheme `μ_p` of length `p`; `μ_3(ℚ) = 1`, `μ_3(ℚ(ζ₃)) = ℤ/3` | consistent |
| 1.4 `G_x` a scheme | `𝔸¹_ℚ/ℤ`; `Bℤ`; `B𝔾_m` | diagonal pulls back to `⊔_ℤ 𝔸¹ → 𝔸²`, not qc, image dense without generic point; `G_x = ℤ_k` étale not finite; affine diagonal | consistent; R03 |
| 2.1 gerbe | `BG → Spec k`; `[𝔸¹/𝔾_m]`; `Spec k → BG` | lifts exist; `0`, `1` not locally isomorphic; automorphisms do not lift | consistent; R02 |
| 2.2 section ⇒ `[U/G]` | `[𝔸¹/𝔾_m]` with section `1`; `BS₃/ℝ` twisted | `Isom(1,1) = 1`, `[Spec k/1] ≠ [𝔸¹/𝔾_m]`; inner form | hypothesis needed, consistent |
| 2.3 gerbes smooth | `Bμ_p → Spec 𝔽_p`; `Spec 𝔽_p → Bμ_p` | smooth; base change `μ_p → Spec 𝔽_p` not smooth | consistent; R04 |
| 2.4 inertia criterion | `[𝔸¹/𝔾_m]`; `Bμ_p` | fibres `𝔾_m`, `1`: not flat; flat | consistent |
| 2.5 diagonal criterion | `Spec k → B𝔾_m`; `Spec k → Spec k[ε]`; `Bℤ` | diagonal = unit section of `𝔾_m`, not flat; univ. homeo, not flat; `Δ` pulls back to `⊔_ℤ` | consistent |
| 2.6 dense open gerbe | `[𝔸¹/𝔾_m]`; `[Spec k[ε]/𝔾_m]`; Example 101.29.2 | `Spec k`; stabiliser `k[ε][λ^±]/((λ−1)ε)`, `λ−1 ∈ ann(ε) ∖ εB`: not flat; stratum `x₀ ≠ 0` (a flat lfp group trivial on a dense open is trivial) | reducedness needed, consistent |
| 3.1–3.2 one-point stacks | `U/G` of Example 100.11.6; `Spec k[ε]` | section of `X → Spec ℚ̄` is a mono, `U ×_X Spec ℚ̄ = G × Spec ℚ̄` discrete ≠ `U`; not flat | consistent |
| 3.3–3.4 residual gerbe | `Spec ℚ(t)/ℤ`; `[𝔸¹/𝔾_m]`; cusp/node | `⊔_ℤ Spec ℚ(t) = Spec(ℚ(t)⊗_F ℚ(t))` impossible for finite `ℚ(t)/F`; `B𝔾_m`, `Spec k`; `Spec k` regular | consistent |
| 3.5 isomorphism criterion | `Spec k → BG`; `BG → Spec k` | `Spec k` vs `G` (2 vs 1 points for `ℤ/2`; length `p` vs 1 for `μ_p`) | consistent |
| 4.1–4.4 existence | generic point of `𝔸¹`; `Bμ_p`; `Bℤ`; `U/G` | exists, not lft; quasi-finite flat atlas; gerbe, inertia not qc; exists by 4.1 | consistent |
| 4.5 closed points | DVR; `U/G` | closed/open immersions; closed point, `Spec ℚ̄ → X` not a closed immersion | Noetherian hypothesis needed |
| 5.1 decency | two copies of `Spec k[x₁,…]` glued along `⋃D(xᵢ)`; `𝔸¹_ℚ/ℤ` | `D(x_{i₁})∪…∪D(x_{iₙ})` misses `(x_{i₁},…,x_{iₙ}) ∈ U`; not decent | both alternatives needed |
| 5.2 factorisation | identity of `𝔸¹`; `k[ε] → 𝔸¹`; Example 68.13.11 | image = closure, no factorisation; nonreduced; orbit map has no section | consistent |
| 5.3 residue field | `[Spec ℂ/(ℤ/4)]/ℝ` | `H¹(ℝ,ℤ/4) = Hom(ℤ/2,ℤ/4) = {0,2}`, both ↦ 0 in `H¹(ℝ,ℤ/2)`; `κ = ℝ`, no real object | consistent |
| 5.4 algebraicity | glued scheme of 5.1; `𝔸¹_ℚ/ℤ` | `𝒵 = Spec A`, preimage of other copy `⋃D(xᵢ)` not qc; `P(t+n) ≠ P(t)` so only open is whole | consistent; qc of `𝒵 → 𝒳` checked (`|𝒵 × T| ≅ |Z × T|` qc) |
| 5.5 fppf image | `Spec κ(t) → Spec κ`; `k/κ` finite | cover through `Spec k` forces `k` into a finite extension of `κ`; image `Spec κ` | consistent |
| 6.1 `R_x` | `k/κ` Galois; `BG` | `Γ × Spec k`, `G_x = 1`; `R_x = G` | consistent |
| 6.2 base change | `BG_k`; generic point of `𝔸¹`; `Spec ℚ(t)/ℤ` | three products `BG`, `Spec k`, `G`; `Spec K = B1`; `X ×_X Spec ℚ(t)` | consistent |
| 6.3 neutrality | quaternion `(t,−1)/ℚ(t)` | residue at `t = 0` is `−1 ∉ ℚ^{×2}`; `(t²,−1)` split | consistent |
| 6.4 rational points | `Bμ_p/𝔽_p(t)`; `Spec k[x₀,…]` origin; `k/κ` finite nontrivial | `BG_x` with `G_x` not smooth; lft, not lfp; `Spec κ ≠ Spec k` | consistent |
| 7.2 normal space | `[𝔸¹/𝔾_m]`; `[𝔸ⁿ/GLₙ]` | `ℐ/ℐ² = k·t` weight −1, `N_0` weight 1; standard representation | consistent with Convention 5 |
| 7.3 exact sequence | `Bμ_p`; `[𝔸¹/μ_p]`; cusp; `GLₙ/G_x` | `T = {1+aε} ≅ k`, `N = 0`; `2 = 1 + 1`; `2 = 0 + 2`; `(n²−dim G) − (n²−dim Lie G)` | consistent; equals `dim H^{-1}` of the co-Lie complex |
| 7.4 quotient stacks | `SL₂` on binary quadrics at `uv`; `E × 𝔾_m`; `ℤ` on `(ℤ×𝔸¹) ⊔ 𝔸¹` | swap sends `uv ↦ −uv`; weights `2,0,−2`, `N` = weight 0; `B𝔾_m`; `Spec ℚ`, `N = ℚ·∂_t` | consistent |
| Worked example (0-dimensional DM) | `Bℤ/K` | finite type, DM, `G_x = ℤ` not finite | diagonal hypothesis needed |

## Dependency check

```
depcheck: 234 roadmaps, 2229 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The roadmap is line 37 of `merge-order/ORDER.txt`, directly
after AlgebraicModuliForArithmeticGeometry; SchemeAndStackFoundations, ReductiveGroups and
AlgebraicModuliForArithmeticGeometry are on main.

## Verified sound

- **Suggested.lean** (57 lines, 0 declarations): the docstring names nine headline theorems as
  not statable. Confirmed at the pins: `TauCeti/AlgebraicGeometry/Stack/Basic.lean:37` is a bare
  pseudofunctor type, and no algebraic-stack predicate, 2-fibre product of stacks, inertia or
  `|𝒳|` exists in the pinned Tau Ceti or Mathlib. No headline is statable; nothing is padding;
  no stand-in. `import Mathlib` only; no `set_option`. Signatures were not elaborated: there is
  no named declaration.
- **Targets read:** all 38 sections 0.1–7.4, every Convention, every supplier contract, the
  worked examples and references (2085 lines).
- **Locators verified against the cached texts:** 87. stacks-06RD/06QB: Lemmas 101.4.15–16,
  101.5.6–7, 101.17.4–5, 101.17.8, 101.18.1–7, Section 101.19, 101.28.1–2, 101.28.6–15, 101.29.1–2,
  101.31.1–3, 101.33.7, 101.35.4, 101.48.1–5, 101.50.1–3, 101.51.1–4. stacks-04XE/06ML: 100.4.2,
  100.7.1, 100.11.5–9, 100.11.14, the list at lines 142–206 (items 1, 2, 31).
  stacks-decent-spaces: 68.6.1–2, 68.10.2, 68.11.2, 68.13.5–7, 68.13.9–11.
  stacks-sheaves-on-stacks: 96.14.3, 96.15.1. stacks-artin: 98.5.2. ahr2020 lines 39–43, 55–60,
  248–252, 475–486. rydh2011 lines 1236–1245, 1268–1277. alper-moduli lines 6234–6236,
  6955–6965, 6983–6987, 6996–6999, 7017–7024, 16528–16549. sga3-vi-a lines 871–894. All agree
  with the README's statements and hypotheses.
- **Pinned declarations:** 27 Mathlib and 17 Tau Ceti declarations opened at the cited file and
  line at commits `1b1ccf4` and `2fd255d`; all present at the stated lines.
- **Sibling citations checked:** 59 names and sections. SchemeAndStackFoundations (main) §§1.2,
  1.7–1.9, 1.12–1.23, 4.8, 4.12, 4.13 with every backticked name of README:299–334 (the nine
  leads of `citations.md` are README-level names of that roadmap and all exist there);
  AlgebraicModuliForArithmeticGeometry (main) §4.1, §8.1, §8.3 with all eleven names, and the
  direction of the reframing `α ↦ α ∘ g` (its line 9739) against Convention 5; ReductiveGroups
  (main) Layers 1, 3, 3A; downstream sections VirtualFundamentalClasses §1.2,
  MotivicStructuresInModuliOfCurves §§7.3, 8.4, 8.6 exist in the board's packages.
- **Gaps:** the 16 slugs of the README equal the 16 of `design/plan.json`, each with a named
  supplier and section. None asks for something SchemeAndStackFoundations,
  AlgebraicModuliForArithmeticGeometry or ReductiveGroups on main already states (searched each
  supplier for the Stacks lemma numbers and the objects: no hit). Every clause of every `needs`
  carries a locator.
- **Ownership:** no roadmap on main or at an open head defines monomorphisms, immersions or
  closed substacks of algebraic stacks, finite type points, decent stacks, residual gerbes, or
  the normal space at a point (object searches returned only consumers).
  FunctionFieldArithmeticPartII (open) asks SchemeAndStackFoundations for the zero-dimensional
  Deligne–Mumford statement that this roadmap's worked example proves; that is a correction for
  that roadmap, not this one.
- **Checks tested:** 142 Checks read in 38 Checks blocks, 61 recomputed (table above); none false, none vacuous;
  every definition has at least three.
- **Policy:** the pull request changes only `packages/StackPointsAndResidualGerbes/`; no
  pull-request numbers, process words, `lemma` or `set_option`; every target has a locator.
- **Wording:** 16 README passages set beside their sources (definitions 0.1, 1.1, 1.3, 2.1, 3.3,
  5.1; proof plans 2.6, 4.2, 5.2, 5.4; 7.2–7.4 against ahr2020 §3.1; 5.5 against rydh2011; 6.2
  against alper-moduli; the gap sentence against SGA 3). Longest run of shared consecutive words:
  8 ("which is invariant under ground field extension(s)", stacks-06RD line 1691), a hypothesis
  with one natural wording.
- **Arrangement:** Layers 1, 2, 4, 5 draw on Sections 18–19, 28–29, 31 and 48–51 of Morphisms of
  Stacks, but Layer 3 (Properties of Stacks §11) sits between them, Layer 4 mixes 101.18.7,
  101.31 and 101.51.4, and Layers 6–7 are not from it. Closest parallel: 0.1, 0.2, 0.3, 0.5 ↔
  Properties of Stacks §§7, 8, 9, 10; the order is forced by the *Needs:* lines (0.3 needs 0.1
  and 0.2; 0.5 needs 0.1 and 0.3) and 0.4 is the roadmap's own.

Source independence: 16 passages compared with 7 sources, none shared; largest share Morphisms of Algebraic Stacks (stacks-06RD and stacks-06QB), 56 of 164 locators; contents compared with stacks-06RD: independent.

## Not verifiable

- lmb2000 (Chapter 11, Définition 11.2) and olsson2016 (Chapter 11): settled as uncertified; the
  texts were not read. The README's description of the first rests on rydh2011 lines 1236–1245,
  which was read.
- ReductiveGroups Layer 3A's hypotheses (algebraically closed field, quasi-compactness), as
  described at README:465–469, were not compared line by line; 7.4 does not use that layer.
- The exact statements behind Stacks lemma numbers cited only inside gap sentences for chapters
  78, 79, 94 and 97 (Lemmas 78.25.1, 78.27.1–2, 79.9.4, 79.10.3, 94.16.1, 97.17.1–2, 97.18.3)
  were not opened; they are contracts for the supplier.
- Elaborated signatures: none exist.

## Source issues

- **Misprint** in stacks-06RD at Lemma 101.51.2, proof, second paragraph, printed page 102: the source, having reduced to a reduced stack called X with x generic, takes the dense open gerbe inside X′; it should be inside X; affects nothing.
- **Gap** in stacks-06RD at Lemma 101.51.2, proof, third paragraph, printed page 102: the source says the base of a locally Noetherian gerbe is locally Noetherian by fppf descent, details omitted; it should cite descent of local Noetherianity along the smooth surjective gerbe morphism (Lemma 101.33.8); affects the proof.
- **Gap** in stacks-06RD at Lemma 101.19.2, printed page 36: the source omits the proof; it should compare two representatives over a common field extension using the base-change formula for the automorphism group; affects the proof.

## For the human reviewers

- **Licence.** `alper-moduli` is an author's draft of lecture notes dated 5 January 2026, not a
  published text (`sources.toml`, id `alper-moduli`); ten locators cite it, each alongside or
  replaceable by a Stacks Project locator.
- **Licence.** `sga3-vi-a` is read in the editors' online compilation of 13 October 2024 of the
  SMF re-edition (`sources.toml`, id `sga3-vi-a`); two locators, both inside one gap sentence.
- **Manifest.** `sources.toml` keys one chapter twice (`stacks-04XE`/`stacks-06ML`, and
  `stacks-06QB`/`stacks-06RD`, same file hashes); whether the one-key rule applies to keys the
  manifest already settled is a manifest decision.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "389b5af7b1739f7d5ee4021b36d5be3d574ad73d", "job": "RT-StackPointsAndResidualGerbes~1b", "model": "fable", "worker": "chris-x79"} -->
