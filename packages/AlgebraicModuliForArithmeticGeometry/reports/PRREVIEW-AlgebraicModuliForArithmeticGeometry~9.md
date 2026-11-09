# Review of AlgebraicModuliForArithmeticGeometry (pull request #853 at e5f9c4c)

**Verdict:** accepted

Incremental re-review of 2 changed lines since `b58cf53` (one line of `README.md` replaced, in §7.8; `Suggested.lean` and `metadata.toml` unchanged; nothing changed outside the folder). The change repairs the one finding of the previous review and introduces no new problem. The gate passes, the dependency check reports no problem and `Suggested.lean` elaborates with `sorry` as its only warning. No finding remains.

Locations are relative to `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/`. `stacks_artin` is the cache key under which this review read the Artin's Axioms chapter of the Stacks project.

## Previous findings

- R01 — repaired: `README.md:9564` now ends "(Stacks, Artin's Axioms, Lemma 12.7, pp. 20–21, Lemmas 13.3–13.8, pp. 22–24, Proposition 16.1, Lemma 17.1 and Proposition 17.2, pp. 26–28.)"

## Verified sound

**The changed passage against the source.** The diff replaces "Propositions 16.1 and 17.1–17.2" by "Proposition 16.1, Lemma 17.1 and Proposition 17.2" and touches nothing else in the paragraph. Read at the locator in `stacks_artin`:

- line 1178 (page 26): Proposition 16.1 (tag 07Y1), the algebraic-space criterion for a functor with diagonal representable by algebraic spaces;
- line 1221 (page 27): Lemma 17.1 (tag 07Y4), the algebraic-stack criterion for a category fibred in groupoids with diagonal representable by algebraic spaces; line 77 of the chapter's introduction also calls it "Lemma 17.1";
- line 1249 (page 27, proof on page 28 from line 1260): Proposition 17.2 (tag 07Y5), the criterion assuming only that the diagonal of the diagonal is representable, with axioms [-1]–[5] and the G-ring condition at finite-type points;
- the page markers at lines 1165, 1212, 1258 put the three statements on pages 26–28, as cited.

The unchanged part of the locator (Lemma 12.7 at line 918, page 20; Lemmas 13.3–13.8 at lines 1017–1069, pages 22–23) was re-read and is as the previous review recorded. The three results match the three cases the sentence before the locator distinguishes (space with represented diagonal; stack with represented diagonal; stack with the weak-diagonal criterion), so the locator supports the paragraph as written.

**Nothing else cites the changed text.** `grep` over `README.md` and `Suggested.lean` for "Proposition 17", "Lemma 17", "Propositions 16" and "Propositions 17" finds no other mention of these Stacks results (the only other hit, `README.md:1170`, is Lemma 17.10.4 of a different chapter, tag 01BG). `effectiveHull_smoothChart` is a README target only; it is not declared in `Suggested.lean`, and the module docstring already names Artin's criteria as not statable. No section number, supplier or Lean statement depends on the changed words.

**Seeded sample.** None of the fifteen sampled targets (§§3.2, 4.1, 4.6, 4.18a, 4.20, 4.24, 5.4, 7.1a, 7.5, 7.6.1, 7.6.2, 7.6.3, 7.6a, 8.3, 9.1) falls in the changed passage, so by the incremental rule none was re-opened; the README flags no locator as unverified.

**Head, gate, diff.** The worktree is at `e5f9c4c7b4ed6c861c956af6459053f84e9ad679`, clean. `git diff --stat b58cf53 HEAD` is one file, one insertion, one deletion (`README.md`). `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry'` is empty. The folder holds `README.md` (10477 lines), `Suggested.lean` (136 lines) and `metadata.toml`. The gate, run by this review and by the worker (whose run includes the targeted build, `build=0`), reports every counter zero and `OK`. No declared gaps (no readable `design/plan.json`).

**Dependency check (run by this review, with `--movable`):**

```text
depcheck: 236 roadmaps, 2266 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The change adds no supplier citation and no `*Needs:*` edge.

**Elaboration.** `lake env lean` on `Suggested.lean` at the pins Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9` (`lake-manifest.json:22`, `:10`, unchanged since the previous review) produced exactly five `sorry` warnings (lines 48, 73, 87, 119, 131) and nothing else. The file is byte-identical to the one the previous review probed, so its results stand: seven elaborated signatures with every README binder, no section binder lost, no one-tactic probe closing a headline, no padding. The 79 library names and the cross-roadmap citations resolved in the previous review are in text this change does not touch.

**Overlaps and ownership.** `scratch/overlaps.md` at this head lists no other pull request changing this roadmap, no cited id an open pull request drops, and none that only an open revision defines; the closest roadmaps in vocabulary (FunctionFieldArithmeticPartII, SchemeAndStackFoundations revisions, StableReductionPartII) are those the previous reviews compared. A locator label creates no new object, so the duplication audit of the previous review is unchanged.

**Headline inventory** (unchanged). Stated: Hilbert–Serre over Artinian coefficients (§1.5), coherent dévissage (§2.3), faithful flatness of commutative Hopf inclusions (§4.22), Artin approximation in pointed-étale and henselian forms (§6.1). The others are named in the module docstring as not statable, each with its missing carrier, as listed in the review at `b58cf53`.

**Adversarial table.** The first row is the statement whose passage the diff changes, with the values on both sides. The remaining rows are carried from the review at `b58cf53`, with the values computed there, for statements the diff leaves untouched. `Cₙ` is written additively; `D = k[ε]/ε²`.

| Statement | Instances | Values computed | Result; change |
| --- | --- | --- | --- |
| `effectiveHull_smoothChart` (§7.8, the changed locator) | point functor; `A¹_k→Spec k`; node `xy=0`; `BG`; the three criteria against the three cited results | hull `k`; `k[[t]]` has tangent kernel `k`, so it is versal but not a hull; hull `k[[x,y]]/(xy)`, tangent dimension 2; framed automorphisms `ker(G(A)→G(k))`, trivial at `A=k`. Source side: 16.1 is a Proposition about a functor `F` with `Δ` representable by algebraic spaces, concluding an algebraic space (`stacks_artin` line 1178, page 26); 17.1 is a Lemma about a category fibred in groupoids with `Δ` representable (line 1221, page 27); 17.2 is a Proposition assuming only `Δ_Δ` representable (line 1249, pages 27–28). README side: "space criterion … sheaf and a represented diagonal", "stack … represented diagonal", "weak-diagonal criterion" | Labels, numbers and pages agree with the source on all three; statement unchanged from the previous review; no change. |
| `hilbertSerre` (headline, §1.5) | `A=k`, `M=k[x,y]`; `A=D`, `M=D[x]`; `σ=∅`, `M=k`; `M=k[x](−3)` | lengths `d+1`, series `1/(1−T)²`, `P(d)=d+1`, degree `1<2`; lengths `2`, series `2/(1−T)`, `P=2`; `card σ=0`, series `·1=h`, `h=1`, `P=0` with degree `⊥<0`; `d₀=3`, numerator `h=1` after the shift, `P=1` | Agrees in each case; the Laurent shift is `d₀`; probe leaves goals. Carried from the review at b58cf53 (untouched); no change. |
| `cmRegularity`, `uniformQuotientRegularity` (§1.5) | `O(a)` on `P¹`; `O→O_Z`, `length Z=d`; `P⁰` | `O(a)` is `m`-regular iff `H¹(O(a+m−1))=0` iff `a+m≥0`; `O(−2)` not 1-regular (`−1<0`); kernel `O(−d)` needs `m₀≥d` while `O_Z` is `m`-regular for all `m`; on `P⁰` no higher cohomology | Checks true; the no-fixed-ambient remark is witnessed by `O(−d)⊕O(d)` with polynomial `2t+2` for every `d`. Carried from the review at b58cf53 (untouched); no change. |
| Nitsure's bound as restated | `m=m₀+h`, `h=h¹(F(m₀))` | `h¹(F(m₀+k))≤h−k`, so `H¹(F(m₀+h))=0` and `H¹(F(m₀+h−1))≤1`; `(m₀+h+1)`-regularity follows, `(m₀+h)`-regularity does not | README's `+1` is right; source off by one (*Source issues*). Carried from the review at b58cf53 (untouched); no change. |
| `hilbertPolynomial` Checks | `O_{P¹}(a)`; zero sheaf; `Spec k` | `χ(O(a+m))=a+m+1`, so `P(t)=t+a+1`; `0`; `1` | Carried from the review at b58cf53 (untouched); no change. |
| `gradedPiecesFinite` | `A[x₀,…,x_n]`, `d=2`, `n=1`; `d<0` | rank `binom(3,1)=3` (`x₀²,x₀x₁,x₁²`); `0` | Carried from the review at b58cf53 (untouched); no change. |
| 1.1a carriers | `E=0` on nonempty `T`; `E=L` invertible; `P(L)` | no epimorphism `0→line` on a nonempty scheme, `P(0)=∅`; `P(L)=S` by the identity quotient; universal quotient `π^*L→O(1)` is an isomorphism, so `O(1)=L` and the dual convention is excluded | Carried from the review at b58cf53 (untouched); no change. |
| `coherentDevissage` (headline, §2.3) | `X=∅`, `P≡false`; `Spec k`, `P`="even dimension"; `Spec k`, `P`="finite-dimensional" | (1),(2) vacuous and `P(0)` false, so `hzero` is needed and present; `G=k` has length 1 and `P(k)` false, so (2) fails as it must; all hypotheses hold and the conclusion is finiteness | Length one over `O_{X,ξ}` is `m_ξG_ξ=0` and `dim_{κ(ξ)}=1`. Carried from the review at b58cf53 (untouched); no change. |
| 2.1a `Spec k→Spec D` | tensor test | `(ε)≅k` as a `D`-module; `(ε)⊗_D k→D⊗_D k=k` sends `ε⊗1↦ε·1=0`, not injective, so not flat; closed immersion since `D→k` is surjective | Carried from the review at b58cf53 (untouched); no change. |
| `classifyingAbelianGerbe`, `rootO1Nonneutral` (§4.3) | `A=0`; `A=ℤ/3` on `Spec k̄`; `RootGerbe_n(O(1))` on `P¹_{k̄}`, `n=2`; `O(2)` | `B0` terminal; `H¹(k̄,ℤ/3)=0`, one class with automorphisms `ℤ/3`; `H²(P¹,μ_n)=Pic/n=ℤ/n` since `Br(P¹_{k̄})=0`, class `δ[O(1)]=1 mod 2≠0` and `n·deg M=1` impossible; `δ[O(2)]=0`, root `O(1)` | Carried from the review at b58cf53 (untouched); no change. |
| `injectiveBoundaryBijection`, `liftingGerbe` | `I` injective; `A=0`; classifying topos of `C₂`, `0→ℤ→ℤ→ℤ/2→0` | `H¹(I)=H²(I)=0` give `δ` bijective; `B→D` iso, lifting gerbe terminal; `H¹(C₂,ℤ)=0`, `H²(C₂,ℤ)=ℤ/2`, the regular torsor has `Hom(C₂,ℤ)=0` so no lift and nonzero boundary | Carried from the review at b58cf53 (untouched); no change. |
| `gerbeClass` boundary Check (§4.20) | `b₀₁=2, b₁₂=3, b₀₂=1`; `a`-shift | `2+3−1=4`; `(b₀₁+a₁−a₀)+(b₁₂+a₂−a₁)−(b₀₂+a₂−a₀)=4` | Carried from the review at b58cf53 (untouched); no change. |
| `neutralSelfEquivalences` | `BA`, `Φ=Q↦Q×ᴬP` | `P_Φ=Φ(A)=P`; `Φ∘Ψ↦P_Ψ×ᴬP_Φ=P_Φ×ᴬP_Ψ` (abelian); identity ↦ trivial torsor | Carried from the review at b58cf53 (untouched); no change. |
| 4.6a/4.8a counts | `B(C₃)`; terminal; `B(S₃)`; `B(C₃)⊔B(C₃)`; `B(S₃)⊔B(C₃)`; connected two-object `C₃` groupoid; chain `C₄→C₂→C₂` | centres `C₃` (3), `1`, `Z(S₃)=1`, `C₃×C₃` (9), `1×C₃` (3), `C₃` (3); restriction `1↦1`, `2↦0` not injective, section counts 4 and 2; a disjoint union of two chains has no terminal object | Carried from the review at b58cf53 (untouched); no change. |
| 4.14 `fibreIsomRestriction_id`, `_comp` | `f=id`; `g≫f` | `R(X,id,x,y)(p)=G.mapId_y ≫ p ≫ X(U)(F.mapId⁻¹_x)`, both unit comparisons retained; `R(X,g≫f)=G.mapComp_y ≫ R(X,g)∘R(X,f) ≫ X(W)(F.mapComp⁻¹_x)` | Formulas consistent with `restrictionIso_id`/`_comp` as stated. Carried from the review at b58cf53 (untouched); no change. |
| `fibreHomSectionAction_freeTransitive` | `H_X(t)=∅`; `p,q` given | vacuous (allowed by the statement); `a=b⁻¹(p⁻¹q)` unique by band injectivity | Carried from the review at b58cf53 (untouched); no change. |
| `hopfInclusion_faithfullyFlat` (headline, §4.22) | `k[t^p]⊂k[t]`, `p=2,3`; `k⊂k[t]/t^p`; `k[t²,t⁻²]⊂k[t,t⁻¹]`; `GL₂⊃B` | free with bases `{1,t}`, `{1,t,t²}`; free of rank `p`, `t` nilpotent; free on `{1,t}`, kernel `μ₂` even in characteristic 2; `GL₂/B=P¹` not affine, so normality is needed for `affineNormalQuotient` | Milne Theorem 6.43 is stated for arbitrary (commutative) Hopf algebras over a field. Carried from the review at b58cf53 (untouched); no change. |
| `polynomial_approximation`, `artinApproximation`, `HasArtinApproximation` (headlines, §6) | `ℚ[t]_(t)`, `z²=1+t`; `ℤ_(7)`, `ℤ₂`, `z²=2`; `A` complete; `B=A` | formal root `1+t/2−t²/8+…`, no root in `ℚ(t)` (odd valuation at `t+1`), so the predicate fails for the nonhenselian G-ring, as §6.0's Check says; `3²≡2 (7)`, squares mod 8 are `0,1,4`; `Â=A`, exact match at every `n`; `S=A`, `ι` canonical, `ψ=id` | Pointed form: `ι:S→Â` composed to `A/𝔪` is surjective with kernel a maximal ideal of residue field `A/𝔪`. Carried from the review at b58cf53 (untouched); no change. |
| `HasGeometricallyRegularFormalFibres` | `A` complete; `A=ℚ[t]_(t)` | fibres `κ(p)` for every `p`, regular; `κ(t)⊗Â=ℚ`, generic fibre `ℚ(t)⊗ℚ[[t]]=ℚ((t))`, regular | Carried from the review at b58cf53 (untouched); no change. |
| 7.1a subset functor | `Q[ε]⇉Q`, `Δ` vs whole pullback | both have projections `Q[ε]`; `(ε,0)` lies in the whole pullback only; `∅↦∅`, `{1}↦{1}` | RS* fails. Carried from the review at b58cf53 (untouched); no change. |
| `SpaceAnalytification`, `separated_nonarch_analytification` (§7.4) | `X=Spec K`; `Spec K[ε]`; scheme with `U⊔U` presentation; CT Example 3.1.1 | the analytic point; `ε≠0`, `ε²=0` in the analytic local ring; same quotient, overlap relation `U⊔U⊔U⊔U` of the two charts; the locally separated non-analytifiable space is excluded by the separatedness hypothesis | Hypotheses are CT Theorem 4.2.1's. Carried from the review at b58cf53 (untouched); no change. |
| `proper_space_gaga` | `h` the identity; `j>dim` | `F^an=F^an`; both sides zero | Carried from the review at b58cf53 (untouched); no change. |
| `relativePicardSheaf`, `sectionPicardSplit` (§7.6) | `X=B`, `f=id`; `P¹_B` with section `∞`; `T` with `Pic(T)≠0` | fppf-locally every line bundle is trivial, so the sheafification of `T↦Pic(T)` is `0`; `Pic(P¹_T)=Pic(T)⊕ℤ`, kernel of `σ_T^*` is `ℤ`, all degrees `d` retained; `Pic(T)→Pic(P¹_T)` injective, cokernel `ℤ`, split by `σ_T^*` | Carried from the review at b58cf53 (untouched); no change. |
| `polarisedIsomScheme` (§7.6.3) | `(P¹,O(1))`; `(E,O(p))` | every automorphism of `P¹` preserves the class `O(1)` (`Pic=ℤ`), so `PGL₂`; `φ^*O(p)=O(φ⁻¹p)≅O(p)` iff `φ(p)=p`, so `Aut(E,p)`, finite | Carried from the review at b58cf53 (untouched); no change. |
| `properSpaceCompletionEquivalence`, `stackFormalPointEquivalence` (§7.8) | `X=Spec A`; the zero sheaf; a jet mod `m²` | finite `A`-modules recovered from their adic towers, `Â=A`; `0↦0`; a jet is not a tower | Carried from the review at b58cf53 (untouched); no change. |
| `spaceSectionComponentCriterion` (§7.9) | zero group; `μ₂` in characteristic 2; `Spec k→Spec D` | smooth proper of dimension 0; `μ₂=Spec k[x]/(x−1)²` connected and nonreduced, so the smoothness hypothesis fails and the subfunctor is all of `μ₂`; fibres smooth points, not flat (`(ε)⊗k→k` zero) | Fibre smoothness does not give flatness, as separated in the statement. Carried from the review at b58cf53 (untouched); no change. |
| §9.1 Checks | `(x²,2)∼(x⁴,4)`; `(x²,y³)`, mark 2, chart `x=u,y=uv`; marks 2,3 to 6 | both become the unit ideal after dividing by the 2nd, resp. 4th, exceptional power; total transform `(u²,u³v³)=u²·(1,uv³)`, controlled transform unit, `u³` does not divide `u²`; `(x⁶,6)`, `(y⁶,6)` with cosupports `x=0`, `y=0` | Carried from the review at b58cf53 (untouched); no change. |
| §9.1a marked sum | `(I,a)+(J,b)` | ideal `I^b+J^a`, mark `ab` (order `≥ab` iff `ord I≥a` and `ord J≥b`) | Carried from the review at b58cf53 (untouched); no change. |
| `logDeRhamComplex` Checks (§9.10) | `A¹`, `D:x=0`; `k=ℚ[t]`, `X=Spec k`, `D=V(t)`; cuspidal base, `X=A¹_k` | `d(x^m)=m x^m dx/x`, zero when `p∣m`; `Ω¹(log D)=k·dlog t/(t·dlog t)≅k/(t)`, torsion, `I_D·Ω¹=0≠Ω¹⊗O(−D)`; local ring at `(u,v,x)` of dimension 2 and embedding dimension 3, not regular | Both exclusions are forced by the hypotheses stated. Carried from the review at b58cf53 (untouched); no change. |
| `compactBoundaryFrobeniusComparison` | `A¹`, `B=(x)`, `1≤j≤p−1`; `p=2` | `d(x^j)=j x^j dlog x`, `j` a unit, quotients acyclic; the two complexes differ in degree 0 by the class of `x`, twist `2B` not `B` | Carried from the review at b58cf53 (untouched); no change. |
| `compactBoundaryFrobeniusSplitting` Checks | `P¹`, `B=pt`; `A=pt` | graded pieces `O(−1)`, `Ω¹=O(−2)`: only `H¹(Ω¹)=k`, matching `H²_c(A¹)`; `Ω⁰=O`, `Ω¹(log pt)=O(−1)`: only `H⁰(O)=k`, matching `H⁰(A¹)` | Carried from the review at b58cf53 (untouched); no change. |
| `algebraicMultiplierIdeal` Checks | `(x²)`, `c=1/2`, `1/3`; `(xy)`, `c=1`; unit ideal | `⌊2c⌋·[0]`: `(x)`, `O`; identity principalization, `K_{Y/X}=0`, `J=(xy)`; `F=0`, `J=O_X` | Carried from the review at b58cf53 (untouched); no change. |
| `uniformAdjointVeryAmpleness` | `n=1` | `λ₁=max(1,binom(4,1)−2)=2`; Demailly (0.2 c) with nef `G` | Carried from the review at b58cf53 (untouched); no change. |
| `nefMixedIntersectionBound` (R05 repair) | `P¹×P¹`, `L=O(1,1)`, `H=O(1,0)`; `H=L`; telescoping | `H²=0≤(H·L)²/L²=1/2`; `2≤4/2`; `a_p/a_{p−1}` nonincreasing gives `a_p≤a_1^p/a_0^{p−1}=h^p/v^{p−1}`, Demailly's `(a_p)^{1/p}v^{1−1/p}≤h` | Locator now present. Carried from the review at b58cf53 (untouched); no change. |
| `resolutionCanonicalDegreeBound` | smooth hypersurface of degree `δ`, dimension `p` | `ω_Y=O_Y(δ−p−2)`, equality | Carried from the review at b58cf53 (untouched); no change. |
| `numericalVeryAmpleness` (§9.11) | `d=1`, `P¹`, `L=O(1)`, `w=−2`; `d=0`; `h⁰` bound | `m·1≥−2+3`, `m=1`, `h⁰=2≤1+1`; a point, exponent 1; nondegenerate degree `δ=m^d v≥N−d+1` gives `h⁰=N+1≤m^d v+d` | Carried from the review at b58cf53 (untouched); no change. |
| `smoothPolarizedBoundedness` | `n=1`, K3 with `L²=r` | `m` and `N` from the numerical theorem with `w=0`, degree `m²r`; Charles Lemma 3.5 (page 507) | Carried from the review at b58cf53 (untouched); no change. |
| `schemeRelativeTangentEquiv` (R03 repair) | `A¹_k` at 0, `R=k`, `A=k[x]_(x)`, `B=k`, `M=k` | `Derivation k A k ≃ {ψ:A→ₐ[k] k[ε] // fst∘ψ = evaluation at 0}`, `x↦aε`, one-dimensional, equal to `Hom(m/m²,k)` | The cited instantiation is the pin's statement. Carried from the review at b58cf53 (untouched); no change. |
| `rootGerbe` (R04 repair) | `L=O_X`; `(O_X,1)` root stack | `B_Xμ_n`; `X` (SSF §1.21) | Distinct objects, owner right. Carried from the review at b58cf53 (untouched); no change. |

## Not verifiable

Nothing in the changed passage. The items the review at `b58cf53` listed concern untouched text and stand as recorded there: Atiyah–Macdonald Theorem 11.1 (paywalled, cited by locator); Bierstone–Milman 1997 beyond Chapter I (paywalled; the supplier's sections on main carry the statements); Chow–van der Waerden 1937 §1 (image-only scan, no OCR on this worker); published paginations of Groechenig–Wyss–Ziegler, Milne and Romagny read in preprint or chapter files.

## Source issues

- none
