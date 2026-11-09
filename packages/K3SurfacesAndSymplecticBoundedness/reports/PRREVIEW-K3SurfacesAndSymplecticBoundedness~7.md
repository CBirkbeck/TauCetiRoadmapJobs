# Review of K3SurfacesAndSymplecticBoundedness (pull request #1375 at cee718f)

**Verdict:** accepted

This is an incremental re-review of the 149 lines changed since d795936, in one commit. In `Suggested.lean`:
- four Tau Ceti imports;
- the rewritten module-docstring list and three rewritten "not statable" bullets;
- `IsK3.projective`, now concluding `X.IsProjectiveOver k`;
- the new `quarticIdeal`, `isK3_quartic`, `IsK3.polarizedAut_finite` and `IsK3.cohomology_ample_subsingleton`.

In `README.md`:
- the `IsAmple` bullet of the Tau Ceti supplier block, and three new bullets (lines 65–68);
- the "How to read the build" paragraph (line 264);
- §1.3, §1.6, §5.3 and §7.4, with their *Needs:* lines and the new Checks;
- the Layer 1, 5 and 7 Dependencies lines (lines 385, 752, 1318).

Nothing outside the folder changed. The change applies the repairs that the previous report gave for R01–R03. This report has no findings. The checks behind that are listed below.

## Previous findings

- R01 — repaired: `Suggested.lean` lines 140–159 define `quarticIdeal` (`Ideal.span {F}` with its homogeneity proof) and state `isK3_quartic`. Bullet lines 34–37 now name only H²=4 as not statable. README §1.6 (line 363) names both declarations, and line 68 cites the carriers.
- R02 — repaired: lines 244–249 state `IsK3.polarizedAut_finite` and lines 296–301 state `IsK3.cohomology_ample_subsingleton`. Bullets 53–56 and 74–78 now say that both are stated. README §5.3 (line 718) and §7.4 (line 1241) name them, and line 67 cites `InvertibleSheaf`.
- R03 — repaired: line 130 concludes `X.IsProjectiveOver k` under `[X.Over (Spec (.of k))]`. README line 315 describes it as membership in Tau Ceti's `Scheme.IsProjectiveOver` and keeps the ample-class equivalence as a remark. The supplier block (line 66), the §1.3 *Needs:* line (line 321) and the Layer 1 Dependencies line (line 385) cite the class.

## Verified sound

**Gate, build and direction.**
- I reran the gate on this head. Every counter is 0 and it ends `OK`; the worker's run on the same head adds `build=0`.
- `lake env lean` on `Suggested.lean` gives 13 `declaration uses sorry` warnings and nothing else. They are at lines 115, 128, 151, 169, 184, 207, 216, 228, 244, 258, 270, 283 and 296.
- The dependency check with `--movable` prints `depcheck: 237 roadmaps, 2309 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- The manifest pins Mathlib `1b1ccf4b…` and Tau Ceti `2fd255d9…`.

**Elaborated signatures.** On a scratch copy I ran `#check @` for all 14 theorems and definitions (`quarticIdeal` included) and elaborated it once.
- Every type agrees with `signatures.md` and with its README sentence.
- `IsK3.projective` keeps its `Over` instance and its `IsK3` hypothesis.
- `isK3_quartic` keeps `hF` and `hs`.
- `polarizedAut_finite` keeps `ha`.
- `cohomology_ample_subsingleton` keeps `hL` and `hi`.
- No declaration lost a binder.
- The "Unknown identifier …`group`" line in `signatures.md` comes from the tool reading "class group" in the docstring at line 199. It is not a declaration.

**One-tactic probe (padding).** Each of these fails on the scratch copy, so none of the four new or changed theorems is padding:
- `infer_instance` and `simp_all` on `IsK3.projective`: no `IsProjectiveOver` instance; `simp_all` made no progress.
- `exact Set.toFinite _` on `polarizedAut_finite`: no `Finite` instance on the stabilizer.
- `infer_instance` on `cohomology_ample_subsingleton`: no `Subsingleton` instance.
- `simp [IsK3, hs]` on `isK3_quartic`: properness, geometric integrality, ω≅O, H¹(O)=0 and the polynomial remain as goals.

The same file confirms three facts:
- The structure morphism of the quartic is `Proj.toSpecCoeff` by `rfl`.
- The pinned instance makes the quartic proper.
- A scheme with `IsProjectiveOver k` is proper over k by instance, so the new conclusion of `IsK3.projective` also gives properness.

**Library declarations opened at Tau Ceti `2fd255d9`** (8 claims, all exact):
- `ProjectiveSpectrum/ProjectiveOver.lean` line 57: `class IsProjectiveOver`. It asks for a closed immersion over R into `Proj (TauCeti.SymmetricAlgebra.homogeneousSubmodule R M)` for a finite R-module M. Line 77 is the instance `IsProjectiveOver.isProper`. README line 66 describes both correctly.
- `ProjectiveSpectrum/PolynomialQuotient.lean` line 47 is the `Over` instance through `Proj.toSpecCoeff`, and line 57 proves properness, as README line 68 says. `Proj.toSpecCoeff` is declared in `ProjectiveSpectrum/BaseChange.lean` line 57, in namespace `AlgebraicGeometry.Proj`. The README names it correctly and does not claim another file.
- `RingTheory/GradedAlgebra/Homogeneous/Quotient.lean` line 102: `HomogeneousIdeal.quotientGrading`, in the root `HomogeneousIdeal` namespace.
- `ProjectiveSpectrum/TwistingSheaf/Basic.lean` line 254: `Proj.twistingSheaf`, whose sections are local fractions r/s with deg r = deg s + n (lines 85–86). So the global sections of O(1) contain the linear forms Xᵢ/1, and O(1) is the hyperplane sheaf, as README line 68 says.
- `LineBundle/Basic.lean` line 119: `InvertibleSheaf` is the full subcategory cut out by `SheafOfModules.isInvertible`. `LineBundle/Class.lean` line 58: `LineBundleClass.mk`.
- `Cohomology/Module/Base.lean` line 48: the k-module structure on cohomology comes from the `Over` instance. For the quartic this is `toSpecCoeff`, so the `finrank k` in `isK3_quartic` is the dimension over the coefficient field.
- `IntersectionNumber/Basic.lean` line 111: `intersectionNumber` pairs a class on X with a scheme C over k mapping to X. This confirms the §1.6 bullet's description that the pinned pairing is a line bundle with a curve.

**Sources at the changed passages** (the seeded target §7.4 is the only one inside the diff):
- **§7.4 (sampled).** rizov line 128 is the page-4 marker. Lines 142–145 give Theorem 1.2.2:
  - (a) is the Hilbert polynomial dt²+2 for ample L with d=(L,L)/2;
  - (b) is effectivity and Hⁱ(X,L)=0 for i>0.

  This is exactly what `cohomology_ample_subsingleton` and its docstring "Theorem 1.2.2(b), p.4" claim. terakawa line 183 gives Theorem 1.6 on cache page 7, printed p.191; its case (1) covers a K3, which is not of general type and not quasi-elliptic of Kodaira dimension one. The locator "pp.191–192, terakawa line 183" is exact.
- **§5.3.** huybrechts line 3349 is the p.91 marker. Lines 3372–3373 give Proposition 3.3: X a K3 surface over a field k, L ample, and the k-automorphisms f with f*L≅L form a finite group. Line 3400 is Remark 3.4. This matches the docstring of `polarizedAut_finite` and its hypotheses.
- **§1.3.** stacks-projective-morphisms lines 4153–4160 give Lemma 40.4 (01VT). Its (5)⇒(1) with d=1 gives the new clause "the hyperplane class of a closed immersion is ample". Lines 4764–4767 give Lemma 44.13 (0BCL): projective ⟺ quasi-projective and proper. huybrechts line 147 is Remark 1.2: every smooth complete surface is projective.
- **§1.6.** huybrechts lines 158–183 give Example 1.3(i) on p.8: H¹(O)=0 from the hypersurface sequence, ω≅O by adjunction, and that the Fermat quartic needs char k ≠ 2.

**Remarks on untouched text (no R-number, no change asked):**
- Example 1.3(i) states the K3 property only. The polynomial 2t²+2 comes from Riemann–Roch (2.5), huybrechts lines 316–318 on p.12, with H²=4. The route is the one the §1.6 sketch names ("Bézout gives H², then RR gives the polynomial"), through §1.4, which cites huybrechts line 316. The locator of the README statement at line 363 is unchanged from what earlier reviews passed. The new docstring of `isK3_quartic` repeats it. The author may add "(2.5), p.12" to both.
- The §1.6 Checks at lines 374 and 375 make the same point twice: the polynomial is even in t, and h⁰ pins the convention.
- §5.3's "so the set is the k-point group" also uses that Pic(X)→Pic_{X/k}(k) is injective. That holds because H⁰(X,O)=k for proper geometrically integral X: Hochschild–Serre gives 0→Pic(X)→Pic(X_kˢ)^G. The claim is true.

**Overlaps and ownership.**
- No open pull request changes this roadmap, and none drops an id it cites.
- The tool's lead "IntegralLattices Layer 6 defined only at #617/#1411/#1797" is false: main's IntegralLattices README has "## Layer 6: unimodular lattices in low rank" at line 2017.
- `roadmaps grep` finds no other roadmap that states these four objects:
  - a quartic hypersurface carrier (`quotientGrading`/`homogeneous_span` occur only here);
  - the K3 polarized automorphism finiteness: AbelianSchemesAndArithmeticModuli A6.18 is the abelian-variety analogue, a different object;
  - Rizov Theorem 1.2.2;
  - a use of `IsProjectiveOver` as a K3 headline.
- PurityForFlatCohomology `Suggested.lean` lines 262–284 build a hyperplane `LineBundleClass` on a general `Proj I.quotientGrading`. That declaration is not restated here.
- No roadmap's Lean imports this file. `IsK3.projective` is cited by no other roadmap, so changing its binder breaks no consumer.
- K3Surfaces moved to a23ff3aa. The three K3Surfaces names cited in untouched text are still declared at its `Suggested.lean` lines 61, 72 and 82. §0.2 (K0.A) is still the heading at line 265.

**Declared gaps.** The diff adds, removes and rewords no gap. The 23 declared gaps are unchanged and are not findings.

**Adversarial pass.** Rows for the changed statements carry values computed here. Rows for untouched statements carry forward PRREVIEW ~6, which carries ~5, ~4, ~3 and ~2.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `IsK3.projective` (§1.3) | Fermat quartic, char 3; A²_k; ℙ²_k; K3 over imperfect 𝔽_p(t) | Fermat: closed immersion into Proj(Sym k⁴)=ℙ³_k, so `IsProjectiveOver k` holds. A²: the trivial class is ample (quasi-affine), but A² is not proper, so not projective; `IsK3` fails (not proper), and the Check at line 326 is right that the ample-class equivalence needs properness. ℙ²: ω=O(−3)≇O, hypothesis fails. 𝔽_p(t): Huybrechts Remark 1.2 needs only a smooth complete surface. Probe `infer_instance` fails | true; not padding | none |
| `quarticIdeal` | Fermat F=Σxᵢ⁴; F=0; x₀⁴+x₁ | Fermat: `IsHomogeneous 4`, span is a proper homogeneous ideal. F=0: zero ideal, Proj=ℙ³. x₀⁴+x₁: not `IsHomogeneous 4` (monomial x₁ has degree 1), excluded by `hF`. A nonzero constant is homogeneous of degree 0 only, also excluded | real body, sound | none |
| `isK3_quartic` (§1.6) | χ(O_X(t))=C(t+3,3)−C(t−1,3) at t=−2,−1,0,1,2; F=0; F=x₀G; F=x₀⁴; char 2 Fermat; Fermat over ℂ | Values 10, 4, 2, 4, 10, against 2t²+2 = 10, 4, 2, 4, 10. Numerator (t³+6t²+11t+6)−(t³−6t²+11t−6)=12t²+12, divided by 6 gives 2t²+2. F=0: ℙ³, relative dimension 3, χ(O)=1≠2, `hs` fails (the Check at line 373). x₀G: singular along the plane ∩ cubic, `hs` fails. x₀⁴ and the char 2 Fermat (Σxᵢ)⁴: nonreduced, `hs` fails. Fermat over ℂ: smooth; H¹(O)↪H²(ℙ³,O(−4))=0; ω≅O(0). Nonzero F of degree 4 gives a nonempty surface, so `GeometricallyIntegral` is not met vacuously. Hⁱ=0 for i≥3 (dimension 2), so `range 3` is the full Euler characteristic | true | none |
| §1.6 convention Checks (lines 374–375) | O(1) vs O(−1) on a smooth quartic | h⁰(O_X(1))=h⁰(ℙ³,O(1))=4, since H⁰ and H¹ of O_{ℙ³}(−3) vanish. h⁰(O_X(−1))=0. χ(O_X(−1))=h²(O_X(−1))=h⁰(O_X(1))=4 by Serre duality with ω≅O. The polynomial is even and the dimensions are not, as both Checks say | true | none |
| `IsK3.polarizedAut_finite` (§5.3) | Fermat quartic over ℂ with O(1); trivial class on the Wehler surface; degree-2 double plane; non-closed k | Fermat: Aut(X,O(1)) = (μ₄⁴/μ₄)⋊S₄, of order 64·24=1536, finite. Trivial class: it is not ample on proper X; the set is all of Aut_ℂ(X), which contains σ₂σ₁ of trace 14, of infinite order (§5.4), as the Check at line 727 says. Double plane: the deck involution is a nonidentity point. Non-closed k: the stabilizer injects into Aut(X_k̄, L_k̄) | true | none |
| `IsK3.cohomology_ample_subsingleton` (§7.4, sampled) | L=O_X(1) on a quartic; L=O; L=O(−1); i=0; i=3; d=2 powers | O_X(1): H¹ ↪ H²(ℙ³,O(−3))=0, and H²=H⁰(O_X(−1))^∨=0. O: not ample, h²=1 (Check at line 1250). O(−1): not ample, h²=4. i=0: h⁰(L)=d+2≥3, excluded by `hi` (Check at line 1251). i=3: 0 by Grothendieck vanishing. d=2: h⁰(L^m)=2m²+2 = 4, 10, 20 for m=1, 2, 3 | true | none |
| Supplier block lines 65–68 | 8 file/line claims | All 8 exact, as opened above | sound | none |
| Docstring bullets (lines 34–37, 53–56, 74–78) | what is stated vs claimed missing | H²=4 needs a surface pairing of two classes; the pin pairs a class with a curve (line 111). The automorphism group scheme and the canonical-form action are absent. χ(L^t)=dt²+2 needs d=L²/2. Each stated part is named | sound | none |
| §1.3 equivalence sentence (line 315) | 01VT (5)⇒(1) and (1)⇒(5); 0BCL | ample ⇒ L^d=i*O(1) for an immersion, closed by properness (0BCL); a closed immersion's O(1) is ample (d=1) | sound | none |
| All other rows (`IsK3`, `isK3_fieldExtension_iff`, `noVectorFields`, `hodgeNumbers`, `picardGroup_finiteFree`, `picardRank_bounds`, `boundedPicardDescent`, `wildPrime_le_eleven`, `picardFaithful_of_rank22`, `finiteSubgroup_card_le`, §2.1a, §2.2, the untouched README targets and Checks) | as in PRREVIEW ~6 and the tables it carries | values as in those tables | sound | none |

**Headline coverage.** The headlines statable at the pins are now all stated:
- field-extension invariance; projectivity; the quartic; the vanishing and Hodge theorems;
- Picard freeness, rank bounds and descent;
- polarized finiteness, the wild-prime bound, rank-22 faithfulness and the finite-subgroup bound;
- ample vanishing.

The module docstring names each remaining headline with its missing carrier.

## Not verifiable

- `rudakov-shafarevich` §8 Proposition 3, `matsusaka-mumford` Theorem 2, `nygaard-vectorfields` Lemma 3.3, `shioda-transcendental` Proposition 5 and `arapura-chern` §7.5 are waived or uncertified, and the diff does not touch them.
- The other fourteen seeded targets fall outside the changed lines and were not re-read in this incremental pass.
- Ownership against open pull requests was checked through the overlaps tool, `roadmaps grep` for the four new objects, and the K3Surfaces head for the objects this diff touches.

## Source issues

- none
