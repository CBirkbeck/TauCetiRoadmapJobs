<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16357#issuecomment-6898227048 -->
Review (claude) of a254c7c

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) Layers 2, 3 and 5 are said to depend on Layer 1, which none of their targets needs

   **Location:** `packages/StackPointsAndResidualGerbes/design/README.md:479`–480 ("Layers 0–3 are
   linear; Layer 4 uses 3; Layer 5 uses 3 and 4; Layer 6 uses 4 and 5"), line 1087 ("Layers 0–1"),
   line 1235 ("Layers 0–2"), line 1588 ("Layers 0–4").

   **Claim:** each layer's `### Dependencies` line and the build paragraph give the layers its targets
   need.

   **Witness:** the plan's prerequisites (equal to the *Needs* lines, by script) give direct layer
   edges 1→{0}, 2→{0}, 3→{0, 2}, 4→{0–3}, 5→{0, 2, 3, 4}, 6→{0–5}, 7→{0–4, 6}. No target of 2.1–2.6,
   3.1–3.5 or 5.1–5.5 names a 1.x target.

   **Exact repair:** line 1087 "Layer 0"; line 1235 "Layers 0 and 2"; line 1588 "Layers 0 and 2–4";
   lines 479–480: "Layers 1 and 2 each use Layer 0 only and are independent of each other; Layer 3 uses
   0 and 2; Layer 4 uses 0–3; Layer 5 uses 0 and 2–4; Layer 6 uses 0–5; Layer 7 uses 0.3, 0.4, 1.3,
   2.2, 2.3, 3.4, 4.5 and 6.4". Tested: these are the unions the script computes, and they follow the
   direct reading that line 1911 already uses for Layer 7 ("Layers 0–4 and 6", although 6.4 reaches
   Layer 5 through 6.3). An implementer of Layer 2 or 3 is then not blocked behind Layer 1.

2. **F02** (P3) Layer 7 drops the quasi-separatedness of its source without saying so

   **Location:** `packages/StackPointsAndResidualGerbes/design/README.md:1744`–1746 (the standing
   hypotheses of 7.2–7.4) and line 1867: "(ahr2020 lines 484–486, under the affine stabilisers of line
   476)".

   **Claim:** the locators of 7.2–7.4 carry the hypotheses of the source, apart from those the text
   names as not used.

   **Witness:** ahr2020 lines 475–476 take a quasi-separated stack with affine stabilisers; the README
   names the affine stabilisers only. 6.4 (line 1709) lists the source hypotheses it drops; Layer 7
   does not.

   **Exact repair:** add to the paragraph at 1744–1746: "ahr2020 §3.1 (lines 475–476) also assumes `𝒳`
   quasi-separated; no statement or route of this layer uses it"; in 7.4 write "under the
   quasi-separated stack with affine stabilisers of lines 475–476; quasi-separatedness is not used";
   the same in the plan's locator of 7.4. Add the instance as a Check of 7.4. Tested on the instance:
   the constant group `ℤ` over `ℚ` acting on `V = (⊔_ℤ Spec ℚ) ⊔ 𝔸¹_ℚ` by shift and by translation,
   `x` the point of index 0. `Stab = 1` is affine, the orbit `⊔_ℤ Spec ℚ` is closed,
   `[V/G] = Spec ℚ ⊔ 𝔸¹_ℚ/ℤ` is not quasi-separated, the image of `x` is closed, `𝒵_x = Spec ℚ =
   [G·x/G]` and `N_x = 0 = T_{V,x}/T_{G·x,x}` (`0/0` as vector spaces, `T_{V,x} = 0`). The statement
   holds outside the source's hypothesis, by the route given (4.5, 6.4 and 7.3 do not use it).

3. **F03** (P3) the FunctionFieldArithmeticPartII consumer line differs between README and plan

   **Location:** `packages/StackPointsAndResidualGerbes/design/README.md:1928` ("from 0.3, 0.5, 1.4,
   4.5 and 6.4") and the plan's `consumers` entry ("(0.5, 1.4, 4.5, 6.4)").

   **Claim:** both list the targets the worked example at lines 1943–1954 uses.

   **Witness:** the worked example cites "(0.3, 0.5)", "(3.3, 4.5)", "(6.4)" and "(1.4; …)": six
   targets. The README line lacks 3.3; the plan entry lacks 0.3 and 3.3.

   **Exact repair:** both read "0.3, 0.5, 1.4, 3.3, 4.5 and 6.4". Tested against the worked example: the
   six citations of its text are then exactly the six listed.

Three findings (R01–R03, all P3; no P1, no P2), each with a repair a fix round applies; an
acceptance lists no finding, so the verdict asks for changes. The 16 declared supplier gaps (listed
under "Supplier order and gaps") are contracts and raise nothing. All three round-9 findings are
repaired. I changed no design file and added nothing to
the manifest: every text I needed was in the cache. This lane does not elaborate Lean, and a design
has no `Suggested.lean`.

## Verified sound

### Round-9 findings, one by one

| Round-9 finding | Repaired passage (README line) | Status |
|---|---|---|
| F01 (P3) 0.1 needs the later 0.3 | 612–615: "an open substack `𝒰` of an algebraic stack `𝒳` with a smooth-local property `P` (0.1) has `P`: the open immersion `𝒰 → 𝒳` is smooth"; 617: "*Needs:* 0.1 (the open-substack bullet), 0.2"; 499–502: 0.1 no longer names 0.3; 1425: "(0.3's API, open substacks)" | repaired; plan: `target:0.3` gone from 0.1, `target:0.1` in 0.3; script finds no target whose prerequisites contain itself or a later target (38 targets) |
| F02 (P3) 7.4 for affine `G` only | 1863–1869: "for a smooth group scheme `G` over `k` … `x ∈ V(k)` with affine stabiliser `Stab_G(x)` (the standing hypothesis of this layer) whose orbit … is closed"; 1892–1898 the `E × 𝔾_m` Check; 455–456 the Layer 3A qualifier | repaired; plan hypotheses, statement and test `nonaffine_group` agree; ReductiveGroups Layer 3A on main (README lines 1685–1689) assumes `G` and `X` locally of finite type with quasi-compact underlying space, not affine, so the qualifier is the right one |
| F03 (P3) 3.5 Check at `G = 1` | 1223–1226: "For `G ≠ 1` and `BG → Spec k`, the induced `BG → Spec k` is not an isomorphism … For `G = 1`, `BG = Spec k` and the induced map is the identity" | repaired; plan tests `pointToBG` and `BG_to_point` both carry `G != 1` |

No finding of the repair report is marked "not actionable in this package". The repair's refusal to
drop gap:stack-morphism-permanence from 0.1 is right: 0.1's second API bullet composes an atlas
`V → 𝒴` with `𝒴 → 𝒳`, and SchemeAndStackFoundations §1.20 on main (README lines 3638–3684) defines
`SmoothLocal` with `SmoothLocal.atlas_independent` and states no composition or base change.

Repaired patterns looked for in the rest of the design: forward target edges (none, by script);
layer-level dependency statements (R01, the pattern of round 8's F02); statements narrower or wider
than their locator (R02); Checks on `BG` that fail at `G = 1` (0.2, 2.1, 3.2, 3.3, 3.5 carry
`G ≠ 1` or "nontrivial"; 2.2, 4.3, 5.5, 6.1, 6.2, 7.1, 7.2 hold at `G = 1`: `B1 = Spec k`, fppf image
of `Spec k̄ → Spec k` still not `Spec k`, `N = 0`).

### Adversarial pass (values computed in this round)

`X₁ = U/G` is Example 100.11.6; `X₀ = Spec ℚ(t)/ℤ`; `Bμ_p` is over a field of characteristic `p`.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 0.1 (sampled) | `Bμ_p`; `Spec k[x,y]/(xy)`; `[Spec k[t]/(t²)/𝔾_m]`; second bullet on `Spec k → B(ℤ/2)` | base change of `𝔾_m → Bμ_p` along `Spec 𝔽_p → Bμ_p` is the torsor `𝔾_m`, smooth, so `𝔾_m` is an atlas, regular; `μ_p = 𝔽_p[λ]/(λ−1)^p` nonreduced, flat not smooth; local ring at the node of dimension 1 with 2-dimensional cotangent space, reduced not regular; atlas `k[t]/(t²)` nonreduced; `Spec k` regular and composite atlas, so `B(ℤ/2)` regular | holds |
| 0.3 new bullet (sampled) | `Spec k ⊆ [𝔸¹/𝔾_m]`; `∅ ⊆ 𝒳`; closed `[Spec k[t]/(t²)/𝔾_m] ⊆ [𝔸¹/𝔾_m]` | atlas `𝔾_m ⊆ 𝔸¹` regular; empty atlas has every `P`; atlas `k[t]/(t²)` neither reduced nor regular | holds for open, fails for closed, as the Check says |
| 0.3 presentation correspondence | `[𝔸¹/𝔾_m]`; generic point of `𝔸¹` | invariant `{0}` ↔ `B𝔾_m`, `𝔾_m` ↔ `Spec k`; `{η}` has complement the closed points, not closed, so not locally closed | holds |
| 2.2 (sampled) | `BG`, trivial torsor; `[𝔸¹/𝔾_m]` with section `1`; `G = 1`; `S₃` over `ℝ`, nontrivial torsor | `Isom = G`, map the identity; `Isom(1,1) = 1`, `[Spec k/1]` has 1 point, the stack 2; a gerbe over `U` with trivial `Isom` is `U`; `H¹(ℝ, S₃)` = classes of elements of order ≤ 2 = 2 classes, the twist is by conjugation by a transposition, non-constant | holds; gerbe hypothesis needed |
| 2.3 (sampled) | `Bμ_p → Spec 𝔽_p`; `Spec k → B𝔾_m`; `[Spec 𝔽_p/μ_p]` in Lemma 101.33.7 | `U = Spec 𝔽_p`, `G = μ_p` flat finitely presented, smooth although `μ_p` is not; base change along itself is `𝔾_m → Spec k` with trivial inertia, `[U/G]` would force `G = 1` and `𝔾_m ≠ Spec k`; `X = Y`, `G` not smooth, quotient smooth | holds both ways |
| 2.5 (sampled) | `Spec k → B𝔾_m`; `Spec k → Spec k[ε]`; `Bℤ → Spec k` | `Δ` is the unit section `Spec k → 𝔾_m`, a closed point of a regular curve, not flat; homeomorphism, `k` has `ε`-torsion so not flat; `Δ_{Bℤ}` pulls back to `⊔_ℤ Spec k`, not quasi-compact, `Δ_{Spec k}` is | holds; only the stated direction of 101.28.14 |
| 3.1 (sampled) | `Bμ_p`; `Spec k[ε]`; `X₁` | `Spec 𝔽_p → Bμ_p` surjective flat finitely presented; `Spec k → Spec k[ε]` surjective not flat; ideal of `Spec ℚ̄ → U` generated by all `a ⊗ 1 − 1 ⊗ a`, not finitely generated (point not open in profinite `|U|`), flat since local rings are `ℚ̄` | holds; 100.11.2 and 100.11.3 do not collapse |
| 3.3 (sampled) | scheme point; `Spec k[ε]`; `Spec k → BG`, `G ≠ 1`; `[𝔸¹/𝔾_m]` | `Spec κ(x)`; `Spec k`; `Spec k ×_{BG} Spec k = G ≠ Spec k`, not a monomorphism; `B𝔾_m` and `Spec k` | holds |
| 3.5 (sampled) | `G = 1`, `ℤ/2`, `μ_p`; `Spec K → Spec k`, any `K/k`; identity of `Spec k` with representative over `K` | `Spec k` vs `Spec k`; 2 points vs 1; length `p` vs 1; `K` vs `K ⊗_k K`, isomorphic iff `K = k`; `K ⊗_k K` on both sides | holds; Check now excludes `G = 1` |
| 4.1 (sampled, headline) | generic point of `ℤ_(p)`; of `𝔸¹_k`; `X₁` | `ℚ = ℤ_(p)[1/p]` finite type, all three conditions hold; `k(t)` not finitely generated over `k[t]`, all fail though `Spec k(t)` is the residual gerbe; `Spec ℚ̄ → X₁` locally of finite type | holds |
| 4.4 (sampled) | `[𝔸¹/𝔾_m]` at `1`; DVR at `η`; `X₀` | `E = |𝔾_m|`; `u` must be closed in `𝔾_m` (the closure of its generic point contains `E`), `u = 1`, `R' = Stab = Spec k`, `[u/R'] = Spec k`; `E = {η}`, `R' = Spec K`; `R' = ⊔_ℤ Spec ℚ(t)`, `[u/R'] = X₀` | holds; the choice of `u` is used |
| 4.5 (headline) | `[𝔸¹/𝔾_m]`; DVR; `X₁` | `B𝔾_m` closed, `Spec k` open not closed; `Spec R/𝔪` closed, `Spec K` open; closed point, monomorphism not a closed immersion | holds; Noetherian hypothesis needed |
| 5.1 (sampled) | scheme; `X₀`; `B𝔾_m`; `X × BG`, `X` two copies of `Spec k[x₁, x₂, …]` glued along `⋃ D(xᵢ)`; `𝔸¹_ℚ/ℤ` | fibre empty or a point; `⊔_ℤ Spec ℚ(t)` over an affine, not quasi-compact; affine diagonal; `D(x_{i₁}) ∪ … ∪ D(x_{iₙ})` misses `(x_{i₁}, …, x_{iₙ})`, so only the first alternative of 101.48.3 applies; representable by spaces, not quasi-separated, not decent | holds |
| 5.3 (sampled, headline) | `t² + 1` on `𝔸¹_ℚ`; `[Spec ℂ/(ℤ/4)]`; `X₀` | `ℚ(i)`; `H¹(ℝ, ℤ/4) = Hom(ℤ/2, ℤ/4) = {0, 2}`, both ↦ 0 in `H¹(ℝ, ℤ/2)`, so no real object, `κ = ℝ`; one-point base not a field | holds; decency needed |
| 5.4 / 5.2 changed sentences | `[𝔸¹/𝔾_m]` at `1`; `Bμ_p` | `𝒰 = Spec k` open in `𝒳'`, reduced (0.3), `π = id`; `π : Bμ_p → Spec 𝔽_p` smooth surjective, `U` reduced | holds; both inputs cited |
| 6.2, 6.3 (headlines) | `BG`, trivial torsor, `G = ℤ/2`, `μ_p`, `1`; `(t, −1)` over `ℚ(t)` | three products: one point with automorphisms of order 2, one point, two points; third of length `p`; all `Spec k`; residue at `t = 0` is `−1 ∉ ℚ^{×2}`, `(t², −1)` split | holds |
| 6.4 (sampled, headline) | `Bμ_p` over `𝔽_p(t)`; `Spec κ`, `k/κ` finite nontrivial; origin of `Spec k[x₀, x₁, …]` | `𝒵_x = BG_x`, `G_x` not smooth; `p ∘ x ≠ id`, `𝒵 = Spec κ ≠ Spec k = BG_x`; closed immersion, ideal not finitely generated, `𝒵 = Spec k` | holds; `p` unrestricted, as Lemma 101.17.8 allows |
| 7.3 (sampled, headline) | `Bμ_p` (`p = 2` too), `Bα_p`, `B𝔾_m`, `[𝔸¹/𝔾_m]` at `0`, cusp | `(dim N, dim T, dim Lie − dim G)` = `(0,1,1)`, `(0,1,1)`, `(0,0,0)`, `(1,1,0)`, `(2,2,0)`; `dim T = dim N + dim T_{BG_x}` each time; `Bμ_p`: kernel of `k[ε]^×/p → k^×/p` is `{1 + aε} ≅ k`; `t` of weight `−1`, `∂_t` of weight `+1` | holds; Convention 5 confirmed |
| 7.4 (sampled) | `GLₙ` on `𝔸ⁿ`; `𝔾_m` on `𝔸¹` at `1`; `E × 𝔾_m` on `E × 𝔸¹`; `E` on `Spec k`; `ℤ` on `(⊔_ℤ Spec ℚ) ⊔ 𝔸¹_ℚ`; `ℤ` on `𝔸¹_ℚ` at `0` | `N₀ = kⁿ`; orbit not closed; `Stab = 𝔾_m`, `[V/G] = [𝔸¹/𝔾_m]`, `N = k·∂_t` of weight 1; `G_x = E` not affine, excluded; `[V/G]` not quasi-separated, `𝒵_x = Spec ℚ`, `N = 0` on both sides; orbit `ℤ` infinite, not closed, excluded | holds; R02 |
| Layer dependency lines | unions of plan prerequisites per layer | 1→{0}, 2→{0}, 3→{0,2}, 4→{0–3}, 5→{0,2,3,4}, 6→{0–5}, 7→{0–4,6} | R01 |
| Worked example (zero-dimensional DM) | `Bℤ`; `B(ℤ/2)` | one point, `G_x = ℤ` not finite; finite constant | diagonal hypothesis needed; R03 on its citation list |

Degenerate inputs: the empty stack has every smooth-local property and is a gerbe over the empty
space; `n = 0` gives `𝒳^{[0]}_𝒵 = 𝒵`; `G = 1` is recorded in 3.5 and 6.2. For the targets no repair
touched and outside the sample (0.2, 0.4, 0.5, 1.1–1.4, 2.1, 2.4, 2.6, 3.2, 3.4, 4.2, 4.3, 5.2, 5.5,
6.1, 7.1, 7.2) I read each statement and each Check in full and recomputed the Checks' values
(`𝔸¹/ℤ`: diagonal `⊔_n {y = x + n}` not quasi-compact, image dense without the generic point;
`[Spec k[ε]/𝔾_m]`: stabiliser `k[ε][λ^{±1}]/((λ−1)ε)` not flat; 4.2: `R' → U' ×_𝒳 U → U'` is a
monomorphism followed by a locally quasi-finite map; 5.5: `k/κ(x)` finitely generated field
extension is finite); none failed. Rows with values for 0.2, 2.1, 3.2, 5.4, 6.1 and 7.1 are in the
round-9 table and the text of those targets is unchanged.

### Sources: the seeded sample

All fifteen targets were read at their locators in this round; numbers, hypotheses and statements
agree. No author-flagged unverified locator remains.

| Target | Text read | Result |
|---|---|---|
| 0.1 | stacks-04XE lines 625–665 | agrees (Lemma 100.7.1, Definition 100.7.2, Remark 100.7.3 items (1), (5), (8)) |
| 0.3 | stacks-04XE lines 765–801, 853–894; stacks-06RD lines 3551–3556 | agrees; 100.9.6 and 100.9.10 have no proof there, as the README says; 101.35.4 proves étale by another argument, as "compare" says |
| 2.2 | stacks-06QB lines 2664–2672 | agrees (Lemma 101.28.6 (1)–(3)) |
| 2.3 | stacks-06QB lines 2696–2702, 2713–2716; stacks-06RD lines 3335–3340, 3350–3353 | agrees |
| 2.5 | stacks-06QB lines 2821–2826, 2862–2866, 2876–2880 | agrees |
| 3.1 | stacks-06ML lines 1135–1139, 1149–1156, 1178–1183 | agrees |
| 3.3 | stacks-06ML lines 1260–1275, 1288–1310 | agrees |
| 3.5 | stacks-06ML lines 1338–1368 | agrees; "for one representative" is the source's "there exists" |
| 4.1 | stacks-06RD lines 1609–1622, 1549–1578 | agrees; the "moreover" is the proof's construction |
| 4.4 | stacks-06RD lines 3096–3112 | agrees (the choice of `u`, `R'`, the reduced closure) |
| 5.1 | stacks-04XE lines 1453–1461; stacks-06RD lines 4686–4735 | agrees, both alternatives of 101.48.3 |
| 5.3 | stacks-decent-spaces lines 1225–1227, 1542–1546; alper-moduli lines 6962–6965, 16528–16537; rydh2011 lines 1268–1280 | agrees; the sources' hypotheses (Noetherian; quasi-compact diagonal) are named |
| 6.4 | stacks-06RD lines 1527–1528; alper-moduli lines 6993–7024; ahr2020 lines 476–478 | agrees; the dropped hypotheses of alper-moduli are named |
| 7.3 | ahr2020 lines 474–486 | agrees; R02 for the standing quasi-separatedness |
| 7.4 | ahr2020 lines 484–486, 475–476 | agrees ("a smooth group scheme"); R02 |

Also read: stacks-06QB lines 2893–2904, 2919–2923, 2943–2953; stacks-06RD lines 1675–1681,
3048–3062, 4786–4800, 4831–4845, 4866–4878; ahr2020 lines 248–252.

### Pinned declarations

Pins unchanged: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9` (`lake-manifest.json`). Reopened at file and
line: Mathlib `IsStack` (`CategoryTheory/Sites/Descent/IsStack.lean:49`), `fppfTopology`
(`AlgebraicGeometry/Sites/Fpqc.lean:54`), `residueField` (`ResidueField.lean:45`),
`isReduced_of_flat_of_isLocallyNoetherian` (`Geometrically/Reduced.lean:109`),
`iff_locallyOfFiniteType` (`Noetherian.lean:271`), the `DescendsAlong @Etale …` instance
(`Morphisms/LocalFlatDescent.lean:48`), `retractionKerCotangentToTensorEquivSection`
(`RingTheory/Smooth/Kaehler.lean:324`), `exists_lift` (`Smooth/Basic.lean:125`), `vanishingIdeal`
(`IdealSheaf/Basic.lean:564`), `jacobsonSpace` (`Morphisms/FiniteType.lean:112`),
`finite_of_finite_type_of_isJacobsonRing` (`Jacobson/Ring.lean:691`); Tau Ceti `SchPseudofunctor`
(`Stack/Basic.lean:37`), `IsRegular` (`Scheme/Regular/Scheme.lean:68`, extends
`IsLocallyNoetherian`), `IsRegular.of_smooth` (line 90), `of_flat_of_surjective`
(`Regular/Descent.lean:56`), `Smooth.geometricallyReduced`, `exists_isClosedImmersion_generalLinear`
(`Representation/Embedding.lean:212`), `smooth_iff_finrank_lie_eq_ringKrullDim`
(`Tangent/Regularity.lean:112`), `fppfHomogeneousQuotient` (`Homogeneous/Basic.lean:217`), the two
torsor theorems (`Torsor.lean:154, 160`), `linearlyReductiveAffineGroupSchemeProperty`, `Comodule`,
`IsAlgebraicSpace` (`AlgebraicSpace/Basic.lean:195`). 24 of 24 are there under the cited names; the
remaining 17 pairs were opened in round 9 at the same pins. Tau Ceti's `AlgebraicGeometry/Stack`
still holds `Basic.lean` only.

### Duplication, ownership and overlaps

SchemeAndStackFoundations on main: the 19 cited sections (§§1.2, 1.7–1.9, 1.12–1.23, 4.8, 4.12,
4.13) and 46 cited names resolve (script; §1.19 at line 3612, §1.20 at 3638, §1.21 at 3744, §1.22 at
3797). AlgebraicModuliForArithmeticGeometry at its open head: §4.1 (line 1863), §8.1 (9650), §8.3
(9726) and the 12 cited names (`relativeDescent` 1929, `framedTangent_exactSequence` 9788).
ReductiveGroups on main: Layers 1, 3, 3A (lines 1275, 1537, 1683). The nine Lean names and the one
citation the resolver could not find are these supplier names and the consumer line for the board
package VirtualFundamentalClasses.

Searches over main and the open heads for residual gerbes, decent stacks or spaces, closed
substacks, reduced induced structures, quasi-DM, finite type points, `IsGerbeOver` and the dense open
gerbe: users only (FunctionFieldArithmeticPartII, HeckeStacksAndLocalShtukas,
LanglandsParameterStacks §1.16, AlgebraicModuliForArithmeticGeometry, VirtualFundamentalClass line
444, and single mentions elsewhere); none defines one. SchemeAndStackFoundationsPartII, a new open
roadmap, is flat cohomology of group schemes and shares nothing; none of the 16 gaps is provided by
it. Overlap facts of `scratch/overlaps.md`: none dropped, none defined only by a revision, no
conflicting head, no second copy.

Overlap check: read SchemeAndStackFoundations (main), AlgebraicModuliForArithmeticGeometry,
GroupSchemesOverABase, VirtualFundamentalClass, FunctionFieldArithmeticPartII,
EquivariantIntersectionTheory and SchemeAndStackFoundationsPartII; nothing shared.

### Supplier order and gaps

    candidate: StackPointsAndResidualGerbes is not in the merge order yet; checked as if placed after AlgebraicModuliForArithmeticGeometry (the intake inserts it when its design is accepted)
    depcheck: 246 roadmaps, 2242 edges, 0 problem(s)

No UPWARD or CYCLE line. The 16 gap slugs are the same in the README (each with its "What … must
provide (gap:…)" sentence, by script) and in the plan, each with a named supplier and section:
stack-morphism-permanence, flat-lfp-open, inertia-of-presentations, stack-separation-axioms,
quasi-dm-flat-presentation, flat-groupoid-quotients, decent-algebraic-spaces,
decent-space-schematic-locus, reduced-scheme-residue-field-factorisation, group-spaces-over-fields,
quasi-finite-over-fields, isomorphism-fpqc-local-spaces, generic-flatness-spaces,
reduced-regular-smooth-local, algebraic-stacks-satisfy-rs, homogeneous-quotient-scheme. The clauses
the repairs lean on (composition of smooth morphisms, agreement of smoothness with
`RepresentableProperty`) are in the `needs` of stack-morphism-permanence and are not in §1.20 on
main. `gap:zero-dimensional-dm-residual-gerbes`, named in the consumer list, is
FunctionFieldArithmeticPartII's own.

### Shape, headlines, Lean

Eight layers, 38 targets, 138 Checks against 138 plan tests, at least three per target (script);
every target has a *Needs* line equal to its plan prerequisites in target numbers and gap slugs
(script) and locators; every layer has Examples and Dependencies (R01 for three of the latter). No
LaTeX delimiters, machine paths, pull-request numbers or process words. Layers are named by their
mathematics; no sentence says the roadmap follows a source. Headlines, from the Summary: finite type
points (1.1, 4.1), existence (4.2–4.4), the gerbe over the residue field with
`𝒵_x ×_{κ(x)} k ≃ BG_x` (5.3, 6.2, 6.3), rational points (6.4), closed points (4.5) and the
tangent–normal sequence (7.3). None is statable at the pins (no algebraic stack there). A design has
no `Suggested.lean`: no padding probe and no `#check` comparison were possible. Elaboration: not
available (this lane does not elaborate).

### Copyright and arrangement

Passages put beside their sources: the fifteen sampled statements and six more (0.3's new bullet
against stacks-06RD lines 3551–3556, a different argument; 3.1's proof sentence against stacks-06ML
lines 1154–1156; 4.3's first statement against stacks-06QB lines 2895–2904; 4.4's sketch against
stacks-06RD lines 3098–3112; 5.4's first statement against stacks-06RD lines 4790–4800; 7.2's
definition against ahr2020 lines 477–480). A word-level scan of the whole README against ten cached
texts finds no shared run above 12 words; the 12-word runs are the forced hypothesis list
"surjective, flat and locally of finite presentation" with its connectives, and the longest run
against ahr2020 and rydh2011 is 7. Arrangement: Chapter 101 is spread over Layers 1 (§§18–19), 2
(§§28, 29, 33), 3 (§§4, 28, 51), 4 (§§18, 28, 31, 51) and 5 (§§48, 50, 51), and Chapter 100's §11
(Layer 3) comes after them; Layers 6–7 are not from the Stacks Project. No run of layers maps one to
one onto a run of sections. Inside Layers 2 and 3 the order of the subsections is forced by the
*Needs* lines (2.2 needs 2.1; 2.3 needs 2.1–2.2; 2.4 needs 2.1–2.3; 2.5 needs 2.4; 3.2 needs 3.1;
3.3 needs 3.2; 3.4 needs 3.3; 3.5 needs 3.4). The manifest parses with 25 entries; every cited work
has a key; `rydh2015` is recorded and not cited (a remark, no change asked).

Source independence: 21 passages compared with 8 source texts, none shared; largest share
stacks-06RD, 28 of 124 "lines N" locators (46 with stacks-06QB, the same chapter); contents compared
with the section lists of Chapters 100 and 101: independent.

## Not verifiable

- `lmb2000` (Chapter 11, Définition 11.2) and `olsson2016` (Chapter 11): settled as uncertified,
  cited by locator only; not read.
- Lean elaboration: not available in this lane, and the design has no Lean file.
- MotivicStructuresInModuliOfCurves and VirtualFundamentalClasses have no open pull request; their
  consumer lines were checked against the board packages as this checkout holds them (the cited
  §§7.3, 8.4, 8.6 and §1.2 exist there).

## Source issues

- **Misprint** in stacks-06RD at Lemma 101.48.2, printed page 98: the proof has "on known" before "to be quasi-compact"; it should read "only known"; affects nothing.
- **Gap** in stacks-04XE at Lemma 100.9.6, printed page 17: no proof that an immersion is a homeomorphism onto a locally closed subset; it should use the presentation correspondence of Lemma 100.9.11; affects nothing.

## For the human reviewers

- **Licence.** `alper-moduli` is an author's draft of lecture notes (5 January 2026), not a published text; it is cited for seven line locators, each beside a Stacks Project or journal source.
- **Licence.** `sga3-vi-a` was read in the editor's online compilation of 13 October 2024 (author page), not the printed SMF volume; it supports one gap.
- **Ownership.** `packages/VirtualFundamentalClasses/README.md:508`–521 still defines closed substacks and the reduced induced structure that this design owns in 0.3–0.5, while this README (line 54) says it consumes them; only that package can change.
- **Ownership.** FunctionFieldArithmeticPartII (open head, README line 54) addresses gap:zero-dimensional-dm-residual-gerbes to SchemeAndStackFoundations, while this design's worked example proves it; which roadmap that gap names is that roadmap's to change.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "a254c7cff1461bf1f490357ec13e540626913a4e", "job": "REV-DESIGN-StackPointsAndResidualGerbes~10", "model": "fable", "worker": "chris-x30"} -->
