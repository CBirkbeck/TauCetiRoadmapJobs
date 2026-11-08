# Review of CountingBundlesAndHallAlgebrasOfCurves (pull request #1547 at fbebf39)

**Verdict:** needs changes

This is a full review of the folder at fbebf39, the head the previous review read; the folder has no changes since then. There are three findings, all P3. None blocks a human's approval on mathematical grounds, but each needs a small repair before acceptance.

## R01 (P3) — The ArtinAlgebras citations name paragraphs that the merged roadmap does not have

**Location:** `TauCetiRoadmap/CountingBundlesAndHallAlgebrasOfCurves/README.md:71`: “Layer 0, “Recognition”, “Uniqueness” and “Indecomposables”, supplies … Its “The radical in a Krull-Schmidt category” paragraph supplies the radical block description”. Also `README.md:327`: “*Needs:* … RepresentationTheory/ArtinAlgebras Layer 0, The radical in a Krull-Schmidt category”.

**Claim:** §§1.2–1.3 consume named paragraphs of RepresentationTheory/ArtinAlgebras Layer 0 as it is on main.

**Witness:** On main, ArtinAlgebras Layer 0 has §0.1 “Local endomorphism rings and indecomposables” (line 251), §0.3 “Uniqueness of decompositions” (313), §0.4 “Recognition over a commutative Artinian ring” (333) and §0.6 “The radical as a morphism ideal” (418). Running `git log -S "radical in a Krull"` on that README returns no commit. The title appears to have existed only at the open head that the gate round checked before the roadmap merged as e28fb09c.

**Exact repair:**
- At README:71, replace “Layer 0, “Recognition”, “Uniqueness” and “Indecomposables”” with “Layer 0, §0.1 (local endomorphism rings and indecomposables), §0.3 (uniqueness of decompositions) and §0.4 (recognition over a commutative Artinian ring)”.
- At README:71, replace “Its “The radical in a Krull-Schmidt category” paragraph supplies the radical block description:” with “Its §0.6, the radical as a morphism ideal, supplies the matrix description of the radical (a map between decompositions into objects with local endomorphism rings is radical exactly when no component is an isomorphism), hence the radical block description:”.
- At README:327, replace “RepresentationTheory/ArtinAlgebras Layer 0, The radical in a Krull-Schmidt category” with “RepresentationTheory/ArtinAlgebras §0.6”.

**Repair test:** Take the §1.3 Check, N=k[t]/t² and M=N² over 𝔽₂. By §0.6's criterion, an endomorphism of N² is radical exactly when each of its four entries N→N is a non-unit, that is, lies in tN. So rad End(M)=M₂(tN), of 𝔽₂-dimension 4, and End(M)/rad≅M₂(𝔽₂) has 16 elements. These are the Check's values, so the re-pointed section supplies exactly what §1.3 uses.

## R02 (P3) — `bundleDegree` restates the pinned rank-one degree without citing it

**Location:** `README.md:61` (“From Tau Ceti” lists `eulerCharBelow` and `InvertibleSheaf.trivial` only). `README.md:209–215` (§0.2 definition and API). `Suggested.lean:54–60`: “`Scheme.Modules.eulerCharBelow k X E.obj.obj 2 - (r : ℤ) * Scheme.Modules.eulerCharBelow k X (InvertibleSheaf.trivial X).obj 2`”.

**Claim:** Everything the pinned Tau Ceti already defines is cited by name and file, and the README states how its own carrier relates to it.

**Witness:**
- `InvertibleSheaf.eulerDegree` (`TauCeti/AlgebraicGeometry/LineBundle/Degree.lean`, line 70) is the formula χ₂(L.obj)−χ₂(O) with the same truncation.
- `InvertibleSheaf.fixedRankOneEquiv` (`VectorBundle/FixedRank.lean`, line 185) identifies invertible sheaves with `FixedRank X 1`, and `toInvertible_obj_obj` (line 166) holds by `rfl`.
- So at r=1, `bundleDegree` is `eulerDegree` up to `one_mul`. The README mentions neither name (0 grep hits). SchemeAndStackFoundations §3.3 on main already records this comparison as `vectorBundleDegree_rankOne`.

**Exact repair:**
- In “From Tau Ceti”, after the `eulerCharBelow` sentence, add: “`InvertibleSheaf.eulerDegree` in `TauCeti/AlgebraicGeometry/LineBundle/Degree.lean`, line 70, is the rank-one degree χ₂(L)−χ₂(O_X), and `InvertibleSheaf.fixedRankOneEquiv` in `TauCeti/AlgebraicGeometry/VectorBundle/FixedRank.lean`, line 185, identifies invertible sheaves with fixed-rank-one sheaves without changing the underlying sheaf.”
- Add the §0.2 interface bullet: “In rank one the degree is the pinned `InvertibleSheaf.eulerDegree` of the invertible sheaf corresponding to E under `InvertibleSheaf.fixedRankOneEquiv`.”

**Repair test:** For O(1) on P¹ both sides are χ₂(O(1))−χ₂(O)=2−1=1. The genus-two Check (O² has degree 0, and χ₂ alone would give −2) remains the test that separates the r-weighted formula from the rank-one one.

## R03 (P3) — The docstring names proof inputs as the missing carriers of Mellit's Laurent integrality

**Location:** `Suggested.lean:34–37`: “Mellit's Laurent integrality lacks the stable symmetric-function ring, its Hall pairing and modified Macdonald functions, and the plethystic logarithm on its rational coefficient series.”

**Claim:** For each headline that is not statable, the module docstring names the carrier its statement lacks at the pins.

**Witness:** README §10.3 (line 1375) states `H_{g,r}∈Z[q±1,z±1,α_1±1,…,α_g±1]`, where H_g=−(1−q)(1−z)Log Ω_g and Ω_g is the §10.1 product over Young-diagram cells (arm and leg are pinned). The stable ring Λ_R, the Hall pairing and the Macdonald functions enter only the proof, through the Macdonald contract at README:145–147. Neither pin defines a plethystic Exp/Log.

**Exact repair:** Replace lines 34–37 with: “Mellit's Laurent integrality lacks the plethystic logarithm, with Adams operations on q, z, the α_i and T, over the rational function field in which the partition kernel lives; the stable symmetric-function ring, its Hall pairing and modified Macdonald functions enter its proof, not its statement. The scalar degree-independence consequence is stated below; its universal coefficient-ring identification lacks curve specialization.”

**Repair test:** At g=1, q=2, α₁=−1, the one-box coefficient of −(1−q)(1−z)Log Ω₁ is (z+1)(1+2)=3(z+1), the README:1357 Check. Computing it uses only the cell product and the T¹ coefficient of Log. No symmetric function appears.

## Previous findings

- **R01 of PRREVIEW~4** (the plan's `reductive-character-git` needs sentence still mentions King's criterion): not repaired. The head is the one that review read, and `design/plan.json` is unchanged. It is not re-raised, for two reasons:
  - The brief lets the plan change after design only by adding gaps, so the requested edit is not permitted.
  - Among declared gaps, only an unowned, vague, already-provided or wrongly-supplied gap is a finding. Here the slugs agree (six in the plan, six in the README) and README:103 states the contract.

  The same reasoning covers a divergence PRREVIEW~4 missed. The plan's `macdonald-admissibility` sentence lacks README:145's carrier (Λ_R of SchurWeyl §7.5) and its explicit S-twisted pairing. So the earlier report's claim that the other five sentences agree word for word was wrong for that slug.
- **R02 of PRREVIEW~4** (the M20P manifest entry): repaired. `sources.toml` records `M20P` as certified, and README:21, 137, 1457 and 1585 cite it.

## Verified sound

### Gate, dependency check, elaboration, signatures, probes

- **Full gate (my own run):** every scanner is 0 and the result is OK.
  ```text
  gate CountingBundlesAndHallAlgebrasOfCurves: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```
- **Dependency check, verbatim:**
  ```text
  depcheck: 244 roadmaps, 2460 edges, 0 problem(s)
  ```
  There is no UPWARD, CYCLE or `moved:` line. This roadmap is ORDER line 360. Every non-main supplier comes earlier: AlgebraicModuli 36, SchemeKTheoryOperations 38, ComplexComparisonPartII 43, InverseGalois 48, EtaleCohomologyFoundations 57, HabiroCyclotomicCompletions 77, DeligneWeights 84, AutomorphicSpectralTheory 88, EtaleDuality 102, WeilConjectures 122, ArithmeticStatisticsPartVIII 142, EndoscopicTransfer 145, ClassicalGroupsPartII 200, QSeries 249, HabiroNahmSeries 335, FunctionFieldArithmetic 354, GlobalShtukas 356. TopologicalMirrorSymmetryForHitchinSystems (364) is a consumer only.
- **Outside the folder:** the diff against `origin/main` outside the folder is empty, and the worktree is clean.
- **Elaboration:** `lake env lean` on `Suggested.lean` exits 0 with exactly two warnings, the `sorry` warnings at lines 84 and 94.
- **Signatures:** I elaborated a scratch copy with `#check @` for all five declarations. Each type equals its README statement:
  - `bundleDegree`, `IsAbsolutelyIndecomposable` and `absIndecCount` keep `k [Field k] (X : Scheme) [X.Over (Spec k)]` and their own arguments.
  - `nilpotent_matrix_count` keeps `[Field K] [Finite K] (n : ℕ)`.
  - `absIndecCount_eq_of_degree` keeps `[Finite k] [IsProper] [SmoothOfRelativeDimension 1] [GeometricallyConnected] (r : ℕ) (d d' : ℤ)`.

  No binder is lost and nothing changed.
- **One-tactic probes:**
  - `nilpotent_matrix_count`: `simp` makes no progress. `exact?` returns only `nilpotent_matrix_count K n` itself, and grep finds no nilpotent-matrix count in Mathlib or Tau Ceti.
  - `absIndecCount_eq_of_degree`: `simp [absIndecCount]` leaves the two `Nat.card (Skeleton …)` sides, and `rfl` fails.

  Neither is padding, and neither restates a definition or a Check. I re-read the docstring's non-statable list against the README headlines (§§2.3, 2.7, 3.2, 4.7–4.9, 6.1, 6.3, 6.6, 7.3, 8.1, 8.3, 9.1–9.4, 10.3, 10.5, 11.2, 11.4, 11.5). Each one needs a carrier absent at the pins: Hall algebra, coherent HN groupoids, Higgs coarse moduli, compact étale cohomology, plethystic Log, K_g/R_g with specialization. I considered stating the coprime Higgs count through isomorphism classes of stable Higgs bundles. It would need a Higgs-bundle category and slope stability of subsheaves built from scratch, which is an ad hoc encoding, not a few simple definitions. R03 concerns only the reason the docstring gives.

### Library declarations opened at the pins (file:line equals the README's)

- **Mathlib:**
  - `Indecomposable`: `CategoryTheory/Limits/Shapes/BinaryBiproducts.lean:1096`. Body: ¬IsZero and every binary biproduct decomposition has a zero summand.
  - `Skeleton`: `Skeletal.lean:74`.
  - `ObjectProperty.FullSubcategory`: `ObjectProperty/FullSubcategory.lean:39`.
  - `Matrix.card_GL_field`: `GeneralLinearGroup/Card.lean:120`. Value ∏(qⁿ−qⁱ), which is 1 at n=0.
  - `IsArtinianRing.isNilpotent_jacobson_bot`: `Artinian/Ring.lean:54`, with `[Ring R] [IsArtinianRing R]`.
  - `isSemisimpleRing_iff_jacobson`: `Artinian/Module.lean:641`.
  - `Finite.isDomain_to_isField`: `LittleWedderburn.lean:176`.
  - `YoungDiagram`: `YoungDiagram.lean:66`. `transpose`: line 186.
- **Tau Ceti:**
  - `FiniteLocallyFreeSheaf.FixedRank`: `VectorBundle/FixedRank.lean:69`. `pullback`: line 104.
  - `Scheme.Modules.eulerCharBelow`: `Cohomology/EulerCharacteristic.lean:105`. It sums `finrank` with no finiteness hypothesis, so infinite-dimensional cohomology contributes junk 0, as README:61 says.
  - `InvertibleSheaf.trivial`: `LineBundle/Basic.lean:131`.
  - `YoungDiagram.armLength` and `legLength`: `HookLength/Basic.lean:136,140`. Both are natural-number subtractions, so cell membership must be retained.
  - `ClassFunction.characterPairing`: `CharacterTable/Pairing.lean:58`.
  - At the pins there are also finite-variable Schur and power-sum polynomials, but no stable ring Λ and no plethystic operations. That supports the docstring's Λ remarks for the proofs.

### Seeded sample: locators read in the source texts

| Target | Locator checked | What the text says (line) | Result |
|---|---|---|---|
| 0.1 | S16 §1.1 p.299; §1.4 pp.302–303 | T_g, W_g=S_g⋉S₂^g, K_g = localization at q^l−1 (S16 lines 97–109); ψ_l raises α_i, z, T to l-th powers; Exp/Log (S16 lines 223–247) | agrees; README's T_0=G_m repairs the literal g=0 case, where Q[T_0]=ℚ |
| 0.3 | S16 §1.4 p.303; Thm 1.6 p.304 | Res_{z=u} is the coefficient of (1−u⁻¹z)⁻¹ (S16 lines 284–290); iterated residues take z_n first (S16 lines 302–303); Thm 1.6 uses −∑ξ^{−d}Res(A dz/z) (S16 lines 380–385) | agrees |
| 1.9 | S16 Prop 2.1 p.308; MS14 Lem 4.1, Cor 4.2 p.8 | d>(g−1)r(r−1) puts indecomposables in Coh≥0; the proof splits gaps >2g−2 (S16 lines 565–573); MS14 bound binom(r,2)(2g−2) (MS14 lines 485–499) | agrees |
| 2.4 | S16 §3.1 p.312 | α_i=[Ker d_i] for the epimorphisms d_i; ∑iα_i=α; αs≠0 (S16 lines 820–834) | agrees |
| 2.7 | S16 Prop 3.1 pp.313–315 | d(α)=−{∑(i−1)⟨α_i,α_i⟩+∑_{i<j}i(α_i,α_j)}, d″=−∑_{i<j}⟨α_j,α_i⟩, d′=d−d″; (iv) cutoff square (S16 lines 891–920) | agrees |
| 4.3 | S16 Thm 4.2(iii) p.318 | both coproduct formulas, with E_0 shifts q^{(t−s)/2} and q^{−(t+s)/2} (S16 lines 1103–1113) | agrees |
| 4.6 | S16 §4.5 p.319; HN10 §1.3 p.3 | generated by 1^vec_{1,d} and 1_{0,d} (S16 lines 1165–1167; HN10 lines 109–121) | agrees |
| 4.7 | HN10 Thm 3.1 pp.5–8, Cor 3.5 p.8 | semistable characteristics, then every HN stratum, lie in U_X (HN10 lines 221, 378–380) | agrees |
| 4.8 | S16 Thm 4.4 pp.319–320; SV12 §1.11 p.13 | an R_g-Hopf algebra with pairing to K_g and specializations Ψ_X (S16 lines 1176–1191); a torsion-free integral form depending polynomially on α (SV12 lines 680–694) | agrees; README adds the v-descent obligation |
| 4.9 | S16 Cor 4.5–4.6 pp.320–321 | B^{≥0}, C^{≥0}, A^{≥0} in K_g; (4.8); Cor 4.6 via Prop 2.1 (S16 lines 1192–1249) | agrees |
| 5.1 | S16 §§5.1–5.2, Prop 5.3 p.325 | definitions of G and Y^* (S16 lines 1266–1281, 1400–1423); expansion regions (S16 lines 1545–1547) | agrees |
| 5.4 | S16 Lemma 5.4 pp.328–329 | localization at z_i−cz_j; Σ_γτ_γ(f_γ)=0 implies Σf_γ=0 (S16 lines 1720–1729) | agrees; the proof uses only that τ_γ is a module map fixing Laurent polynomials, so the README's monomial-order form holds |
| 7.2 | S16 §6.2 (6.1) p.337 | canonical Ext¹(V,W)*≃Hom(W,V⊗Ω) for coherent (V,W); a(ν)∈b(Ext¹(W,W)*) (S16 lines 2421–2430) | agrees |
| 9.2 | S16 Cor 1.5 pp.301–302; §6.10 pp.349–350; §6.11 p.352 | Weyl-invariant N[−z] image, unitary of degree 2D (S16 lines 197–203); multiplicities from the signed count (S16 lines 3017–3019); proof of Cor 1.5 (S16 lines 3092–3095) | README is correct where S16 is not: see the Source issues entry for Corollary 1.5 |
| 11.6 | S16 §8.1–8.3, Conj 8.2–8.4 pp.353–355 | the hoped A^{≥i}−A^{≥i+1} positivity (S16 lines 3149–3154); Conj 8.2 (3172–3175); Lie algebra and Conj 8.3–8.4 (3196–3221); the K-theory degeneration only expected (3238–3246) | agrees |

### Adversarial table (values computed on each side)

| Statement | Instances tried | Values computed / negative control | Result; change |
|---|---|---|---|
| 0.1 coefficient ring | g=0; g=1; ψ₂ at q=2 | R_0=ℚ[q±1] vs literal ℚ[T_0]=ℚ; a+q/a fixed, a not; ψ₂((q−1)⁻¹)=1/3 vs wrong (q−1)⁻²=1 | agrees; none |
| 0.3 residues | (1−z)⁻¹; (1−z)⁻²; pole −1 of (2+3z)/(1−z²) | rRes 1 / dRes −1; 0 / −1; rRes −1/2 / dRes +1/2 | agrees; none |
| 1.9 large degree | g=2,r=2; g=1; g=0 | worst profile d≤rμ_min+(g−1)r(r−1), bound 2, d=3 in range; g=1 gap 0 forces semistable; g=0 split separately; rank-one indicators 0,1,1 at d=−1,0,1 | agrees; none |
| 2.4 Jordan type | θ=0; size-2 block; k[t]/t² at x | α₁=[F]; r₂=1, rank 2 not 1; α₂=(0,1), α₁=0 | agrees; none |
| 2.7 fibre mass | s=1; α=(0,[O]) | d=0; d=−E([O],[O])=g−1, d″=0, mass 2^{g−1}; g=0 direct: Aut{[[1,b],[0,1]]}, mass 1/q | agrees; none |
| 4.3 coproduct | s=t=1, g=0; bundle form derived from E_r=E^vec_rE_0(q^{−r/2}z) | q^{−1/2}, arguments q^{±1/2}z; E_0 shifts q^{(t−s)/2}, q^{−r/2} | agrees; none |
| 4.6 spherical | P¹/𝔽₂, O² | (1^vec_{1,0})²(O²)=√2·3; torsion generator 1 on κ(x), 0 on O | agrees; none |
| 4.7 HN strata | P¹, class (2,0) | O², O(m)⊕O(−m) for m>0, infinitely many; ((1,0),(1,0)) inadmissible | agrees; none |
| 4.8 generic form | one-line mass, q=2,3 | P(1)/(q−1)→P(1), P(1)/2; denominator q−1 allowed in K_g | agrees; none |
| 4.9 counts | P¹/𝔽₂ ranks 0,1 | N₀=1+3z; [T]N: O(1) gives 1, three O⊕κ(x) give 2/2 each, total 1+4z=N₀/(1−z); dropping torsion gives 1 | agrees; none |
| 5.1 pairing series | s=1 | V₁/(1−zw) at w→0: V₁ for d≥0; −V₁/(1−zw) at w→∞: V₁ for d<0 | agrees; none |
| 5.4 separation | 1/(1−z) at 0 and at ∞ | Σ_{n≥0}zⁿ and −Σ_{n<0}zⁿ, each ×(1−z)=1; converse fails (sum δ(z)≠0 while f₁+f₂=0 for opposite signs) | agrees; none |
| 7.2 Higgs criterion | V=k², W=ke₁; [[1,1],[0,2]], [[1,0],[1,2]] | lower-left 0 preserves W, 1 does not; a is restriction to W, b is W⊗Ω↪V⊗Ω (Ω invertible) | agrees; none |
| 9.2 positivity | g=1,r=1; g=2,r=2,d=1 | A(−α)=1+α₁+α₂+q, degree 2=2D; D=5: one top monomial; W-invariance forces 4e=10, impossible | README's non-invariant representative is right; none |
| 11.6 conjectures | (ii) at i>d/r; (iv) closure | both slope counts are 0; supports in Coh≥0 closed under extension, so a subalgebra | agrees; none |
| `nilpotent_matrix_count` | n=0 (0·(0−1)=0 by truncated subtraction), n=1, n=2 over 𝔽₂, n=2 over 𝔽₃ | 1,1,4,9 = Qⁿ⁽ⁿ⁻¹⁾; GL: 1,1,6 | agrees; none |
| `absIndecCount_eq_of_degree` | r=0; P¹; E: y²+y=x³/𝔽₂ | 0 every d; P¹: 1 (r=1), 0 (r=2); E: A(1,d)=3; A(2,d)=P·bracket with bracket 9/3−3/12+(3/2)(−7/6)=1, so 3 in both parities | agrees; none |
| 6.4 rank two (supports the row above) | g=1 at (q,s)=(3,1) | P=3, U=25, V=5, S=1/3: 25/16−5/16−1/4=1 | agrees; none |
| 6.6 origin constants | g=2, r=2, by residues | [T²]Log has dRes 1+7/4−1/2−1/4=2 at z=1 and 1/4−1/4=0 at z=−1, giving 2 for both parities; formula g=2 | agrees; none |
| 8.2 slope zero | E/𝔽₂ rank 2 degree 0 | 12+8+6+4=30; 30−18−(4·9/3)/2=6=qA(2,0) | agrees; none |
| 9.4 cone trace | rank 1, g=1 | q(1−α⁻¹)(1−ᾱ⁻¹)=q−s+1=P; S16's q^{2D} gives qP; dim H²(E)=1, H¹=2 | README right, S16 misprinted; none |
| 10.1 kernel | g=1, q=2, α=−1, −2; real E | 3(z+1), 2(z+2), both 6 at z=1; real pair: 1+2=3 | agrees; R03 uses it |
| §0.2 `bundleDegree` (R02) | O(1) on P¹; O² genus 2; r=1 vs `eulerDegree` | 2−1=1; −2−2(−1)=0 (χ₂ alone −2); 1=1 | agrees; R02 adds the citation |
| §1.3 radical (R01) | N=k[t]/t², M=N² over 𝔽₂ | rad=M₂(tN), dim 4 (wrong 2); M₂(𝔽₂) has 16 elements; ArtinAlgebras §0.6 gives the same | agrees; R01 fixes the locator |

### Cross-roadmap citations resolved

- **Main:**
  - SchemeAndStackFoundations §§1.18–1.21, 2.6, 2.18, 2.20, 3.3 (`vectorBundleDegree`, `curve_serre_duality_ext_hom` for locally free U), 3.6, 3.7, 4.1, 4.5, 4.14.
  - ReductiveGroupsPartII §RG2.3.7 (line 5201).
  - RepresentationTheory/SchurWeyl §§7.3–7.6 (lines 696, 790, 824, 875).
  - RepresentationTheory/ArtinAlgebras: R01.
  - EtaleCohomologyFoundations, AlgebraicVectorBundles.
- **Open heads:**
  - EndoscopicTransfer §§3.6–3.7 (#999, lines 1239, 1273): any field; strong generation; (a); the open in Quot with N=χ(L₁⁻¹⊗V); [Q/GL_N].
  - AutomorphicSpectralTheory §6.22c, §6.24 (#925): the complex C(B,A), H²≅Hom_Higgs^∨, extension mass q^{rr′(2g−2)}; its Check 1,3,0 / q² matches README:115.
  - AlgebraicModuli §1.3, §4.19 (#853).
  - EtaleDuality §§0.4–0.7 (#1040).
  - GlobalShtukas §§0.1, 0.5, 0.6, 0.13 (#1490): the V_r, torsion and coherent formulas and q^{−rl} match README:85.
  - HabiroNahmSeries §5.1 (#1427): the L_n family with log F=−ΣL_n(q^ℓ)t^{ℓn}/(ℓ(1−q^ℓ)), so L_n=(q−1)[tⁿ]Log F.
  - QSeries §§2.4, 3.5 (#1391).
  - WeilConjectures Layer WC.1 §1.7 “Finite groupoid mass” (#1208).

### Declared gaps (six slugs, the same in plan and README, each with a supplier)

None asks for what is already provided:
- **coherent-ext-serre-duality:** §3.3 on main proves Ext–Hom duality only for finite locally free U, and the gap asks exactly for coherent U.
- **fixed-source-good-lines:** §3.7 gives the bounded chart and the semistable stack, but not the locally free open of the coherent carrier or the §3.6 comparison.
- **reductive-character-git:** the #853 head has no Hilbert–Mumford criterion or character GIT (grep: 0 hits). TensorProductCombinatorics excludes Hilbert–Mumford (its README line 117).
- **complete-adams-series:** §5.1 works over ℚ(q) only.
- **macdonald-admissibility:** no roadmap on main or at an open head mentions Macdonald functions.
- **affine-bundle-compact-shift:** §0.7 at #1040 is curve j_* duality, and no roadmap states the affine-bundle compact shift.

### Ownership against open pull requests

`overlaps.md` lists no pull request that changes this roadmap and no dropped id. The closest roadmaps:
- TopologicalMirrorSymmetryForHitchinSystems (#1814) imports §§7.1/7.3 and declares its own gap on this roadmap. It is a consumer and plans nothing of this roadmap's again.
- GlobalShtukas and EndoscopicTransfer are suppliers.
- FunctionFieldArithmeticPartII (#1831) owns no Hall, Higgs or indecomposable-count object.

No `Suggested.lean` name collides: the three definitions are local to this namespace.

## Not verifiable

- **M20** (Theorems 1.1 and 5.2, Proposition 3.1, Definition 5.1, Lemma 5.1, pp.302–321): settled uncertified, cited by locator only, not requested.
- **FH58** (Theorem 1, p.499): settled uncertified. The 𝔽₂ and 𝔽₃ enumeration row is independent evidence.
- **HES81** (Theorem 5.7): settled uncertified.
- No new text was needed, and `needs-references.toml` was not created.

## Source issues

- **Error** in S16 at Corollary 1.5, printed pp.301–302: the source says the count has a Weyl-invariant representative with nonnegative coefficients in −z; it should say a representative whose class is invariant on the paired cone (fails at g=2, r=2, d=1); affects a stated result.
- **Misprint** in S16 at Corollary 1.4(i), printed p.301: the source says the reciprocal cone count has prefactor q^(2D); it should be q^D; affects a stated result.
- **Misprint** in S16 at Corollary 1.4(ii), printed p.301: the source says component multiplicity is read in cohomological degree D; it should be degree 2D; affects a stated result.
- **Gap** in S16 at Theorem 7.1 and §7.2, printed pp.352–353: the source says parabolic counts lie in the unlocalized invariant ring by a proof parallel to Theorem 1.1; that proof gives only K_g; affects a stated result.
- **Misprint** in S16 at Lemma 2.4, equation (2.1), printed p.309: the source says a repeated indecomposable contributes n copies of its radical; it should be the full n-by-n matrix block over the radical; affects the proof.
- **Misprint** in S16 at §4.2, formula preceding (4.1), printed p.316: the source says the torsion correction is q^(−l/2) for every rank; it should be q^(−rl/2); affects a stated result.
- **Misprint** in S16 at §5.6, identity preceding (5.18), printed p.333: the source says the arm-zero prefactor is q^(−Σr_i²); it should be q^(−(g−1)Σr_i²); affects the proof.
- **Misprint** in S16 at Corollary 1.9, printed p.305: the source says the origin count is the positive Fourier sum of differential residues; it should be the negative sum with the displayed A⁰; affects a stated result.
- **Misprint** in S16 at §6.11, equations (6.11)–(6.12), printed p.351: the source says affine ranks D and b shift cohomological degree by D and b; it should be 2D and 2b; affects a stated result.
- **Misprint** in S16 at §6.11, Hitchin equivariance paragraph, printed p.351: the source says scaling gives weight one on the whole Hitchin base; it should be weight i on the i-th coefficient; affects the proof.
