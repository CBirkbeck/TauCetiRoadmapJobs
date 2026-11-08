# Review of EllipticKTheory (pull request #1489 at 4a5466c)

**Verdict:** accepted

:robot: AI review. This is an incremental re-review of the 47 changed lines of `TauCetiRoadmap/EllipticKTheory/` between `fbe4d25` and `4a5466c35b16b93212a2de72b9c7d614f118fdd6`. Both previous findings are repaired, and the repairs add no new defect. The gate, the dependency check, the targeted build and the direct elaboration all pass. This review has no findings.

## Previous findings

- R01 — repaired: Suggested.lean lines 20–27 now say the K₀ computation "cannot be stated". The reason given is that finite locally free modules are not shown to be closed under extensions in `X.Modules`, and `FiniteLocallyFreeSheaf X` is not shown to be essentially small, "so neither that exact structure nor its K₀ exists". The same diagnosis appears in README lines 274–280 and line 498.
- R02 — repaired: README lines 1501–1506 now read "Since `k′` is finite, `X_R` has only finitely many closed points of each degree … Choose `d = m · deg ∞` with `m ≥ 1` and `d ≥ g`; translation by `m[O(∞)]` is then a bijection".

## Verified sound

**Gate and direction.** I reran the gate on this head:

```text
gate EllipticKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The dependency check (`--movable`, against the merge order and main) printed:

```text
depcheck: 242 roadmaps, 2452 edges, 0 problem(s)
```

It printed no UPWARD, CYCLE or `moved:` line. The diff outside the folder is empty, and the worktree is clean.

**Build, signatures and padding.**
- `lake build TauCetiRoadmap.EllipticKTheory.Suggested` completes successfully (9059 jobs).
- `lake env lean` on Suggested.lean exits 0 in 16 s.
- Both print exactly six warnings, all `declaration uses sorry`, at lines 80, 147, 155, 165, 210 and 222.
- I elaborated a scratch copy with `#check @` for all 14 declarations. Every elaborated type matches the previous review's record except one, `card_twistedFrobeniusKernel`. Its binders are now `{k} [Field k] [Finite k] (W) [W.IsElliptic] [DecidableEq (AlgebraicClosure k)] {i} (1 ≤ i)`, with no `DecidableEq k`.
  - The statement does not need that binder. `twistedFrobeniusKernel` needs only `DecidableEq L`. Tau Ceti's `WeierstrassCurve.frobeniusTrace` (`TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean`, line 101) needs only `[Finite F]`.
- One-tactic probe on the changed theorem: `simp`, `rfl`, `norm_num`, `trivial` and `exact?` all fail, so it is not padding. The other five theorems are unchanged, and the previous review's 30 failing probes stand for them.

**The R01 repair, checked at the Tau Ceti pin `a91d3aa`.**
- `TauCeti.ExactK0` (`CategoryTheory/GrothendieckGroup/Exact.lean`, line 163) is defined under section variables that include `[EssentiallySmall.{w} C]`.
- `TauCeti.ExactK0.instCommRing` (`CategoryTheory/GrothendieckGroup/Monoidal/Exact.lean`, line 281) also needs `[BraidedCategory C]` and `[E.IsMonoidal]` (lines 276–277). The README asserts that these are needed, not that they suffice, so this is consistent.
- `TauCeti.ExactStructure.IsExtensionClosed` is at `CategoryTheory/Exact/ExtensionClosed.lean`, line 90. `fullSubcategory` (line 276) takes `hP : E.IsExtensionClosed P`.
- `TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf` is at `AlgebraicGeometry/VectorBundle/FiniteLocallyFree.lean`, line 103. The pins provide its `ContainsZero` (line 92) and finite-product closure (line 97).
- I searched both pins for `IsClosedUnderExtensions`, `IsExtensionClosed`, `EssentiallySmall` and `ShortExact` near `IsLocallyFree`/`isFiniteLocallyFree`. That covered Tau Ceti's `Algebra/Category/ModuleCat/Sheaf/{LocallyFree,FiniteLocallyFree,TensorProduct/FiniteLocallyFree}.lean`, and Mathlib's `AlgebraicGeometry` and `Algebra/Category/ModuleCat`. There is no extension closure and no essential smallness for sheaves of modules. The diagnosis is accurate.
- README Conventions (lines 186–188) do identify `K_n` with Quillen K-theory of vector bundles on the regular schemes used here, as the docstring says. The cross-references "README §2.7, Checks" and "Exact supplier contracts, From Tau Ceti" both resolve.

**The new §2.7 Check (README lines 888–892), recomputed.**
- For `E = E_W` over `F`, `Ext¹(O, O) = H¹(O_E) = F` is nonzero, so a non-split extension `F₂` exists.
- From the long exact sequence `0 → F → H⁰(F₂) → F →δ F` with `δ(1) = e ≠ 0`, `h⁰(F₂) = 1`. Continuing, `H¹(O) → H¹(F₂)` is zero, so `h¹(F₂) = 1` and `χ(F₂) = 0 = χ(O ⊕ O)`.
- `det F₂ = O ⊗ O = O`, so `d = 0`, and `O(P − O) = O` forces `P = O`. The coordinates are therefore `(2, 0, O)` for both classes, which agrees with the KTheoryLowDegrees §12.4 coordinates stated in §2.7.
- `h⁰` is additive on direct sums but not on extensions (1 ≠ 2), while `χ` is additive on both. So the split group separates `[F₂]` from `2[O]` and `K_0(E)` does not. The Check discriminates the wrong model, split K₀.

**The R02 repair, recomputed.**
- Riemann–Roch over `k′` gives `l(D) ≥ d + 1 − g ≥ 1` when `d ≥ g`.
- Over a finite `k′` there are finitely many closed points of each degree, hence finitely many effective divisors of each degree.
- Every closed point has degree at least 1 over `k′`, so `deg ∞ ≥ 1` and some multiple of it is at least `g`.
- See the table for the instances.

**README line 498.** The new sentence points to the From Tau Ceti paragraph, which carries the precise statement. The headline list and the list of simple definitions match Suggested.lean.

**Sources: the seeded sample, where the diff touches it.**
- §5.5 is the only sampled target that the diff changes. The changed text adds no locator: Riemann–Roch is cited as a standard fact.
- I re-read §5.5's primary locator in the now-cached report, quillen-oberwolfach lines 229–233 (p. 7, the second theorem). It treats the coordinate ring of a complete non-singular curve over a finite field minus one point, finite for `i > 0` and finitely generated for `i = 0`. This matches README lines 1480–1487.
- The remaining sampled targets lie outside the diff. They stand as verified at `fbe4d25` (PRREVIEW-EllipticKTheory_r4, the table under "Sources: the seeded sample").

**Citations, ownership and gaps.**
- The diff adds no cross-roadmap citation and no new object. Rerun on this head, `roadmaps resolve` reports no missing citation and no missing Lean name. The one lead in `citations.md`, `RegularProperModel.genericFibreInclusion`, is declared in Suggested.lean at line 123.
- `overlaps.md` lists no other open pull request changing this roadmap and no dropped or revision-only id. The closest roadmaps, K2SymbolsBrauer, KTheoryFiniteLocalFields, K3BlochGroups, ArithmeticKTheory and SchemeKTheoryOperations, are as reviewed at `fbe4d25`.
- The three declared gaps are unchanged. general-scheme-adams-pullback is at line 351, motivic-k-comparisons at line 356 and field-motivic-comparisons at line 440.

**Headline theorems.** The diff leaves them unchanged. Six are stated: `card_twistedFrobeniusKernel`, `exists_minimalRegularProperModel`, `locallyMinimal_terminal`, `minimal_unique`, `tame_last_point` and `blochCorrection`. The module docstring now names the right missing carrier for K₀ (scheme K₀ of vector bundles). It also names the missing carriers for the other headlines: higher K-groups, the motivic tower, étale cohomology and an excellence predicate.

**Adversarial table.** Rows marked "this review" were computed for this round. Rows marked "r4" are carried from PRREVIEW-EllipticKTheory_r4 for statements the diff leaves untouched, with that report's values. `E₋` is `y²+y=x³−x` and `E₊` is `y²+y=x³+x+1`, both over `𝔽₂`.

| Statement | Instance | Values computed | Result | Change | From |
|---|---|---|---|---|---|
| `card_twistedFrobeniusKernel` (binder dropped) | `y²=x³−x/𝔽₃`, i = 1, 2 | (0,0), (1,0), (2,0), O: `#E = 4`, `a = 0`; `1+27 = 28`, `1+3⁵ = 244`, both prime to 3 | whole kernel, matches §5.11 | none | this review |
| same | `E₋`, i = 1 | x = 0: y ∈ {0,1}; x = 1: y ∈ {0,1}; `#E = 5`, `a = −2`; `1+4+8 = 13` | matches | none | this review |
| same, elaborated type | `#check @` | binders `[Field k] [Finite k] … [DecidableEq (AlgebraicClosure k)]`; no `DecidableEq k`; build passes | same statement | none | this review |
| same | `E₊`, i = 1, 2 | `a = 2`; `1−4+8 = 5`, `1−8+32 = 25` | matches | none | r4 |
| same, i = 0 control | `y²+xy=x³+1/𝔽₂` | `#E = 4`, `a = −1`; `B₀` = odd part, order 1 | `1 ≤ i` needed | none | r4 |
| docstring and contracts, K₀ carrier | pinned `ExactK0`, `fullSubcategory`, `FiniteLocallyFreeSheaf` | `EssentiallySmall` in the `ExactK0` binders; `IsExtensionClosed` required at line 276; neither instance at the pins | correct missing carrier | none | this review |
| §2.7 new Check | Atiyah `F₂` on `E_W/F` | `h⁰(F₂) = 1`, `h⁰(O²) = 2`; `h¹(F₂) = 1`; `χ = 0` for both; coordinates `(2,0,O)` for both | split K₀ ≠ K₀ | none | this review |
| §5.5 `Pic⁰` finiteness | `ℙ¹_{𝔽₂}`, `∞ = V(t²+t+1)`, g = 0, d = 2 | 6 pairs of the 3 rational points + 1 = 7 = `#ℙ²(𝔽₂)`; forms x², y², xy, x(x+y), y(x+y), (x+y)², x²+xy+y²; 1 class | `Pic⁰ = 0`, `Pic(R) = ℤ/2` | none | this review |
| same | `E₋`, `∞ = O`, g = 1, d = m = 1 and d = m = 2 | d = 1: 5 rational points, `l(D) = 1`, so 5 classes. d = 2: `#E(𝔽₄) = 4+1−(a²−2q) = 5`, so no degree-2 points; `C(5,2)+5 = 15` divisors, 3 per class, 5 classes | `#Pic⁰ = 5 = #E(𝔽₂)` | none | this review |
| curveSteinbergHomology_fg contract | `𝔽₂[t,t⁻¹]` and `𝔽₃[t]`, rank 1 | `H₁ = ℤ`; `C₂`: `H₁ = C₂`, `H₂ = 0` | one point needed | none | r4 |
| curveFiniteGeneration, several points | `R₀ = 𝔽₂[t]`, `x₁ = (t)` | last map `1 − 1 = 0`; `K₁(R) ≅ ℤ` | holds | none | r4 |
| reciprocity sequence | `ℙ¹_{𝔽₂}` | `𝔽₂^× = 1`; `SK₁ = 1` | exact | none | r4 |
| §1.1–1.2 | `Y = Z = 0`; d = 3; cusp `y² = x³` | `X = 0`; genus 1, `χ = 0`; partial derivatives vanish at 0 | holds | none | r4 |
| §2.2 | `ℙ¹_{𝔽₄}/𝔽₂`; `O(n)`, n = −1, 0, 1 | `h⁰ = 2`, `χ = 2`; `χ = 0, 1, 2` | `χ = deg + χ(O)` | none | r4 |
| §2.7 | `y²=x³−x/𝔽₅`, P = (2,1) | λ = 3, 2P = (0,0), −P = (2,4) | `ℤ²⊕ℤ/4⊕ℤ/2`; `(0,0,P)` | none | r4 |
| §3.1–3.2 tame | `{t, t²+1}` on `ℙ¹_ℚ` | 1 at 0, i at `V(t²+1)`, 1 at ∞; N(i) = 1; swapped −i | convention fixed | none | r4 |
| §4.1, §4.3 | `ℙ¹_{𝔽₃}`; `ℙ¹_ℚ`, n = 3 | `SK₁ = C₂`; `K₃ = (ℤ/48)²` | holds | none | r4 |
| §5.8 | `y²=x³−x/𝔽₃`; q = 2, j = 2 | `3⁴/3 = 27`; eigenvalue sizes 4, `2√2`, 2 | `j ≥ 2` essential | none | r4 |
| §6.1–6.2 regularity | 37a1 at (5,18); 11a1 at (5,5) | `F = 222`, `F_y = 37`; `F = 0`, so `F ∈ m²` | regular; not regular | none | r4 |
| `exists_minimalRegularProperModel` | 37a1, S = ∅ | `I₁` at 37 irreducible, no (−1)-curve | minimal | none | r4 |
| `locallyMinimal_terminal` | M, `Bl_P M` | `Hom(M,M) = {id}`; `Hom(Bl,M) = {blow-down}` | holds | none | r4 |
| `minimal_unique` | involution `(x, −y−1)` | (0,0) ↦ (0,−1) | only id is marked | none | r4 |
| §6.9 | good fibres over 𝔽₂, 𝔽₃ | `K₁` orders 1, 4; ⊗ℚ = 0 | holds | none | r4 |
| §7.1 `tameValue` | `{−1, f}`, ord f = 1, 2; `{f, f}` | −1, 1; `(−1)^{a²} = (−1)^a` | sign needed | none | r4 |
| `tame_last_point` | 36a1 `{x−1, −1}`; 11a3 `{x,y}+{−1,x}` | value −1, norm 1; value at O is `y²/x³ → 1` | degree one needed | none | r4 |
| `blochCorrection` | 11a3, C = 5; c = 2, C = 3; C = 0 | `c_P = −1, −1, 1, 1`; `2³·2⁻³ = 1` vs 64; constants give 1 | holds | none | r4 |
| §7.3, §7.8 | u = 1/3 at 3; `y²=x³−2x` | `ord_η v = 1`; `1/x₀ = (1/4)(2x₀)` | holds | none | r4 |

## Not verifiable

- **bloch** (p. 514) and **young** (Lemma 3.1, Theorem 3.3) are settled as waived. **geisser-levine** and **grayson** are settled as uncertified. Their locators are cited as recorded, and no new request was made.
- I did not verify whether a published correction of Weibel V.3.11 (cited in §5.1) exists. §5.1 is outside the diff.
- The Quillen Oberwolfach report, which was not verifiable last round, is now recorded as `quillen-oberwolfach` in `packages/EllipticKTheory/sources.toml` and was read for this review.

## Source issues

This round found no new source mistakes. The seven issues recorded at `fbe4d25` stand as reported.

- none
